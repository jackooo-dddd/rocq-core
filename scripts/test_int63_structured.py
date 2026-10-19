#!/usr/bin/env python3
import pathlib,sys,os,json,subprocess,copy
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();O=pathlib.Path(sys.argv[2]).resolve();O.mkdir(parents=True,exist_ok=True)
os.environ['LEAN_NUM_THREADS']='4';os.environ['ROCQ2LEAN_LEAN_THREADS']='4'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
sys.path.insert(0,str(T/'tests'));from lib import structurally_rejected
fixture=T/'fixtures/corelib-int63-structured';cases=json.loads((fixture/'cases.json').read_text())
prefix='Corelib.Numbers.Cyclic.Int63.PrimInt63.';namespace='CoreStructured.Ops.'
ops=list(dict.fromkeys(c['op'] for c in cases))
roots=[prefix+n for n in ops]+[namespace+c['name'] for c in cases]
positive=O/'positive';checks={}
for label,args in [('export',['export','--mode','statement','--manifest',fixture/'source.json','--roots',','.join(roots),'--out',positive]),('translate',['translate','--input',positive/'source.ndjson','--out',positive]),('validate',['validate','--run',positive])]:
 with (O/(label+'.log')).open('w') as log:
  rc=subprocess.run([sys.executable,'-I',str(T/'tools/rocq2lean.py'),*map(str,args)],cwd=T,stdout=log,stderr=subprocess.STDOUT,timeout=900).returncode
 checks[label+'_exit']=rc;assert rc==0,(label,rc);print(label,'OK',flush=True)
report=json.loads((positive/'translation_report.json').read_text());states={r['name']:r['status'] for r in report['roots']}
assert set(states)==set(roots) and all(s=='TRANSLATED_AND_CHECKED' for s in states.values()),states
rows={r['name']:r for r in map(json.loads,(positive/'source.ndjson').read_text().splitlines()) if r.get('kind')=='constant'}
source=['import Rocq2LeanOut','set_option maxRecDepth 4096','set_option maxHeartbeats 2000000']
def primitive_refs(t):
 if isinstance(t,dict):return (t.get('k')=='const' and t.get('c') in [prefix+o for o in ops]) or any(primitive_refs(v) for v in t.values())
 if isinstance(t,list):return any(primitive_refs(v) for v in t)
 return False
for c in cases:
 body=rows[namespace+c['name']]['body'];assert body['k']=='app' and body['f']['k']=='construct' and not primitive_refs(body),body
 application=f"Rocq.{prefix}{c['op']} "+' '.join(f"(BitVec.ofNat 63 {a})" for a in c['args'])
 source.append(f"example : ({application}) = Rocq.{namespace}{c['name']} := rfl")
lean=positive/'lean';(lean/'StructuredChecks.lean').write_text('\n'.join(source)+'\n')
env=cli.lean_env();env['LEAN_PATH']=str(T/'.lake/build/lib/lean')+':'+str(lean)
with (O/'kernel-comparison.log').open('w') as log:
 rc=subprocess.run([str(pathlib.Path.home()/'.elan/bin/lean'),*cli.native_args(),'StructuredChecks.lean'],cwd=lean,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=600).returncode
assert rc==0,('kernel comparison',rc)
for tag in ['wrong-helper','swapped-carry-roles','wrong-pair-constructor','wrong-width']:
 rep=copy.deepcopy(report);root=prefix+('addc' if tag=='swapped-carry-roles' else 'mulc');row=next(r for r in rep['results'] if r['source']==root);v=row['target_value']
 if tag=='wrong-helper':v['f']['f']['f']['n']='Rocq2Lean.PrimInt63.diveucl'
 elif tag=='swapped-carry-roles':v['a'],v['f']['a']=v['f']['a'],v['a']
 elif tag=='wrong-pair-constructor':v['a']['f']['f']['n']='Rocq.Corelib.Numbers.Cyclic.Int63.CarryType.carry.C0'
 else:v['f']['f']['a']['v']=64
 assert structurally_rejected(positive,rep,'structured-'+tag,root),tag
 checks[tag]='STRUCTURALLY_REJECTED'
# Reject coherent wrong levels as well as an isolated constructor mismatch.
for tag in ["wrong-carry-zero", "wrong-carry-two", "wrong-constructor-universe"]:
 rep=copy.deepcopy(report);root=prefix+"addc"
 row=next(r for r in rep["results"] if r["source"]==root)
 carryrow=next(r for r in rep["results"] if r["source"].endswith("CarryType.carry"))
 expected=1 if carryrow.get("template_sort") else 0
 wrong=2 if tag=="wrong-carry-two" else (0 if expected==1 else 1)
 def change(t):
  if isinstance(t,dict):
   if t.get("k")=="const" and ".CarryType.carry" in t.get("n",""):
    if tag!="wrong-constructor-universe" or t["n"].endswith(".C0"):
     lev={"k":"zero"}
     for _ in range(wrong):lev={"k":"succ","l":lev}
     t["u"]=[lev]
   for v in t.values():change(v)
  elif isinstance(t,list):
   for v in t:change(v)
 change(row["target_value"])
 assert structurally_rejected(positive,rep,"structured-"+tag,root),tag
 checks[tag]="STRUCTURALLY_REJECTED"
original=[json.loads(l) for l in (positive/'source.ndjson').read_text().splitlines()]
for d in original:
 if d.get('name')==prefix+'addc':
  roles=d['native']['primitive_signature']['carry_constructors'];roles['C0'],roles['C1']=roles['C1'],roles['C0']
src=O/'wrong-source-roles.ndjson';src.write_text(''.join(json.dumps(r)+'\n' for r in original))
with (O/'wrong-source-roles.log').open('w') as log:
 rc=subprocess.run([sys.executable,'-I',str(T/'tools/roundtrip.py'),str(src),str(O/'wrong-source-roles'),'-Q',str(fixture),'CoreStructured','--','CoreStructured.Ops'],env=cli.opam_env(),stdout=log,stderr=subprocess.STDOUT,timeout=600).returncode
rep=json.loads((O/'wrong-source-roles/roundtrip.json').read_text())
assert rc!=0 and rep['status']=='EXPORT_VALIDATION_FAILED' and any('native metadata differs' in p for p in rep['problems']),rep
checks['wrong-source-roles']='SOURCE_REJECTED'
checks.update(status='PASS',source_kernel_vs_target_kernel_cases=len(cases),all_roots_checked=len(states),native_operations=ops)
(O/'result.json').write_text(json.dumps(checks,indent=2)+'\n');print(json.dumps(checks))

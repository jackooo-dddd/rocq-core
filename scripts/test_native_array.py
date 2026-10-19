#!/usr/bin/env python3
import pathlib,sys,os,json,subprocess,copy
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();O=pathlib.Path(sys.argv[2]).resolve();O.mkdir(parents=True,exist_ok=True)
os.environ['LEAN_NUM_THREADS']='4';os.environ['ROCQ2LEAN_LEAN_THREADS']='4'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
sys.path.insert(0,str(T/'tests'));from lib import structurally_rejected
fixture=T/'fixtures/corelib-native-array';cases=json.loads((fixture/'cases.json').read_text())
prefix='Corelib.Array.PrimArray.';namespace='CoreArray.Ops.'
roots=[prefix+n for n in ['array','make','get','set','length','default','copy','max_length']]
roots += [namespace+c['name'] for c in cases]+[namespace+n for n in ['read_poly','change_poly']]
positive=O/'positive';checks={}
for label,args in [('export',['export','--mode','statement','--manifest',fixture/'source.json','--roots',','.join(roots),'--out',positive]),('translate',['translate','--input',positive/'source.ndjson','--out',positive]),('validate',['validate','--run',positive])]:
 with (O/(label+'.log')).open('w') as log:
  rc=subprocess.run([sys.executable,'-I',str(T/'tools/rocq2lean.py'),*map(str,args)],cwd=T,stdout=log,stderr=subprocess.STDOUT,timeout=900).returncode
 checks[label+'_exit']=rc;assert rc==0,(label,rc);print(label,'OK',flush=True)
report=json.loads((positive/'translation_report.json').read_text());states={r['name']:r['status'] for r in report['roots']}
assert set(states)==set(roots) and all(s=='TRANSLATED_AND_CHECKED' for s in states.values()),states
rows={r['name']:r for r in map(json.loads,(positive/'source.ndjson').read_text().splitlines()) if r.get('kind')=='constant'}
source=['import Rocq2LeanOut','set_option maxRecDepth 4096','set_option maxHeartbeats 2000000']
for c in cases:
 n=rows[namespace+c['name']]['body'];assert n['k']=='int',n
 source.append(f"example : BitVec.toNat {c['target']} = {n['v']} := rfl")
# A client at an arbitrary universe can use the source wrappers directly.
source += ['universe u',
 'example (A : Type u) (a : Rocq.Corelib.Array.PrimArray.array A) (i : BitVec 63) : Rocq.CoreArray.Ops.read_poly A a i = Rocq.Corelib.Array.PrimArray.get A a i := rfl']
lean=positive/'lean';(lean/'NativeArrayChecks.lean').write_text('\n'.join(source)+'\n')
env=cli.lean_env();env['LEAN_PATH']=str(T/'.lake/build/lib/lean')+':'+str(lean)
with (O/'kernel-comparison.log').open('w') as log:
 rc=subprocess.run([str(pathlib.Path.home()/'.elan/bin/lean'),*cli.native_args(),'NativeArrayChecks.lean'],cwd=lean,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=600).returncode
assert rc==0,('kernel comparison',rc)
for tag in ['wrong-operation','wrong-universe']:
 rep=copy.deepcopy(report);row=next(r for r in rep['results'] if r['source']==prefix+'copy')
 if tag=='wrong-operation':row['target_value']['n']='Rocq2Lean.PrimArray.default'
 else:row['target_value']['u']=[{'k':'zero'}]
 assert structurally_rejected(positive,rep,'native-array-'+tag,prefix+'copy'),tag
 checks[tag]='STRUCTURALLY_REJECTED'
for tag,root in [('type-bound','array'),('operation-bound','make')]:
 original=[json.loads(l) for l in (positive/'source.ndjson').read_text().splitlines()]
 for d in original:
  if d.get('name')==prefix+root:
   meta=d['native'] if root=='array' else d['native']['primitive_signature'];meta['array_max_length']='4194304'
 src=O/(tag+'.ndjson');src.write_text(''.join(json.dumps(r)+'\n' for r in original))
 with (O/(tag+'.log')).open('w') as log:
  rc=subprocess.run([sys.executable,'-I',str(T/'tools/roundtrip.py'),str(src),str(O/tag),'-Q',str(fixture),'CoreArray','--','CoreArray.Ops'],env=cli.opam_env(),stdout=log,stderr=subprocess.STDOUT,timeout=600).returncode
 rep=json.loads((O/tag/'roundtrip.json').read_text())
 assert rc!=0 and rep['status']=='EXPORT_VALIDATION_FAILED' and any('native metadata differs' in p for p in rep['problems']),rep
 checks[tag]='SOURCE_REJECTED'
checks.update(status='PASS',source_kernel_vs_target_kernel_cases=len(cases),all_roots_checked=len(states),polymorphic_client='kernel_checked',bound=4194303)
(O/'result.json').write_text(json.dumps(checks,indent=2)+'\n');print(json.dumps(checks))

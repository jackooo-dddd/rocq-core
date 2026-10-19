#!/usr/bin/env python3
import pathlib,sys,os,json,subprocess,copy
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();O=pathlib.Path(sys.argv[2]).resolve();O.mkdir(parents=True,exist_ok=True)
os.environ['LEAN_NUM_THREADS']='4';os.environ['ROCQ2LEAN_LEAN_THREADS']='4'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
sys.path.insert(0,str(T/'tests'));from lib import structurally_rejected
fixture=T/'fixtures/corelib-native-float';cases=json.loads((fixture/'cases.json').read_text())
prefix='Corelib.Floats.PrimFloat.';namespace='CoreFloat.Ops.'
ops=list(dict.fromkeys(c['op'] for c in cases))
roots=[prefix+'float']+[prefix+n for n in ops]+[namespace+c['name'] for c in cases]
positive=O/'positive';checks={}
for label,args in [('export',['export','--mode','statement','--manifest',fixture/'source.json','--roots',','.join(roots),'--out',positive]),('translate',['translate','--input',positive/'source.ndjson','--out',positive]),('validate',['validate','--run',positive])]:
 with (O/(label+'.log')).open('w') as log:
  rc=subprocess.run([sys.executable,'-I',str(T/'tools/rocq2lean.py'),*map(str,args)],cwd=T,stdout=log,stderr=subprocess.STDOUT,timeout=1200).returncode
 checks[label+'_exit']=rc;assert rc==0,(label,rc);print(label,'OK',flush=True)
report=json.loads((positive/'translation_report.json').read_text());rootmap={r['requested']:r['name'] for r in report['roots']}
assert set(rootmap)==set(roots),rootmap
assert all(r['status']=='TRANSLATED_AND_CHECKED' for r in report['roots'])
results={r['source']:r for r in report['results']}
rows={r['name']:r for r in map(json.loads,(positive/'source.ndjson').read_text().splitlines()) if r.get('kind')=='constant'}
def leanName(n):return '.'.join(part if part.replace('_','').isalnum() else '«'+part+'»' for part in n.split('.'))
source=['import Rocq2LeanOut','set_option maxRecDepth 8192','set_option maxHeartbeats 4000000','set_option exponentiation.threshold 8192']
def primitive_refs(t):
 if isinstance(t,dict):return (t.get('k')=='const' and t.get('c') in [rootmap[prefix+o] for o in ops]) or any(primitive_refs(v) for v in t.values())
 if isinstance(t,list):return any(primitive_refs(v) for v in t)
 return False
for i,c in enumerate(cases):
 body=rows[namespace+c['name']]['body'];assert not primitive_refs(body),body
 args=[]
 for a in c['args']:
  if a['kind']=='int':args.append(f"(BitVec.ofNat 63 {a['value']})")
  else:args.append(f"(Rocq2Lean.PrimFloat.fromBits (BitVec.ofNat 64 {a['bits']}))")
 application=leanName(results[rootmap[prefix+c['op']]]['target'])+' '+' '.join(args)
 expected=leanName(results[namespace+c['name']]['target'])
 source.append(f"theorem case_{i} : ({application}) = {expected} := rfl")
lean=positive/'lean';(lean/'NativeFloatChecks.lean').write_text('\n'.join(source)+'\n')
env=cli.lean_env();env['LEAN_PATH']=str(T/'.lake/build/lib/lean')+':'+str(lean)
with (O/'kernel-comparison.log').open('w') as log:
 rc=subprocess.run([str(pathlib.Path.home()/'.elan/bin/lean'),*cli.native_args(),'NativeFloatChecks.lean'],cwd=lean,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=1200).returncode
assert rc==0,('kernel comparison',rc)
for tag in ['wrong-addition','ieee-vs-leibniz','signed-zero','classification-roles','comparison-roles','frexp-helper']:
 rep=copy.deepcopy(report)
 if tag=='signed-zero':
  root=next(n for n,d in rows.items() if n.startswith(namespace) and d['body'].get('k')=='float' and d['body'].get('v')=='-0x0p+0')
 else:root=rootmap[prefix+{'wrong-addition':'add','ieee-vs-leibniz':'Leibniz.eqb','classification-roles':'classify','comparison-roles':'compare','frexp-helper':'frshiftexp'}[tag]]
 row=next(r for r in rep['results'] if r['source']==root);v=row['target_value']
 if tag=='wrong-addition':v['n']='Rocq2Lean.PrimFloat.sub'
 elif tag=='ieee-vs-leibniz':v['b']['b']['a']['f']['f']['n']='Rocq2Lean.PrimFloat.eqb'
 elif tag=='signed-zero':v['a']['a']['v']=0
 elif tag in ['classification-roles','comparison-roles']:v['a'],v['f']['a']=v['f']['a'],v['a']
 else:v['f']['f']['n']='Rocq2Lean.PrimFloat.compare'
 assert structurally_rejected(positive,rep,'native-float-'+tag,root),tag
 checks[tag]='STRUCTURALLY_REJECTED'
for tag in ['wrong-native-type','wrong-source-classification']:
 original=[json.loads(l) for l in (positive/'source.ndjson').read_text().splitlines()]
 for d in original:
  if tag=='wrong-native-type' and d.get('name')==prefix+'float':d['native']['primitive_type']='int63'
  if tag=='wrong-source-classification' and d.get('name')==prefix+'classify':
   roles=d['native']['primitive_signature']['float_class_constructors'];roles['pn'],roles['nn']=roles['nn'],roles['pn']
 src=O/(tag+'.ndjson');src.write_text(''.join(json.dumps(r)+'\n' for r in original))
 with (O/(tag+'.log')).open('w') as log:
  rc=subprocess.run([sys.executable,'-I',str(T/'tools/roundtrip.py'),str(src),str(O/tag),'-Q',str(fixture),'CoreFloat','--','CoreFloat.Ops'],env=cli.opam_env(),stdout=log,stderr=subprocess.STDOUT,timeout=1200).returncode
 rep=json.loads((O/tag/'roundtrip.json').read_text())
 assert rc!=0 and rep['status']=='EXPORT_VALIDATION_FAILED' and any('native metadata differs' in p for p in rep['problems']),rep
 checks[tag]='SOURCE_REJECTED'
checks.update(status='PASS',source_kernel_vs_target_kernel_cases=len(cases),all_roots_checked=len(roots),native_operations=ops)
(O/'result.json').write_text(json.dumps(checks,indent=2)+'\n');print(json.dumps(checks))

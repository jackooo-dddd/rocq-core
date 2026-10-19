#!/usr/bin/env python3
import pathlib,sys,os,json,subprocess,copy
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();O=pathlib.Path(sys.argv[2]).resolve();O.mkdir(parents=True,exist_ok=True)
os.environ['LEAN_NUM_THREADS']='4';os.environ['ROCQ2LEAN_LEAN_THREADS']='4';sys.path.insert(0,str(T/'tools'));import rocq2lean as cli,audit
checks={}
def run(args,label):
 with (O/(label+'.log')).open('w') as f:
  return subprocess.run([sys.executable,'-I',str(T/'tools/rocq2lean.py'),*map(str,args)],cwd=T,stdout=f,stderr=subprocess.STDOUT,timeout=600).returncode
roots=['CoreInt.Literals.'+n for n in ['zero_lit','one_lit','high_lit','max_lit']]
positive=O/'positive'
for label,args in [('export',['export','--mode','statement','--manifest',R/'translator/fixtures/corelib-int-literals/source.json','--roots',','.join(roots),'--out',positive]),('translate',['translate','--input',positive/'source.ndjson','--out',positive]),('validate',['validate','--run',positive])]:
 rc=run(args,label);checks[label+'_exit']=rc;assert rc==0,(label,rc)
rep=json.loads((positive/'translation_report.json').read_text());checks['roots']={r['name']:r['status'] for r in rep['roots']}
assert all(v=='TRANSLATED_AND_CHECKED' for v in checks['roots'].values())
rows={r['name']:r for r in map(json.loads,(positive/'source.ndjson').read_text().splitlines()) if r.get('kind') in ('constant','inductive')}
integer=rows['Corelib.Numbers.Cyclic.Int63.PrimInt63.int'];assert integer['native']['primitive_type']=='int63'
checker=audit.Auditor(rows,{})
literal=rows[roots[-1]]['body'];target=next(r['target_value'] for r in rep['results'] if r['source']==roots[-1])
checker.check(literal,target,[])
for label,path,value in [('wrong-width',('f','a','v'),64),('wrong-value',('a','v'),0),('wrong-constructor',('f','f','n'),'BitVec.ofNatLT')]:
 bad=copy.deepcopy(target);node=bad
 for k in path[:-1]:node=node[k]
 node[path[-1]]=value
 try:checker.check(literal,bad,[])
 except audit.Mismatch:checks['reject_'+label]=True
 else:raise AssertionError(label)
# Fresh native binding check rejects falsely describing the integer type as another primitive.
bad=[json.loads(l) for l in (positive/'source.ndjson').read_text().splitlines()]
for r in bad:
 if r.get('name')==integer['name']:r['native']['primitive_type']='float64'
src=O/'wrong-registration.ndjson';src.write_text(''.join(json.dumps(r)+'\n' for r in bad))
with (O/'wrong-registration.log').open('w') as log:
 rc=subprocess.run([sys.executable,'-I',str(T/'tools/roundtrip.py'),str(src),str(O/'wrong-registration'),'-Q',str(R/'translator/fixtures/corelib-int-literals'),'CoreInt','--','CoreInt.Literals'],env=cli.opam_env(),stdout=log,stderr=subprocess.STDOUT,timeout=300).returncode
negative=json.loads((O/'wrong-registration/roundtrip.json').read_text());assert rc!=0 and negative['status']=='EXPORT_VALIDATION_FAILED';checks['reject_wrong_registration']=negative['problems']
# Standalone Lean use: values and modular addition interact with Lean BitVec directly.
lean=positive/'lean';source=['import Rocq2LeanOut']
for root,value in zip(roots,[0,1,2**62,2**63-1]):
 source.append('example : BitVec.toNat Rocq.'+root+' = '+str(value)+' := rfl')
source.append('example : BitVec.toNat (BitVec.add Rocq.CoreInt.Literals.max_lit (BitVec.ofNat 63 1)) = 0 := rfl')
(lean/'Int63Use.lean').write_text('\n'.join(source)+'\n')
env=cli.lean_env();env['LEAN_PATH']=str(T/'.lake/build/lib/lean')+':'+str(lean)
with (O/'lean-use.log').open('w') as log:
 rc=subprocess.run([str(pathlib.Path.home()/'.elan/bin/lean'),*cli.native_args(),'Int63Use.lean'],cwd=lean,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300).returncode
assert rc==0,('Lean standalone use',rc)
checks['lean_values_and_wraparound']='kernel_checked';checks['status']='PASS'
(O/'result.json').write_text(json.dumps(checks,indent=2)+'\n');print(json.dumps(checks))

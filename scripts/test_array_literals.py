#!/usr/bin/env python3
import pathlib,sys,os,json,subprocess,copy
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();O=pathlib.Path(sys.argv[2]).resolve();O.mkdir(parents=True,exist_ok=True)
os.environ['LEAN_NUM_THREADS']='4';os.environ['ROCQ2LEAN_LEAN_THREADS']='4'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
sys.path.insert(0,str(T/'tests'));from lib import structurally_rejected
fixture=T/'fixtures/corelib-array-literals';namespace='CoreArrayLit.Literals.'
roots=[namespace+n for n in ['empty','small','high','nested','poly']]
positive=O/'positive';checks={}
for label,args in [('export',['export','--mode','statement','--manifest',fixture/'source.json','--roots',','.join(roots),'--out',positive]),('translate',['translate','--input',positive/'source.ndjson','--out',positive]),('validate',['validate','--run',positive])]:
 with (O/(label+'.log')).open('w') as log:
  rc=subprocess.run([sys.executable,'-I',str(T/'tools/rocq2lean.py'),*map(str,args)],cwd=T,stdout=log,stderr=subprocess.STDOUT,timeout=900).returncode
 checks[label+'_exit']=rc;assert rc==0,(label,rc);print(label,'OK',flush=True)
report=json.loads((positive/'translation_report.json').read_text());states={r['name']:r['status'] for r in report['roots']}
assert set(states)==set(roots) and all(s=='TRANSLATED_AND_CHECKED' for s in states.values()),states
prefix='Rocq.CoreArrayLit.Literals.'
source=['import Rocq2LeanOut','open Rocq2Lean.PrimArray','set_option maxRecDepth 4096','universe u']
for name,idx,want in [('empty',0,7),('small',0,9),('small',1,7),('small',2,42),('high',0,2**63-1),('high',1,0)]:
 source.append(f"example : (get (BitVec 63) {prefix}{name} (BitVec.ofNat 63 {idx})).toNat = {want} := rfl")
source += [
 f"example : (length (BitVec 63) {prefix}empty).toNat = 0 := rfl",
 f"example : (length (BitVec 63) {prefix}small).toNat = 2 := rfl",
 f"example : (get (BitVec 63) (get (Rep (BitVec 63)) {prefix}nested (BitVec.ofNat 63 1)) (BitVec.ofNat 63 0)).toNat = 9 := rfl",
 f"example (A : Type u) (a b : A) : get A ({prefix}poly A a b) (BitVec.ofNat 63 0) = b := rfl",
 f"example (A : Type u) (a b : A) : get A ({prefix}poly A a b) (BitVec.ofNat 63 1) = a := rfl",
 f"example (A : Type u) (a b : A) : get A ({prefix}poly A a b) (BitVec.ofNat 63 2) = a := rfl"
]
lean=positive/'lean';(lean/'ArrayLiteralChecks.lean').write_text('\n'.join(source)+'\n')
env=cli.lean_env();env['LEAN_PATH']=str(T/'.lake/build/lib/lean')+':'+str(lean)
with (O/'kernel-use.log').open('w') as log:
 rc=subprocess.run([str(pathlib.Path.home()/'.elan/bin/lean'),*cli.native_args(),'ArrayLiteralChecks.lean'],cwd=lean,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=600).returncode
assert rc==0,('kernel use',rc)
for tag in ['wrong-default','wrong-element','wrong-universe','extra-element']:
 rep=copy.deepcopy(report);row=next(r for r in rep['results'] if r['source']==namespace+'small');v=row['target_value']
 if tag=='wrong-default':v['a']['a']['v']=0
 elif tag=='wrong-element':v['f']['a']['f']['a']['a']['v']=0
 elif tag=='wrong-universe':v['f']['f']['f']['u']=[{'k':'succ','l':{'k':'zero'}}]
 else:v['f']['a']['a']['a']=copy.deepcopy(v['f']['a']['a'])
 assert structurally_rejected(positive,rep,'array-literal-'+tag,namespace+'small'),tag
 checks[tag]='STRUCTURALLY_REJECTED'
checks.update(status='PASS',all_roots_checked=len(states),kernel_use_cases=len(source)-4,polymorphic_and_nested=True)
(O/'result.json').write_text(json.dumps(checks,indent=2)+'\n');print(json.dumps(checks))

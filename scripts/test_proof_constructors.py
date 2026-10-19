#!/usr/bin/env python3
import pathlib,sys,json,os,subprocess,copy
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();O=pathlib.Path(sys.argv[2]).resolve();O.mkdir(parents=True,exist_ok=True)
os.environ['LEAN_NUM_THREADS']='4';os.environ['ROCQ2LEAN_LEAN_THREADS']='4'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
sys.path.insert(0,str(T/'tests'));from lib import structurally_rejected
positive=O/'positive'
with (O/'pipeline.log').open('w') as log:
 rc=subprocess.run([sys.executable,str(R/'scripts/probe_proof_constructors.py'),str(T),str(positive)],stdout=log,stderr=subprocess.STDOUT,timeout=1200).returncode
assert rc==0
summary=json.loads((positive/'result.json').read_text());assert all(v==0 for v in summary['exit_codes'].values()) and not summary['failures'],summary
rep=json.loads((positive/'translation_report.json').read_text())
assert all(r['status']=='TRANSLATED_AND_CHECKED' for r in rep['roots'])
rootnames={r['name'] for r in rep['roots']}
for r in rep['results']:
 if r['source'] in rootnames:assert r['protected'] and not r['pending_hypotheses'],r
lean=positive/'lean'
source="""import Rocq2LeanOut
universe u v
theorem dep_beta (A : Type u) (x : A) (P : (a : A) → x = a → Sort v) (h : P x rfl) :
  Rocq.Corelib.Init.Logic.eq_rew_dep A x P h x rfl = h := rfl
theorem fwd_beta (A : Type u) (x : A) (P : (a : A) → x = a → Sort v) (h : P x rfl) :
  Rocq.Corelib.Init.Logic.eq_rew_fwd_dep A x x rfl P h = h := rfl
theorem fwd_r_beta (A : Type u) (x : A) (P : (a : A) → a = x → Sort v) (h : P x rfl) :
  Rocq.Corelib.Init.Logic.eq_rew_fwd_r_dep A x x rfl P h = h := rfl
#print axioms dep_beta
#print axioms fwd_beta
#print axioms fwd_r_beta
"""
applications=[
 'Rocq.Corelib.Init.Logic.eq_rew_dep Nat 3 (fun _ _ => Nat) {n} 3 rfl',
 'Rocq.Corelib.Init.Logic.eq_rew_fwd_dep Nat 3 3 rfl (fun _ _ => Nat) {n}',
 'Rocq.Corelib.Init.Logic.eq_rew_fwd_r_dep Nat 3 3 rfl (fun _ _ => Nat) {n}',
 'Rocq.Corelib.Init.Datatypes.eq_true_rew_dep (fun _ _ => Nat) {n} Rocq.Corelib.Init.Datatypes.bool.true Rocq.Corelib.Init.Datatypes.eq_true.is_eq_true',
 'Rocq.Corelib.Init.Datatypes.eq_true_rew_fwd_dep Rocq.Corelib.Init.Datatypes.bool.true Rocq.Corelib.Init.Datatypes.eq_true.is_eq_true (fun _ _ => Nat) {n}']
for a in applications:
 for n in [0,1,17,4294967296]:source+='example : ('+a.format(n=n)+') = '+str(n)+' := rfl\n'
(lean/'ProofConstructorClients.lean').write_text(source)
env=cli.lean_env();env['LEAN_PATH']=str(T/'.lake/build/lib/lean')+':'+str(lean)
with (O/'kernel-clients.log').open('w') as log:
 rc=subprocess.run([str(pathlib.Path.home()/'.elan/bin/lean'),*cli.native_args(),'ProofConstructorClients.lean'],cwd=lean,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300).returncode
assert rc==0,rc
log=(O/'kernel-clients.log').read_text();assert log.count('does not depend on any axioms')==3,log
# A wrong source proof term cannot be silently ignored in a translated data function.
root='Corelib.Init.Logic.eq_rew_dep';report=copy.deepcopy(rep)
row=next(r for r in report['results'] if r['source']==root)
def change(t):
 if isinstance(t,dict):
  if t.get('k')=='const' and t.get('n')=='Eq.refl':t['n']='Eq.symm';return True
  return any(change(v) for v in t.values())
 if isinstance(t,list):return any(change(v) for v in t)
 return False
assert change(row['target_type']) or change(row['target_value'])
assert structurally_rejected(positive,report,'changed-reflexivity-constructor',root)
out={'status':'PASS','core_roots_without_prerequisites':5,'kernel_computation_cases':20,'arbitrary_universe_beta_laws':3,'changed_reflexivity_constructor':'STRUCTURALLY_REJECTED'}
(O/'result.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out),flush=True)

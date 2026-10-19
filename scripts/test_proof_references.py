#!/usr/bin/env python3
import pathlib,sys,json,os,subprocess,copy
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();O=pathlib.Path(sys.argv[2]).resolve();O.mkdir(parents=True,exist_ok=True)
os.environ['LEAN_NUM_THREADS']='4';os.environ['ROCQ2LEAN_LEAN_THREADS']='4'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
sys.path.insert(0,str(T/'tests'));from lib import structurally_rejected,audit_report
positive=O/'positive'
with (O/'pipeline.log').open('w') as log:
 rc=subprocess.run([sys.executable,str(R/'scripts/probe_proof_references.py'),str(T),str(positive)],stdout=log,stderr=subprocess.STDOUT,timeout=1200).returncode
assert rc==0
summary=json.loads((positive/'result.json').read_text());assert all(v==0 for v in summary['exit_codes'].values()) and not summary['failures'],summary
rep=json.loads((positive/'translation_report.json').read_text())
assert all(r['status']=='PENDING_KERNEL_CHECKED' for r in rep['roots'])
rootnames={r['name'] for r in rep['roots']}
for r in rep['results']:
 if r['source'] in rootnames:assert r['protected'] and r['pending_hypotheses'],r
# Referenced proofs remain statements, never imported implementations.
src={r['name']:r for r in map(json.loads,(positive/'source.ndjson').read_text().splitlines()) if r.get('kind')=='constant'}
for name in ['Corelib.Init.Logic.eq_sym','Corelib.Init.Specif.eq_sigT']:
 assert src[name].get('body') is None,(name,src[name].keys())
lean=positive/'lean'
source='''import Rocq2LeanOut
universe u v
def symProof : Rocq.Corelib.Init.Logic.eq_sym.statement.{u} :=
  fun _ _ _ h => Eq.symm h
def identityProof : Rocq.Corelib.Init.Logic.eq_sym_involutive__rocq2lean_obligation_1.statement.{u} :=
  fun _ _ _ h => h
def involutiveProof :
    @RocqPending.Corelib.Init.Logic.eq_sym_involutive.statement.{u} identityProof :=
  fun _ _ _ _ => rfl
noncomputable def dependentTransport (A : Type u) (x y : A)
    (P : (z : A) → z = y → Sort v) (h : P y rfl) (e : x = y) : P x e :=
  @RocqPending.Corelib.Init.Logic.eq_rew_r_dep
    symProof identityProof involutiveProof A x y P h e
theorem transport_beta (A : Type u) (x : A)
    (P : (z : A) → z = x → Sort v) (h : P x rfl) :
    dependentTransport A x x P h rfl = h := rfl
#print axioms dependentTransport
#print axioms transport_beta
example : dependentTransport Nat 3 3 (fun _ _ => Nat) 17 rfl = 17 := rfl
example : True := dependentTransport Nat 3 3 (fun _ _ => True) True.intro rfl
'''
(lean/'ProofReferenceClients.lean').write_text(source)
env=cli.lean_env();env['LEAN_PATH']=str(T/'.lake/build/lib/lean')+':'+str(lean)
with (O/'kernel-clients.log').open('w') as log:
 rc=subprocess.run([str(pathlib.Path.home()/'.elan/bin/lean'),*cli.native_args(),'ProofReferenceClients.lean'],cwd=lean,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300).returncode
assert rc==0,(O/'kernel-clients.log').read_text()
log=(O/'kernel-clients.log').read_text();assert log.count('does not depend on any axioms')==2,log
root='Corelib.Init.Logic.eq_rew_r_dep'
# Omission of prerequisites must be rejected by the independent auditor.
bad=copy.deepcopy(rep);row=next(r for r in bad['results'] if r['source']==root)
row['pending_hypotheses']=[]
rc,probs=audit_report(positive,bad,'hidden-proof-prerequisites')
assert rc==1 and any(root in p['message'] for p in probs),probs
# The retained global proof reference cannot be changed to a different binder.
bad=copy.deepcopy(rep);row=next(r for r in bad['results'] if r['source']==root)
body=row['target_value']
while body.get('k')=='lam':body=body['b']
def mutate(t):
 if isinstance(t,dict):
  if t.get('k')=='bvar' and t['i']>=6:t['i']+=1;return True
  return any(mutate(x) for x in t.values())
 if isinstance(t,list):return any(mutate(x) for x in t)
 return False
assert mutate(body)
assert structurally_rejected(positive,bad,'changed-proof-reference',root)
out={'status':'PASS','core_roots_with_explicit_prerequisites':3,'proof_implementations_omitted':True,'lean_native_eq_client':'PASS','axiom_free_client_and_beta_law':2,'hidden_prerequisites':'REJECTED','changed_proof_reference':'STRUCTURALLY_REJECTED'}
(O/'result.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out),flush=True)

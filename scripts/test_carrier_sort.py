#!/usr/bin/env python3
import pathlib,sys,json,os,subprocess,copy
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();O=pathlib.Path(sys.argv[2]).resolve();O.mkdir(parents=True,exist_ok=True)
os.environ['LEAN_NUM_THREADS']='4';os.environ['ROCQ2LEAN_LEAN_THREADS']='4'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
sys.path.insert(0,str(T/'tests'));from lib import structurally_rejected,audit_report
positive=O/'positive'
with (O/'pipeline.log').open('w') as log:
 rc=subprocess.run([sys.executable,str(R/'scripts/probe_carrier_sort.py'),str(T),str(positive)],stdout=log,stderr=subprocess.STDOUT,timeout=1200).returncode
assert rc==0
summary=json.loads((positive/'result.json').read_text());assert all(v==0 for v in summary['exit_codes'].values()) and not summary['failures'],summary
rep=json.loads((positive/'translation_report.json').read_text())
root='Corelib.Init.Logic.eq_rect';row=next(r for r in rep['results'] if r['source']==root)
assert row['protected'] and len(row['admitting_levels'])==2 and not row['pending_hypotheses']
lean=positive/'lean'
source='''import Rocq2LeanOut
universe u v
noncomputable def carrierTransport (A : Sort u) (x y : A)
    (P : A → Sort v) (h : P x) (e : x = y) : P y :=
  Rocq.Corelib.Init.Logic.eq_rect A x P h y e
theorem carrier_beta (A : Sort u) (x : A) (P : A → Sort v) (h : P x) :
    carrierTransport A x x P h rfl = h := rfl
example : carrierTransport True True.intro True.intro (fun _ => Nat) 17 rfl = 17 := rfl
example : carrierTransport Nat 3 3 (fun _ => Nat) 19 rfl = 19 := rfl
example : True := carrierTransport True True.intro True.intro (fun _ => True) True.intro rfl
#print axioms carrierTransport
#print axioms carrier_beta
'''
(lean/'CarrierSortClients.lean').write_text(source)
env=cli.lean_env();env['LEAN_PATH']=str(T/'.lake/build/lib/lean')+':'+str(lean)
with (O/'kernel-clients.log').open('w') as log:
 rc=subprocess.run([str(pathlib.Path.home()/'.elan/bin/lean'),*cli.native_args(),'CarrierSortClients.lean'],cwd=lean,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300).returncode
assert rc==0,(O/'kernel-clients.log').read_text()
assert (O/'kernel-clients.log').read_text().count('does not depend on any axioms')==2
bad=copy.deepcopy(rep);row=next(r for r in bad['results'] if r['source']==root);row['admitting_levels']=[]
assert structurally_rejected(positive,bad,'hidden-sort-carrier',root)
bad=copy.deepcopy(rep);row=next(r for r in bad['results'] if r['source']==root)
row['target_type']['t']['l']={'k':'succ','l':row['target_type']['t']['l']}
assert structurally_rejected(positive,bad,'narrowed-carrier-to-type',root)
bad=copy.deepcopy(rep);row=next(r for r in bad['results'] if r['source']==root);row['admitting_levels'].append('NotASourceLevel')
rc,probs=audit_report(positive,bad,'invented-sort-level')
assert rc==1 and any(p['detector']=='universe' and root in p['message'] for p in probs),probs
out={'status':'PASS','protected_core_roots':len(rep['roots']),'arbitrary_sort_carrier_and_result':'PASS','axiom_free_clients':2,'prop_and_nat_kernel_examples':3,'negative_controls':3}
(O/'result.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out),flush=True)

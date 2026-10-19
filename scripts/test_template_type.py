#!/usr/bin/env python3
import pathlib,sys,json,os,subprocess,copy
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();O=pathlib.Path(sys.argv[2]).resolve();O.mkdir(parents=True,exist_ok=True)
os.environ['LEAN_NUM_THREADS']='4';os.environ['ROCQ2LEAN_LEAN_THREADS']='4'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
sys.path.insert(0,str(T/'tests'));from lib import structurally_rejected,audit_report
positive=O/'positive'
with (O/'pipeline.log').open('w') as log:
 rc=subprocess.run([sys.executable,str(R/'scripts/probe_template_type.py'),str(T),str(positive)],stdout=log,stderr=subprocess.STDOUT,timeout=1200).returncode
assert rc==0
summary=json.loads((positive/'result.json').read_text());assert all(v==0 for v in summary['exit_codes'].values()) and not summary['failures'],summary
rep=json.loads((positive/'translation_report.json').read_text())
roots={x['name']for x in rep['roots']}
for row in rep['results']:
 if row['source']in roots:assert row['template_sort'] and row['protected'] and row['status']=='TRANSLATED_AND_CHECKED',row
lean=positive/'lean'
source='''import Rocq2LeanOut
noncomputable section
universe u v
noncomputable def applyImp (P : Sort u) (Q : Sort v)
    (f : Rocq.Corelib.ssr.ssrbool.implies P Q) (p : P) : Q :=
  @Rocq.Corelib.ssr.ssrbool.implies.rec P Q (fun _ => Q) (fun g => g p) f
theorem applyImp_beta (P : Sort u) (Q : Sort v) (f : P → Q) (p : P) :
    applyImp P Q (.Implies P Q f) p = f p := rfl
noncomputable def isLeft (A : Sort u) (B : Sort v)
    (x : Rocq.Corelib.Init.Datatypes.sum A B) : Bool :=
  @Rocq.Corelib.Init.Datatypes.sum.rec A B (fun _ => Bool) (fun _ => true) (fun _ => false) x
theorem left_beta (A : Sort u) (B : Sort v) (x : A) :
    isLeft A B (.inl A B x) = true := rfl
example : isLeft True Nat (.inl True Nat True.intro) = true := rfl
example : isLeft True Nat (.inr True Nat 37) = false := rfl
example : True := applyImp True True (.Implies True True (fun h => h)) True.intro
example : applyImp Nat Nat (.Implies Nat Nat (fun n => n + 1)) 2 = 3 := rfl
example : Rocq.Corelib.Init.Datatypes.list True := .cons True True.intro (.nil True)
example : Rocq.Corelib.Init.Datatypes.list Nat := .cons Nat 42 (.nil Nat)
#print axioms applyImp_beta
#print axioms left_beta
'''
(lean/'TemplateTypeClients.lean').write_text(source)
env=cli.lean_env();env['LEAN_PATH']=str(T/'.lake/build/lib/lean')+':'+str(lean)
with (O/'kernel-clients.log').open('w') as log:
 rc=subprocess.run([str(pathlib.Path.home()/'.elan/bin/lean'),*cli.native_args(),'TemplateTypeClients.lean'],cwd=lean,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300).returncode
assert rc==0,(O/'kernel-clients.log').read_text()
assert (O/'kernel-clients.log').read_text().count('does not depend on any axioms')==2
root='Corelib.ssr.ssrbool.implies'
bad=copy.deepcopy(rep);row=next(r for r in bad['results'] if r['source']==root);row['template_sort']=False
rc,probs=audit_report(positive,bad,'hidden-template-sort')
assert rc==1 and any(root in p['message'] for p in probs),probs
bad=copy.deepcopy(rep);row=next(r for r in bad['results'] if r['source']==root)
cur=row['target_type']
while cur['k']=='forall':cur=cur['b']
def remove_floor(t):
 if t=={'k':'succ','l':{'k':'zero'}}:return {'k':'zero'}
 if isinstance(t,dict):return {k:remove_floor(v)for k,v in t.items()}
 if isinstance(t,list):return [remove_floor(v)for v in t]
 return t
before=copy.deepcopy(cur['l']);cur['l']=remove_floor(cur['l']);assert before!=cur['l']
assert structurally_rejected(positive,bad,'removed-type-floor',root)
bad=copy.deepcopy(rep);row=next(r for r in bad['results'] if r['source']==root)
row['target_type']['t']['l']={'k':'succ','l':row['target_type']['t']['l']}
assert structurally_rejected(positive,bad,'narrowed-template-carrier',root)
out={'status':'PASS','protected_core_types':3,'arbitrary_sort_beta_laws':2,'prop_nat_examples':6,'negative_controls':3}
(O/'result.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out),flush=True)

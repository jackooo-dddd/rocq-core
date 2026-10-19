#!/usr/bin/env python3
import pathlib,sys,json,os,subprocess,copy
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();O=pathlib.Path(sys.argv[2]).resolve();O.mkdir(parents=True,exist_ok=True)
os.environ['LEAN_NUM_THREADS']='4';os.environ['ROCQ2LEAN_LEAN_THREADS']='4'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
sys.path.insert(0,str(T/'tests'));from lib import structurally_rejected
positive=O/'positive'
with (O/'pipeline.log').open('w') as log:
 rc=subprocess.run([sys.executable,str(R/'scripts/probe_template_sort_roots.py'),str(T),str(positive)],stdout=log,stderr=subprocess.STDOUT,timeout=1200).returncode
assert rc==0
res=json.loads((positive/'result.json').read_text());assert all(v==0 for v in res['exit_codes'].values()),res
rep=json.loads((positive/'translation_report.json').read_text())
good={'TRANSLATED_AND_CHECKED','STATEMENT_KERNEL_CHECKED','STATEMENT_PENDING_KERNEL_CHECKED','PENDING_KERNEL_CHECKED','BOOTSTRAP_RESOLVED'}
assert all(r['status'] in good for r in rep['roots'])
rows={r['source']:r for r in rep['results']}
for n in ['ex','ex2']:
 r=rows['Corelib.Init.Logic.'+n]
 assert r['protected'] and r['template_sort'] and r['target_type']['t']['l']['k']=='param'
lean=positive/'lean'
(lean/'SortClients.lean').write_text("""import Rocq2LeanOut
universe u
def packAtSort (A : Sort u) (P : A → Prop) (a : A) (h : P a) :
    Rocq.Corelib.Init.Logic.ex.{u} A P :=
  Rocq.Corelib.Init.Logic.ex.ex_intro.{u} A P a h
def packTwoAtSort (A : Sort u) (P Q : A → Prop) (a : A) (h : P a) (g : Q a) :
    Rocq.Corelib.Init.Logic.ex2.{u} A P Q :=
  Rocq.Corelib.Init.Logic.ex2.ex_intro2.{u} A P Q a h g
theorem recoverProp (P : Prop)
    (h : Rocq.Corelib.Init.Logic.ex.{0} P (fun _ => True)) : P :=
  @Rocq.Corelib.Init.Logic.ex.rec.{0} P (fun _ => True) (fun _ => P) (fun p _ => p) h
example (P : Prop) (p : P) :
    recoverProp P (packAtSort P (fun _ => True) p True.intro) = p := rfl
example : Rocq.Corelib.Init.Logic.ex.{1} Nat (fun n => n = 3) :=
  packAtSort Nat (fun n => n = 3) 3 rfl
#print axioms packAtSort
#print axioms packTwoAtSort
#print axioms recoverProp
""")
env=cli.lean_env();env['LEAN_PATH']=str(T/'.lake/build/lib/lean')+':'+str(lean)
with (O/'kernel-clients.log').open('w') as log:
 rc=subprocess.run([str(pathlib.Path.home()/'.elan/bin/lean'),*cli.native_args(),'SortClients.lean'],cwd=lean,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300).returncode
assert rc==0,rc
log=(O/'kernel-clients.log').read_text();assert log.count('does not depend on any axioms')==3,log
checks={}
for tag in ['type-only-specialization','hidden-sort-mode','wrong-prop-conclusion']:
 report=copy.deepcopy(rep);root='Corelib.Init.Logic.ex'
 row=next(r for r in report['results'] if r['source']==root)
 if tag=='hidden-sort-mode':row['template_sort']=False
 elif tag=='type-only-specialization':
  row['target_type']['t']['l']={'k':'succ','l':row['target_type']['t']['l']}
  for c in row['target_ctors']:c['type']['t']['l']={'k':'succ','l':c['type']['t']['l']}
 else:
  x=row['target_type']
  while x.get('k')=='forall':x=x['b']
  x['l']={'k':'succ','l':{'k':'zero'}}
 assert structurally_rejected(positive,report,'template-sort-'+tag,root),tag
 checks[tag]='STRUCTURALLY_REJECTED'
checks.update(status='PASS',core_roots=5,axiom_free_clients=3,prop_and_type_instances=True)
(O/'result.json').write_text(json.dumps(checks,indent=2)+'\n');print(json.dumps(checks),flush=True)

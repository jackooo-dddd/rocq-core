#!/usr/bin/env python3
import pathlib,sys,json,os,subprocess,copy
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();O=pathlib.Path(sys.argv[2]).resolve();O.mkdir(parents=True,exist_ok=True)
os.environ['LEAN_NUM_THREADS']='4';os.environ['ROCQ2LEAN_LEAN_THREADS']='4'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
sys.path.insert(0,str(T/'tests'));from lib import structurally_rejected
positive=O/'positive'
with (O/'pipeline.log').open('w') as log:
 rc=subprocess.run([sys.executable,str(R/'scripts/probe_prop_cast.py'),str(T),str(positive)],stdout=log,stderr=subprocess.STDOUT,timeout=1200).returncode
assert rc==0
summary=json.loads((positive/'result.json').read_text());assert all(v==0 for v in summary['exit_codes'].values()) and not summary['failures'],summary
rep=json.loads((positive/'translation_report.json').read_text())
root='Corelib.Classes.CRelationClasses.Asymmetric'
row=next(r for r in rep['results'] if r['source']==root)
assert row['protected'] and row['level_params']==['v_0','v_1','v_2'] and row['prop_lift_coercions']==1 and row['prop_lift'] is None,row
assert set(row['delta_inlined'])=={'Corelib.Classes.CRelationClasses.complement','Corelib.Classes.CRelationClasses.crelation'}
lean=positive/'lean'
(lean/'CastClients.lean').write_text("""import Rocq2LeanOut
universe u v w
def castForward (A : Type u) (R : A → A → Type v)
    (h : ∀ x y, R x y → R y x → Rocq.Corelib.Init.Logic.False) :
    Rocq.Corelib.Classes.CRelationClasses.Asymmetric.{u,w,v} A R :=
  fun x y hxy => PULift.up (h x y hxy)
def castBackward (A : Type u) (R : A → A → Type v)
    (h : Rocq.Corelib.Classes.CRelationClasses.Asymmetric.{u,w,v} A R) :
    ∀ x y, R x y → R y x → Rocq.Corelib.Init.Logic.False :=
  fun x y hxy => (h x y hxy).down
theorem cast_backward_forward (A : Type u) (R : A → A → Type v)
    (h : ∀ x y, R x y → R y x → Rocq.Corelib.Init.Logic.False) :
    castBackward.{u,v,w} A R (castForward.{u,v,w} A R h) = h := rfl
theorem cast_forward_backward (A : Type u) (R : A → A → Type v)
    (h : Rocq.Corelib.Classes.CRelationClasses.Asymmetric.{u,w,v} A R) :
    castForward.{u,v,w} A R (castBackward.{u,v,w} A R h) = h := rfl
#print axioms cast_backward_forward
#print axioms cast_forward_backward
""")
env=cli.lean_env();env['LEAN_PATH']=str(T/'.lake/build/lib/lean')+':'+str(lean)
with (O/'kernel-clients.log').open('w') as log:
 rc=subprocess.run([str(pathlib.Path.home()/'.elan/bin/lean'),*cli.native_args(),'CastClients.lean'],cwd=lean,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300).returncode
assert rc==0,rc
text=(O/'kernel-clients.log').read_text();assert text.count('does not depend on any axioms')==2,text
def find_lift(t):
 if isinstance(t,dict):
  if t.get('k')=='const' and t.get('n')=='PULift':return t
  for v in t.values():
   p=find_lift(v)
   if p is not None:return p
 if isinstance(t,list):
  for v in t:
   p=find_lift(v)
   if p is not None:return p
 return None
checks={}
for tag in ['wrong-cast-universe','non-proposition-lift','missing-expansion','missing-coercion']:
 report=copy.deepcopy(rep);row=next(r for r in report['results'] if r['source']==root)
 lift=find_lift(row['target_value']);assert lift
 if tag=='wrong-cast-universe':lift['u'][0]={'k':'succ','l':{'k':'param','n':'v_2'}}
 elif tag=='non-proposition-lift':lift['u'][1]={'k':'succ','l':{'k':'zero'}}
 elif tag=='missing-expansion':row['delta_inlined']=[]
 else:row['prop_lift_coercions']=0
 assert structurally_rejected(positive,report,'prop-cast-'+tag,root),tag
 checks[tag]='STRUCTURALLY_REJECTED'
checks.update(status='PASS',protected_core_root=root,all_public_universes_retained=True,axiom_free_inverse_laws=2)
(O/'result.json').write_text(json.dumps(checks,indent=2)+'\n');print(json.dumps(checks),flush=True)

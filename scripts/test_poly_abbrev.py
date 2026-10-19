#!/usr/bin/env python3
import pathlib,sys,os,json,subprocess,copy
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();O=pathlib.Path(sys.argv[2]).resolve();O.mkdir(parents=True,exist_ok=True)
os.environ['LEAN_NUM_THREADS']='4';os.environ['ROCQ2LEAN_LEAN_THREADS']='4'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli;import audit
sys.path.insert(0,str(T/'tests'));from lib import structurally_rejected
positive=O/'positive'
with (O/'pipeline.log').open('w') as log:
 rc=subprocess.run([sys.executable,str(R/'scripts/probe_poly_abbrev.py'),str(T),str(positive)],stdout=log,stderr=subprocess.STDOUT,timeout=1200).returncode
assert rc==0,rc
summary=json.loads((positive/'result.json').read_text());assert all(v==0 for v in summary['exit_codes'].values()),summary
assert not summary['failures'],summary
report=json.loads((positive/'translation_report.json').read_text());rows={r['source']:r for r in report['results']}
prefix='CoreAbbrev.Poly.'
for name,count in [('rel',2),('complement',2),('complement_at',3),('complement_twice',2)]:
 r=rows[prefix+name]
 assert r['protected'] and len(r['level_params'])==count and not r['sort_lowered_levels'] and not r['r2bp_levels'],r
for name in ['complement','complement_at']:
 r=rows[prefix+name];assert r['delta_inlined']==[prefix+'rel'] and r['prop_lift']==4,r
# A source universe variable shares no representation with a term variable or rel.
instance=[{'k':'global','n':'caller.u'},{'k':'var','i':5}]
source={'term':{'k':'rel','i':1},'named':{'k':'var','id':'x'},
 'sort':{'k':'type','u':[{'l':{'k':'var','i':1},'n':3}]},
 'constant':{'k':'const','c':'C','u':[{'k':'var','i':0},{'k':'var','i':1}]},
 'literal':{'k':'array','u':[{'k':'var','i':1}],'def':{'k':'rel','i':0}}}
out=audit.instantiate_source_universes(source,instance)
assert out['term']==source['term'] and out['named']==source['named']
assert out['sort']['u']==[{'l':instance[1],'n':3}]
assert out['constant']['u']==instance and out['literal']['u']==[instance[1]]
for bad in [-1,2,True,'0']:
 try:audit.instantiate_source_universes({'k':'var','i':bad},instance)
 except audit.Mismatch:pass
 else:raise AssertionError(('accepted malformed index',bad))
lean=positive/'lean'
(lean/'AliasClients.lean').write_text("""import Rocq2LeanOut
universe u v w
example (A : Type u) (R : A → A → Type v) (x y : A) :
    Rocq.CoreAbbrev.Poly.complement_at.{u,v,w} A R x y =
    PULift.{w+1,0} (R x y → Rocq.Corelib.Init.Logic.False) := rfl
def toComplement (A : Type u) (R : A → A → Type v) (x y : A)
    (h : R x y → Rocq.Corelib.Init.Logic.False) :
    Rocq.CoreAbbrev.Poly.complement_at.{u,v,w} A R x y := PULift.up h
def fromComplement (A : Type u) (R : A → A → Type v) (x y : A)
    (h : Rocq.CoreAbbrev.Poly.complement_at.{u,v,w} A R x y) :
    R x y → Rocq.Corelib.Init.Logic.False := h.down
theorem backward_forward (A : Type u) (R : A → A → Type v) (x y : A)
    (h : R x y → Rocq.Corelib.Init.Logic.False) :
    fromComplement.{u,v,w} A R x y (toComplement.{u,v,w} A R x y h) = h := rfl
theorem forward_backward (A : Type u) (R : A → A → Type v) (x y : A)
    (h : Rocq.CoreAbbrev.Poly.complement_at.{u,v,w} A R x y) :
    toComplement.{u,v,w} A R x y (fromComplement.{u,v,w} A R x y h) = h := rfl
#print axioms backward_forward
#print axioms forward_backward
""")
env=cli.lean_env();env['LEAN_PATH']=str(T/'.lake/build/lib/lean')+':'+str(lean)
with (O/'kernel-clients.log').open('w') as log:
 rc=subprocess.run([str(pathlib.Path.home()/'.elan/bin/lean'),*cli.native_args(),'AliasClients.lean'],cwd=lean,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300).returncode
assert rc==0,rc
text=(O/'kernel-clients.log').read_text();assert text.count('does not depend on any axioms')==2,text
checks={}
def rewrite(x,pre):
 if isinstance(x,dict):
  y=pre(x)
  if y is not None:return y
  return {k:rewrite(v,pre) for k,v in x.items()}
 if isinstance(x,list):return [rewrite(v,pre) for v in x]
 return x
for tag in ['wrong-codomain-universe','erased-domain-universe','missing-source-expansion','wrong-call-instance']:
 rep=copy.deepcopy(report);root=prefix+('complement_twice' if tag=='wrong-call-instance' else 'complement_at')
 row=next(r for r in rep['results'] if r['source']==root)
 if tag=='missing-source-expansion':row['delta_inlined']=[]
 elif tag=='wrong-call-instance':
  row['target_value']=rewrite(row['target_value'],lambda x:dict(x,u=[{'k':'zero'},{'k':'zero'}]) if x.get('k')=='const' and x.get('n')=='Rocq.CoreAbbrev.Poly.complement' else None)
 else:
  var='v_2' if tag=='wrong-codomain-universe' else 'v_0'
  replacement={'k':'param','n':'v_1'} if tag=='wrong-codomain-universe' else {'k':'zero'}
  for field in ['target_type','target_value']:
   row[field]=rewrite(row[field],lambda x:copy.deepcopy(replacement) if x.get('k')=='param' and x.get('n')==var else None)
 assert structurally_rejected(positive,rep,'poly-abbrev-'+tag,root),tag
 checks[tag]='STRUCTURALLY_REJECTED'
checks.update(status='PASS',protected_roots=4,public_universes_preserved=True,axiom_free_inverse_laws=2)
(O/'result.json').write_text(json.dumps(checks,indent=2)+'\n');print(json.dumps(checks),flush=True)

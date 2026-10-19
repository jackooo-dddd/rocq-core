#!/usr/bin/env python3
import pathlib,sys,os,json,subprocess,copy
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();O=pathlib.Path(sys.argv[2]).resolve();O.mkdir(parents=True,exist_ok=True)
os.environ["LEAN_NUM_THREADS"]="4";os.environ["ROCQ2LEAN_LEAN_THREADS"]="4"
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
sys.path.insert(0,str(T/"tests"));from lib import audit_report
roots=["CoreLift.Lift."+n for n in ["raise_type","raise_value","lower_value","roundtrip","raise_poly","roundtrip_poly"]]
positive=O/"positive";exits={}
for label,args in [("export",["export","--mode","statement","--manifest",T/"fixtures/corelib-universe-lift/source.json","--roots",",".join(roots),"--out",positive]),("translate",["translate","--input",positive/"source.ndjson","--out",positive]),("validate",["validate","--run",positive])]:
 with (O/(label+".log")).open("w")as log:
  rc=subprocess.run([sys.executable,"-I",str(T/"tools/rocq2lean.py"),*map(str,args)],cwd=T,stdout=log,stderr=subprocess.STDOUT,timeout=900).returncode
 exits[label]=rc;print(label,rc,flush=True)
 if label=="export":assert rc==0
rep=json.loads((positive/"translation_report.json").read_text())
(O/"pipeline.json").write_text(json.dumps({"exits":exits,"roots":rep["roots"]},indent=2)+"\n")
assert all(v==0 for v in exits.values()),exits
rows={r["source"]:r for r in rep["results"]}
assert all(rows[n]["status"]=="TRANSLATED_AND_CHECKED" for n in roots),rep["roots"]
root="CoreLift.Lift.roundtrip_poly";rr=rows[root]
assert rr["protected"] and rr["type_lift_coercions"]>=2
assert rows["CoreLift.Lift.raise_poly"]["type_lift"]==1
checks={}
def walk(t):
 if isinstance(t,dict):
  yield t
  for v in t.values():yield from walk(v)
 elif isinstance(t,list):
  for v in t:yield from walk(v)
for tag in ["missing-mode","wrong-payload","wrong-operator"]:
 bad=copy.deepcopy(rep);row=next(x for x in bad["results"]if x["source"]==root)
 if tag=="missing-mode":row["type_lift_coercions"]=0
 else:
  node=next(t for t in walk(row["target_value"])if t.get("k")=="app" and t.get("f",{}).get("k")=="app" and t["f"].get("f",{}).get("n")=="PULift.up")
  if tag=="wrong-payload":
   assert node["a"]["k"]=="bvar";node["a"]["i"]+=1
  else:node["f"]["f"]["n"]="PULift.down"
 rc,probs=audit_report(positive,bad,"type-coercions-"+tag)
 if tag=="wrong-operator":
  # Direction is a typing obligation. A wrong up/down can have the same stripped
  # payload, so rejection must be checked by the Lean kernel, not claimed here.
  checks[tag+"-audit-only"]="NOT_A_STRUCTURAL_CLAIM"
 else:
  assert rc==1 and any(p["message"].startswith(root+":")for p in probs),(tag,probs)
  checks[tag]="STRUCTURALLY_REJECTED"
lean=positive/"lean";program=lean/"TypeTransportChecks.lean"
program.write_text("""import Rocq2LeanOut
noncomputable section
universe u v
def transportUp (A : Type u) (a : A) : Rocq.CoreLift.Lift.raise_poly.{u,v} A := PULift.up a
def transportDown (A : Type u) (a : Rocq.CoreLift.Lift.raise_poly.{u,v} A) : A := PULift.down a
theorem source_roundtrip (A : Type u) (a : A) :
    Rocq.CoreLift.Lift.roundtrip_poly.{u,v} A a = a := rfl
theorem up_down (A : Type u) (a : Rocq.CoreLift.Lift.raise_poly.{u,v} A) :
    transportUp A (transportDown A a) = a := rfl
example : Rocq.CoreLift.Lift.roundtrip_poly.{0,3} Nat 73 = 73 := rfl
#print axioms source_roundtrip
#print axioms up_down
""")
env=cli.lean_env();env["LEAN_PATH"]=str(T/".lake/build/lib/lean")+":"+str(lean)
with (O/"clients.log").open("w")as log:
 rc=subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(program)],cwd=T,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300).returncode
assert rc==0,(O/"clients.log").read_text()
assert (O/"clients.log").read_text().count("does not depend on any axioms")==2
wrong=lean/"WrongDirection.lean"
wrong.write_text("""import Rocq2LeanOut
universe u v
noncomputable def wrong (A : Type u) (a : A) : Rocq.CoreLift.Lift.raise_poly.{u,v} A := PULift.down a
""")
with (O/"wrong-direction.log").open("w")as log:
 rc=subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(wrong)],cwd=T,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300).returncode
assert rc!=0 and "error:"in(O/"wrong-direction.log").read_text()
checks.update(status="PASS",protected_roots=6,arbitrary_universe_axiom_free_laws=2,wrong_direction="KERNEL_REJECTED")
(O/"result.json").write_text(json.dumps(checks,indent=2)+"\n")
print(json.dumps(checks),flush=True)

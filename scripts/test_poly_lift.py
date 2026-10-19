#!/usr/bin/env python3
import pathlib,sys,subprocess,json,os,copy,itertools,random
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();O=pathlib.Path(sys.argv[2]).resolve()
O.mkdir(parents=True,exist_ok=True)
os.environ["LEAN_NUM_THREADS"]="4";os.environ["ROCQ2LEAN_LEAN_THREADS"]="4"
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli;import audit
sys.path.insert(0,str(T/"tests"));from lib import audit_report,structurally_rejected
base=R/"work/runs/poly-lift-targeted/Corelib/Classes/CMorphisms"
assert json.loads((base/"audit.json").read_text())["status"]=="OK"
rep=json.loads((base/"translation_report.json").read_text())
root="Corelib.Classes.CMorphisms.respectful"
row=next(r for r in rep["results"]if r["source"]==root)
assert row["status"]=="TRANSLATED_AND_CHECKED" and row["protected"] and row["type_lift"]==6 and len(row["level_params"])==6
# Keep original campaign outputs immutable: only the audit inputs are copied.
positive=O/"positive";positive.mkdir()
for name in ["source.ndjson","contract.json","translation_report.json","consumer_result.json"]:
 (positive/name).write_bytes((base/name).read_bytes())
checks={}
for tag in ["missing-image","wrong-image","missing-lift","wrong-upper","wrong-lower","wrong-depth","wrong-payload"]:
 bad=copy.deepcopy(rep);rr=next(r for r in bad["results"]if r["source"]==root)
 cur=rr["target_value"]
 for _ in range(6):cur=cur["b"]
 if tag=="missing-image":rr["poly_level_interp"]=[]
 elif tag=="wrong-image":rr["poly_level_interp"][5]={"k":"param","n":"v_5"}
 elif tag=="missing-lift":rr["type_lift"]=None
 elif tag=="wrong-upper":cur["f"]["u"][0]={"k":"succ","l":cur["f"]["u"][0]}
 elif tag=="wrong-lower":cur["f"]["u"][1]={"k":"succ","l":cur["f"]["u"][1]}
 elif tag=="wrong-depth":rr["type_lift"]=5
 else:
  # Change the relation in the payload while leaving its universe and shape.
  payload=cur["a"]
  while payload.get("k")=="forall":payload=payload["b"]
  def mutate(t):
   if isinstance(t,dict):
    if t.get("k")=="bvar" and t.get("i")==3:t["i"]=4;return True
    return any(mutate(v)for v in t.values())
   if isinstance(t,list):return any(mutate(v)for v in t)
   return False
  assert mutate(cur["a"])
 rc,problems=audit_report(positive,bad,"poly-lift-"+tag)
 assert rc==1 and any(p["message"].startswith(root+":") for p in problems),(tag,problems)
 checks[tag]="REJECTED"
lean=O/"PolyLiftClients.lean"
lean.write_text("""import Rocq2LeanOut
noncomputable section
universe a b r s upperA upperR
def respectUp (A : Type a) (B : Type b) (R : A → A → Type r)
    (S : B → B → Type s) (f g : A → B)
    (h : ∀ x y, R x y → S (f x) (g y)) :
    Rocq.Corelib.Classes.CMorphisms.respectful.{a,r,b,s,upperA,upperR} A B R S f g :=
  PULift.up h
def respectDown (A : Type a) (B : Type b) (R : A → A → Type r)
    (S : B → B → Type s) (f g : A → B)
    (h : Rocq.Corelib.Classes.CMorphisms.respectful.{a,r,b,s,upperA,upperR} A B R S f g) :
    ∀ x y, R x y → S (f x) (g y) := PULift.down h
theorem respect_down_up (A : Type a) (B : Type b) (R : A → A → Type r)
    (S : B → B → Type s) (f g : A → B) (h : ∀ x y, R x y → S (f x) (g y)) :
    respectDown A B R S f g (respectUp.{a,b,r,s,upperA,upperR} A B R S f g h) = h := rfl
theorem respect_up_down (A : Type a) (B : Type b) (R : A → A → Type r)
    (S : B → B → Type s) (f g : A → B)
    (h : Rocq.Corelib.Classes.CMorphisms.respectful.{a,r,b,s,upperA,upperR} A B R S f g) :
    respectUp A B R S f g (respectDown A B R S f g h) = h := rfl
example : (respectDown Nat Nat (fun _ _ => Nat) (fun _ _ => Nat) id id
    (respectUp.{0,0,0,0,2,3} Nat Nat (fun _ _ => Nat) (fun _ _ => Nat) id id
      (fun x y z => x + y + z))) 1 2 3 = 6 := rfl
#print axioms respect_down_up
#print axioms respect_up_down
""")
env=cli.lean_env();env["LEAN_PATH"]=str(T/".lake/build/lib/lean")+":"+str(base/"lean")
with (O/"clients.log").open("w")as log:
 rc=subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(lean)],cwd=T,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300).returncode
assert rc==0,(O/"clients.log").read_text()
assert (O/"clients.log").read_text().count("does not depend on any axioms")==2
checks["arbitrary-universe-inverse-laws"]=2
# Exercise the real Lean constraint interpreter, then independently reconstruct
# its images and check soundness/fixed-point coverage on bounded valuations.
var=lambda i:{"k":"var","i":i};zero={"k":"set"}
edge=lambda a,b,k:{"l":a,"r":b,"rel":{"k":"le","offset":k}}
cases=[]
rng=random.Random(19274)
for n in range(1,5):
 for trial in range(30):
  cs=[edge(var(rng.randrange(n)),var(rng.randrange(n)),rng.randrange(3))for _ in range(rng.randrange(8))]
  if trial%5==0:cs.append(edge(var(rng.randrange(n)),zero,0))
  if trial%7==0:cs.append({"l":var(0),"r":var(n-1),"rel":{"k":"eq"}})
  cases.append({"n":n,"constraints":cs})
for d in map(json.loads,(base/"source.ndjson").read_text().splitlines()):
 u=d.get("universes")or{}
 if u.get("k")=="polymorphic" and u["names"]:
  c={"n":len(u["names"]),"constraints":u["constraints"]}
  if c not in cases:cases.append(c)
cases.extend([{"n":2,"constraints":[edge(var(0),var(1),-1)]},
              {"n":2,"constraints":[edge({"k":"global","n":"unsupported"},var(1),0)]},
              {"n":2,"constraints":[edge(var(3),var(1),0)]}])
(O/"constraints.json").write_text(json.dumps(cases))
program=O/"ConstraintChecks.lean"
program.write_text("""import Rocq2Lean.Emit
open Lean Rocq2Lean
def main (args : List String) : IO Unit := do
  let input ← IO.FS.readFile args[0]!
  let .ok js := Json.parse input | throw (IO.userError "json")
  let .ok cases := js.getArr? | throw (IO.userError "array")
  let mut answers := #[]
  for c in cases do
    let .ok n := c.getObjValAs? Nat "n" | throw (IO.userError "n")
    let .ok cs := c.getObjVal? "constraints" | throw (IO.userError "constraints")
    let ans := match polyUniverseInterpretation (Array.replicate n none) cs with
      | .ok levels => Json.mkObj [("levels",Json.arr (levels.map levelJson))]
      | .error msg => Json.mkObj [("error",Json.str msg)]
    answers := answers.push ans
  IO.println (Json.arr answers).compress
""")
with (O/"constraints-runtime.json").open("w")as out, (O/"constraints-runtime.log").open("w")as err:
 rc=subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),"--run",str(program),str(O/"constraints.json")],cwd=T,env=env,stdout=out,stderr=err,timeout=300).returncode
assert rc==0,(O/"constraints-runtime.log").read_text()
answers=json.loads((O/"constraints-runtime.json").read_text())
def eval_level(t,values):
 k=t["k"]
 if k=="zero":return 0
 if k=="param":return values[int(t["n"][2:])]
 if k=="succ":return eval_level(t["l"],values)+1
 if k=="max":return max(eval_level(t["a"],values),eval_level(t["b"],values))
 raise AssertionError(t)
def satisfies(cs,values):
 def at(x):return 0 if x["k"]=="set" else values[x["i"]]
 return all((at(c["l"])==at(c["r"]) if c["rel"]["k"]=="eq" else at(c["l"])+c["rel"]["offset"]<=at(c["r"]))for c in cs)
accepted=rejected=sound=fixed=0
for case,ans in zip(cases,answers,strict=True):
 d={"kind":"constant","universes":{"k":"polymorphic","names":[None]*case["n"],"constraints":case["constraints"]}}
 if "error"in ans:
  try:audit.checked_poly_interpretation(d,{"poly_level_interp":[{"k":"param","n":f"v_{i}"}for i in range(case["n"])]})
  except audit.Mismatch:pass
  else:raise AssertionError(("unexpected translator rejection",case,ans))
  rejected+=1;continue
 audit.checked_poly_interpretation(d,{"poly_level_interp":ans["levels"]})
 accepted+=1
 vals=itertools.product(range(3),repeat=case["n"]) if case["n"]<=6 else [tuple(rng.randrange(6)for _ in range(case["n"]))for _ in range(100)]
 for values in vals:
  images=tuple(eval_level(t,values)for t in ans["levels"])
  assert satisfies(case["constraints"],images),(case,values,images)
  sound+=1
  if satisfies(case["constraints"],values):
   assert images==values,(case,values,images)
   fixed+=1
checks.update(status="PASS",constraint_contexts=len(cases),accepted_contexts=accepted,rejected_contexts=rejected,checked_interpreted_valuations=sound,checked_admissible_fixed_points=fixed)
(O/"result.json").write_text(json.dumps(checks,indent=2)+"\n")
print(json.dumps(checks),flush=True)

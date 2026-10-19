#!/usr/bin/env python3
import pathlib,sys,json,copy,subprocess,os
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();O=pathlib.Path(sys.argv[2]).resolve();RUN=pathlib.Path(sys.argv[3]).resolve();O.mkdir(parents=True,exist_ok=True)
os.environ["LEAN_NUM_THREADS"]="4";os.environ["ROCQ2LEAN_LEAN_THREADS"]="4"
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli;import audit
sys.path.insert(0,str(T/"tests"));from lib import audit_report
base=RUN/"Corelib/Classes/RelationClasses"
assert json.loads((base/"result.json").read_text())["checked"]
rep=json.loads((base/"translation_report.json").read_text())
root="Corelib.Classes.RelationClasses.binary_relation";arrows="Corelib.Classes.RelationClasses.arrows"
row=next(r for r in rep["results"]if r["source"]==root)
assert row["protected"]and row["status"]=="TRANSLATED_AND_CHECKED"and row["source_computed"]==[arrows]
positive=O/"positive";positive.mkdir()
for name in ["source.ndjson","contract.json","consumer_result.json"]:
 (positive/name).write_bytes((base/name).read_bytes())
checks={}
for tag in ["missing-reduction","wrong-definition","duplicate-definition","wrong-payload","narrowed-carrier"]:
 bad=copy.deepcopy(rep);rr=next(r for r in bad["results"]if r["source"]==root)
 if tag=="missing-reduction":rr["source_computed"]=[]
 elif tag=="wrong-definition":rr["source_computed"]=[root]
 elif tag=="duplicate-definition":rr["source_computed"]=[arrows,arrows]
 elif tag=="wrong-payload":rr["target_value"]["b"]["b"]["b"]={"k":"sort","l":{"k":"succ","l":{"k":"zero"}}}
 else:rr["target_type"]["t"]["l"]={"k":"succ","l":{"k":"zero"}}
 rc,probs=audit_report(positive,bad,"source-compute-"+tag)
 assert rc==1 and any(p["message"].startswith(root+":")for p in probs),(tag,probs)
 checks[tag]="REJECTED"
lean=O/"Clients.lean"
lean.write_text("""import Rocq2LeanOut
noncomputable section
universe u
def toSource (A : Type u) (r : A → A → Prop) : Rocq.Corelib.Classes.RelationClasses.binary_relation A := r
def toNative (A : Type u) (r : Rocq.Corelib.Classes.RelationClasses.binary_relation A) : A → A → Prop := r
theorem native_source (A : Type u) (r : A → A → Prop) : toNative A (toSource A r) = r := rfl
theorem source_native (A : Type u) (r : Rocq.Corelib.Classes.RelationClasses.binary_relation A) : toSource A (toNative A r) = r := rfl
example : toNative Nat (toSource Nat Eq) 7 7 := rfl
example : Rocq.Corelib.Classes.RelationClasses.unary_predicate Nat := fun n => n = 17
#print axioms native_source
#print axioms source_native
""")
env=cli.lean_env();env["LEAN_PATH"]=str(T/".lake/build/lib/lean")+":"+str(base/"lean")
with(O/"clients.log").open("w")as log:
 rc=subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(lean)],cwd=T,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300).returncode
assert rc==0,(O/"clients.log").read_text()
assert (O/"clients.log").read_text().count("does not depend on any axioms")==2
source=O/"Conversion.v"
source.write_bytes((R/"work/tests/source-compute-design/Conversion.v").read_bytes())
with(O/"source-kernel.log").open("w")as log:
 rc=subprocess.run(["rocq","compile",str(source)],cwd=O,env=cli.opam_env(),stdout=log,stderr=subprocess.STDOUT,timeout=120).returncode
assert rc==0,(O/"source-kernel.log").read_text()
ds={d["name"]:d for d in map(json.loads,(base/"source.ndjson").read_text().splitlines())if d.get("kind")in["constant","inductive"]}
ind={"mind":"Corelib.Classes.RelationClasses.Tlist","i":0}
ctor=lambda k:{"k":"construct","ind":ind,"c":k,"u":[]}
app=lambda f,*args:{"k":"app","f":f,"args":list(args)}
prop={"k":"sort","s":{"k":"prop"}}
sort=ds[root]["type"]["ty"]
anon={"n":None,"r":"R"}
cases=[]
for n in range(7):
 xs=ctor(0)
 for i in reversed(range(n)):xs=app(ctor(1),{"k":"rel","i":n-1-i},xs)
 term=app({"k":"const","c":arrows,"u":[]},xs,prop)
 expect=prop
 for i in reversed(range(n)):expect={"k":"prod","n":anon,"ty":{"k":"rel","i":n-1},"b":expect}
 for _ in range(n):
  term={"k":"lam","n":anon,"ty":sort,"b":term}
  expect={"k":"lam","n":anon,"ty":sort,"b":expect}
 got,used=audit.compute_source_types(term,{arrows:ds[arrows]["body"]})
 assert audit.src_anon(got)==audit.src_anon(expect),(n,got,expect)
 assert used=={arrows}
 cases.append({"input":term,"expected":expect,"fuel":128,"names":[arrows]})
# Unknown structural argument must retain its reference, and fuel exhaustion
# must return the unchanged term; neither is claimed as computed.
term={"k":"lam","n":anon,"ty":{"k":"ind","ind":ind,"u":[]},"b":app({"k":"const","c":arrows,"u":[]},{"k":"rel","i":0},prop)}
cases.append({"input":term,"expected":term,"fuel":128,"names":[]})
cases.append({"input":cases[3]["input"],"expected":cases[3]["input"],"fuel":0,"names":[]})
data={"body":ds[arrows]["body"],"name":arrows,"cases":cases}
(O/"cases.json").write_text(json.dumps(data))
program=O/"SourceReductionChecks.lean"
program.write_text("""import Rocq2Lean
open Lean Rocq2Lean
partial def same : IR.Term → IR.Term → Bool
  | .rel i, .rel j => i == j
  | .sort a, .sort b => a == b
  | .prod _ a b, .prod _ c d | .lam _ a b, .lam _ c d => same a c && same b d
  | .const c u, .const d v => c == d && u == v
  | .ind i u, .ind j v => i == j && u == v
  | .construct i k u, .construct j l v => i == j && k == l && u == v
  | .app f xs, .app g ys => same f g && xs.size == ys.size && (xs.zip ys).all (fun (x,y) => same x y)
  | _, _ => false
def main (args : List String) : IO Unit := do
  let .ok js := Json.parse (← IO.FS.readFile args[0]!) | throw (IO.userError "json")
  let .ok body := IR.parseTerm (js.getObjValD "body") | throw (IO.userError "body")
  let .ok name := js.getObjValAs? String "name" | throw (IO.userError "name")
  let .ok cases := (js.getObjValD "cases").getArr? | throw (IO.userError "cases")
  let bodies := ({} : Std.HashMap String IR.Term).insert name body
  for c in cases do
    let .ok input := IR.parseTerm (c.getObjValD "input") | throw (IO.userError "input")
    let .ok expected := IR.parseTerm (c.getObjValD "expected") | throw (IO.userError "expected")
    let .ok fuel := c.getObjValAs? Nat "fuel" | throw (IO.userError "fuel")
    let .ok names := c.getObjValAs? (Array String) "names" | throw (IO.userError "names")
    let (got,used) := computeSourceTypes bodies input fuel
    unless same got expected && used.toArray.qsort (· < ·) == names do
      throw (IO.userError "source computation or trace mismatch")
  IO.println s!"PASS {cases.size} source computation cases"
""")
with(O/"normalizer-runtime.log").open("w")as log:
 rc=subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),"--run",str(program),str(O/"cases.json")],cwd=T,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300).returncode
assert rc==0,(O/"normalizer-runtime.log").read_text()
checks.update(status="PASS",arbitrary_universe_axiom_free_inverse_laws=2,source_kernel_conversion_proofs=3,independent_source_reduction_cases=len(cases))
(O/"result.json").write_text(json.dumps(checks,indent=2)+"\n");print(json.dumps(checks),flush=True)

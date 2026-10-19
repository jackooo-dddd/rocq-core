#!/usr/bin/env python3
"""Declared result universes must survive pre-transport unification."""
import pathlib,sys,copy,json,subprocess,shutil
R=pathlib.Path(__file__).resolve().parents[1]
T=pathlib.Path(sys.argv[1])if len(sys.argv)>1 else R/"work/snapshots/quality-dispatch5/translator"
O=pathlib.Path(sys.argv[2])if len(sys.argv)>2 else R/"work/tests/result-transport-checked"
O.mkdir(parents=True);P=R/"work/tests/result-transport-probe"
assert json.loads((P/"validate.json").read_text())["status"]=="STATEMENT_VALIDATED"
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
sys.path.insert(0,str(T/"tests"));from lib import audit_report
positive=O/"positive";positive.mkdir()
for n in["source.ndjson","contract.json","translation_report.json","consumer_result.json"]:shutil.copy2(P/n,positive/n)
rep=json.loads((P/"translation_report.json").read_text());root="CoreLift.Lift.raise_type";row=next(r for r in rep["results"]if r["source"]==root)
assert row["protected"]and row["type_lift"]==1 and len(row["level_params"])==2
assert all(r["status"]=="TRANSLATED_AND_CHECKED"for r in rep["results"])
mutations=[]
env=cli.lean_env();env["LEAN_PATH"]=str(T/".lake/build/lib/lean")+":"+str(P/"lean")
lean=str(pathlib.Path.home()/".elan/bin/lean")
for tag in["missing-lift","wrong-upper","wrong-lower","wrong-depth","wrong-payload","narrowed-result"]:
 bad=copy.deepcopy(rep);r=next(r for r in bad["results"]if r["source"]==root);cur=r["target_value"]["b"]
 if tag=="missing-lift":r["type_lift"]=None
 elif tag=="wrong-upper":cur["f"]["u"][0]={"k":"succ","l":cur["f"]["u"][0]}
 elif tag=="wrong-lower":cur["f"]["u"][1]={"k":"succ","l":cur["f"]["u"][1]}
 elif tag=="wrong-depth":r["type_lift"]=0
 elif tag=="wrong-payload":cur["a"]={"k":"const","n":"PUnit","u":[copy.deepcopy(cur["f"]["u"][1])]}
 else:
  cur["f"]["u"][0]=copy.deepcopy(cur["f"]["u"][1])
  r["target_type"]["b"]={"k":"sort","l":copy.deepcopy(cur["f"]["u"][1])}
 rc,probs=audit_report(positive,bad,tag)
 assert rc==1 and any(p["message"].startswith(root+":")for p in probs),(tag,probs)
 record={"mutation":tag,"audit":"REJECTED"}
 if tag in["wrong-payload","narrowed-result"]:
  (O/(tag+".json")).write_text(json.dumps(bad))
  (O/(tag+".lean")).write_text('import Rocq2Lean.Replay\n#rocq2lean_replay '+json.dumps(str(O/(tag+".json")))+" "+json.dumps(str(O/(tag+"-kernel.json")))+"\n")
  with(O/(tag+".log")).open("w")as log:
   rc=subprocess.run([lean,*cli.native_args(),str(O/(tag+".lean"))],cwd=O,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300).returncode
  assert rc==0,(O/(tag+".log")).read_text()
  kr=json.loads((O/(tag+"-kernel.json")).read_text())["results"]
  assert all(x["kernel"]=="ACCEPTED"for x in kr),(tag,kr)
  record["kernel"]="ACCEPTED"
 mutations.append(record)
client="""import Rocq2LeanOut
universe u v
def globalUp (A : Type u) (a : A) : Rocq.CoreLift.Lift.raise_type.{u,v} A := PULift.up a
def globalDown (A : Type u) (a : Rocq.CoreLift.Lift.raise_type.{u,v} A) : A := PULift.down a
theorem global_down_up (A : Type u) (a : A) : globalDown A (globalUp.{u,v} A a) = a := rfl
theorem global_up_down (A : Type u) (a : Rocq.CoreLift.Lift.raise_type.{u,v} A) : globalUp A (globalDown A a) = a := rfl
theorem global_source_roundtrip (A : Type u) (a : A) : Rocq.CoreLift.Lift.roundtrip A a = a := rfl
theorem poly_source_roundtrip (A : Type u) (a : A) : Rocq.CoreLift.Lift.roundtrip_poly.{u,v} A a = a := rfl
#print axioms global_down_up
#print axioms global_up_down
#print axioms global_source_roundtrip
#print axioms poly_source_roundtrip
"""
(O/"Clients.lean").write_text(client)
with(O/"clients.log").open("w")as log:
 rc=subprocess.run([lean,*cli.native_args(),str(O/"Clients.lean")],cwd=O,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300).returncode
assert rc==0,(O/"clients.log").read_text()
assert (O/"clients.log").read_text().count("does not depend on any axioms")==4
result={"status":"PASS","source_and_target_audited_roots":6,"axiom_free_arbitrary_universe_laws":4,"mutations":mutations,"preserved_global_result_parameters":2,"new_certified_core_roots":0}
(O/"result.json").write_text(json.dumps(result,indent=2)+"\n")
print(json.dumps(result),flush=True)

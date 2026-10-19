#!/usr/bin/env python3
import pathlib,sys,json,copy,os,subprocess
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();O=pathlib.Path(sys.argv[2]).resolve();RUN=pathlib.Path(sys.argv[3]).resolve()
O.mkdir(parents=True,exist_ok=True)
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
sys.path.insert(0,str(T/"tests"));from lib import audit_report
def walk(t):
 if isinstance(t,dict):
  yield t
  for v in t.values():yield from walk(v)
 elif isinstance(t,list):
  for v in t:yield from walk(v)
checked=[];mutations=[]
for module in ["CMorphisms","CRelationClasses"]:
 base=RUN/"Corelib/Classes"/module
 assert json.loads((base/"result.json").read_text())["checked"]
 assert json.loads((base/"audit.json").read_text())["status"]=="OK"
 rep=json.loads((base/"translation_report.json").read_text())
 targets=[r for r in rep["results"]if r.get("type_lift_coercions") and r["status"]=="TRANSLATED_AND_CHECKED"]
 if not targets:continue
 out=O/module;out.mkdir()
 for name in ["source.ndjson","contract.json","consumer_result.json"]:
  (out/name).write_bytes((base/name).read_bytes())
 for original in targets:
  assert original["protected"]
  root=original["source"];checked.append(root)
  wrappers=[n for n in walk(original["target_value"])if n.get("k")=="app" and n.get("f",{}).get("k")=="app" and n["f"].get("f",{}).get("n")in["PULift.up","PULift.down"]]
  assert wrappers,root
  for tag in ["missing-mode","wrong-payload","wrong-helper"]:
   bad=copy.deepcopy(rep);row=next(r for r in bad["results"]if r["source"]==root)
   if tag=="missing-mode":row["type_lift_coercions"]=0
   else:
    node=next(n for n in walk(row["target_value"])if n.get("k")=="app" and n.get("f",{}).get("k")=="app" and n["f"].get("f",{}).get("n")in["PULift.up","PULift.down"])
    if tag=="wrong-payload":node["a"]={"k":"natlit","v":773}
    else:node["f"]["f"]["n"]="Nat.succ"
   rc,probs=audit_report(out,bad,root.rsplit(".",1)[-1]+"-"+tag)
   assert rc==1 and any(p["message"].startswith(root+":")for p in probs),(root,tag,probs)
   mutations.append([root,tag])
 lean=out/"Clients.lean";lean.write_text("import Rocq2LeanOut\n"+"\n".join("#print axioms "+r["target"]for r in targets)+"\n")
 env=cli.lean_env();env["LEAN_PATH"]=str(T/".lake/build/lib/lean")+":"+str(base/"lean")
 with (out/"clients.log").open("w")as log:
  rc=subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(lean)],cwd=T,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300).returncode
 assert rc==0,(out/"clients.log").read_text()
 assert (out/"clients.log").read_text().count("does not depend on any axioms")==len(targets),(out/"clients.log").read_text()
assert len(checked)>=3
result={"status":"PASS","protected_core_clients":checked,"negative_controls":mutations,"axiom_free_definitions":len(checked)}
(O/"result.json").write_text(json.dumps(result,indent=2)+"\n");print(json.dumps(result),flush=True)

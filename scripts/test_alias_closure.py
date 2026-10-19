#!/usr/bin/env python3
import pathlib,sys,os,subprocess,json,copy
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();O=pathlib.Path(sys.argv[2]).resolve();RUN=pathlib.Path(sys.argv[3]).resolve()
O.mkdir(parents=True)
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli,audit
sys.path.insert(0,str(T/"tests"));from lib import audit_report
names={"CMorphisms":["PartialOrder_proper_type","flip_arrow","flip_respectful","proper_proper"],
 "CRelationClasses":["PartialOrder_inverse","partial_order_antisym"]}
newalias="Corelib.Classes.CRelationClasses.relation_equivalence"
negatives=[];checked=[];classifications=[]
for module,shorts in names.items():
 base=RUN/"Corelib/Classes"/module;out=O/module;out.mkdir()
 assert json.loads((base/"result.json").read_text())["checked"]
 assert json.loads((base/"audit.json").read_text())["status"]=="OK"
 rep=json.loads((base/"translation_report.json").read_text())
 src={d["name"]:d for l in (base/"source.ndjson").read_text().splitlines()if(d:=json.loads(l)).get("name")}
 assert audit.erasing_poly_body(src[newalias])is None
 assert audit.erasing_poly_closure(src)[newalias]==src[newalias]["body"]
 # Classification may open checked transparent abbreviations only.
 for tag in ["opaque-definition","absent-implementation"]:
  bad=copy.deepcopy(src)
  if tag=="opaque-definition":bad[newalias]["body_state"]="opaque_data"
  else:bad[newalias]["body"]=None
  assert newalias not in audit.erasing_poly_closure(bad)
  classifications.append([module,tag])
 for f in ["source.ndjson","contract.json","consumer_result.json"]:(out/f).write_bytes((base/f).read_bytes())
 targets=[next(d for d in rep["results"]if d["source"]=="Corelib.Classes."+module+"."+n)for n in shorts]
 for original in targets:
  root=original["source"]
  want="STATEMENT_KERNEL_CHECKED"if root.endswith(".flip_arrow")else"TRANSLATED_AND_CHECKED"
  assert original["protected"]and original["status"]==want and not original["pending_hypotheses"]
  assert newalias in original["delta_inlined"]
  assert not original["type_lift_coercions"]
  checked.append({"source":root,"status":want})
  for tag in ["changed-payload","missing-alias"]:
   bad=copy.deepcopy(rep);row=next(d for d in bad["results"]if d["source"]==root)
   if tag=="changed-payload":row["target_value"]={"k":"natlit","v":773}
   else:row["delta_inlined"].remove(newalias)
   rc,probs=audit_report(out,bad,root.rsplit(".",1)[-1]+"-"+tag)
   assert rc==1 and any(p["message"].startswith(root+":")for p in probs),(root,tag,probs)
   negatives.append([root,tag])
 lean=out/"Clients.lean";lean.write_text("import Rocq2LeanOut\n"+"\n".join("#print axioms "+d["target"]for d in targets)+"\n")
 env=cli.lean_env();env["LEAN_PATH"]=str(T/".lake/build/lib/lean")+":"+str(base/"lean")
 with(out/"clients.log").open("w")as log:
  rc=subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(lean)],cwd=T,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300).returncode
 assert rc==0,(out/"clients.log").read_text()
 assert (out/"clients.log").read_text().count("does not depend on any axioms")==len(targets)
result={"status":"PASS","protected_roots":checked,"negative_controls":negatives,"eligibility_controls":classifications,"axiom_free_definitions":5,"axiom_free_statement_definitions":1}
(O/"result.json").write_text(json.dumps(result,indent=2)+"\n");print(json.dumps(result),flush=True)

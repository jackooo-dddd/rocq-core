import pathlib,sys,json,copy,subprocess
T=pathlib.Path(sys.argv[1]);S=pathlib.Path(sys.argv[2]);O=pathlib.Path(sys.argv[3]);O.mkdir()
assert json.loads((S/"verify.json").read_text())["status"]=="VERIFIED"
rep=json.loads((S/"translation_report.json").read_text());pre="CoreHigherEqExplicit.Source."
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
env=cli.lean_env();env["LEAN_PATH"]=str(S/"lean")+":"+str(T/".lake/build/lib/lean")
def lean_run(file,log):
 with log.open("w")as f:
  return subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(file)],cwd=T,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=300).returncode
code=O/"Client.lean";code.write_text("""import Rocq2LeanOut
universe u
theorem operator_agrees (A : Type u) (x y : A) :
 Rocq.CoreHigherEqExplicit.Source.passed_equality.{u} A x y ↔ x = y := Iff.rfl
theorem translated_reflexivity (A : Type u) (x : A) : x = x :=
 Rocq.CoreHigherEqExplicit.Source.use_refl.{u} A x
#print axioms operator_agrees
#print axioms translated_reflexivity
#print axioms Rocq.CoreHigherEqExplicit.Source.equality_operator
#print axioms Rocq.CoreHigherEqExplicit.Source.passed_equality
#print axioms Rocq.CoreHigherEqExplicit.Source.use_refl
""")
assert lean_run(code,O/"client.log")==0,(O/"client.log").read_text()
assert (O/"client.log").read_text().count("does not depend on any axioms")==5
mut=[]
for tag in ["replace-equality-with-inequality","narrow-operator-universe"]:
 bad=copy.deepcopy(rep);name=pre+"equality_operator";row=next(r for r in bad["results"]if r["source"]==name)
 assert row["target_value"]["k"]=="const"and row["target_value"]["n"]=="Eq"
 if tag=="replace-equality-with-inequality":row["target_value"]["n"]="Ne"
 else:
  def narrow(e):
   if isinstance(e,dict):
    if e.get("k")=="param"and e.get("n")=="v_0":return {"k":"zero"}
    return {k:narrow(v)for k,v in e.items()}
   if isinstance(e,list):return [narrow(v)for v in e]
   return e
  row["target_type"]=narrow(row["target_type"]);row["target_value"]=narrow(row["target_value"])
 inp=O/(tag+".json");inp.write_text(json.dumps(bad));kernel=copy.deepcopy(bad)
 pos=next(i for i,r in enumerate(kernel["results"])if r["source"]==name);kernel["results"]=kernel["results"][:pos+1]
 kinp=O/(tag+"-replay.json");kinp.write_text(json.dumps(kernel));ko=O/(tag+"-kernel.json")
 lc=O/(tag+".lean");lc.write_text("import Rocq2Lean.Replay\n#rocq2lean_replay "+json.dumps(str(kinp))+" "+json.dumps(str(ko))+"\n")
 assert lean_run(lc,O/(tag+"-kernel.log"))==0,(O/(tag+"-kernel.log")).read_text()
 kr=json.loads(ko.read_text());assert all(x["kernel"]=="ACCEPTED"for x in kr["results"]),kr
 ao=O/(tag+"-audit.json")
 with(O/(tag+"-audit.log")).open("w")as log:
  rc=subprocess.run([sys.executable,"-I",str(T/"tools/audit.py"),str(S/"source.ndjson"),str(S/"contract.json"),str(inp),str(ao),str(S/"consumer_result.json")],stdout=log,stderr=subprocess.STDOUT).returncode
 aud=json.loads(ao.read_text());assert rc==1 and any(name in x["message"]for x in aud["problems"]),aud
 mut.append({"name":tag,"kernel":"ACCEPTED","audit":"REJECTED","kernel_prefix_records":len(kr["results"])})
 print(tag,"PASS",flush=True)
res={"status":"PASS","source_roots":5,"full_proof_verification":"VERIFIED","native_Lean_Eq_interoperation":"arbitrary universe","empty_axiom_closures":5,"mutations":mut}
(O/"result.json").write_text(json.dumps(res,indent=2)+"\n");print(json.dumps(res),flush=True)

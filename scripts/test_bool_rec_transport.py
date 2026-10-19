import pathlib,sys,json,copy,subprocess
T=pathlib.Path(sys.argv[1]).resolve();M=pathlib.Path(sys.argv[2]).resolve();O=pathlib.Path(sys.argv[3]).resolve();O.mkdir()
R=pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
v=json.loads((M/"result.json").read_text())["validation"];assert all(v[k]=="OK"for k in ["roundtrip","consumer","audit"])
rep=json.loads((M/"translation_report.json").read_text());name="Corelib.Init.Sumbool.bool_eq_rec"
row=next(d for d in rep["results"]if d["source"]==name)
assert row["status"]=="PENDING_KERNEL_CHECKED" and row["type_lift_coercions"]>0 and len(row["pending_hypotheses"])==2
assert row["level_params"]==[]
def lean(file,log):
 env=cli.lean_env();env["LEAN_PATH"]=str(M/"lean")+":"+str(T/".lake/build/lib/lean")
 with log.open("w")as f:return subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(file)],cwd=T,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=300).returncode
lc=O/"Client.lean";lc.write_text((R/"work/fixtures/bool-rec-client/Client.lean").read_text())
assert lean(lc,O/"client.log")==0,(O/"client.log").read_text()
assert (O/"client.log").read_text().count("does not depend on any axioms")==4
def walk(e):
 if isinstance(e,dict):
  yield e
  for v in list(e.values()):yield from walk(v)
 elif isinstance(e,list):
  for v in e:yield from walk(v)
controls=[]
for tag in ["hide-type-transport","hide-prerequisite","lower-native-body-bound","replace-computation-with-zero"]:
 bad=copy.deepcopy(rep);d=next(d for d in bad["results"]if d["source"]==name)
 if tag=="hide-type-transport":d["type_lift_coercions"]=0
 elif tag=="hide-prerequisite":d["pending_hypotheses"]=d["pending_hypotheses"][1:]
 elif tag=="lower-native-body-bound":
  found=[x for x in d["solved_levels"]if x["level"]=="Corelib.Init.Sumbool.32"]
  assert len(found)==1 and found[0]["sigma"]!={"k":"zero"}
  found[0]["sigma"]={"k":"zero"}
 else:
  ty=d["target_type"];value=d["target_value"]
  while ty.get("k")=="forall":
   assert value.get("k")=="lam"
   ty=ty["b"];value=value["b"]
  ty.clear();ty.update({"k":"const","n":"Nat","u":[]})
  value.clear();value.update({"k":"natlit","v":0})
 inp=O/(tag+".json");inp.write_text(json.dumps(bad))
 prefix=copy.deepcopy(bad);i=next(i for i,d in enumerate(prefix["results"])if d["source"]==name);prefix["results"]=prefix["results"][:i+1]
 kin=O/(tag+"-prefix.json");kin.write_text(json.dumps(prefix));ko=O/(tag+"-kernel.json");lc=O/(tag+"-replay.lean")
 lc.write_text("import Rocq2Lean.Replay\n#rocq2lean_replay "+json.dumps(str(kin))+" "+json.dumps(str(ko))+"\n")
 assert lean(lc,O/(tag+"-kernel.log"))==0,(O/(tag+"-kernel.log")).read_text()
 kr=json.loads(ko.read_text());assert all(d["kernel"]=="ACCEPTED"for d in kr["results"]),(tag,kr)
 ao=O/(tag+"-audit.json")
 with(O/(tag+"-audit.log")).open("w")as f:
  rc=subprocess.run([sys.executable,"-I",str(T/"tools/audit.py"),str(M/"source.ndjson"),str(M/"contract.json"),str(inp),str(ao),str(M/"consumer_result.json")],stdout=f,stderr=subprocess.STDOUT,timeout=300).returncode
 ar=json.loads(ao.read_text());assert rc!=0 and any(name in x["message"]for x in ar["problems"]),(tag,ar)
 controls.append({"name":tag,"kernel":"ACCEPTED","audit":"REJECTED"});print(tag,"PASS",flush=True)
res={"status":"PASS","conditional_prerequisites_proved":2,"original_Set_family_interface":True,"constructor_beta_laws":2,"empty_axiom_closures":4,"controls":controls}
(O/"result.json").write_text(json.dumps(res,indent=2)+"\n");print(json.dumps(res),flush=True)

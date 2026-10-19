import pathlib,sys,json,copy,subprocess
R=pathlib.Path(__file__).resolve().parents[1]
T=pathlib.Path(sys.argv[1]).resolve();S=pathlib.Path(sys.argv[2]).resolve();O=pathlib.Path(sys.argv[3]).resolve();O.mkdir()
validation=json.loads((S/"result.json").read_text())["validation"]
assert all(validation[k]=="OK"for k in ["roundtrip","consumer","audit"]),validation
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
pre="Corelib.Classes.CRelationClasses."
names=[pre+n for n in ["asymmetry","flip_Asymmetric","StrictOrder_Asymmetric"]]
src=[json.loads(l) for l in (S/"source.ndjson").read_text().splitlines()]
rows={d.get("name"):d for d in src}
for name in names:assert rows[name]["statement_prop_view"] and rows[name]["statement_prepared"] and rows[name]["body_state"]=="statement_only"
env=cli.lean_env();env["LEAN_PATH"]=str(S/"lean")+":"+str(T/".lake/build/lib/lean")
def lean_run(file,log):
 with log.open("w")as f:
  return subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(file)],cwd=T,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=300).returncode
code=O/"Client.lean";code.write_text("""import Rocq2LeanOut
universe u v w x z
theorem use_asymmetry : Rocq.Corelib.Classes.CRelationClasses.asymmetry.statement.{u,v,w} := by
 intro A R H x y hxy hyx
 exact (H x y hxy).down hyx
theorem use_flip : Rocq.Corelib.Classes.CRelationClasses.flip_Asymmetric.statement.{u,v,w,x,z} := by
 intro A R H x y hxy hyx
 exact (H y x hxy).down hyx
theorem use_strict_order : Rocq.Corelib.Classes.CRelationClasses.StrictOrder_Asymmetric.statement.{u,v,w} := by
 intro A R H x y hxy hyx
 exact @Rocq.Corelib.Classes.CRelationClasses.StrictOrder.rec _ _
  (fun _ => Rocq.Corelib.Init.Logic.False)
  (fun hirr htrans => (hirr x).down (htrans x y x hxy hyx)) H
#print axioms use_asymmetry
#print axioms use_flip
#print axioms use_strict_order
""")
assert lean_run(code,O/"client.log")==0,(O/"client.log").read_text()
assert (O/"client.log").read_text().count("does not depend on any axioms")==3
rep=json.loads((S/"translation_report.json").read_text());mut=[]
for tag in ["weaken-view-conclusion","drop-view-premise"]:
 bad=copy.deepcopy(rep);name=pre+"StrictOrder_Asymmetric";row=next(r for r in bad["results"]if r["source"]==name)
 assert row["status"]=="STATEMENT_KERNEL_CHECKED"
 e=row["target_value"]
 while e.get("k")=="forall" and e["b"].get("k")=="forall":e=e["b"]
 assert e["k"]=="forall" and e["b"].get("n")=="Rocq.Corelib.Init.Logic.False"
 if tag=="weaken-view-conclusion":e["b"]={"k":"const","n":"True","u":[]}
 else:
  body=e["b"];e.clear();e.update(body)
 inp=O/(tag+".json");inp.write_text(json.dumps(bad))
 kernel=copy.deepcopy(bad);pos=next(i for i,r in enumerate(kernel["results"])if r["source"]==name);kernel["results"]=kernel["results"][:pos+1]
 kinp=O/(tag+"-replay.json");kinp.write_text(json.dumps(kernel));ko=O/(tag+"-kernel.json");lc=O/(tag+".lean")
 lc.write_text("import Rocq2Lean.Replay\n#rocq2lean_replay "+json.dumps(str(kinp))+" "+json.dumps(str(ko))+"\n")
 assert lean_run(lc,O/(tag+"-kernel.log"))==0,(O/(tag+"-kernel.log")).read_text()
 kr=json.loads(ko.read_text());assert all(x["kernel"]=="ACCEPTED"for x in kr["results"]),kr
 ao=O/(tag+"-audit.json")
 with(O/(tag+"-audit.log")).open("w")as log:
  rc=subprocess.run([sys.executable,"-I",str(T/"tools/audit.py"),str(S/"source.ndjson"),str(S/"contract.json"),str(inp),str(ao),str(S/"consumer_result.json")],stdout=log,stderr=subprocess.STDOUT).returncode
 aud=json.loads(ao.read_text());assert rc==1 and any(name in x["message"]for x in aud["problems"]),aud
 mut.append({"name":tag,"kernel":"ACCEPTED","audit":"REJECTED"})
 print(tag,"PASS",flush=True)
# A fresh source process must independently rederive both the view and its report.
for tag in ["hide-native-view","change-native-view-conclusion"]:
 bad=copy.deepcopy(src);row=next(d for d in bad if d.get("name")==pre+"StrictOrder_Asymmetric")
 if tag=="hide-native-view":row["statement_prop_view"]=False
 else:
  e=row["type"]
  while e["k"]=="prod":e=e["b"]
  assert e["k"]=="ind" and e["ind"]["mind"]=="Corelib.Init.Logic.False"
  e["ind"]["mind"]="Corelib.Init.Logic.True"
 inp=O/(tag+".ndjson");inp.write_text("".join(json.dumps(d)+"\n"for d in bad));out=O/(tag+"-roundtrip")
 with(O/(tag+"-roundtrip.log")).open("w")as log:
  rc=subprocess.run([sys.executable,"-I",str(T/"tools/roundtrip.py"),str(inp),str(out),"--","Corelib.Classes.CRelationClasses"],cwd=T,env=cli.opam_env(),stdout=log,stderr=subprocess.STDOUT,timeout=300).returncode
 result=json.loads((out/"roundtrip.json").read_text())
 assert rc!=0 and result["status"]!="OK",result
 assert "RT_STATEMENT_MISMATCH" in json.dumps(result),result
 mut.append({"name":tag,"source_roundtrip":"REJECTED"})
 print(tag,"PASS",flush=True)
res={"status":"PASS","native_lean_proofs_at_arbitrary_universes":3,"empty_axiom_closures":3,"source_views":names,"mutations":mut}
(O/"result.json").write_text(json.dumps(res,indent=2)+"\n");print(json.dumps(res),flush=True)

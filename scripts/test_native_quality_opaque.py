import pathlib,sys,json,copy,subprocess
T=pathlib.Path(sys.argv[1]).resolve();S=pathlib.Path(sys.argv[2]).resolve();O=pathlib.Path(sys.argv[3]).resolve();O.mkdir()
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
P=S/"proof"
assert json.loads((P/"verify.json").read_text())["status"]=="VERIFIED"
assert json.loads((S/"statement/validate.json").read_text())["status"]=="STATEMENT_VALIDATED"
def run(args,log,env=None):
 with log.open("w")as f:return subprocess.run(list(map(str,args)),cwd=T,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=300).returncode
def lean(file,log):
 env=cli.lean_env();env["LEAN_PATH"]=str(P/"lean")+":"+str(T/".lake/build/lib/lean")
 return run([pathlib.Path.home()/".elan/bin/lean",*cli.native_args(),file],log,env)
src=[json.loads(l)for l in(P/"source.ndjson").read_text().splitlines()]
rep=json.loads((P/"translation_report.json").read_text());name="NativeQualityOpaque.Source.opaque_data"
d=next(d for d in src if d.get("name")==name)
assert d["quality_dispatch"] and d["body_state"]=="opaque_present" and d["native"]["body_kind"]=="opaque"
assert not d["native"]["prepared"]["lowered_ssr_have_upoly"]
lc=O/"Client.lean";lc.write_text("""import Rocq2LeanOut
universe u v
noncomputable def use_opaque (A : Type u) (B : Type v) (x : A) (f : A → B) : B :=
 Rocq.NativeQualityOpaque.Source.opaque_data.{u,v} A B x f
#print axioms use_opaque
#print axioms Rocq.NativeQualityOpaque.Source.opaque_data
#print axioms Rocq.NativeQualityOpaque.Source.opaque_proof
""")
assert lean(lc,O/"client.log")==0,(O/"client.log").read_text()
assert(O/"client.log").read_text().count("does not depend on any axioms")==3
lc=O/"Opacity.lean";lc.write_text("""import Rocq2LeanOut
universe u v
example (A : Type u) (B : Type v) (x : A) (f : A → B) :
 Rocq.NativeQualityOpaque.Source.opaque_data.{u,v} A B x f = f x := by rfl
""")
assert lean(lc,O/"opacity.log")!=0
assert "rfl" in(O/"opacity.log").read_text()
controls=[]
for mode in ["proof","statement"]:
 p=S/mode;rows=[json.loads(l)for l in(p/"source.ndjson").read_text().splitlines()]
 d=next(d for d in rows if d.get("name")==name);e=d["body"]
 while e["k"]=="lam":e=e["b"]
 assert e["k"]=="app"and e["f"].get("c")=="Corelib.ssr.ssreflect_rw.ssr_have_upoly"
 e.clear();e.update({"k":"app","f":{"k":"rel","i":0},"args":[{"k":"rel","i":1}]})
 d["deps"]["body"]=[]
 inp=O/(mode+"-source-inline.ndjson");inp.write_text("".join(json.dumps(d)+"\n"for d in rows));out=O/(mode+"-roundtrip")
 fixture=S.parents[1]/"fixtures/native-quality-opaque-client"
 rc=run([sys.executable,"-I",T/"tools/roundtrip.py",inp,out,"-Q",fixture,"NativeQualityOpaque","--","NativeQualityOpaque.Source"],O/(mode+"-source.log"),cli.opam_env())
 result=json.loads((out/"roundtrip.json").read_text())
 assert rc!=0 and ("RT_PREPARED_MISMATCH"if mode=="proof"else"RT_STATEMENT_MISMATCH")in json.dumps(result),(mode,result)
 controls.append({"name":mode+"-source-inline-opaque-call","source_roundtrip":"REJECTED"});print(mode,"source PASS",flush=True)
for tag in ["inline-opaque-call","make-wrapper-transparent"]:
 bad=copy.deepcopy(rep);row=next(d for d in bad["results"]if d["source"]==name)
 if tag=="make-wrapper-transparent":row["target_kind"]="def"
 else:
  e=row["target_value"]
  while e["k"]=="lam":e=e["b"]
  assert e["k"]=="app"
  e.clear();e.update({"k":"app","f":{"k":"bvar","i":0},"a":{"k":"bvar","i":1}})
 inp=O/(tag+".json");inp.write_text(json.dumps(bad));ko=O/(tag+"-kernel.json");lc=O/(tag+"-replay.lean")
 lc.write_text("import Rocq2Lean.Replay\n#rocq2lean_replay "+json.dumps(str(inp))+" "+json.dumps(str(ko))+"\n")
 assert lean(lc,O/(tag+"-kernel.log"))==0,(O/(tag+"-kernel.log")).read_text()
 kr=json.loads(ko.read_text());assert all(d["kernel"]=="ACCEPTED"for d in kr["results"]),(tag,kr)
 ao=O/(tag+"-audit.json")
 rc=run([sys.executable,"-I",T/"tools/audit.py",P/"source.ndjson",P/"contract.json",inp,ao,P/"consumer_result.json"],O/(tag+"-audit.log"))
 ar=json.loads(ao.read_text());assert rc!=0 and any(name in x["message"]for x in ar["problems"]),(tag,ar)
 controls.append({"name":tag,"kernel":"ACCEPTED","audit":"REJECTED"});print(tag,"PASS",flush=True)
res={"status":"PASS","arbitrary_universe_client":1,"empty_axiom_closures":3,"opaque_unfolding":"REJECTED","controls":controls}
(O/"result.json").write_text(json.dumps(res,indent=2)+"\n");print(json.dumps(res),flush=True)

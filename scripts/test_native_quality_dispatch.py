import pathlib,sys,json,copy,subprocess
T=pathlib.Path(sys.argv[1]).resolve();S=pathlib.Path(sys.argv[2]).resolve();O=pathlib.Path(sys.argv[3]).resolve();O.mkdir()
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
P=S/"proof";V=S/"statement"
assert json.loads((P/"verify.json").read_text())["status"]=="VERIFIED"
assert json.loads((V/"validate.json").read_text())["status"]=="STATEMENT_VALIDATED"
def run(args,log,env=None):
 with log.open("w")as f:return subprocess.run(list(map(str,args)),cwd=T,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=300).returncode
def lean(file,log):
 env=cli.lean_env();env["LEAN_PATH"]=str(P/"lean")+":"+str(T/".lake/build/lib/lean")
 return run([pathlib.Path.home()/".elan/bin/lean",*cli.native_args(),file],log,env)
def walk(e):
 if isinstance(e,dict):
  yield e
  for x in e.values():yield from walk(x)
 elif isinstance(e,list):
  for x in e:yield from walk(x)
pre="NativeQualityDispatch.Source."
src=[json.loads(l)for l in(P/"source.ndjson").read_text().splitlines()]
rep=json.loads((P/"translation_report.json").read_text())
rows={d.get("name"):d for d in src}
for stem,n in [("refl",2),("j",3),("have",2)]:
 import itertools
 for qs in itertools.product("SPT",repeat=n):
  name=pre+"bare_"+stem+"_"+"".join(qs);d=rows[name]
  assert d["quality_dispatch"],name
  source=dict(refl="Corelib.Init.Equality.Has_refl",j="Corelib.Init.Equality.Has_J",have="Corelib.ssr.ssreflect_rw.ssr_have_upoly")[stem]
  want=source if all(q=="T"for q in qs)else source+"__rocq2lean_quality_"+"".join(qs)
  assert d["body"]["k"]=="const"and d["body"]["c"]==want,(name,d["body"])
  assert d["body"]["u"]==[{"k":"var","i":i}for i in range(n)]
client=O/"Client.lean";client.write_text("""import Rocq2LeanOut
universe u v
theorem reflected_refl_shape (E : (A : Type u) → A → A → Prop) :
 Rocq.NativeQualityDispatch.Source.bare_refl_TP.{u,v} E =
 (∀ (A : Type u) (x : A), E A x x) := rfl
noncomputable def call_translated_have (A : Type u) (B : Type v) (x : A) (f : A → B) : B :=
 Rocq.NativeQualityDispatch.Source.partial_have_Type.{u,v} A B x f
theorem call_translated_have_prop (_phantom : Type v) (A : Type u) (P : Prop) (x : A) (f : A → P) : P :=
 Rocq.NativeQualityDispatch.Source.bare_have_TP.{u,v} A P x f
#print axioms reflected_refl_shape
#print axioms call_translated_have
#print axioms call_translated_have_prop
""")
assert lean(client,O/"client.log")==0,(O/"client.log").read_text()
assert(O/"client.log").read_text().count("does not depend on any axioms")==3
opaque=O/"Opacity.lean";opaque.write_text("""import Rocq2LeanOut
universe u v
example (A : Type u) (B : Type v) (x : A) (f : A → B) :
 Rocq.NativeQualityDispatch.Source.partial_have_Type.{u,v} A B x f = f x := by rfl
""")
assert lean(opaque,O/"opacity.log")!=0,"opaque source reference unfolded"
assert "rfl" in(O/"opacity.log").read_text()
results=[]
for tag in ["source-wrong-quality-same-lean-sort","source-wrong-unused-level","hide-dispatch-marker"]:
 bad=copy.deepcopy(src);name=pre+("bare_refl_SS"if tag=="source-wrong-quality-same-lean-sort"else"bare_refl_PP")
 d=next(d for d in bad if d.get("name")==name)
 if tag=="source-wrong-quality-same-lean-sort":
  d["body"]["c"]="Corelib.Init.Equality.Has_refl__rocq2lean_quality_PP"
  d["deps"]["body"]=[d["body"]["c"]]
 elif tag=="source-wrong-unused-level":d["body"]["u"].reverse()
 else:d["quality_dispatch"]=False
 inp=O/(tag+".ndjson");inp.write_text("".join(json.dumps(d)+"\n"for d in bad));out=O/(tag+"-roundtrip")
 fixture=S.parents[1]/"fixtures/native-quality-dispatch"
 rc=run([sys.executable,"-I",T/"tools/roundtrip.py",inp,out,"-Q",fixture,"NativeQualityDispatch","--","NativeQualityDispatch.Source"],O/(tag+".log"),cli.opam_env())
 result=json.loads((out/"roundtrip.json").read_text())
 assert rc!=0 and result["status"]!="OK",(tag,result)
 if tag=="hide-dispatch-marker":
  assert name+": NOT_CHECKED" in result["problems"],result
  assert "Quoting sort polymorphic instances not yet supported" in (out/"logs/roundtrip.log").read_text()
 else:
  assert "RT_PREPARED_MISMATCH" in json.dumps(result),(tag,result)
 results.append({"name":tag,"source_roundtrip":"REJECTED"});print(tag,"PASS",flush=True)
for tag in ["target-wrong-quality-same-lean-sort","target-wrong-unused-level","inline-opaque-source"]:
 bad=copy.deepcopy(rep);name=pre+("bare_refl_SS"if tag=="target-wrong-quality-same-lean-sort"else"bare_refl_PP"if tag=="target-wrong-unused-level"else"bare_have_TT")
 row=next(d for d in bad["results"]if d["source"]==name)
 if tag=="target-wrong-quality-same-lean-sort":
  e=next(e for e in walk(row["target_value"])if e.get("k")=="const"and"Has_refl" in e.get("n",""))
  assert e["n"].endswith("_SS");e["n"]=e["n"][:-2]+"PP"
 elif tag=="target-wrong-unused-level":
  e=next(e for e in walk(row["target_value"])if e.get("k")=="const"and"Has_refl" in e.get("n",""));e["u"].reverse()
 else:row["target_value"]=copy.deepcopy(next(d for d in bad["results"]if d["source"]=="Corelib.ssr.ssreflect_rw.ssr_have_upoly")["target_value"])
 inp=O/(tag+".json");inp.write_text(json.dumps(bad));ko=O/(tag+"-kernel.json");lc=O/(tag+"-replay.lean")
 lc.write_text("import Rocq2Lean.Replay\n#rocq2lean_replay "+json.dumps(str(inp))+" "+json.dumps(str(ko))+"\n")
 assert lean(lc,O/(tag+"-kernel.log"))==0,(O/(tag+"-kernel.log")).read_text()
 kr=json.loads(ko.read_text());assert all(d["kernel"]=="ACCEPTED"for d in kr["results"]),(tag,kr)
 ao=O/(tag+"-audit.json")
 rc=run([sys.executable,"-I",T/"tools/audit.py",P/"source.ndjson",P/"contract.json",inp,ao,P/"consumer_result.json"],O/(tag+"-audit.log"))
 ar=json.loads(ao.read_text());assert rc!=0 and any(name in p["message"]for p in ar["problems"]),(tag,ar)
 results.append({"name":tag,"kernel":"ACCEPTED","audit":"REJECTED"});print(tag,"PASS",flush=True)
res={"status":"PASS","source_instance_dispatch_checked":45,"arbitrary_universe_lean_clients":3,"empty_axiom_closures":3,"opaque_reference_unfolding":"REJECTED","controls":results}
(O/"result.json").write_text(json.dumps(res,indent=2)+"\n");print(json.dumps(res),flush=True)

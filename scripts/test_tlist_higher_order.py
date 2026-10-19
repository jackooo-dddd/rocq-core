import pathlib,sys,json,copy,subprocess
R=pathlib.Path(__file__).resolve().parents[1]
T=pathlib.Path(sys.argv[1]);S=pathlib.Path(sys.argv[2]);O=pathlib.Path(sys.argv[3]);O.mkdir()
validation=json.loads((S/"result.json").read_text())["validation"]
assert all(validation[k]=="OK"for k in ["roundtrip","consumer","audit"]),validation
rep=json.loads((S/"translation_report.json").read_text());pre="Corelib.Classes.RelationClasses."
rows={r["source"]:r for r in rep["results"]}
names=["relation_equivalence"]
for n in names:assert rows[pre+n]["status"]=="TRANSLATED_AND_CHECKED"and rows[pre+n]["protected"]
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
env=cli.lean_env();env["LEAN_PATH"]=str(S/"lean")+":"+str(T/".lake/build/lib/lean")
def lean_run(file,log):
 with log.open("w")as f:
  return subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(file)],cwd=T,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=300).returncode
code=O/"Beta.lean";code.write_text("""import Rocq2LeanOut
universe u
theorem binary_relation_equivalence (A : Type u) (R S : A → A → Prop) :
 Rocq.Corelib.Classes.RelationClasses.relation_equivalence.{u} A R S =
 (∀ x y : A, Rocq.Corelib.Init.Logic.iff (R x y) (S x y)) := rfl
#print axioms binary_relation_equivalence
#print axioms Rocq.Corelib.Classes.RelationClasses.relation_equivalence
""")
assert lean_run(code,O/"beta.log")==0,(O/"beta.log").read_text()
assert (O/"beta.log").read_text().count("does not depend on any axioms")==2
def walk(e):
 if isinstance(e,dict):
  yield e
  for v in list(e.values()):yield from walk(v)
 elif isinstance(e,list):
  for v in e:yield from walk(v)
def unspine(e):
 args=[]
 while e["k"]=="app":args.insert(0,e["a"]);e=e["f"]
 return e,args
def app(h,args):
 for a in args:h={"k":"app","f":h,"a":a}
 return h
mut=[]
for tag in ["discard-higher-order-payload","swap-nested-arguments"]:
 bad=copy.deepcopy(rep);name=pre+"relation_equivalence";row=next(r for r in bad["results"]if r["source"]==name)
 hits=[]
 for e in walk(row["target_value"]):
  if e.get("k")=="app":
   h,a=unspine(e)
   if h.get("n")=="PULift.up"and len(a)==2 and a[-1].get("k")=="app":
    f,ys=unspine(a[-1])
    if f.get("k")=="bvar"and ys==[{"k":"bvar","i":1},{"k":"bvar","i":0}]:hits.append(a[-1])
 assert len(hits)==2,len(hits)
 body=hits[0]
 if tag=="discard-higher-order-payload":
  body.clear();body.update({"k":"const","n":"True","u":[]})
 else:
  h,a=unspine(body);v=app(h,[a[1],a[0]]);body.clear();body.update(v)
 inp=O/(tag+".json");inp.write_text(json.dumps(bad))
 kernel=copy.deepcopy(bad);pos=next(i for i,r in enumerate(kernel["results"])if r["source"]==name)
 kernel["results"]=kernel["results"][:pos+1]
 kinp=O/(tag+"-replay.json");kinp.write_text(json.dumps(kernel))
 ko=O/(tag+"-kernel.json");lc=O/(tag+".lean")
 lc.write_text("import Rocq2Lean.Replay\n#rocq2lean_replay "+json.dumps(str(kinp))+" "+json.dumps(str(ko))+"\n")
 assert lean_run(lc,O/(tag+"-kernel.log"))==0,(O/(tag+"-kernel.log")).read_text()
 kr=json.loads(ko.read_text());assert all(x["kernel"]=="ACCEPTED"for x in kr["results"]),kr
 ao=O/(tag+"-audit.json")
 with(O/(tag+"-audit.log")).open("w")as log:
  rc=subprocess.run([sys.executable,"-I",str(T/"tools/audit.py"),str(S/"source.ndjson"),str(S/"contract.json"),str(inp),str(ao),str(S/"consumer_result.json")],stdout=log,stderr=subprocess.STDOUT).returncode
 aud=json.loads(ao.read_text());assert rc==1 and any(name in x["message"]for x in aud["problems"]),aud
 mut.append({"name":tag,"kernel":"ACCEPTED","kernel_prefix_records":len(kr["results"]),"audit":"REJECTED"})
 print(tag,"PASS",flush=True)
res={"status":"PASS","new_actual_core_declarations":names,"arbitrary_universe_beta_laws":1,"empty_axiom_closures":2,"mutations":mut}
(O/"result.json").write_text(json.dumps(res,indent=2)+"\n");print(json.dumps(res),flush=True)

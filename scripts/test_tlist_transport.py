import pathlib,sys,json,copy,subprocess
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]);S=pathlib.Path(sys.argv[2]);O=pathlib.Path(sys.argv[3]);O.mkdir()
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
assert json.loads((S/"validate.json").read_text())["status"]=="STATEMENT_VALIDATED"
rep=json.loads((S/"translation_report.json").read_text());rows={r["source"]:r for r in rep["results"]};pre="CoreTlistFrontier.Source."
for n in ["Tlist","arrows","predicate","extension","intersection"]:
 assert rows[pre+n]["protected"]and rows[pre+n]["status"]=="TRANSLATED_AND_CHECKED",n
ar=rows[pre+"arrows"];assert len(ar["level_params"])==3 and ar["type_lift_coercions"]>0
env=cli.lean_env();env["LEAN_PATH"]=str(S/"lean")+":"+str(T/".lake/build/lib/lean")
def lean_run(file,log):
 with log.open("w")as f:
  return subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(file)],cwd=T,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=300).returncode
code=O/"Beta.lean";code.write_text("""import Rocq2LeanOut
universe u v w
noncomputable section
example (l : Rocq.CoreTlistFrontier.Source.Tlist.{u}) : Type u := Rocq.CoreTlistFrontier.Source.arrows.{u,0,0} l Prop
theorem nil_type (T : Type v) :
  Rocq.CoreTlistFrontier.Source.arrows.{u,v,w} Rocq.CoreTlistFrontier.Source.Tlist.Tnil T = PULift.{max u v w + 1,v + 1} T := rfl
theorem cons_type (A : Type u) (l : Rocq.CoreTlistFrontier.Source.Tlist.{u}) (T : Type v) :
  Rocq.CoreTlistFrontier.Source.arrows.{u,v,w} (Rocq.CoreTlistFrontier.Source.Tlist.Tcons A l) T =
    PULift.{max u v w + 1,max u v w + 1} (A → Rocq.CoreTlistFrontier.Source.arrows.{u,v,w} l T) := rfl
#print axioms nil_type
#print axioms cons_type
#print axioms Rocq.CoreTlistFrontier.Source.arrows
#print axioms Rocq.CoreTlistFrontier.Source.extension
""")
assert lean_run(code,O/"beta.log")==0,(O/"beta.log").read_text()
assert (O/"beta.log").read_text().count("does not depend on any axioms")==4
def unspine(e):
 args=[]
 while e["k"]=="app":args.insert(0,e["a"]);e=e["f"]
 return e,args
def app(h,args):
 for a in args:h={"k":"app","f":h,"a":a}
 return h
mut=[]
for tag in ["wrong-type-payload","hidden-branch-transport","swapped-operands"]:
 bad=copy.deepcopy(rep);name=pre+("extension"if tag=="swapped-operands"else"arrows")
 row=next(r for r in bad["results"]if r["source"]==name)
 cur=row["target_value"]
 while cur["k"]=="lam":cur=cur["b"]
 h,sp=unspine(cur);assert h["n"].endswith(".Tlist.rec"),h
 minor=sp[1]
 while minor["k"]=="lam":minor=minor["b"]
 if tag=="wrong-type-payload":
  assert minor["f"]["n"]=="PULift"
  minor["a"]={"k":"const","n":"Nat","u":[]}
  minor["f"]["u"][1]={"k":"succ","l":{"k":"zero"}}
 elif tag=="hidden-branch-transport":row["type_lift_coercions"]=0
 else:
  ph,pa=unspine(minor);assert ph["n"]=="PULift.up",ph
  payload=pa[-1];fh,fa=unspine(payload);assert len(fa)==2
  swapped=app(fh,[fa[1],fa[0]]);payload.clear();payload.update(swapped)
 inp=O/(tag+".json");inp.write_text(json.dumps(bad));kernel=copy.deepcopy(bad)
 if tag=="wrong-type-payload":
  # The type family itself stays well typed; its changed computation can make
  # later clients ill typed, so replay the declaration with its exact prefix.
  pos=next(i for i,r in enumerate(kernel["results"])if r["source"]==name)
  kernel["results"]=kernel["results"][:pos+1]
 kinp=O/(tag+"-replay.json");kinp.write_text(json.dumps(kernel));out=O/(tag+"-kernel.json")
 code=O/(tag+".lean");code.write_text("import Rocq2Lean.Replay\n#rocq2lean_replay "+json.dumps(str(kinp))+" "+json.dumps(str(out))+"\n")
 assert lean_run(code,O/(tag+"-kernel.log"))==0,(O/(tag+"-kernel.log")).read_text()
 kr=json.loads(out.read_text());assert all(x["kernel"]=="ACCEPTED"for x in kr["results"]),kr
 ao=O/(tag+"-audit.json")
 with(O/(tag+"-audit.log")).open("w")as f:
  rc=subprocess.run([sys.executable,"-I",str(T/"tools/audit.py"),str(S/"source.ndjson"),str(S/"contract.json"),str(inp),str(ao),str(S/"consumer_result.json")],stdout=f,stderr=subprocess.STDOUT).returncode
 aud=json.loads(ao.read_text());assert rc==1 and any(name in x["message"]for x in aud["problems"]),aud
 mut.append({"name":tag,"kernel":"ACCEPTED","kernel_records":len(kr["results"]),"audit":"REJECTED"});print(tag,"PASS",flush=True)
res={"status":"PASS","protected_fixture_declarations":5,"independent_universe_prop_client":"CHECKED","arbitrary_universe_type_beta_laws":2,"empty_axiom_closures":4,"mutations":mut,"scope":"test-only protection superset; no production coverage claim"}
(O/"result.json").write_text(json.dumps(res,indent=2)+"\n");print(json.dumps(res),flush=True)

import pathlib,sys,json,copy,subprocess
R=pathlib.Path(__file__).resolve().parents[1]
T=pathlib.Path(sys.argv[1]);S=pathlib.Path(sys.argv[2]);O=pathlib.Path(sys.argv[3]);O.mkdir()
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
validation=json.loads((S/"result.json").read_text())["validation"]
assert all(validation[k]=="OK" for k in ["roundtrip","consumer","audit"]),validation
rep=json.loads((S/"translation_report.json").read_text());rows={r["source"]:r for r in rep["results"]}
pre="Corelib.Classes.RelationClasses."
names=["predicate_all","predicate_exists","predicate_intersection","predicate_union","relation_conjunction","relation_disjunction"]
for n in names:assert rows[pre+n]["status"]=="TRANSLATED_AND_CHECKED" and rows[pre+n]["protected"]
env=cli.lean_env();env["LEAN_PATH"]=str(S/"lean")+":"+str(T/".lake/build/lib/lean")
def lean_run(file,log):
 with log.open("w")as f:
  return subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(file)],cwd=T,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=300).returncode
code=O/"Beta.lean";code.write_text("""import Rocq2LeanOut
universe u
noncomputable section
abbrev TL := Rocq.Corelib.Classes.RelationClasses.Tlist
abbrev Ar := Rocq.Corelib.Classes.RelationClasses.arrows
abbrev TlistInter := Rocq.Corelib.Classes.RelationClasses.predicate_intersection
abbrev Ex := Rocq.Corelib.Classes.RelationClasses.predicate_exists
theorem inter_nil (p q : Prop) :
 TlistInter.{u} Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil (PULift.up p) (PULift.up q) =
 PULift.up (Rocq.Corelib.Init.Logic.and p q) := rfl
theorem inter_cons (A : Type u) (l : TL.{u})
 (f g : A → Ar.{u} l (PULift.{u+1,1} Prop)) :
 TlistInter.{u} (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons A l) f g = (fun x => TlistInter.{u} l (f x) (g x)) := rfl
theorem exists_nil (p : Prop) : Ex.{u} Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil (PULift.up p) = p := rfl
theorem exists_cons (A : Type u) (l : TL.{u})
 (f : A → Ar.{u} l (PULift.{u+1,1} Prop)) :
 Ex.{u} (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons A l) f = Rocq.Corelib.Init.Logic.ex A (fun x => Ex.{u} l (f x)) := rfl
#print axioms inter_nil
#print axioms inter_cons
#print axioms exists_nil
#print axioms exists_cons
"""+ "\n".join("#print axioms Rocq."+pre+n for n in names)+"\n")
assert lean_run(code,O/"beta.log")==0,(O/"beta.log").read_text()
assert (O/"beta.log").read_text().count("does not depend on any axioms")==10
def unspine(e):
 args=[]
 while e["k"]=="app":args.insert(0,e["a"]);e=e["f"]
 return e,args
def walk(e):
 if isinstance(e,dict):
  yield e
  for v in list(e.values()):yield from walk(v)
 elif isinstance(e,list):
  for v in e:yield from walk(v)
def app(f,args):
 for a in args:f={"k":"app","f":f,"a":a}
 return f
mut=[]
for tag in ["wrong-type-payload","hidden-argument-transport","swapped-connective-operands","wrong-domain-universe"]:
 bad=copy.deepcopy(rep);name=pre+("predicate_intersection"if tag=="swapped-connective-operands"else"binary_relation")
 row=next(r for r in bad["results"]if r["source"]==name)
 if tag=="hidden-argument-transport":row["type_lift_coercions"]=0
 elif tag=="swapped-connective-operands":
  hits=[e for e in walk(row["target_value"])if e.get("k")=="app"and unspine(e)[0].get("n")=="Rocq.Corelib.Init.Logic.and"and len(unspine(e)[1])==2]
  assert len(hits)==1
  e=hits[0];h,a=unspine(e);v=app(h,[a[1],a[0]]);e.clear();e.update(v)
 else:
  hits=[e for e in walk(row["target_value"])if e.get("k")=="app"and e.get("f",{}).get("n")=="PULift"and e["a"]=={"k":"sort","l":{"k":"zero"}}]
  assert len(hits)==1
  if tag=="wrong-type-payload":hits[0]["a"]={"k":"const","n":"Nat","u":[]}
  else:hits[0]["f"]["u"][0]={"k":"succ","l":hits[0]["f"]["u"][0]}
 inp=O/(tag+".json");inp.write_text(json.dumps(bad))
 kernel=copy.deepcopy(bad);pos=next(i for i,r in enumerate(kernel["results"])if r["source"]==name)
 kernel["results"]=kernel["results"][:pos+1]
 kinp=O/(tag+"-replay.json");kinp.write_text(json.dumps(kernel))
 out=O/(tag+"-kernel.json");lc=O/(tag+".lean")
 lc.write_text("import Rocq2Lean.Replay\n#rocq2lean_replay "+json.dumps(str(kinp))+" "+json.dumps(str(out))+"\n")
 rc=lean_run(lc,O/(tag+"-kernel.log"));kr=json.loads(out.read_text())
 verdict=next(x["kernel"]for x in kr["results"]if x["source"]==name)
 if tag!="wrong-domain-universe":assert rc==0 and verdict=="ACCEPTED",kr
 else:assert verdict=="REJECTED",kr
 ao=O/(tag+"-audit.json")
 with(O/(tag+"-audit.log")).open("w")as log:
  rc=subprocess.run([sys.executable,"-I",str(T/"tools/audit.py"),str(S/"source.ndjson"),str(S/"contract.json"),str(inp),str(ao),str(S/"consumer_result.json")],stdout=log,stderr=subprocess.STDOUT).returncode
 aud=json.loads(ao.read_text())
 assert rc==1 and any(name in x["message"]for x in aud["problems"]),aud
 mut.append({"name":tag,"kernel":verdict,"kernel_prefix_records":len(kr["results"]),"audit":"REJECTED"})
 print(tag,"PASS",flush=True)
res={"status":"PASS","new_actual_core_declarations":names,"arbitrary_universe_beta_laws":4,"empty_axiom_closures":10,"mutations":mut}
(O/"result.json").write_text(json.dumps(res,indent=2)+"\n");print(json.dumps(res),flush=True)

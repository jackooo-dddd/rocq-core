import pathlib,sys,json,copy,subprocess
T=pathlib.Path(sys.argv[1]).resolve();S=pathlib.Path(sys.argv[2]).resolve();O=pathlib.Path(sys.argv[3]).resolve();O.mkdir()
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
v=json.loads((S/"result.json").read_text())["validation"];assert all(v[k]=="OK"for k in ["roundtrip","consumer","audit"])
rep=json.loads((S/"translation_report.json").read_text());pre="Corelib.Classes.RelationClasses."
for n in ["true_predicate","false_predicate"]:
 row=next(d for d in rep["results"]if d["source"]==pre+n)
 assert row["status"]=="TRANSLATED_AND_CHECKED"and row["protected"]and row["implicit_levels"]==[pre+"72"]
 assert row["level_params"]==["u_Corelib_Classes_RelationClasses_72"]and row["type_lift_coercions"]>0
def lean(file,log):
 env=cli.lean_env();env["LEAN_PATH"]=str(S/"lean")+":"+str(T/".lake/build/lib/lean")
 with log.open("w")as f:return subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(file)],cwd=T,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=300).returncode
lc=O/"Beta.lean";lc.write_text("""import Rocq2LeanOut
universe u
noncomputable section
abbrev TL := Rocq.Corelib.Classes.RelationClasses.Tlist
abbrev TP := Rocq.Corelib.Classes.RelationClasses.true_predicate
abbrev FP := Rocq.Corelib.Classes.RelationClasses.false_predicate
theorem true_nil :
 TP.{u} Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil = PULift.up Rocq.Corelib.Init.Logic.True := rfl
theorem false_nil :
 FP.{u} Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil = PULift.up Rocq.Corelib.Init.Logic.False := rfl
theorem true_cons (A : Type u) (l : TL.{u}) :
 TP.{u} (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons A l) = (fun _ : A => TP.{u} l) := rfl
theorem false_cons (A : Type u) (l : TL.{u}) :
 FP.{u} (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons A l) = (fun _ : A => FP.{u} l) := rfl
#print axioms true_nil
#print axioms false_nil
#print axioms true_cons
#print axioms false_cons
#print axioms Rocq.Corelib.Classes.RelationClasses.true_predicate
#print axioms Rocq.Corelib.Classes.RelationClasses.false_predicate
""")
assert lean(lc,O/"beta.log")==0,(O/"beta.log").read_text()
assert(O/"beta.log").read_text().count("does not depend on any axioms")==6
def walk(e):
 if isinstance(e,dict):
  yield e
  for x in list(e.values()):yield from walk(x)
 elif isinstance(e,list):
  for x in e:yield from walk(x)
controls=[]
for tag in ["swap-truth-value","hide-implicit-level","specialize-public-universe","hide-type-transport"]:
 bad=copy.deepcopy(rep);name=pre+"true_predicate";row=next(d for d in bad["results"]if d["source"]==name)
 if tag=="swap-truth-value":
  hits=[e for e in walk(row["target_value"])if e.get("n")=="Rocq.Corelib.Init.Logic.True"]
  assert len(hits)==1;hits[0]["n"]="Rocq.Corelib.Init.Logic.False"
 elif tag=="hide-implicit-level":row["implicit_levels"]=[]
 elif tag=="hide-type-transport":row["type_lift_coercions"]=0
 else:
  for term in [row["target_type"],row["target_value"]]:
   for e in walk(term):
    if e.get("k")=="param"and e.get("n")=="u_Corelib_Classes_RelationClasses_72":e.clear();e["k"]="zero"
  row["level_params"]=[];row["implicit_levels"]=[]
 inp=O/(tag+".json");inp.write_text(json.dumps(bad))
 prefix=copy.deepcopy(bad);i=next(i for i,d in enumerate(prefix["results"])if d["source"]==name);prefix["results"]=prefix["results"][:i+1]
 kin=O/(tag+"-prefix.json");kin.write_text(json.dumps(prefix));ko=O/(tag+"-kernel.json");lc=O/(tag+"-replay.lean")
 lc.write_text("import Rocq2Lean.Replay\n#rocq2lean_replay "+json.dumps(str(kin))+" "+json.dumps(str(ko))+"\n")
 assert lean(lc,O/(tag+"-kernel.log"))==0,(O/(tag+"-kernel.log")).read_text()
 kr=json.loads(ko.read_text());assert all(d["kernel"]=="ACCEPTED"for d in kr["results"]),(tag,kr)
 ao=O/(tag+"-audit.json")
 with(O/(tag+"-audit.log")).open("w")as f:
  rc=subprocess.run([sys.executable,"-I",str(T/"tools/audit.py"),str(S/"source.ndjson"),str(S/"contract.json"),str(inp),str(ao),str(S/"consumer_result.json")],stdout=f,stderr=subprocess.STDOUT,timeout=300).returncode
 ar=json.loads(ao.read_text());assert rc!=0 and any(name in x["message"]for x in ar["problems"]),(tag,ar)
 controls.append({"name":tag,"kernel":"ACCEPTED","audit":"REJECTED"});print(tag,"PASS",flush=True)
res={"status":"PASS","new_actual_core_declarations":["true_predicate","false_predicate"],"arbitrary_universe_beta_laws":4,"empty_axiom_closures":6,"controls":controls}
(O/"result.json").write_text(json.dumps(res,indent=2)+"\n");print(json.dumps(res),flush=True)

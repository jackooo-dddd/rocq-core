import pathlib,sys,json,copy,subprocess
R=pathlib.Path(__file__).resolve().parents[1]
T=pathlib.Path(sys.argv[1]);S=pathlib.Path(sys.argv[2]);O=pathlib.Path(sys.argv[3]);O.mkdir()
validation=json.loads((S/"result.json").read_text())["validation"]
assert all(validation[k]=="OK"for k in ["roundtrip","consumer","audit"]),validation
rep=json.loads((S/"translation_report.json").read_text());pre="Corelib.Classes.RelationClasses."
rows={r["source"]:r for r in rep["results"]}
names=["pointwise_lifting","predicate_implication","predicate_equivalence"]
for n in names:assert rows[pre+n]["status"]=="TRANSLATED_AND_CHECKED"and rows[pre+n]["protected"]
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
env=cli.lean_env();env["LEAN_PATH"]=str(S/"lean")+":"+str(T/".lake/build/lib/lean")
def lean_run(file,log):
 with log.open("w")as f:
  return subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(file)],cwd=T,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=300).returncode
code=O/"Beta.lean";code.write_text("""import Rocq2LeanOut
universe u
noncomputable section
abbrev TL := Rocq.Corelib.Classes.RelationClasses.Tlist
abbrev Ar := Rocq.Corelib.Classes.RelationClasses.arrows
abbrev PW := Rocq.Corelib.Classes.RelationClasses.pointwise_lifting
abbrev LP := PULift.{u+1,1} Prop
theorem pw_nil (op : LP.{u} → LP.{u} → LP.{u}) (p q : LP.{u}) :
 PW.{u} op Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil p q = op p q := rfl
theorem pw_cons (op : LP.{u} → LP.{u} → LP.{u}) (A : Type u) (l : TL.{u})
 (f g : A → Ar.{u} l LP.{u}) :
 PW.{u} op (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons A l) f g =
 PULift.up (∀ x : A, (PW.{u} op l (f x) (g x)).down) := rfl
theorem implication_nil (p q : Prop) :
 (Rocq.Corelib.Classes.RelationClasses.predicate_implication.{u}
   Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil (PULift.up p) (PULift.up q)).down =
 (p → q) := rfl
theorem equivalence_nil (p q : Prop) :
 (Rocq.Corelib.Classes.RelationClasses.predicate_equivalence.{u}
   Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil (PULift.up p) (PULift.up q)).down =
 Rocq.Corelib.Init.Logic.iff p q := rfl
#print axioms pw_nil
#print axioms pw_cons
#print axioms implication_nil
#print axioms equivalence_nil
"""+ "\n".join("#print axioms Rocq."+pre+n for n in names)+"\n")
assert lean_run(code,O/"beta.log")==0,(O/"beta.log").read_text()
assert (O/"beta.log").read_text().count("does not depend on any axioms")==7
def unspine(e):
 args=[]
 while e["k"]=="app":args.insert(0,e["a"]);e=e["f"]
 return e,args
def app(h,args):
 for a in args:h={"k":"app","f":h,"a":a}
 return h
mut=[]
for tag in ["discard-universal-branch","swap-empty-operator"]:
 bad=copy.deepcopy(rep);name=pre+"pointwise_lifting";row=next(r for r in bad["results"]if r["source"]==name)
 cur=row["target_value"]
 while cur["k"]=="lam":cur=cur["b"]
 h,sp=unspine(cur);assert h["n"].endswith(".Tlist.rec")
 body=sp[1 if tag=="swap-empty-operator"else 2]
 while body["k"]=="lam":body=body["b"]
 if tag=="discard-universal-branch":
  h,a=unspine(body);assert h["n"]=="PULift.up"and a[-1]["k"]=="forall"
  a[-1].clear();a[-1].update({"k":"const","n":"True","u":[]})
 else:
  h,a=unspine(body);assert h["k"]=="bvar"and len(a)==2
  v=app(h,[a[1],a[0]]);body.clear();body.update(v)
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
res={"status":"PASS","new_actual_core_declarations":names,"arbitrary_universe_beta_laws":4,"empty_axiom_closures":7,"mutations":mut}
(O/"result.json").write_text(json.dumps(res,indent=2)+"\n");print(json.dumps(res),flush=True)

import pathlib,sys,json,copy,subprocess
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]);S=pathlib.Path(sys.argv[2]);O=pathlib.Path(sys.argv[3]);O.mkdir()
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
assert json.loads((S/"validate.json").read_text())["status"]=="STATEMENT_VALIDATED"
rep=json.loads((S/"translation_report.json").read_text());rows={r["source"]:r for r in rep["results"]};pre="CoreWfIndex.Source."
for n in ["pair_rec","triple_rec","custom_rec","counted_pair","data_pair"]:
 assert rows[pre+n]["status"]=="TRANSLATED_AND_CHECKED",n
assert "repeated variable" in rows[pre+"repeated"]["message"]
assert "nonrecursive record" in rows[pre+"sum_index"]["message"]
env=cli.lean_env();env["LEAN_PATH"]=str(S/"lean")+":"+str(T/".lake/build/lib/lean")
def lean_run(file,log):
 with log.open("w")as f:
  return subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(file)],cwd=T,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=300).returncode
code=O/"Beta.lean"
code.write_text("""import Rocq2LeanOut
universe u v w
noncomputable section
abbrev Pair (A : Type u) (B : Type v) := Rocq.Corelib.Init.Datatypes.prod A B
abbrev mkPair {A : Type u} {B : Type v} (a : A) (b : B) :=
  Rocq.Corelib.Init.Datatypes.prod.pair A B a b
abbrev AccX {A : Type u} (R : A → A → Prop) := Rocq.Corelib.Init.Wf.Acc A R
theorem pair_beta {A : Type u} {B : Type v}
    (R : Pair A B → Pair A B → Prop) (P : A → B → Type w)
    (F : ∀ x y, (∀ a b, R (mkPair a b) (mkPair x y) → P a b) → P x y)
    (x : A) (y : B) (step : ∀ z, R z (mkPair x y) → AccX R z) :
    Rocq.CoreWfIndex.Source.pair_rec A B R P F x y
      (Rocq.Corelib.Init.Wf.Acc.Acc_intro (Pair A B) R (mkPair x y) step) =
    F x y (fun a b h => Rocq.CoreWfIndex.Source.pair_rec A B R P F a b (step (mkPair a b) h)) := rfl
#print axioms pair_beta
#print axioms Rocq.CoreWfIndex.Source.pair_rec
#print axioms Rocq.CoreWfIndex.Source.triple_rec
#print axioms Rocq.CoreWfIndex.Source.custom_rec
""")
assert lean_run(code,O/"beta.log")==0,(O/"beta.log").read_text()
assert (O/"beta.log").read_text().count("does not depend on any axioms")==4
def unspine(e):
 a=[]
 while e["k"]=="app":a.insert(0,e["a"]);e=e["f"]
 return e,a
def app(h,args):
 for a in args:h={"k":"app","f":h,"a":a}
 return h
mut=[]
for tag in ["wrong-field","constant-minor","discard-recursive-result"]:
 bad=copy.deepcopy(rep);row=next(r for r in bad["results"]if r["source"]==pre+"data_pair");cur=row["target_value"]
 while cur["k"]=="lam":cur=cur["b"]
 h,args=unspine(cur);assert h["n"].endswith(".Acc.rec")
 m=args[3]
 while m["k"]=="lam":mp=m;m=m["b"]
 if tag=="constant-minor":mp["b"]={"k":"const","n":"Nat.zero","u":[]}
 else:
  ah,aa=unspine(m);assert len(aa)==2,(ah,aa)
  if tag=="wrong-field":
   assert aa[0]["k"]=="proj"and aa[0]["i"]==0,aa[0]
   aa[0]["i"]=1
  else:
   fh,fa=unspine(aa[1]);assert len(fa)==3,(fh,fa)
   z=fa[-1]
   while z["k"]=="lam":zp=z;z=z["b"]
   zp["b"]={"k":"const","n":"Nat.zero","u":[]}
 inp=O/(tag+".json");inp.write_text(json.dumps(bad));out=O/(tag+"-kernel.json")
 code=O/(tag+".lean");code.write_text("import Rocq2Lean.Replay\n#rocq2lean_replay "+json.dumps(str(inp))+" "+json.dumps(str(out))+"\n")
 assert lean_run(code,O/(tag+"-kernel.log"))==0,(O/(tag+"-kernel.log")).read_text()
 kr=json.loads(out.read_text());assert all(x["kernel"]=="ACCEPTED"for x in kr["results"]),kr
 ao=O/(tag+"-audit.json")
 with(O/(tag+"-audit.log")).open("w")as f:
  rc=subprocess.run([sys.executable,"-I",str(T/"tools/audit.py"),str(S/"source.ndjson"),str(S/"contract.json"),str(inp),str(ao),str(S/"consumer_result.json")],stdout=f,stderr=subprocess.STDOUT).returncode
 ar=json.loads(ao.read_text());assert rc==1 and any(pre+"data_pair" in x["message"]for x in ar["problems"]),ar
 mut.append({"name":tag,"kernel":"ACCEPTED","audit":"REJECTED"});print(tag,"PASS",flush=True)
res={"status":"PASS","positive_patterns":5,"eligibility_rejections":2,"arbitrary_universe_beta":"AXIOM_FREE","axiom_free_generated_definitions":3,"kernel_valid_wrong_computations":mut}
(O/"result.json").write_text(json.dumps(res,indent=2)+"\n");print(json.dumps(res),flush=True)

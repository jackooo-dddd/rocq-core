import pathlib,sys,json,copy,subprocess
T=pathlib.Path(sys.argv[1]).resolve();S=pathlib.Path(sys.argv[2]).resolve();O=pathlib.Path(sys.argv[3]).resolve();O.mkdir()
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
def lean(module,file,log):
 env=cli.lean_env();env["LEAN_PATH"]=str(module/"lean")+":"+str(T/".lake/build/lib/lean")
 with log.open("w")as f:return subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(file)],cwd=T,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=300).returncode
eq="""import Rocq2LeanOut
universe u
noncomputable section
def native_eq_equivalence (A : Type u) :=
 @RocqPending.Corelib.Classes.CRelationClasses.eq_equivalence.{u}
  (fun _ _ => rfl) (fun _ _ _ h => h.symm) (fun _ _ _ _ h₁ h₂ => h₁.trans h₂) A
theorem use_translated_symmetry (A : Type u) (x y : A) (h : x = y) : y = x :=
 (Rocq.Corelib.Classes.CRelationClasses.Equivalence_Symmetric A _
  (native_eq_equivalence A) x y (PULift.up h)).down
#print axioms native_eq_equivalence
#print axioms use_translated_symmetry
#print axioms RocqPending.Corelib.Classes.CRelationClasses.eq_equivalence
"""
pw="""import Rocq2LeanOut
universe u a b c d v w
noncomputable section
def native_pointwise (A : Type u) (B : Type v) (R : B → B → Type w) (f g : A → B) :=
 @RocqPending.Corelib.Classes.CMorphisms.pointwise_pointwise.{u,a,b,c,d,v,w}
  (fun _ _ _ _ _ h => h.symm) (fun _ _ _ _ _ _ _ _ _ => rfl) A B R f g
def use_translated_pointwise (A : Type u) (B : Type v) (R : B → B → Type w)
 (f g : A → B) (h : ∀ x, R (f x) (g x)) (x y : A) (e : x = y) : R (f x) (g y) :=
 Rocq.Corelib.Init.Datatypes.fst _ _ (native_pointwise.{u,a,b,c,d,v,w} A B R f g) h x y e
#print axioms native_pointwise
#print axioms use_translated_pointwise
#print axioms RocqPending.Corelib.Classes.CMorphisms.pointwise_pointwise
"""
def walk(e):
 if isinstance(e,dict):
  yield e
  for v in list(e.values()):yield from walk(v)
 elif isinstance(e,list):
  for v in e:yield from walk(v)
controls=[]
for mod,short,arity,nhyp,code in [("CRelationClasses","eq_equivalence",1,3,eq),("CMorphisms","pointwise_pointwise",7,2,pw)]:
 M=S/("Corelib/Classes/"+mod);name="Corelib.Classes."+mod+"."+short
 validation=json.loads((M/"result.json").read_text())["validation"]
 assert all(validation[k]=="OK"for k in ["roundtrip","consumer","audit"]),validation
 rep=json.loads((M/"translation_report.json").read_text())
 row=next(d for d in rep["results"]if d["source"]==name)
 assert row["status"]=="PENDING_KERNEL_CHECKED" and row["poly_level_interp"]==[]
 assert row["level_params"]==["v_"+str(i)for i in range(arity)]
 assert len(row["pending_hypotheses"])==nhyp
 lc=O/(short+".lean");lc.write_text(code)
 assert lean(M,lc,O/(short+"-client.log"))==0,(O/(short+"-client.log")).read_text()
 assert (O/(short+"-client.log")).read_text().count("does not depend on any axioms")==3
 for tag in ["hide-prerequisite","specialize-public-universe","claim-unsupported-local-model"]+(["hide-type-transport"]if mod=="CRelationClasses"else[]):
  bad=copy.deepcopy(rep);d=next(d for d in bad["results"]if d["source"]==name)
  if tag=="hide-prerequisite":d["pending_hypotheses"]=d["pending_hypotheses"][1:]
  elif tag=="claim-unsupported-local-model":d["poly_level_interp"]=[{"k":"param","n":"v_"+str(i)}for i in range(arity)]
  elif tag=="hide-type-transport":d["type_lift_coercions"]=0
  else:
   for term in [d["target_type"],d["target_value"]]:
    for e in walk(term):
     if e.get("k")=="param"and e.get("n")=="v_0":e.clear();e["k"]="zero"
   d["level_params"].remove("v_0")
  label=short+"-"+tag;inp=O/(label+".json");inp.write_text(json.dumps(bad))
  prefix=copy.deepcopy(bad);i=next(i for i,d in enumerate(prefix["results"])if d["source"]==name);prefix["results"]=prefix["results"][:i+1]
  kin=O/(label+"-prefix.json");kin.write_text(json.dumps(prefix));ko=O/(label+"-kernel.json");lc=O/(label+"-replay.lean")
  lc.write_text("import Rocq2Lean.Replay\n#rocq2lean_replay "+json.dumps(str(kin))+" "+json.dumps(str(ko))+"\n")
  assert lean(M,lc,O/(label+"-kernel.log"))==0,(O/(label+"-kernel.log")).read_text()
  kr=json.loads(ko.read_text());assert all(d["kernel"]=="ACCEPTED"for d in kr["results"]),(label,kr)
  ao=O/(label+"-audit.json")
  with(O/(label+"-audit.log")).open("w")as f:
   rc=subprocess.run([sys.executable,"-I",str(T/"tools/audit.py"),str(M/"source.ndjson"),str(M/"contract.json"),str(inp),str(ao),str(M/"consumer_result.json")],stdout=f,stderr=subprocess.STDOUT,timeout=300).returncode
  ar=json.loads(ao.read_text());assert rc!=0 and any(name in x["message"]for x in ar["problems"]),(label,ar)
  controls.append({"name":label,"kernel":"ACCEPTED","audit":"REJECTED"});print(label,"PASS",flush=True)
res={"status":"PASS","arbitrary_universe_native_Lean_clients":2,"explicit_prerequisites_discharged":5,"empty_axiom_closures":6,"controls":controls}
(O/"result.json").write_text(json.dumps(res,indent=2)+"\n");print(json.dumps(res),flush=True)

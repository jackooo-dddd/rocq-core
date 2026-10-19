import pathlib,sys,json,copy,subprocess
R=pathlib.Path(__file__).resolve().parents[1]
T=pathlib.Path(sys.argv[1]).resolve();S=pathlib.Path(sys.argv[2]).resolve();O=pathlib.Path(sys.argv[3]).resolve();O.mkdir()
C=S/"Corelib/Classes/CRelationClasses";M=S/"Corelib/Classes/CMorphisms"
for module in [C,M]:
 validation=json.loads((module/"result.json").read_text())["validation"]
 assert all(validation[k]=="OK" for k in ["roundtrip","consumer","audit"]),validation
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
def lean_run(file,log,module=C):
 env=cli.lean_env();env["LEAN_PATH"]=str(module/"lean")+":"+str(T/".lake/build/lib/lean")
 with log.open("w")as f:
  return subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(file)],cwd=T,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=300).returncode
code=O/"Client.lean";code.write_text("""import Rocq2LeanOut
universe u v w z
theorem rewrite_relation_shape :
 Rocq.Corelib.Classes.CRelationClasses.RewriteRelation_instance_2.statement.{u,v,w,z} =
 (∀ A : Type u, Rocq.Corelib.Classes.CRelationClasses.RewriteRelation.{max (max u v) (z+1),max (max u w) z}
  (PULift.{max (max u v) (z+1)+1,max (u+1) (z+2)} (A → A → Type z))
  (fun R S => PULift.{max (max u w) z+1,max (u+1) (z+1)}
   (∀ x y, Rocq.Corelib.Init.Datatypes.prod (R.down x y → S.down x y) (S.down x y → R.down x y)))) := rfl
noncomputable def use_translated_reflexivity (A : Type u) (R : A → A → Type z) (x y : A) (h : R x y) : R x y :=
 (Rocq.Corelib.Classes.CRelationClasses.PreOrder_Reflexive _ _
  (Rocq.Corelib.Classes.CRelationClasses.relation_implication_preorder.{u,v,w,z} A)
  (PULift.up R)).down x y h
#print axioms rewrite_relation_shape
#print axioms use_translated_reflexivity
#print axioms Rocq.Corelib.Classes.CRelationClasses.RewriteRelation_instance_2.statement
#print axioms Rocq.Corelib.Classes.CRelationClasses.relation_implication_preorder
""")
assert lean_run(code,O/"client.log")==0,(O/"client.log").read_text()
assert (O/"client.log").read_text().count("does not depend on any axioms")==4
code=O/"Morphisms.lean";code.write_text("""import Rocq2LeanOut
#print axioms Rocq.Corelib.Classes.CMorphisms.StrictOrder_PreOrder
#print axioms Rocq.Corelib.Classes.CMorphisms.respectful_per
#print axioms RocqPending.Corelib.Classes.CMorphisms.StrictOrder_PartialOrder
""")
assert lean_run(code,O/"morphisms.log",M)==0,(O/"morphisms.log").read_text()
assert (O/"morphisms.log").read_text().count("does not depend on any axioms")==3
def walk(e):
 if isinstance(e,dict):
  yield e
  for v in list(e.values()):yield from walk(v)
 elif isinstance(e,list):
  for v in e:yield from walk(v)
def unspine(e):
 args=[]
 while e.get("k")=="app":args.insert(0,e["a"]);e=e["f"]
 return e,args
def app(h,args):
 for a in args:h={"k":"app","f":h,"a":a}
 return h
rep=json.loads((C/"translation_report.json").read_text());name="Corelib.Classes.CRelationClasses.RewriteRelation_instance_2"
mut=[]
for tag in ["swap-lifted-relation-inputs","duplicate-lifted-relation-input","hide-parameter-transport","wrong-lifted-domain"]:
 bad=copy.deepcopy(rep);row=next(r for r in bad["results"]if r["source"]==name)
 assert row["status"]=="STATEMENT_KERNEL_CHECKED" and row["type_lift_coercions"]>0
 if tag=="hide-parameter-transport":
  row["type_lift_coercions"]=0
 elif tag=="wrong-lifted-domain":
  lam=next(e for e in walk(row["target_value"])if e.get("k")=="lam")
  assert lam["t"].get("f",{}).get("n")=="PULift"
  # Binder payload changes but the audited callee's expected domain does not.
  lam["t"]["a"]={"k":"const","n":"Nat","u":[]}
 else:
  candidates=[]
  for e in walk(row["target_value"]):
   h,a=unspine(e)
   if h.get("k")=="const" and h.get("n")=="PULift.down" and len(a)==4:candidates.append((e,h,a))
  assert candidates
  e,h,a=candidates[0]
  args=a[:-2]+([a[-1],a[-2]]if tag=="swap-lifted-relation-inputs"else[a[-2],a[-2]])
  changed=app(h,args);e.clear();e.update(changed)
 inp=O/(tag+".json");inp.write_text(json.dumps(bad))
 kernel=copy.deepcopy(bad);pos=next(i for i,r in enumerate(kernel["results"])if r["source"]==name)
 kernel["results"]=kernel["results"][:pos+1]
 kinp=O/(tag+"-replay.json");kinp.write_text(json.dumps(kernel));ko=O/(tag+"-kernel.json");lc=O/(tag+".lean")
 lc.write_text("import Rocq2Lean.Replay\n#rocq2lean_replay "+json.dumps(str(kinp))+" "+json.dumps(str(ko))+"\n")
 assert lean_run(lc,O/(tag+"-kernel.log"))==0,(O/(tag+"-kernel.log")).read_text()
 kr=json.loads(ko.read_text());accepted=all(x["kernel"]=="ACCEPTED"for x in kr["results"])
 assert accepted==(tag!="wrong-lifted-domain"),kr
 ao=O/(tag+"-audit.json")
 with(O/(tag+"-audit.log")).open("w")as log:
  rc=subprocess.run([sys.executable,"-I",str(T/"tools/audit.py"),str(C/"source.ndjson"),str(C/"contract.json"),str(inp),str(ao),str(C/"consumer_result.json")],stdout=log,stderr=subprocess.STDOUT).returncode
 aud=json.loads(ao.read_text());assert rc==1 and any(name in x["message"]for x in aud["problems"]),aud
 mut.append({"name":tag,"kernel":"ACCEPTED"if accepted else"REJECTED","audit":"REJECTED"})
 print(tag,"PASS",flush=True)
res={"status":"PASS","arbitrary_universe_shape_laws":1,"native_lean_client_using_translated_proof":1,"empty_axiom_closures":7,"conditional_artifacts":["Corelib.Classes.CMorphisms.StrictOrder_PartialOrder"],"mutations":mut}
(O/"result.json").write_text(json.dumps(res,indent=2)+"\n");print(json.dumps(res),flush=True)

import pathlib,sys,json,copy,subprocess
R=pathlib.Path(__file__).resolve().parents[1]
T=pathlib.Path(sys.argv[1]);S=pathlib.Path(sys.argv[2]);O=pathlib.Path(sys.argv[3]);O.mkdir()
validation=json.loads((S/"result.json").read_text())["validation"]
assert all(validation[k]=="OK"for k in ["roundtrip","consumer","audit"]),validation
rep=json.loads((S/"translation_report.json").read_text());pre="Corelib.Classes.CRelationClasses."
rows={r["source"]:r for r in rep["results"]}
names=["RewriteRelation_instance_0","RewriteRelation_instance_1","complement_inverse","iff_equivalence"]
for n in names:assert rows[pre+n]["status"] in ("STATEMENT_KERNEL_CHECKED","PENDING_KERNEL_CHECKED") and rows[pre+n]["protected"]
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
env=cli.lean_env();env["LEAN_PATH"]=str(S/"lean")+":"+str(T/".lake/build/lib/lean")
def lean_run(file,log):
 with log.open("w")as f:
  return subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(file)],cwd=T,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=300).returncode
code=O/"Beta.lean";code.write_text("""import Rocq2LeanOut
universe u v w z
theorem rewrite_impl_shape :
 Rocq.Corelib.Classes.CRelationClasses.RewriteRelation_instance_0.statement.{u} =
 Rocq.Corelib.Classes.CRelationClasses.RewriteRelation.{max 1 u,0}
  (PULift.{max 1 u + 1,1} Prop) (fun p q => PULift.{1,0} (p.down → q.down)) := rfl
theorem complement_statement_has_proof :
 Rocq.Corelib.Classes.CRelationClasses.complement_inverse.statement.{u,v,w,z} := by
 intro A R
 rfl
#print axioms rewrite_impl_shape
#print axioms complement_statement_has_proof
#print axioms RocqPending.Corelib.Classes.CRelationClasses.iff_equivalence
""")
assert lean_run(code,O/"beta.log")==0,(O/"beta.log").read_text()
assert (O/"beta.log").read_text().count("does not depend on any axioms")==3
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
for tag in ["discard-type-result-payload","swap-type-result-operands","hide-local-bound-interpretation"]:
 bad=copy.deepcopy(rep);name=pre+"RewriteRelation_instance_0";row=next(r for r in bad["results"]if r["source"]==name)
 if tag=="hide-local-bound-interpretation":
  assert row["poly_level_interp"]
  row["poly_level_interp"]=[{"k":"param","n":"v_0"}]
 else:
  hits=[e for e in walk(row["target_value"])if e.get("k")=="app"and e.get("f",{}).get("n")=="PULift"and e["f"]["u"][1]=={"k":"zero"}]
  assert len(hits)==1,len(hits)
  body=hits[0]["a"]
  if tag=="discard-type-result-payload":
   body.clear();body.update({"k":"const","n":"False","u":[]})
  else:
   h,a=unspine(body);assert len(a)==2
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
res={"status":"PASS","new_actual_core_declarations":names,"arbitrary_universe_beta_laws":1,"arbitrary_universe_complement_proof":1,"empty_axiom_closures":3,"mutations":mut}
(O/"result.json").write_text(json.dumps(res,indent=2)+"\n");print(json.dumps(res),flush=True)

import pathlib,sys,json,copy,subprocess
R=pathlib.Path(__file__).resolve().parents[1]
T=pathlib.Path(sys.argv[1]).resolve();S=pathlib.Path(sys.argv[2]).resolve();O=pathlib.Path(sys.argv[3]).resolve();O.mkdir()
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
def lean(file,log):
 env=cli.lean_env();env["LEAN_PATH"]=str(M/"lean")+":"+str(T/".lake/build/lib/lean")
 with log.open("w")as f:return subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(file)],cwd=T,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=300).returncode
def walk(e):
 if isinstance(e,dict):
  yield e
  for v in list(e.values()):yield from walk(v)
 elif isinstance(e,list):
  for v in e:yield from walk(v)
controls=[]
for mod,short,names in [
 ("Morphisms","flip_arrow",["flip_arrow","flip_forall","proper_proper"]),
 ("Morphisms_Prop","Acc_rel_morphism",["Acc_rel_morphism","well_founded_morphism"])]:
 M=S/("Corelib/Classes/"+mod);name="Corelib.Classes."+mod+"."+short
 v=json.loads((M/"result.json").read_text())["validation"];assert all(v[k]=="OK"for k in ["roundtrip","consumer","audit"])
 rep=json.loads((M/"translation_report.json").read_text())
 for n in names:
  row=next(d for d in rep["results"]if d["source"]=="Corelib.Classes."+mod+"."+n)
  assert row["status"]=="STATEMENT_KERNEL_CHECKED"
  assert len(row["level_params"])==(2 if n in ("flip_arrow","flip_forall")else 1)
  assert row["source_computed"]==["Corelib.Classes.RelationClasses.arrows","Corelib.Classes.RelationClasses.pointwise_lifting"]
 row=next(d for d in rep["results"]if d["source"]==name)
 lc=O/(mod+".lean");lc.write_text((R/("work/fixtures/joint-source-clients/"+mod+".lean")).read_text())
 assert lean(lc,O/(mod+"-client.log"))==0,(O/(mod+"-client.log")).read_text()
 assert (O/(mod+"-client.log")).read_text().count("does not depend on any axioms")==3
 for tag in ["hide-recursive-type-computation","replace-statement-with-true","narrow-public-universes"]:
  label=mod+"-"+tag
  bad=copy.deepcopy(rep);d=next(d for d in bad["results"]if d["source"]==name)
  if tag=="hide-recursive-type-computation":d["source_computed"].remove("Corelib.Classes.RelationClasses.pointwise_lifting")
  elif tag=="replace-statement-with-true":d["target_value"]={"k":"const","n":"True","u":[]}
  else:
   for term in [d["target_type"],d["target_value"]]:
    for e in walk(term):
     if e.get("k")=="param"and e.get("n")==row["level_params"][-1]:
      if len(row["level_params"])>1:e["n"]=row["level_params"][0]
      else:e.clear();e["k"]="zero"
   d["level_params"].remove(row["level_params"][-1])
  inp=O/(label+".json");inp.write_text(json.dumps(bad))
  prefix=copy.deepcopy(bad);i=next(i for i,d in enumerate(prefix["results"])if d["source"]==name);prefix["results"]=prefix["results"][:i+1]
  kin=O/(label+"-prefix.json");kin.write_text(json.dumps(prefix));ko=O/(label+"-kernel.json");lc=O/(label+"-replay.lean")
  lc.write_text("import Rocq2Lean.Replay\n#rocq2lean_replay "+json.dumps(str(kin))+" "+json.dumps(str(ko))+"\n")
  assert lean(lc,O/(label+"-kernel.log"))==0,(O/(label+"-kernel.log")).read_text()
  kr=json.loads(ko.read_text());assert all(d["kernel"]=="ACCEPTED"for d in kr["results"]),(tag,kr)
  ao=O/(label+"-audit.json")
  with(O/(label+"-audit.log")).open("w")as f:
   rc=subprocess.run([sys.executable,"-I",str(T/"tools/audit.py"),str(M/"source.ndjson"),str(M/"contract.json"),str(inp),str(ao),str(M/"consumer_result.json")],stdout=f,stderr=subprocess.STDOUT,timeout=300).returncode
  ar=json.loads(ao.read_text());assert rc!=0 and any(name in x["message"]for x in ar["problems"]),(tag,ar)
  controls.append({"name":label,"kernel":"ACCEPTED","audit":"REJECTED"});print(tag,"PASS",flush=True)
res={"status":"PASS","arbitrary_universe_native_root_proofs":5,"empty_axiom_closures":6,"controls":controls}
(O/"result.json").write_text(json.dumps(res,indent=2)+"\n");print(json.dumps(res),flush=True)

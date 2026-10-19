import pathlib,sys,json,copy,subprocess
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();F=pathlib.Path(sys.argv[2]).resolve();S=pathlib.Path(sys.argv[3]).resolve();O=pathlib.Path(sys.argv[4]).resolve();O.mkdir()
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
def lean(M,file,log):
 env=cli.lean_env();env["LEAN_PATH"]=str(M/"lean")+":"+str(T/".lake/build/lib/lean")
 with log.open("w")as f:return subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(file)],cwd=T,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=300).returncode
def walk(e):
 if isinstance(e,dict):
  yield e
  for v in list(e.values()):yield from walk(v)
 elif isinstance(e,list):
  for v in e:yield from walk(v)
def spine(e):
 a=[]
 while e.get("k")=="app":a.insert(0,e["a"]);e=e["f"]
 return e,a
def ctor_nodes(t,which):
 out=[]
 for e in walk(t):
  h,a=spine(e)
  if h.get("n")=="Rocq.Corelib.Init.Datatypes.prod.pair" and len(a)==4:
   if any(x.get("n")=="PULift."+which for x in walk(a[-1])):out.append(e)
 return out
assert json.loads((F/"consumer_result.json").read_text())["status"]=="OK"
# Re-audit fixture with the candidate auditor, retaining older diagnostics.
with(O/"fixture-audit.log").open("w")as f:
 rc=subprocess.run([sys.executable,"-I",str(T/"tools/audit.py"),str(F/"source.ndjson"),str(F/"contract.json"),str(F/"translation_report.json"),str(O/"fixture-audit.json"),str(F/"consumer_result.json")],stdout=f,stderr=subprocess.STDOUT).returncode
assert rc==0,json.loads((O/"fixture-audit.json").read_text()).get("problems")
lc=O/"Client.lean";lc.write_text((R/"work/fixtures/record-iso-clients/Client.lean").read_text())
assert lean(F,lc,O/"client.log")==0,(O/"client.log").read_text()
assert (O/"client.log").read_text().count("does not depend on any axioms")==6
controls=[]
def negative(M,source,tag,mutate):
 rep=json.loads((M/"translation_report.json").read_text());row=next(d for d in rep["results"]if d["source"]==source)
 bad=copy.deepcopy(rep);d=next(d for d in bad["results"]if d["source"]==source);mutate(d)
 label=source.split(".")[-1]+"-"+tag
 inp=O/(label+".json");inp.write_text(json.dumps(bad))
 prefix=copy.deepcopy(bad);i=next(i for i,d in enumerate(prefix["results"])if d["source"]==source);prefix["results"]=prefix["results"][:i+1]
 kin=O/(label+"-prefix.json");kin.write_text(json.dumps(prefix));ko=O/(label+"-kernel.json");lc=O/(label+"-replay.lean")
 lc.write_text("import Rocq2Lean.Replay\n#rocq2lean_replay "+json.dumps(str(kin))+" "+json.dumps(str(ko))+"\n")
 assert lean(M,lc,O/(label+"-kernel.log"))==0,(O/(label+"-kernel.log")).read_text()
 kr=json.loads(ko.read_text());assert all(d["kernel"]=="ACCEPTED"for d in kr["results"]),(label,kr)
 ao=O/(label+"-audit.json")
 with(O/(label+"-audit.log")).open("w")as f:
  rc=subprocess.run([sys.executable,"-I",str(T/"tools/audit.py"),str(M/"source.ndjson"),str(M/"contract.json"),str(inp),str(ao),str(M/"consumer_result.json")],stdout=f,stderr=subprocess.STDOUT,timeout=300).returncode
 ar=json.loads(ao.read_text());assert rc!=0 and any(source in x["message"]for x in ar["problems"]),(label,ar)
 controls.append({"name":label,"kernel":"ACCEPTED","audit":"REJECTED"});print(label,"PASS",flush=True)
source="CoreRecordFunctions2.Source.pass_pair"
def change_fields(d,which,duplicate=False):
 nodes=ctor_nodes(d["target_value"],which);assert len(nodes)==1,len(nodes)
 e=nodes[0];x=copy.deepcopy(e["f"]["a"]);y=copy.deepcopy(e["a"])
 e["a"]=x;e["f"]["a"]=x if duplicate else y
for tag,which,dup in [("swap-output-fields","down",False),("duplicate-output-field","down",True),("swap-input-fields","up",False)]:
 negative(F,source,tag,lambda d,w=which,b=dup:change_fields(d,w,b))
negative(F,source,"hide-record-transports",lambda d:d.update(type_lift_coercions=0))
def specialize(d):
 for term in [d["target_type"],d["target_value"]]:
  for e in walk(term):
   if e.get("k")=="param"and e.get("n")=="v_1":e.clear();e["k"]="zero"
 d["level_params"].remove("v_1")
negative(F,source,"narrow-independent-universe",specialize)
M=S/"Corelib/ssr/ssrbool"
rep=json.loads((M/"translation_report.json").read_text())
for short in ["all_sig_cond_dep","all_sig_cond","all_sig2_cond"]:
 row=next(d for d in rep["results"]if d["source"]=="Corelib.ssr.ssrbool."+short)
 assert row["status"]=="PENDING_KERNEL_CHECKED" and row["pending_hypotheses"]
for module in ["Corelib/ssr/ssrbool","Corelib/Classes/CMorphisms"]:
 v=json.loads((S/module/"result.json").read_text())["validation"];assert all(v[k]=="OK"for k in ["roundtrip","consumer","audit"]),v
source="Corelib.ssr.ssrbool.all_sig_cond_dep"
negative(M,source,"hide-prerequisite",lambda d:d.update(pending_hypotheses=d["pending_hypotheses"][1:]))
negative(M,source,"claim-unconditional",lambda d:d.update(status="TRANSLATED_AND_CHECKED"))
N=S/"Corelib/Classes/CMorphisms";n="Corelib.Classes.CMorphisms.respectful_morphism"
row=next(d for d in json.loads((N/"translation_report.json").read_text())["results"]if d["source"]==n);assert row["status"]=="TRANSLATED_AND_CHECKED"
negative(N,n,"hide-type-transport",lambda d:d.update(type_lift_coercions=0))
res={"status":"PASS","constructor_beta_laws":2,"arbitrary_universe_identity_roundtrips":2,"empty_axiom_closures":6,"native_roots_checked":4,"controls":controls}
(O/"result.json").write_text(json.dumps(res,indent=2)+"\n");print(json.dumps(res),flush=True)

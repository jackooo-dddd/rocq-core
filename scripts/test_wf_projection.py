import pathlib,sys,json,copy,subprocess
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]);S=pathlib.Path(sys.argv[2]);O=pathlib.Path(sys.argv[3]);O.mkdir()
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
assert json.loads((S/"validate.json").read_text())["status"]=="STATEMENT_VALIDATED"
ds={d["name"]:d for l in(S/"source.ndjson").read_text().splitlines()if(d:=json.loads(l)).get("kind")in("constant","inductive")}
prefix="CoreWfProjectionControls.Source."
for name in ["kept_inline","kept_reference","counted"]:
 d=ds[prefix+name];assert not d.get("obligations")and not d.get("termination"),(name,d)
for name in ["extracted_outer","extracted_branches","extracted_lambda","extracted_opaque"]:
 assert len(ds[prefix+name].get("obligations",[]))==1,name
assert ds[prefix+"kept_reference"]["statement_prepared"] is True
rep=json.loads((S/"translation_report.json").read_text())
name=prefix+"counted"
def unspine(e):
 args=[]
 while e["k"]=="app":args.insert(0,e["a"]);e=e["f"]
 return e,args
def app(f,args):
 for a in args:f={"k":"app","f":f,"a":a}
 return f
mutations=[]
env=cli.lean_env();env["LEAN_PATH"]=str(T/".lake/build/lib/lean")
for tag in ["constant-function","constant-minor","discard-recursive-result"]:
 bad=copy.deepcopy(rep);r=next(x for x in bad["results"]if x["source"]==name)
 cur=r["target_value"]
 while cur["k"]=="lam":parent=cur;cur=cur["b"]
 if tag=="constant-function":parent["b"]={"k":"const","n":"Nat.zero","u":[]}
 else:
  h,sp=unspine(cur);assert h["n"].endswith(".Acc.rec"),h
  minor=sp[3];m=minor
  while m["k"]=="lam":mp=m;m=m["b"]
  if tag=="constant-minor":mp["b"]={"k":"const","n":"Nat.zero","u":[]}
  else:
   fh,fs=unspine(m);assert len(fs)==2 and fs[1]["k"]=="lam",(fh,fs)
   z=fs[1]
   while z["k"]=="lam":zp=z;z=z["b"]
   zp["b"]={"k":"const","n":"Nat.zero","u":[]}
  parent["b"]=app(h,sp)
 inp=O/(tag+".json");inp.write_text(json.dumps(bad));out=O/(tag+"-kernel.json")
 code=O/(tag+".lean");code.write_text("import Rocq2Lean.Replay\n#rocq2lean_replay "+json.dumps(str(inp))+" "+json.dumps(str(out))+"\n")
 with(O/(tag+"-kernel.log")).open("w")as log:
  rc=subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(code)],cwd=T,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300).returncode
 assert rc==0,(O/(tag+"-kernel.log")).read_text()
 kr=json.loads(out.read_text());assert all(x["kernel"]=="ACCEPTED"for x in kr["results"]),kr
 aud=O/(tag+"-audit.json")
 with(O/(tag+"-audit.log")).open("w")as log:
  rc=subprocess.run([sys.executable,"-I",str(T/"tools/audit.py"),str(S/"source.ndjson"),str(S/"contract.json"),str(inp),str(aud),str(S/"consumer_result.json")],stdout=log,stderr=subprocess.STDOUT).returncode
 a=json.loads(aud.read_text());assert rc==1 and any(name in x["message"]for x in a["problems"]),a
 mutations.append({"name":tag,"kernel":"ACCEPTED","audit":"REJECTED"})
 print(tag,"PASS",flush=True)
# A source rewrite without obligations must not evade fresh preparation replay.
M=O/"missing-preparation";M.mkdir();lines=[]
for l in(S/"source.ndjson").read_text().splitlines():
 d=json.loads(l)
 if d.get("name")==prefix+"kept_reference":d.pop("statement_prepared")
 lines.append(json.dumps(d))
(M/"source.ndjson").write_text("\n".join(lines)+"\n")
with(M/"roundtrip.log").open("w")as log:
 rc=subprocess.run([sys.executable,"-I",str(T/"tools/roundtrip.py"),str(M/"source.ndjson"),str(M),"-Q",str(R/"work/fixtures/wf-projection-controls"),"CoreWfProjectionControls","--","CoreWfProjectionControls.Source"],cwd=T,env=cli.opam_env(),stdout=log,stderr=subprocess.STDOUT,timeout=300).returncode
 rr=json.loads((M/"roundtrip.json").read_text())
assert rc!=0 and rr["results"][prefix+"kept_reference"]=="RT_MISMATCH",rr
result={"status":"PASS","preserved_projection_cases":3,"extraction_boundary_cases":4,"kernel_valid_wrong_computations":mutations,"missing_preparation":"REJECTED"}
(O/"result.json").write_text(json.dumps(result,indent=2)+"\n");print(json.dumps(result),flush=True)

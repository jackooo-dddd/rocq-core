#!/usr/bin/env python3
"""Production quality-family envelopes, coverage and computational negative controls."""
import pathlib,sys,json,copy,subprocess
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]);P=pathlib.Path(sys.argv[2]);O=pathlib.Path(sys.argv[3]);O.mkdir(parents=True)
S=P/"statement";rep=json.loads((S/"translation_report.json").read_text())
assert json.loads((S/"validate.json").read_text())["status"]=="STATEMENT_VALIDATED"
assert json.loads((P/"proof/verify.json").read_text())["status"]=="VERIFIED"
a=json.loads((S/"audit.json").read_text());families=[r for r in rep["results"]if r.get("quality_prop")]
assert len(families)==5 and len(a["quality_representations"])==5
assert all(v["verdict"]=="MATCH"for v in a["quality_representations"])
source={d["name"]for l in(S/"source.ndjson").read_text().splitlines()if(d:=json.loads(l)).get("kind")in("constant","inductive")}
assert {r["source"]for r in rep["results"]}==source
assert {v["source"]for v in a["verdicts"]}==source
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
mutations=[]
def audit_bad(bad,tag,expect_source=None):
 f=O/(tag+".json");f.write_text(json.dumps(bad))
 out=O/(tag+"-audit.json")
 rc=subprocess.run([sys.executable,"-I",str(T/"tools/audit.py"),str(S/"source.ndjson"),str(S/"contract.json"),str(f),str(out),str(S/"consumer_result.json")],capture_output=True,text=True)
 assert rc.returncode==1,(tag,rc.stdout,rc.stderr)
 result=json.loads(out.read_text());assert result["problems"],tag
 if expect_source:assert any(expect_source in p["message"]for p in result["problems"]),(tag,result["problems"])
 mutations.append({"tag":tag,"audit":"REJECTED"})
 return mutations[-1]
for family in families:
 name=family["source"];short=name.split(".")[-1]
 for tag in ["missing-branch","wrong-target","nested-branch","wrong-arity","extra-source-row"]:
  bad=copy.deepcopy(rep);r=next(x for x in bad["results"]if x["source"]==name);q=r["quality_prop"]
  if tag=="missing-branch":r["quality_prop"]=None
  elif tag=="wrong-target":q["target"]+="Wrong"
  elif tag=="nested-branch":q["quality_prop"]=copy.deepcopy(q)
  elif tag=="wrong-arity":q["target_type"]["b"]={"k":"sort","l":{"k":"succ","l":{"k":"zero"}}}
  else:bad["results"].append(copy.deepcopy(q))
  audit_bad(bad,short+"-"+tag)
swap={}
for r in families:
 q=r["quality_prop"]
 for x,y in [(r["target"],q["target"]),(r["target"]+".rec",q["target"]+".rec"),*[(a["name"],b["name"])for a,b in zip(r["target_ctors"],q["target_ctors"])]]:
  swap[x]=y;swap[y]=x
def rewrite(x):
 if isinstance(x,dict):
  if x.get("k")=="const"and x.get("n")in swap:x["n"]=swap[x["n"]]
  for v in x.values():rewrite(v)
 elif isinstance(x,list):
  for v in x:rewrite(v)
# Definition-valued constructor and destructor clients; statement-only proof
# clients have no translated implementation to corrupt.
targets=[r for r in rep["results"]if r["source"].endswith("_t")and any("."+x in r["source"]for x in ["mk_","use_"])]
assert len(targets)==10
proof=json.loads((P/"proof/translation_report.json").read_text())
env=cli.lean_env();env["LEAN_PATH"]=str(T/".lake/build/lib/lean")
for original in targets:
 name=original["source"];tag=name.split(".")[-1]
 bad=copy.deepcopy(rep);r=next(x for x in bad["results"]if x["source"]==name)
 rewrite(r["target_value"]);audit_bad(bad,tag+"-wrong-branch",name)
 bad=copy.deepcopy(rep);r=next(x for x in bad["results"]if x["source"]==name);cur=r["target_value"]
 while cur["k"]=="lam":parent=cur;cur=cur["b"]
 if ".use_"in name:parent["b"]={"k":"const","n":"Nat.zero","u":[]}
 else:
  args=[]
  while cur["k"]=="app":args.append(cur["a"]);cur=cur["f"]
  args.reverse();np=3 if any(x in name for x in["sig2_","sigT2_"])else 2
  args[np]={"k":"const","n":"Nat.zero","u":[]}
  for arg in args:cur={"k":"app","f":cur,"a":arg}
  parent["b"]=cur
 m=audit_bad(bad,tag+"-wrong-data",name)
 kr=copy.deepcopy(proof);pr=next(x for x in kr["results"]if x["source"]==name);pr["target_value"]=r["target_value"]
 inp=O/(tag+"-replay.json");inp.write_text(json.dumps(kr));out=O/(tag+"-kernel.json")
 code=O/(tag+".lean");code.write_text("import Rocq2Lean.Replay\n#rocq2lean_replay "+json.dumps(str(inp))+" "+json.dumps(str(out))+"\n")
 with(O/(tag+".log")).open("w")as log:
  rc=subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(code)],cwd=T,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300).returncode
 assert rc==0,(O/(tag+".log")).read_text()
 ks=json.loads(out.read_text())["results"];assert all(x["kernel"]=="ACCEPTED"for x in ks),(tag,ks)
 m["kernel"]="ACCEPTED";m["replayed_records"]=len(ks)
name="CoreQualitySource.Source.let_annotated"
for tag in ["missing-let-lift","wrong-let-payload","wrong-let-universe","hidden-let-rule"]:
 bad=copy.deepcopy(rep);r=next(x for x in bad["results"]if x["source"]==name)
 term=r["target_value"]
 while term["k"]=="lam":term=term["b"]
 assert term["k"]=="let"and term["v"]["f"]["n"]=="PULift"
 if tag=="missing-let-lift":term["v"]=term["v"]["a"]
 elif tag=="wrong-let-payload":term["v"]["a"]={"k":"const","n":"Rocq.Corelib.Init.Logic.False","u":[]}
 elif tag=="wrong-let-universe":term["v"]["f"]["u"][0]={"k":"succ","l":term["v"]["f"]["u"][0]}
 else:r["prop_lift_coercions"]=0;r["type_lift_coercions"]=0
 audit_bad(bad,tag,name)
result={"status":"PASS","production_report_integration":True,"source_roots":len(rep["roots"]),"source_declarations":len(source),"auxiliary_representations":len(families),"coverage_unchanged":True,"mutations":mutations}
(O/"result.json").write_text(json.dumps(result,indent=2)+"\n")
print(json.dumps({"status":"PASS","mutations":len(mutations),"kernel_valid_wrong_data":len(targets)}),flush=True)

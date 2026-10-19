#!/usr/bin/env python3
"""Independent source-derived branch views plus the existing structural auditor.
Experimental fixture: not the production report schema or coverage contract."""
import pathlib,sys,json,subprocess,copy,shutil
R=pathlib.Path(__file__).resolve().parents[1]
T=R/"work/snapshots/quality-dispatch5/translator";K=R/"work/tests/quality-dispatch-kernel3";S=R/"work/tests/quality-source-native4"
O=pathlib.Path(sys.argv[1]) if len(sys.argv)>1 else R/"work/tests/quality-family-audit2";O.mkdir()
shutil.copy2(R/"translator/tools/quality_source.py",O/"quality_source.py")
sys.path.insert(0,str(T/"tools"));sys.path.insert(0,str(O))
import audit,quality_source,rocq2lean as cli
ds={d["name"]:d for l in(S/"source.ndjson").read_text().splitlines()if(d:=json.loads(l)).get("kind")in("constant","inductive")}
q=quality_source.QualityAnalysis(ds);views=quality_source.derived_families(q)
rep=json.loads((K/"report.json").read_text());accepted=[r for r in rep["constants"]if r["status"]=="TRANSLATED_AND_CHECKED"]
rows=rep["branches"]+accepted
names=[r["target"]+".rec"for r in rep["branches"]]
lean="""import Dispatch
import Rocq2Lean.Verify
open Lean Elab Command Rocq2Lean
elab "#recursor_metadata" : command => do
  let mut out := #[]
  for name in NAMES do
    let some (.recInfo r) := (← getEnv).find? name.toName | throwError "missing recursor"
    out := out.push (recursorJson r)
  IO.FS.writeFile OUTPUT (Json.arr out).pretty
#recursor_metadata
"""
lean=lean.replace("NAMES","(#["+ ",".join(json.dumps(n)for n in names)+"] : Array String)").replace("OUTPUT",json.dumps(str(O/"recursors.json")))
(O/"Metadata.lean").write_text(lean)
env=cli.lean_env();env["LEAN_PATH"]=str(K)+":"+str(T/".lake/build/lib/lean")
with(O/"metadata.log").open("w")as log:
 rc=subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(O/"Metadata.lean")],cwd=O,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300).returncode
assert rc==0,(O/"metadata.log").read_text()
recs={r["name"]:r for r in json.loads((O/"recursors.json").read_text())}
a=audit.Auditor(dict(ds,**views),rows,recs)
lines=[json.loads(l)for l in(S/"source.ndjson").read_text().splitlines()]
audit.FACTS=audit.Facts(next(d for d in lines if d.get("kind")=="universe_facts"))
inst=audit.InstanceLevels(rows,recs)
for r in rep["branches"]:
 if r["source"]not in views:continue
 d=views[r["source"]];b=d["bodies"][0]
 audit.ADMIT[0]=audit.template_sort_block(d,r)
 try:
  a.check(audit.template_sort_arity(d,r,b["type"]),r["target_type"],["arity"])
  ref=("const",r["target"],[{"k":"param","n":l}for l in r["level_params"]])
  for c,tc in zip(b["ctors"],r["target_ctors"]):a.check(c["type"],tc["type"],["ctor"],[ref])
 finally:audit.ADMIT[0]=set()
tested=[];mutations=[]
for r in accepted:
 d=ds[r["source"]];ty=quality_source.specialize(q,d["type"]);body=quality_source.specialize(q,d["body"])
 params,sol=audit.own_partition(d,r);a.body=sol
 audit.POLY_IMAGE[0]=audit.checked_poly_interpretation(d,r)
 audit.REDUCE[0]=bool(r.get("sort_fact_reduced"));audit.ADMIT[0]=set(r.get("admitting_levels")or[])
 audit.check_body_levels(audit.FACTS,d,sol,params)
 a.check(ty,r["target_type"],["type"])
 payload=audit.strip_type_lift(r,audit.strip_prop_lift(r,r["target_value"],d["type"],sol),d["type"],sol,inst)
 a.check(body,payload,["body"]);tested.append(r["source"])
 if not any(r["source"].startswith("CoreQualitySource.Source."+op)for op in["mk_","use_"]):continue
 # Switching either family is rejected independently of what the producer reports.
 bad=copy.deepcopy(r["target_value"])
 def swap(x):
  if isinstance(x,dict):
   if x.get("k")=="const"and".quality"in x.get("n",""):
    x["n"]=x["n"].replace(".qualityProp",".qualityTEMP").replace(".qualityType",".qualityProp").replace(".qualityTEMP",".qualityType")
   for v in x.values():swap(v)
  elif isinstance(x,list):
   for v in x:swap(v)
 swap(bad)
 try:a.check(body,bad,["body"])
 except audit.Mismatch:mutations.append({"source":r["source"],"mutation":"wrong-family"})
 else:raise AssertionError(("family swap accepted",r["source"]))
 # Type-correct computational corruption: ignore a data field and return zero.
 if r["source"].endswith("_t"):
  bad=copy.deepcopy(r["target_value"]);cur=bad
  while cur["k"]=="lam":parent=cur;cur=cur["b"]
  if ".use_"in r["source"]:parent["b"]={"k":"const","n":"Nat.zero","u":[]}
  else:
   h,args=audit.Auditor.unspine(cur);np=3 if any(n in r["source"]for n in["sig2_","sigT2_"])else 2
   args[np]={"k":"const","n":"Nat.zero","u":[]};out=h
   for arg in args:out={"k":"app","f":out,"a":arg}
   parent["b"]=out
  try:a.check(body,bad,["body"])
  except audit.Mismatch:pass
  else:raise AssertionError(("wrong data accepted",r["source"]))
  mr=copy.deepcopy({"results":rows});target=next(x for x in mr["results"]if x["source"]==r["source"]);target["target_value"]=bad
  tag=r["source"].split(".")[-1];(O/(tag+".json")).write_text(json.dumps(mr))
  (O/(tag+".lean")).write_text('import Rocq2Lean.Replay\n#rocq2lean_replay '+json.dumps(str(O/(tag+".json")))+" "+json.dumps(str(O/(tag+"-replay.json")))+"\n")
  with(O/(tag+".log")).open("w")as log:
   rc=subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(O/(tag+".lean"))],cwd=O,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300).returncode
  assert rc==0,(O/(tag+".log")).read_text()
  rr=json.loads((O/(tag+"-replay.json")).read_text())["results"]
  assert all(x["kernel"]=="ACCEPTED"for x in rr),(tag,rr)
  mutations.append({"source":r["source"],"mutation":"wrong-data","kernel":"ACCEPTED","audit":"REJECTED"})
result={"status":"PASS","source_derived_branch_signatures":10,"function_types_and_bodies":tested,"mutations":mutations,"production_report_integration":False,"new_certified_core_roots":0}
(O/"result.json").write_text(json.dumps(result,indent=2)+"\n")
print(json.dumps({"status":"PASS","branch_signatures":10,"functions":len(tested),"mutations":len(mutations)}),flush=True)

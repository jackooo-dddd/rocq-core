import pathlib,sys,json,copy,subprocess
T=pathlib.Path(sys.argv[1]).resolve();S=pathlib.Path(sys.argv[2]).resolve();O=pathlib.Path(sys.argv[3]).resolve();O.mkdir()
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
E=S/"Corelib/Init/Equality";H=S/"Corelib/ssr/ssreflect_rw"
for p in [E,H]:
 v=json.loads((p/"result.json").read_text())["validation"]
 assert all(v[k]=="OK"for k in ["roundtrip","consumer","audit"]),v
def loadsrc(p):return [json.loads(l)for l in (p/"source.ndjson").read_text().splitlines()]
def get(rows,n):return next(d for d in rows if d.get("name")==n)
eq="Corelib.Init.Equality.Has_refl";have="Corelib.ssr.ssreflect_rw.ssr_have_upoly"
def run(args,log,env=None,cwd=T):
 with log.open("w")as f:return subprocess.run(list(map(str,args)),cwd=cwd,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=300).returncode
def lean(file,log,module):
 env=cli.lean_env();env["LEAN_PATH"]=str(module/"lean")+":"+str(T/".lake/build/lib/lean")
 return run([pathlib.Path.home()/".elan/bin/lean",*cli.native_args(),file],log,env)
results=[]
# Native replay must reject coherent-looking forged families, not just broken JSON.
for tag in ["missing-branch","duplicate-tuple","swapped-tuple","hide-family","replace-type","replace-body","drop-source-level","hide-source-opacity","false-family-binding","ordinary-proof-as-family"]:
 p=H if tag in ["hide-source-opacity","false-family-binding","ordinary-proof-as-family"] else E
 rows=loadsrc(p);name=have if p==H else eq;d=get(rows,name);f=d["native"]["quality_family"]
 if tag=="missing-branch":
  branch=f["members"][0]["name"];rows=[x for x in rows if x.get("name")!=branch]
 elif tag=="duplicate-tuple":f["members"][1]=copy.deepcopy(f["members"][0])
 elif tag=="swapped-tuple":f["members"][0]["qualities"],f["members"][1]["qualities"]=f["members"][1]["qualities"],f["members"][0]["qualities"]
 elif tag=="hide-family":del d["native"]["quality_family"]
 elif tag=="replace-type":d["type"]=copy.deepcopy(get(rows,eq+"__rocq2lean_quality_PP")["type"])
 elif tag=="replace-body":d["body"]=copy.deepcopy(get(rows,eq+"__rocq2lean_quality_PP")["body"])
 elif tag=="drop-source-level":
  f["level_parameters"]-=1
  for m in f["members"]:get(rows,m["name"])["universes"]["names"].pop()
 elif tag=="hide-source-opacity":
  f["body_kind"]="transparent"
  for m in f["members"]:
   b=get(rows,m["name"]);b["native"]["body_kind"]="transparent";b["body_state"]="transparent"
 elif tag in ["false-family-binding","ordinary-proof-as-family"]:
  # Rebind every identity consistently so only the native original distinguishes it.
  replacement=name+"_nonexistent" if tag=="false-family-binding" else "Corelib.ssr.ssreflect_rw.ssr_have"
  rows=[x for x in rows if x.get("name")!=replacement]
  mapping={m["name"]:m["name"].replace(name,replacement)for m in f["members"]}
  for m in f["members"]:
   b=get(rows,m["name"]);b["name"]=mapping[b["name"]];b["native"]["quality_branch"]["source"]=replacement
   m["name"]=mapping[m["name"]]
  f["source"]=replacement
 inp=O/(tag+".ndjson");inp.write_text("".join(json.dumps(d)+"\n"for d in rows));out=O/(tag+"-roundtrip")
 rc=run([sys.executable,"-I",T/"tools/roundtrip.py",inp,out,"--","Corelib.Init.Equality" if p==E else "Corelib.ssr.ssreflect_rw"],O/(tag+".log"),cli.opam_env())
 result=json.loads((out/"roundtrip.json").read_text())
 assert rc!=0 and result["status"]!="OK",(tag,result)
 results.append({"name":tag,"source_roundtrip":"REJECTED"});print(tag,"PASS",flush=True)
# These alternate targets are valid Lean declarations but not the source translation.
for tag in ["omit-accepted-branch","failed-branch-accepted-family","narrow-type-to-prop","change-reflexivity-to-universality","drop-unused-public-level","opaque-data-to-def","opaque-proof-to-def"]:
 p=H if tag.startswith("opaque-")else E
 report=json.loads((p/"translation_report.json").read_text());name=have if p==H else eq
 if tag=="opaque-proof-to-def":name=have+"__rocq2lean_quality_PP"
 if tag=="drop-unused-public-level":name=eq+"__rocq2lean_quality_PP"
 row=next(d for d in report["results"]if d["source"]==name)
 if tag in ["omit-accepted-branch","failed-branch-accepted-family"]:
  aux=eq+"__rocq2lean_quality_SS"
  if tag=="omit-accepted-branch":report["results"]=[d for d in report["results"]if d["source"]!=aux]
  else:next(d for d in report["results"]if d["source"]==aux)["status"]="TRANSLATION_FAILED"
 elif tag=="narrow-type-to-prop":
  other=next(d for d in report["results"]if d["source"]==eq+"__rocq2lean_quality_PP")
  row["target_type"]=copy.deepcopy(other["target_type"]);row["target_value"]=copy.deepcopy(other["target_value"])
 elif tag=="change-reflexivity-to-universality":
  # fun eq => forall A x y, eq A x y
  b=row["target_value"]["b"]["b"]
  assert b["k"]=="forall"
  b["b"]={"k":"forall","n":"y","t":{"k":"bvar","i":1},"b":
    {"k":"app","f":{"k":"app","f":{"k":"app","f":{"k":"bvar","i":3},"a":{"k":"bvar","i":2}},"a":{"k":"bvar","i":1}},"a":{"k":"bvar","i":0}}}
 elif tag=="drop-unused-public-level":row["level_params"].pop()
 else:row["target_kind"]="def"
 inp=O/(tag+".json");inp.write_text(json.dumps(report))
 ko=O/(tag+"-kernel.json");lc=O/(tag+"-replay.lean")
 lc.write_text("import Rocq2Lean.Replay\n#rocq2lean_replay "+json.dumps(str(inp))+" "+json.dumps(str(ko))+"\n")
 assert lean(lc,O/(tag+"-kernel.log"),p)==0,(tag,(O/(tag+"-kernel.log")).read_text())
 kr=json.loads(ko.read_text());assert all(d["kernel"]=="ACCEPTED"for d in kr["results"]),(tag,kr)
 ao=O/(tag+"-audit.json")
 rc=run([sys.executable,"-I",T/"tools/audit.py",p/"source.ndjson",p/"contract.json",inp,ao,p/"consumer_result.json"],O/(tag+"-audit.log"))
 ar=json.loads(ao.read_text());assert rc!=0 and ar["status"]=="AUDIT_REJECTED",(tag,ar)
 co=O/(tag+"-consumer.json");lc=O/(tag+"-consumer.lean")
 lc.write_text("import Rocq2LeanOut\nimport Rocq2Lean.Verify\n#rocq2lean_verify "+json.dumps(str(p/"contract.json"))+" "+json.dumps(str(inp))+" "+json.dumps(str(co))+"\n")
 rc=lean(lc,O/(tag+"-consumer.log"),p)
 cr=json.loads(co.read_text());assert cr["status"]!="OK",(tag,rc,cr)
 results.append({"name":tag,"kernel":"ACCEPTED","audit":"REJECTED","consumer":"REJECTED"});print(tag,"PASS",flush=True)
res={"status":"PASS","source_mutations":10,"kernel_valid_target_mutations":7,"controls":results}
(O/"result.json").write_text(json.dumps(res,indent=2)+"\n");print(json.dumps(res),flush=True)

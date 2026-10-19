#!/usr/bin/env python3
import pathlib,sys,subprocess,os,json,copy
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/template-quality-metadata/translator";O=R/"work/tests/template-quality-metadata"
assert not T.exists();T.parent.mkdir(parents=True)
subprocess.run(["rsync","-a","--exclude=.git","--exclude=.work",str(R/"translator")+"/",str(T)+"/"],check=True)
print("SNAPSHOT_READY",flush=True)
O.mkdir(parents=True)
roots=["Corelib.Init.Datatypes."+x for x in ["prod","sum","list"]]+["Corelib.Init.Specif."+x for x in ["sig","sig2","sigT","sigT2"]]+["Corelib.Init.Logic.ex"]
with (O/"export.log").open("w")as log:
 rc=subprocess.run([sys.executable,"-I",str(T/"tools/rocq2lean.py"),"export","--mode","statement","--manifest",str(R/"work/fixtures/template-type/source.json"),"--roots",",".join(roots),"--out",str(O)],cwd=T,stdout=log,stderr=subprocess.STDOUT,timeout=600).returncode
assert rc==0,(O/"export.log").read_text()[-5000:]
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli,roundtrip
os.environ.update(cli.opam_env())
rows=[json.loads(l)for l in (O/"source.ndjson").read_text().splitlines()if l.strip()]
decls=[d for d in rows if d.get("name")in roots]
assert len(decls)==len(roots),(len(decls),[d.get("name")for d in rows])
out=O/"native-positive";(out/"logs").mkdir(parents=True)
req=["Corelib.Init.Datatypes","Corelib.Init.Specif","Corelib.Init.Logic"]
res=roundtrip.check_native_meta(decls,out,[],req);assert res["status"]=="OK",res
records={d["name"]:d["native"]["template_info"]for d in decls}
for name in ["Corelib.Init.Datatypes.prod","Corelib.Init.Specif.sig","Corelib.Init.Specif.sig2","Corelib.Init.Specif.sigT","Corelib.Init.Specif.sigT2"]:
 ti=records[name];assert ti["default_qualities"]==[{"k":"type"}],(name,ti)
 assert ti["conclusion_quality"]=={"k":"var","i":0},(name,ti)
 assert any(q=={"k":"var","i":0}for q in ti["parameter_qualities"]),(name,ti)
neg=[]
root="Corelib.Init.Datatypes.prod"
for tag in ["missing-binding","wrong-parameter-index","wrong-conclusion","wrong-default","split-shared-quality"]:
 bad=copy.deepcopy(decls);ti=next(d for d in bad if d["name"]==root)["native"]["template_info"]
 if tag=="missing-binding":del ti["parameter_qualities"]
 elif tag=="wrong-parameter-index":ti["parameter_qualities"][0]={"k":"var","i":9}
 elif tag=="wrong-conclusion":ti["conclusion_quality"]={"k":"type"}
 elif tag=="wrong-default":ti["default_qualities"]=[{"k":"prop"}]
 else:
  ti["default_qualities"].append({"k":"type"})
  ti["parameter_qualities"][1]={"k":"var","i":1}
 out=O/tag;(out/"logs").mkdir(parents=True)
 result=roundtrip.check_native_meta(bad,out,[],req)
 assert result["status"]=="MISMATCH" and any(root in p for p in result["problems"]),(tag,result)
 neg.append(tag)
result={"status":"PASS","fresh_source_records":records,"negative_controls":neg,"translation_changes":False}
(O/"result.json").write_text(json.dumps(result,indent=2)+"\n");print(json.dumps(result),flush=True)

import pathlib,sys,os,subprocess,json
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/native-quality-context3/translator";O=R/"work/tests/native-quality-context3"
assert not T.exists();T.parent.mkdir(parents=True);O.mkdir(parents=True)
subprocess.run(["rsync","-a","--exclude=.git","--exclude=.work",str(R/"translator")+"/",str(T)+"/"],check=True)
print("SNAPSHOT_READY",flush=True)
names=["direct_prod_pp","through_type_prod","direct_sigma_pp","through_type_sigma"]
roots=["CoreQualityDispatch.Source."+n for n in names]
env=dict(os.environ,ROCQ2LEAN_REFERENCE_QUALITY_TRACE=str(O/"native-reference-qualities.ndjson"))
with(O/"export.log").open("w")as log:
 rc=subprocess.run([sys.executable,"-I",str(T/"tools/rocq2lean.py"),"export","--mode","statement","--manifest",str(R/"work/fixtures/quality-dispatch/source.json"),"--roots",",".join(roots),"--out",str(O)],cwd=T,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=600).returncode
assert rc==0,(O/"export.log").read_text()[-5000:]
records=[json.loads(l)for l in (O/"native-reference-qualities.ndjson").read_text().splitlines()]
selected=[d for d in records if d["owner"]in roots and d["phase"]=="body" and d["kind"]=="inductive" and any(d["reference"].startswith(n+":")for n in["Corelib.Init.Datatypes.prod","Corelib.Init.Specif.sigT"])]
selected=list({json.dumps(d,sort_keys=True):d for d in selected}.values())
assert len(selected)==4,selected
assert all(not d["qualities"] and not d["levels"]for d in selected)
apps=[d for d in records if d["owner"]in roots and d["phase"]=="body" and d["kind"]=="template_application"]
apps=list({json.dumps(d,sort_keys=True):d for d in apps}.values());assert len(apps)==4,apps
for d in apps:
 want="Prop"if ".direct_"in d["owner"]else"Type"
 assert d["result_quality"]==want,d
result={"status":"PASS","native_instances":selected,"source_context_applications":apps,"translation_changes":False}
(O/"result.json").write_text(json.dumps(result,indent=2)+"\n");print(json.dumps(result),flush=True)

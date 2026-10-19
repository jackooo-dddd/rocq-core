import pathlib,subprocess,sys,json
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]);O=pathlib.Path(sys.argv[2]);O.mkdir()
names=["kept_inline","kept_reference","extracted_outer","extracted_branches","extracted_lambda","extracted_opaque","counted","counted_conversion"]
roots=",".join("CoreWfProjectionControls.Source."+n for n in names)
steps=[]
for label,args in [
 ("export",["export","--mode","statement","--manifest",R/"work/fixtures/wf-projection-controls/source.json","--roots",roots,"--out",O]),
 ("translate",["translate","--input",O/"source.ndjson","--out",O]),
 ("validate",["validate","--run",O])]:
 with(O/(label+".log")).open("w")as log:
  rc=subprocess.run([sys.executable,"-I",str(T/"tools/rocq2lean.py"),*map(str,args)],cwd=T,stdout=log,stderr=subprocess.STDOUT,timeout=600).returncode
 print(label,rc,flush=True);steps.append([label,rc])
 if label=="export":assert rc==0
ds={d["name"]:d for l in(O/"source.ndjson").read_text().splitlines()if(d:=json.loads(l)).get("kind")in("constant","inductive")}
r=json.loads((O/"translation_report.json").read_text())
out={"steps":steps,"roots":r["roots"],"source":{n:{"body_state":ds["CoreWfProjectionControls.Source."+n].get("body_state"),"deps":ds["CoreWfProjectionControls.Source."+n].get("deps"),"termination":ds["CoreWfProjectionControls.Source."+n].get("native",{}).get("prepared")}for n in names}}
(O/"result.json").write_text(json.dumps(out,indent=2)+"\n");print(json.dumps(out),flush=True)

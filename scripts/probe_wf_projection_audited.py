import pathlib,subprocess,sys,json
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/quality-main15/translator";O=R/"work/tests/wf-projection-audited";O.mkdir()
for label,args in [
 ("export",["export","--mode","statement","--manifest",R/"work/fixtures/wf-projection/source.json","--roots","CoreWfProjection.Source.projected_fix,CoreWfProjection.Source.projection_conversion","--out",O]),
 ("translate",["translate","--input",O/"source.ndjson","--out",O]),
 ("validate",["validate","--run",O])]:
 with(O/(label+".log")).open("w")as log:
  rc=subprocess.run([sys.executable,"-I",str(T/"tools/rocq2lean.py"),*map(str,args)],cwd=T,stdout=log,stderr=subprocess.STDOUT,timeout=600).returncode
 print(label,rc,flush=True)
 if label=="export":assert rc==0
ds={d["name"]:d for l in(O/"source.ndjson").read_text().splitlines()if(d:=json.loads(l)).get("kind")in("constant","inductive")}
report=json.loads((O/"translation_report.json").read_text())
out={"purpose":"diagnostic of extraction after source-convertible projection expansion","roots":report["roots"],"source_guard":ds["CoreWfProjection.Source.projected_fix"].get("termination"),"obligations":ds["CoreWfProjection.Source.projected_fix"].get("obligations")}
(O/"result.json").write_text(json.dumps(out,indent=2)+"\n")
print(json.dumps(out),flush=True)

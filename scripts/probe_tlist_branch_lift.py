import pathlib,subprocess,sys,json
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/tlist-branch-lift1/translator";O=R/"work/tests/tlist-branch-lift1";O.mkdir()
for label,args in [
 ("export",["export","--mode","statement","--manifest",R/"work/fixtures/tlist-frontier/source.json","--roots","CoreTlistFrontier.Source.arrows,CoreTlistFrontier.Source.predicate,CoreTlistFrontier.Source.extension,CoreTlistFrontier.Source.intersection","--out",O]),
 ("translate",["translate","--input",O/"source.ndjson","--out",O]),
 ("validate",["validate","--run",O])]:
 with(O/(label+".log")).open("w")as log:
  rc=subprocess.run([sys.executable,"-I",str(T/"tools/rocq2lean.py"),*map(str,args)],cwd=T,stdout=log,stderr=subprocess.STDOUT,timeout=600).returncode
 print(label,rc,flush=True)
 if label=="export":assert rc==0
r=json.loads((O/"translation_report.json").read_text())
out=[{k:x.get(k)for k in ["source","status","message","level_interp"]}for x in r["results"]]
(O/"result.json").write_text(json.dumps(out,indent=2)+"\n");print(json.dumps(out),flush=True)

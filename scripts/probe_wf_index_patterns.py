import pathlib,subprocess,sys,json
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]);O=pathlib.Path(sys.argv[2]);O.mkdir()
names=["pair_rec","triple_rec","custom_rec","counted_pair","repeated","sum_index"]
roots=",".join("CoreWfIndex.Source."+n for n in names)
for label,args in [
 ("export",["export","--mode","statement","--manifest",R/"work/fixtures/wf-index-patterns/source.json","--roots",roots,"--out",O]),
 ("translate",["translate","--input",O/"source.ndjson","--out",O]),
 ("validate",["validate","--run",O])]:
 with(O/(label+".log")).open("w")as log:
  rc=subprocess.run([sys.executable,"-I",str(T/"tools/rocq2lean.py"),*map(str,args)],cwd=T,stdout=log,stderr=subprocess.STDOUT,timeout=600).returncode
 print(label,rc,flush=True)
 if label=="export":assert rc==0
r=json.loads((O/"translation_report.json").read_text())
out=[{k:x.get(k)for k in ["source","status","message","level_params"]}for x in r["results"]if x["source"].startswith("CoreWfIndex.Source.")]
(O/"result.json").write_text(json.dumps(out,indent=2)+"\n");print(json.dumps(out),flush=True)

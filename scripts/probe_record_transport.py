import pathlib,subprocess,sys,json
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]);O=pathlib.Path(sys.argv[2]);O.mkdir()
roots=",".join("CoreRecordTransport.Source."+n for n in ["keep_sigma","prop_sigma","keep_product","prop_product"])
for label,args in [
 ("export",["export","--mode","proof","--manifest",R/"work/fixtures/record-transport/source.json","--roots",roots,"--out",O]),
 ("translate",["translate","--input",O/"source.ndjson","--out",O]),
 ("verify",["verify","--run",O])]:
 with(O/(label+".log")).open("w")as log:
  rc=subprocess.run([sys.executable,"-I",str(T/"tools/rocq2lean.py"),*map(str,args)],cwd=T,stdout=log,stderr=subprocess.STDOUT,timeout=600).returncode
 print(label,rc,flush=True)
 if label=="export":assert rc==0
rep=json.loads((O/"translation_report.json").read_text())
(O/"result.json").write_text(json.dumps([{"source":x["source"],"status":x["status"],"message":x["message"]}for x in rep["results"]],indent=2)+"\n")

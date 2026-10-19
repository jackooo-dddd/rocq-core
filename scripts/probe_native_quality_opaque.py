import pathlib,subprocess,sys,json
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]);O=pathlib.Path(sys.argv[2]);O.mkdir()
fixture=R/"work/fixtures/native-quality-opaque-client";roots=",".join(json.loads((fixture/"roots.json").read_text()))
for mode in ["proof","statement"]:
 p=O/mode;p.mkdir()
 for label,args in [
  ("export",["export","--mode",mode,"--manifest",fixture/"source.json","--roots",roots,"--out",p]),
  ("translate",["translate","--input",p/"source.ndjson","--out",p]),
  ("verify",["verify" if mode=="proof" else "validate","--run",p])]:
  with(p/(label+".log")).open("w")as log:
   rc=subprocess.run([sys.executable,"-I",str(T/"tools/rocq2lean.py"),*map(str,args)],cwd=T,stdout=log,stderr=subprocess.STDOUT,timeout=900).returncode
  print(mode,label,rc,flush=True)
  assert rc==0,(mode,label)
(O/"result.json").write_text(json.dumps({"status":"PASS","modes":["proof","statement"],"roots":len(roots.split(","))},indent=2)+"\n")

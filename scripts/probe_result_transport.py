#!/usr/bin/env python3
import pathlib,subprocess,sys,json,os
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/quality-dispatch5/translator";O=R/"work/tests/result-transport-probe";O.mkdir()
os.environ["LEAN_NUM_THREADS"]="4";os.environ["ROCQ2LEAN_LEAN_THREADS"]="4"
roots=",".join("CoreLift.Lift."+n for n in["raise_type","raise_value","lower_value","roundtrip","raise_poly","roundtrip_poly"])
exits={}
for label,args in[("export",["export","--mode","statement","--manifest",T/"fixtures/corelib-universe-lift/source.json","--roots",roots,"--out",O]),("translate",["translate","--input",O/"source.ndjson","--out",O]),("validate",["validate","--run",O])]:
 with(O/(label+".log")).open("w")as log:
  rc=subprocess.run([sys.executable,"-I",str(T/"tools/rocq2lean.py"),*map(str,args)],cwd=T,stdout=log,stderr=subprocess.STDOUT,timeout=900).returncode
 exits[label]=rc;print(label,rc,flush=True)
 if label=="export":assert rc==0
rep=json.loads((O/"translation_report.json").read_text())
(O/"result.json").write_text(json.dumps({"purpose":"diagnostic, not a certified campaign","exits":exits,"roots":rep["roots"]},indent=2)+"\n")

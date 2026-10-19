#!/usr/bin/env python3
"""Production CLI probe: retain every source fixture root in both modes."""
import pathlib,subprocess,sys,json,os
R=pathlib.Path(__file__).resolve().parents[1]
T=pathlib.Path(sys.argv[1]);O=pathlib.Path(sys.argv[2]);O.mkdir(parents=True)
os.environ["LEAN_NUM_THREADS"]="4";os.environ["ROCQ2LEAN_LEAN_THREADS"]="4"
roots=json.loads((R/"work/tests/quality-source-native4/roots.json").read_text())
summary={}
for mode in ["proof","statement"]:
 run=O/mode;run.mkdir();exits={}
 for label,args in [
  ("export",["export","--mode",mode,"--manifest",R/"work/fixtures/quality-source4/source.json","--roots",",".join(roots),"--out",run]),
  ("translate",["translate","--input",run/"source.ndjson","--out",run]),
  ("validate",["verify" if mode=="proof" else "validate","--run",run])]:
  with(run/(label+".log")).open("w")as log:
   rc=subprocess.run([sys.executable,"-I",str(T/"tools/rocq2lean.py"),*map(str,args)],cwd=T,stdout=log,stderr=subprocess.STDOUT,timeout=1200).returncode
  exits[label]=rc;print(mode,label,rc,flush=True)
  if label=="export":assert rc==0
 rep=json.loads((run/"translation_report.json").read_text())
 summary[mode]={"exits":exits,"roots":rep["roots"],"auxiliary_families":[r["source"]for r in rep["results"]if r.get("quality_prop")]}
 (O/"result.json").write_text(json.dumps(summary,indent=2)+"\n")
print("PROBE_COMPLETE",flush=True)

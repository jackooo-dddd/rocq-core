#!/usr/bin/env python3
import pathlib,sys,subprocess,json,time,os
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/poly-lift/translator"
os.environ["LEAN_NUM_THREADS"]="4";os.environ["ROCQ2LEAN_LEAN_THREADS"]="4"
deadline=time.time()+900
while not (R/"work/logs/poly-lift-build.json").exists():
 if time.time()>deadline:raise RuntimeError("build record absent; inspect original build")
 time.sleep(2)
assert json.loads((R/"work/logs/poly-lift-build.json").read_text())["exit"]==0
assert not T.exists();T.parent.mkdir(parents=True)
subprocess.run(["rsync","-a","--exclude=.git","--exclude=.work",str(R/"translator")+"/",str(T)+"/"],check=True)
print("SNAPSHOT_READY",flush=True)
args=[sys.executable,str(R/"scripts/corelib_lab.py"),"--translator",str(T),"--out",str(R/"work/runs/poly-lift-targeted")]
for m in ["Corelib.Classes.CMorphisms","Corelib.Classes.CRelationClasses"]:args+=["--module",m]
with (R/"work/logs/poly-lift-targeted.log").open("w") as log:
 rc=subprocess.run(args,cwd=R,stdout=log,stderr=subprocess.STDOUT).returncode
print("TARGETED_COMPLETE",rc,flush=True);assert rc==0
O=R/"work/tests/poly-lift-raise";O.mkdir(parents=True)
exits={}
for label,args in [("export",["export","--mode","statement","--manifest",T/"fixtures/corelib-universe-lift/source.json","--roots","CoreLift.Lift.raise_poly","--out",O]),("translate",["translate","--input",O/"source.ndjson","--out",O]),("validate",["validate","--run",O])]:
 with (O/(label+".log")).open("w")as log:
  rc=subprocess.run([sys.executable,"-I",str(T/"tools/rocq2lean.py"),*map(str,args)],cwd=T,stdout=log,stderr=subprocess.STDOUT,timeout=900).returncode
 exits[label]=rc
 print(label,rc,flush=True)
 if label=="export":assert rc==0
(O/"result.json").write_text(json.dumps(exits,indent=2)+"\n")
print("PROBE_COMPLETE",flush=True)

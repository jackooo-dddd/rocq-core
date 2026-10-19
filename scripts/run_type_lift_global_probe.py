#!/usr/bin/env python3
import pathlib,sys,subprocess,json,time,os
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/type-lift-global/translator"
os.environ["LEAN_NUM_THREADS"]="4";os.environ["ROCQ2LEAN_LEAN_THREADS"]="4"
deadline=time.time()+900
while not (R/"work/logs/type-lift-global-build.json").exists():
 if time.time()>deadline:raise RuntimeError("build record absent; inspect original build")
 time.sleep(2)
assert json.loads((R/"work/logs/type-lift-global-build.json").read_text())["exit"]==0
assert not T.exists();T.parent.mkdir(parents=True)
subprocess.run(["rsync","-a","--exclude=.git","--exclude=.work",str(R/"translator")+"/",str(T)+"/"],check=True)
print("SNAPSHOT_READY",flush=True)
args=[sys.executable,str(R/"scripts/corelib_lab.py"),"--translator",str(T),"--out",str(R/"work/runs/type-lift-global-targeted")]
for m in ["Corelib.Classes.RelationClasses","Corelib.Classes.CMorphisms","Corelib.Classes.CRelationClasses"]:args+=["--module",m]
with (R/"work/logs/type-lift-global-targeted.log").open("w") as log:
 rc=subprocess.run(args,cwd=R,stdout=log,stderr=subprocess.STDOUT).returncode
print("TARGETED_COMPLETE",rc,flush=True);assert rc==0
print("PROBE_COMPLETE",flush=True)

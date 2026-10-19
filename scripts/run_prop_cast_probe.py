#!/usr/bin/env python3
import pathlib,sys,subprocess,json,time
R=pathlib.Path(__file__).resolve().parents[1];T=R/'work/snapshots/prop-cast/translator'
build=R/'work/logs/prop-cast-build.json';deadline=time.time()+900
while not build.exists():
 if time.time()>deadline:raise RuntimeError('build did not finish; inspect original process')
 time.sleep(2)
assert json.loads(build.read_text())['exit']==0,build.read_text()
assert not T.exists(),'do not overwrite frozen sources'
T.parent.mkdir(parents=True)
subprocess.run(['rsync','-a','--exclude=.git','--exclude=.work',str(R/'translator')+'/',str(T)+'/'],check=True)

args=[sys.executable,str(R/'scripts/probe_prop_cast.py'),str(T),str(R/'work/tests/prop-cast-probe')]
print('START probe',flush=True)
with (R/'work/logs/prop-cast-probe.log').open('w') as log:
 rc=subprocess.run(args,cwd=R,stdout=log,stderr=subprocess.STDOUT).returncode
print('END probe',rc,flush=True);assert rc==0

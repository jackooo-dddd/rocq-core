#!/usr/bin/env python3
import pathlib,sys,subprocess,json,time
R=pathlib.Path(__file__).resolve().parents[1];T=R/'work/snapshots/template-sort/translator'
build=R/'work/logs/template-sort-build.json';deadline=time.time()+900
while not build.exists():
 if time.time()>deadline:raise RuntimeError('build did not finish; inspect original process')
 time.sleep(2)
assert json.loads(build.read_text())['exit']==0,build.read_text()
assert not T.exists(),'do not overwrite frozen sources'
T.parent.mkdir(parents=True)
subprocess.run(['rsync','-a','--exclude=.git','--exclude=.work',str(R/'translator')+'/',str(T)+'/'],check=True)
args=[sys.executable,str(R/'scripts/corelib_lab.py'),'--translator',str(T),'--out',str(R/'work/runs/template-sort-targeted')]
for m in ['Corelib.Init.Logic','Corelib.Init.Datatypes','Corelib.Init.Specif','Corelib.ssr.ssrfun']:args+=['--module',m]
print('START targeted',flush=True)
with (R/'work/logs/template-sort-targeted.log').open('w') as log:
 rc=subprocess.run(args,cwd=R,stdout=log,stderr=subprocess.STDOUT).returncode
print('END targeted',rc,flush=True);assert rc==0

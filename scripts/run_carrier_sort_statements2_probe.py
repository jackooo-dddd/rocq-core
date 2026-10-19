#!/usr/bin/env python3
import pathlib,sys,subprocess
R=pathlib.Path(__file__).resolve().parents[1];T=R/'work/snapshots/carrier-sort-statements2/translator'
rc=subprocess.run([sys.executable,str(R/'scripts/build_translator.py'),str(R/'translator'),str(R/'work/logs/carrier-sort-statements2-build.log')]).returncode
assert rc==0,rc
assert not T.exists();T.parent.mkdir(parents=True)
subprocess.run(['rsync','-a','--exclude=.git','--exclude=.work',str(R/'translator')+'/',str(T)+'/'],check=True)
args=[sys.executable,str(R/'scripts/corelib_lab.py'),'--translator',str(T),'--out',str(R/'work/runs/carrier-sort-statements2-targeted')]
for m in ['Corelib.Init.Datatypes','Corelib.Init.Logic','Corelib.Init.Specif','Corelib.Classes.RelationClasses']:args+=['--module',m]
with (R/'work/logs/carrier-sort-statements2-targeted.log').open('w') as log:
 rc=subprocess.run(args,cwd=R,stdout=log,stderr=subprocess.STDOUT).returncode
print('TARGETED_COMPLETE',rc,flush=True);assert rc==0

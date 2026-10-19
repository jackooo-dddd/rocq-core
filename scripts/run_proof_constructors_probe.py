#!/usr/bin/env python3
import pathlib,subprocess,sys
R=pathlib.Path(__file__).resolve().parents[1];T=R/'work/snapshots/proof-constructors/translator'
args=[sys.executable,str(R/'scripts/corelib_lab.py'),'--translator',str(T),'--out',str(R/'work/runs/proof-constructors-targeted')]
for m in ['Corelib.Init.Datatypes','Corelib.Init.Logic','Corelib.Init.Specif']:args+=['--module',m]
with (R/'work/logs/proof-constructors-targeted.log').open('w') as log:
 rc=subprocess.run(args,cwd=R,stdout=log,stderr=subprocess.STDOUT).returncode
print('targeted exit',rc,flush=True);assert rc==0

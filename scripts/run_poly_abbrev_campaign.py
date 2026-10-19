#!/usr/bin/env python3
import pathlib,sys,subprocess
R=pathlib.Path(__file__).resolve().parents[1];T=R/'work/snapshots/poly-abbrev/translator'
def call(args,label):
 print('START',label,flush=True)
 with (R/('work/logs/'+label+'.log')).open('w') as log:
  rc=subprocess.run([sys.executable,*map(str,args)],cwd=R,stdout=log,stderr=subprocess.STDOUT).returncode
 print('END',label,rc,flush=True);assert rc==0,(label,rc)
call([R/'scripts/test_poly_abbrev.py',T,R/'work/tests/poly-abbrev'],'poly-abbrev-tests')
call([R/'scripts/corelib_lab.py','--translator',T,'--out',R/'work/runs/poly-abbrev-targeted','--module','Corelib.Classes.CRelationClasses','--module','Corelib.Classes.CMorphisms','--module','Corelib.Classes.RelationClasses'],'poly-abbrev-targeted')
print('TARGETED_COMPLETE',flush=True)

#!/usr/bin/env python3
import pathlib,sys,subprocess,json
R=pathlib.Path(__file__).resolve().parents[1];T=R/'work/snapshots/prop-cast/translator'

def call(args,label):
 print('START',label,flush=True)
 with (R/('work/logs/'+label+'.log')).open('w') as log:
  rc=subprocess.run([sys.executable,*map(str,args)],cwd=R,stdout=log,stderr=subprocess.STDOUT).returncode
 print('END',label,rc,flush=True);assert rc==0,(label,rc)
call([R/'scripts/test_prop_cast.py',T,R/'work/tests/prop-cast'],'prop-cast-tests3')
call([R/'scripts/corelib_lab.py','--translator',T,'--out',R/'work/runs/prop-cast-full'],'prop-cast-full')
call([R/'scripts/compare_corelib_runs.py',R/'work/runs/template-sort-full',R/'work/runs/prop-cast-full','--out',R/'work/prop-cast-delta.json'],'prop-cast-delta')
d=json.loads((R/'work/prop-cast-delta.json').read_text())
assert not d['status_regressions'] and not d['validation_regressions'],d
call([T/'tests/statement/check_statement.py'],'prop-cast-statement-suite')
print('CAMPAIGN_COMPLETE',flush=True)

#!/usr/bin/env python3
import pathlib,sys,subprocess,json
R=pathlib.Path(__file__).resolve().parents[1];T=R/'work/snapshots/poly-abbrev/translator'
assert json.loads((R/'work/tests/poly-abbrev/result.json').read_text())['status']=='PASS'
def call(args,label):
 print('START',label,flush=True)
 with (R/('work/logs/'+label+'.log')).open('w') as log:
  rc=subprocess.run([sys.executable,*map(str,args)],cwd=R,stdout=log,stderr=subprocess.STDOUT).returncode
 print('END',label,rc,flush=True);assert rc==0,(label,rc)
call([R/'scripts/corelib_lab.py','--translator',T,'--out',R/'work/runs/poly-abbrev-full'],'poly-abbrev-full')
call([R/'scripts/compare_corelib_runs.py',R/'work/runs/native-float-full',R/'work/runs/poly-abbrev-full','--out',R/'work/poly-abbrev-delta.json'],'poly-abbrev-delta')
d=json.loads((R/'work/poly-abbrev-delta.json').read_text())
assert not d['status_regressions'] and not d['validation_regressions'],d
call([T/'tests/statement/check_statement.py'],'poly-abbrev-statement-suite')
print('CAMPAIGN_COMPLETE',flush=True)

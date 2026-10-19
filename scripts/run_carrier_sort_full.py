#!/usr/bin/env python3
import pathlib,sys,subprocess,json
R=pathlib.Path(__file__).resolve().parents[1];T=R/'work/snapshots/carrier-sort-statements3/translator'
def call(args,label):
 print('START',label,flush=True)
 with (R/('work/logs/'+label+'.log')).open('w') as log:
  rc=subprocess.run([sys.executable,*map(str,args)],cwd=R,stdout=log,stderr=subprocess.STDOUT).returncode
 print('END',label,rc,flush=True);assert rc==0,(label,rc)
call([R/'scripts/test_carrier_sort.py',T,R/'work/tests/carrier-sort-statements3-checked'],'carrier-sort-checked-tests')
call([R/'scripts/corelib_lab.py','--translator',T,'--out',R/'work/runs/carrier-sort-full'],'carrier-sort-full')
call([R/'scripts/compare_corelib_runs.py',R/'work/runs/proof-references-full',R/'work/runs/carrier-sort-full','--out',R/'work/carrier-sort-delta.json'],'carrier-sort-delta')
d=json.loads((R/'work/carrier-sort-delta.json').read_text())
assert not d['status_regressions'] and not d['validation_regressions'],d
call([T/'tests/statement/check_statement.py'],'carrier-sort-statement-suite')
print('CAMPAIGN_COMPLETE',flush=True)

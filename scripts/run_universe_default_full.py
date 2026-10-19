#!/usr/bin/env python3
import pathlib,sys,subprocess,json
R=pathlib.Path(__file__).resolve().parents[1];T=R/'work/snapshots/universe-default2/translator'
def call(args,label):
 print('START',label,flush=True)
 with (R/('work/logs/'+label+'.log')).open('w') as log:
  rc=subprocess.run([sys.executable,*map(str,args)],cwd=R,stdout=log,stderr=subprocess.STDOUT).returncode
 print('END',label,rc,flush=True);assert rc==0,(label,rc)
for tag in ['carrier-sort','template-type','proof-references']:
 assert json.loads((R/('work/tests/universe-default2-'+tag+'/result.json')).read_text())['status']=='PASS'
assert not json.loads((R/'work/universe-default2-targeted-delta.json').read_text())['status_regressions']
call([R/'scripts/corelib_lab.py','--translator',T,'--out',R/'work/runs/universe-default-full'],'universe-default-full')
call([R/'scripts/compare_corelib_runs.py',R/'work/runs/proof-references-full',R/'work/runs/universe-default-full','--out',R/'work/universe-default-delta.json'],'universe-default-delta')
d=json.loads((R/'work/universe-default-delta.json').read_text())
assert not d['status_regressions'] and not d['validation_regressions'],d
call([T/'tests/statement/check_statement.py'],'universe-default-statement-suite')
print('CAMPAIGN_COMPLETE',flush=True)

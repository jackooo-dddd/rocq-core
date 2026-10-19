#!/usr/bin/env python3
import pathlib,sys,subprocess,json
R=pathlib.Path(__file__).resolve().parents[1];T=R/'work/snapshots/proof-references/translator'
def call(args,label):
 print('START',label,flush=True)
 with (R/('work/logs/'+label+'.log')).open('w') as log:
  rc=subprocess.run([sys.executable,*map(str,args)],cwd=R,stdout=log,stderr=subprocess.STDOUT).returncode
 print('END',label,rc,flush=True);assert rc==0,(label,rc)
call([R/'scripts/corelib_lab.py','--translator',T,'--out',R/'work/runs/proof-references-full'],'proof-references-full')
call([R/'scripts/compare_corelib_runs.py',R/'work/runs/mono-abbrev-full',R/'work/runs/proof-references-full','--out',R/'work/proof-references-delta.json'],'proof-references-delta')
d=json.loads((R/'work/proof-references-delta.json').read_text())
assert not d['status_regressions'] and not d['validation_regressions'],d
call([T/'tests/statement/check_statement.py'],'proof-references-statement-suite')
print('REGRESSION_COMPLETE; dedicated proof-reference fixture also required',flush=True)

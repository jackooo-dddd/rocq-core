#!/usr/bin/env python3
import pathlib,sys,subprocess,json
R=pathlib.Path(__file__).resolve().parents[1];T=R/'work/snapshots/mono-abbrev/translator'
def call(args,label):
 print('START',label,flush=True)
 with (R/('work/logs/'+label+'.log')).open('w') as log:
  rc=subprocess.run([sys.executable,*map(str,args)],cwd=R,stdout=log,stderr=subprocess.STDOUT).returncode
 print('END',label,rc,flush=True);assert rc==0,(label,rc)
for script,tag in [('test_template_sort.py','template-sort'),('test_prop_cast.py','prop-cast'),('test_poly_abbrev.py','poly-abbrev'),('test_proof_constructors.py','proof-constructors')]:
 call([R/'scripts'/script,T,R/('work/tests/mono-abbrev-'+tag)],'mono-abbrev-'+tag+'-tests')
call([R/'scripts/corelib_lab.py','--translator',T,'--out',R/'work/runs/mono-abbrev-full'],'mono-abbrev-full')
# Compare directly with the last certified version: the intermediate template-sort
# snapshot had three regressions, so it must not be the certification baseline.
call([R/'scripts/compare_corelib_runs.py',R/'work/runs/poly-abbrev-full',R/'work/runs/mono-abbrev-full','--out',R/'work/mono-abbrev-delta.json'],'mono-abbrev-delta')
d=json.loads((R/'work/mono-abbrev-delta.json').read_text())
assert not d['status_regressions'] and not d['validation_regressions'],d
call([T/'tests/statement/check_statement.py'],'mono-abbrev-statement-suite')
print('CAMPAIGN_COMPLETE',flush=True)

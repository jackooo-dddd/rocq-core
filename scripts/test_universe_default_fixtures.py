#!/usr/bin/env python3
import pathlib,subprocess,sys,os
R=pathlib.Path(__file__).resolve().parents[1];T=R/'work/snapshots/universe-default2/translator'
for script,tag in [('test_carrier_sort.py','carrier-sort'),('test_template_type.py','template-type'),('test_proof_references.py','proof-references')]:
 with(R/('work/logs/universe-default2-'+tag+'-tests.log')).open('w')as log:
  p=subprocess.run([sys.executable,str(R/'scripts'/script),str(T),str(R/('work/tests/universe-default2-'+tag))],cwd=R,stdout=log,stderr=subprocess.STDOUT)
 print(tag,p.returncode,flush=True);assert p.returncode==0
print('ALL_FIXTURES_PASS',flush=True)

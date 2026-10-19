#!/usr/bin/env python3
"""Use the measured M subset; non-M mechanisms retain the original translator behavior."""
from pathlib import Path
import argparse,json,os,subprocess,sys
W=Path(__file__).resolve().parent;R=W.parents[1];T=R/'.work/used-rule-coverage-20261019/translator'
p=argparse.ArgumentParser(description=__doc__);p.add_argument('--input',type=Path,required=True);p.add_argument('--out',type=Path,required=True);a=p.parse_args()
usage=json.loads((W/'M_RULE_USAGE.json').read_text());validation=json.loads((W/'M_PRUNING_VALIDATION.json').read_text())
off=[x['id'] for x in usage['rules'] if not x['used']]
assert validation['status']=='PASS' and validation['disabled_M_rules']==off
assert (T/'Rocq2Lean/RuleTrace.lean').exists(),'Run prepare.py first'
env=os.environ.copy();env['ROCQ2LEAN_DISABLED_ITEMIZED_RULES']=','.join(off)
env.setdefault('LEAN_NUM_THREADS','1');env.setdefault('ROCQ2LEAN_LEAN_THREADS','1')
sys.exit(subprocess.run([sys.executable,T/'tools/rocq2lean.py','translate','--input',a.input.resolve(),'--out',a.out.resolve()],env=env).returncode)

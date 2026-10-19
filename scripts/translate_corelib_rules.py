#!/usr/bin/env python3
"""Translate with the fully itemized, source-bound Corelib rule configuration."""
import argparse,json,os,subprocess,sys
from pathlib import Path
import used_translation_rules as rules
ROOT=Path(__file__).resolve().parents[1];DEFAULT=ROOT/'results/used-rules-validation/RULES.json'
def check(path):
 cfg=json.loads(path.read_text())
 _,_,expected,_=rules.build()
 if cfg!=expected:raise ValueError('UNVALIDATED_RULE_SET: rules or source implementation differ from the itemized configuration')
 # The independently verified corpus is statement mode with no native bootstrap and no assembly.
 assert cfg['mode']=='statement' and not cfg['native_nat_eq_bootstrap'] and not cfg['external_proof_assembly']
 return cfg
def main():
 p=argparse.ArgumentParser(description=__doc__)
 p.add_argument('--rules',type=Path,default=DEFAULT)
 p.add_argument('--check-only',action='store_true')
 p.add_argument('--input',type=Path);p.add_argument('--out',type=Path);a=p.parse_args()
 try:cfg=check(a.rules)
 except (ValueError,AssertionError) as e:
  print(str(e),file=sys.stderr);return 2
 if a.check_only:
  print('RULE_CONFIGURATION_OK: 102 translation/source rules, 8 checks, 5 scheduling entries');return 0
 if a.input is None or a.out is None:p.error('--input and --out are required')
 T=ROOT/cfg['translator'];a.out.mkdir(parents=True,exist_ok=True)
 (a.out/'itemized_rule_configuration.json').write_text(json.dumps(cfg,indent=2,ensure_ascii=False)+'\n')
 env=os.environ.copy()
 # Withdrawn experiment controls do not select this translator's rule set.
 env.pop('ROCQ2LEAN_DISABLED_RULES',None)
 return subprocess.run([sys.executable,T/'tools/rocq2lean.py','translate','--input',a.input.resolve(),'--out',a.out.resolve()],env=env).returncode
if __name__=='__main__':sys.exit(main())

#!/usr/bin/env python3
"""Default entry point for the experimentally selected Corelib configuration."""
import argparse,json,os,sys,subprocess
from pathlib import Path
W=Path(__file__).resolve().parent
p=argparse.ArgumentParser(description=__doc__)
p.add_argument('--configuration',type=Path,default=W/'corelib.json')
p.add_argument('--input',type=Path,required=True);p.add_argument('--out',type=Path,required=True)
a=p.parse_args()
cfg=json.loads(a.configuration.read_text())
known={r['id'] for r in json.loads((W/'mechanisms.json').read_text())}
enabled=cfg['enabled'];disabled=cfg['disabled']
assert len(enabled)==len(set(enabled)) and len(disabled)==len(set(disabled))
assert not(set(enabled)&set(disabled)) and set(enabled)|set(disabled)==known
T=W/'.work/translator'
if not (T/'.lake/build/lib/lean/Rocq2Lean.olean').exists():
 raise SystemExit('Run python3 prepare.py, then build .work/translator with lake build Rocq2Lean Rocq2Lean:shared.')
env=dict(os.environ,ROCQ2LEAN_DISABLED_RULES=','.join(sorted(disabled)))
a.out.mkdir(parents=True,exist_ok=True)
(a.out/'rule_configuration.json').write_text(json.dumps(cfg,indent=2)+'\n')
sys.exit(subprocess.run([sys.executable,T/'tools/rocq2lean.py','translate','--input',a.input.resolve(),'--out',a.out.resolve()],env=env).returncode)

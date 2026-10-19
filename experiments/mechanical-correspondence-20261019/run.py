from pathlib import Path
import sys,subprocess,json
W=Path(__file__).resolve().parent;R=W.parents[1];M=R/'experiments/mechanical-nat-eq-20261019';T=M/'translator'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
name,module=sys.argv[1:3]
env=cli.lean_env();env['LEAN_PATH']=str(W)+':'+str(W/'unified/lean' if module=='unified' else M/'runs/full-v1/Corelib'/module/'lean')+':'+str(T/'.lake/build/lib/lean')
src=W/(name+'.lean')
src.with_suffix('.olean').unlink(missing_ok=True)
(W/'audits'/(name+'.json')).unlink(missing_ok=True)
p=subprocess.run([str(Path.home()/'.elan/bin/lean'),*cli.native_args(),'-o',str(src.with_suffix('.olean')),str(src)],cwd=W,env=env,capture_output=True,text=True,timeout=600)
(W/'logs'/(name+'.log')).write_text(p.stdout+p.stderr)
print(p.stdout+p.stderr)
sys.exit(p.returncode)

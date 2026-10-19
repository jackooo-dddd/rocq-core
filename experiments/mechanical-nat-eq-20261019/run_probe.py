from pathlib import Path
import json,subprocess,time,sys,os
W=Path(__file__).resolve().parent;R=W.parents[1];T=W/'translator'
while not (W/'logs/build.json').exists():time.sleep(2)
b=json.loads((W/'logs/build.json').read_text());assert b['exit']==0,b
env=dict(os.environ,LEAN_NUM_THREADS='4',ROCQ2LEAN_LEAN_THREADS='4')
args=[sys.executable,str(R/'scripts/corelib_lab.py'),'--translator',str(T),'--out',str(W/'runs/probe-v1')]
for m in ['Corelib.Init.Datatypes','Corelib.Init.Logic','Corelib.Init.Nat','Corelib.Init.Specif','Corelib.Init.Equality']:
 args+=['--module',m]
p=subprocess.run(args,env=env)
print('PROBE_EXIT',p.returncode,flush=True)
sys.exit(p.returncode)

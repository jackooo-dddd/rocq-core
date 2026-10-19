from pathlib import Path
import sys,subprocess,json,os
W=Path(__file__).resolve().parent;T=W/'translator'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
results=[]
for test,module in [('MechanicalIdentity','Datatypes'),('NatCompute','Nat')]:
 M=W/'runs/full-v1/Corelib/Init'/module
 env=cli.lean_env();env['LEAN_PATH']=str(M/'lean')+':'+str(T/'.lake/build/lib/lean')
 p=subprocess.run([str(Path.home()/'.elan/bin/lean'),*cli.native_args(),str(W/'tests'/(test+'.lean'))],cwd=W,env=env,capture_output=True,text=True)
 (W/'logs'/(test+'.log')).write_text(p.stdout+p.stderr)
 print(p.stdout+p.stderr)
 results.append({'test':test,'module':module,'exit':p.returncode})
(W/'tests/mechanical-result.json').write_text(json.dumps(results,indent=2))
print('MECHANICAL_TESTS',results)
sys.exit(0 if all(r['exit']==0 for r in results) else 1)

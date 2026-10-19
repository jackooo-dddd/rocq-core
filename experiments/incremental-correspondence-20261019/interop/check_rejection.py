from pathlib import Path
import sys,subprocess,json,time
W=Path(__file__).resolve().parents[1];R=W.parents[1];T=R/'experiments/mechanical-nat-eq-20261019/translator'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
P=W/'.work/interop';env=cli.lean_env();env['LEAN_PATH']=':'.join(map(str,[P,T/'.lake/build/lib/lean']))
(P/'BadSource.lean').write_text('import Std\naxiom unsupportedAssumption : False\n')
for source in [P/'BadSource.lean',W/'interop/RejectAxiom.lean']:
 with (W/'reports/interop'/(source.stem+'.log')).open('w') as log:
  r=subprocess.run([str(Path.home()/'.elan/bin/lean'),*cli.native_args(),'-o',str(P/(source.stem+'.olean')),str(source)],cwd=W,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=120)
 if r.returncode:sys.exit(r.returncode)
print('PASS: unsupported axiom rejected',flush=True)

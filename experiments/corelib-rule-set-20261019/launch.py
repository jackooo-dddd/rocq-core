#!/usr/bin/env python3
from pathlib import Path
import subprocess,sys,os,json
W=Path(__file__).resolve().parent
subprocess.run([sys.executable,W/'prepare.py'],check=True)
env=dict(os.environ);env['PATH']=str(Path.home()/'.elan/bin')+':'+env.get('PATH','')
with open(W/'.work/build-configured.log','w') as log:
 rc=subprocess.run(['lake','build','Rocq2Lean','Rocq2Lean:shared'],cwd=W/'.work/translator',env=env,stdout=log,stderr=subprocess.STDOUT).returncode
(W/'.work/build-result.json').write_text(json.dumps({'exit':rc})+'\n')
if rc:sys.exit(rc)
subprocess.run([sys.executable,W/'evaluate.py','--run','all-enabled'],cwd=W,check=True)

#!/usr/bin/env python3
import pathlib,json,subprocess,time,sys
R=pathlib.Path(__file__).resolve().parents[1]
build=R/'work/logs/poly-global-build2.json'
deadline=time.time()+900
while not build.exists():
 if time.time()>deadline:raise RuntimeError('build completion record absent; inspect original process, do not restart')
 time.sleep(2)
assert json.loads(build.read_text())['exit']==0,'original build failed'
T=R/'work/snapshots/poly-global/translator'
if '--resume' in sys.argv:
 assert T.exists(),'resume requires the original frozen snapshot'
else:
 assert not T.exists(),'snapshot already exists; do not overwrite'
 T.parent.mkdir(parents=True)
 subprocess.run(['rsync','-a','--exclude=.git','--exclude=.work',str(R/'translator')+'/',str(T)+'/'],check=True)
# Restore the existing compiled Prosa fixture used by the statement regression.
prosa=T/'.work/prosa-0.6-rocq93'
if not prosa.exists():
 prosa.parent.mkdir(exist_ok=True)
 subprocess.run(['cp','-a','--reflink=auto',str(R/'work/snapshots/poly-prereq/translator/.work/prosa-0.6-rocq93'),str(prosa)],check=True)
def call(args,label):
 print('START',label,flush=True)
 with (R/('work/logs/'+label+'.log')).open('w') as log:
  p=subprocess.run([sys.executable,*map(str,args)],cwd=R,stdout=log,stderr=subprocess.STDOUT)
 print('END',label,p.returncode,flush=True)
 assert p.returncode==0,(label,p.returncode)
call([R/'scripts/test_poly_global.py',T,R/'work/tests/poly-global'],'poly-global-tests')
call([R/'scripts/test_poly_prereq.py',T,R/'work/tests/poly-global-prereq'],'poly-global-prereq-tests')
call([R/'scripts/corelib_lab.py','--translator',T,'--out',R/'work/runs/poly-global-full'],'poly-global-full')
call([R/'scripts/compare_corelib_runs.py',R/'work/runs/int63-pure-full',R/'work/runs/poly-global-full','--out',R/'work/poly-global-delta.json'],'poly-global-delta')
call([T/'tests/statement/check_statement.py'],'poly-global-statement-suite')
print('CAMPAIGN_COMPLETE',flush=True)

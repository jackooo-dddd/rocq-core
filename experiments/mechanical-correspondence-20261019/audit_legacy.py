from pathlib import Path
import os,sys,json,subprocess,time,concurrent.futures
W=Path(__file__).resolve().parent; R=W.parents[1]
M=R/'experiments/mechanical-nat-eq-20261019';T=M/'translator'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
profiles={}
for p in ['profiles.json','auto/profiles.json','interfaces/profiles.json']:
 profiles.update(json.loads((W/'legacy'/p).read_text()))
def run(item):
 name,c=item;t=time.time();src=W/'legacy'/(name+'.lean')
 env=cli.lean_env();env['LEAN_PATH']=str(M/'runs/full-v1/Corelib'/c['module']/'lean')+':'+str(T/'.lake/build/lib/lean')
 p=subprocess.run([str(Path.home()/'.elan/bin/lean'),*cli.native_args(),str(src)],cwd=W/'legacy',env=env,capture_output=True,text=True,timeout=600)
 (W/'legacy/logs'/(name+'.log')).write_text(p.stdout+p.stderr)
 return {'profile':name,'module':c['module'],'exit':p.returncode,'seconds':round(time.time()-t,3),'errors':(p.stdout+p.stderr)[:2500] if p.returncode else ''}
rows=[]
with concurrent.futures.ThreadPoolExecutor(max_workers=3) as pool:
 for r in pool.map(run,profiles.items()):
  rows.append(r); print(len(rows),len(profiles),r['profile'],r['exit'],flush=True)
  (W/'legacy/results.json').write_text(json.dumps(rows,indent=2))

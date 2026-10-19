from pathlib import Path
import subprocess,json,concurrent.futures,time
W=Path(__file__).resolve().parent
profiles=json.loads((W/'interfaces/profiles.json').read_text())
def run(item):
 name,cfg=item;t=time.time()
 p=subprocess.run(['python3',str(W/'run.py'),name,cfg['module']],capture_output=True,text=True)
 return {'profile':name,'module':cfg['module'],'exit':p.returncode,'seconds':round(time.time()-t,3)}
rows=[]
with concurrent.futures.ThreadPoolExecutor(max_workers=2) as pool:
 for r in pool.map(run,profiles.items()):
  rows.append(r);print(len(rows),len(profiles),r['profile'],r['exit'],flush=True)
  (W/'interfaces/results.json').write_text(json.dumps(rows,indent=2))
print('FINISHED',sum(r['exit']==0 for r in rows),'/',len(rows),flush=True)

from pathlib import Path
import subprocess,sys,json,time
from concurrent.futures import ThreadPoolExecutor,as_completed
W=Path(__file__).resolve().parent
profiles=json.loads((W/'auto/profiles.json').read_text())
def build(item):
 name,c=item;t=time.time()
 p=subprocess.run([sys.executable,str(W/'run.py'),name,c['module']],stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True)
 d={'profile':name,**c,'exit':p.returncode,'seconds':round(time.time()-t,3)}
 if p.returncode:d['error']=p.stdout[-3000:]
 return d
results=[]
with ThreadPoolExecutor(max_workers=2) as pool:
 futures=[pool.submit(build,item) for item in profiles.items()]
 for f in as_completed(futures):
  r=f.result();results.append(r)
  (W/'auto/results.json').write_text(json.dumps(results,indent=2))
  print(len(results),len(profiles),r['profile'],r['exit'],flush=True)
print('FINISHED',sum(r['exit']==0 for r in results),'/',len(results),flush=True)

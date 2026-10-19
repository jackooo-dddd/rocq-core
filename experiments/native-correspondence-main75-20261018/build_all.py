from pathlib import Path
import subprocess,sys,json,time,hashlib
from concurrent.futures import ThreadPoolExecutor
W=Path(__file__).resolve().parent
profiles=json.loads((W/'profiles.json').read_text())
def build(item):
 name,c=item
 subprocess.run([sys.executable,str(W/'compose.py'),name,*c['fragments']],check=True)
 t=time.time()
 p=subprocess.run([sys.executable,str(W/'run.py'),name,c['module']],stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True)
 d={'profile':name,'module':c['module'],'exit':p.returncode,'seconds':round(time.time()-t,3),'source_sha256':hashlib.sha256((W/(name+'.lean')).read_bytes()).hexdigest()}
 print(name,'PASS' if p.returncode==0 else 'FAIL',flush=True)
 if p.returncode: print(p.stdout,flush=True)
 return d
with ThreadPoolExecutor(max_workers=3) as pool:
 results=list(pool.map(build,profiles.items()))
(W/'build-result.json').write_text(json.dumps(results,indent=2))
sys.exit(any(r['exit'] for r in results))

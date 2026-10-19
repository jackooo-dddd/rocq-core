#!/usr/bin/env python3
from evaluate import W,B,T,S,cli,save,run,sha
from pathlib import Path
import sys,json
env=cli.opam_env();out=W/'.work/source-recheck';out.mkdir(exist_ok=True)
build=run(['make','-j2'],out/'build-exporter.log',T/'rocq/exporter',env,600)
assert build['exit']==0,build
records=[]
for info in S['modules']:
 if not info['roots']:continue
 m=info['module'];d=out/Path(*m.split('.'));d.mkdir(parents=True,exist_ok=True)
 inp=B/'runs/full-v1'/Path(*m.split('.'))/'source.ndjson'
 assert sha(inp)==info['source.ndjson_sha256']
 r=run([sys.executable,'-I',T/'tools/roundtrip.py',inp,d,'--',m],d/'run.log',T,env,900)
 p=d/'roundtrip.json';report=json.loads(p.read_text()) if p.exists() else {}
 r.update(module=m,status=report.get('status','MISSING'),source_sha256=sha(inp))
 if p.exists():r['report_sha256']=sha(p)
 records.append(r)
 print(m,r['exit'],r['status'],flush=True)
 save(W/'reports/source-recheck.json',{'records':records,'complete':False})
 if r['exit']!=0 or r['status']!='OK':sys.exit(1)
save(W/'reports/source-recheck.json',{'records':records,'complete':True,'passed':all(r['exit']==0 and r['status']=='OK' for r in records),'modules':len(records)})

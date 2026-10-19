#!/usr/bin/env python3
import pathlib,subprocess,sys,os
R=pathlib.Path(__file__).resolve().parents[1];T=R/'work/snapshots/carrier-stack-diagnostics/translator';O=R/'work/tests/carrier-stack-trace';O.mkdir(exist_ok=True)
env=dict(os.environ,ROCQ2LEAN_TRACE_ATTEMPTS='1',LEAN_NUM_THREADS='4',ROCQ2LEAN_LEAN_THREADS='4')
for tag,args in [('export',['export','--mode','statement','--manifest',R/'work/fixtures/stack-frontier/source.json','--roots','Corelib.ssr.ssrunder.Under_rel.Under_rel','--out',O]),('translate',['translate','--input',O/'source.ndjson','--out',O])]:
 with(O/(tag+'.log')).open('w')as log:
  p=subprocess.run([sys.executable,'-I',str(T/'tools/rocq2lean.py'),*map(str,args)],cwd=T,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=180)
 print(tag,p.returncode,flush=True)

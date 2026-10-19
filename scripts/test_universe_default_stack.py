#!/usr/bin/env python3
import pathlib,subprocess,json,os,sys,resource
R=pathlib.Path(__file__).resolve().parents[1];T=R/'work/snapshots/universe-default2/translator';O=R/'work/tests/universe-default-stack-fixed';O.mkdir(exist_ok=True)
os.environ['LEAN_NUM_THREADS']='4';os.environ['ROCQ2LEAN_LEAN_THREADS']='4'
def limits():resource.setrlimit(resource.RLIMIT_STACK,(8<<20,8<<20))
names=['Under_rel']
for name in names:
 out=O/name;out.mkdir(exist_ok=True)
 root='Corelib.ssr.ssrunder.Under_rel.'+name
 for tag,args in [('export',['export','--mode','statement','--manifest',R/'work/fixtures/stack-frontier/source.json','--roots',root,'--out',out]),('translate',['translate','--input',out/'source.ndjson','--out',out]),('validate',['validate','--run',out])]:
  with(out/(tag+'.log')).open('w')as log:
   p=subprocess.run([sys.executable,'-I',str(T/'tools/rocq2lean.py'),*map(str,args)],cwd=T,stdout=log,stderr=subprocess.STDOUT,preexec_fn=limits,timeout=180)
  print(name,tag,p.returncode,flush=True)
  if p.returncode and tag=='export':raise RuntimeError('export failed')
 if not(out/'translation_report.json').exists():
  (O/'first-crash.json').write_text(json.dumps({'root':root,'run':str(out)},indent=2)+'\n');break

assert (O/'Under_rel/translation_report.json').exists()
rep=json.loads((O/'Under_rel/translation_report.json').read_text());assert rep['roots'][0]['status']=='TRANSLATED_AND_CHECKED',rep['roots']

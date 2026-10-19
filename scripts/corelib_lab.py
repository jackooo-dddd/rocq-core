#!/usr/bin/env python3
"""Isolated, resumable full-Corelib measurement. Never drops failed roots from the ledger."""
import argparse,collections,json,os,pathlib,resource,subprocess,sys,time,traceback
REPO=pathlib.Path(__file__).resolve().parents[1]
a=argparse.ArgumentParser();a.add_argument('--translator',type=pathlib.Path,required=True);a.add_argument('--out',type=pathlib.Path,required=True);a.add_argument('--module',action='append');args=a.parse_args()
T=args.translator.resolve();OUT=args.out.resolve();OUT.mkdir(parents=True,exist_ok=True)
os.environ['LEAN_NUM_THREADS']='4';os.environ['ROCQ2LEAN_LEAN_THREADS']='4'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli,contract,protection
ENV=cli.opam_env();LEAN=pathlib.Path.home()/'.elan/toolchains/leanprover--lean4---v4.33.1/bin/lean'
GOOD={'BOOTSTRAP_RESOLVED','TRANSLATED_AND_CHECKED','STATEMENT_KERNEL_CHECKED','PENDING_KERNEL_CHECKED','STATEMENT_PENDING_KERNEL_CHECKED'}
def save(p,v):
 p=pathlib.Path(p);tmp=p.with_suffix(p.suffix+'.tmp');tmp.write_text(json.dumps(v,indent=2,ensure_ascii=False)+'\n');tmp.replace(p)
def limits():
 resource.setrlimit(resource.RLIMIT_AS,(12<<30,12<<30));resource.setrlimit(resource.RLIMIT_STACK,(8<<20,8<<20))
def run(cmd,cwd,log,env=None,timeout=1200):
 print(time.strftime('%H:%M:%S'),str(log.relative_to(OUT)),flush=True)
 with open(log,'w') as f:
  try:return subprocess.run([str(x) for x in cmd],cwd=cwd,stdout=f,stderr=subprocess.STDOUT,env=env,timeout=timeout,preexec_fn=limits).returncode
  except subprocess.TimeoutExpired:return 'TIMEOUT'
def read_ir(p):return [json.loads(l) for l in open(p) if l.strip()]
mods=json.load(open(REPO/'work/inventory/modules.json'))['modules']
if args.module:mods=[m for m in mods if m['module'] in args.module]
manifest={'translator':str(T),'modules':[m['module'] for m in mods],'rule':'all inventoried constants and mutual inductive blocks; failures retained','start_time':time.time()};save(OUT/'manifest.json',manifest)
rc=run(['make','-j2'],T/'rocq/exporter',OUT/'build-exporter.log',ENV);assert rc==0,rc
records=[]
for m in mods:
 module=m['module'];out=OUT.joinpath(*module.split('.'));out.mkdir(parents=True,exist_ok=True)
 if (out/'result.json').exists():records.append(json.load(open(out/'result.json')));continue
 names=sorted({n.split('#')[0].replace('/','.') for k,n in m['entries'] if k in ('C','I')});selected=names[:];blocked={};record={'module':module,'requested_names':names,'source_file':m['file'],'root_results':{},'validation':{}}
 save(out/'inventory.json',record)
 try:
  attempt=0
  while selected:
   (out/'Export.v').write_text('From Rocq2LeanExport Require Import Loader.\nRequire '+module+'.\nRocq2Lean ExportStatements "'+str(out/'source.ndjson')+'" '+' '.join(selected)+'.\n')
   bp=out/'source.ndjson.blockers.json'
   if bp.exists():bp.unlink()
   rc=run(['rocq','compile','-I',T/'rocq/exporter/src','-Q',T/'rocq/exporter/theories','Rocq2LeanExport','Export.v'],out,out/f'export-{attempt}.log',ENV,600)
   if rc==0:break
   if not bp.exists():raise RuntimeError(f'Export failed without a structured blocker: {rc}')
   b=json.load(open(bp));bs={x['requested']:x for x in b['roots']};assert set(bs)&set(selected)
   for n in set(bs)&set(selected):blocked[n]={'status':'EXPORT_BLOCKED','message':b['reason'],'path':bs[n]['path']}
   selected=[n for n in selected if n not in bs];bp.rename(out/f'export-blockers-{attempt}.json');attempt+=1
  record['root_results'].update(blocked)
  if selected:
   rows=read_ir(out/'source.ndjson');decls=[r for r in rows if r['kind'] in ('constant','inductive')]
   rt=out/'source-roundtrip';rt.mkdir(exist_ok=True)
   rc=run([sys.executable,'-I',T/'tools/roundtrip.py',out/'source.ndjson',rt,'--',module],T,out/'roundtrip.log',ENV,900)
   record['validation']['roundtrip_exit']=rc
   record['validation']['roundtrip']=json.load(open(rt/'roundtrip.json')).get('status') if (rt/'roundtrip.json').exists() else 'MISSING'
   save(out/'contract.json',contract.build(out/'source.ndjson',selected,protection=protection.binding([r['name'] for r in decls])))
   rc=run([sys.executable,'-I',T/'tools/rocq2lean.py','translate','--input',out/'source.ndjson','--out',out],T,out/'translate.log',os.environ.copy(),1800)
   record['validation']['translate_exit']=rc
   rep=json.load(open(out/'translation_report.json'));results={r['source']:r for r in rep['results']}
   for r in rep['roots']:
    d=results[r['name']];record['root_results'][r['requested']]={'canonical':r['name'],'status':r['status'],'message':d.get('message'),'target':d.get('target'),'blocked_by':d.get('blocked_by',[])}
   ld=out/'lean';(ld/'Consumer.lean').write_text('import Rocq2LeanOut\nimport Rocq2Lean.Verify\n#rocq2lean_verify "'+str(out/'contract.json')+'" "'+str(out/'translation_report.json')+'" "'+str(out/'consumer_result.json')+'"\n')
   env=cli.lean_env();env['LEAN_PATH']=str(T/'.lake/build/lib/lean')+':'+str(ld)
   rc=run([LEAN,*cli.native_args(),'Consumer.lean'],ld,out/'consumer.log',env,900);record['validation']['consumer_exit']=rc
   rc=run([sys.executable,'-I',T/'tools/audit.py',out/'source.ndjson',out/'contract.json',out/'translation_report.json',out/'audit.json',out/'consumer_result.json'],T,out/'audit.log',os.environ.copy(),900);record['validation']['audit_exit']=rc
   for n,k in [('consumer_result.json','consumer'),('audit.json','audit')]:record['validation'][k]=json.load(open(out/n)).get('status') if (out/n).exists() else 'MISSING'
   record['checked']=all(record['validation'].get(k)=='OK' for k in ['roundtrip','consumer','audit'])
  else:record['checked']=not blocked
  record['state']='MEASURED' if names else 'NO_KERNEL_DECLARATIONS'
 except Exception:
  record['state']='INFRASTRUCTURE_ERROR';record['error']=traceback.format_exc();record['checked']=False
  for n in names:record['root_results'].setdefault(n,{'status':'NOT_MEASURED','message':record['error']})
 assert set(record['root_results'])==set(names),(module,set(names)-set(record['root_results']))
 save(out/'result.json',record);records.append(record)
 counts=collections.Counter(v['status'] for r in records for v in r['root_results'].values())
 save(OUT/'progress.json',{'modules_completed':len(records),'modules_total':len(mods),'root_counts':counts,'module_validation_failures':[r['module'] for r in records if not r['checked']]})
 print('MODULE',module,record['state'],record['checked'],dict(collections.Counter(v['status'] for v in record['root_results'].values())),flush=True)
allroots={n:v for r in records for n,v in r['root_results'].items()};counts=collections.Counter(v['status'] for v in allroots.values())
summary={'modules':len(records),'distinct_requested':len(allroots),'root_counts':counts,'blocked_roots':sum(v['status'] not in GOOD for v in allroots.values()),'validation_failures':[r['module'] for r in records if not r['checked']],'success':all(r['checked'] for r in records) and all(v['status'] in GOOD for v in allroots.values())}
save(OUT/'summary.json',summary);save(OUT/'all-roots.json',allroots);print('COMPLETE',json.dumps(summary),flush=True)

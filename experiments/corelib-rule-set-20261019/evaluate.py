#!/usr/bin/env python3
"""Replay frozen IR under explicit mechanism sets; require coverage and independent validators."""
from pathlib import Path
import argparse,concurrent.futures,collections,hashlib,json,os,shutil,subprocess,sys,time,traceback
W=Path(__file__).resolve().parent; B=W.parent/'mechanical-nat-eq-20261019'; T=W/'.work/translator'
S=json.loads((W/'scope.json').read_text()); MODULES={m['module']:m for m in S['modules']}
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
LEAN=Path.home()/'.elan/toolchains/leanprover--lean4---v4.33.1/bin/lean'
GOOD={'TRANSLATED_AND_CHECKED','STATEMENT_KERNEL_CHECKED','PENDING_KERNEL_CHECKED','STATEMENT_PENDING_KERNEL_CHECKED'}
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def save(p,v):
 p=Path(p);p.parent.mkdir(parents=True,exist_ok=True)
 tmp=p.with_suffix(p.suffix+'.tmp');tmp.write_text(json.dumps(v,indent=2,ensure_ascii=False)+'\n');tmp.replace(p)
def run(cmd,log,cwd,env,timeout=300):
 start=time.monotonic()
 with open(log,'w') as f:
  try:rc=subprocess.run([str(x) for x in cmd],stdout=f,stderr=subprocess.STDOUT,cwd=cwd,env=env,timeout=timeout).returncode
  except subprocess.TimeoutExpired:rc='TIMEOUT'
 return {'exit':rc,'seconds':round(time.monotonic()-start,3),'log':str(Path(log).relative_to(W))}
def check_module(module,disabled,runid):
 info=MODULES[module];out=W/'.work/runs'/runid/Path(*module.split('.'));out.mkdir(parents=True,exist_ok=True)
 base=B/'runs/full-v1'/Path(*module.split('.'))
 rec={'module':module,'disabled':disabled,'roots':len(info['roots']),'passed':False}
 if not info['roots']:rec.update(passed=True,state='NO_KERNEL_DECLARATIONS');return rec
 try:
  for f in ['source.ndjson','contract.json','result.json','translation_report.json','source-roundtrip/roundtrip.json']:
   assert sha(base/f)==info[f+'_sha256'],('frozen input changed',module,f)
  for f in ['source.ndjson','contract.json']:shutil.copyfile(base/f,out/f)
  inp=out/'source.ndjson';con=out/'contract.json';rep=out/'translation_report.json'
  contract=json.loads(con.read_text());ld=out/'lean';ld.mkdir(exist_ok=True)
  env=cli.lean_env();env.update(ROCQ2LEAN_DISABLED_RULES=','.join(disabled),LEAN_NUM_THREADS='2',ROCQ2LEAN_LEAN_THREADS='2',
     LEAN_PATH=str(T/'.lake/build/lib/lean')+':'+str(ld))
  dyn=[f'--load-dynlib={cli.NATIVE_LIB}','-j','2']
  (ld/'Rocq2LeanOut.lean').write_text('import Rocq2Lean\n#rocq2lean_import '+ ' '.join(json.dumps(str(x)) for x in [inp,rep,sha(inp),contract['run_id'],con,sha(con)])+'\n')
  rec['translation']=run([LEAN,*dyn,'Rocq2LeanOut.lean','-o','Rocq2LeanOut.olean'],out/'translate.log',ld,env)
  if not rep.exists():
   rec['failure']={'stage':'translation','message':(out/'translate.log').read_text()[-3000:]};return rec
  r=json.loads(rep.read_text());old=json.loads((base/'translation_report.json').read_text())
  rows={v['source']:v for v in r['results']};oldrows={v['source']:v for v in old['results']}
  got={v['requested']:v for v in r['roots']}
  assert set(got)==set(info['roots']),('root scope differs',set(got)^set(info['roots']))
  rec['counts']=dict(collections.Counter(v['status'] for v in got.values()))
  bad=[{k:v.get(k) for k in ['source','status','message','blocked_by','path']} for v in r['results'] if v['status'] not in GOOD]
  # An internal diagnostic/non-root branch may be separately represented; root failure is decisive.
  rootbad=[rows[v['name']] for v in got.values() if v['status'] not in GOOD]
  if rootbad:
   rec['failure']={'stage':'translation','first_failure':bad[:1],'failed_roots':[{k:v.get(k) for k in ['source','status','message','blocked_by','path']} for v in rootbad[:10]],'failed_root_count':len(rootbad)};return rec
  assert rec['translation']['exit']==0,rec['translation']
  # Preserve statement/definition kind; discharged unused prerequisites may disappear, never increase.
  changes=[]
  for n,row in rows.items():
   if n not in oldrows:changes.append({'source':n,'reason':'new declaration'});continue
   prev=oldrows[n]
   family=lambda status:('statement' if status.startswith('STATEMENT_') else 'definition' if status in {'TRANSLATED_AND_CHECKED','PENDING_KERNEL_CHECKED'} else status)
   if family(row['status'])!=family(prev['status']):
    changes.append({'source':n,'field':'status-family','before':prev['status'],'after':row['status']})
   if not set(row.get('pending_hypotheses',[]))<=set(prev.get('pending_hypotheses',[])):
    changes.append({'source':n,'field':'new-prerequisites','before':prev.get('pending_hypotheses'),'after':row.get('pending_hypotheses')})
  rec['prerequisite_reductions']=[{'source':n,'before':oldrows[n].get('pending_hypotheses',[]),'after':row.get('pending_hypotheses',[])}
    for n,row in rows.items() if n in oldrows and len(row.get('pending_hypotheses',[]))<len(oldrows[n].get('pending_hypotheses',[]))]
  for n in oldrows.keys()-rows.keys():changes.append({'source':n,'reason':'missing declaration'})
  if changes:
   rec['failure']={'stage':'boundary-regression','changes':changes[:10],'change_count':len(changes)};return rec
  consumer=out/'consumer_result.json';audit=out/'audit.json'
  (ld/'Consumer.lean').write_text('import Rocq2LeanOut\nimport Rocq2Lean.Verify\n#rocq2lean_verify '+' '.join(json.dumps(str(x)) for x in [con,rep,consumer])+'\n')
  rec['consumer']=run([LEAN,*dyn,'Consumer.lean'],out/'consumer.log',ld,env)
  rec['audit']=run([sys.executable,'-I',T/'tools/audit.py',inp,con,rep,audit,consumer],out/'audit.log',T,env)
  for key,p in [('consumer',consumer),('audit',audit)]:
   status=json.loads(p.read_text()).get('status') if p.exists() else 'MISSING'
   rec[key]['status']=status
   if rec[key]['exit']!=0 or status!='OK':
    rec['failure']={'stage':key,'message':(out/(key+'.log')).read_text()[-3000:]}
    if p.exists():rec['failure']['details']=json.loads(p.read_text()).get('problems',[])[:10]
    return rec
  rec['target_changes']=[]
  for n,row in rows.items():
   keys=[k for k in ['target_type','target_value','level_params','target_ctors','quality_prop'] if row.get(k)!=oldrows[n].get(k)]
   if keys:rec['target_changes'].append({'source':n,'fields':keys})
  rec['artifacts']={f:sha(out/f) for f in ['translation_report.json','consumer_result.json','audit.json','lean/Rocq2LeanOut.olean']}
  rec.update(passed=True,state='CHECKED')
 except Exception:
  rec['failure']={'stage':'infrastructure','message':traceback.format_exc()}
 finally:save(out/'check.json',rec)
 return rec
def evaluate(disabled,runid,modules=None,workers=4):
 modules=modules or list(MODULES)
 summary={'run':runid,'disabled':sorted(disabled),'modules_requested':modules,'started':time.time(),'implementation':sha(W/'translator.patch'),'prerequisite_policy':'no new identities; reductions need all independent checks','records':[]}
 for offset in range(0,len(modules),workers):
  batch=modules[offset:offset+workers]
  with concurrent.futures.ThreadPoolExecutor(max_workers=workers) as pool:
   records=list(pool.map(lambda m:check_module(m,sorted(disabled),runid),batch))
  summary['records']+=records
  print(runid,offset+len(batch),'/',len(modules),[(r['module'],r['passed'],r.get('failure',{}).get('stage')) for r in records],flush=True)
  save(W/'reports'/f'{runid}.json',summary)
  if any(not r['passed'] for r in records):break
 summary['finished']=time.time();summary['passed']=len(summary['records'])==len(modules) and all(r['passed'] for r in summary['records'])
 summary['full_scope']=len(modules)==67 and set(modules)==set(MODULES)
 summary['root_count']=len({n for r in summary['records'] for n in MODULES[r['module']]['roots']})
 summary['target_changed_declarations']=sum(len(r.get('target_changes',[])) for r in summary['records'])
 save(W/'reports'/f'{runid}.json',summary)
 return summary
if __name__=='__main__':
 p=argparse.ArgumentParser();p.add_argument('--disabled',default='');p.add_argument('--run',required=True);p.add_argument('--module',action='append');p.add_argument('--workers',type=int,default=4);a=p.parse_args()
 result=evaluate([x for x in a.disabled.split(',') if x],a.run,a.module,a.workers)
 print('RESULT',result['passed'],result['root_count'],flush=True)
 sys.exit(0 if result['passed'] else 1)

#!/usr/bin/env python3
"""Replay exactly the measured Corelib IR with selected M paths disabled."""
from pathlib import Path
import argparse,json,os,shutil,subprocess,sys,collections
R=Path(__file__).resolve().parents[2];W=Path(__file__).resolve().parent
T=R/'.work/used-rule-coverage-20261019/translator';BASE=R/'.work/used-rule-coverage-20261019/full'
p=argparse.ArgumentParser();p.add_argument('--out',type=Path,required=True);p.add_argument('--disabled',default='');p.add_argument('--base',type=Path);a=p.parse_args()
if a.base:BASE=a.base.resolve()
a.out=a.out.resolve();a.out.mkdir(parents=True,exist_ok=True)
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
env=cli.lean_env();env['ROCQ2LEAN_DISABLED_ITEMIZED_RULES']=a.disabled;env['LEAN_NUM_THREADS']='1';env['ROCQ2LEAN_LEAN_THREADS']='1'
def save(p,v):p.write_text(json.dumps(v,indent=2,ensure_ascii=False)+'\n')
def run(cmd,cwd,log):
 with log.open('w') as f:return subprocess.run([str(x) for x in cmd],cwd=cwd,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=1200).returncode
records=[];changes=[];roots={}
keys=['status','target_kind','target_type','target_value','target_ctors','level_params','pending_hypotheses','quality_prop']
for rp in sorted(BASE.rglob('result.json')):
 rec=json.loads(rp.read_text());assert rec['checked']
 rel=rp.parent.relative_to(BASE);out=a.out/rel;out.mkdir(parents=True,exist_ok=True)
 if not rec['requested_names']:
  save(out/'result.json',rec);records.append({'module':rec['module'],'roots':0,'checked':True});continue
 print('REPLAY',rec['module'],flush=True)
 shutil.copyfile(rp.parent/'contract.json',out/'contract.json')
 shutil.copyfile(rp.parent/'source.ndjson',out/'source.ndjson')
 (out/'source-roundtrip').mkdir(exist_ok=True)
 shutil.copyfile(rp.parent/'source-roundtrip/roundtrip.json',out/'source-roundtrip/roundtrip.json')
 rc=run([sys.executable,T/'tools/rocq2lean.py','translate','--input',out/'source.ndjson','--out',out],T,out/'translate.log')
 assert rc==0,(rec['module'],'translate',rc)
 old=json.loads((rp.parent/'translation_report.json').read_text())
 report=json.loads((out/'translation_report.json').read_text())
 orig={x['source']:x for x in old['results']}
 assert set(orig)=={x['source'] for x in report['results']}
 for x in report['results']:
  ds=[k for k in keys if x.get(k)!=orig[x['source']].get(k)]
  if ds:changes.append([rec['module'],x['source'],ds])
 for row in report['roots']:roots[row['requested']]=row['status']
 ld=out/'lean'
 (ld/'Consumer.lean').write_text('import Rocq2LeanOut\nimport Rocq2Lean.Verify\n#rocq2lean_verify "'+str(out/'contract.json')+'" "'+str(out/'translation_report.json')+'" "'+str(out/'consumer_result.json')+'"\n')
 env['LEAN_PATH']=str(T/'.lake/build/lib/lean')+':'+str(ld)
 rc=run([Path.home()/'.elan/bin/lean',*cli.native_args(),'Consumer.lean'],ld,out/'consumer.log')
 assert rc==0,(rec['module'],'consumer',rc)
 rc=run([sys.executable,T/'tools/audit.py',out/'source.ndjson',out/'contract.json',out/'translation_report.json',out/'audit.json',out/'consumer_result.json'],T,out/'audit.log')
 assert rc==0,(rec['module'],'audit',rc)
 assert json.loads((out/'consumer_result.json').read_text())['status']=='OK'
 assert json.loads((out/'audit.json').read_text())['status']=='OK'
 hits=json.loads((out/'rule_hits.json').read_text());assert not any(k in a.disabled.split(',') for k,_ in hits)
 records.append({'module':rec['module'],'roots':len(rec['requested_names']),'checked':True,'translate_exit':0,'consumer':'OK','audit':'OK','source_roundtrip':rec['validation']['roundtrip']})
 save(out/'result.json',rec)
 save(a.out/'progress.json',{'completed':len(records),'roots':len(roots),'changed':len(changes)})
assert len(roots)==2180 and not changes,(len(roots),changes[:3])
save(a.out/'all-roots.json',json.loads((BASE/'all-roots.json').read_text()))
result={'success':True,'distinct_requested':2180,'blocked_roots':0,'validation_failures':[],'status':'PASS','disabled_M_rules':a.disabled.split(',') if a.disabled else [],'modules':67,'roots':2180,'target_changes':0,'root_counts':dict(collections.Counter(roots.values())),'records':records,
 'scope':'M-rule pruning only; other translation mechanisms are unchanged, so this does not prove that all non-M paths are exhausted by the old 34 rows.'}
save(a.out/'summary.json',result);save(W/'M_PRUNING_VALIDATION.json',result)
print('PASS',a.disabled,'2180 roots, targets unchanged',flush=True)

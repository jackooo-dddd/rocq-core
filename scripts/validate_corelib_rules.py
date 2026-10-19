#!/usr/bin/env python3
"""Bind fresh full-Corelib execution to the complete itemized rule list."""
from pathlib import Path
import collections,hashlib,json,os,subprocess,sys,time,traceback
import used_translation_rules as catalog
R=Path(__file__).resolve().parents[1];BASE=R/'experiments/mechanical-nat-eq-20261019';T=BASE/'translator'
RUN=R/'.work/used-rules-20261019/full';OUT=R/'results/used-rules-validation';WORK=RUN.parent
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def save(p,v):
 tmp=p.with_suffix(p.suffix+'.tmp');tmp.write_text(json.dumps(v,indent=2,ensure_ascii=False)+'\n');tmp.replace(p)
def run(cmd,log,env,cwd=R):
 with open(log,'w') as f:return subprocess.run([str(x) for x in cmd],cwd=cwd,stdout=f,stderr=subprocess.STDOUT,env=env,timeout=600).returncode
while not (RUN/'summary.json').exists():time.sleep(5)
try:
 summary=json.loads((RUN/'summary.json').read_text())
 assert summary['success'] and summary['modules']==67 and summary['distinct_requested']==2180 and summary['blocked_roots']==0,summary
 rs,_,cfg,_=catalog.build();assert json.loads((OUT/'RULES.json').read_text())==cfg,'implementation/configuration drift'
 inv=json.loads((R/'work/inventory/modules.json').read_text())['modules']
 frozen_roots=json.loads((BASE/'runs/full-v1/all-roots.json').read_text())
 fresh_roots=json.loads((RUN/'all-roots.json').read_text());assert set(frozen_roots)==set(fresh_roots) and len(fresh_roots)==2180
 assert all(v['status'] in catalog.SUCCESS for v in fresh_roots.values())
 records=[];changed=[];source_kinds=collections.Counter();bootstrap=0;alltargetnames=set()
 for m in inv:
  module=m['module'];d=RUN/Path(*module.split('.'));b=BASE/'runs/full-v1'/Path(*module.split('.'))
  r=json.loads((d/'result.json').read_text());assert r['checked'],module
  rec={'module':module,'root_count':len(r['requested_names']),'state':r['state'],'validation':r['validation'],'checked':r['checked']}
  if r['requested_names']:
   for name in ['roundtrip','consumer','audit']:assert r['validation'][name]=='OK',(module,name)
   for name in ['roundtrip_exit','translate_exit','consumer_exit','audit_exit']:assert r['validation'][name]==0,(module,name)
   rows=json.loads((d/'translation_report.json').read_text())['results']
   old={x['source']:x for x in json.loads((b/'translation_report.json').read_text())['results']}
   for x in rows:
    bootstrap+=x['status']=='BOOTSTRAP_RESOLVED'
    alltargetnames.add(x.get('target'))
    assert x['source'] in old,('extra declaration',x['source'])
    keys=[k for k in ['status','target_kind','target_type','target_value','target_ctors','level_params','pending_hypotheses','quality_prop'] if x.get(k)!=old[x['source']].get(k)]
    if keys:changed.append({'module':module,'source':x['source'],'fields':keys})
   assert set(old)=={x['source'] for x in rows}
   for line in (d/'source.ndjson').read_text().splitlines():
    row=json.loads(line)
    if row.get('kind')=='constant':source_kinds[row.get('body_state')]+=1
   rec['artifacts']={f:sha(d/f) for f in ['source.ndjson','contract.json','source-roundtrip/roundtrip.json','translation_report.json','consumer_result.json','audit.json']}
  rec['root_counts']=dict(collections.Counter(v['status'] for v in r['root_results'].values()))
  records.append(rec)
 assert bootstrap==0 and not changed,(bootstrap,changed[:5])
 assert 'Rocq.Corelib.Init.Datatypes.nat' in alltargetnames and 'Rocq.Corelib.Init.Logic.eq' in alltargetnames
 assert 'def bootstrapRules : Array BootstrapRule := #[]' in (T/'Rocq2Lean/Bootstrap.lean').read_text()
 save(OUT/'modules.json',{'scope_modules':67,'records':records,'root_counts':summary['root_counts']})
 save(OUT/'roots.json',{'roots':fresh_roots,'scope':2180})
 # Use existing meaningful identity/computation tests against this fresh corpus, not old oleans.
 sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
 env=cli.lean_env();env['ROCQ2LEAN_LEAN_THREADS']='2';tests=[]
 logs=WORK/'tests';logs.mkdir(exist_ok=True)
 for test,module in [('MechanicalIdentity','Datatypes'),('NatCompute','Nat')]:
  env['LEAN_PATH']=str(RUN/'Corelib/Init'/module/'lean')+':'+str(T/'.lake/build/lib/lean')
  rc=run([Path.home()/'.elan/bin/lean',*cli.native_args(),BASE/'tests'/(test+'.lean')],logs/(test+'.log'),env)
  tests.append({'test':test,'exit':rc,'passed':rc==0,'log_sha256':sha(logs/(test+'.log'))});assert rc==0,tests[-1]
 rc=run([sys.executable,R/'scripts/translate_corelib_rules.py','--check-only'],logs/'configuration.log',env)
 assert rc==0
 tests.append({'test':'itemized-configuration-check','exit':rc,'passed':True})
 broken=json.loads((OUT/'RULES.json').read_text());broken['enabled_translation_rules'].remove('M03')
 bp=WORK/'unvalidated-rules.json';save(bp,broken)
 rc=run([sys.executable,R/'scripts/translate_corelib_rules.py','--rules',bp,'--check-only'],logs/'configuration-rejection.log',env)
 assert rc!=0 and 'UNVALIDATED_RULE_SET' in (logs/'configuration-rejection.log').read_text()
 tests.append({'test':'changed-rule-set-refused','removed':'M03','exit':rc,'passed':True})
 # Exercise the documented entry point.
 sample=WORK/'entrypoint';sample.mkdir(exist_ok=True)
 import shutil
 shutil.copyfile(RUN/'Corelib/Init/Nat/contract.json',sample/'contract.json')
 rc=run([sys.executable,R/'scripts/translate_corelib_rules.py','--input',RUN/'Corelib/Init/Nat/source.ndjson','--out',sample],logs/'entrypoint.log',env)
 rep=json.loads((sample/'translation_report.json').read_text()) if (sample/'translation_report.json').exists() else {}
 old=json.loads((RUN/'Corelib/Init/Nat/translation_report.json').read_text())
 assert rc==0 and rep.get('results')==old['results']
 tests.append({'test':'documented-translation-entrypoint','exit':rc,'passed':True})
 validation={'status':'PASS','scope':summary,'kernel_modules':sum(bool(r['root_count']) for r in records),
  'translation_rules_enabled':len(cfg['enabled_translation_rules']),'checks_enabled':len(cfg['enabled_checks']),
  'scheduling_enabled':len(cfg['enabled_scheduling']),'not_enabled':cfg['not_enabled'],
  'configuration_sha256':sha(OUT/'RULES.json'),'catalog_sha256':sha(OUT/'ITEMS.json'),
  'source_run':'fresh export, source roundtrip, target translation, independent consumer and audit',
  'root_inventory_unchanged':True,'target_declarations_changed_from_mechanical_baseline':0,'native_bootstrap':0,
  'source_body_states_including_repeated_dependencies':source_kinds,'tests':tests,
  'limits':'Sufficient full configuration, not minimality or independently measured use of every subrule; theorem statements and explicit prerequisites remain.',
  'raw_artifacts_remote_only':str(RUN)}
 save(OUT/'VALIDATION.json',validation)
 subprocess.run([sys.executable,R/'scripts/used_translation_rules.py'],check=True)
 print('PASS: complete itemized rule set, 2180 roots, no target changes',flush=True)
except Exception:
 save(OUT/'VALIDATION.json',{'status':'FAIL','error':traceback.format_exc()});raise

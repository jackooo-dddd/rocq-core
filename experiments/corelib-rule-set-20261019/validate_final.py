#!/usr/bin/env python3
"""Validate selected artifacts, source identity, rejection of bootstrap forgeries and config controls."""
from evaluate import W,B,T,cli,LEAN,run,save,sha
import copy,json,os,sys,time
from pathlib import Path
while True:
 p=W/'verified-selection.json'
 if p.exists():
  sel=json.loads(p.read_text())
  if sel.get('status')=='TRANSLATION_VALIDATED':break
 time.sleep(5)
D=W/'.work/runs/selected/Corelib/Init/Datatypes'
testdir=W/'.work/final-tests';testdir.mkdir(exist_ok=True)
logs=W/'logs';logs.mkdir(exist_ok=True)
cfg=json.loads((W/'corelib.json').read_text())
env=cli.lean_env();env.update(ROCQ2LEAN_DISABLED_RULES=','.join(cfg['disabled']),ROCQ2LEAN_LEAN_THREADS='2')
dyn=[f'--load-dynlib={cli.NATIVE_LIB}','-j','2']
tests=[]
for test,module in [('MechanicalIdentity','Datatypes'),('NatCompute','Nat')]:
 M=W/'.work/runs/selected/Corelib/Init'/module
 env['LEAN_PATH']=str(M/'lean')+':'+str(T/'.lake/build/lib/lean')
 r=run([LEAN,*dyn,B/'tests'/(test+'.lean')],logs/(test+'.log'),W,env)
 r.update(test=test,passed=r['exit']==0);tests.append(r)
 assert r['passed'],r
new=json.loads((D/'translation_report.json').read_text())
oldrows={r['source']:r for r in json.loads((B/'tests/historical-bootstrap-rows.json').read_text())}
env['LEAN_PATH']=str(D/'lean')+':'+str(T/'.lake/build/lib/lean')
for tag,source in [('nat','Corelib.Init.Datatypes.nat'),('eq','Corelib.Init.Logic.eq')]:
 bad=copy.deepcopy(new);bad['results']=[oldrows[source] if r['source']==source else r for r in bad['results']]
 for row in bad['roots']:
  if row['name']==source:row['status']='BOOTSTRAP_RESOLVED'
 p=testdir/('forged-'+tag+'.json');save(p,bad)
 out=testdir/('audit-rejected-'+tag+'.json')
 r=run([sys.executable,'-I',T/'tools/audit.py',D/'source.ndjson',D/'contract.json',p,out,D/'consumer_result.json'],logs/('reject-'+tag+'-audit.log'),T,env)
 report=json.loads(out.read_text()) if out.exists() else {}
 r.update(test='reject-'+tag+'-audit',passed=r['exit']!=0 and report.get('status') not in [None,'OK'],status=report.get('status'),problems=report.get('problems',[])[:5])
 tests.append(r);assert r['passed'],r
 lean=testdir/('RejectNative-'+tag+'.lean');consumer=testdir/('consumer-rejected-'+tag+'.json')
 lean.write_text('import Rocq2LeanOut\nimport Rocq2Lean.Verify\n#rocq2lean_verify '+' '.join(json.dumps(str(x)) for x in [D/'contract.json',p,consumer])+'\n')
 r=run([LEAN,*dyn,lean],logs/('reject-'+tag+'-consumer.log'),W,env)
 report=json.loads(consumer.read_text()) if consumer.exists() else {}
 r.update(test='reject-'+tag+'-consumer',passed=r['exit']!=0 and report.get('status') not in [None,'OK'],status=report.get('status'))
 tests.append(r);assert r['passed'],r
cfgtest=testdir/'Config.lean';cfgtest.write_text('import Rocq2Lean.RuleSet\n#eval Rocq2Lean.disabledMechanisms\n')
for disabled in ['kernel','native-nat-eq','unknown-rule']:
 badenv=dict(env,ROCQ2LEAN_DISABLED_RULES=disabled)
 r=run([LEAN,*dyn,cfgtest],logs/('reject-config-'+disabled+'.log'),W,badenv)
 text=(logs/('reject-config-'+disabled+'.log')).read_text()
 r.update(test='reject-config-'+disabled,passed=r['exit']!=0 and 'unknown disabled translation mechanism' in text)
 tests.append(r);assert r['passed'],r
# Exercise the public wrapper using the frozen Nat IR and the real protection contract.
m=W/'.work/wrapper-test';m.mkdir(exist_ok=True)
import shutil
src=B/'runs/full-v1/Corelib/Init/Nat'
shutil.copyfile(src/'contract.json',m/'contract.json')
r=run([sys.executable,W/'translate.py','--input',src/'source.ndjson','--out',m],logs/'wrapper.log',W,env)
rep=json.loads((m/'translation_report.json').read_text()) if (m/'translation_report.json').exists() else {}
reference=json.loads((W/'.work/runs/selected/Corelib/Init/Nat/translation_report.json').read_text())
r.update(test='default-wrapper',passed=r['exit']==0 and rep.get('results')==reference['results'])
tests.append(r);assert r['passed'],r
source=json.loads((W/'reports/source-recheck.json').read_text())
assert source['complete'] and source['passed'] and source['modules']==51
final=json.loads((W/'reports/selected.json').read_text())
assert final['passed'] and final['full_scope'] and final['root_count']==2180
manifest=json.loads((W/'baseline-implementation.json').read_text())
for rel,digest in manifest.items():
 assert sha(B/'translator'/rel)==digest,('baseline implementation drift',rel)
 if rel!='Rocq2Lean/Emit.lean':assert sha(T/rel)==digest,('unexpected translator change',rel)
assert sha(T/'Rocq2Lean/RuleSet.lean')==sha(W/'RuleSet.lean')
import difflib
patch=''.join(difflib.unified_diff((B/'translator/Rocq2Lean/Emit.lean').read_text().splitlines(True),(T/'Rocq2Lean/Emit.lean').read_text().splitlines(True),fromfile='a/Rocq2Lean/Emit.lean',tofile='b/Rocq2Lean/Emit.lean'))
assert patch==(W/'translator.patch').read_text()
validation={'status':'PASS','modules':67,'kernel_modules':51,'distinct_roots':2180,
 'blocked_roots':0,'source_roundtrip':'PASS','independent_consumers':'PASS','independent_audits':'PASS',
 'enabled_optional_mechanisms':len(sel['enabled']),'disabled_optional_mechanisms':len(sel['disabled']),
 'fixed_core_minimized':False,'single_deletion_witnesses':len(sel['witnesses']),
 'selected_report':'reports/selected.json','source_report':'reports/source-recheck.json','tests':tests,
 'source_nat_eq':'generated inductives; no native bootstrap',
 'configuration_sha256':sha(W/'corelib.json'),'implementation_patch_sha256':sha(W/'translator.patch'),
 'rule_module_sha256':sha(W/'RuleSet.lean')}
save(W/'VALIDATION.json',validation)
print('FINAL VALIDATION PASS',flush=True)

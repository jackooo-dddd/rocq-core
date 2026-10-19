#!/usr/bin/env python3
from pathlib import Path
import json,os,subprocess,sys
R=Path(__file__).resolve().parents[2];W=Path(__file__).resolve().parent
T=R/'.work/used-rule-coverage-20261019/translator';D=R/'.work/used-rule-coverage-20261019/trace-tests'
D.mkdir(exist_ok=True);sys.path.insert(0,str(T/'tools'));import rocq2lean as cli,contract,protection
os.environ['ROCQ2LEAN_LEAN_THREADS']='1';env=cli.lean_env();env['LEAN_PATH']=str(T/'.lake/build/lib/lean');env['LEAN_NUM_THREADS']='1'
def run(cmd,cwd,log,e=env):
 with log.open('w') as f:return subprocess.run([str(x) for x in cmd],cwd=cwd,env=e,stdout=f,stderr=subprocess.STDOUT,timeout=300).returncode
assert run([Path.home()/'.elan/bin/lean',*cli.native_args(),W/'Rollback.lean'],R,D/'rollback.log')==0
src=D/'source.ndjson';(D/'Export.v').write_text('From Rocq2LeanExport Require Import Loader.\nRequire Corelib.Init.Nat.\nRocq2Lean ExportStatements "'+str(src)+'" Corelib.Init.Nat.add.\n')
assert run(['rocq','compile','-I',T/'rocq/exporter/src','-Q',T/'rocq/exporter/theories','Rocq2LeanExport','Export.v'],D,D/'export.log',cli.opam_env())==0
original=[json.loads(l) for l in src.read_text().splitlines() if l.strip()]
results=[]
for case in ['accepted','disabled','normal_failure']:
 out=D/case;out.mkdir(exist_ok=True)
 rows=json.loads(json.dumps(original))
 if case=='normal_failure':
  row=next(x for x in rows if x.get('name')=='Corelib.Init.Nat.add')
  # Deliberately invalid fixture: a function body is declared as a natural number.
  row['type']=row['type']['ty']
 source=out/'source.ndjson';source.write_text(''.join(json.dumps(x)+'\n' for x in rows))
 decls=[x['name'] for x in rows if x['kind'] in ('constant','inductive')]
 (out/'contract.json').write_text(json.dumps(contract.build(source,['Corelib.Init.Nat.add'],protection=protection.binding(decls))))
 en=env.copy();en['ROCQ2LEAN_DISABLED_ITEMIZED_RULES']='M03' if case=='disabled' else ''
 rc=run([sys.executable,T/'tools/rocq2lean.py','translate','--input',source,'--out',out],T,out/'translate.log',en)
 rep=json.loads((out/'translation_report.json').read_text());row=next(x for x in rep['results'] if x['source']=='Corelib.Init.Nat.add')
 hits=json.loads((out/'rule_hits.json').read_text());addhits=[k for k,n in hits if n=='Corelib.Init.Nat.add']
 if case=='accepted':assert rc==0 and 'M03' in addhits,(row,addhits)
 elif case=='disabled':assert rc!=0 and 'disabled itemized rule: M03' in row['message'] and not addhits
 else:assert rc!=0 and row['status']=='KERNEL_REJECTED' and not addhits,(row,addhits)
 results.append({'case':case,'exit':rc,'status':row['status'],'retained_M_rules':addhits})
(W/'INSTRUMENTATION_TESTS.json').write_text(json.dumps({'rollback_test':'PASS','tests':results,'meaning':'accepted conversion retained; disabled path rejected; normal kernel-rejection status leaves no translation hits'},indent=2)+'\n')
print('PASS: accepted, disabled, normal failure, explicit rollback',flush=True)

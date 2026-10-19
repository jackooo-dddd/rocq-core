from pathlib import Path
import json,subprocess,sys,os,time
W=Path(__file__).resolve().parent;R=W.parents[1];O=W/'unified';T=R/'experiments/mechanical-nat-eq-20261019/translator'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli,contract,protection
s=json.loads((O/'selection.json').read_text());env=cli.opam_env()
def run(label,cmd,cwd,env,timeout=1200):
 print(label,flush=True)
 with (O/(label+'.log')).open('w') as f:
  p=subprocess.run(list(map(str,cmd)),cwd=cwd,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=timeout)
 print(label,p.returncode,flush=True)
 if p.returncode:
  if label=='translate' and p.returncode==2:
   report=json.loads((O/'translation_report.json').read_text())
   assert all(r['status'] in ['TRANSLATED_AND_CHECKED','BOOTSTRAP_RESOLVED'] for r in report['roots']),report['roots']
   print('translation roots accepted; CLI treats requested bootstrap roots as non-translated',flush=True)
  else:raise RuntimeError(label+' failed')
(O/'Export.v').write_text('From Rocq2LeanExport Require Import Loader.\n'+'\n'.join('Require '+m+'.' for m in s['modules'])+'\nRocq2Lean ExportStatements "'+str(O/'source.ndjson')+'" '+' '.join(s['roots'])+'.\n')
if not (O/'source.ndjson').exists():run('export',['rocq','compile','-I',T/'rocq/exporter/src','-Q',T/'rocq/exporter/theories','Rocq2LeanExport','Export.v'],O,env)
records=[json.loads(l) for l in (O/'source.ndjson').read_text().splitlines() if l]
decls=[r['name'] for r in records if r['kind'] in ('constant','inductive')]
if not (O/'contract.json').exists():(O/'contract.json').write_text(json.dumps(contract.build(O/'source.ndjson',s['roots'],protection=protection.binding(decls)),indent=2))
run('translate',[sys.executable,'-I',T/'tools/rocq2lean.py','translate','--input',O/'source.ndjson','--out',O],T,os.environ.copy())
report=json.loads((O/'translation_report.json').read_text())
assert all(r['status'] in ['TRANSLATED_AND_CHECKED','BOOTSTRAP_RESOLVED'] for r in report['roots'])
rt=O/'source-roundtrip';rt.mkdir(exist_ok=True)
run('roundtrip',[sys.executable,'-I',T/'tools/roundtrip.py',O/'source.ndjson',rt,'--',*s['modules']],T,env)
ld=O/'lean';(ld/'Consumer.lean').write_text('import Rocq2LeanOut\nimport Rocq2Lean.Verify\n#rocq2lean_verify "'+str(O/'contract.json')+'" "'+str(O/'translation_report.json')+'" "'+str(O/'consumer_result.json')+'"\n')
le=cli.lean_env();le['LEAN_PATH']=str(ld)+':'+str(T/'.lake/build/lib/lean')
lean=Path.home()/'.elan/bin/lean'
run('consumer',[lean,*cli.native_args(),'Consumer.lean'],ld,le)
run('audit',[sys.executable,'-I',T/'tools/audit.py',O/'source.ndjson',O/'contract.json',O/'translation_report.json',O/'audit.json',O/'consumer_result.json'],T,os.environ.copy())
bridge='\n'.join((W/'fragments'/f'{p}.lean').read_text() for p in s['parts'])
bridge+='\n'+(W/'fragments/Audit.lean').read_text().replace('AUDIT_PATH',str(W/'audits/Unified.json'))
(W/'Unified.lean').write_text(bridge)
le['LEAN_PATH']=str(W)+':'+le['LEAN_PATH']
run('bridges',[lean,*cli.native_args(),'-o',W/'Unified.olean',W/'Unified.lean'],W,le)
(O/'result.json').write_text(json.dumps({'status':'PASS','roots':len(s['roots']),'checks':['export','translate','roundtrip','consumer','audit','bridges']},indent=2))
print('UNIFIED_PASS',flush=True)

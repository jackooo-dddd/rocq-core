from pathlib import Path
import json,subprocess,sys,collections
W=Path(__file__).resolve().parent;R=W.parents[1];T=W/'translator';S=W/'runs/full-v1';B=R/'work/runs/quality-main75-full'
summary=json.loads((S/'summary.json').read_text())
assert summary['success'] and summary['modules']==67 and summary['distinct_requested']==2180,summary
assert summary['root_counts'].get('BOOTSTRAP_RESOLVED',0)==0,summary
assert all(r['exit']==0 for r in json.loads((W/'tests/mechanical-result.json').read_text()))
assert all(r['rejected'] for r in json.loads((W/'tests/no-bootstrap-result.json').read_text()))
assert (W/'logs/statement-suite.log').read_text().rstrip().endswith('test-statement: OK')
subprocess.run([sys.executable,str(R/'scripts/compare_corelib_runs.py'),str(B),str(S),'--out',str(W/'baseline-delta.json')],check=True)
delta=json.loads((W/'baseline-delta.json').read_text());assert not delta['status_regressions'] and not delta['validation_regressions']
checked=collections.Counter()
for p in S.rglob('translation_report.json'):
 report=json.loads(p.read_text())
 assert all(r['status']!='BOOTSTRAP_RESOLVED' for r in report['results']),str(p)
 for r in report['results']:
  if r['source'] in ['Corelib.Init.Datatypes.nat','Corelib.Init.Logic.eq']:
   assert r['status']=='TRANSLATED_AND_CHECKED' and r['target']=='Rocq.'+r['source'] and r['target_kind']=='inductive',r
   assert r['rule']!='bootstrap/nat-to-Nat' and r['rule']!='bootstrap/eq-to-Eq'
   checked[r['source']]+=1
files=['Rocq2Lean/Bootstrap.lean','tools/audit.py','tools/preflight.py']
base=R/'work/snapshots/quality-main75/translator'
patch=''
for f in files:
 p=subprocess.run(['diff','-u','--label','a/'+f,'--label','b/'+f,str(base/f),str(T/f)],capture_output=True,text=True)
 assert p.returncode in [0,1]
 patch+=p.stdout
(W/'mechanical-nat-eq.patch').write_text(patch)
result={'status':'PASS','scope':summary,'generated_source_occurrences_checked':dict(checked),'changed_translator_files':files,'baseline_changes':delta['changes'],'mechanical_identity_and_computation_tests':'PASS','native_bootstrap_forgery_negatives':'PASS','statement_suite':'PASS','native_correspondence':'deferred by user request'}
(W/'VALIDATION.json').write_text(json.dumps(result,ensure_ascii=False,indent=2))
(W/'logs/validation-campaign.log').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\nCAMPAIGN_COMPLETE\n')
p=subprocess.run([sys.executable,str(W/'package_results.py'),'--run',str(S),'--out',str(W/'results'),'--baseline',str(B),'--campaign',str(W/'logs/validation-campaign.log')])
assert p.returncode==0
experiment=json.loads((W/'EXPERIMENT.json').read_text());experiment['status']='validated and packaged';experiment['result']='VALIDATION.json';(W/'EXPERIMENT.json').write_text(json.dumps(experiment,indent=2))
print('MECHANICAL_NAT_EQ_COMPLETE',flush=True)

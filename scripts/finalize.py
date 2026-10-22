from pathlib import Path
import json,collections,html,re,shutil,subprocess
B=Path.home()/'research/rocq-core-by-file-20261018'
def read(p):return json.loads(p.read_text())
def save(p,x):p.write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
def esc(x):return html.escape(str(x))
OK={'TRANSLATED_AND_CHECKED','BOOTSTRAP_RESOLVED','STATEMENT_KERNEL_CHECKED'}
PEND={'PENDING_KERNEL_CHECKED','STATEMENT_PENDING_KERNEL_CHECKED'}
ACC=OK|PEND
before=read(B/'summary.json');after=read(B/'improved/summary.json')
assert (before['complete'],before['pending'],before['blocked'])==(574,75,190)
assert (after['complete'],after['pending'],after['blocked'])==(569,81,189)
notes={
'proof-cache-trial':'Reuse of proof subterms in the same complete context: no pass terms added, no retention.',
'normalization-trial':'Simplification of β/ι/ζ before extraction: source structure roundtrip failed; the following count is only for diagnosis and cannot be counted as authentication results, so it is rejected.',
'binder-context-trial':'Use the rewritten binding type: add item 1 with conditional statement, and add item 5 with new conditions; candidate core.',
'minimal-obligations-trial':'Reduce the obligation context and reuse the same type of conditions: 3 item originally checkable statement becomes blocked and rejected.',
'minimal-binder-trial':'Reduce context and binding patch combination: 2 item passed the extraction stage but is still blocked by dependencies; there is still the above 3 item that is regressed and rejected.',
'binder-statement-cache-trial':'Same-type conditional reuse + binding patching: no more than separate binding patching, no additional cache retained.',
'candidate-final':'Final quarantine candidate: Binding context patching + source-side verbose errors + optional Lean thread count.'}
trials=[]
for name,note in notes.items():
 d=B/'experiments'/name;r=read(d/'translation_report.json')
 c=collections.Counter(x['status'] for x in r['roots'])
 validation={f:read(d/f)['status'] for f in ['source-roundtrip/roundtrip.json','audit.json','consumer_result.json']}
 if name!='normalization-trial':assert all(v=='OK' for v in validation.values()),(name,validation)
 trials.append({'experiment':name,'total':839,'complete':sum(c[s] for s in OK),'pending':sum(c[s] for s in PEND),'blocked':22+sum(v for k,v in c.items() if k not in ACC),'validation':validation,'note':note})
save(B/'experiments/trial-summary.json',trials)
deltas=read(B/'experiments/root-status-delta.json')
new=[x for x in deltas if x['before'] not in ACC and x['after'] in ACC]
lost=[x for x in deltas if x['before'] in ACC and x['after'] not in ACC]
conditioned=[x for x in deltas if x['before'] in OK and x['after'] in PEND]
assert len(new)==1 and not lost and len(conditioned)==5
suite=read(B/'experiments/statement-suite-result.json');assert suite['exit']==0
patch=subprocess.check_output(['git','diff','--','rocq/exporter/src/r2l_export.ml','tools/rocq2lean.py'],cwd=B/'translator',text=True)
(B/'candidate.patch').write_text(patch)
rules=[
('SProp / irrelevant binding',40,40,'The representation and elimination restrictions of SProp need to be defined, and the rejection check cannot be deleted.','No new presentation strategies were adopted.'),
('Proof Extraction and Dependency Computation',52,52,'When the constructor proof is used as a dependent index, the branch type after extraction is different from the constructor index required by the eliminator. The index needs to be kept consistent; the supplementary premise cannot restore the source conversion.','Test caching, reduction, context reduction, and binding patching; keep case-by-case actual errors.'),
('quality / sort polymorphic export',22,22,'The MetaRocq reference front-end lacks the complete representation and delivery of the quality polymorphic context; Lean has not yet been entered.','Fixed toolchain still blocked.'),
('Prop instance of template inductive type',20,18,'The type, constructor, recursor, projection and call point of Prop parameters need to be processed uniformly; Sort generalization or lift representation may be involved.','The 2 item was changed to dependency blocked, but still failed; the representation strategy was not changed.'),
('Universe solution and consistency',2,1,'bool_eq_rec still has proof-local universe constraint conflict; source universe consistency check cannot be relaxed.','eq_existT_curried_congr becomes a conditionally checkable statement.'),
('Proof recursion after extraction',4,4,'Terminability cannot be assumed if a structural recursive basis needs to be reconstructed or a checkable well-founded termination obligation arises.','Remain blocked, no original library proof is generated.'),
('Dependency blocking',50,52,'Item-by-item reporting recursively tracks upstream root causes; fix upstream first, then retest.','The addition includes failure stage changes, instead of adding 2 failure root statements.')]
save(B/'rule-assessment.json',[dict(rule=r,before=x,after=y,missing=m,action=a) for r,x,y,m,a in rules])
candidate=read(B/'experiments/candidate-final/translation_report.json')
h=next(json.loads(l) for l in (B/'experiments/candidate-final/source.ndjson').open() if json.loads(l).get('kind')=='header')
failed={r['name'] for r in candidate['roots'] if r['status']=='OBLIGATION_EXTRACTION_REFUSED'}
source_errors={n:e for n,e in h['mode']['extraction_refused'].items() if n in failed}
assert len(source_errors)==52
save(B/'source-extraction-errors.json',source_errors)
stages=collections.Counter(re.search(r'\[stage: (.*?)\]',e).group(1) for e in source_errors.values())
checks=[]
for base in [B,B/'improved']:
 rs=read(base/'runs.json');assert len(rs)==24
 counts=collections.Counter(x['run_status'] for x in rs)
 assert counts=={'MEASURED':20,'EXPORT_BLOCKED':1,'NO_COUNTED_DECLARATIONS':3},counts
 for r in rs:
  p=Path(r['evidence_dir']);data=read(p.with_suffix('.json'));assert len(data['declarations'])==r['total']
  for d in data['declarations']:
   assert d['target_kernel_view'] if d['status'] in ACC else d['failure']
  if r['run_status']=='MEASURED':
   assert r['entry_compile_exit']==r['kernel_views_exit']==r['roundtrip_exit']==0
   assert r['audit.json']==r['consumer_result.json']=='OK'
  if r['run_status']=='EXPORT_BLOCKED':assert r['entry_compile_exit']!=0
  if r['export_blocked']:
   out=p/'export-failures';out.mkdir(exist_ok=True)
   for n,f in r['export_blocked'].items():
    src=Path(f['log'])
    if src.exists():shutil.copy2(src,out/(n.rsplit('.',1)[-1]+'.log'))
 checks.append({'version':'candidate' if base.name=='improved' else 'baseline','files':len(rs),'declarations':sum(r['total'] for r in rs),'module_runs':dict(counts),'validation':'20 measured modules: roundtrip, consumer, audit, kernel views, entry compilation OK'})
save(B/'artifact-validation.json',{'checks':checks,'newly_checkable':new,'formerly_checkable_now_blocked':lost,'newly_conditional':conditioned,'extraction_failure_stages':dict(stages),'statement_suite':suite,'full_4474_root_corpus_run':False,'original_project_modified':False})
ld=B/'logs';ld.mkdir(exist_ok=True)
for name in ['rocq-core-by-file-20261018.log','rocq-core-repair-views.log','core-proof-cache-build.log','core-by-file-reports.log','core-proof-cache-trial.log']:
 p=Path.home()/'logs'/name
 if p.exists():shutil.copy2(p,ld/name)
shutil.copy2(B/'translator/reports/statement_only/test_statement.json',B/'experiments/test_statement.json')
intro='Scope: 24 Corelib files, 839 declarations of previous base modules, not all installed Corelib files.\nThe original project has not been modified, submitted or pushed.\nBaseline: 574 without additional conditions, 75 with conditions, 190 blocked.\nIsolation candidates: 569 without additional conditions, 81 with conditions, 189 blocked.\nThe checkable items have been increased from 649 to 650; the new addition is only the theorem statement eq_existT_curried_congr, there are still 3 explicit premises, and no theorem proof has been obtained.\nThere are no new success items for common data types and functions. In addition, the theorem statement 5 that originally had no additional conditions has a new condition, so it is a costly candidate and has not been integrated into the original project.\n\nDirectory:\nindex.html/improved/index.html: baseline/candidate file-by-file entry.\nrule-improvements.html / .txt: six groups of experiments, final candidates, item-by-item changes, and subsequent missing abilities.\nCorelib/.../X.v: Copy of source file.\nCorelib/.../X.lean: Actual translation entry, use #rocq2lean_import to generate kernel declaration.\nCorelib/.../X.kernel.txt: actual Lean #print definition.\nCorelib/.../X.report.html / .txt: Each success/failure and translation process.\nCorelib/.../X.json: Complete machine-readable result of the module.\nCorelib/.../X/records/0000.json: Single complete source IR, target AST, all attempts and conditions.\nCorelib/.../X/: export, roundtrip, consumer, audit, log and olean.\nimproved/Corelib/...: Candidate results with the same structure.\ntranslator/: Baseline 3c79203 plus uncommitted candidate; candidate.patch is the exact code difference.\nexperiments/: Groups of trials, differences and test evidence.\nsource-extraction-errors.json: 52 item extraction failed with actual check phase and type error.\nartifact-validation.json: product and inspection results.\n\nUse:\nEach .lean has its own dependency closure and should be used as an independent unit. 24 files cannot be directly import at the same time.\n.lean is the executable entry of the translator, not the handwritten source code separated from the translator; readable definition is in kernel.txt and itemized report.\nEquality.lean explicitly reports export failure. Ltac, Notations, and Tauto are not included in the kernel declaration, which does not mean that the strategy/notation has been translated.\nThe theorem only outputs .statement : Prop; pending is an explicit assumption and cannot be regarded as a proven proof or unconditional conclusion.\nThe process comes from real IR, tier attempts and kernel output; AST node mapping is a static description and does not pretend to be an instruction-by-instruction execution track.\n\nVerification:\nLean 4.33.1 / Rocq 9.3.0. 20 modules with exportable declarations were compiled through source roundtrip, Lean consumer, unmodified standalone audit, kernel output and entry under baseline and candidate respectively.\nThe statement suite passed: including proof that changes do not affect the output, certainty, statement tampering negative examples, and rejecting the submitted negative examples of sorry/axiom.\nThis round has not re-run the complete 4, 474 and Prosa protection roots; the protection list has not been changed. Candidate code remains isolated.\nThe reproduction script is located in scripts/ and reads the existing frozen census input and installed tool chains; all current round output is in this directory.\n'
(B/'README.txt').write_text(intro)
body='<h1>Core Rules Fixes: Real Results and Costs</h1><p><a href="index.html">baseline</a> · <a href="improved/index.html">candidate</a> · <a href="candidate.patch">patch</a> · <a href="README.txt">Instructions for use</a></p><pre>'+esc(intro.split('Directory:')[0])+'</pre>'
body+='<h2>Six sets of trials and final candidates</h2><table><tr><th>test</th><th>unconditionally</th><th>With conditions</th><th>Blocked</th><th>Check</th><th>explain</th></tr>'
for t in trials:body+='<tr>'+''.join('<td>'+esc(t[k])+'</td>' for k in ['experiment','complete','pending','blocked','validation','note'])+'</tr>'
body+='</table><p>Except for the source roundtrip of normalization-trial that failed, the remaining tests passed all three checks. Counts for simplified tests are for diagnostic purposes only. Midway thread resource errors and retry logs are retained.</p><h2>All root declaration status changes</h2><p>Item 8: Item 1 is newly available for inspection, item 5 is newly added with conditions, and item 2 is in the blocked stage of change.</p><pre>'+esc(json.dumps(deltas,ensure_ascii=False,indent=2))+'</pre>'
body+='<h2>Category-by-category rules: what has been done and what is still missing</h2><table><tr><th>Rule class</th><th>Baseline blocked</th><th>Candidate blocked</th><th>lack of ability</th><th>This round of action</th></tr>'
for row in rules:body+='<tr>'+''.join('<td>'+esc(x)+'</td>' for x in row)+'</tr>'
body+='</table><h2>Source failure instance</h2><pre>'+esc(source_errors['Corelib.Init.Datatypes.eq_true_rew_dep'])+'</pre><p><a href="source-extraction-errors.json">All 52 actual source errors</a></p><h2>Validation scope</h2><pre>'+esc(json.dumps(read(B/'artifact-validation.json'),ensure_ascii=False,indent=2))+'</pre>'
style='body{font:15px/1.7 system-ui;max-width:1300px;margin:32px auto;padding:0 24px;color:#23303b}table{border-collapse:collapse;width:100%}td,th{padding:9px;border:1px solid #dbe2e8;text-align:left;vertical-align:top}pre{white-space:pre-wrap;overflow-wrap:anywhere;background:#f1f5f9;padding:16px}td{overflow-wrap:anywhere}h1{font-size:26px}h2{font-size:20px}a{color:#175fa6}'
(B/'rule-improvements.html').write_text('<!doctype html><html lang="en"><meta charset="utf-8"><title>Rule patch comparison</title><style>'+style+'</style><body>'+body+'</body></html>')
(B/'rule-improvements.txt').write_text(intro+'\nexperiment\n'+json.dumps(trials,ensure_ascii=False,indent=2)+'\nChanges one by one\n'+json.dumps(deltas,ensure_ascii=False,indent=2)+'\nRule evaluation\n'+json.dumps(read(B/'rule-assessment.json'),ensure_ascii=False,indent=2))
for base,nav in [(B,'<p><a href="rule-improvements.html">Repair comparison: 649 → 650, but 5 new conditions</a> · <a href="improved/index.html">Candidate results</a> · <a href="README.txt">Instructions for use</a></p>'),(B/'improved','<p><a href="../rule-improvements.html">Rule patch comparison</a> · <a href="../index.html">baseline</a></p>')]:
 p=base/'index.html';p.write_text(p.read_text().replace('<body>','<body>'+nav,1))
broken=[]
for base in [B,B/'improved']:
 for p in [base/'index.html',*base.glob('Corelib/**/*.report.html')]:
  for href in re.findall(r'href="([^"]+)"',p.read_text()):
   if not href.startswith(('http:','https:','#')) and not (p.parent/href.split('#')[0]).exists():broken.append((str(p),href))
assert not broken,broken[:10]
save(B/'review-link-check.json',{'status':'OK','broken_links':broken})
p=B/'translator/reports/statement_only/ITERATION_LOG.md'
p.write_text(p.read_text()+"""
## 2026-10-18 — isolated core-by-file candidate (not merged)

Scope: previously measured 24 Corelib files / 839 declarations, baseline 3c79203.
All outputs live in ~/research/rocq-core-by-file-20261018; original project unchanged.
Exporter Prod/Lambda descent now pushes rewritten domains, matching LetIn handling.
Source recheck diagnostics include the exact stage and Rocq type error.
ROCQ2LEAN_LEAN_THREADS optionally bounds workers. Auditor/protected roots unchanged.

Six experiments: ../experiments/trial-summary.json. Final counts:
574/75/190 -> 569/81/189 (unconditional/conditional/blocked).
eq_existT_curried_congr is newly conditional; five statements acquire obligations.
Two blocked rows change failure stage. No datatype/function newly accepted.

Validation: whole core scope and 20 per-file measured entries pass source roundtrip,
kernel consumer, unchanged audit and entry compilation. scripts/test-statement passes,
including proof-insensitivity, determinism and negative controls.
Full 4,474-root Prosa corpus not rerun. No commit or push.
""")
print(json.dumps({'before':[574,75,190],'candidate':[569,81,189],'statement_suite_exit':suite['exit'],'extraction_failure_stages':dict(stages),'links':'OK'},ensure_ascii=False))


from pathlib import Path
import json,csv,re,collections,html,sys
BASE=Path(sys.argv[1]).resolve() if len(sys.argv)>1 else Path.home()/'research/rocq-core-by-file-20261018'
ORIGINAL=Path.home()/'research/rocq-core-interop-20261017/basic/basic-extended'
OK={'TRANSLATED_AND_CHECKED','BOOTSTRAP_RESOLVED','STATEMENT_KERNEL_CHECKED'}
PEND={'PENDING_KERNEL_CHECKED','STATEMENT_PENDING_KERNEL_CHECKED'}
ACCEPT=OK|PEND
def read(p):return json.loads(p.read_text())
def save(p,x):p.write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
def walk(x):
 if isinstance(x,dict):
  yield x
  for v in x.values():yield from walk(v)
 elif isinstance(x,list):
  for v in x:yield from walk(v)
def esc(x):return html.escape(str(x))
def cat(d):
 if not d:return 'export_unavailable'
 if d['kind']=='inductive':return 'logical_inductive' if d['bodies'][0]['sort']['k']=='prop' else 'data_inductive'
 return 'statement' if d.get('body_state')=='statement_only' else 'definition_function'
def failure(d):
 st=d['status'];msg=d.get('message','')
 if st in ACCEPT:return None
 if st=='EXPORT_SORT_POLYMORPHISM_UNSUPPORTED':
  return {'stage':'Export/MetaRocq Reference','class':'sort_polymorphism','observed':'The exporter refused to bind the polymorphic context sort quality; the entry IR was not generated.','needed':'The front-end needs to represent and reference the quality/sort polymorphism, and pass constraints to subsequent IR and Lean translations; instead of just adding an ordinary AST node.','implementation':'rocq/exporter/src/r2l_export.ml:733,1075','certainty':'The stages and error reports are direct evidence; the required ability is analysis, which does not mean that security has been implemented.'}
 if st=='OBLIGATION_EXTRACTION_REFUSED':
  return {'stage':'Source-side Rocq kernel recheck after proof extraction','class':'proof_extraction','observed':'After extracting the proof, the overridden type/function body failed the Rocq kernel check; the function body was omitted from official export.','needed':'The extraction rules need to maintain the consistency of dependent types and calculations, and the consistency of types, binding contexts and proof-dependent elimination before and after rewriting need to be analyzed; the source type errors cannot be ignored by just adding the extraction proposition. Specific repairs must be re-examined case by case, and the experimental results can be found in the root directory rule repair report.','implementation':'rocq/exporter/src/r2l_export.ml:862,923; Rocq2Lean/Emit.lean:2114','certainty':'The direct evidence is the source recheck failure and the original reason; the more detailed failed conversion steps are not output by the current front end'}
 if 'termination deferred' in msg:
  return {'stage':'Prove post-extraction/recursive termination processing','class':'proof_recursion','observed':'The proof sub-items used in structural recursion become obligations to be proved, and the original basis for structural recursion is lost.','needed':'It is necessary to reconstruct the recursive basis or generate a verifiable well-founded recursive/terminating obligation for this type of situation; this entry is not covered by the existing transFixAcc/transFixWf.','implementation':'Rocq2Lean/Emit.lean:2110; rocq/exporter/src/r2l_export.ml:1009','certainty':'The error report directly points out that this type of translation rule is missing.'}
 if 'SProp' in msg:
  return {'stage':'Expression / sort or relevance translation','class':'sprop','observed':msg,'needed':'It is necessary to clarify the target representation of SProp, related elimination restrictions, and processing of irrelevant bindings, and allow auditing to cover these rules; it cannot be simply changed to Prop without verification.','implementation':'Rocq2Lean/Translate.lean:364,368','certainty':'The current code directly rejects it; specifically indicating that the choice is still a design matter'}
 if 'template inductive' in msg and 'quality Prop' in msg:
  return {'stage':'Parameter instantiation of template inductive types','class':'template_prop','observed':msg,'needed':'Requires support for Prop parameter instances of this generalized type, while handling constructors, eliminators, projections, and consumers consistently; this may involve a Sort generalization or an approved lift representation, and cannot just be typed at the call site.','implementation':'Rocq2Lean/Translate.lean:511','certainty':'The specific inductive type and parameter location are subject to the original error report; the repair direction is analysis'}
 if st=='BLOCKED_DEPENDENCY':
  return {'stage':'Dependency closure handling','class':'dependency','observed':msg,'needed':'First fix the root cause in the dependency chain below, and then re-translate this item; there is currently no evidence that this item itself lacks independent rules.','implementation':'Rocq2Lean/Emit.lean','certainty':'Direct dependencies and root cause chains come from reports; this item must still be retested after the upstream is fixed.'}
 if st=='UNIVERSE_REJECTED':
  return {'stage':'Universe instance solving / consistency checking','class':'universe','observed':msg,'needed':'Corresponding universe parameter propagation or solution strategies need to be modified, and source size constraints, shared layer consistency, and public type ranges retained; checks cannot be relaxed to create success.','implementation':'Rocq2Lean/Translate.lean:2740-2780; Rocq2Lean/Emit.lean','certainty':'The specific constraint violation is direct evidence; the current log is not sufficient to conclude that fixing a certain line can solve the problem.'}
 return {'stage':'target translation/checking','class':st.lower(),'observed':msg,'needed':'Locate and add rules based on the original error report; a definite patch cannot be inferred from the status code.','implementation':'Rocq2Lean/Emit.lean','certainty':'Not yet positioned further'}
FLAGS={'fr':'source universe fact simplification','it':'Universe facts explained','ad':'Sort explanation of motive','cu':'Cumulative retries','di':'Discovering implicit cosmological parameters','lo':'Checked Hierarchy Solver','de':'Transparent definition expansion','wf':'well-founded terminating branch','rv':'Inherit result from value sort','p3':'Exact solution layers by premise type','jo':'joint solution','un':'Unified solution','pl':'plain levels is represented in the inductive type; Prop lift is represented in the constant. Try','ph':'phantom lower'}
NODE={'rel':'Local variable → Lean Bind variable','sort':'Source sort/ Universe → Lean Sort','prod':'Dependent function type → Lean forall','lam':'Function body → Lean lambda','let':'Local definition → Lean let','letin':'Local definition → Lean let','app':'Application → Application of the translated target','const':'Global constant → Goal statement or explicit premise to be proved','ind':'Inductive type reference → native bootstrap or generated type','construct':'Constructor → corresponds to the target constructor','case':'Pattern elimination → target recursor/ elimination expression','fix':'Recursive → target recursive elimination structure; for specific results, see recursor reference and actual Lean definition','cast':'Checked type conversion','proj':'Projection → target field/projection'}
STYLE='body{font:15px/1.65 system-ui,sans-serif;max-width:1250px;margin:35px auto;padding:0 24px;color:#23303b;background:#fbfcfe}h1{font-size:25px}h2{font-size:19px}table{border-collapse:collapse;width:100%;background:white}td,th{padding:9px;border:1px solid #dbe2e8;text-align:left;vertical-align:top}pre{white-space:pre-wrap;overflow-wrap:anywhere;background:#edf2f6;padding:14px;border-radius:6px;font:12px/1.6 ui-monospace,monospace}details{background:white;border:1px solid #dbe2e8;border-radius:7px;margin:13px 0;padding:12px}summary{font-weight:600;cursor:pointer;overflow-wrap:anywhere}input,select{padding:9px;margin:8px;border:1px solid #aab8c5;border-radius:5px}a{color:#175fa6}.note{background:#edf4ff;padding:14px}.bad{color:#ac3027}.good{color:#176d4c}'
def document(title,body):return '<!doctype html><html lang="en"><meta charset="utf-8"><title>'+esc(title)+'</title><style>'+STYLE+'</style><body>'+body+'</body></html>'
runs=read(BASE/'runs.json');baseline={x['source']:x for x in csv.DictReader((ORIGINAL/'declarations.csv').open())}
overall=[];summaries=[];changes=[]
for meta in runs:
 out=Path(meta['evidence_dir']);stem=out;mod=meta['module']
 assert meta['run_status']!='INFRASTRUCTURE_ERROR',(mod,meta.get('error'))
 rep=read(out/'translation_report.json') if (out/'translation_report.json').exists() else {'roots':[],'results':[]}
 result={r['source']:r for r in rep['results']}
 lines=[json.loads(l) for l in (out/'source.ndjson').open()] if (out/'source.ndjson').exists() else []
 source={r['name']:r for r in lines if r['kind'] in ('constant','inductive')}
 header=next((r for r in lines if r['kind']=='header'),{})
 timing={r['source']:r for r in read(out/'translation_timing.json')['declarations']} if (out/'translation_timing.json').exists() else {}
 rt=read(out/'source-roundtrip/roundtrip.json') if (out/'source-roundtrip/roundtrip.json').exists() else {}
 audit=read(out/'audit.json') if (out/'audit.json').exists() else {}
 consumer=read(out/'consumer_result.json') if (out/'consumer_result.json').exists() else {}
 views={}
 if (out/'kernel-view-index.json').exists():
  log=(out/'kernel-views.log').read_text()
  for a in read(out/'kernel-view-index.json'):
   hit=re.search(r'^R2L_BEGIN_'+str(a['index'])+r'\n(.*?)^R2L_END_'+str(a['index'])+r'$',log,re.M|re.S)
   assert hit,(mod,a)
   views[a['source']]=hit.group(1).strip()
 def blockers(n,trail=()):
  if n in trail:return [{'path':list(trail)+( [n]),'cycle':True}]
  d=result.get(n)
  if not d:return [{'path':list(trail)+[n],'status':'NOT_IN_REPORT'}]
  deps=d.get('blocked_by',[])
  if not deps:return [{'path':list(trail)+[n],'status':d['status'],'diagnosis':failure(d),'message':d.get('message','')}]
  return [v for dep in deps for v in blockers(dep,trail+(n,))]
 src_text=stem.with_suffix('.v').read_text()
 roots=[result[r['name']] for r in rep['roots']]
 roots += [{'source':n,'status':'EXPORT_SORT_POLYMORPHISM_UNSUPPORTED','kind':'constant','message':d.get('tail',''),'path':[],'blocked_by':[],'target':None} for n,d in meta['export_blocked'].items()]
 records=[]
 for d in roots:
  n=d['source'];s=source.get(n);kind=cat(s);status=d['status'];short=n.rsplit('.',1)[-1]
  locations=[i+1 for i,l in enumerate(src_text.splitlines()) if re.search(r'\b(?:Inductive|CoInductive|Record|Structure|Variant|Definition|Fixpoint|CoFixpoint|Lemma|Theorem|Fact|Corollary|Proposition|Let|Class|Instance)\s+'+re.escape(short)+r'\b',l)]
  generated=False
  if not locations:
   for suffix in ['_sind','_rect','_rec','_ind']:
    if short.endswith(suffix):
     owner=short[:-len(suffix)];locations=[i+1 for i,l in enumerate(src_text.splitlines()) if re.search(r'\b(?:Inductive|CoInductive|Record|Structure|Variant)\s+'+re.escape(owner)+r'\b',l)]
     if locations:generated=True;break
  sc=collections.Counter(x['k'] for x in walk(s or {}) if x.get('k') in NODE)
  tv=d.get('target_value');target_refs=sorted({x['n'] for x in walk(tv) if x.get('k')=='const'})
  recursors=[n for n in target_refs if any(t in n for t in ['.rec','.brecOn','.below','WellFounded'])]
  prep=(s or {}).get('native',{}).get('prepared',{})
  pending=[]
  for h in d.get('pending_hypotheses',[]):
   hr=result.get(h,{})
   pending.append({'source':h,'target':hr.get('target'),'status':hr.get('status'),'statement_target_type':hr.get('target_type'),'statement_target_value':hr.get('target_value'),'source_record':source.get(h)})
  tiers=[{'label':t[0],'ms':t[1],'result':t[2],'flag_descriptions':[FLAGS.get(f,f) for f in re.search(r'\[(.*?)\]',t[0]).group(1).split(',') if f]} for t in timing.get(n,{}).get('tier_times',[])]
  phases=[
   {'stage':'1 source declaration and export','evidence':{'source_kind':kind,'source_body_state':(s or {}).get('body_state'),'native_preparation':prep,'exported':s is not None}},
   {'stage':'2 proves extraction and dependence','evidence':{'proof_body_omitted':kind=='statement','dependencies':(s or {}).get('deps',{}),'pending':d.get('pending_hypotheses',[]),'extraction_refusal':header.get('mode',{}).get('extraction_refused',{}).get(n)}},
   {'stage':'3 structure translation','evidence':{'declaration_rule':d.get('rule',''),'source_node_counts':dict(sc),'node_rules_present':[NODE[k] for k in sc],'actual_target_recursors':recursors,'note':'Node mapping is a static interpretation based on IR and implementation; it is not a fictitious node-by-node running trajectory. See tier_attempts for actual running attempts.'}},
   {'stage':'4 universe and adaptation processing','evidence':{k:v for k,v in d.items() if k in ['level_params','level_interp','level_split','level_copies','template_params','solved_levels','admitting_levels','universe_checks','universe_diagnostics','r2bp_levels','prop_lift','prop_lift_coercions','delta_inlined','phantom_lowered']}},
   {'stage':'5 target output','evidence':{'status':status,'target':d.get('target'),'target_kind':d.get('target_kind'),'theorem_proof_produced':False}},
   {'stage':'6 independent inspection','evidence':{'source_roundtrip_item':rt.get('results',{}).get(n),'module_roundtrip':rt.get('status','NOT_APPLICABLE'),'consumer':consumer.get('status','NOT_APPLICABLE'),'audit':audit.get('status','NOT_APPLICABLE')}}
  ]
  rec={'source':n,'module':mod,'category':kind,'status':status,'target':d.get('target'),'source_line_candidates':locations,'generated_from_inductive':generated,'source_location_note':"Candidate line number matching the text declaration name; automatically generates an eliminator pointing to the corresponding inductive definition, without pretending to be the compiler's exact span.",'source_ir':s,'target_kernel_view':views.get(n),'target_result':d,'pipeline':phases,'tier_attempts':tiers,'pending_obligations':pending,'failure':failure(d),'failure_dependency_chains':blockers(n) if status=='BLOCKED_DEPENDENCY' else [],'baseline_combined_status':baseline.get(n,{}).get('status')}
  if rec['baseline_combined_status'] and rec['baseline_combined_status']!=status:changes.append({'source':n,'combined':rec['baseline_combined_status'],'per_file':status})
  records.append(rec);overall.append(rec)
 counts=collections.Counter(r['status'] for r in records)
 summary={'module':mod,'total':len(records),'complete':sum(v for k,v in counts.items() if k in OK),'pending':sum(v for k,v in counts.items() if k in PEND),'blocked':sum(v for k,v in counts.items() if k not in ACCEPT),'statuses':dict(counts),'run_status':meta['run_status'],'source_roundtrip':rt.get('status','NOT_APPLICABLE'),'consumer':consumer.get('status','NOT_APPLICABLE'),'audit':audit.get('status','NOT_APPLICABLE'),'translation_compile_exit':meta.get('entry_compile_exit')}
 assert len(records)==meta['total'],(mod,len(records),meta['total'])
 if records and meta['run_status']=='MEASURED':assert summary['source_roundtrip']==summary['consumer']==summary['audit']=='OK',summary
 summaries.append(summary)
 save(stem.with_suffix('.json'),{'summary':summary,'declarations':records})
 text=[mod+' Statement-by-statement translation report',json.dumps(summary,ensure_ascii=False,indent=2),"This file is run independently module by module. Dependencies are included repeatedly with each translation unit; don't just import all .lean together.",'Corresponding to .lean, use the #rocq2lean_import command of the translator to generate the kernel declaration; the actual definition is displayed as kernel view, not the artificially forged Lean source code.','Theorems only translate statements; pending is an explicit premise, not proven; there is no fictitious IR for underived items.']
 bodies=[]
 (stem/'records').mkdir(exist_ok=True)
 for i,r in enumerate(records):
  save(stem/'records'/f'{i:04d}.json',r)
  ds=[r['source'],f"Category: {r['category']}; Status: {r['status']}; Actual target: {r['target']}",'Source file line number candidates: '+str(r['source_line_candidates'])]
  for ph in r['pipeline']:ds += [ph['stage'],json.dumps(ph['evidence'],ensure_ascii=False,indent=2)]
  ds+=['Actual recorded translation attempts',json.dumps(r['tier_attempts'],ensure_ascii=False,indent=2)]
  if r['target_kernel_view']:ds+=['Actual Lean core declaration (#print)',r['target_kernel_view']]
  if r['pending_obligations']:ds+=['Conditions to be proven (including complete source/target expression)',json.dumps(r['pending_obligations'],ensure_ascii=False,indent=2)]
  if r['failure']:ds+=['Failure positioning and missing capabilities',json.dumps(r['failure'],ensure_ascii=False,indent=2),'original error',r['target_result'].get('message',''),'IR node path',json.dumps(r['target_result'].get('path',[])),'upstream root cause chain',json.dumps(r['failure_dependency_chains'],ensure_ascii=False,indent=2)]
  text+=['\n'+'='*80,*ds]
  content='<p>'+esc(ds[1])+'</p>'
  content+='<p> source file line number candidate:'+esc(r['source_line_candidates'])+'</p>'
  if r['target_kernel_view']:content+='<h3>Actual Lean output</h3><pre>'+esc(r['target_kernel_view'])+'</pre>'
  if r['failure']:content+='<h3>Failure locations, causes and required capabilities</h3><pre>'+esc(json.dumps(r['failure'],ensure_ascii=False,indent=2))+'</pre><pre>'+esc(r['target_result'].get('message',''))+'\nNode path: '+esc(r['target_result'].get('path',[]))+'</pre><pre>'+esc(json.dumps(r['failure_dependency_chains'],ensure_ascii=False,indent=2))+'</pre>'
  content+='<h3>translation process</h3>'+''.join('<p>'+esc(ph['stage'])+'</p><pre>'+esc(json.dumps(ph['evidence'],ensure_ascii=False,indent=2))+'</pre>' for ph in r['pipeline'])
  content+='<h3>Actual order of attempts</h3><pre>'+esc(json.dumps([dict(t,result=t['result'].splitlines()[0][:240]) for t in r['tier_attempts']],ensure_ascii=False,indent=2))+'</pre><p>See itemized JSON below for full attempt results.</p>'
  if r['pending_obligations']:content+='<h3>Conditions to be proven</h3><pre>'+esc(json.dumps([{k:h.get(k) for k in ['source','target','status']} for h in r['pending_obligations']],ensure_ascii=False,indent=2))+'</pre><p>The complete source type and Lean type of condition is shown in item JSON.</p>'
  content+='<p><a href="'+stem.name+'/records/'+f'{i:04d}'+'.json"&gt;Complete evidence for this item: source IR, target AST, all attempts and conditions to be proved</a></p>'
  bodies.append('<details class="decl" id="d'+str(i)+'" data-status="'+esc(r['status'])+'"><summary>'+esc(r['source'])+' — '+esc(r['status'])+'</summary>'+content+'</details>')
 stem.with_suffix('.report.txt').write_text('\n'.join(text)+'\n')
 stem.with_suffix('.kernel.txt').write_text('\n\n'.join('SOURCE '+r['source']+'\n'+r['target_kernel_view'] for r in records if r['target_kernel_view'])+'\n')
 intro='<h1>'+esc(mod)+'</h1><p class="note">'+esc(text[2])+' '+esc(text[3])+' '+esc(text[4])+'</p><pre>'+esc(json.dumps(summary,ensure_ascii=False,indent=2))+'</pre><p><a href="'+stem.name+'.lean"&gt;Translation file</a> · <a href="'+stem.name+'.v"&gt;Copy of source file</a> · <a href="'+stem.name+'.json"&gt;Complete JSON</a> · <a href="'+stem.name+'.report.txt"&gt;Text report</a></p><input id="search" placeholder="Search claim name"><select id="filter"><option value="">All status</option>'+''.join('<option>'+esc(x)+'</option>' for x in counts)+'</select>'
 js='<script>function filter(){let q=document.getElementById("search").value.toLowerCase(),s=document.getElementById("filter").value;document.querySelectorAll(".decl").forEach(e=>e.style.display=(!s||e.dataset.status===s)&&e.querySelector("summary").textContent.toLowerCase().includes(q)?"":"none")}document.getElementById("search").oninput=filter;document.getElementById("filter").onchange=filter;</script>'
 stem.with_suffix('.report.html').write_text(document(mod,intro+''.join(bodies)+js))
save(BASE/'module-summary.json',summaries);save(BASE/'combined-vs-per-file.json',changes)
flat=[{'module':r['module'],'source':r['source'],'category':r['category'],'status':r['status'],'target':r['target'],'failure_stage':(r['failure'] or {}).get('stage',''),'failure_class':(r['failure'] or {}).get('class',''),'missing_capability':(r['failure'] or {}).get('needed',''),'raw_message':r['target_result'].get('message','')} for r in overall]
for fname,rs in [('declarations.csv',flat),('failures.csv',[r for r in flat if r['status'] not in ACCEPT])]:
 with (BASE/fname).open('w') as f:
  w=csv.DictWriter(f,fieldnames=list(flat[0]));w.writeheader();w.writerows(rs)
counts=collections.Counter(r['status'] for r in overall)
failure_counts=collections.Counter(r['failure']['class'] for r in overall if r['failure'])
summary={'source_modules':len(summaries),'source_declarations':len(overall),'complete':sum(v for k,v in counts.items() if k in OK),'pending':sum(v for k,v in counts.items() if k in PEND),'blocked':sum(v for k,v in counts.items() if k not in ACCEPT),'status_counts':dict(counts),'failure_counts':dict(failure_counts),'combined_run_status_changes':changes,'scope':'Previously requested 24 core files / 839 declarations; excludes other Corelib files and MathComp.','process_evidence':'actual declaration/tier reports, source/target IR and kernel #print; AST explanation is static provenance, not a complete instruction-by-instruction execution trace'}
save(BASE/'summary.json',summary)
rows=''.join('<tr><td><a href="'+s['module'].replace('.','/')+'.report.html">'+esc(s['module'])+'</a></td><td>'+str(s['total'])+'</td><td>'+str(s['complete'])+'</td><td>'+str(s['pending'])+'</td><td>'+str(s['blocked'])+'</td><td>'+esc(s['run_status'])+'</td></tr>' for s in summaries)
(BASE/'index.html').write_text(document('Rocq Core File-by-file translation results','<h1>Rocq Core File-by-file translation results</h1><p>Fixed baseline 3c79203; all target declarations are actually generated and checked by the original translator. Click on a module to view each definition, process and failure reason.</p><pre>'+esc(json.dumps(summary,ensure_ascii=False,indent=2))+'</pre><table><tr><th>Source Module/Itemized Report</th><th>Total</th><th>No additional conditions</th><th>With conditions</th><th>Blocked</th><th>Running status</th></tr>'+rows+'</table><p>Containing a theorem statement without additional conditions does not mean that the theorem has been proved. Equality.lean explicitly reports export failure; three kernelless declaration files does not mean that tokens/policies have been translated. Each .lean contains its own dependency closure and is used as an independent unit.</p>'))
if BASE.name=='improved':
 p=BASE/'index.html';p.write_text(p.read_text().replace('Fixed baseline 3c79203; all target declarations are actually generated and checked by the original translator.','Baseline 3c79203 plus candidate-final isolation patch; all target declarations are actually generated and checked by the candidate translator.'))
print(json.dumps(summary,ensure_ascii=False,indent=2))


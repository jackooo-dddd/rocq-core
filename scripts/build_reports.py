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
  return {'stage':'导出 / MetaRocq 引用','class':'sort_polymorphism','observed':'导出器拒绝绑定 sort quality 的多态上下文；没有生成该项 IR。','needed':'需要前端表示并引用 quality/sort 多态，且向后续 IR 与 Lean 翻译传递约束；不是仅增加一个普通 AST 节点。','implementation':'rocq/exporter/src/r2l_export.ml:733,1075','certainty':'阶段和报错为直接证据；所需能力为分析，不代表已有安全实现'}
 if st=='OBLIGATION_EXTRACTION_REFUSED':
  return {'stage':'源端证明抽取后的 Rocq 内核重检','class':'proof_extraction','observed':'抽取证明后，重写的类型/函数体未通过 Rocq 内核检查；正式导出省略该函数体。','needed':'需要保持依赖类型与计算一致性的抽取规则，需要分析重写前后类型、绑定上下文及 proof-dependent 消去的一致性；不能仅补上抽取命题就忽略源端类型错误。具体修复须逐例重检，实验结果见根目录规则修补报告。','implementation':'rocq/exporter/src/r2l_export.ml:862,923; Rocq2Lean/Emit.lean:2114','certainty':'直接证据是源端重检失败及原始理由；更细的失败转换步骤没有由当前前端输出'}
 if 'termination deferred' in msg:
  return {'stage':'证明抽取后 / 递归终止性处理','class':'proof_recursion','observed':'结构递归所用的证明子项成为待证明义务，原结构递归依据丢失。','needed':'需要为这一类情况重建递归依据或生成可核验的良基递归/终止性义务；现有 transFixAcc/transFixWf 并未覆盖此入口。','implementation':'Rocq2Lean/Emit.lean:2110; rocq/exporter/src/r2l_export.ml:1009','certainty':'报错直接指出缺少该类翻译规则'}
 if 'SProp' in msg:
  return {'stage':'表达式 / sort 或 relevance 翻译','class':'sprop','observed':msg,'needed':'需要明确 SProp 的目标表示、相关消去限制以及无关绑定的处理，并让审计覆盖这些规则；不能未经验证简单改成 Prop。','implementation':'Rocq2Lean/Translate.lean:364,368','certainty':'当前代码直接拒绝；具体表示选择仍属于设计事项'}
 if 'template inductive' in msg and 'quality Prop' in msg:
  return {'stage':'模板归纳类型的参数实例化','class':'template_prop','observed':msg,'needed':'需要支持这一归纳类型的 Prop 参数实例，同时一致处理构造子、消去器、投影和使用方；可能涉及 Sort 泛化或已批准的 lift 表示，不可仅在调用处换一个类型。','implementation':'Rocq2Lean/Translate.lean:511','certainty':'具体归纳类型、参数位置以原始报错为准；修复方向为分析'}
 if st=='BLOCKED_DEPENDENCY':
  return {'stage':'依赖闭包处理','class':'dependency','observed':msg,'needed':'先修复下方依赖链中的根因，再重新翻译本项；目前没有证据表明本项自身还缺少独立规则。','implementation':'Rocq2Lean/Emit.lean','certainty':'直接依赖与根因链来自报告；修复上游后仍须重测本项'}
 if st=='UNIVERSE_REJECTED':
  return {'stage':'宇宙实例求解 / 一致性校验','class':'universe','observed':msg,'needed':'需要修正相应宇宙参数传播或求解策略，并保留源端大小约束、共享层一致性及公开类型范围；不可放松检查来制造成功。','implementation':'Rocq2Lean/Translate.lean:2740-2780; Rocq2Lean/Emit.lean','certainty':'具体违反的约束为直接证据；当前日志不足以断言某一行修复即可解决'}
 return {'stage':'目标翻译/检查','class':st.lower(),'observed':msg,'needed':'依据原始报错定位并补充规则；不能从状态码推定一个确定补丁。','implementation':'Rocq2Lean/Emit.lean','certainty':'尚未进一步定位'}
FLAGS={'fr':'源宇宙事实化简','it':'宇宙事实解释','ad':'motive 的 Sort 解释','cu':'累积性重试','di':'发现隐式宇宙参数','lo':'受检的层级求解','de':'透明定义展开','wf':'良基终止性分支','rv':'从值继承结果 sort','p3':'按前提类型精确解层','jo':'联合求解','un':'统一求解','pl':'归纳类型中表示 plain levels；常量中表示 Prop lift 尝试','ph':'phantom 降低'}
NODE={'rel':'局部变量 → Lean 绑定变量','sort':'源 sort/宇宙 → Lean Sort','prod':'依赖函数类型 → Lean forall','lam':'函数体 → Lean lambda','let':'局部定义 → Lean let','letin':'局部定义 → Lean let','app':'应用 → 已翻译目标的应用','const':'全局常量 → 目标声明或显式待证明前提','ind':'归纳类型引用 → 原生 bootstrap 或生成类型','construct':'构造子 → 对应目标构造子','case':'模式消去 → 目标 recursor/消去表达式','fix':'递归 → 目标递归消去结构；具体结果见 recursor 引用与实际 Lean 定义','cast':'带检查的类型转换','proj':'投影 → 目标字段/投影'}
STYLE='body{font:15px/1.65 system-ui,sans-serif;max-width:1250px;margin:35px auto;padding:0 24px;color:#23303b;background:#fbfcfe}h1{font-size:25px}h2{font-size:19px}table{border-collapse:collapse;width:100%;background:white}td,th{padding:9px;border:1px solid #dbe2e8;text-align:left;vertical-align:top}pre{white-space:pre-wrap;overflow-wrap:anywhere;background:#edf2f6;padding:14px;border-radius:6px;font:12px/1.6 ui-monospace,monospace}details{background:white;border:1px solid #dbe2e8;border-radius:7px;margin:13px 0;padding:12px}summary{font-weight:600;cursor:pointer;overflow-wrap:anywhere}input,select{padding:9px;margin:8px;border:1px solid #aab8c5;border-radius:5px}a{color:#175fa6}.note{background:#edf4ff;padding:14px}.bad{color:#ac3027}.good{color:#176d4c}'
def document(title,body):return '<!doctype html><html lang="zh"><meta charset="utf-8"><title>'+esc(title)+'</title><style>'+STYLE+'</style><body>'+body+'</body></html>'
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
   {'stage':'1 源声明与导出','evidence':{'source_kind':kind,'source_body_state':(s or {}).get('body_state'),'native_preparation':prep,'exported':s is not None}},
   {'stage':'2 证明抽取与依赖','evidence':{'proof_body_omitted':kind=='statement','dependencies':(s or {}).get('deps',{}),'pending':d.get('pending_hypotheses',[]),'extraction_refusal':header.get('mode',{}).get('extraction_refused',{}).get(n)}},
   {'stage':'3 结构翻译','evidence':{'declaration_rule':d.get('rule',''),'source_node_counts':dict(sc),'node_rules_present':[NODE[k] for k in sc],'actual_target_recursors':recursors,'note':'节点映射是依据 IR 与实现的静态解释；不是虚构的逐节点运行轨迹。实际运行尝试见 tier_attempts。'}},
   {'stage':'4 宇宙及适配处理','evidence':{k:v for k,v in d.items() if k in ['level_params','level_interp','level_split','level_copies','template_params','solved_levels','admitting_levels','universe_checks','universe_diagnostics','r2bp_levels','prop_lift','prop_lift_coercions','delta_inlined','phantom_lowered']}},
   {'stage':'5 目标输出','evidence':{'status':status,'target':d.get('target'),'target_kind':d.get('target_kind'),'theorem_proof_produced':False}},
   {'stage':'6 独立检查','evidence':{'source_roundtrip_item':rt.get('results',{}).get(n),'module_roundtrip':rt.get('status','NOT_APPLICABLE'),'consumer':consumer.get('status','NOT_APPLICABLE'),'audit':audit.get('status','NOT_APPLICABLE')}}
  ]
  rec={'source':n,'module':mod,'category':kind,'status':status,'target':d.get('target'),'source_line_candidates':locations,'generated_from_inductive':generated,'source_location_note':'文本声明名匹配的行号候选；自动生成消去器指向所属归纳定义，不冒充编译器精确 span。','source_ir':s,'target_kernel_view':views.get(n),'target_result':d,'pipeline':phases,'tier_attempts':tiers,'pending_obligations':pending,'failure':failure(d),'failure_dependency_chains':blockers(n) if status=='BLOCKED_DEPENDENCY' else [],'baseline_combined_status':baseline.get(n,{}).get('status')}
  if rec['baseline_combined_status'] and rec['baseline_combined_status']!=status:changes.append({'source':n,'combined':rec['baseline_combined_status'],'per_file':status})
  records.append(rec);overall.append(rec)
 counts=collections.Counter(r['status'] for r in records)
 summary={'module':mod,'total':len(records),'complete':sum(v for k,v in counts.items() if k in OK),'pending':sum(v for k,v in counts.items() if k in PEND),'blocked':sum(v for k,v in counts.items() if k not in ACCEPT),'statuses':dict(counts),'run_status':meta['run_status'],'source_roundtrip':rt.get('status','NOT_APPLICABLE'),'consumer':consumer.get('status','NOT_APPLICABLE'),'audit':audit.get('status','NOT_APPLICABLE'),'translation_compile_exit':meta.get('entry_compile_exit')}
 assert len(records)==meta['total'],(mod,len(records),meta['total'])
 if records and meta['run_status']=='MEASURED':assert summary['source_roundtrip']==summary['consumer']==summary['audit']=='OK',summary
 summaries.append(summary)
 save(stem.with_suffix('.json'),{'summary':summary,'declarations':records})
 text=[mod+' 逐声明翻译报告',json.dumps(summary,ensure_ascii=False,indent=2),'本文件采用逐模块独立运行。依赖随各翻译单元重复包含；不要直接把全部 .lean 一起 import。','对应 .lean 使用翻译器的 #rocq2lean_import 命令生成内核声明；实际定义以 kernel view 展示，并非人工伪造的 Lean 源码。','定理只翻译陈述；pending 是显式前提，不是已经证明；未导出的项目没有虚构 IR。']
 bodies=[]
 (stem/'records').mkdir(exist_ok=True)
 for i,r in enumerate(records):
  save(stem/'records'/f'{i:04d}.json',r)
  ds=[r['source'],f"类别: {r['category']}；状态: {r['status']}；实际目标: {r['target']}",'源文件行号候选: '+str(r['source_line_candidates'])]
  for ph in r['pipeline']:ds += [ph['stage'],json.dumps(ph['evidence'],ensure_ascii=False,indent=2)]
  ds+=['实际记录的翻译尝试',json.dumps(r['tier_attempts'],ensure_ascii=False,indent=2)]
  if r['target_kernel_view']:ds+=['实际 Lean 内核声明（#print）',r['target_kernel_view']]
  if r['pending_obligations']:ds+=['待证明条件（含完整源/目标表达）',json.dumps(r['pending_obligations'],ensure_ascii=False,indent=2)]
  if r['failure']:ds+=['失败定位与缺失能力',json.dumps(r['failure'],ensure_ascii=False,indent=2),'原始报错',r['target_result'].get('message',''),'IR 节点路径',json.dumps(r['target_result'].get('path',[])),'上游根因链',json.dumps(r['failure_dependency_chains'],ensure_ascii=False,indent=2)]
  text+=['\n'+'='*80,*ds]
  content='<p>'+esc(ds[1])+'</p>'
  content+='<p>源文件行号候选：'+esc(r['source_line_candidates'])+'</p>'
  if r['target_kernel_view']:content+='<h3>实际 Lean 输出</h3><pre>'+esc(r['target_kernel_view'])+'</pre>'
  if r['failure']:content+='<h3>失败位置、原因与所需能力</h3><pre>'+esc(json.dumps(r['failure'],ensure_ascii=False,indent=2))+'</pre><pre>'+esc(r['target_result'].get('message',''))+'\n节点路径: '+esc(r['target_result'].get('path',[]))+'</pre><pre>'+esc(json.dumps(r['failure_dependency_chains'],ensure_ascii=False,indent=2))+'</pre>'
  content+='<h3>翻译过程</h3>'+''.join('<p>'+esc(ph['stage'])+'</p><pre>'+esc(json.dumps(ph['evidence'],ensure_ascii=False,indent=2))+'</pre>' for ph in r['pipeline'])
  content+='<h3>实际尝试顺序</h3><pre>'+esc(json.dumps([dict(t,result=t['result'].splitlines()[0][:240]) for t in r['tier_attempts']],ensure_ascii=False,indent=2))+'</pre><p>完整尝试结果见下方逐项 JSON。</p>'
  if r['pending_obligations']:content+='<h3>待证明条件</h3><pre>'+esc(json.dumps([{k:h.get(k) for k in ['source','target','status']} for h in r['pending_obligations']],ensure_ascii=False,indent=2))+'</pre><p>条件的完整源类型和 Lean 类型见逐项 JSON。</p>'
  content+='<p><a href="'+stem.name+'/records/'+f'{i:04d}'+'.json">本项完整证据：源 IR、目标 AST、所有尝试和待证明条件</a></p>'
  bodies.append('<details class="decl" id="d'+str(i)+'" data-status="'+esc(r['status'])+'"><summary>'+esc(r['source'])+' — '+esc(r['status'])+'</summary>'+content+'</details>')
 stem.with_suffix('.report.txt').write_text('\n'.join(text)+'\n')
 stem.with_suffix('.kernel.txt').write_text('\n\n'.join('SOURCE '+r['source']+'\n'+r['target_kernel_view'] for r in records if r['target_kernel_view'])+'\n')
 intro='<h1>'+esc(mod)+'</h1><p class="note">'+esc(text[2])+' '+esc(text[3])+' '+esc(text[4])+'</p><pre>'+esc(json.dumps(summary,ensure_ascii=False,indent=2))+'</pre><p><a href="'+stem.name+'.lean">翻译文件</a> · <a href="'+stem.name+'.v">源文件副本</a> · <a href="'+stem.name+'.json">完整 JSON</a> · <a href="'+stem.name+'.report.txt">文本报告</a></p><input id="search" placeholder="搜索声明名"><select id="filter"><option value="">全部状态</option>'+''.join('<option>'+esc(x)+'</option>' for x in counts)+'</select>'
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
(BASE/'index.html').write_text(document('Rocq Core 逐文件翻译结果','<h1>Rocq Core 逐文件翻译结果</h1><p>固定基线 3c79203；所有目标声明由原翻译器实际生成并检查。点击模块查看每项定义、过程与失败根因。</p><pre>'+esc(json.dumps(summary,ensure_ascii=False,indent=2))+'</pre><table><tr><th>源模块 / 逐项报告</th><th>总数</th><th>无额外条件</th><th>带条件</th><th>受阻</th><th>运行状态</th></tr>'+rows+'</table><p>无额外条件包含定理陈述，不代表已有定理证明。Equality.lean 明确报告导出失败；三个无内核声明文件不代表记号/策略已翻译。各 .lean 含自己的依赖闭包，作为独立单元使用。</p>'))
if BASE.name=='improved':
 p=BASE/'index.html';p.write_text(p.read_text().replace('固定基线 3c79203；所有目标声明由原翻译器实际生成并检查。','基线 3c79203 加 candidate-final 隔离补丁；所有目标声明由候选翻译器实际生成并检查。'))
print(json.dumps(summary,ensure_ascii=False,indent=2))


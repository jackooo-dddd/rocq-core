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
'proof-cache-trial':'相同完整上下文中的证明子项复用：没有增加通过项，未保留。',
'normalization-trial':'抽取前 β/ι/ζ 化简：源端结构 roundtrip 失败；下面计数只是诊断，不能计为认证结果，拒绝。',
'binder-context-trial':'使用重写后的绑定类型：增加 1 项带条件陈述，另 5 项新增条件；候选核心。',
'minimal-obligations-trial':'缩减义务上下文并复用同型条件：3 项原可检查陈述变为受阻，拒绝。',
'minimal-binder-trial':'缩减上下文与绑定修补组合：2 项越过抽取阶段但仍被依赖阻塞；仍有上述 3 项退步，拒绝。',
'binder-statement-cache-trial':'同型条件复用 + 绑定修补：没有超过单独绑定修补，未保留额外缓存。',
'candidate-final':'最终隔离候选：绑定上下文修补 + 源端详细错误 + 可选 Lean 线程数。'}
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
('SProp / irrelevant 绑定',40,40,'需定义 SProp 的表示及消去限制，不能删除拒绝检查。','未采用新的表示策略。'),
('证明抽取与依赖计算',52,52,'构造子证明作为依赖索引时，抽取后分支类型与消去器要求的构造子索引不同。需保持索引一致；补充前提不能恢复源端转换。','测试缓存、化简、上下文缩减和绑定修补；保留逐项实际错误。'),
('quality / sort 多态导出',22,22,'MetaRocq 引用前端缺少 quality 多态上下文的完整表示及传递；还未进入 Lean。','固定工具链下仍受阻。'),
('模板归纳类型的 Prop 实例',20,18,'需统一处理 Prop 参数的类型、构造子、recursor、投影和调用点；可能涉及 Sort 泛化或 lift 表示。','2 项改为依赖受阻，仍未成功；未更改表示策略。'),
('宇宙求解及一致性',2,1,'bool_eq_rec 仍有 proof-local 宇宙约束冲突；不能放松源宇宙一致性检查。','eq_existT_curried_congr 成为带条件的可检查陈述。'),
('抽取后的证明递归',4,4,'需重建结构递归依据或产生可检查的良基终止性义务，不能假定终止性。','保持受阻，没有生成原库证明。'),
('依赖阻塞',50,52,'逐项报告递归追踪上游根因；先修上游，再重测。','增加包含失败阶段变化，不是新增 2 个失败根声明。')]
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
intro="""范围：此前基础模块的 24 个 Corelib 文件、839 项声明，不是所有已安装 Corelib 文件。
原项目未修改，未提交或推送。
基线：574 无额外条件，75 带条件，190 受阻。
隔离候选：569 无额外条件，81 带条件，189 受阻。
可检查项由 649 增至 650；新增的只是定理陈述 eq_existT_curried_congr，仍有 3 个显式前提，并未得到定理证明。
普通数据类型和函数没有新增成功项。另 5 项原本无额外条件的定理陈述新增条件，因此这是有代价的候选，未集成原项目。

目录：
index.html / improved/index.html：基线 / 候选逐文件入口。
rule-improvements.html / .txt：六组实验、最终候选、逐项变化、后续缺失能力。
Corelib/.../X.v：源文件副本。
Corelib/.../X.lean：实际翻译入口，用 #rocq2lean_import 生成内核声明。
Corelib/.../X.kernel.txt：实际 Lean #print 定义。
Corelib/.../X.report.html / .txt：每项成功/失败与翻译过程。
Corelib/.../X.json：模块完整机器可读结果。
Corelib/.../X/records/0000.json：单项完整源 IR、目标 AST、全部尝试与条件。
Corelib/.../X/：导出、roundtrip、consumer、audit、日志和 olean。
improved/Corelib/...：同结构候选结果。
translator/：基线 3c79203 加未提交候选；candidate.patch 是精确代码差异。
experiments/：各组试验、差异和测试证据。
source-extraction-errors.json：52 项抽取失败的实际检查阶段与类型错误。
artifact-validation.json：产物和检查结果。

使用：
每个 .lean 带自己的依赖闭包，应作为独立单元使用，不可直接把 24 个文件同时 import。
.lean 是翻译器的可执行入口，不是脱离翻译器的手写源码；可读定义在 kernel.txt 和逐项报告。
Equality.lean 明确报导出失败。Ltac、Notations、Tauto 没有计入内核声明，不代表策略/记号已经翻译。
定理只输出 .statement : Prop；pending 是显式假设，不能当作已有证明或无条件结论。
过程来自真实 IR、tier 尝试与内核输出；AST 节点映射为静态说明，不冒充逐指令执行轨迹。

验证：
Lean 4.33.1 / Rocq 9.3.0。20 个有可导出声明的模块在基线与候选下分别通过源端 roundtrip、Lean consumer、未修改的独立 audit、内核输出及入口编译。
statement 套件通过：包括证明变化不影响输出、确定性、陈述篡改负例及拒绝 sorry/axiom 的提交负例。
本轮未重跑完整 4,474 个 Prosa 保护根；保护清单未改。候选代码保持隔离。
复现脚本位于 scripts/，读取现有冻结 census 输入及已安装工具链；所有本轮输出在本目录。
"""
(B/'README.txt').write_text(intro)
body='<h1>核心规则修补：实际结果与代价</h1><p><a href="index.html">基线</a> · <a href="improved/index.html">候选</a> · <a href="candidate.patch">补丁</a> · <a href="README.txt">使用说明</a></p><pre>'+esc(intro.split('目录：')[0])+'</pre>'
body+='<h2>六组试验与最终候选</h2><table><tr><th>试验</th><th>无条件</th><th>带条件</th><th>受阻</th><th>检查</th><th>解释</th></tr>'
for t in trials:body+='<tr>'+''.join('<td>'+esc(t[k])+'</td>' for k in ['experiment','complete','pending','blocked','validation','note'])+'</tr>'
body+='</table><p>除 normalization-trial 的源端 roundtrip 失败外，其余试验均通过三项检查。化简试验的计数仅作诊断。中途线程资源错误与重试日志均保留。</p><h2>全部根声明状态变化</h2><p>8 项：1 项新增可检查、5 项新增条件、2 项改变受阻阶段。</p><pre>'+esc(json.dumps(deltas,ensure_ascii=False,indent=2))+'</pre>'
body+='<h2>逐类规则：做了什么、还缺什么</h2><table><tr><th>规则类</th><th>基线受阻</th><th>候选受阻</th><th>缺少能力</th><th>本轮行动</th></tr>'
for row in rules:body+='<tr>'+''.join('<td>'+esc(x)+'</td>' for x in row)+'</tr>'
body+='</table><h2>源端失败实例</h2><pre>'+esc(source_errors['Corelib.Init.Datatypes.eq_true_rew_dep'])+'</pre><p><a href="source-extraction-errors.json">全部 52 项实际源端错误</a></p><h2>验证范围</h2><pre>'+esc(json.dumps(read(B/'artifact-validation.json'),ensure_ascii=False,indent=2))+'</pre>'
style='body{font:15px/1.7 system-ui;max-width:1300px;margin:32px auto;padding:0 24px;color:#23303b}table{border-collapse:collapse;width:100%}td,th{padding:9px;border:1px solid #dbe2e8;text-align:left;vertical-align:top}pre{white-space:pre-wrap;overflow-wrap:anywhere;background:#f1f5f9;padding:16px}td{overflow-wrap:anywhere}h1{font-size:26px}h2{font-size:20px}a{color:#175fa6}'
(B/'rule-improvements.html').write_text('<!doctype html><html lang="zh"><meta charset="utf-8"><title>规则修补对比</title><style>'+style+'</style><body>'+body+'</body></html>')
(B/'rule-improvements.txt').write_text(intro+'\n实验\n'+json.dumps(trials,ensure_ascii=False,indent=2)+'\n逐项变化\n'+json.dumps(deltas,ensure_ascii=False,indent=2)+'\n规则评估\n'+json.dumps(read(B/'rule-assessment.json'),ensure_ascii=False,indent=2))
for base,nav in [(B,'<p><a href="rule-improvements.html">修补对比：649 → 650，但 5 项新增条件</a> · <a href="improved/index.html">候选结果</a> · <a href="README.txt">使用说明</a></p>'),(B/'improved','<p><a href="../rule-improvements.html">规则修补对比</a> · <a href="../index.html">基线</a></p>')]:
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


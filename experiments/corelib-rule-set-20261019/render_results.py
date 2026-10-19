#!/usr/bin/env python3
"""Publish human-readable sufficient-set evidence from completed validation only."""
from pathlib import Path
import collections,json
from evaluate import W,B,sha,save
R=W.parents[1]
v=json.loads((W/'VALIDATION.json').read_text());assert v['status']=='PASS'
s=json.loads((W/'verified-selection.json').read_text());assert s['status']=='TRANSLATION_VALIDATED'
f=json.loads((W/s['final_report']).read_text());assert f['passed']
mechs={m['id']:m for m in json.loads((W/'mechanisms.json').read_text())}
assert set(s['enabled'])==set(s['witnesses'])
for name,w in s['witnesses'].items():
 trial=json.loads((W/w['report']).read_text())
 assert not trial['passed']
 assert set(trial['disabled'])==set(s['disabled'])|{name},('stale deletion witness',name)
manifest=json.loads((W/'baseline-implementation.json').read_text())
for rel,digest in manifest.items():
 assert sha(B/'translator'/rel)==digest,('baseline implementation drift',rel)
 if rel!='Rocq2Lean/Emit.lean':assert sha(W/'.work/translator'/rel)==digest,('unexpected translator change',rel)
assert sha(W/'.work/translator/Rocq2Lean/RuleSet.lean')==sha(W/'RuleSet.lean')
import difflib
patch=''.join(difflib.unified_diff((B/'translator/Rocq2Lean/Emit.lean').read_text().splitlines(True),(W/'.work/translator/Rocq2Lean/Emit.lean').read_text().splitlines(True),fromfile='a/Rocq2Lean/Emit.lean',tofile='b/Rocq2Lean/Emit.lean'))
assert patch==(W/'translator.patch').read_text()
v['witnesses_match_final_configuration']=True
v['unchanged_core_implementation_verified']=True
save(W/'VALIDATION.json',v)

roots={};changes={}
for rec in f['records']:
 if not rec['roots']:continue
 p=W/'.work/runs/selected'/Path(*rec['module'].split('.'))/'translation_report.json'
 report=json.loads(p.read_text())
 for row in report['roots']:roots[row['requested']]=row['status']
 for change in rec.get('target_changes',[]):changes[change['source']]=change['fields']
counts=dict(collections.Counter(roots.values()));assert len(roots)==2180
save(W/'result-summary.json',{'modules':67,'roots':2180,'root_counts':counts,'blocked':0,
 'enabled_mechanisms':s['enabled'],'disabled_mechanisms':s['disabled'],'changed_target_declarations':changes,
 'changed_original_roots':len(set(changes)&set(roots)),'changed_auxiliary_or_dependency_declarations':len(set(changes)-set(roots)),
 'fixed_core_minimized':False,'configuration':sha(W/'corelib.json')})
text="""# Corelib 的可执行翻译规则集合

本实验已将规则配置接入独立翻译器，并用同一 67 个模块、2180 个根声明验证。
**0 受阻；51 个含声明模块的源 roundtrip、独立 Lean consumer 和结构 audit 全部通过。**
其余 16 个模块没有 kernel 声明。没有恢复 nat/eq 原生映射。

以前的 34 项是“产物中有使用证据”的分组清单，不是充分性或最小性证明。
现在交付的是实际配置：**固定翻译核心 + 下表启用的机制**，
由 §corelib.json§ 和 §RuleSet.lean§ 在运行时控制；§translate.py§ 默认使用此配置。

"""
text+=f"本轮测试 {len(mechs)} 个可选入口，保留 **{len(s['enabled'])}** 个、关闭 **{len(s['disabled'])}** 个。\n"
text+="保留的每个入口都在最终集合上单独关闭重测，均有失败见证。\n"
text+="这说明在本次固定核心、入口粒度、源范围、预算和检查条件下不能再逐项删除；\n"
text+="**固定核心尚未逐项精简，不能宣称整个翻译器已是全局最小规则集。**\n\n"
text+="## 完整集合怎么理解\n\n"
text+="1. [固定核心](FIXED_CORE.md)：源端准备、声明／AST／归纳类型／匹配／递归、基础 universe、quality、4 类原语语义模型（61 个操作），以及始终启用的检查。\n"
text+="2. 下表列出的可选入口：必须同时保留的最终配置。\n"
text+="3. [冻结实现清单](baseline-implementation.json)与 [补丁](translator.patch)绑定具体实现；不是仅用几段自然语言替代代码。\n\n"
text+="## 最终启用的可选入口\n\n| 配置 ID | 机制 | 关闭后首个失败见证 | 拒绝阶段 |\n|---|---|---|---|\n"
witness_details=[]
for name in s['enabled']:
 m=mechs[name];w=s['witnesses'][name];err=w['failure']
 first=err.get('first_failure') or err.get('failed_roots') or []
 source=first[0]['source'] if first else (err.get('changes') or [{}])[0].get('source',w['module'])
 if err['stage']=='audit':
  det=(err.get('details') or [{}])[0]
  source=det.get('message',w['module']).split(': ')[0]
 message=(first[0].get('message','') if first else err.get('message',''))
 if err.get('details'):message=str(err['details'])
 witness_details.append({'mechanism':name,**w,'first_source':source})
 text+=f"| §{name}§ | {m['legacy']}：{m['description']} | §{source}§ | {err['stage']} |\n"
save(W/'necessity-witnesses.json',witness_details)
text+="\n完整失败路径、错误、依赖和试验配置见 [必要性见证](necessity-witnesses.json)。\n"
text+="这些是实际失败，不是按最终报告字段猜测的必要性。因错误或预算失败而拒绝的运行不计成功。\n\n"
text+="## 在此范围关闭的入口\n\n| 配置 ID | 关闭范围 |\n|---|---|\n"
for name in s['disabled']:text+=f"| §{name}§ | {mechs[name]['description']} |\n"
text+="\n关闭这些入口不删除基本结构翻译、隐含参数自动参数化、基础求解器或独立检查。具体边界见 FIXED_CORE.md。\n"
text+="程序没有按源声明名字查表返回旧 Lean 译文，也没有跳过失败声明。\n\n"
text+="## 最终产物\n\n| 类别 | 根数 |\n|---|---:|\n"
for st,n in counts.items():text+=f"| {st} | {n} |\n"
text+="\n陈述合法不等于其定理已证明；带前提的机械结果仍明确带前提。此实验不做 correspondence 或自动证明装配。\n"
text+=f"\n与旧机械基线相比，{len(changes)} 个去重声明的目标类型／正文／构造器描述发生变化，其中 {len(set(changes)&set(roots))} 个是原始根、{len(set(changes)-set(roots))} 个是辅助或依赖声明：\n\n"
for n,fields in list(changes.items())[:8]:text+=f"- §{n}§：{', '.join(fields)}。\n"
if not changes:text+="- 没有目标变化。\n"
else:text+="\n完整去重名单与变化字段见 [result-summary.json](result-summary.json)。\n"
compatpath=W/'reports/compatible.json'
if compatpath.exists():
 compat=json.loads(compatpath.read_text())
 assert compat.get('passed') and compat['root_count']==2180 and compat['target_changed_declarations']==0
 cfg={'schema':'rocq2lean-corelib-mechanisms/1',
  'enabled':[n for n in mechs if n not in compat['disabled']],'disabled':compat['disabled'],
  'scope':'scope.json','fixed_core':'FIXED_CORE.md','native_nat_eq_bootstrap':False,
  'result_policy':'identical reported target types, values, constructors, levels, statuses and prerequisites'}
 save(W/'corelib-compatible.json',cfg)
 text+="\n另有 [兼容配置](corelib-compatible.json)：保留 carrier-copies 和 occurrence-levels，关闭其余 6 个入口；同样通过全量检查，报告中的目标类型、正文、构造器和 level 参数与旧基线均一致。它是译文兼容性结果，不代替完整 correspondence 重编译。\n"
 v['compatible_configuration']={'enabled':len(cfg['enabled']),'disabled':len(cfg['disabled']),'target_changes':0,'report':'reports/compatible.json'}
 save(W/'VALIDATION.json',v)
text+="\n机械 Nat/Eq 的独立身份、构造器、recursor、依赖 transport 及 Nat 加乘归约已经重测。\n"
text+="伪造恢复 nat/eq bootstrap 的报告仍被独立 consumer 和 audit 拒绝；不存在关闭 kernel 的配置开关。\n"
text+="旧 correspondence 工作区保持原基线，本次没有宣称所有旧 correspondence 证书已在新产物上重跑。\n\n"
text+="## 使用与复现\n\n"
text+="在远程本目录运行；源导出及 contract 与原流程一致：\n\n"
text+="§§§sh\npython3 prepare.py\n/home/shunqwang4/.elan/bin/lake -d .work/translator build Rocq2Lean Rocq2Lean:shared\npython3 translate.py --input /path/source.ndjson --out /path/output\n§§§\n\n"
text+="需完整独立验收时，把原导出的 contract.json 保留在 output 中，并运行原 consumer/audit；单独调用 translate 不代替独立验收。\n"
text+="§evaluate.py§ 可在固定 67 模块上测试任意禁用集合；§select_rules.py§ 记录初次逐项删减，§refine_selection.py§ 完成最终策略下的重查。\n"
text+="§source_recheck.py§ 重做源端复核，§validate_final.py§ 运行机械身份、负例及默认入口检查。\n\n"
text+="[验收](VALIDATION.json) · [范围](scope.json) · [最终逐模块结果](reports/selected.json) · [计划](PLAN.md)\n\n"
text+="初轮搜索历史、生成 IR、编译文件、完整试验日志及译文只留在远程 §.work/§；Git/Mac 保留配置、补丁、运行脚本、摘要和必要性证据。\n"
text=text.replace('§',chr(96));(W/'README.md').write_text(text)
short="""# 已验证的 Corelib 翻译规则集合

"""
short+=f"已在独立翻译器验证：**67 模块、2180 根，0 受阻**。源端、Lean consumer、结构 audit 全部通过。\n\n"
short+=f"配置由固定核心和 **{len(s['enabled'])} 个启用的可选转换入口**组成；本轮从 {len(mechs)} 个入口中关闭了 {len(s['disabled'])} 个。\n"
short+="这些数量不是 34 个使用证据条目的重新计数，也不是全局最小语义规则数。\n\n"
short+="[完整规则集合、保留／关闭清单及失败见证](../experiments/corelib-rule-set-20261019/README.md)\n\n"
short+="[实际配置](../experiments/corelib-rule-set-20261019/corelib.json) · [固定核心](../experiments/corelib-rule-set-20261019/FIXED_CORE.md) · [验证结果](../experiments/corelib-rule-set-20261019/VALIDATION.json)\n\n"
short+="nat、eq 仍机械生成独立归纳类型；普通定理仍按陈述模式处理，显式待证条件不会被视为已经证明。\n"
short+=f"相比旧基线有 {len(changes)} 个声明的目标表示变化（其中 {len(set(changes)&set(roots))} 个原始根）；未据此宣称已重跑全部旧 correspondence。\n"
(R/'results/CORELIB_RULE_SET.md').write_text(short)
p=R/'README.md';t=p.read_text();line='- [已验证的可执行规则集合](results/CORELIB_RULE_SET.md)：独立配置、全量回归、可选机制删减及必要性见证。\n'
if line not in t:t=t.replace('# Rocq Corelib → Lean\n','# Rocq Corelib → Lean\n\n'+line)
p.write_text(t)
print('RENDERED',counts,'enabled',len(s['enabled']),'disabled',len(s['disabled']),'changed',len(changes))

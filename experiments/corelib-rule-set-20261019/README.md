# Corelib 的可执行翻译规则集合

本实验已将规则配置接入独立翻译器，并用同一 67 个模块、2180 个根声明验证。
**0 受阻；51 个含声明模块的源 roundtrip、独立 Lean consumer 和结构 audit 全部通过。**
其余 16 个模块没有 kernel 声明。没有恢复 nat/eq 原生映射。

以前的 34 项是“产物中有使用证据”的分组清单，不是充分性或最小性证明。
现在交付的是实际配置：**固定翻译核心 + 下表启用的机制**，
由 `corelib.json` 和 `RuleSet.lean` 在运行时控制；`translate.py` 默认使用此配置。

本轮测试 21 个可选入口，保留 **13** 个、关闭 **8** 个。
保留的每个入口都在最终集合上单独关闭重测，均有失败见证。
这说明在本次固定核心、入口粒度、源范围、预算和检查条件下不能再逐项删除；
**固定核心尚未逐项精简，不能宣称整个翻译器已是全局最小规则集。**

## 完整集合怎么理解

1. [固定核心](FIXED_CORE.md)：源端准备、声明／AST／归纳类型／匹配／递归、基础 universe、quality、4 类原语语义模型（61 个操作），以及始终启用的检查。
2. 下表列出的可选入口：必须同时保留的最终配置。
3. [冻结实现清单](baseline-implementation.json)与 [补丁](translator.patch)绑定具体实现；不是仅用几段自然语言替代代码。

## 最终启用的可选入口

| 配置 ID | 机制 | 关闭后首个失败见证 | 拒绝阶段 |
|---|---|---|---|
| `fact-reduce` | R2+：按源 universe 事实约简 level | `Corelib.Classes.RelationClasses.inverse_impl_rewrite_relation` | audit |
| `fact-interpretation` | R2F / R2F-c：用 max 表达源 universe 约束 | `Corelib.Classes.CMorphisms.PartialOrder_StrictOrder` | translation |
| `motive-sort` | R8：动机层级读取为 Sort | `Corelib.Init.Logic.eq_ex2_rect` | translation |
| `cumulativity` | R3-up / R2B-P：累积性兼容及受检 Prop 约束 | `Corelib.ssr.ssreflect_rw.nary_congruence_statement` | translation |
| `reference-lowering` | R3-down：引用 universe 的受检降低 | `Corelib.ssr.ssrbool.keyed_pred` | translation |
| `result-sort` | R2B-V：继承实际值的结果 sort | `Corelib.Init.Datatypes.CompSpecT` | translation |
| `prop-lift` | P：Prop 到 Type 的 PULift | `Corelib.Classes.CRelationClasses.complement` | translation |
| `type-lift` | Type PULift：Type 到 Type 的受检提升 | `Corelib.Classes.CRelationClasses.relation_equivalence` | translation |
| `alias-delta` | delta-beta aliases：展开透明擦除型多态别名 | `Corelib.Classes.CRelationClasses.relation_equivalence` | translation |
| `source-compute` | C06：源端构造器驱动的类型计算 | `Corelib.Classes.Morphisms.flip_arrow` | translation |
| `template-sort` | template Sort：template 归纳类型采用通用 Sort 接口 | `Corelib.Init.Logic.eq_ex__rocq2lean_obligation_1` | translation |
| `poly-model` | R6-I：多态约束的局部 universe 模型 | `Corelib.Classes.CRelationClasses.relation_equivalence` | translation |
| `wf-obligations` | B / B-P：良基递归的显式证明条件 | `Corelib.Init.Nat.gcd` | translation |

完整失败路径、错误、依赖和试验配置见 [必要性见证](necessity-witnesses.json)。
这些是实际失败，不是按最终报告字段猜测的必要性。因错误或预算失败而拒绝的运行不计成功。

## 在此范围关闭的入口

| 配置 ID | 关闭范围 |
|---|---|
| `carrier-copies` | 保留独立 carrier 的 level 副本 |
| `implicit-discovery` | 发现额外隐式 universe 参数 |
| `instance-hypotheses` | 每个引用实例的待证参数 |
| `joint-levels` | 联合 universe 元变量 |
| `occurrence-levels` | 按出现位置实例化共享 level |
| `operand-split` | 操作数 universe 分裂视图 |
| `phantom-sort` | 擦除 phantom sort 参数 |
| `set-delta` | 展开 Set 动机常量的重试 |

关闭这些入口不删除基本结构翻译、隐含参数自动参数化、基础求解器或独立检查。具体边界见 FIXED_CORE.md。
程序没有按源声明名字查表返回旧 Lean 译文，也没有跳过失败声明。

## 最终产物

| 类别 | 根数 |
|---|---:|
| STATEMENT_KERNEL_CHECKED | 846 |
| TRANSLATED_AND_CHECKED | 1003 |
| PENDING_KERNEL_CHECKED | 148 |
| STATEMENT_PENDING_KERNEL_CHECKED | 183 |

陈述合法不等于其定理已证明；带前提的机械结果仍明确带前提。此实验不做 correspondence 或自动证明装配。

与旧机械基线相比，174 个去重声明的目标类型／正文／构造器描述发生变化，其中 71 个是原始根、103 个是辅助或依赖声明：

- `Corelib.ssr.ssrbool.applicative_mem_pred`：target_ctors。
- `Corelib.ssr.ssrbool.applicative_mem_pred_value`：target_type, target_value。
- `Corelib.ssr.ssrbool.canLR_in__rocq2lean_obligation_1`：target_value, level_params。
- `Corelib.ssr.ssrbool.canLR_in`：target_type, target_value, level_params。
- `Corelib.ssr.ssrbool.canLR_on__rocq2lean_obligation_1`：target_value, level_params。
- `Corelib.ssr.ssrbool.canLR_on__rocq2lean_obligation_2`：target_value, level_params。
- `Corelib.ssr.ssrbool.canLR_on`：target_type, target_value, level_params。
- `Corelib.ssr.ssrbool.canRL_in__rocq2lean_obligation_1`：target_value, level_params。

完整去重名单与变化字段见 [result-summary.json](result-summary.json)。

另有 [兼容配置](corelib-compatible.json)：保留 carrier-copies 和 occurrence-levels，关闭其余 6 个入口；同样通过全量检查，报告中的目标类型、正文、构造器和 level 参数与旧基线均一致。它是译文兼容性结果，不代替完整 correspondence 重编译。

机械 Nat/Eq 的独立身份、构造器、recursor、依赖 transport 及 Nat 加乘归约已经重测。
伪造恢复 nat/eq bootstrap 的报告仍被独立 consumer 和 audit 拒绝；不存在关闭 kernel 的配置开关。
旧 correspondence 工作区保持原基线，本次没有宣称所有旧 correspondence 证书已在新产物上重跑。

## 使用与复现

在远程本目录运行；源导出及 contract 与原流程一致：

```sh
python3 prepare.py
/home/shunqwang4/.elan/bin/lake -d .work/translator build Rocq2Lean Rocq2Lean:shared
python3 translate.py --input /path/source.ndjson --out /path/output
```

需完整独立验收时，把原导出的 contract.json 保留在 output 中，并运行原 consumer/audit；单独调用 translate 不代替独立验收。
`evaluate.py` 可在固定 67 模块上测试任意禁用集合；`select_rules.py` 记录初次逐项删减，`refine_selection.py` 完成最终策略下的重查。
`source_recheck.py` 重做源端复核，`validate_final.py` 运行机械身份、负例及默认入口检查。

[验收](VALIDATION.json) · [范围](scope.json) · [最终逐模块结果](reports/selected.json) · [计划](PLAN.md)

初轮搜索历史、生成 IR、编译文件、完整试验日志及译文只留在远程 `.work/`；Git/Mac 保留配置、补丁、运行脚本、摘要和必要性证据。

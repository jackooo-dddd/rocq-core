# 翻译后的 Lean 原生对应

当前有两套分别统计的结果。机械 nat/eq 均为独立归纳结构；先机械翻译，再证明与 Lean 原生对象的关系。

| 产物 | 类型对应 | 运算对应 | 原生陈述 iff | 有证书的根 | 尚未对应 |
|---|---:|---:|---:|---:|---:|
| 原冻结机械版本 | 164 | 908 | 1028 | 2100 / 2180 | 80 |
| 计算透明变体 | 164 | 988 | 1028 | 2180 / 2180 | 0 |

[完整变体结果](../../experiments/incremental-correspondence-20261019/transparent-data/README.md) · [2180 根逐项证书](../../experiments/incremental-correspondence-20261019/transparent-data/reports/FULL_VARIANT_LEDGER.json) · [验证摘要](../../experiments/incremental-correspondence-20261019/transparent-data/reports/FULL_VARIANT_SUMMARY.json) · [原冻结版本账本](../../experiments/incremental-correspondence-20261019/reports/CORELIB_LEDGER.csv)。

## 变体改变了什么

原剩余 80 根中，69 个是非 Prop opaque 数据声明，11 个是依赖它们的透明包装。正文仍保留在已检查的 Lean 环境中。变体将源声明复制到独立命名空间，仅把非 Prop opaque 数据声明改成 def；类型、universe 参数与正文只做一致改名，重新交给 kernel 检查。

由此完成 CRelationClasses 11、CMorphisms 54、ssrbool 6、ssrfun 4、ssreflect_rw 3、Program.Wf 2 项的运算对应。原有 2100 根的证明也按此策略重新检查：173 组既有 profile 与 6 组新证明、消费示例共同导入通过，标准公理以外的依赖被拒绝。

这不是旧 opaque 常量与新 def 的值等式。正式 translator/ 的机械产物未被这些实验改写；原冻结版本的 80 项缺口仍保留。

## 如何理解“对应”

- 类型对应提供明示参数范围内的双向转换及往返恒等。
- 运算对应证明转换机械结果等于指定原生结果；目标可能是现成 Lean/Mathlib API，也可能是由原生类型、函数构成的组合表达式。
- 原生陈述 iff 证明命题等价，不等于源业务定理已被证明。另有 318 份独立的原陈述 Prop 证明，单独统计。
- 2180 是去重根数。沿用每份证书的参数、universe、质量分支和前提范围，不据根数宣称覆盖所有可能的实例。
- 浮点等目标包含精确符号表示；尚未据此证明等于运行时 Float API。Type 值关系数据有时对应 Prod/Sum 等记录表示，不自动成为 Lean 的 Prop 值 typeclass 实例。

## Nat、Eq 与实际使用

natIso 连接机械 nat 与 Nat；eqIso 连接机械相等与 Lean Eq。依赖 Nat 消去与 Eq transport 均有对应。主 Nat/Eq 对应的公理闭包为空。

[主证明](../../experiments/mechanical-correspondence-20261019/NatEq.lean) · [Nat 运算](../../experiments/mechanical-correspondence-20261019/Nat.lean) · [依赖 Nat](../../experiments/mechanical-correspondence-20261019/DependentNat.lean) · [依赖 Eq](../../experiments/mechanical-correspondence-20261019/DependentEq.lean)。

新增[消费例](../../experiments/incremental-correspondence-20261019/transparent-data/Consumer.lean)证明机械良基消去产生的依赖 Fin 数据，并把机械条件选择得到的素数证据交给 Mathlib Prime.two_le。[跨模块组合](../../experiments/incremental-correspondence-20261019/transparent-data/Composition.lean)进一步连接机械 nat.iter、原生 Nat、SSR 选择和 Mathlib。

[自动组合器](../../experiments/incremental-correspondence-20261019/transparent-data/AutoCompose.lean)可以从给定表达式及已证明的 correspondence 生成原生定义和等式证明。它拒绝仍有源符号、条件未满足或依赖额外公理的结果；这是基于提供的证明做组合，不是自动搜索所有 Lean/Mathlib 对应目标。

历史批次及最初预估保留在[工作区计划](../../experiments/incremental-correspondence-20261019/PLAN.md)。

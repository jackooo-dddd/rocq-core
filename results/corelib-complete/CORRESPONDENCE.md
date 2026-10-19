# 翻译后的 Lean 原生对应

源 nat/eq 先生成独立归纳结构；之后以 Lean 内核检查的转换和证明连接原生对象。不能再把它们当作原生 Nat/Eq 的别名。

最新增量：[计划与结果](../../experiments/incremental-correspondence-20261019/README.md) · [依赖 DAG](../../experiments/incremental-correspondence-20261019/DAG.md) · [当前逐项覆盖](../../experiments/incremental-correspondence-20261019/reports/CORELIB_LEDGER.csv)。四批累计新增 8 个类型根、72 个运算/谓词根，149 个部分陈述升级为完全原生陈述；原生目标区分现成 API 与组合表达式。

## 当前证明

natIso 提供机械 nat ↔ Nat 的两个方向与两个往返恒等。eq_correspondence 证明 MechanicalEq A x y ↔ x = y（A : Sort u），eqIso 提供证明对象的双向转换；eq_transport_agrees 证明依赖消去一致。以上主对应的公理闭包为空。

当前 38 份类型对应证书覆盖 37 个根；192 份运算/谓词证书覆盖 186 个根；845 个陈述根中 292 个无源端符号、553 个仍有残留（其中新增的 141 项自动陈述还递归检查了桥接别名；另 8 项数字比较陈述有显式原生目标及原陈述证明）。另有 479 个源根自动接口往返证书；这些类别有重叠，不能相加当作声明数量。331 项待证明条件未消去。

旧 480 个自动接口保留 475 个并新增 3 个。nat_rec、nat_rect、eq_rew_dep、eq_rew_fwd_dep、eq_rew_fwd_r_dep 尚未恢复通用依赖函数自动包装；五者均另有手写运算对应证明。手写运算对应不冒充自动接口往返。

[完整说明](../../experiments/mechanical-correspondence-20261019/README.md) · [原始基线统计](../../experiments/mechanical-correspondence-20261019/reports/summary.json) · [旧证书迁移结果](../../experiments/mechanical-correspondence-20261019/reports/REGRESSION.json)

[主证明](../../experiments/mechanical-correspondence-20261019/NatEq.lean) · [Nat 运算](../../experiments/mechanical-correspondence-20261019/Nat.lean) · [依赖 Nat 消去](../../experiments/mechanical-correspondence-20261019/DependentNat.lean) · [依赖 Eq 消去](../../experiments/mechanical-correspondence-20261019/DependentEq.lean) · [统一互操作示例](../../experiments/mechanical-correspondence-20261019/UseNative.lean)

这不表示全部 Corelib／MathComp／Mathlib 都已互通。陈述 iff 不证明业务定理，部分接口只覆盖 Type 实例。Mathlib 集成本轮没有测试。

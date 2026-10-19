# 翻译后的 Lean 原生对应

源 nat/eq 先生成独立归纳结构；之后以 Lean 内核检查的转换和证明连接原生对象。不能再把它们当作原生 Nat/Eq 的别名。

## 当前证明

natIso 提供机械 nat ↔ Nat 的两个方向与两个往返恒等。eq_correspondence 证明 MechanicalEq A x y ↔ x = y（A : Sort u），eqIso 提供证明对象的双向转换；eq_transport_agrees 证明依赖消去一致。以上主对应的公理闭包为空。

当前 30 份类型对应证书覆盖 29 个根；119 份运算证书覆盖 114 个根；845 份陈述 iff 中 143 份无直接源端符号、702 份仍有残留。另有 478 个自动接口往返证书；这些类别有重叠，不能相加当作声明数量。331 项待证明条件未消去。

旧 480 个自动接口保留 475 个并新增 3 个。nat_rec、nat_rect、eq_rew_dep、eq_rew_fwd_dep、eq_rew_fwd_r_dep 尚未恢复通用依赖函数自动包装；五者均另有手写运算对应证明。手写运算对应不冒充自动接口往返。

[完整说明](../../experiments/mechanical-correspondence-20261019/README.md) · [证书及覆盖统计](../../experiments/mechanical-correspondence-20261019/reports/summary.json) · [旧证书迁移结果](../../experiments/mechanical-correspondence-20261019/reports/REGRESSION.json)

[主证明](../../experiments/mechanical-correspondence-20261019/NatEq.lean) · [Nat 运算](../../experiments/mechanical-correspondence-20261019/Nat.lean) · [依赖 Nat 消去](../../experiments/mechanical-correspondence-20261019/DependentNat.lean) · [依赖 Eq 消去](../../experiments/mechanical-correspondence-20261019/DependentEq.lean) · [统一互操作示例](../../experiments/mechanical-correspondence-20261019/UseNative.lean)

这不表示全部 Corelib／MathComp／Mathlib 都已互通。陈述 iff 不证明业务定理，部分接口只覆盖 Type 实例。Mathlib 集成本轮没有测试。

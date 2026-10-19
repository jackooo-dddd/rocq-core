# 翻译后的 Lean 原生对应

源 nat/eq 先生成独立归纳结构；之后以 Lean 内核检查的转换和证明连接原生对象。不能再把它们当作原生 Nat/Eq 的别名。

最新增量：[计划与结果](../../experiments/incremental-correspondence-20261019/README.md) · [依赖 DAG](../../experiments/incremental-correspondence-20261019/DAG.md) · [当前逐项覆盖](../../experiments/incremental-correspondence-20261019/reports/CORELIB_LEDGER.csv)。十一批累计新增 33 个类型根、169 个运算/谓词根，326 个完整原生陈述（318 个原部分陈述、8 个闭合实例化后的条件陈述）；原生目标区分现成 API 与组合表达式。

## 当前证明

natIso 提供机械 nat ↔ Nat 的两个方向与两个往返恒等。eq_correspondence 证明 MechanicalEq A x y ↔ x = y（A : Sort u），eqIso 提供证明对象的双向转换；eq_transport_agrees 证明依赖消去一致。以上主对应的公理闭包为空。

当前 71 份类型对应证书覆盖 63 个根（含 7 份新增完整 Sort 证书）；316 份运算/谓词证书覆盖 303 个根；853 个陈述根中 518 个无源端符号、335 个仍有残留（其中新增的 141 项自动陈述还递归检查了桥接别名；另 8 项数字比较陈述有显式原生目标及原陈述证明）。另有 479 个源根自动接口往返证书；这些类别有重叠，不能相加当作声明数量。机械产物中的 331 个带条件根保持原样；correspondence 层已用 14 份闭合见证实际实例化其中 16 个根（8 定义、8 陈述），本层尚待处理 315 个；其中 13 份见证公理闭包为空，gcd 见证使用标准 propext / Quot.sound。详见 [条件实例化](../../experiments/incremental-correspondence-20261019/DEPENDENT_RESULTS.md)。

旧 480 个自动接口保留 475 个并新增 3 个。nat_rec、nat_rect、eq_rew_dep、eq_rew_fwd_dep、eq_rew_fwd_r_dep 尚未恢复通用依赖函数自动包装；五者均另有手写运算对应证明。手写运算对应不冒充自动接口往返。

[完整说明](../../experiments/mechanical-correspondence-20261019/README.md) · [原始基线统计](../../experiments/mechanical-correspondence-20261019/reports/summary.json) · [旧证书迁移结果](../../experiments/mechanical-correspondence-20261019/reports/REGRESSION.json)

[主证明](../../experiments/mechanical-correspondence-20261019/NatEq.lean) · [Nat 运算](../../experiments/mechanical-correspondence-20261019/Nat.lean) · [依赖 Nat 消去](../../experiments/mechanical-correspondence-20261019/DependentNat.lean) · [依赖 Eq 消去](../../experiments/mechanical-correspondence-20261019/DependentEq.lean) · [统一互操作示例](../../experiments/mechanical-correspondence-20261019/UseNative.lean)

这不表示全部 Corelib／MathComp／Mathlib 都已互通。陈述 iff 不证明业务定理，部分接口只覆盖 Type 实例。本轮已验证 Nat + SSR Option + Setoid 的跨模块消费，并实际调用 Mathlib Nat.prime_two；验证不覆盖整个 Mathlib。

最新批次：[二元递归、依赖陈述与基本消去器](../../experiments/incremental-correspondence-20261019/RECURSION_STATEMENTS_RESULTS.md)。本轮新增 5 个依赖 Subtype 陈述也有原陈述证明；陈述根总数包含它们闭合实例化后新增的 5 项。按根计数不表示该根所有 universe 实例均已覆盖，具体范围见证书。

第七批：[Eq transport 与布尔等式](../../experiments/incremental-correspondence-20261019/EQUALITY_RESULTS.md)。新增四个完整原生陈述也均有原陈述证明；累计 17 个新增原陈述证明。

最新第八、九批：[关系、Classes 与可变参数谓词](../../experiments/incremental-correspondence-20261019/RELATIONS_RESULTS.md)。两个模块共 126 根有证书；已实际连接 Setoid/Quotient。累计 38 份新增原陈述证明，56 份自动 Classes iff 与业务定理证明分别记录。

最新第十批：[Morphisms](../../experiments/incremental-correspondence-20261019/MORPHISMS_RESULTS.md)，该模块 87 根均有明示范围内证书。累计 774 个完成类别根；本批 55 份 iff 不额外计作原陈述证明。

第十一批：[Equivalence / Morphisms_Prop / Setoid](../../experiments/incremental-correspondence-20261019/EQUIVALENCE_SETOID_RESULTS.md)。当时累计 814 个完成根、43 份新增原陈述证明。

最新第十二批：Specif 的 49 个部分陈述全部原生化，累计 863 个完成根，新增原陈述证明仍为 43 份。P7 已验证 36 个 profile / 613 份增量覆盖证书共同导入；当前全部增量覆盖证书已共同导入验证。见 [Specif 结果](../../experiments/incremental-correspondence-20261019/SPECIF_STATEMENTS_RESULTS.md) 和 [跨模块消费](../../experiments/incremental-correspondence-20261019/INTEROP_RESULTS.md)。

最新数字写出批次新增 12 个完成根，累计 875；对应原生表达式及打印数值证明见 [数字写出结果](../../experiments/incremental-correspondence-20261019/NUMERIC_WRITE_RESULTS.md)。

最新完成类别为 884 / 2180；Init.Nat 58 根的结果与标准公理边界见 [Nat 完成范围](../../experiments/incremental-correspondence-20261019/NAT_COMPLETION_RESULTS.md)。

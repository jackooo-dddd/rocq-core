Corelib.Classes.Morphisms

原文件：/home/shunqwang4/.opam/rocq930-mc/lib/coq/theories/Classes/Morphisms.v
冻结运行：/home/shunqwang4/research/rocq-core/experiments/mechanical-nat-eq-20261019/runs/full-v1/Corelib/Classes/Morphisms
原始根声明：87；当前受阻：0；检查：{'roundtrip_exit': 0, 'roundtrip': 'OK', 'translate_exit': 0, 'consumer_exit': 0, 'audit_exit': 0, 'consumer': 'OK', 'audit': 'OK'}。

[Rocq 源文件](Morphisms.v) · [Lean 入口](Morphisms.lean) · [Lean 打印结果](Morphisms.txt) · [逐项完整记录](Morphisms.json)

---

Corelib.Classes.Morphisms.Normalizes

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.Normalizes；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.132"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.PER_morphism

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.PER_morphism.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.Morphisms.Proper", "Corelib.Classes.Morphisms.respectful", "Corelib.Init.Logic.iff", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 1): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it,un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu] eo1", 1, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.PER_morphism_obligation_1

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.PER_morphism_obligation_1.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.Morphisms.respectful", "Corelib.Init.Logic.iff", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 1): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[un] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it,un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu,lo] eo1", 1, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.Params

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.Params；目标声明种类：inductive。
- 源端种类：inductive / inductive。
- 分派规则：inductive/generated-template；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["i[pl]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.PartialApplication

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.PartialApplication；目标声明种类：inductive。
- 源端种类：inductive / inductive。
- 分派规则：inductive/generated；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["i[pl]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.PartialOrder_StrictOrder

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.PartialOrder_StrictOrder.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.189"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.PartialOrder_proper

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.PartialOrder_proper.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"source_computed": ["Corelib.Classes.RelationClasses.arrows", "Corelib.Classes.RelationClasses.pointwise_extension", "Corelib.Classes.RelationClasses.pointwise_lifting"], "delta_inlined": ["Corelib.Classes.Morphisms.Proper", "Corelib.Classes.Morphisms.respectful", "Corelib.Classes.RelationClasses.PartialOrder", "Corelib.Classes.RelationClasses.predicate_equivalence", "Corelib.Classes.RelationClasses.predicate_intersection", "Corelib.Classes.RelationClasses.relation_conjunction", "Corelib.Classes.RelationClasses.relation_equivalence", "Corelib.Init.Logic.iff", "Corelib.Program.Basics.flip", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.183 solved as (some 1): native fact Set lt Corelib.Classes.Morphisms.183 does not hold for the solution"], ["c[] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.183 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.183 does not hold for the solution"], ["c[it] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.183 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.183 does not hold for the solution"], ["c[un] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.183 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.183 does not hold for the solution"], ["c[it,un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.183 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.183 does not hold for the solution"], ["c[cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.183], R2B-S levels #[])"], ["c[it,cu] eo1", 1, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.183], R2B-S levels #[])"], ["c[cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.183], R2B-S levels #[])"], ["c[it,cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.183], R2B-S levels #[])"], ["c[de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[] eo1", 2, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.183 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.183 does not hold for the solution"], ["c[it] eo1", 2, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.183 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.183 does not hold for the solution"], ["c[un] eo1", 2, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.183 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.183 does not hold for the solution"], ["c[it,un] eo1", 3, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.183 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.183 does not hold for the solution"], ["c[cu,lo] eo1", 2, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.183], R2B-S levels #[])"], ["c[cu,lo,un] eo1", 2, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.183], R2B-S levels #[])"], ["c[pl] eo1", 1, "TRANSLATION_FAILED | type expected\n  Rocq.Corelib.Classes.RelationClasses.pointwise_lifting Rocq.Corelib.Init.Logic.iff\n    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons A\n      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons A Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))\n    eqA\n    (Rocq.Corelib.Classes.RelationClasses.pointwise_extension Prop Rocq.Corelib.Init.Logic.and\n      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons A\n        (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons A Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))\n      R fun x y => R y x)"], ["c[it,pl] eo1", 2, "TRANSLATION_FAILED | type expected\n  Rocq.Corelib.Classes.RelationClasses.pointwise_lifting Rocq.Corelib.Init.Logic.iff\n    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons A\n      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons A Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))\n    eqA\n    (Rocq.Corelib.Classes.RelationClasses.pointwise_extension Prop Rocq.Corelib.Init.Logic.and\n      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons A\n        (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons A Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))\n      R fun x y => R y x)"], ["c[cu,lo,pl] eo1", 1, "TRANSLATION_FAILED | type expected\n  Rocq.Corelib.Classes.RelationClasses.pointwise_lifting Rocq.Corelib.Init.Logic.iff\n    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons A\n      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons A Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))\n    eqA\n    (Rocq.Corelib.Classes.RelationClasses.pointwise_extension Prop Rocq.Corelib.Init.Logic.and\n      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons A\n        (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons A Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))\n      R fun x y => R y x)"], ["c[ul] eo1", 2, "UNIVERSE_REJECTED | statement specialization refused: Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil: the level of u_Corelib_Classes_RelationClasses_72 is free in the source (no applied argument determines it, the source graph does not force it) but its argument is u_Corelib_Classes_Morphisms_183, not u_Corelib_Classes_RelationClasses_72"], ["c[it,ul] eo1", 2, "UNIVERSE_REJECTED | statement specialization refused: Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil: the level of u_Corelib_Classes_RelationClasses_72 is free in the source (no applied argument determines it, the source graph does not force it) but its argument is u_Corelib_Classes_Morphisms_183, not u_Corelib_Classes_RelationClasses_72"], ["c[] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.Proper

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.Proper；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.21"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.ProperProxy

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.ProperProxy；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.21"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.ReflexiveProxy

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.ReflexiveProxy；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.21"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.Reflexive_partial_app_morphism

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.Reflexive_partial_app_morphism.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.77"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.StrictOrder_PartialOrder

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.StrictOrder_PartialOrder.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"source_computed": ["Corelib.Classes.RelationClasses.arrows", "Corelib.Classes.RelationClasses.pointwise_extension", "Corelib.Classes.RelationClasses.pointwise_lifting"], "delta_inlined": ["Corelib.Classes.Morphisms.Proper", "Corelib.Classes.Morphisms.respectful", "Corelib.Classes.RelationClasses.PartialOrder", "Corelib.Classes.RelationClasses.predicate_equivalence", "Corelib.Classes.RelationClasses.predicate_intersection", "Corelib.Classes.RelationClasses.predicate_union", "Corelib.Classes.RelationClasses.relation_conjunction", "Corelib.Classes.RelationClasses.relation_disjunction", "Corelib.Classes.RelationClasses.relation_equivalence", "Corelib.Init.Logic.iff", "Corelib.Program.Basics.flip", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.196 solved as (some 1): native fact Set lt Corelib.Classes.Morphisms.196 does not hold for the solution"], ["c[] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.196 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.196 does not hold for the solution"], ["c[it] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.196 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.196 does not hold for the solution"], ["c[un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.196 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.196 does not hold for the solution"], ["c[it,un] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.196 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.196 does not hold for the solution"], ["c[cu] eo1", 1, "UNIVERSE_REJECTED | R2B-P levels #[Corelib.Classes.Morphisms.196] on a pending artifact: the source instance is not checkable"], ["c[it,cu] eo1", 1, "UNIVERSE_REJECTED | R2B-P levels #[Corelib.Classes.Morphisms.196] on a pending artifact: the source instance is not checkable"], ["c[cu,lo] eo1", 0, "UNIVERSE_REJECTED | R2B-P levels #[Corelib.Classes.Morphisms.196] on a pending artifact: the source instance is not checkable"], ["c[it,cu,lo] eo1", 1, "UNIVERSE_REJECTED | R2B-P levels #[Corelib.Classes.Morphisms.196] on a pending artifact: the source instance is not checkable"], ["c[de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[] eo1", 4, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.196 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.196 does not hold for the solution"], ["c[it] eo1", 4, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.196 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.196 does not hold for the solution"], ["c[un] eo1", 5, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.196 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.196 does not hold for the solution"], ["c[it,un] eo1", 4, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.196 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.196 does not hold for the solution"], ["c[cu,lo] eo1", 4, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.196], R2B-S levels #[])"], ["c[cu,lo,un] eo1", 4, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.196], R2B-S levels #[])"], ["c[pl] eo1", 3, "TRANSLATION_FAILED | type expected\n  Rocq.Corelib.Classes.RelationClasses.pointwise_lifting Rocq.Corelib.Init.Logic.iff\n    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons A\n      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons A Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))\n    eqA\n    (Rocq.Corelib.Classes.RelationClasses.pointwise_extension Prop Rocq.Corelib.Init.Logic.and\n      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons A\n        (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons A Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))\n      (Rocq.Corelib.Classes.RelationClasses.pointwise_extension Pr"], ["c[it,pl] eo1", 2, "TRANSLATION_FAILED | type expected\n  Rocq.Corelib.Classes.RelationClasses.pointwise_lifting Rocq.Corelib.Init.Logic.iff\n    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons A\n      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons A Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))\n    eqA\n    (Rocq.Corelib.Classes.RelationClasses.pointwise_extension Prop Rocq.Corelib.Init.Logic.and\n      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons A\n        (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons A Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))\n      (Rocq.Corelib.Classes.RelationClasses.pointwise_extension Pr"], ["c[cu,lo,pl] eo1", 3, "TRANSLATION_FAILED | type expected\n  Rocq.Corelib.Classes.RelationClasses.pointwise_lifting Rocq.Corelib.Init.Logic.iff\n    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons A\n      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons A Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))\n    eqA\n    (Rocq.Corelib.Classes.RelationClasses.pointwise_extension Prop Rocq.Corelib.Init.Logic.and\n      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons A\n        (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons A Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))\n      (Rocq.Corelib.Classes.RelationClasses.pointwise_extension Pr"], ["c[ul] eo1", 3, "UNIVERSE_REJECTED | statement specialization refused: Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil: the level of u_Corelib_Classes_RelationClasses_72 is free in the source (no applied argument determines it, the source graph does not force it) but its argument is u_Corelib_Classes_Morphisms_196, not u_Corelib_Classes_RelationClasses_72"], ["c[it,ul] eo1", 2, "UNIVERSE_REJECTED | statement specialization refused: Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil: the level of u_Corelib_Classes_RelationClasses_72 is free in the source (no applied argument determines it, the source graph does not force it) but its argument is u_Corelib_Classes_Morphisms_196, not u_Corelib_Classes_RelationClasses_72"], ["c[] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.StrictOrder_PreOrder

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.StrictOrder_PreOrder.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"source_computed": ["Corelib.Classes.RelationClasses.arrows", "Corelib.Classes.RelationClasses.pointwise_extension"], "delta_inlined": ["Corelib.Classes.Morphisms.Proper", "Corelib.Classes.Morphisms.respectful", "Corelib.Classes.RelationClasses.predicate_union", "Corelib.Classes.RelationClasses.relation_disjunction", "Corelib.Init.Logic.iff", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.192 solved as (some 1): native fact Set lt Corelib.Classes.Morphisms.192 does not hold for the solution"], ["c[] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.192 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.192 does not hold for the solution"], ["c[it] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.192 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.192 does not hold for the solution"], ["c[un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.192 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.192 does not hold for the solution"], ["c[it,un] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.192 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.192 does not hold for the solution"], ["c[cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.192], R2B-S levels #[])"], ["c[it,cu] eo1", 1, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.192], R2B-S levels #[])"], ["c[cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.192], R2B-S levels #[])"], ["c[it,cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.192], R2B-S levels #[])"], ["c[de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.192 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.192 does not hold for the solution"], ["c[it] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.192 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.192 does not hold for the solution"], ["c[un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.192 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.192 does not hold for the solution"], ["c[it,un] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.192 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.192 does not hold for the solution"], ["c[cu,lo] eo1", 1, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.192], R2B-S levels #[])"], ["c[cu,lo,un] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.192], R2B-S levels #[])"], ["c[pl] eo1", 1, "UNSUPPORTED_FEATURE"], ["c[it,pl] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[cu,lo,pl] eo1", 1, "UNSUPPORTED_FEATURE"], ["c[ul] eo1", 2, "UNIVERSE_REJECTED | statement specialization refused: Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil: the level of u_Corelib_Classes_RelationClasses_72 is free in the source (no applied argument determines it, the source graph does not force it) but its argument is u_Corelib_Classes_Morphisms_192, not u_Corelib_Classes_RelationClasses_72"], ["c[it,ul] eo1", 2, "UNIVERSE_REJECTED | statement specialization refused: Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil: the level of u_Corelib_Classes_RelationClasses_72 is free in the source (no applied argument determines it, the source graph does not force it) but its argument is u_Corelib_Classes_Morphisms_192, not u_Corelib_Classes_RelationClasses_72"], ["c[] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.apply_subrelation

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.apply_subrelation；目标声明种类：inductive。
- 源端种类：inductive / inductive。
- 分派规则：inductive/generated；实际启用机制：{"coinductive_as_inductive": true}。
- 尝试顺序（标签、毫秒、结果）：[["i[pl]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.complement_proper

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.complement_proper.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.Morphisms.Proper", "Corelib.Classes.Morphisms.respectful", "Corelib.Classes.RelationClasses.complement", "Corelib.Init.Logic.iff", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 1): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it,un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[cu] eo1", 1, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu,lo] eo1", 1, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.complement_proper_obligation_1

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.complement_proper_obligation_1.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.Morphisms.Proper", "Corelib.Classes.Morphisms.respectful", "Corelib.Classes.RelationClasses.complement", "Corelib.Init.Logic.iff", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 1): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[un] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it,un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu] eo1", 1, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.compose_proper

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.compose_proper.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.Program.Basics.compose: argument u_Corelib_Relations_Relation_Definitions_21 + 1: Corelib.Relations.Relation_Definitions.21 + 1 ≤ Corelib.Program.Basics.24 is not entailed by the source universe graph, nor is Corelib.Program.Basics.24 ≤ Corelib.Relations.Relation_Definitions.21 (with offset 0)"], ["c[] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.compose_proper_obligation_1

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.compose_proper_obligation_1.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.Program.Basics.compose: argument u_Corelib_Relations_Relation_Definitions_21 + 1: Corelib.Relations.Relation_Definitions.21 + 1 ≤ Corelib.Program.Basics.24 is not entailed by the source universe graph, nor is Corelib.Program.Basics.24 ≤ Corelib.Relations.Relation_Definitions.21 (with offset 0)"], ["c[] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.eq_pars

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.eq_pars.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Init.Logic.19"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.eq_proper_proxy

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.eq_proper_proxy.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.21"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.eq_rewrite_relation

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.eq_rewrite_relation.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.52"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.eq_subrelation

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.eq_subrelation.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.77"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.flip1

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.flip1.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.77"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.flip2

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.flip2.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.77"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.flip_arrow

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.flip_arrow.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"source_computed": ["Corelib.Classes.RelationClasses.arrows", "Corelib.Classes.RelationClasses.pointwise_lifting"], "delta_inlined": ["Corelib.Classes.Morphisms.Normalizes", "Corelib.Classes.Morphisms.respectful", "Corelib.Classes.RelationClasses.predicate_equivalence", "Corelib.Classes.RelationClasses.relation_equivalence", "Corelib.Program.Basics.flip", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 1, "UNIVERSE_REJECTED | statement specialization refused: binder levels Corelib.Classes.Morphisms.138 ≤ Corelib.Classes.Morphisms.139 would be forced by the translation (u_Corelib_Relations_Relation_Definitions_21 + 1 ≤ u_Corelib_Relations_Relation_Definitions_21 + 1), not by the source"], ["c[] eo2", 0, "UNIVERSE_REJECTED | statement specialization refused: binder levels Corelib.Classes.Morphisms.138 ≤ Corelib.Classes.Morphisms.139 would be forced by the translation (u_Corelib_Classes_Morphisms_138 ≤ u_Corelib_Classes_Morphisms_138), not by the source"], ["c[it] eo2", 1, "UNIVERSE_REJECTED | R2F-c: own level Corelib.Classes.Morphisms.139 was identified with another own level by unification; it is not its own reading"], ["c[un] eo2", 0, "UNIVERSE_REJECTED | statement specialization refused: binder levels Corelib.Classes.Morphisms.138 ≤ Corelib.Classes.Morphisms.139 would be forced by the translation (u_Corelib_Classes_Morphisms_138 ≤ u_Corelib_Classes_Morphisms_138), not by the source"], ["c[it,un] eo2", 1, "UNIVERSE_REJECTED | R2F-c: own level Corelib.Classes.Morphisms.139 was identified with another own level by unification; it is not its own reading"], ["c[cu] eo2", 0, "UNIVERSE_REJECTED | statement specialization refused: binder levels Corelib.Classes.Morphisms.138 ≤ Corelib.Classes.Morphisms.139 would be forced by the translation (u_Corelib_Classes_Morphisms_138 ≤ u_Corelib_Classes_Morphisms_138), not by the source"], ["c[it,cu] eo2", 0, "UNIVERSE_REJECTED | R2F-c: own level Corelib.Classes.Morphisms.139 was identified with another own level by unification; it is not its own reading"], ["c[cu,lo] eo2", 1, "UNIVERSE_REJECTED | statement specialization refused: binder levels Corelib.Classes.Morphisms.138 ≤ Corelib.Classes.Morphisms.139 would be forced by the translation (u_Corelib_Classes_Morphisms_138 ≤ u_Corelib_Classes_Morphisms_138), not by the source"], ["c[it,cu,lo] eo2", 0, "UNIVERSE_REJECTED | R2F-c: own level Corelib.Classes.Morphisms.139 was identified with another own level by unification; it is not its own reading"], ["c[de] eo2", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo2", 0, "UNSUPPORTED_FEATURE"], ["c[] eo2", 4, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.RelationClasses.pointwise_lifting Rocq.Corelib.Init.Logic.iff\nargument has type\n  Prop → Prop → Prop\nbut function has type\n  @Rocq.Corelib.Classes.RelationClasses.arrows\n      (@Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (PULift Prop)\n        (@Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (PULift Prop)\n          Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))\n      (PULift Prop) →\n    (l : Rocq.Corelib.Classes.RelationClasses.Tlist) →\n      @Rocq.Corelib.Classes.RelationClasses.arrows\n        (@Rocq.Corelib.Classes.Relation"], ["c[it] eo2", 2, "UNIVERSE_REJECTED | reference to Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons: coherence: source level Corelib.Classes.RelationClasses.72 is a proof-local level of the referring declaration, solved as max (max u_Corelib_Classes_Morphisms_138 u_Corelib_Classes_Morphisms_139) u_Corelib_Classes_RelationClasses_72; the argument must be the same, not u_Corelib_Classes_Morphisms_138"], ["c[un] eo2", 3, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.RelationClasses.pointwise_lifting Rocq.Corelib.Init.Logic.iff\nargument has type\n  Prop → Prop → Prop\nbut function has type\n  @Rocq.Corelib.Classes.RelationClasses.arrows\n      (@Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (PULift Prop)\n        (@Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (PULift Prop)\n          Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))\n      (PULift Prop) →\n    (l : Rocq.Corelib.Classes.RelationClasses.Tlist) →\n      @Rocq.Corelib.Classes.RelationClasses.arrows\n        (@Rocq.Corelib.Classes.Relation"], ["c[it,un] eo2", 2, "UNIVERSE_REJECTED | reference to Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons: coherence: source level Corelib.Classes.RelationClasses.72 is a proof-local level of the referring declaration, solved as max (max u_Corelib_Classes_Morphisms_138 u_Corelib_Classes_Morphisms_139) u_Corelib_Classes_RelationClasses_72; the argument must be the same, not u_Corelib_Classes_Morphisms_138"], ["c[cu,lo] eo2", 3, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.RelationClasses.pointwise_lifting Rocq.Corelib.Init.Logic.iff\nargument has type\n  Prop → Prop → Prop\nbut function has type\n  @Rocq.Corelib.Classes.RelationClasses.arrows\n      (@Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (PULift Prop)\n        (@Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (PULift Prop)\n          Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))\n      (PULift Prop) →\n    (l : Rocq.Corelib.Classes.RelationClasses.Tlist) →\n      @Rocq.Corelib.Classes.RelationClasses.arrows\n        (@Rocq.Corelib.Classes.Relation"], ["c[cu,lo,un] eo2", 4, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.RelationClasses.pointwise_lifting Rocq.Corelib.Init.Logic.iff\nargument has type\n  Prop → Prop → Prop\nbut function has type\n  @Rocq.Corelib.Classes.RelationClasses.arrows\n      (@Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (PULift Prop)\n        (@Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (PULift Prop)\n          Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))\n      (PULift Prop) →\n    (l : Rocq.Corelib.Classes.RelationClasses.Tlist) →\n      @Rocq.Corelib.Classes.RelationClasses.arrows\n        (@Rocq.Corelib.Classes.Relation"], ["c[pl] eo2", 1, "TRANSLATION_FAILED | type expected\n  Rocq.Corelib.Classes.RelationClasses.pointwise_lifting Rocq.Corelib.Init.Logic.iff\n    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (A → B)\n      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (A → B) Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))\n    (fun f g => ∀ (x y : A), R x y → R' (f x) (g y)) fun x y => (fun f g => ∀ (x y : A), R''' x y → R'' (f x) (g y)) y x"], ["c[it,pl] eo2", 2, "TRANSLATION_FAILED | type expected\n  Rocq.Corelib.Classes.RelationClasses.pointwise_lifting Rocq.Corelib.Init.Logic.iff\n    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (A → B)\n      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (A → B) Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))\n    (fun f g => ∀ (x y : A), R x y → R' (f x) (g y)) fun x y => (fun f g => ∀ (x y : A), R''' x y → R'' (f x) (g y)) y x"], ["c[cu,lo,pl] eo2", 1, "TRANSLATION_FAILED | type expected\n  Rocq.Corelib.Classes.RelationClasses.pointwise_lifting Rocq.Corelib.Init.Logic.iff\n    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (A → B)\n      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (A → B) Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))\n    (fun f g => ∀ (x y : A), R x y → R' (f x) (g y)) fun x y => (fun f g => ∀ (x y : A), R''' x y → R'' (f x) (g y)) y x"], ["c[ul] eo2", 2, "UNIVERSE_REJECTED | statement specialization refused: Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil: the level of u_Corelib_Classes_RelationClasses_72 is free in the source (no applied argument determines it, the source graph does not force it) but its argument is u_Corelib_Classes_Morphisms_138, not u_Corelib_Classes_RelationClasses_72"], ["c[it,ul] eo2", 3, "UNIVERSE_REJECTED | statement specialization refused: Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil: the level of u_Corelib_Classes_RelationClasses_72 is free in the source (no applied argument determines it, the source graph does not force it) but its argument is u_Corelib_Classes_Morphisms_138, not u_Corelib_Classes_RelationClasses_72"], ["c[] eo2", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.flip_atom

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.flip_atom.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.132"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.flip_forall

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.flip_forall.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"source_computed": ["Corelib.Classes.RelationClasses.arrows", "Corelib.Classes.RelationClasses.pointwise_lifting"], "delta_inlined": ["Corelib.Classes.Morphisms.Normalizes", "Corelib.Classes.Morphisms.forall_relation", "Corelib.Classes.RelationClasses.predicate_equivalence", "Corelib.Classes.RelationClasses.relation_equivalence", "Corelib.Program.Basics.flip", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 1, "UNIVERSE_REJECTED | statement specialization refused: binder levels Corelib.Classes.Morphisms.144 ≤ Corelib.Classes.Morphisms.145 would be forced by the translation (u_Corelib_Relations_Relation_Definitions_21 + 1 ≤ u_Corelib_Relations_Relation_Definitions_21 + 1), not by the source"], ["c[] eo2", 0, "UNIVERSE_REJECTED | statement specialization refused: binder levels Corelib.Classes.Morphisms.144 ≤ Corelib.Classes.Morphisms.145 would be forced by the translation (u_Corelib_Classes_Morphisms_144 ≤ u_Corelib_Classes_Morphisms_144), not by the source"], ["c[it] eo2", 0, "UNIVERSE_REJECTED | R2F-c: own level Corelib.Classes.Morphisms.145 was identified with another own level by unification; it is not its own reading"], ["c[un] eo2", 1, "UNIVERSE_REJECTED | statement specialization refused: binder levels Corelib.Classes.Morphisms.144 ≤ Corelib.Classes.Morphisms.145 would be forced by the translation (u_Corelib_Classes_Morphisms_144 ≤ u_Corelib_Classes_Morphisms_144), not by the source"], ["c[it,un] eo2", 0, "UNIVERSE_REJECTED | R2F-c: own level Corelib.Classes.Morphisms.145 was identified with another own level by unification; it is not its own reading"], ["c[cu] eo2", 1, "UNIVERSE_REJECTED | statement specialization refused: binder levels Corelib.Classes.Morphisms.144 ≤ Corelib.Classes.Morphisms.145 would be forced by the translation (u_Corelib_Classes_Morphisms_144 ≤ u_Corelib_Classes_Morphisms_144), not by the source"], ["c[it,cu] eo2", 0, "UNIVERSE_REJECTED | R2F-c: own level Corelib.Classes.Morphisms.145 was identified with another own level by unification; it is not its own reading"], ["c[cu,lo] eo2", 1, "UNIVERSE_REJECTED | statement specialization refused: binder levels Corelib.Classes.Morphisms.144 ≤ Corelib.Classes.Morphisms.145 would be forced by the translation (u_Corelib_Classes_Morphisms_144 ≤ u_Corelib_Classes_Morphisms_144), not by the source"], ["c[it,cu,lo] eo2", 0, "UNIVERSE_REJECTED | R2F-c: own level Corelib.Classes.Morphisms.145 was identified with another own level by unification; it is not its own reading"], ["c[de] eo2", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo2", 0, "UNSUPPORTED_FEATURE"], ["c[] eo2", 1, "TRANSLATION_FAILED | type expected\n  Rocq.Corelib.Classes.RelationClasses.pointwise_lifting Rocq.Corelib.Init.Logic.iff\n    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (B a)\n      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (B a) Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))\n    (R a) fun x y => R' a y x"], ["c[it] eo2", 1, "TRANSLATION_FAILED | type expected\n  Rocq.Corelib.Classes.RelationClasses.pointwise_lifting Rocq.Corelib.Init.Logic.iff\n    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (B a)\n      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (B a) Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))\n    (R a) fun x y => R' a y x"], ["c[un] eo2", 0, "TRANSLATION_FAILED | type expected\n  Rocq.Corelib.Classes.RelationClasses.pointwise_lifting Rocq.Corelib.Init.Logic.iff\n    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (B a)\n      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (B a) Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))\n    (R a) fun x y => R' a y x"], ["c[it,un] eo2", 1, "TRANSLATION_FAILED | type expected\n  Rocq.Corelib.Classes.RelationClasses.pointwise_lifting Rocq.Corelib.Init.Logic.iff\n    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (B a)\n      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (B a) Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))\n    (R a) fun x y => R' a y x"], ["c[cu,lo] eo2", 1, "TRANSLATION_FAILED | type expected\n  Rocq.Corelib.Classes.RelationClasses.pointwise_lifting Rocq.Corelib.Init.Logic.iff\n    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (B a)\n      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (B a) Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))\n    (R a) fun x y => R' a y x"], ["c[cu,lo,un] eo2", 0, "TRANSLATION_FAILED | type expected\n  Rocq.Corelib.Classes.RelationClasses.pointwise_lifting Rocq.Corelib.Init.Logic.iff\n    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (B a)\n      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (B a) Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))\n    (R a) fun x y => R' a y x"], ["c[pl] eo2", 1, "TRANSLATION_FAILED | type expected\n  Rocq.Corelib.Classes.RelationClasses.pointwise_lifting Rocq.Corelib.Init.Logic.iff\n    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (B a)\n      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (B a) Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))\n    (R a) fun x y => R' a y x"], ["c[it,pl] eo2", 1, "TRANSLATION_FAILED | type expected\n  Rocq.Corelib.Classes.RelationClasses.pointwise_lifting Rocq.Corelib.Init.Logic.iff\n    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (B a)\n      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (B a) Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))\n    (R a) fun x y => R' a y x"], ["c[cu,lo,pl] eo2", 1, "TRANSLATION_FAILED | type expected\n  Rocq.Corelib.Classes.RelationClasses.pointwise_lifting Rocq.Corelib.Init.Logic.iff\n    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (B a)\n      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (B a) Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))\n    (R a) fun x y => R' a y x"], ["c[ul] eo2", 2, "UNIVERSE_REJECTED | statement specialization refused: Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil: the level of u_Corelib_Classes_RelationClasses_72 is free in the source (no applied argument determines it, the source graph does not force it) but its argument is u_Corelib_Classes_Morphisms_145, not u_Corelib_Classes_RelationClasses_72"], ["c[it,ul] eo2", 2, "UNIVERSE_REJECTED | statement specialization refused: Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil: the level of u_Corelib_Classes_RelationClasses_72 is free in the source (no applied argument determines it, the source graph does not force it) but its argument is u_Corelib_Classes_Morphisms_145, not u_Corelib_Classes_RelationClasses_72"], ["c[] eo2", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.flip_pars

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.flip_pars.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Program.Basics.36", "Corelib.Program.Basics.37", "Corelib.Program.Basics.38"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo3", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.flip_proper

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.flip_proper.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.Program.Basics.flip: argument u_Corelib_Relations_Relation_Definitions_21 + 1: Corelib.Relations.Relation_Definitions.21 + 1 ≤ Corelib.Program.Basics.38 is not entailed by the source universe graph, nor is Corelib.Program.Basics.38 ≤ Corelib.Relations.Relation_Definitions.21 (with offset 0)"], ["c[] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.flip_proper_obligation_1

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.flip_proper_obligation_1.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.Program.Basics.flip: argument u_Corelib_Relations_Relation_Definitions_21 + 1: Corelib.Relations.Relation_Definitions.21 + 1 ≤ Corelib.Program.Basics.38 is not entailed by the source universe graph, nor is Corelib.Program.Basics.38 ≤ Corelib.Relations.Relation_Definitions.21 (with offset 0)"], ["c[] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.flip_respectful

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.flip_respectful.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.77"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.forall_def

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.forall_def；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.57"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.forall_relation

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.forall_relation；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.53"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.forall_subrelation

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.forall_subrelation.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.57"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.iff_flip_impl_subrelation

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.iff_flip_impl_subrelation.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.iff_impl_subrelation

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.iff_impl_subrelation.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.iff_pars

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.iff_pars.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.impl_pars

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.impl_pars.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.normalization_done

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.normalization_done；目标声明种类：inductive。
- 源端种类：inductive / inductive。
- 分派规则：inductive/generated；实际启用机制：{"coinductive_as_inductive": true}。
- 尝试顺序（标签、毫秒、结果）：[["i[pl]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.normalizes

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.normalizes.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.132"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.per_partial_app_morphism

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.per_partial_app_morphism.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.Morphisms.Proper", "Corelib.Classes.Morphisms.respectful", "Corelib.Init.Logic.iff", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 1): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it,un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[cu,lo] eo1", 1, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.per_partial_app_morphism_obligation_1

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.per_partial_app_morphism_obligation_1.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.Morphisms.respectful", "Corelib.Init.Logic.iff", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 1): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it,un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[cu,lo] eo1", 1, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.pointwise_pointwise

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.pointwise_pointwise.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.57 solved as (some 1): native fact Set lt Corelib.Classes.Morphisms.57 does not hold for the solution"], ["c[] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.pointwise_relation

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.pointwise_relation；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.38 solved as (some (u_Corelib_Relations_Relation_Definitions_21__c0 + 1)): native fact Set lt Corelib.Classes.Morphisms.38 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.pointwise_subrelation

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.pointwise_subrelation.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.57 solved as (some 1): native fact Set lt Corelib.Classes.Morphisms.57 does not hold for the solution"], ["c[] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.proper_eq

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.proper_eq.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.77"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.proper_flip_proper

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.proper_flip_proper.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.77"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.proper_normalizes_proper

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.proper_normalizes_proper.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.132"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.proper_prf

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.proper_prf.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.21"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.proper_proper

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.proper_proper.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"source_computed": ["Corelib.Classes.RelationClasses.arrows", "Corelib.Classes.RelationClasses.pointwise_lifting"], "delta_inlined": ["Corelib.Classes.Morphisms.Proper", "Corelib.Classes.Morphisms.respectful", "Corelib.Classes.RelationClasses.predicate_equivalence", "Corelib.Classes.RelationClasses.relation_equivalence", "Corelib.Init.Logic.iff", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.131 solved as (some 1): native fact Set lt Corelib.Classes.Morphisms.131 does not hold for the solution"], ["c[] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.131 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.131 does not hold for the solution"], ["c[it] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.131 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.131 does not hold for the solution"], ["c[un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.131 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.131 does not hold for the solution"], ["c[it,un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.131 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.131 does not hold for the solution"], ["c[cu] eo1", 1, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.131], R2B-S levels #[])"], ["c[it,cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.131], R2B-S levels #[])"], ["c[cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.131], R2B-S levels #[])"], ["c[it,cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.131], R2B-S levels #[])"], ["c[de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons: coherence: source level Corelib.Classes.RelationClasses.72 is shared with the referring declaration, so its argument must be u_Corelib.Classes.RelationClasses.72, not u_Corelib_Classes_Morphisms_131"], ["c[it] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons: coherence: source level Corelib.Classes.RelationClasses.72 is a proof-local level of the referring declaration, solved as max u_Corelib_Classes_Morphisms_131 u_Corelib_Classes_RelationClasses_72; the argument must be the same, not u_Corelib_Classes_Morphisms_131"], ["c[un] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons: coherence: source level Corelib.Classes.RelationClasses.72 is shared with the referring declaration, so its argument must be u_Corelib.Classes.RelationClasses.72, not u_Corelib_Classes_Morphisms_131"], ["c[it,un] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons: coherence: source level Corelib.Classes.RelationClasses.72 is a proof-local level of the referring declaration, solved as max u_Corelib_Classes_Morphisms_131 u_Corelib_Classes_RelationClasses_72; the argument must be the same, not u_Corelib_Classes_Morphisms_131"], ["c[cu,lo] eo1", 3, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.RelationClasses.pointwise_lifting Rocq.Corelib.Init.Logic.iff\nargument has type\n  Prop → Prop → Prop\nbut function has type\n  @Rocq.Corelib.Classes.RelationClasses.arrows\n      (@Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (PULift Prop)\n        (@Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (PULift Prop)\n          Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))\n      (PULift Prop) →\n    (l : Rocq.Corelib.Classes.RelationClasses.Tlist) →\n      @Rocq.Corelib.Classes.RelationClasses.arrows\n        (@Rocq.Corelib.Classes.Relation"], ["c[cu,lo,un] eo1", 3, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.RelationClasses.pointwise_lifting Rocq.Corelib.Init.Logic.iff\nargument has type\n  Prop → Prop → Prop\nbut function has type\n  @Rocq.Corelib.Classes.RelationClasses.arrows\n      (@Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (PULift Prop)\n        (@Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (PULift Prop)\n          Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))\n      (PULift Prop) →\n    (l : Rocq.Corelib.Classes.RelationClasses.Tlist) →\n      @Rocq.Corelib.Classes.RelationClasses.arrows\n        (@Rocq.Corelib.Classes.Relation"], ["c[pl] eo1", 0, "TRANSLATION_FAILED | type expected\n  Rocq.Corelib.Classes.RelationClasses.pointwise_lifting✝ Rocq.Corelib.Init.Logic.iff✝\n    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons✝ A\n      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons✝ A Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil✝))\n    x y"], ["c[it,pl] eo1", 1, "TRANSLATION_FAILED | type expected\n  Rocq.Corelib.Classes.RelationClasses.pointwise_lifting✝ Rocq.Corelib.Init.Logic.iff✝\n    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons✝ A\n      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons✝ A Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil✝))\n    x y"], ["c[cu,lo,pl] eo1", 1, "TRANSLATION_FAILED | type expected\n  Rocq.Corelib.Classes.RelationClasses.pointwise_lifting✝ Rocq.Corelib.Init.Logic.iff✝\n    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons✝ A\n      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons✝ A Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil✝))\n    x y"], ["c[ul] eo1", 2, "UNIVERSE_REJECTED | statement specialization refused: Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil: the level of u_Corelib_Classes_RelationClasses_72 is free in the source (no applied argument determines it, the source graph does not force it) but its argument is u_Corelib_Classes_Morphisms_131, not u_Corelib_Classes_RelationClasses_72"], ["c[it,ul] eo1", 1, "UNIVERSE_REJECTED | statement specialization refused: Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil: the level of u_Corelib_Classes_RelationClasses_72 is free in the source (no applied argument determines it, the source graph does not force it) but its argument is u_Corelib_Classes_Morphisms_131, not u_Corelib_Classes_RelationClasses_72"], ["c[] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.proper_proper_proxy

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.proper_proper_proxy.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.21"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.proper_proxy

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.proper_proxy.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.21"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.proper_subrelation_proper

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.proper_subrelation_proper.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.Morphisms.Proper", "Corelib.Classes.Morphisms.respectful", "Corelib.Classes.RelationClasses.subrelation", "Corelib.Program.Basics.impl", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.57 solved as (some 1): native fact Set lt Corelib.Classes.Morphisms.57 does not hold for the solution"], ["c[] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.57 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.57 does not hold for the solution"], ["c[it] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.57 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.57 does not hold for the solution"], ["c[un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.57 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.57 does not hold for the solution"], ["c[it,un] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.57 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.57 does not hold for the solution"], ["c[cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.57], R2B-S levels #[])"], ["c[it,cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.57], R2B-S levels #[])"], ["c[cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.57], R2B-S levels #[])"], ["c[it,cu,lo] eo1", 1, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.57], R2B-S levels #[])"], ["c[de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.proper_sym_flip

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.proper_sym_flip.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.Morphisms.Proper", "Corelib.Classes.Morphisms.respectful", "Corelib.Classes.RelationClasses.Symmetric", "Corelib.Program.Basics.flip", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 1, "UNIVERSE_REJECTED | statement specialization refused: binder levels Corelib.Classes.Morphisms.152 ≤ Corelib.Classes.Morphisms.156 would be forced by the translation (u_Corelib_Relations_Relation_Definitions_21 + 1 ≤ u_Corelib_Relations_Relation_Definitions_21 + 1), not by the source"], ["c[] eo2", 0, "UNIVERSE_REJECTED | statement specialization refused: binder levels Corelib.Classes.Morphisms.152 ≤ Corelib.Classes.Morphisms.156 would be forced by the translation (u_Corelib_Classes_Morphisms_152 ≤ u_Corelib_Classes_Morphisms_152), not by the source"], ["c[it] eo2", 0, "UNIVERSE_REJECTED | R2F-c: own level Corelib.Classes.Morphisms.156 was identified with another own level by unification; it is not its own reading"], ["c[un] eo2", 1, "UNIVERSE_REJECTED | statement specialization refused: binder levels Corelib.Classes.Morphisms.152 ≤ Corelib.Classes.Morphisms.156 would be forced by the translation (u_Corelib_Classes_Morphisms_152 ≤ u_Corelib_Classes_Morphisms_152), not by the source"], ["c[it,un] eo2", 0, "UNIVERSE_REJECTED | R2F-c: own level Corelib.Classes.Morphisms.156 was identified with another own level by unification; it is not its own reading"], ["c[cu] eo2", 1, "UNIVERSE_REJECTED | statement specialization refused: binder levels Corelib.Classes.Morphisms.152 ≤ Corelib.Classes.Morphisms.156 would be forced by the translation (u_Corelib_Classes_Morphisms_152 ≤ u_Corelib_Classes_Morphisms_152), not by the source"], ["c[it,cu] eo2", 0, "UNIVERSE_REJECTED | R2F-c: own level Corelib.Classes.Morphisms.156 was identified with another own level by unification; it is not its own reading"], ["c[cu,lo] eo2", 0, "UNIVERSE_REJECTED | statement specialization refused: binder levels Corelib.Classes.Morphisms.152 ≤ Corelib.Classes.Morphisms.156 would be forced by the translation (u_Corelib_Classes_Morphisms_152 ≤ u_Corelib_Classes_Morphisms_152), not by the source"], ["c[it,cu,lo] eo2", 1, "UNIVERSE_REJECTED | R2F-c: own level Corelib.Classes.Morphisms.156 was identified with another own level by unification; it is not its own reading"], ["c[de] eo2", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo2", 0, "UNSUPPORTED_FEATURE"], ["c[] eo2", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.proper_sym_flip_2

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.proper_sym_flip_2.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.Morphisms.Proper", "Corelib.Classes.Morphisms.respectful", "Corelib.Classes.RelationClasses.Symmetric", "Corelib.Program.Basics.flip", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo3", 1, "UNIVERSE_REJECTED | statement specialization refused: binder levels Corelib.Classes.Morphisms.159 ≤ Corelib.Classes.Morphisms.162 would be forced by the translation (u_Corelib_Relations_Relation_Definitions_21 + 1 ≤ u_Corelib_Relations_Relation_Definitions_21 + 1), not by the source"], ["c[] eo3", 0, "UNIVERSE_REJECTED | statement specialization refused: binder levels Corelib.Classes.Morphisms.159 ≤ Corelib.Classes.Morphisms.162 would be forced by the translation (u_Corelib_Classes_Morphisms_159 ≤ u_Corelib_Classes_Morphisms_159), not by the source"], ["c[it] eo3", 1, "UNIVERSE_REJECTED | R2F-c: own level Corelib.Classes.Morphisms.162 was identified with another own level by unification; it is not its own reading"], ["c[un] eo3", 1, "UNIVERSE_REJECTED | statement specialization refused: binder levels Corelib.Classes.Morphisms.159 ≤ Corelib.Classes.Morphisms.162 would be forced by the translation (u_Corelib_Classes_Morphisms_159 ≤ u_Corelib_Classes_Morphisms_159), not by the source"], ["c[it,un] eo3", 0, "UNIVERSE_REJECTED | R2F-c: own level Corelib.Classes.Morphisms.162 was identified with another own level by unification; it is not its own reading"], ["c[cu] eo3", 1, "UNIVERSE_REJECTED | statement specialization refused: binder levels Corelib.Classes.Morphisms.159 ≤ Corelib.Classes.Morphisms.162 would be forced by the translation (u_Corelib_Classes_Morphisms_159 ≤ u_Corelib_Classes_Morphisms_159), not by the source"], ["c[it,cu] eo3", 0, "UNIVERSE_REJECTED | R2F-c: own level Corelib.Classes.Morphisms.162 was identified with another own level by unification; it is not its own reading"], ["c[cu,lo] eo3", 1, "UNIVERSE_REJECTED | statement specialization refused: binder levels Corelib.Classes.Morphisms.159 ≤ Corelib.Classes.Morphisms.162 would be forced by the translation (u_Corelib_Classes_Morphisms_159 ≤ u_Corelib_Classes_Morphisms_159), not by the source"], ["c[it,cu,lo] eo3", 0, "UNIVERSE_REJECTED | R2F-c: own level Corelib.Classes.Morphisms.162 was identified with another own level by unification; it is not its own reading"], ["c[de] eo3", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo3", 0, "UNSUPPORTED_FEATURE"], ["c[] eo3", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.proper_sym_impl_iff

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.proper_sym_impl_iff.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.Morphisms.Proper", "Corelib.Classes.Morphisms.respectful", "Corelib.Classes.RelationClasses.Symmetric", "Corelib.Init.Logic.iff", "Corelib.Program.Basics.impl", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.169 solved as (some 1): native fact Set lt Corelib.Classes.Morphisms.169 does not hold for the solution"], ["c[] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.169 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.169 does not hold for the solution"], ["c[it] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.169 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.169 does not hold for the solution"], ["c[un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.169 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.169 does not hold for the solution"], ["c[it,un] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.169 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.169 does not hold for the solution"], ["c[cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.169], R2B-S levels #[])"], ["c[it,cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.169], R2B-S levels #[])"], ["c[cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.169], R2B-S levels #[])"], ["c[it,cu,lo] eo1", 1, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.169], R2B-S levels #[])"], ["c[de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.proper_sym_impl_iff_2

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.proper_sym_impl_iff_2.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.Morphisms.Proper", "Corelib.Classes.Morphisms.respectful", "Corelib.Classes.RelationClasses.Symmetric", "Corelib.Init.Logic.iff", "Corelib.Program.Basics.impl", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.173 solved as (some 1): native fact Set lt Corelib.Classes.Morphisms.173 does not hold for the solution"], ["c[] eo2", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.173 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.173 does not hold for the solution"], ["c[it] eo2", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.173 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.173 does not hold for the solution"], ["c[un] eo2", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.173 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.173 does not hold for the solution"], ["c[it,un] eo2", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.173 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.173 does not hold for the solution"], ["c[cu] eo2", 1, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.173, Corelib.Classes.Morphisms.176], R2B-S levels #[])"], ["c[it,cu] eo2", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.173, Corelib.Classes.Morphisms.176], R2B-S levels #[])"], ["c[cu,lo] eo2", 1, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.173, Corelib.Classes.Morphisms.176], R2B-S levels #[])"], ["c[it,cu,lo] eo2", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.173, Corelib.Classes.Morphisms.176], R2B-S levels #[])"], ["c[de] eo2", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo2", 0, "UNSUPPORTED_FEATURE"], ["c[] eo2", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.reflexive_eq_dom_reflexive

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.reflexive_eq_dom_reflexive.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.77"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.reflexive_proper

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.reflexive_proper.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.21"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.reflexive_proper_proxy

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.reflexive_proper_proxy.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.21"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.reflexive_proxy

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.reflexive_proxy.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.21"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.reflexive_reflexive_proxy

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.reflexive_reflexive_proxy.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.21"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.respectful

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.respectful；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.21"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.respectful_hetero

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.respectful_hetero；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.30", "Corelib.Classes.Morphisms.31", "Corelib.Classes.Morphisms.32", "Corelib.Classes.Morphisms.33"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.respectful_morphism

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.respectful_morphism.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.77"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.respectful_per

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.respectful_per.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.77"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.respectful_per_obligation_1

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.respectful_per_obligation_1.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.77"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.respectful_per_obligation_2

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.respectful_per_obligation_2.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.77"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.rewrite_relation_eq_dom

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.rewrite_relation_eq_dom.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.Morphisms.respectful", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 0, "UNIVERSE_REJECTED | statement specialization refused: binder levels Corelib.Classes.Morphisms.50 ≤ Corelib.Classes.Morphisms.49 would be forced by the translation (u_Corelib_Relations_Relation_Definitions_21 + 1 ≤ u_Corelib_Relations_Relation_Definitions_21 + 1), not by the source"], ["c[] eo2", 0, "UNIVERSE_REJECTED | statement specialization refused: binder levels Corelib.Classes.Morphisms.50 ≤ Corelib.Classes.Morphisms.49 would be forced by the translation (u_Corelib_Classes_Morphisms_49 ≤ u_Corelib_Classes_Morphisms_49), not by the source"], ["c[it] eo2", 0, "UNIVERSE_REJECTED | R2F-c: own level Corelib.Classes.Morphisms.50 was identified with another own level by unification; it is not its own reading"], ["c[un] eo2", 1, "UNIVERSE_REJECTED | statement specialization refused: binder levels Corelib.Classes.Morphisms.50 ≤ Corelib.Classes.Morphisms.49 would be forced by the translation (u_Corelib_Classes_Morphisms_49 ≤ u_Corelib_Classes_Morphisms_49), not by the source"], ["c[it,un] eo2", 0, "UNIVERSE_REJECTED | R2F-c: own level Corelib.Classes.Morphisms.50 was identified with another own level by unification; it is not its own reading"], ["c[cu] eo2", 0, "UNIVERSE_REJECTED | statement specialization refused: binder levels Corelib.Classes.Morphisms.50 ≤ Corelib.Classes.Morphisms.49 would be forced by the translation (u_Corelib_Classes_Morphisms_49 ≤ u_Corelib_Classes_Morphisms_49), not by the source"], ["c[it,cu] eo2", 0, "UNIVERSE_REJECTED | R2F-c: own level Corelib.Classes.Morphisms.50 was identified with another own level by unification; it is not its own reading"], ["c[cu,lo] eo2", 0, "UNIVERSE_REJECTED | statement specialization refused: binder levels Corelib.Classes.Morphisms.50 ≤ Corelib.Classes.Morphisms.49 would be forced by the translation (u_Corelib_Classes_Morphisms_49 ≤ u_Corelib_Classes_Morphisms_49), not by the source"], ["c[it,cu,lo] eo2", 0, "UNIVERSE_REJECTED | R2F-c: own level Corelib.Classes.Morphisms.50 was identified with another own level by unification; it is not its own reading"], ["c[de] eo2", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo2", 0, "UNSUPPORTED_FEATURE"], ["c[] eo2", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.rewrite_relation_pointwise

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.rewrite_relation_pointwise.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.44", "Corelib.Classes.Morphisms.45"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.subrelation_id_proper

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.subrelation_id_proper.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.Morphisms.Proper", "Corelib.Classes.Morphisms.respectful", "Corelib.Classes.RelationClasses.subrelation", "Corelib.Init.Datatypes.id", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.57 solved as (some 1): native fact Set lt Corelib.Classes.Morphisms.57 does not hold for the solution"], ["c[] eo1", 1, "UNIVERSE_REJECTED | statement specialization refused: Rocq.Corelib.Init.Datatypes.id: the level of u_Corelib_Init_Datatypes_265 is free in the source (no applied argument determines it, the source graph does not force it) but its argument is u_Corelib_Classes_Morphisms_57, not u_Corelib_Init_Datatypes_265"], ["c[it] eo1", 1, "UNIVERSE_REJECTED | statement specialization refused: Rocq.Corelib.Init.Datatypes.id: the level of u_Corelib_Init_Datatypes_265 is free in the source (no applied argument determines it, the source graph does not force it) but its argument is u_Corelib_Classes_Morphisms_57, not u_Corelib_Init_Datatypes_265"], ["c[un] eo1", 1, "UNIVERSE_REJECTED | statement specialization refused: Rocq.Corelib.Init.Datatypes.id: the level of u_Corelib_Init_Datatypes_265 is free in the source (no applied argument determines it, the source graph does not force it) but its argument is u_Corelib_Classes_Morphisms_57, not u_Corelib_Init_Datatypes_265"], ["c[it,un] eo1", 1, "UNIVERSE_REJECTED | statement specialization refused: Rocq.Corelib.Init.Datatypes.id: the level of u_Corelib_Init_Datatypes_265 is free in the source (no applied argument determines it, the source graph does not force it) but its argument is u_Corelib_Classes_Morphisms_57, not u_Corelib_Init_Datatypes_265"], ["c[cu] eo1", 1, "UNIVERSE_REJECTED | statement specialization refused: Rocq.Corelib.Init.Datatypes.id: the level of u_Corelib_Init_Datatypes_265 is free in the source (no applied argument determines it, the source graph does not force it) but its argument is u_Corelib_Classes_Morphisms_57, not u_Corelib_Init_Datatypes_265"], ["c[it,cu] eo1", 1, "UNIVERSE_REJECTED | statement specialization refused: Rocq.Corelib.Init.Datatypes.id: the level of u_Corelib_Init_Datatypes_265 is free in the source (no applied argument determines it, the source graph does not force it) but its argument is u_Corelib_Classes_Morphisms_57, not u_Corelib_Init_Datatypes_265"], ["c[cu,lo] eo1", 1, "UNIVERSE_REJECTED | statement specialization refused: Rocq.Corelib.Init.Datatypes.id: the level of u_Corelib_Init_Datatypes_265 is free in the source (no applied argument determines it, the source graph does not force it) but its argument is u_Corelib_Classes_Morphisms_57, not u_Corelib_Init_Datatypes_265"], ["c[it,cu,lo] eo1", 1, "UNIVERSE_REJECTED | statement specialization refused: Rocq.Corelib.Init.Datatypes.id: the level of u_Corelib_Init_Datatypes_265 is free in the source (no applied argument determines it, the source graph does not force it) but its argument is u_Corelib_Classes_Morphisms_57, not u_Corelib_Init_Datatypes_265"], ["c[de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.subrelation_proper

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.subrelation_proper.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.Init.Unconvertible", "Corelib.Classes.Morphisms.Proper", "Corelib.Classes.RelationClasses.subrelation", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.Relations.Relation_Definitions.relation: argument u_Corelib_Classes_Morphisms_70: Corelib.Classes.Morphisms.70 + 0 ≤ Corelib.Relations.Relation_Definitions.21 is not entailed by the source universe graph, nor is Corelib.Relations.Relation_Definitions.21 ≤ Corelib.Classes.Morphisms.70 (with offset 0)"], ["c[] eo2", 1, "UNIVERSE_REJECTED | statement specialization refused: binder levels Corelib.Classes.Morphisms.70 ≤ Corelib.Classes.Morphisms.57 would be forced by the translation (u_Corelib_Classes_Morphisms_57 ≤ u_Corelib_Classes_Morphisms_57), not by the source"], ["c[it] eo2", 0, "UNIVERSE_REJECTED | R2F-c: own level Corelib.Classes.Morphisms.70 was identified with another own level by unification; it is not its own reading"], ["c[un] eo2", 0, "UNIVERSE_REJECTED | statement specialization refused: binder levels Corelib.Classes.Morphisms.70 ≤ Corelib.Classes.Morphisms.57 would be forced by the translation (u_Corelib_Classes_Morphisms_57 ≤ u_Corelib_Classes_Morphisms_57), not by the source"], ["c[it,un] eo2", 0, "UNIVERSE_REJECTED | R2F-c: own level Corelib.Classes.Morphisms.70 was identified with another own level by unification; it is not its own reading"], ["c[cu] eo2", 1, "UNIVERSE_REJECTED | statement specialization refused: binder levels Corelib.Classes.Morphisms.70 ≤ Corelib.Classes.Morphisms.57 would be forced by the translation (u_Corelib_Classes_Morphisms_57 ≤ u_Corelib_Classes_Morphisms_57), not by the source"], ["c[it,cu] eo2", 0, "UNIVERSE_REJECTED | R2F-c: own level Corelib.Classes.Morphisms.70 was identified with another own level by unification; it is not its own reading"], ["c[cu,lo] eo2", 0, "UNIVERSE_REJECTED | statement specialization refused: binder levels Corelib.Classes.Morphisms.70 ≤ Corelib.Classes.Morphisms.57 would be forced by the translation (u_Corelib_Classes_Morphisms_57 ≤ u_Corelib_Classes_Morphisms_57), not by the source"], ["c[it,cu,lo] eo2", 0, "UNIVERSE_REJECTED | R2F-c: own level Corelib.Classes.Morphisms.70 was identified with another own level by unification; it is not its own reading"], ["c[de] eo2", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo2", 0, "UNSUPPORTED_FEATURE"], ["c[] eo2", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.subrelation_refl

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.subrelation_refl.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.57"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.subrelation_respectful

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.subrelation_respectful.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.57"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.symmetric_equiv_flip

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.symmetric_equiv_flip.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Classes.Morphisms.77"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.trans_co_eq_inv_impl_morphism

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.trans_co_eq_inv_impl_morphism.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.Morphisms.Proper", "Corelib.Classes.Morphisms.respectful", "Corelib.Classes.RelationClasses.Transitive", "Corelib.Program.Basics.flip", "Corelib.Program.Basics.impl", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 1): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it,un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[cu] eo1", 1, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu,lo] eo1", 1, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.trans_co_eq_inv_impl_morphism_obligation_1

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.trans_co_eq_inv_impl_morphism_obligation_1.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.Morphisms.respectful", "Corelib.Classes.RelationClasses.Transitive", "Corelib.Program.Basics.flip", "Corelib.Program.Basics.impl", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 1): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it,un] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo1", 1, "UNSUPPORTED_FEATURE"], ["c[] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.trans_co_impl_morphism

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.trans_co_impl_morphism.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.Morphisms.Proper", "Corelib.Classes.Morphisms.respectful", "Corelib.Classes.RelationClasses.Transitive", "Corelib.Program.Basics.impl", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 1): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it,un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu,lo] eo1", 1, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.trans_co_impl_morphism_obligation_1

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.trans_co_impl_morphism_obligation_1.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.Morphisms.respectful", "Corelib.Classes.RelationClasses.Transitive", "Corelib.Program.Basics.impl", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 1): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[un] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it,un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.trans_contra_co_morphism

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.trans_contra_co_morphism.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.Morphisms.Proper", "Corelib.Classes.Morphisms.respectful", "Corelib.Classes.RelationClasses.Transitive", "Corelib.Program.Basics.flip", "Corelib.Program.Basics.impl", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 1): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[un] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it,un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu] eo1", 1, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.trans_contra_co_morphism_obligation_1

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.trans_contra_co_morphism_obligation_1.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.Morphisms.respectful", "Corelib.Classes.RelationClasses.Transitive", "Corelib.Program.Basics.flip", "Corelib.Program.Basics.impl", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 1): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[un] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it,un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu] eo1", 1, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.trans_contra_inv_impl_morphism

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.trans_contra_inv_impl_morphism.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.Morphisms.Proper", "Corelib.Classes.Morphisms.respectful", "Corelib.Classes.RelationClasses.Transitive", "Corelib.Program.Basics.flip", "Corelib.Program.Basics.impl", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 1): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it,un] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[cu,lo] eo1", 1, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.trans_contra_inv_impl_morphism_obligation_1

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.trans_contra_inv_impl_morphism_obligation_1.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.Morphisms.respectful", "Corelib.Classes.RelationClasses.Transitive", "Corelib.Program.Basics.flip", "Corelib.Program.Basics.impl", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 1): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it,un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[cu] eo1", 1, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.trans_sym_co_inv_impl_morphism

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.trans_sym_co_inv_impl_morphism.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.Morphisms.Proper", "Corelib.Classes.Morphisms.respectful", "Corelib.Program.Basics.flip", "Corelib.Program.Basics.impl", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 1): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it,un] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.trans_sym_co_inv_impl_morphism_obligation_1

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.trans_sym_co_inv_impl_morphism_obligation_1.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.Morphisms.respectful", "Corelib.Program.Basics.flip", "Corelib.Program.Basics.impl", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 1): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it,un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.trans_sym_contra_impl_morphism

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.trans_sym_contra_impl_morphism.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.Morphisms.Proper", "Corelib.Classes.Morphisms.respectful", "Corelib.Program.Basics.flip", "Corelib.Program.Basics.impl", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 1): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it,un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[cu] eo1", 1, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.Morphisms.trans_sym_contra_impl_morphism_obligation_1

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.Morphisms.trans_sym_contra_impl_morphism_obligation_1.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.Morphisms.respectful", "Corelib.Program.Basics.flip", "Corelib.Program.Basics.impl", "Corelib.Relations.Relation_Definitions.relation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 1): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[un] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[it,un] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Classes.Morphisms.77 solved as (some 0): native fact Set lt Corelib.Classes.Morphisms.77 does not hold for the solution"], ["c[cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[cu,lo] eo1", 0, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[it,cu,lo] eo1", 1, "INTERFACE_REJECTED | statement specialization refused (R2B-P levels #[Corelib.Classes.Morphisms.77], R2B-S levels #[])"], ["c[de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de] eo1", 0, "UNSUPPORTED_FEATURE"], ["c[] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

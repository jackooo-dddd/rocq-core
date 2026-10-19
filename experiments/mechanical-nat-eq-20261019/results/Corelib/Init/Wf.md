Corelib.Init.Wf

原文件：/home/shunqwang4/.opam/rocq930-mc/lib/coq/theories/Init/Wf.v
冻结运行：/home/shunqwang4/research/rocq-core/experiments/mechanical-nat-eq-20261019/runs/full-v1/Corelib/Init/Wf
原始根声明：21；当前受阻：0；检查：{'roundtrip_exit': 0, 'roundtrip': 'OK', 'translate_exit': 0, 'consumer_exit': 0, 'audit_exit': 0, 'consumer': 'OK', 'audit': 'OK'}。

[Rocq 源文件](Wf.v) · [Lean 入口](Wf.lean) · [Lean 打印结果](Wf.txt) · [逐项完整记录](Wf.json)

---

Corelib.Init.Wf.Acc

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Init.Wf.Acc；目标声明种类：inductive。
- 源端种类：inductive / inductive。
- 分派规则：inductive/generated-levels；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["i[pl]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Init.Wf.Acc_ind

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Init.Wf.Acc_ind.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.Init.Wf.Acc: coherence: source level Corelib.Init.Wf.11 is a motive level of the referring declaration but not of the referenced one"], ["c[] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Init.Wf.Acc_intro_generator

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Init.Wf.Acc_intro_generator.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.Init.Wf.48"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Init.Wf.Acc_inv

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Init.Wf.Acc_inv.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.Init.Wf.Acc: coherence: source level Corelib.Init.Wf.11 is a motive level of the referring declaration but not of the referenced one"], ["c[] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Init.Wf.Acc_inv_dep

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.Init.Wf.Acc_inv_dep.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.Init.Wf.Acc_inv_dep__rocq2lean_obligation_1.statement: coherence: source level Corelib.Init.Wf.11 is a motive level of the referring declaration but not of the referenced one"], ["c[] eo1", 0, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.Init.Wf.Acc_inv_dep__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Init.Wf.Acc_rec

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Init.Wf.Acc_rec；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.Init.Wf.Acc: coherence: source level Corelib.Init.Wf.11 is a motive level of the referring declaration but not of the referenced one"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Init.Wf.Acc_rect

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Init.Wf.Acc_rect；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.Init.Wf.Acc: coherence: source level Corelib.Init.Wf.11 is a motive level of the referring declaration but not of the referenced one"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Init.Wf.Acc_sind

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Init.Wf.Acc_sind.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.Init.Wf.Acc: coherence: source level Corelib.Init.Wf.11 is a motive level of the referring declaration but not of the referenced one"], ["c[] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Init.Wf.Fix

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Init.Wf.Fix；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.Init.Wf.well_founded: coherence: source level Corelib.Init.Wf.11 is a motive level of the referring declaration but not of the referenced one"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Init.Wf.Fix_F

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Init.Wf.Fix_F；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.Init.Wf.Acc: coherence: source level Corelib.Init.Wf.11 is a motive level of the referring declaration but not of the referenced one"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Init.Wf.Fix_F_2

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Init.Wf.Fix_F_2；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Init.Wf.Acc (@Rocq.Corelib.Init.Datatypes.prod A B)\nargument has type\n  Sort (max (max 1 u_Corelib_Init_Wf_25) u_Corelib_Init_Wf_26)\nbut function has type\n  (A : Type u_Corelib_Init_Wf_11) → (A → A → Prop) → A → Prop"], ["c[]", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Init.Wf.Fix_F_eq

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Init.Wf.Fix_F_eq.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.Init.Wf.Acc: coherence: source level Corelib.Init.Wf.11 is a motive level of the referring declaration but not of the referenced one"], ["c[] eo2", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Init.Wf.Fix_F_inv

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Init.Wf.Fix_F_inv.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.Init.Wf.well_founded: coherence: source level Corelib.Init.Wf.11 is a motive level of the referring declaration but not of the referenced one"], ["c[] eo2", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Init.Wf.Fix_F_inv_gen

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Init.Wf.Fix_F_inv_gen.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.Init.Wf.well_founded: coherence: source level Corelib.Init.Wf.11 is a motive level of the referring declaration but not of the referenced one"], ["c[] eo2", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Init.Wf.Fix_eq

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Init.Wf.Fix_eq.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.Init.Wf.well_founded: coherence: source level Corelib.Init.Wf.11 is a motive level of the referring declaration but not of the referenced one"], ["c[] eo2", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Init.Wf.Fix_eq_gen

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Init.Wf.Fix_eq_gen.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.Init.Wf.well_founded: coherence: source level Corelib.Init.Wf.11 is a motive level of the referring declaration but not of the referenced one"], ["c[] eo2", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Init.Wf.well_founded

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Init.Wf.well_founded；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.Init.Wf.Acc: coherence: source level Corelib.Init.Wf.11 is a motive level of the referring declaration but not of the referenced one"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Init.Wf.well_founded_ind

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Init.Wf.well_founded_ind.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.Init.Wf.well_founded: coherence: source level Corelib.Init.Wf.11 is a motive level of the referring declaration but not of the referenced one"], ["c[] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Init.Wf.well_founded_induction

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Init.Wf.well_founded_induction；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.Init.Wf.well_founded: coherence: source level Corelib.Init.Wf.11 is a motive level of the referring declaration but not of the referenced one"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Init.Wf.well_founded_induction_type

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Init.Wf.well_founded_induction_type；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.Init.Wf.well_founded: coherence: source level Corelib.Init.Wf.11 is a motive level of the referring declaration but not of the referenced one"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Init.Wf.well_founded_induction_type_2

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Init.Wf.well_founded_induction_type_2；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.Init.Wf.Fix_F_2: coherence: source level Corelib.Init.Wf.25 is a motive level of the referring declaration but not of the referenced one"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

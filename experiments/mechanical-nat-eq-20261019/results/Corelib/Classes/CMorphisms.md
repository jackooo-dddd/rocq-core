Corelib.Classes.CMorphisms

原文件：/home/shunqwang4/.opam/rocq930-mc/lib/coq/theories/Classes/CMorphisms.v
冻结运行：/home/shunqwang4/research/rocq-core/experiments/mechanical-nat-eq-20261019/runs/full-v1/Corelib/Classes/CMorphisms
原始根声明：78；当前受阻：0；检查：{'roundtrip_exit': 0, 'roundtrip': 'OK', 'translate_exit': 0, 'consumer_exit': 0, 'audit_exit': 0, 'consumer': 'OK', 'audit': 'OK'}。

[Rocq 源文件](CMorphisms.v) · [Lean 入口](CMorphisms.lean) · [Lean 打印结果](CMorphisms.txt) · [逐项完整记录](CMorphisms.json)

---

Corelib.Classes.CMorphisms.Normalizes

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.Normalizes；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"poly_level_interp": [{"n": "v_0", "k": "param"}, {"k": "max", "b": {"l": {"n": "v_3", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_1", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}, {"k": "max", "b": {"n": "v_3", "k": "param"}, "a": {"k": "max", "b": {"n": "v_2", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}, {"n": "v_3", "k": "param"}], "delta_inlined": ["Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.relation_equivalence"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.Normalizes' has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 v_2) v_3)\nbut it is expected to have type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type v_2"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.Normalizes' has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 v_2) v_3)\nbut it is expected to have type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type v_2"], ["c[cu]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.Normalizes' has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 v_2) v_3)\nbut it is expected to have type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type v_2"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.Normalizes' has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 v_2) v_3)\nbut it is expected to have type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type v_2"], ["c[cu,lo]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.Normalizes' has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 v_2) v_3)\nbut it is expected to have type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type v_2"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.Normalizes' has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 v_2) v_3)\nbut it is expected to have type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type v_2"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.Normalizes' has type\n  (A : Type v_0) → (A → A → Type v_3) → (A → A → Type v_3) → Type (max v_0 0 v_3)\nbut it is expected to have type\n  (A : Type v_0) → (A → A → Type v_3) → (A → A → Type v_3) → Type v_2"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.Normalizes' has type\n  (A : Type v_0) → (A → A → Type v_3) → (A → A → Type v_3) → Type (max v_0 0 v_3)\nbut it is expected to have type\n  (A : Type v_0) → (A → A → Type v_3) → (A → A → Type v_3) → Type v_2"], ["c[un]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.Normalizes' has type\n  (A : Type v_0) → (A → A → Type v_3) → (A → A → Type v_3) → Type (max v_0 0 v_3)\nbut it is expected to have type\n  (A : Type v_0) → (A → A → Type v_3) → (A → A → Type v_3) → Type v_2"], ["c[it,un]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.Normalizes' has type\n  (A : Type v_0) → (A → A → Type v_3) → (A → A → Type v_3) → Type (max v_0 0 v_3)\nbut it is expected to have type\n  (A : Type v_0) → (A → A → Type v_3) → (A → A → Type v_3) → Type v_2"], ["c[cu,lo]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.Normalizes' has type\n  (A : Type v_0) → (A → A → Type v_3) → (A → A → Type v_3) → Type (max v_0 0 v_3)\nbut it is expected to have type\n  (A : Type v_0) → (A → A → Type v_3) → (A → A → Type v_3) → Type v_2"], ["c[cu,lo,un]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.Normalizes' has type\n  (A : Type v_0) → (A → A → Type v_3) → (A → A → Type v_3) → Type (max v_0 0 v_3)\nbut it is expected to have type\n  (A : Type v_0) → (A → A → Type v_3) → (A → A → Type v_3) → Type v_2"], ["c[pl]", 0, "UNSUPPORTED_FEATURE"], ["c[it,pl]", 0, "UNSUPPORTED_FEATURE"], ["c[cu,lo,pl]", 0, "UNSUPPORTED_FEATURE"], ["c[ul]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.PER_type_morphism

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.PER_type_morphism；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.iffT"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.PER_type_morphism_obligation_1

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.PER_type_morphism_obligation_1；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.symmetry", "Corelib.Classes.CRelationClasses.transitivity"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_4) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_4) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_4) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[it,cu]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_4) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_4) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_4) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.Params

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.Params；目标声明种类：inductive。
- 源端种类：inductive / inductive。
- 分派规则：inductive/generated-levels；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["i[pl]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.PartialApplication

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.PartialApplication；目标声明种类：inductive。
- 源端种类：inductive / inductive。
- 分派规则：inductive/generated；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["i[pl]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.PartialOrder_StrictOrder

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.Classes.CMorphisms.PartialOrder_StrictOrder；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"poly_level_interp": [{"k": "max", "b": {"n": "v_5", "k": "param"}, "a": {"n": "v_0", "k": "param"}}, {"k": "max", "b": {"l": {"n": "v_5", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_4", "k": "param"}, "a": {"n": "v_1", "k": "param"}}}, {"k": "max", "b": {"n": "v_5", "k": "param"}, "a": {"k": "max", "b": {"n": "v_4", "k": "param"}, "a": {"n": "v_2", "k": "param"}}}, {"k": "max", "b": {"l": {"n": "v_5", "k": "param"}, "k": "succ"}, "a": {"n": "v_3", "k": "param"}}, {"n": "v_4", "k": "param"}, {"n": "v_5", "k": "param"}], "type_lift_coercions": 8, "delta_inlined": ["Corelib.Classes.CRelationClasses.PartialOrder", "Corelib.Classes.CRelationClasses.Transitive", "Corelib.Classes.CRelationClasses.complement", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.relation_conjunction", "Corelib.Classes.CRelationClasses.relation_equivalence"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 5, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.StrictOrder A fun x y =>\n    @Rocq.Corelib.Init.Datatypes.prod (R x y) ((@fun x y => eqA x y → Rocq.Corelib.Init.Logic.False) x y)\nargument has type\n  A → A → Type (max 0 v_5)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_4 v_0)"], ["c[it]", 5, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.StrictOrder A fun x y =>\n    @Rocq.Corelib.Init.Datatypes.prod (R x y) ((@fun x y => eqA x y → Rocq.Corelib.Init.Logic.False) x y)\nargument has type\n  A → A → Type (max 0 v_5)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_4 v_0)"], ["c[un]", 5, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.StrictOrder A fun x y =>\n    @Rocq.Corelib.Init.Datatypes.prod (R x y) ((@fun x y => eqA x y → Rocq.Corelib.Init.Logic.False) x y)\nargument has type\n  A → A → Type (max 0 v_5)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_4 v_0)"], ["c[it,un]", 5, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.StrictOrder A fun x y =>\n    @Rocq.Corelib.Init.Datatypes.prod (R x y) ((@fun x y => eqA x y → Rocq.Corelib.Init.Logic.False) x y)\nargument has type\n  A → A → Type (max 0 v_5)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_4 v_0)"], ["c[cu,lo]", 4, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.StrictOrder A fun x y =>\n    @Rocq.Corelib.Init.Datatypes.prod (R x y) ((@fun x y => eqA x y → Rocq.Corelib.Init.Logic.False) x y)\nargument has type\n  A → A → Type (max 0 v_5)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_4 v_0)"], ["c[cu,lo,un]", 6, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.StrictOrder A fun x y =>\n    @Rocq.Corelib.Init.Datatypes.prod (R x y) ((@fun x y => eqA x y → Rocq.Corelib.Init.Logic.False) x y)\nargument has type\n  A → A → Type (max 0 v_5)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_4 v_0)"], ["c[pl]", 1, "UNSUPPORTED_FEATURE"], ["c[it,pl]", 2, "UNSUPPORTED_FEATURE"], ["c[cu,lo,pl]", 1, "UNSUPPORTED_FEATURE"], ["c[ul]", 5, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.StrictOrder A fun x y =>\n    @Rocq.Corelib.Init.Datatypes.prod (R x y) ((@fun x y => eqA x y → Rocq.Corelib.Init.Logic.False) x y)\nargument has type\n  A → A → Type (max 0 v_5)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_4 v_0)"], ["c[it,ul]", 4, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.Classes.CMorphisms.PartialOrder_StrictOrder__rocq2lean_obligation_1, Corelib.Classes.CMorphisms.PartialOrder_StrictOrder__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.PartialOrder_proper_type

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.PartialOrder_proper_type；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.PartialOrder", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.partial_order_equivalence", "Corelib.Classes.CRelationClasses.relation_conjunction", "Corelib.Classes.CRelationClasses.relation_equivalence", "Corelib.Classes.CRelationClasses.transitivity"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 4, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.Proper

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.Proper；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.ProperProxy

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.ProperProxy；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.Reflexive_partial_app_morphism

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.Reflexive_partial_app_morphism；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"poly_level_interp": [{"n": "v_0", "k": "param"}, {"n": "v_1", "k": "param"}, {"k": "max", "b": {"n": "v_2", "k": "param"}, "a": {"k": "max", "b": {"n": "v_1", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}, {"k": "max", "b": {"n": "v_5", "k": "param"}, "a": {"k": "max", "b": {"n": "v_4", "k": "param"}, "a": {"k": "max", "b": {"n": "v_3", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}}, {"n": "v_4", "k": "param"}, {"n": "v_5", "k": "param"}], "delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.ProperProxy", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATION_FAILED | function expected\n  @H x"], ["c[ul]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.StrictOrder_PartialOrder

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.Classes.CMorphisms.StrictOrder_PartialOrder；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.PartialOrder", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.relation_conjunction", "Corelib.Classes.CRelationClasses.relation_disjunction", "Corelib.Classes.CRelationClasses.relation_equivalence", "Corelib.Classes.CRelationClasses.symmetry"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 4, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.Classes.CMorphisms.StrictOrder_PartialOrder__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.StrictOrder_PreOrder

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.StrictOrder_PreOrder；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"poly_level_interp": [{"k": "max", "b": {"n": "v_5", "k": "param"}, "a": {"k": "max", "b": {"l": {"n": "v_4", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_2", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}}, {"k": "max", "b": {"n": "v_6", "k": "param"}, "a": {"k": "max", "b": {"n": "v_5", "k": "param"}, "a": {"k": "max", "b": {"n": "v_4", "k": "param"}, "a": {"n": "v_1", "k": "param"}}}}, {"k": "max", "b": {"l": {"n": "v_4", "k": "param"}, "k": "succ"}, "a": {"n": "v_2", "k": "param"}}, {"k": "max", "b": {"n": "v_6", "k": "param"}, "a": {"k": "max", "b": {"n": "v_4", "k": "param"}, "a": {"n": "v_3", "k": "param"}}}, {"n": "v_4", "k": "param"}, {"n": "v_5", "k": "param"}, {"n": "v_6", "k": "param"}], "type_lift_coercions": 6, "delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Reflexive", "Corelib.Classes.CRelationClasses.Transitive", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.reflexivity", "Corelib.Classes.CRelationClasses.relation_disjunction", "Corelib.Classes.CRelationClasses.symmetry", "Corelib.Classes.CRelationClasses.transitivity"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 4, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PreOrder A fun x y => @Rocq.Corelib.Init.Datatypes.sum (R x y) (eqA x y)\nargument has type\n  A → A → Type (max (max 0 v_4) v_6)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_5 v_3)"], ["c[it]", 5, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PreOrder A fun x y => @Rocq.Corelib.Init.Datatypes.sum (R x y) (eqA x y)\nargument has type\n  A → A → Type (max (max 0 v_4) v_6)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_5 v_3)"], ["c[un]", 4, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PreOrder A fun x y => @Rocq.Corelib.Init.Datatypes.sum (R x y) (eqA x y)\nargument has type\n  A → A → Type (max (max 0 v_4) v_6)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_5 v_3)"], ["c[it,un]", 4, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PreOrder A fun x y => @Rocq.Corelib.Init.Datatypes.sum (R x y) (eqA x y)\nargument has type\n  A → A → Type (max (max 0 v_4) v_6)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_5 v_3)"], ["c[cu,lo]", 4, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PreOrder A fun x y => @Rocq.Corelib.Init.Datatypes.sum (R x y) (eqA x y)\nargument has type\n  A → A → Type (max (max 0 v_4) v_6)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_5 v_3)"], ["c[cu,lo,un]", 4, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PreOrder A fun x y => @Rocq.Corelib.Init.Datatypes.sum (R x y) (eqA x y)\nargument has type\n  A → A → Type (max (max 0 v_4) v_6)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_5 v_3)"], ["c[pl]", 2, "UNSUPPORTED_FEATURE"], ["c[it,pl]", 2, "UNSUPPORTED_FEATURE"], ["c[cu,lo,pl]", 1, "UNSUPPORTED_FEATURE"], ["c[ul]", 3, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.apply_subrelation

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.apply_subrelation；目标声明种类：inductive。
- 源端种类：inductive / inductive。
- 分派规则：inductive/generated；实际启用机制：{"coinductive_as_inductive": true}。
- 尝试顺序（标签、毫秒、结果）：[["i[pl]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.compose_proper

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.compose_proper；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Program.Basics.compose"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper ((B → C) → (A → B) → A → C)\nargument has type\n  Type (max (max v_1 v_2) (max v_0 v_1) v_0 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[it]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper ((B → C) → (A → B) → A → C)\nargument has type\n  Type (max (max v_1 v_2) (max v_0 v_1) v_0 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper ((B → C) → (A → B) → A → C)\nargument has type\n  Type (max (max v_1 v_2) (max v_0 v_1) v_0 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[it,cu]", 3, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper ((B → C) → (A → B) → A → C)\nargument has type\n  Type (max (max v_1 v_2) (max v_0 v_1) v_0 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper ((B → C) → (A → B) → A → C)\nargument has type\n  Type (max (max v_1 v_2) (max v_0 v_1) v_0 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper ((B → C) → (A → B) → A → C)\nargument has type\n  Type (max (max v_1 v_2) (max v_0 v_1) v_0 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.compose_proper_obligation_1

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.compose_proper_obligation_1；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Program.Basics.compose"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful (B → C)\nargument has type\n  Type (max v_1 v_2)\nbut function has type\n  (A : Type v_5) →\n    (B : Type v_7) →\n      (A → A → Type v_6) → (B → B → Type v_8) → (A → B) → (A → B) → Type (max (max (max v_5 v_6) v_8) v_4)"], ["c[it]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful (B → C)\nargument has type\n  Type (max v_1 v_2)\nbut function has type\n  (A : Type v_5) →\n    (B : Type v_7) →\n      (A → A → Type v_6) → (B → B → Type v_8) → (A → B) → (A → B) → Type (max (max (max v_5 v_6) v_8) v_4)"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful (B → C)\nargument has type\n  Type (max v_1 v_2)\nbut function has type\n  (A : Type v_5) →\n    (B : Type v_7) →\n      (A → A → Type v_6) → (B → B → Type v_8) → (A → B) → (A → B) → Type (max (max (max v_5 v_6) v_8) v_4)"], ["c[it,cu]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful (B → C)\nargument has type\n  Type (max v_1 v_2)\nbut function has type\n  (A : Type v_5) →\n    (B : Type v_7) →\n      (A → A → Type v_6) → (B → B → Type v_8) → (A → B) → (A → B) → Type (max (max (max v_5 v_6) v_8) v_4)"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful (B → C)\nargument has type\n  Type (max v_1 v_2)\nbut function has type\n  (A : Type v_5) →\n    (B : Type v_7) →\n      (A → A → Type v_6) → (B → B → Type v_8) → (A → B) → (A → B) → Type (max (max (max v_5 v_6) v_8) v_4)"], ["c[it,cu,lo]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful (B → C)\nargument has type\n  Type (max v_1 v_2)\nbut function has type\n  (A : Type v_5) →\n    (B : Type v_7) →\n      (A → A → Type v_6) → (B → B → Type v_8) → (A → B) → (A → B) → Type (max (max (max v_5 v_6) v_8) v_4)"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.eq_proper_proxy

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.eq_proper_proxy.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.eq_subrelation

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.Classes.CMorphisms.eq_subrelation；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CRelationClasses.Reflexive", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.subrelation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation A (@Rocq.Corelib.Init.Logic.eq A)\nargument has type\n  A → A → Prop\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 0) v_1)"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation A (@Rocq.Corelib.Init.Logic.eq A)\nargument has type\n  A → A → Prop\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 0) v_1)"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation A (@Rocq.Corelib.Init.Logic.eq A)\nargument has type\n  A → A → Prop\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 0) v_1)"], ["c[it,cu]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation A (@Rocq.Corelib.Init.Logic.eq A)\nargument has type\n  A → A → Prop\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 0) v_1)"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation A (@Rocq.Corelib.Init.Logic.eq A)\nargument has type\n  A → A → Prop\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 0) v_1)"], ["c[it,cu,lo]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation A (@Rocq.Corelib.Init.Logic.eq A)\nargument has type\n  A → A → Prop\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 0) v_1)"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.Init.Logic.eq_rect_r__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.flip1

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.flip1；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip", "Corelib.Classes.CRelationClasses.subrelation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_3) → (A → A → C) → A → A → C"], ["c[it]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_3) → (A → A → C) → A → A → C"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_3) → (A → A → C) → A → A → C"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_3) → (A → A → C) → A → A → C"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_3) → (A → A → C) → A → A → C"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_3) → (A → A → C) → A → A → C"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.flip2

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.flip2；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip", "Corelib.Classes.CRelationClasses.subrelation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_3) → (A → A → C) → A → A → C"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_3) → (A → A → C) → A → A → C"], ["c[cu]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_3) → (A → A → C) → A → A → C"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_3) → (A → A → C) → A → A → C"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_3) → (A → A → C) → A → A → C"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_3) → (A → A → C) → A → A → C"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.flip_arrow

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.flip_arrow.type；目标声明种类：statement。
- 源端种类：constant / opaque_interface。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.Normalizes", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.relation_equivalence"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_2)\nargument has type\n  Type (v_2 + 1)\nbut function has type\n  (C : Type v_9) → (A → A → C) → A → A → C"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_2)\nargument has type\n  Type (v_2 + 1)\nbut function has type\n  (C : Type v_9) → (A → A → C) → A → A → C"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_2)\nargument has type\n  Type (v_2 + 1)\nbut function has type\n  (C : Type v_9) → (A → A → C) → A → A → C"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_2)\nargument has type\n  Type (v_2 + 1)\nbut function has type\n  (C : Type v_9) → (A → A → C) → A → A → C"], ["c[cu,lo]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_2)\nargument has type\n  Type (v_2 + 1)\nbut function has type\n  (C : Type v_9) → (A → A → C) → A → A → C"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_2)\nargument has type\n  Type (v_2 + 1)\nbut function has type\n  (C : Type v_9) → (A → A → C) → A → A → C"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 3, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.flip_atom

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.flip_atom；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.Normalizes", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.relation_equivalence"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.flip_proper

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.flip_proper；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → C)\nargument has type\n  Type (max v_0 v_1 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[it]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → C)\nargument has type\n  Type (max v_0 v_1 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → C)\nargument has type\n  Type (max v_0 v_1 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[it,cu]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → C)\nargument has type\n  Type (max v_0 v_1 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → C)\nargument has type\n  Type (max v_0 v_1 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[it,cu,lo]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → C)\nargument has type\n  Type (max v_0 v_1 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.flip_proper_obligation_1

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.flip_proper_obligation_1；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → C)\nargument has type\n  Type (max v_0 v_1 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[it]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → C)\nargument has type\n  Type (max v_0 v_1 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[cu]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → C)\nargument has type\n  Type (max v_0 v_1 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → C)\nargument has type\n  Type (max v_0 v_1 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[cu,lo]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → C)\nargument has type\n  Type (max v_0 v_1 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[it,cu,lo]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → C)\nargument has type\n  Type (max v_0 v_1 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.flip_respectful

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.flip_respectful；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.relation_equivalence"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.forall_def

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.forall_def；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"poly_level_interp": [{"n": "v_0", "k": "param"}, {"n": "v_1", "k": "param"}, {"k": "max", "b": {"n": "v_2", "k": "param"}, "a": {"k": "max", "b": {"n": "v_1", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.forall_def' has type\n  (A : Type v_0) → (A → Type v_1) → Type (max v_0 v_1)\nbut it is expected to have type\n  (A : Type v_0) → (A → Type v_1) → Type v_2"], ["c[it]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.forall_def' has type\n  (A : Type v_0) → (A → Type v_1) → Type (max v_0 v_1)\nbut it is expected to have type\n  (A : Type v_0) → (A → Type v_1) → Type v_2"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.forall_def' has type\n  (A : Type v_0) → (A → Type v_1) → Type (max v_0 v_1)\nbut it is expected to have type\n  (A : Type v_0) → (A → Type v_1) → Type v_2"], ["c[it,cu]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.forall_def' has type\n  (A : Type v_0) → (A → Type v_1) → Type (max v_0 v_1)\nbut it is expected to have type\n  (A : Type v_0) → (A → Type v_1) → Type v_2"], ["c[cu,lo]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.forall_def' has type\n  (A : Type v_0) → (A → Type v_1) → Type (max v_0 v_1)\nbut it is expected to have type\n  (A : Type v_0) → (A → Type v_1) → Type v_2"], ["c[it,cu,lo]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.forall_def' has type\n  (A : Type v_0) → (A → Type v_1) → Type (max v_0 v_1)\nbut it is expected to have type\n  (A : Type v_0) → (A → Type v_1) → Type v_2"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[ul]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.forall_relation

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.forall_relation；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"poly_level_interp": [{"n": "v_0", "k": "param"}, {"n": "v_1", "k": "param"}, {"n": "v_2", "k": "param"}, {"k": "max", "b": {"n": "v_3", "k": "param"}, "a": {"k": "max", "b": {"n": "v_1", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}, {"k": "max", "b": {"n": "v_4", "k": "param"}, "a": {"k": "max", "b": {"n": "v_2", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}], "delta_inlined": ["Corelib.Classes.CRelationClasses.crelation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation ((x : A) → P x)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  Type v_3 → Type (max v_3 (v_4 + 1))"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation ((x : A) → P x)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  Type v_3 → Type (max v_3 (v_4 + 1))"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation ((x : A) → P x)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  Type v_3 → Type (max v_3 (v_4 + 1))"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation ((x : A) → P x)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  Type v_3 → Type (max v_3 (v_4 + 1))"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation ((x : A) → P x)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  Type v_3 → Type (max v_3 (v_4 + 1))"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation ((x : A) → P x)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  Type v_3 → Type (max v_3 (v_4 + 1))"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.forall_relation' has type\n  (A : Type v_0) →\n    (P : A → Type v_1) → ((a : A) → P a → P a → Type v_2) → ((x : A) → P x) → ((x : A) → P x) → Type (max v_0 v_2)\nbut it is expected to have type\n  (A : Type v_0) → (P : A → Type v_1) → ((a : A) → P a → P a → Type v_2) → ((x : A) → P x) → ((x : A) → P x) → Type v_4"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.forall_relation' has type\n  (A : Type v_0) →\n    (P : A → Type v_1) → ((a : A) → P a → P a → Type v_2) → ((x : A) → P x) → ((x : A) → P x) → Type (max v_0 v_2)\nbut it is expected to have type\n  (A : Type v_0) → (P : A → Type v_1) → ((a : A) → P a → P a → Type v_2) → ((x : A) → P x) → ((x : A) → P x) → Type v_4"], ["c[un]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.forall_relation' has type\n  (A : Type v_0) →\n    (P : A → Type v_1) → ((a : A) → P a → P a → Type v_2) → ((x : A) → P x) → ((x : A) → P x) → Type (max v_0 v_2)\nbut it is expected to have type\n  (A : Type v_0) → (P : A → Type v_1) → ((a : A) → P a → P a → Type v_2) → ((x : A) → P x) → ((x : A) → P x) → Type v_4"], ["c[it,un]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.forall_relation' has type\n  (A : Type v_0) →\n    (P : A → Type v_1) → ((a : A) → P a → P a → Type v_2) → ((x : A) → P x) → ((x : A) → P x) → Type (max v_0 v_2)\nbut it is expected to have type\n  (A : Type v_0) → (P : A → Type v_1) → ((a : A) → P a → P a → Type v_2) → ((x : A) → P x) → ((x : A) → P x) → Type v_4"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.forall_relation' has type\n  (A : Type v_0) →\n    (P : A → Type v_1) → ((a : A) → P a → P a → Type v_2) → ((x : A) → P x) → ((x : A) → P x) → Type (max v_0 v_2)\nbut it is expected to have type\n  (A : Type v_0) → (P : A → Type v_1) → ((a : A) → P a → P a → Type v_2) → ((x : A) → P x) → ((x : A) → P x) → Type v_4"], ["c[cu,lo,un]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.forall_relation' has type\n  (A : Type v_0) →\n    (P : A → Type v_1) → ((a : A) → P a → P a → Type v_2) → ((x : A) → P x) → ((x : A) → P x) → Type (max v_0 v_2)\nbut it is expected to have type\n  (A : Type v_0) → (P : A → Type v_1) → ((a : A) → P a → P a → Type v_2) → ((x : A) → P x) → ((x : A) → P x) → Type v_4"], ["c[pl]", 0, "UNSUPPORTED_FEATURE"], ["c[it,pl]", 0, "UNSUPPORTED_FEATURE"], ["c[cu,lo,pl]", 0, "UNSUPPORTED_FEATURE"], ["c[ul]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.forall_subrelation

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.forall_subrelation；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.forall_relation", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.subrelation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.iffT_arrow_subrelation

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.iffT_arrow_subrelation；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.subrelation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_0 v_1)"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_0 v_1)"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_0 v_1)"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_0 v_1)"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_0 v_1)"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_0 v_1)"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.iffT_flip_arrow_subrelation

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.iffT_flip_arrow_subrelation；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.flip", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.subrelation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 v_1) v_3)"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 v_1) v_3)"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 v_1) v_3)"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 v_1) v_3)"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 v_1) v_3)"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 v_1) v_3)"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.iff_flip_impl_subrelation

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.iff_flip_impl_subrelation.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.CRelationClasses.flip", "Corelib.Init.Logic.iff", "Corelib.Program.Basics.impl"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip Prop\nargument has type\n  Type\nbut function has type\n  (A B C : Type v_0) → (A → B → C) → B → A → C"], ["c[it]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip Prop\nargument has type\n  Type\nbut function has type\n  (A B C : Type v_0) → (A → B → C) → B → A → C"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip Prop\nargument has type\n  Type\nbut function has type\n  (A B C : Type v_0) → (A → B → C) → B → A → C"], ["c[it,cu]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip Prop\nargument has type\n  Type\nbut function has type\n  (A B C : Type v_0) → (A → B → C) → B → A → C"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip Prop\nargument has type\n  Type\nbut function has type\n  (A B C : Type v_0) → (A → B → C) → B → A → C"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip Prop\nargument has type\n  Type\nbut function has type\n  (A B C : Type v_0) → (A → B → C) → B → A → C"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.iff_impl_subrelation

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.iff_impl_subrelation.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.normalization_done

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.normalization_done；目标声明种类：inductive。
- 源端种类：inductive / inductive。
- 分派规则：inductive/generated；实际启用机制：{"coinductive_as_inductive": true}。
- 尝试顺序（标签、毫秒、结果）：[["i[pl]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.normalizes

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.normalizes；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.per_partial_app_type_morphism

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.per_partial_app_type_morphism；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.iffT"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.per_partial_app_type_morphism_obligation_1

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.per_partial_app_type_morphism_obligation_1；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.symmetry", "Corelib.Classes.CRelationClasses.transitivity"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[it]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.pointwise_pointwise

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.Classes.CMorphisms.pointwise_pointwise；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.pointwise_relation", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.relation_equivalence"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATION_FAILED | function expected\n  @✝ y"], ["c[ul]", 2, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.Init.Logic.eq_rect_r__rocq2lean_obligation_1, Corelib.Classes.CMorphisms.pointwise_pointwise__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.pointwise_relation

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.pointwise_relation；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"poly_level_interp": [{"n": "v_0", "k": "param"}, {"n": "v_1", "k": "param"}, {"n": "v_2", "k": "param"}, {"k": "max", "b": {"n": "v_3", "k": "param"}, "a": {"k": "max", "b": {"n": "v_1", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}, {"k": "max", "b": {"n": "v_4", "k": "param"}, "a": {"k": "max", "b": {"n": "v_2", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}], "delta_inlined": ["Corelib.Classes.CRelationClasses.crelation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  Type v_3 → Type (max v_3 (v_4 + 1))"], ["c[it]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  Type v_3 → Type (max v_3 (v_4 + 1))"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  Type v_3 → Type (max v_3 (v_4 + 1))"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  Type v_3 → Type (max v_3 (v_4 + 1))"], ["c[cu,lo]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  Type v_3 → Type (max v_3 (v_4 + 1))"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  Type v_3 → Type (max v_3 (v_4 + 1))"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.pointwise_relation' has type\n  (A : Type v_0) → (B : Type v_1) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max v_0 v_2)\nbut it is expected to have type\n  (A : Type v_0) → (B : Type v_1) → (B → B → Type v_2) → (A → B) → (A → B) → Type v_4"], ["c[it]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.pointwise_relation' has type\n  (A : Type v_0) → (B : Type v_1) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max v_0 v_2)\nbut it is expected to have type\n  (A : Type v_0) → (B : Type v_1) → (B → B → Type v_2) → (A → B) → (A → B) → Type v_4"], ["c[un]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.pointwise_relation' has type\n  (A : Type v_0) → (B : Type v_1) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max v_0 v_2)\nbut it is expected to have type\n  (A : Type v_0) → (B : Type v_1) → (B → B → Type v_2) → (A → B) → (A → B) → Type v_4"], ["c[it,un]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.pointwise_relation' has type\n  (A : Type v_0) → (B : Type v_1) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max v_0 v_2)\nbut it is expected to have type\n  (A : Type v_0) → (B : Type v_1) → (B → B → Type v_2) → (A → B) → (A → B) → Type v_4"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.pointwise_relation' has type\n  (A : Type v_0) → (B : Type v_1) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max v_0 v_2)\nbut it is expected to have type\n  (A : Type v_0) → (B : Type v_1) → (B → B → Type v_2) → (A → B) → (A → B) → Type v_4"], ["c[cu,lo,un]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.pointwise_relation' has type\n  (A : Type v_0) → (B : Type v_1) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max v_0 v_2)\nbut it is expected to have type\n  (A : Type v_0) → (B : Type v_1) → (B → B → Type v_2) → (A → B) → (A → B) → Type v_4"], ["c[pl]", 0, "UNSUPPORTED_FEATURE"], ["c[it,pl]", 1, "UNSUPPORTED_FEATURE"], ["c[cu,lo,pl]", 0, "UNSUPPORTED_FEATURE"], ["c[ul]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.pointwise_subrelation

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.pointwise_subrelation；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.pointwise_relation", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.subrelation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.proper_eq

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.proper_eq.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.proper_flip_proper

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.proper_flip_proper；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_2) → (A → A → C) → A → A → C"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_2) → (A → A → C) → A → A → C"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_2) → (A → A → C) → A → A → C"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_2) → (A → A → C) → A → A → C"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_2) → (A → A → C) → A → A → C"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_2) → (A → A → C) → A → A → C"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.proper_normalizes_proper

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.proper_normalizes_proper；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"poly_level_interp": [{"n": "v_0", "k": "param"}, {"k": "max", "b": {"l": {"n": "v_3", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_1", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}, {"k": "max", "b": {"n": "v_3", "k": "param"}, "a": {"k": "max", "b": {"n": "v_2", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}, {"n": "v_3", "k": "param"}], "delta_inlined": ["Corelib.Classes.CMorphisms.Normalizes", "Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.relation_equivalence"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATION_FAILED | function expected\n  @H x"], ["c[ul]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.proper_prf

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.proper_prf；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.proper_proper

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.proper_proper；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.relation_equivalence"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.proper_proper_proxy

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.proper_proper_proxy；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.proper_proxy

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.proper_proxy；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.proper_subrelation_proper_arrow

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.Classes.CMorphisms.proper_subrelation_proper_arrow；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.subrelation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.Init.Logic.eq_rect_r__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.proper_sym_arrow_iffT

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.proper_sym_arrow_iffT；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Symmetric", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.iffT"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.proper_sym_arrow_iffT_2

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.proper_sym_arrow_iffT_2；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Symmetric", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.iffT"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.proper_sym_flip

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.proper_sym_flip；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"poly_level_interp": [{"k": "max", "b": {"n": "v_4", "k": "param"}, "a": {"k": "max", "b": {"n": "v_2", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}, {"k": "max", "b": {"n": "v_5", "k": "param"}, "a": {"k": "max", "b": {"n": "v_4", "k": "param"}, "a": {"k": "max", "b": {"n": "v_3", "k": "param"}, "a": {"n": "v_1", "k": "param"}}}}, {"n": "v_2", "k": "param"}, {"n": "v_3", "k": "param"}, {"n": "v_4", "k": "param"}, {"n": "v_5", "k": "param"}, {"k": "max", "b": {"n": "v_6", "k": "param"}, "a": {"l": {"n": "v_3", "k": "param"}, "k": "succ"}}], "delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Symmetric", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATION_FAILED | function expected\n  @Hf x'"], ["c[ul]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.proper_sym_flip_2

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.proper_sym_flip_2；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"poly_level_interp": [{"k": "max", "b": {"n": "v_8", "k": "param"}, "a": {"k": "max", "b": {"n": "v_6", "k": "param"}, "a": {"k": "max", "b": {"n": "v_3", "k": "param"}, "a": {"k": "max", "b": {"n": "v_2", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}}}, {"k": "max", "b": {"n": "v_9", "k": "param"}, "a": {"k": "max", "b": {"n": "v_8", "k": "param"}, "a": {"k": "max", "b": {"n": "v_7", "k": "param"}, "a": {"k": "max", "b": {"n": "v_6", "k": "param"}, "a": {"k": "max", "b": {"n": "v_5", "k": "param"}, "a": {"k": "max", "b": {"n": "v_4", "k": "param"}, "a": {"n": "v_1", "k": "param"}}}}}}}, {"n": "v_2", "k": "param"}, {"k": "max", "b": {"n": "v_8", "k": "param"}, "a": {"k": "max", "b": {"n": "v_3", "k": "param"}, "a": {"n": "v_2", "k": "param"}}}, {"k": "max", "b": {"n": "v_9", "k": "param"}, "a": {"k": "max", "b": {"n": "v_8", "k": "param"}, "a": {"k": "max", "b": {"n": "v_5", "k": "param"}, "a": {"n": "v_4", "k": "param"}}}}, {"n": "v_5", "k": "param"}, {"n": "v_6", "k": "param"}, {"n": "v_7", "k": "param"}, {"n": "v_8", "k": "param"}, {"n": "v_9", "k": "param"}, {"k": "max", "b": {"l": {"n": "v_5", "k": "param"}, "k": "succ"}, "a": {"n": "v_10", "k": "param"}}], "delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Symmetric", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATION_FAILED | function expected\n  @Hf x'"], ["c[ul]", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.proper_sym_impl_iff

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.proper_sym_impl_iff.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Symmetric", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Init.Logic.iff", "Corelib.Program.Basics.impl"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Prop)\nargument has type\n  Type (max v_3 0)\nbut function has type\n  (A : Type v_0) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_1"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Prop)\nargument has type\n  Type (max v_3 0)\nbut function has type\n  (A : Type v_0) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_1"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Prop)\nargument has type\n  Type (max v_3 0)\nbut function has type\n  (A : Type v_0) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_1"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Prop)\nargument has type\n  Type (max v_3 0)\nbut function has type\n  (A : Type v_0) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_1"], ["c[cu,lo]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Prop)\nargument has type\n  Type (max v_3 0)\nbut function has type\n  (A : Type v_0) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_1"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Prop)\nargument has type\n  Type (max v_3 0)\nbut function has type\n  (A : Type v_0) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_1"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.proper_sym_impl_iff_2

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.proper_sym_impl_iff_2.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Symmetric", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Init.Logic.iff", "Corelib.Program.Basics.impl"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → Prop)\nargument has type\n  Type (max v_5 v_7 0)\nbut function has type\n  (A : Type v_0) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_1"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → Prop)\nargument has type\n  Type (max v_5 v_7 0)\nbut function has type\n  (A : Type v_0) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_1"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → Prop)\nargument has type\n  Type (max v_5 v_7 0)\nbut function has type\n  (A : Type v_0) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_1"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → Prop)\nargument has type\n  Type (max v_5 v_7 0)\nbut function has type\n  (A : Type v_0) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_1"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → Prop)\nargument has type\n  Type (max v_5 v_7 0)\nbut function has type\n  (A : Type v_0) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_1"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → Prop)\nargument has type\n  Type (max v_5 v_7 0)\nbut function has type\n  (A : Type v_0) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_1"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.reflexive_eq_dom_reflexive

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.Classes.CMorphisms.reflexive_eq_dom_reflexive；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Reflexive", "Corelib.Classes.CRelationClasses.crelation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.Init.Logic.eq_rect_r__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.reflexive_proper

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.reflexive_proper；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.reflexive_proper_proxy

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.reflexive_proper_proxy；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.respectful

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.respectful；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"poly_level_interp": [{"n": "v_0", "k": "param"}, {"n": "v_1", "k": "param"}, {"n": "v_2", "k": "param"}, {"n": "v_3", "k": "param"}, {"k": "max", "b": {"n": "v_4", "k": "param"}, "a": {"k": "max", "b": {"n": "v_2", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}, {"k": "max", "b": {"n": "v_5", "k": "param"}, "a": {"k": "max", "b": {"n": "v_3", "k": "param"}, "a": {"k": "max", "b": {"n": "v_1", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}}], "delta_inlined": ["Corelib.Classes.CRelationClasses.crelation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → B)\nargument has type\n  Type (max v_0 v_2)\nbut function has type\n  Type v_4 → Type (max v_4 (v_5 + 1))"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → B)\nargument has type\n  Type (max v_0 v_2)\nbut function has type\n  Type v_4 → Type (max v_4 (v_5 + 1))"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → B)\nargument has type\n  Type (max v_0 v_2)\nbut function has type\n  Type v_4 → Type (max v_4 (v_5 + 1))"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → B)\nargument has type\n  Type (max v_0 v_2)\nbut function has type\n  Type v_4 → Type (max v_4 (v_5 + 1))"], ["c[cu,lo]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → B)\nargument has type\n  Type (max v_0 v_2)\nbut function has type\n  Type v_4 → Type (max v_4 (v_5 + 1))"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → B)\nargument has type\n  Type (max v_0 v_2)\nbut function has type\n  Type v_4 → Type (max v_4 (v_5 + 1))"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.respectful' has type\n  (A : Type v_0) → (B : Type v_2) → (A → A → Type v_1) → (B → B → Type v_3) → (A → B) → (A → B) → Type (max v_0 v_1 v_3)\nbut it is expected to have type\n  (A : Type v_0) → (B : Type v_2) → (A → A → Type v_1) → (B → B → Type v_3) → (A → B) → (A → B) → Type v_5"], ["c[it]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.respectful' has type\n  (A : Type v_0) → (B : Type v_2) → (A → A → Type v_1) → (B → B → Type v_3) → (A → B) → (A → B) → Type (max v_0 v_1 v_3)\nbut it is expected to have type\n  (A : Type v_0) → (B : Type v_2) → (A → A → Type v_1) → (B → B → Type v_3) → (A → B) → (A → B) → Type v_5"], ["c[un]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.respectful' has type\n  (A : Type v_0) → (B : Type v_2) → (A → A → Type v_1) → (B → B → Type v_3) → (A → B) → (A → B) → Type (max v_0 v_1 v_3)\nbut it is expected to have type\n  (A : Type v_0) → (B : Type v_2) → (A → A → Type v_1) → (B → B → Type v_3) → (A → B) → (A → B) → Type v_5"], ["c[it,un]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.respectful' has type\n  (A : Type v_0) → (B : Type v_2) → (A → A → Type v_1) → (B → B → Type v_3) → (A → B) → (A → B) → Type (max v_0 v_1 v_3)\nbut it is expected to have type\n  (A : Type v_0) → (B : Type v_2) → (A → A → Type v_1) → (B → B → Type v_3) → (A → B) → (A → B) → Type v_5"], ["c[cu,lo]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.respectful' has type\n  (A : Type v_0) → (B : Type v_2) → (A → A → Type v_1) → (B → B → Type v_3) → (A → B) → (A → B) → Type (max v_0 v_1 v_3)\nbut it is expected to have type\n  (A : Type v_0) → (B : Type v_2) → (A → A → Type v_1) → (B → B → Type v_3) → (A → B) → (A → B) → Type v_5"], ["c[cu,lo,un]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.respectful' has type\n  (A : Type v_0) → (B : Type v_2) → (A → A → Type v_1) → (B → B → Type v_3) → (A → B) → (A → B) → Type (max v_0 v_1 v_3)\nbut it is expected to have type\n  (A : Type v_0) → (B : Type v_2) → (A → A → Type v_1) → (B → B → Type v_3) → (A → B) → (A → B) → Type v_5"], ["c[pl]", 0, "UNSUPPORTED_FEATURE"], ["c[it,pl]", 0, "UNSUPPORTED_FEATURE"], ["c[cu,lo,pl]", 0, "UNSUPPORTED_FEATURE"], ["c[ul]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.respectful_hetero

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.respectful_hetero；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"poly_level_interp": [{"n": "v_0", "k": "param"}, {"n": "v_1", "k": "param"}, {"n": "v_2", "k": "param"}, {"n": "v_3", "k": "param"}, {"n": "v_4", "k": "param"}, {"n": "v_5", "k": "param"}, {"n": "v_6", "k": "param"}, {"k": "max", "b": {"n": "v_7", "k": "param"}, "a": {"k": "max", "b": {"n": "v_6", "k": "param"}, "a": {"k": "max", "b": {"n": "v_5", "k": "param"}, "a": {"k": "max", "b": {"n": "v_2", "k": "param"}, "a": {"n": "v_1", "k": "param"}}}}}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 2, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.respectful_hetero' has type\n  (A : Type v_1) →\n    (B : Type v_2) →\n      (C : A → Type v_3) →\n        (D : B → Type v_4) →\n          (A → B → Type v_5) →\n            ((x : A) → (y : B) → C x → D y → Type v_6) → ((x : A) → C x) → ((x : B) → D x) → Type (max v_1 v_2 v_5 v_6)\nbut it is expected to have type\n  (A : Type v_1) →\n    (B : Type v_2) →\n      (C : A → Type v_3) →\n        (D : B → Type v_4) →\n          (A → B → Type v_5) → ((x : A) → (y : B) → C x → D y → Type v_6) → ((x : A) → C x) → ((x : B) → D x) → Type v_7"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.respectful_hetero' has type\n  (A : Type v_1) →\n    (B : Type v_2) →\n      (C : A → Type v_3) →\n        (D : B → Type v_4) →\n          (A → B → Type v_5) →\n            ((x : A) → (y : B) → C x → D y → Type v_6) → ((x : A) → C x) → ((x : B) → D x) → Type (max v_1 v_2 v_5 v_6)\nbut it is expected to have type\n  (A : Type v_1) →\n    (B : Type v_2) →\n      (C : A → Type v_3) →\n        (D : B → Type v_4) →\n          (A → B → Type v_5) → ((x : A) → (y : B) → C x → D y → Type v_6) → ((x : A) → C x) → ((x : B) → D x) → Type v_7"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.respectful_hetero' has type\n  (A : Type v_1) →\n    (B : Type v_2) →\n      (C : A → Type v_3) →\n        (D : B → Type v_4) →\n          (A → B → Type v_5) →\n            ((x : A) → (y : B) → C x → D y → Type v_6) → ((x : A) → C x) → ((x : B) → D x) → Type (max v_1 v_2 v_5 v_6)\nbut it is expected to have type\n  (A : Type v_1) →\n    (B : Type v_2) →\n      (C : A → Type v_3) →\n        (D : B → Type v_4) →\n          (A → B → Type v_5) → ((x : A) → (y : B) → C x → D y → Type v_6) → ((x : A) → C x) → ((x : B) → D x) → Type v_7"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.respectful_hetero' has type\n  (A : Type v_1) →\n    (B : Type v_2) →\n      (C : A → Type v_3) →\n        (D : B → Type v_4) →\n          (A → B → Type v_5) →\n            ((x : A) → (y : B) → C x → D y → Type v_6) → ((x : A) → C x) → ((x : B) → D x) → Type (max v_1 v_2 v_5 v_6)\nbut it is expected to have type\n  (A : Type v_1) →\n    (B : Type v_2) →\n      (C : A → Type v_3) →\n        (D : B → Type v_4) →\n          (A → B → Type v_5) → ((x : A) → (y : B) → C x → D y → Type v_6) → ((x : A) → C x) → ((x : B) → D x) → Type v_7"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.respectful_hetero' has type\n  (A : Type v_1) →\n    (B : Type v_2) →\n      (C : A → Type v_3) →\n        (D : B → Type v_4) →\n          (A → B → Type v_5) →\n            ((x : A) → (y : B) → C x → D y → Type v_6) → ((x : A) → C x) → ((x : B) → D x) → Type (max v_1 v_2 v_5 v_6)\nbut it is expected to have type\n  (A : Type v_1) →\n    (B : Type v_2) →\n      (C : A → Type v_3) →\n        (D : B → Type v_4) →\n          (A → B → Type v_5) → ((x : A) → (y : B) → C x → D y → Type v_6) → ((x : A) → C x) → ((x : B) → D x) → Type v_7"], ["c[it,cu,lo]", 2, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.respectful_hetero' has type\n  (A : Type v_1) →\n    (B : Type v_2) →\n      (C : A → Type v_3) →\n        (D : B → Type v_4) →\n          (A → B → Type v_5) →\n            ((x : A) → (y : B) → C x → D y → Type v_6) → ((x : A) → C x) → ((x : B) → D x) → Type (max v_1 v_2 v_5 v_6)\nbut it is expected to have type\n  (A : Type v_1) →\n    (B : Type v_2) →\n      (C : A → Type v_3) →\n        (D : B → Type v_4) →\n          (A → B → Type v_5) → ((x : A) → (y : B) → C x → D y → Type v_6) → ((x : A) → C x) → ((x : B) → D x) → Type v_7"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[ul]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.respectful_morphism

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.respectful_morphism；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"poly_level_interp": [{"n": "v_0", "k": "param"}, {"n": "v_1", "k": "param"}, {"k": "max", "b": {"n": "v_9", "k": "param"}, "a": {"k": "max", "b": {"l": {"n": "v_8", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_6", "k": "param"}, "a": {"k": "max", "b": {"n": "v_4", "k": "param"}, "a": {"k": "max", "b": {"n": "v_2", "k": "param"}, "a": {"k": "max", "b": {"l": {"n": "v_15", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_14", "k": "param"}, "a": {"k": "max", "b": {"l": {"n": "v_13", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_11", "k": "param"}, "a": {"k": "max", "b": {"n": "v_1", "k": "param"}, "a": {"l": {"n": "v_0", "k": "param"}, "k": "succ"}}}}}}}}}}}, {"k": "max", "b": {"n": "v_9", "k": "param"}, "a": {"k": "max", "b": {"l": {"n": "v_8", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_7", "k": "param"}, "a": {"k": "max", "b": {"n": "v_5", "k": "param"}, "a": {"k": "max", "b": {"n": "v_4", "k": "param"}, "a": {"k": "max", "b": {"n": "v_3", "k": "param"}, "a": {"k": "max", "b": {"n": "v_15", "k": "param"}, "a": {"k": "max", "b": {"n": "v_14", "k": "param"}, "a": {"k": "max", "b": {"l": {"n": "v_13", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_12", "k": "param"}, "a": {"k": "max", "b": {"n": "v_10", "k": "param"}, "a": {"k": "max", "b": {"n": "v_1", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}}}}}}}}}}}, {"k": "max", "b": {"l": {"n": "v_8", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_4", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}, {"k": "max", "b": {"n": "v_8", "k": "param"}, "a": {"k": "max", "b": {"n": "v_5", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}, {"k": "max", "b": {"n": "v_9", "k": "param"}, "a": {"k": "max", "b": {"l": {"n": "v_8", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_6", "k": "param"}, "a": {"k": "max", "b": {"l": {"n": "v_15", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_14", "k": "param"}, "a": {"k": "max", "b": {"l": {"n": "v_13", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_11", "k": "param"}, "a": {"k": "max", "b": {"n": "v_1", "k": "param"}, "a": {"l": {"n": "v_0", "k": "param"}, "k": "succ"}}}}}}}}}, {"k": "max", "b": {"n": "v_9", "k": "param"}, "a": {"k": "max", "b": {"n": "v_8", "k": "param"}, "a": {"k": "max", "b": {"n": "v_7", "k": "param"}, "a": {"k": "max", "b": {"n": "v_15", "k": "param"}, "a": {"k": "max", "b": {"n": "v_14", "k": "param"}, "a": {"k": "max", "b": {"l": {"n": "v_13", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_12", "k": "param"}, "a": {"k": "max", "b": {"n": "v_10", "k": "param"}, "a": {"k": "max", "b": {"n": "v_1", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}}}}}}}}, {"n": "v_8", "k": "param"}, {"k": "max", "b": {"n": "v_9", "k": "param"}, "a": {"k": "max", "b": {"l": {"n": "v_13", "k": "param"}, "k": "succ"}, "a": {"n": "v_1", "k": "param"}}}, {"k": "max", "b": {"n": "v_13", "k": "param"}, "a": {"k": "max", "b": {"n": "v_10", "k": "param"}, "a": {"n": "v_1", "k": "param"}}}, {"k": "max", "b": {"l": {"n": "v_8", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"l": {"n": "v_15", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_14", "k": "param"}, "a": {"k": "max", "b": {"l": {"n": "v_13", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_11", "k": "param"}, "a": {"k": "max", "b": {"n": "v_1", "k": "param"}, "a": {"l": {"n": "v_0", "k": "param"}, "k": "succ"}}}}}}}, {"k": "max", "b": {"n": "v_8", "k": "param"}, "a": {"k": "max", "b": {"n": "v_15", "k": "param"}, "a": {"k": "max", "b": {"n": "v_14", "k": "param"}, "a": {"k": "max", "b": {"n": "v_13", "k": "param"}, "a": {"k": "max", "b": {"n": "v_12", "k": "param"}, "a": {"k": "max", "b": {"n": "v_1", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}}}}}, {"n": "v_13", "k": "param"}, {"k": "max", "b": {"n": "v_14", "k": "param"}, "a": {"k": "max", "b": {"n": "v_1", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}, {"k": "max", "b": {"n": "v_8", "k": "param"}, "a": {"k": "max", "b": {"n": "v_15", "k": "param"}, "a": {"k": "max", "b": {"n": "v_13", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}}], "type_lift_coercions": 10, "delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.relation_equivalence"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 2, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[it]", 2, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[un]", 1, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[it,un]", 2, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[cu,lo]", 1, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[cu,lo,un]", 2, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[pl]", 2, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[it,pl]", 2, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[cu,lo,pl]", 2, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[ul]", 2, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[it,ul]", 6, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.respectful_per

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.respectful_per；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"poly_level_interp": [{"n": "v_0", "k": "param"}, {"n": "v_1", "k": "param"}, {"k": "max", "b": {"n": "v_2", "k": "param"}, "a": {"k": "max", "b": {"n": "v_1", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}, {"k": "max", "b": {"n": "v_5", "k": "param"}, "a": {"k": "max", "b": {"n": "v_4", "k": "param"}, "a": {"k": "max", "b": {"n": "v_3", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}}, {"n": "v_4", "k": "param"}, {"n": "v_5", "k": "param"}], "type_lift_coercions": 18, "delta_inlined": ["Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PER (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[it]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PER (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PER (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PER (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PER (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PER (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PER (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PER (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[un]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PER (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[it,un]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PER (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[cu,lo]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PER (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[cu,lo,un]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PER (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[pl]", 0, "UNSUPPORTED_FEATURE"], ["c[it,pl]", 1, "UNSUPPORTED_FEATURE"], ["c[cu,lo,pl]", 0, "UNSUPPORTED_FEATURE"], ["c[ul]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.respectful_per_obligation_1

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.respectful_per_obligation_1；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Symmetric", "Corelib.Classes.CRelationClasses.crelation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.Symmetric (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.Symmetric (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[cu]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.Symmetric (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.Symmetric (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[cu,lo]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.Symmetric (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.Symmetric (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.respectful_per_obligation_2

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.respectful_per_obligation_2；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Transitive", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.symmetry", "Corelib.Classes.CRelationClasses.transitivity"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.Transitive (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[it]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.Transitive (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.Transitive (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.Transitive (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[cu,lo]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.Transitive (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.Transitive (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.subrelation_id_proper

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.subrelation_id_proper；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.subrelation", "Corelib.Init.Datatypes.id"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A) (@Rocq.Corelib.Classes.CMorphisms.respectful A A RA RA')\nargument has type\n  (A → A) → (A → A) → Type (max (max (max v_0 v_2) v_3) v_1)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → A) → (A → A) → Type v_1"], ["c[it]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A) (@Rocq.Corelib.Classes.CMorphisms.respectful A A RA RA')\nargument has type\n  (A → A) → (A → A) → Type (max (max (max v_0 v_2) v_3) v_1)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → A) → (A → A) → Type v_1"], ["c[cu]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A) (@Rocq.Corelib.Classes.CMorphisms.respectful A A RA RA')\nargument has type\n  (A → A) → (A → A) → Type (max (max (max v_0 v_2) v_3) v_1)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → A) → (A → A) → Type v_1"], ["c[it,cu]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A) (@Rocq.Corelib.Classes.CMorphisms.respectful A A RA RA')\nargument has type\n  (A → A) → (A → A) → Type (max (max (max v_0 v_2) v_3) v_1)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → A) → (A → A) → Type v_1"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A) (@Rocq.Corelib.Classes.CMorphisms.respectful A A RA RA')\nargument has type\n  (A → A) → (A → A) → Type (max (max (max v_0 v_2) v_3) v_1)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → A) → (A → A) → Type v_1"], ["c[it,cu,lo]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A) (@Rocq.Corelib.Classes.CMorphisms.respectful A A RA RA')\nargument has type\n  (A → A) → (A → A) → Type (max (max (max v_0 v_2) v_3) v_1)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → A) → (A → A) → Type v_1"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.subrelation_proper

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.subrelation_proper；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.subrelation", "Corelib.Classes.Init.Unconvertible"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.Init.Unconvertible (@Rocq.Corelib.Classes.CRelationClasses.crelation A)\nargument has type\n  Type (max v_0 (v_2 + 1))\nbut function has type\n  (A : Type v_1) → A → A → Type"], ["c[it]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.Init.Unconvertible (@Rocq.Corelib.Classes.CRelationClasses.crelation A)\nargument has type\n  Type (max v_0 (v_2 + 1))\nbut function has type\n  (A : Type v_1) → A → A → Type"], ["c[cu]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.Init.Unconvertible (@Rocq.Corelib.Classes.CRelationClasses.crelation A)\nargument has type\n  Type (max v_0 (v_2 + 1))\nbut function has type\n  (A : Type v_1) → A → A → Type"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.Init.Unconvertible (@Rocq.Corelib.Classes.CRelationClasses.crelation A)\nargument has type\n  Type (max v_0 (v_2 + 1))\nbut function has type\n  (A : Type v_1) → A → A → Type"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.Init.Unconvertible (@Rocq.Corelib.Classes.CRelationClasses.crelation A)\nargument has type\n  Type (max v_0 (v_2 + 1))\nbut function has type\n  (A : Type v_1) → A → A → Type"], ["c[it,cu,lo]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.Init.Unconvertible (@Rocq.Corelib.Classes.CRelationClasses.crelation A)\nargument has type\n  Type (max v_0 (v_2 + 1))\nbut function has type\n  (A : Type v_1) → A → A → Type"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.subrelation_refl

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.subrelation_refl；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.subrelation_respectful

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.subrelation_respectful；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.subrelation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.symmetric_equiv_flip

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.symmetric_equiv_flip；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CRelationClasses.Symmetric", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.relation_equivalence"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.trans_co_eq_inv_arrow_morphism

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.trans_co_eq_inv_arrow_morphism；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Transitive", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu,lo]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.trans_co_eq_inv_arrow_morphism_obligation_1

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.trans_co_eq_inv_arrow_morphism_obligation_1；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Transitive", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip", "Corelib.Classes.CRelationClasses.transitivity"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_6) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_6) v_2)"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_6) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_6) v_2)"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_6) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_6) v_2)"], ["c[it,cu]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_6) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_6) v_2)"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_6) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_6) v_2)"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_6) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_6) v_2)"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.trans_co_impl_type_morphism

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.trans_co_impl_type_morphism；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Transitive", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.trans_co_impl_type_morphism_obligation_1

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.trans_co_impl_type_morphism_obligation_1；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Transitive", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.transitivity"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.trans_contra_co_type_morphism

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.trans_contra_co_type_morphism；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Transitive", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.trans_contra_co_type_morphism_obligation_1

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.trans_contra_co_type_morphism_obligation_1；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Transitive", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip", "Corelib.Classes.CRelationClasses.transitivity"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_4) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_4) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[cu]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_4) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_4) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_4) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[it,cu,lo]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_4) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.trans_contra_inv_impl_type_morphism

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.trans_contra_inv_impl_type_morphism；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Transitive", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.trans_contra_inv_impl_type_morphism_obligation_1

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.trans_contra_inv_impl_type_morphism_obligation_1；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Transitive", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip", "Corelib.Classes.CRelationClasses.transitivity"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_6)\nargument has type\n  Type (v_6 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_6) → (B → B → Type v_5) → (A → B) → (A → B) → Type (max (max (max v_0 v_6) v_5) v_2)"], ["c[it]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_6)\nargument has type\n  Type (v_6 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_6) → (B → B → Type v_5) → (A → B) → (A → B) → Type (max (max (max v_0 v_6) v_5) v_2)"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_6)\nargument has type\n  Type (v_6 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_6) → (B → B → Type v_5) → (A → B) → (A → B) → Type (max (max (max v_0 v_6) v_5) v_2)"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_6)\nargument has type\n  Type (v_6 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_6) → (B → B → Type v_5) → (A → B) → (A → B) → Type (max (max (max v_0 v_6) v_5) v_2)"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_6)\nargument has type\n  Type (v_6 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_6) → (B → B → Type v_5) → (A → B) → (A → B) → Type (max (max (max v_0 v_6) v_5) v_2)"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_6)\nargument has type\n  Type (v_6 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_6) → (B → B → Type v_5) → (A → B) → (A → B) → Type (max (max (max v_0 v_6) v_5) v_2)"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.trans_sym_co_inv_impl_type_morphism

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.trans_sym_co_inv_impl_type_morphism；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.trans_sym_co_inv_impl_type_morphism_obligation_1

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.trans_sym_co_inv_impl_type_morphism_obligation_1；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip", "Corelib.Classes.CRelationClasses.symmetry", "Corelib.Classes.CRelationClasses.transitivity"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_6)\nargument has type\n  Type (v_6 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_6) → (B → B → Type v_5) → (A → B) → (A → B) → Type (max (max (max v_0 v_6) v_5) v_2)"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_6)\nargument has type\n  Type (v_6 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_6) → (B → B → Type v_5) → (A → B) → (A → B) → Type (max (max (max v_0 v_6) v_5) v_2)"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_6)\nargument has type\n  Type (v_6 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_6) → (B → B → Type v_5) → (A → B) → (A → B) → Type (max (max (max v_0 v_6) v_5) v_2)"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_6)\nargument has type\n  Type (v_6 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_6) → (B → B → Type v_5) → (A → B) → (A → B) → Type (max (max (max v_0 v_6) v_5) v_2)"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_6)\nargument has type\n  Type (v_6 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_6) → (B → B → Type v_5) → (A → B) → (A → B) → Type (max (max (max v_0 v_6) v_5) v_2)"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_6)\nargument has type\n  Type (v_6 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_6) → (B → B → Type v_5) → (A → B) → (A → B) → Type (max (max (max v_0 v_6) v_5) v_2)"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.trans_sym_contra_arrow_morphism

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.trans_sym_contra_arrow_morphism；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu,lo]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.Classes.CMorphisms.trans_sym_contra_arrow_morphism_obligation_1

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.Classes.CMorphisms.trans_sym_contra_arrow_morphism_obligation_1；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"delta_inlined": ["Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip", "Corelib.Classes.CRelationClasses.symmetry", "Corelib.Classes.CRelationClasses.transitivity"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[it,cu]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

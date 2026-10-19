Corelib.ssr.ssrbool

原文件：/home/shunqwang4/.opam/rocq930-mc/lib/coq/theories/ssr/ssrbool.v
冻结运行：/home/shunqwang4/research/rocq-core/experiments/mechanical-nat-eq-20261019/runs/full-v1/Corelib/ssr/ssrbool
原始根声明：451；当前受阻：0；检查：{'roundtrip_exit': 0, 'roundtrip': 'OK', 'translate_exit': 0, 'consumer_exit': 0, 'audit_exit': 0, 'consumer': 'OK', 'audit': 'OK'}。

[Rocq 源文件](ssrbool.v) · [Lean 入口](ssrbool.lean) · [Lean 打印结果](ssrbool.txt) · [逐项完整记录](ssrbool.json)

---

Corelib.ssr.ssrbool.ApplicativePred

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.ApplicativePred；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"universe_lowered": true}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[un]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,un]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,cu]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu,lo]", 0, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.ApplicativePred__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.DefaultKeying.default_keyed_pred

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.DefaultKeying.default_keyed_pred；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"universe_lowered": true}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1345"], ["c[]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1359"], ["c[it]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1359; the argument must be the same, not u_Corelib_ssr_ssrbool_1359"], ["c[cu]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1359"], ["c[it,cu]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1359; the argument must be the same, not u_Corelib_ssr_ssrbool_1359"], ["c[cu,lo]", 0, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.KeyedPred__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.DefaultKeying.default_keyed_qualifier

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.DefaultKeying.default_keyed_qualifier；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.1362"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.KeyedQualifier__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.KeyedPred

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.KeyedPred；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"universe_lowered": true}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.KeyedPred__rocq2lean_obligation_1.statement: coherence: source level Corelib.ssr.ssrbool.1345 is a motive level of the referring declaration but not of the referenced one"], ["c[]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1345"], ["c[it]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1345; the argument must be the same, not u_Corelib_ssr_ssrbool_1345"], ["c[un]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1345"], ["c[it,un]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1345; the argument must be the same, not u_Corelib_ssr_ssrbool_1345"], ["c[cu]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1345"], ["c[it,cu]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1345; the argument must be the same, not u_Corelib_ssr_ssrbool_1345"], ["c[cu,lo]", 1, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.KeyedPred__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.KeyedQualifier

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.KeyedQualifier；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.keyed_qualifier: coherence: source level Corelib.ssr.ssrbool.1348 is a motive level of the referring declaration but not of the referenced one"], ["c[]", 2, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.KeyedQualifier__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.PredOfSimpl.coerce

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1163 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1163 does not hold for the solution"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.SimplPred

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.SimplPred；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1129 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1129 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.SimplRel

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.SimplRel；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1179 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1179 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.addFb

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.addFb.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.addIb

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.addIb.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.addKb

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.addKb.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.addNb

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.addNb.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.addTb

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.addTb.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.addb

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.addb；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.addbA

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.addbA.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.addbAC

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.addbAC.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.addbACA

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.addbACA.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.addbC

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.addbC.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.addbCA

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.addbCA.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.addbF

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.addbF.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.addbI

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.addbI.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.addbK

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.addbK.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.addbN

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.addbN.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.addbP

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.addbP；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（4）：Corelib.ssr.ssrbool.not_false_is_true, Corelib.ssr.ssrbool.addbP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.addbP__rocq2lean_obligation_2, Corelib.ssr.ssrbool.addbP__rocq2lean_obligation_3。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.addbT

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.addbT.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.addbb

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.addbb.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.all_and2

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.all_and2；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.535"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.all_and2__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.all_and3

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.all_and3；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.535"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.all_and3__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.all_and4

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.all_and4；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.535"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.all_and4__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.all_and5

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.all_and5；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.535"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.all_and5__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.all_sig2_cond

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.all_sig2_cond；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 3, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1449 solved as (some (u_Corelib_ssr_ssrbool_1105 + 1)): native fact Corelib.ssr.ssrbool.1449 le Corelib.ssr.ssrbool.1436 does not hold for the solution"], ["c[]", 3, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（6）：Corelib.ssr.ssrfun.tag_of_sig__rocq2lean_obligation_1, Corelib.ssr.ssrbool.all_tag_cond_dep__rocq2lean_obligation_1, Corelib.ssr.ssrbool.all_tag_cond_dep__rocq2lean_obligation_2, Corelib.ssr.ssrfun.sig_of_sig2__rocq2lean_obligation_1, Corelib.ssr.ssrbool.all_sig2_cond__rocq2lean_obligation_1, Corelib.ssr.ssrbool.all_sig2_cond__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.all_sig_cond

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.all_sig_cond；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1436 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1436 does not hold for the solution"], ["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（3）：Corelib.ssr.ssrfun.tag_of_sig__rocq2lean_obligation_1, Corelib.ssr.ssrbool.all_tag_cond_dep__rocq2lean_obligation_1, Corelib.ssr.ssrbool.all_tag_cond_dep__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.all_sig_cond_dep

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.all_sig_cond_dep；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"type_lift_coercions": 3, "delta_inlined": ["Corelib.Init.Datatypes.is_true", "Corelib.ssr.ssrbool.pred"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 2, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1412 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1412 does not hold for the solution"], ["c[]", 2, "UNIVERSE_REJECTED | reference to RocqPending.Corelib.ssr.ssrfun.tag_of_sig: coherence: source level Corelib.ssr.ssrfun.292 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrfun.292, not u_Corelib_ssr_ssrfun_292"], ["c[it]", 2, "UNIVERSE_REJECTED | reference to RocqPending.Corelib.ssr.ssrfun.tag_of_sig: coherence: source level Corelib.ssr.ssrfun.292 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1418 u_Corelib_ssr_ssrfun_292; the argument must be the same, not max u_Corelib_ssr_ssrbool_1418 u_Corelib_ssr_ssrfun_292"], ["c[cu]", 2, "UNIVERSE_REJECTED | reference to RocqPending.Corelib.ssr.ssrfun.tag_of_sig: coherence: source level Corelib.ssr.ssrfun.292 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrfun.292, not u_Corelib_ssr_ssrfun_292"], ["c[it,cu]", 2, "UNIVERSE_REJECTED | reference to RocqPending.Corelib.ssr.ssrfun.tag_of_sig: coherence: source level Corelib.ssr.ssrfun.292 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1418 u_Corelib_ssr_ssrfun_292; the argument must be the same, not max u_Corelib_ssr_ssrbool_1418 u_Corelib_ssr_ssrfun_292"], ["c[cu,lo]", 4, "UNIVERSE_REJECTED | defaulted universe level(s) [u_residual_0] not justified: the declaration is not valid for every value ((kernel) application type mismatch\n  @RocqPending.Corelib.ssr.ssrbool.all_tag_cond_dep h_Corelib_ssr_ssrbool_all_tag_cond_dep__rocq2lean_obligation_1\n    h_Corelib_ssr_ssrbool_all_tag_cond_dep__rocq2lean_obligation_2 I T C fun x x_1 => (fun y => P x y) x_1\nargument has type\n  (x : I) → T x → Prop\nbut function has type\n  (U : (x : I) → T x → Type u_residual_0) →\n    ((x : I) → T x) →\n      ((x : I) → Rocq.Corelib.Init.Datatypes.is_true (@C x) → @Rocq.Corelib.Init.Specif.sigT (T x) fun y => U "], ["c[it,cu,lo]", 4, "KERNEL_REJECTED | (kernel) application type mismatch\n  @RocqPending.Corelib.ssr.ssrbool.all_tag_cond_dep h_Corelib_ssr_ssrbool_all_tag_cond_dep__rocq2lean_obligation_1\n    h_Corelib_ssr_ssrbool_all_tag_cond_dep__rocq2lean_obligation_2 I T C fun x x_1 => (fun y => P x y) x_1\nargument has type\n  (x : I) → T x → Prop\nbut function has type\n  (U : (x : I) → T x → Type u_Corelib_ssr_ssrbool_1374) →\n    ((x : I) → T x) →\n      ((x : I) → Rocq.Corelib.Init.Datatypes.is_true (@C x) → @Rocq.Corelib.Init.Specif.sigT (T x) fun y => U x y) →\n        @Rocq.Corelib.Init.Specif.sigT ((x : I) → T x) fun f =>\n          (x : I) →"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 2, "UNIVERSE_REJECTED | reference to RocqPending.Corelib.ssr.ssrfun.tag_of_sig: coherence: source level Corelib.ssr.ssrfun.292 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrfun.292, not u_Corelib_ssr_ssrfun_292"], ["c[it]", 3, "UNIVERSE_REJECTED | reference to RocqPending.Corelib.ssr.ssrfun.tag_of_sig: coherence: source level Corelib.ssr.ssrfun.292 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1418 u_Corelib_ssr_ssrfun_292; the argument must be the same, not max u_Corelib_ssr_ssrbool_1418 u_Corelib_ssr_ssrfun_292"], ["c[un]", 2, "UNIVERSE_REJECTED | reference to RocqPending.Corelib.ssr.ssrfun.tag_of_sig: coherence: source level Corelib.ssr.ssrfun.292 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrfun.292, not u_Corelib_ssr_ssrfun_292"], ["c[it,un]", 2, "UNIVERSE_REJECTED | reference to RocqPending.Corelib.ssr.ssrfun.tag_of_sig: coherence: source level Corelib.ssr.ssrfun.292 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1418 u_Corelib_ssr_ssrfun_292; the argument must be the same, not max u_Corelib_ssr_ssrbool_1418 u_Corelib_ssr_ssrfun_292"], ["c[cu,lo]", 4, "UNIVERSE_REJECTED | defaulted universe level(s) [u_residual_0] not justified: the declaration is not valid for every value ((kernel) application type mismatch\n  @RocqPending.Corelib.ssr.ssrbool.all_tag_cond_dep h_Corelib_ssr_ssrbool_all_tag_cond_dep__rocq2lean_obligation_1\n    h_Corelib_ssr_ssrbool_all_tag_cond_dep__rocq2lean_obligation_2 I T C fun x x_1 => (fun y => P x y) x_1\nargument has type\n  (x : I) → T x → Prop\nbut function has type\n  (U : (x : I) → T x → Type u_residual_0) →\n    ((x : I) → T x) →\n      ((x : I) → Rocq.Corelib.Init.Datatypes.is_true (C x) → @Rocq.Corelib.Init.Specif.sigT (T x) fun y => U x"], ["c[cu,lo,un]", 4, "UNIVERSE_REJECTED | defaulted universe level(s) [u_residual_0] not justified: the declaration is not valid for every value ((kernel) application type mismatch\n  @RocqPending.Corelib.ssr.ssrbool.all_tag_cond_dep h_Corelib_ssr_ssrbool_all_tag_cond_dep__rocq2lean_obligation_1\n    h_Corelib_ssr_ssrbool_all_tag_cond_dep__rocq2lean_obligation_2 I T C fun x x_1 => (fun y => P x y) x_1\nargument has type\n  (x : I) → T x → Prop\nbut function has type\n  (U : (x : I) → T x → Type u_residual_0) →\n    ((x : I) → T x) →\n      ((x : I) → Rocq.Corelib.Init.Datatypes.is_true (C x) → @Rocq.Corelib.Init.Specif.sigT (T x) fun y => U x"], ["c[pl]", 2, "UNSUPPORTED_FEATURE"], ["c[it,pl]", 1, "UNSUPPORTED_FEATURE"], ["c[cu,lo,pl]", 1, "UNSUPPORTED_FEATURE"], ["c[ul]", 5, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（3）：Corelib.ssr.ssrfun.tag_of_sig__rocq2lean_obligation_1, Corelib.ssr.ssrbool.all_tag_cond_dep__rocq2lean_obligation_1, Corelib.ssr.ssrbool.all_tag_cond_dep__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.all_tag_cond

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.all_tag_cond；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1397 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1397 does not hold for the solution"], ["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.all_tag_cond_dep__rocq2lean_obligation_1, Corelib.ssr.ssrbool.all_tag_cond_dep__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.all_tag_cond_dep

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.all_tag_cond_dep；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 2, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrfun.all_tag: argument u_Corelib_ssr_ssrbool_1105 + 1: Corelib.ssr.ssrbool.1105 + 1 ≤ Corelib.ssr.ssrfun.225 is not entailed by the source universe graph, nor is Corelib.ssr.ssrfun.225 ≤ Corelib.ssr.ssrbool.1105 (with offset 0)"], ["c[]", 4, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.all_tag_cond_dep__rocq2lean_obligation_1, Corelib.ssr.ssrbool.all_tag_cond_dep__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.altP

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.altP；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.altP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.altP__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.alt_spec

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.alt_spec；目标声明种类：inductive。
- 源端种类：inductive / inductive。
- 分派规则：inductive/generated；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["i[pl]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.and3

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.and3；目标声明种类：inductive。
- 源端种类：inductive / inductive。
- 分派规则：inductive/generated；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["i[pl]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.and3P

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.and3P；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（8）：Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_1, Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_2, Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_3, Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_4, Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_5, Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_6, Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_7, Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_8。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.and3_ind

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.and3_ind.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.and3_rec

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.and3_rec；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.and3_rect

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.and3_rect；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.523"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.and3_sind

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.and3_sind.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.and4

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.and4；目标声明种类：inductive。
- 源端种类：inductive / inductive。
- 分派规则：inductive/generated；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["i[pl]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.and4P

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.and4P；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 2, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（16）：Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_1, Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_2, Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_3, Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_4, Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_5, Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_6, Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_7, Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_8, Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_9, Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_10, Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_11, Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_12, Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_13, Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_14, Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_15, Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_16。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.and4_ind

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.and4_ind.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.and4_rec

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.and4_rec；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.and4_rect

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.and4_rect；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.525"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.and4_sind

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.and4_sind.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.and5

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.and5；目标声明种类：inductive。
- 源端种类：inductive / inductive。
- 分派规则：inductive/generated；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["i[pl]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.and5P

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.and5P；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 4, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（32）：Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_1, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_2, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_3, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_4, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_5, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_6, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_7, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_8, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_9, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_10, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_11, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_12, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_13, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_14, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_15, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_16, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_17, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_18, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_19, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_20, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_21, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_22, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_23, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_24, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_25, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_26, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_27, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_28, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_29, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_30, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_31, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_32。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.and5_ind

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.and5_ind.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.and5_rec

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.and5_rec；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.and5_rect

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.and5_rect；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.527"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.and5_sind

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.and5_sind.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.andFb

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.andFb.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.andKb

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.andKb.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.andNb

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.andNb.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.andP

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.andP；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（4）：Corelib.ssr.ssrbool.andP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.andP__rocq2lean_obligation_2, Corelib.ssr.ssrbool.andP__rocq2lean_obligation_3, Corelib.ssr.ssrbool.andP__rocq2lean_obligation_4。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.andPP

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.andPP；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（7）：Corelib.ssr.ssrbool.andP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.andP__rocq2lean_obligation_2, Corelib.ssr.ssrbool.andP__rocq2lean_obligation_3, Corelib.ssr.ssrbool.andP__rocq2lean_obligation_4, Corelib.ssr.ssrbool.andPP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.andPP__rocq2lean_obligation_2, Corelib.ssr.ssrbool.iffP__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.andTb

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.andTb.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.andbA

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.andbA.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.andbAC

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.andbAC.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.andbACA

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.andbACA.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.andbC

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.andbC.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.andbCA

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.andbCA.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.andbF

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.andbF.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.andbK

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.andbK.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.andbN

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.andbN.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.andbT

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.andbT.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.andb_addl

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.andb_addl.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.andb_addr

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.andb_addr.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.andb_id2l

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.andb_id2l.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.andb_id2r

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.andb_id2r.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.andb_idl

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.andb_idl.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.andb_idr

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.andb_idr.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.andb_orl

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.andb_orl.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.andb_orr

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.andb_orr.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.andbb

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.andbb.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.antisymmetric

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.antisymmetric；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.1473"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.appP

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.appP.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.app_predE

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.app_predE.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"universe_lowered": true}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[un] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,un] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,cu] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu,lo] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.applicative_mem_pred

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.applicative_mem_pred；目标声明种类：inductive。
- 源端种类：inductive / inductive。
- 分派规则：inductive/generated-levels；实际启用机制：{"universe_lowered": true, "sort_interp": true}。
- 尝试顺序（标签、毫秒、结果）：[["i[di]", 0, "DISCOVERED"], ["i[pl]", 0, "KERNEL_REJECTED"], ["i[pl,un]", 1, "UNIVERSE_REJECTED"], ["i[]", 0, "KERNEL_REJECTED"], ["i[un]", 0, "UNIVERSE_REJECTED"], ["i[lo,pl,un]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.applicative_mem_pred_value

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.applicative_mem_pred_value；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"universe_lowered": true}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[un]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,un]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,cu]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu,lo]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.applicative_pred

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.applicative_pred；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.1245"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.applicative_pred_applicative

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.applicative_pred_applicative；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.ApplicativePred__rocq2lean_obligation_1.statement: argument u_Corelib_ssr_ssrbool_1249 + 1: Corelib.ssr.ssrbool.1249 + 1 ≤ Corelib.ssr.ssrbool.1105 is not entailed by the source universe graph, nor is Corelib.ssr.ssrbool.1105 ≤ Corelib.ssr.ssrbool.1249 (with offset 0)"], ["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.ApplicativePred__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.applicative_pred_of_simpl

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.applicative_pred_of_simpl；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1249 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1249 does not hold for the solution"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.applicative_pred_value

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.applicative_pred_value；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"universe_lowered": true}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[un]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,un]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,cu]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu,lo]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.bijective_in

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.bijective_in；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1700 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1700 does not hold for the solution"], ["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（3）：Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_2, Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_3。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.bijective_on

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.bijective_on；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1706 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1706 does not hold for the solution"], ["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（3）：Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_1, Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_2, Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_3。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.bind_unless

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.bind_unless；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.395", "Corelib.ssr.ssrbool.396", "Corelib.ssr.ssrbool.398"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.bind_unless__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.boolP

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.boolP；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（4）：Corelib.ssr.ssrbool.is_true_true, Corelib.ssr.ssrbool.not_false_is_true, Corelib.ssr.ssrbool.altP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.altP__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.boolfunPredType

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.boolfunPredType；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.1124"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.canLR_in

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.canLR_in.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 5, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.canLR_in__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.canLR_on

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.canLR_on.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 6, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.canLR_on__rocq2lean_obligation_1, Corelib.ssr.ssrbool.canLR_on__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.canRL_in

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.canRL_in.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 4, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.canRL_in__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.canRL_on

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.canRL_on.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 5, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.canRL_on__rocq2lean_obligation_1, Corelib.ssr.ssrbool.canRL_on__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.can_in_comp

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.can_in_comp.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo3", 2, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2039 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.2039 does not hold for the solution"], ["c[] eo3", 10, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（3）：Corelib.ssr.ssrbool.can_in_comp__rocq2lean_obligation_1, Corelib.ssr.ssrbool.can_in_comp__rocq2lean_obligation_2, Corelib.ssr.ssrbool.can_in_comp__rocq2lean_obligation_3。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.can_in_inj

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.can_in_inj.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 4, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.can_in_inj__rocq2lean_obligation_1, Corelib.ssr.ssrbool.can_in_inj__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.can_in_pcan

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.can_in_pcan.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2006 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.2006 does not hold for the solution"], ["c[] eo2", 4, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.can_in_pcan__rocq2lean_obligation_1, Corelib.ssr.ssrbool.can_in_pcan__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.can_mono

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.can_mono.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2175 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.2175 does not hold for the solution"], ["c[] eo2", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.can_mono_in

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.can_mono_in.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 12, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（3）：Corelib.ssr.ssrbool.can_mono_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.can_mono_in__rocq2lean_obligation_2, Corelib.ssr.ssrbool.can_mono_in__rocq2lean_obligation_3。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.check_applicative_mem_pred

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.check_applicative_mem_pred；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1105", "copies": ["Corelib.ssr.ssrbool.1105__c0", "Corelib.ssr.ssrbool.1105__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.classicP

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.classicP.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.classicW

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.classicW.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.432"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.classic_EM

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.classic_EM.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.classic_bind

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.classic_bind.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.435", "Corelib.ssr.ssrbool.436"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.classic_ex

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.classic_ex.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.512"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.classic_imply

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.classic_imply.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.classically: argument imax u_Corelib_ssr_ssrbool_481 u_Corelib_ssr_ssrbool_482 for Corelib.ssr.ssrbool.417 is outside the supported level fragment"], ["c[] eo2", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.classic_pick

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.classic_pick.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.458"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.classic_sigW

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.classic_sigW.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.498"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.classically

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.classically；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.417"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.clone_pred

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.clone_pred；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"universe_lowered": true}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1116 solved as (some (u_Corelib_ssr_ssrbool_1110__c1 + 1)): native fact Set lt Corelib.ssr.ssrbool.1116 does not hold for the solution"], ["c[]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.predType: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1116"], ["c[it]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.predType: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max (max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1115) u_Corelib_ssr_ssrbool_1116; the argument must be the same, not u_Corelib_ssr_ssrbool_1116"], ["c[cu]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.predType: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1116"], ["c[it,cu]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.predType: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max (max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1115) u_Corelib_ssr_ssrbool_1116; the argument must be the same, not u_Corelib_ssr_ssrbool_1116"], ["c[cu,lo]", 4, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.collective_pred

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.collective_pred；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.1247"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.collective_pred_of_simpl

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.collective_pred_of_simpl；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1251 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1251 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.contra

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.contra.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.contraFF

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.contraFF.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.contraFN

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.contraFN.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.contraFT

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.contraFT.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.contraFnot

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.contraFnot.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.contraL

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.contraL.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.contraLR

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.contraLR.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.contraNF

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.contraNF.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.contraNN

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.contraNN.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.contraNT

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.contraNT.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.contraNnot

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.contraNnot.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.contraPF

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.contraPF.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.contraPN

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.contraPN.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.contraPT

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.contraPT.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.contraPnot

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.contraPnot.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.contraR

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.contraR.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.contraT

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.contraT.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.contraTF

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.contraTF.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.contraTN

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.contraTN.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.contraTT

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.contraTT.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.contraTnot

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.contraTnot.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.contra_not

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.contra_not.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.contra_notF

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.contra_notF.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.contra_notN

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.contra_notN.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.contra_notT

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.contra_notT.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.decP

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.decP；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.decP__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.decPcases

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.decPcases.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.decidable

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.decidable；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.elimF

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.elimF.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.elimFn

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.elimFn.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.elimN

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.elimN.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.elimNTF

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.elimNTF.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.elimNf

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.elimNf.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.elimT

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.elimT.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.elimTF

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.elimTF.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.elimTFn

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.elimTFn.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.elimTn

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.elimTn.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.eq_mem

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.eq_mem；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1221 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1221 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.eqbLR

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.eqbLR.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.eqbRL

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.eqbRL.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.equivP

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.equivP；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.iffP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.equivP__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.equivPif

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.equivPif.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.equivPifn

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.equivPifn.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.equivalence_rel

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.equivalence_rel；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.1473"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.equivalence_relP

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.equivalence_relP.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.left_transitive: coherence: source level Corelib.ssr.ssrbool.1473 is a motive level of the referring declaration but not of the referenced one"], ["c[] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.equivalence_relP_in

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.equivalence_relP_in.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2161 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.2161 does not hold for the solution"], ["c[] eo1", 5, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（4）：Corelib.ssr.ssrbool.equivalence_relP_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.equivalence_relP_in__rocq2lean_obligation_2, Corelib.ssr.ssrbool.equivalence_relP_in__rocq2lean_obligation_3, Corelib.ssr.ssrbool.equivalence_relP_in__rocq2lean_obligation_4。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.expose_mem_pred

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.expose_mem_pred；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"universe_lowered": true}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[un]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,un]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,cu]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu,lo]", 0, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.expose_mem_pred__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.expose_simpl_pred

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.expose_simpl_pred；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.manifest_simpl_pred: coherence: source level Corelib.ssr.ssrbool.1253 is a motive level of the referring declaration but not of the referenced one"], ["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.expose_simpl_pred__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.forE

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.forE.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.1531"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.fun_if

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.fun_if.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.178", "Corelib.ssr.ssrbool.179"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.fun_of_pred

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.fun_of_pred；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a motive level of the referring declaration but not of the referenced one"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.fun_of_rel

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.fun_of_rel；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.1171"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.has_quality

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.has_quality；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.1336"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.homoLR

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.homoLR.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2175 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.2175 does not hold for the solution"], ["c[] eo2", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.homoLR_in

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.homoLR_in.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 12, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（3）：Corelib.ssr.ssrbool.homoLR_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.homoLR_in__rocq2lean_obligation_2, Corelib.ssr.ssrbool.homoLR_in__rocq2lean_obligation_3。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.homoRL

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.homoRL.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2175 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.2175 does not hold for the solution"], ["c[] eo2", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.homoRL_in

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.homoRL_in.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 12, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（3）：Corelib.ssr.ssrbool.homoRL_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.homoRL_in__rocq2lean_obligation_2, Corelib.ssr.ssrbool.homoRL_in__rocq2lean_obligation_3。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.homo_mono

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.homo_mono.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2175 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.2175 does not hold for the solution"], ["c[] eo2", 3, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.homo_mono_in

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.homo_mono_in.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 13, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（4）：Corelib.ssr.ssrbool.homo_mono_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.homo_mono_in__rocq2lean_obligation_2, Corelib.ssr.ssrbool.homo_mono_in__rocq2lean_obligation_3, Corelib.ssr.ssrbool.homo_mono_in__rocq2lean_obligation_4。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.homo_sym

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.homo_sym.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2262 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.2262 does not hold for the solution"], ["c[] eo2", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.homo_sym_in

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.homo_sym_in.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2262 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.2262 does not hold for the solution"], ["c[] eo2", 3, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.homo_sym_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.homo_sym_in__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.homo_sym_in11

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.homo_sym_in11.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2262 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.2262 does not hold for the solution"], ["c[] eo2", 5, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.homo_sym_in11__rocq2lean_obligation_1, Corelib.ssr.ssrbool.homo_sym_in11__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.idP

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.idP；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.is_true_true, Corelib.ssr.ssrbool.not_false_is_true。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.idPn

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.idPn；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.not_false_is_true, Corelib.ssr.ssrbool.is_true_true。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.ifE

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.ifE.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.178"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.ifF

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.ifF.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.178"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.ifN

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.ifN.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.178"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.ifP

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.ifP；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.if_spec: coherence: source level Corelib.ssr.ssrbool.178 is a motive level of the referring declaration but not of the referenced one"], ["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.ifP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.ifP__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.ifPn

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.ifPn；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.if_spec: coherence: source level Corelib.ssr.ssrbool.178 is a motive level of the referring declaration but not of the referenced one"], ["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（3）：Corelib.ssr.ssrbool.ifPn__rocq2lean_obligation_1, Corelib.ssr.ssrbool.is_true_true, Corelib.ssr.ssrbool.ifPn__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.ifT

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.ifT.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.178"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.if_arg

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.if_arg.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.178", "Corelib.ssr.ssrbool.179"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.if_expr

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.if_expr；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.178"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.if_neg

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.if_neg.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.178"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.if_same

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.if_same.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.178"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.if_spec

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.if_spec；目标声明种类：inductive。
- 源端种类：inductive / inductive。
- 分派规则：inductive/generated-levels；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["i[pl]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.iffP

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.iffP；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.iffP__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.implies

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.implies；目标声明种类：inductive。
- 源端种类：inductive / inductive。
- 分派规则：inductive/generated-template；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["i[pl]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.impliesP

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.impliesP；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.342", "Corelib.ssr.ssrbool.343"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.impliesPn

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.impliesPn.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.implyFb

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.implyFb.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.implyNb

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.implyNb.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.implyP

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.implyP；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（4）：Corelib.ssr.ssrbool.implyP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.implyP__rocq2lean_obligation_2, Corelib.ssr.ssrbool.implyP__rocq2lean_obligation_3, Corelib.ssr.ssrbool.implyP__rocq2lean_obligation_4。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.implyPP

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.implyPP；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（7）：Corelib.ssr.ssrbool.implyP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.implyP__rocq2lean_obligation_2, Corelib.ssr.ssrbool.implyP__rocq2lean_obligation_3, Corelib.ssr.ssrbool.implyP__rocq2lean_obligation_4, Corelib.ssr.ssrbool.implyPP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.implyPP__rocq2lean_obligation_2, Corelib.ssr.ssrbool.iffP__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.implyTb

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.implyTb.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.implybE

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.implybE.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.implybF

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.implybF.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.implybN

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.implybN.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.implybNN

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.implybNN.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.implybT

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.implybT.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.implyb_id2l

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.implyb_id2l.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.implyb_idl

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.implyb_idl.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.implyb_idr

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.implyb_idr.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.implybb

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.implybb.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.in1T

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.in1T.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.in1T__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.in1W

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.in1W.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 3, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.in1W__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.in1_sig

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.in1_sig.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2085 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.2085 does not hold for the solution"], ["c[] eo1", 2, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.in1_sig__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.in2T

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.in2T.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 3, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.in2T__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.in2W

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.in2W.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 4, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.in2W__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.in2_sig

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.in2_sig.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2085 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.2085 does not hold for the solution"], ["c[] eo2", 4, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.in2_sig__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.in3T

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.in3T.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1", "Corelib.ssr.ssrbool.1169__c2"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 4, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.in3T__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.in3W

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.in3W.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1", "Corelib.ssr.ssrbool.1169__c2"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 6, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.in3W__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.in3_sig

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.in3_sig.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo3", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2085 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.2085 does not hold for the solution"], ["c[] eo3", 6, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.in3_sig__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.inE

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.inE.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"universe_lowered": true}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[un] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,un] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,cu] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu,lo] eo1", 5, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.inPhantom

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.inPhantom.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.inT_bij

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.inT_bij.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 3, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（3）：Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_2, Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_3。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.inW_bij

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.inW_bij.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 3, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（3）：Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_2, Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_3。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.in_applicative

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.in_applicative.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"universe_lowered": true}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.applicative_mem_pred: coherence: source level Corelib.ssr.ssrbool.1253 is a motive level of the referring declaration but not of the referenced one"], ["c[] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[un] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,un] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,cu] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu,lo] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.in_collective

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.in_collective.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[] eo1", 3, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.in_inj_comp

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.in_inj_comp.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo3", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2022 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.2022 does not hold for the solution"], ["c[] eo3", 9, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（3）：Corelib.ssr.ssrbool.in_inj_comp__rocq2lean_obligation_1, Corelib.ssr.ssrbool.in_inj_comp__rocq2lean_obligation_2, Corelib.ssr.ssrbool.in_inj_comp__rocq2lean_obligation_3。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.in_mem

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.in_mem；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1215 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1215 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.in_on1P

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.in_on1P.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 8, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.in_on1P__rocq2lean_obligation_1, Corelib.ssr.ssrbool.in_on1P__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.in_on1S

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.in_on1S.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 5, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.in_on1S__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.in_on1W

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.in_on1W.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 4, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.in_on1W__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.in_on1lP

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.in_on1lP.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1", "Corelib.ssr.ssrbool.1169__c2"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 8, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.in_on1lP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.in_on1lP__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.in_on1lS

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.in_on1lS.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1", "Corelib.ssr.ssrbool.1169__c2"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 5, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.in_on1lS__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.in_on1lW

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.in_on1lW.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1", "Corelib.ssr.ssrbool.1169__c2"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 5, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.in_on1lW__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.in_on2P

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.in_on2P.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 9, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.in_on2P__rocq2lean_obligation_1, Corelib.ssr.ssrbool.in_on2P__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.in_on2S

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.in_on2S.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 6, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.in_on2S__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.in_on2W

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.in_on2W.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 6, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.in_on2W__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.in_onS_can

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.in_onS_can.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 5, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.in_onS_can__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.in_onW_can

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.in_onW_can.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 5, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.in_onW_can__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.in_simpl

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.in_simpl.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.inj_can_sym_in

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.inj_can_sym_in.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 10, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（4）：Corelib.ssr.ssrbool.inj_can_sym_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.inj_can_sym_in__rocq2lean_obligation_2, Corelib.ssr.ssrbool.inj_can_sym_in__rocq2lean_obligation_3, Corelib.ssr.ssrbool.inj_can_sym_in__rocq2lean_obligation_4。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.inj_can_sym_in_on

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.inj_can_sym_in_on.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 14, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（3）：Corelib.ssr.ssrbool.inj_can_sym_in_on__rocq2lean_obligation_1, Corelib.ssr.ssrbool.inj_can_sym_in_on__rocq2lean_obligation_2, Corelib.ssr.ssrbool.inj_can_sym_in_on__rocq2lean_obligation_3。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.inj_can_sym_on

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.inj_can_sym_on.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 8, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（5）：Corelib.ssr.ssrbool.inj_can_sym_on__rocq2lean_obligation_1, Corelib.ssr.ssrbool.inj_can_sym_on__rocq2lean_obligation_2, Corelib.ssr.ssrbool.inj_can_sym_on__rocq2lean_obligation_3, Corelib.ssr.ssrbool.inj_can_sym_on__rocq2lean_obligation_4, Corelib.ssr.ssrbool.inj_can_sym_on__rocq2lean_obligation_5。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.introF

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.introF.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.introFn

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.introFn.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.introN

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.introN.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.introNTF

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.introNTF.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.introNf

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.introNf.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.introP

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.introP；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.is_true_true。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.introT

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.introT.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.introTF

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.introTF.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.introTFn

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.introTFn.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.introTn

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.introTn.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.irreflexive

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.irreflexive；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.1473"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.isSome

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.isSome；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.159"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.isT

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.isT.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.is_inl

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.is_inl；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.164", "Corelib.ssr.ssrbool.165"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.is_inleft

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.is_inleft；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.174"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.is_left

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.is_left；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.is_true_locked_true

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.is_true_locked_true.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.is_true_true

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.is_true_true.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.keyed_mem

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.keyed_mem；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1110", "copies": ["Corelib.ssr.ssrbool.1110__c0", "Corelib.ssr.ssrbool.1110__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1345 solved as (some (u_Corelib_ssr_ssrbool_1110__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.1345 does not hold for the solution"], ["c[]", 2, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.keyed_mem__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.keyed_mem_simpl

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.keyed_mem_simpl；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1110", "copies": ["Corelib.ssr.ssrbool.1110__c0", "Corelib.ssr.ssrbool.1110__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1345 solved as (some (u_Corelib_ssr_ssrbool_1110__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.1345 does not hold for the solution"], ["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.keyed_mem_simpl__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.keyed_pred

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.keyed_pred；目标声明种类：inductive。
- 源端种类：inductive / inductive。
- 分派规则：inductive/generated-levels；实际启用机制：{"universe_lowered": true, "sort_interp": true}。
- 尝试顺序（标签、毫秒、结果）：[["i[di]", 0, "DISCOVERED"], ["i[pl]", 5, "KERNEL_REJECTED"], ["i[pl,un]", 0, "UNIVERSE_REJECTED"], ["i[]", 4, "KERNEL_REJECTED"], ["i[un]", 1, "UNIVERSE_REJECTED"], ["i[lo,pl,un]", 4, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.keyed_predE

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.keyed_predE.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"universe_lowered": true}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1345 solved as (some (u_Corelib_ssr_ssrbool_1110__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.1345 does not hold for the solution"], ["c[] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1345"], ["c[it] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1345; the argument must be the same, not u_Corelib_ssr_ssrbool_1345"], ["c[un] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1345"], ["c[it,un] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1345; the argument must be the same, not u_Corelib_ssr_ssrbool_1345"], ["c[cu] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1345"], ["c[it,cu] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1345; the argument must be the same, not u_Corelib_ssr_ssrbool_1345"], ["c[cu,lo] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.keyed_qualifier

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.keyed_qualifier；目标声明种类：inductive。
- 源端种类：inductive / inductive。
- 分派规则：inductive/generated-levels；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["i[di]", 0, "DISCOVERED"], ["i[pl]", 3, "KERNEL_REJECTED"], ["i[]", 3, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.keyed_qualifier_keyed

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.keyed_qualifier_keyed；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1110", "copies": ["Corelib.ssr.ssrbool.1110__c0", "Corelib.ssr.ssrbool.1110__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.keyed_qualifier_keyed__rocq2lean_obligation_1.statement: coherence: source level Corelib.ssr.ssrbool.1348 is a motive level of the referring declaration but not of the referenced one"], ["c[]", 2, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.keyed_qualifier_keyed__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.keyed_qualifier_suproof

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.keyed_qualifier_suproof.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"universe_lowered": true}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.keyed_qualifier: coherence: source level Corelib.ssr.ssrbool.1348 is a motive level of the referring declaration but not of the referenced one"], ["c[] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.mem: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1348"], ["c[it] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.mem: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1348; the argument must be the same, not u_Corelib_ssr_ssrbool_1348"], ["c[un] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.mem: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1348"], ["c[it,un] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.mem: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1348; the argument must be the same, not u_Corelib_ssr_ssrbool_1348"], ["c[cu] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.mem: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1348"], ["c[it,cu] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.mem: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1348; the argument must be the same, not u_Corelib_ssr_ssrbool_1348"], ["c[cu,lo] eo1", 3, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.left_transitive

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.left_transitive；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrfun.eqfun: argument u_Corelib_ssr_ssrbool_1105 + 1: Corelib.ssr.ssrbool.1105 + 1 ≤ Corelib.ssr.ssrfun.96 is not entailed by the source universe graph, nor is Corelib.ssr.ssrfun.96 ≤ Corelib.ssr.ssrbool.1105 (with offset 0)"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.manifest_mem_pred

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.manifest_mem_pred；目标声明种类：inductive。
- 源端种类：inductive / inductive。
- 分派规则：inductive/generated-levels；实际启用机制：{"universe_lowered": true, "sort_interp": true}。
- 尝试顺序（标签、毫秒、结果）：[["i[di]", 0, "DISCOVERED"], ["i[pl]", 1, "KERNEL_REJECTED"], ["i[pl,un]", 0, "UNIVERSE_REJECTED"], ["i[]", 2, "KERNEL_REJECTED"], ["i[un]", 0, "UNIVERSE_REJECTED"], ["i[lo,pl,un]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.manifest_simpl_pred

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.manifest_simpl_pred；目标声明种类：inductive。
- 源端种类：inductive / inductive。
- 分派规则：inductive/generated-levels；实际启用机制：{"universe_lowered": true, "sort_interp": true}。
- 尝试顺序（标签、毫秒、结果）：[["i[di]", 0, "DISCOVERED"], ["i[pl]", 2, "KERNEL_REJECTED"], ["i[pl,un]", 0, "UNIVERSE_REJECTED"], ["i[]", 2, "KERNEL_REJECTED"], ["i[un]", 0, "UNIVERSE_REJECTED"], ["i[lo,pl,un]", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.mem

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.mem；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1239 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1239 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.memE

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.memE.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.memPredType

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.memPredType；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1213 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1213 does not hold for the solution"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.mem_mem

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.mem_mem.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[] eo1", 5, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.mem_pred

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.mem_pred；目标声明种类：inductive。
- 源端种类：inductive / inductive。
- 分派规则：inductive/generated-template；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["i[di]", 0, "DISCOVERED"], ["i[pl]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.mem_pred_value

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.mem_pred_value；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"universe_lowered": true}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[un]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,un]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,cu]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu,lo]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.mem_simpl

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.mem_simpl.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[] eo1", 3, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.mem_topred

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.mem_topred.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"universe_lowered": true}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "UNIVERSE_REJECTED | level u_Corelib_ssr_ssrbool_1110__c0 + 1 mentions u_Corelib_ssr_ssrbool_1110__c0, which is not a parameter of the declaration"], ["c[] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.mem: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1253"], ["c[it] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.mem: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[un] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.mem: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1253"], ["c[it,un] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.mem: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.mem: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1253"], ["c[it,cu] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.mem: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu,lo] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.mono1W_in

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.mono1W_in.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 5, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.mono1W_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.mono1W_in__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.mono2W

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.mono2W.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2175 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.2175 does not hold for the solution"], ["c[] eo2", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.monoLR

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.monoLR.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2175 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.2175 does not hold for the solution"], ["c[] eo2", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.monoLR_in

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.monoLR_in.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 13, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（3）：Corelib.ssr.ssrbool.monoLR_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.monoLR_in__rocq2lean_obligation_2, Corelib.ssr.ssrbool.monoLR_in__rocq2lean_obligation_3。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.monoRL

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.monoRL.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2175 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.2175 does not hold for the solution"], ["c[] eo2", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.monoRL_in

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.monoRL_in.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 13, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（3）：Corelib.ssr.ssrbool.monoRL_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.monoRL_in__rocq2lean_obligation_2, Corelib.ssr.ssrbool.monoRL_in__rocq2lean_obligation_3。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.monoW

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.monoW.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2175 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.2175 does not hold for the solution"], ["c[] eo2", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.monoW_in

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.monoW_in.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 5, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.monoW_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.monoW_in__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.mono_sym

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.mono_sym.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2262 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.2262 does not hold for the solution"], ["c[] eo2", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.mono_sym_in

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.mono_sym_in.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2262 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.2262 does not hold for the solution"], ["c[] eo2", 4, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.mono_sym_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.mono_sym_in__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.mono_sym_in11

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.mono_sym_in11.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2262 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.2262 does not hold for the solution"], ["c[] eo2", 6, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.mono_sym_in11__rocq2lean_obligation_1, Corelib.ssr.ssrbool.mono_sym_in11__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.nandP

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.nandP；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（4）：Corelib.ssr.ssrbool.nandP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.nandP__rocq2lean_obligation_2, Corelib.ssr.ssrbool.nandP__rocq2lean_obligation_3, Corelib.ssr.ssrbool.nandP__rocq2lean_obligation_4。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.negP

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.negP；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.negP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.not_false_is_true。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.negPP

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.negPP；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（5）：Corelib.ssr.ssrbool.negP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.not_false_is_true, Corelib.ssr.ssrbool.negPP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.negPP__rocq2lean_obligation_2, Corelib.ssr.ssrbool.iffP__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.negPf

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.negPf；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.negPf__rocq2lean_obligation_1, Corelib.ssr.ssrbool.negPf__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.negPn

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.negPn；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.is_true_true, Corelib.ssr.ssrbool.not_false_is_true。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.negbF

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.negbF.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.negbFE

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.negbFE.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.negbK

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.negbK.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.negbLR

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.negbLR.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.negbNE

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.negbNE.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.negbRL

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.negbRL.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.negbT

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.negbT.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.negbTE

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.negbTE.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.negb_and

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.negb_and.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.negb_imply

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.negb_imply.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.negb_inj

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.negb_inj.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.negb_or

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.negb_or.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.norP

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.norP；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（4）：Corelib.ssr.ssrbool.norP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.norP__rocq2lean_obligation_2, Corelib.ssr.ssrbool.norP__rocq2lean_obligation_3, Corelib.ssr.ssrbool.norP__rocq2lean_obligation_4。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.notF

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.notF.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.not_false_is_true

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.not_false_is_true.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.ocan_in_comp

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.ocan_in_comp.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo3", 2, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2052 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.2052 does not hold for the solution"], ["c[] eo3", 13, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（3）：Corelib.ssr.ssrbool.ocan_in_comp__rocq2lean_obligation_1, Corelib.ssr.ssrbool.ocan_in_comp__rocq2lean_obligation_2, Corelib.ssr.ssrbool.ocan_in_comp__rocq2lean_obligation_3。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.on1S

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.on1S.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 4, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.on1S__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on1S__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.on1S_in

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.on1S_in.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 8, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.on1S_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on1S_in__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.on1T

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.on1T.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 2, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.on1T__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on1T__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.on1W

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.on1W.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 3, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.on1W__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on1W__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.on1W_in

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.on1W_in.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 6, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.on1W_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on1W_in__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.on1lS

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.on1lS.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1", "Corelib.ssr.ssrbool.1169__c2"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 4, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.on1lS__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on1lS__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.on1lS_in

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.on1lS_in.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1", "Corelib.ssr.ssrbool.1169__c2"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 8, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.on1lS_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on1lS_in__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.on1lT

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.on1lT.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1", "Corelib.ssr.ssrbool.1169__c2"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 3, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.on1lT__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on1lT__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.on1lW

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.on1lW.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1", "Corelib.ssr.ssrbool.1169__c2"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 3, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.on1lW__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on1lW__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.on1lW_in

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.on1lW_in.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1", "Corelib.ssr.ssrbool.1169__c2"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 5, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.on1lW_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on1lW_in__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.on2S

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.on2S.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 4, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.on2S__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on2S__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.on2S_in

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.on2S_in.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 9, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.on2S_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on2S_in__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.on2T

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.on2T.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 3, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.on2T__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on2T__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.on2W

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.on2W.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 3, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.on2W__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on2W__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.on2W_in

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.on2W_in.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 7, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.on2W_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on2W_in__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.onPhantom

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.onPhantom.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.1694"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.onS_can

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.onS_can.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 5, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.onS_can__rocq2lean_obligation_1, Corelib.ssr.ssrbool.onS_can__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.onS_can_in

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.onS_can_in.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 9, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.onS_can_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.onS_can_in__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.onT_bij

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.onT_bij.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 2, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（3）：Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_1, Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_2, Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_3。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.onW_bij

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.onW_bij.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 4, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（3）：Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_1, Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_2, Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_3。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.onW_can

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.onW_can.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 5, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.onW_can__rocq2lean_obligation_1, Corelib.ssr.ssrbool.onW_can__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.onW_can_in

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.onW_can_in.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 6, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.onW_can_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.onW_can_in__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.on_can_inj

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.on_can_inj.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 6, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（4）：Corelib.ssr.ssrbool.on_can_inj__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on_can_inj__rocq2lean_obligation_2, Corelib.ssr.ssrbool.on_can_inj__rocq2lean_obligation_3, Corelib.ssr.ssrbool.on_can_inj__rocq2lean_obligation_4。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.or3

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.or3；目标声明种类：inductive。
- 源端种类：inductive / inductive。
- 分派规则：inductive/generated；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["i[pl]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.or3P

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.or3P；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（4）：Corelib.ssr.ssrbool.or3P__rocq2lean_obligation_1, Corelib.ssr.ssrbool.or3P__rocq2lean_obligation_2, Corelib.ssr.ssrbool.or3P__rocq2lean_obligation_3, Corelib.ssr.ssrbool.or3P__rocq2lean_obligation_4。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.or3_ind

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.or3_ind.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.or3_sind

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.or3_sind.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.or4

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.or4；目标声明种类：inductive。
- 源端种类：inductive / inductive。
- 分派规则：inductive/generated；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["i[pl]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.or4P

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.or4P；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（5）：Corelib.ssr.ssrbool.or4P__rocq2lean_obligation_1, Corelib.ssr.ssrbool.or4P__rocq2lean_obligation_2, Corelib.ssr.ssrbool.or4P__rocq2lean_obligation_3, Corelib.ssr.ssrbool.or4P__rocq2lean_obligation_4, Corelib.ssr.ssrbool.or4P__rocq2lean_obligation_5。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.or4_ind

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.or4_ind.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.or4_sind

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.or4_sind.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.orFb

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.orFb.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.orKb

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.orKb.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.orNb

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.orNb.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.orP

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.orP；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（4）：Corelib.ssr.ssrbool.orP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.orP__rocq2lean_obligation_2, Corelib.ssr.ssrbool.orP__rocq2lean_obligation_3, Corelib.ssr.ssrbool.orP__rocq2lean_obligation_4。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.orPP

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.orPP；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（7）：Corelib.ssr.ssrbool.orP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.orP__rocq2lean_obligation_2, Corelib.ssr.ssrbool.orP__rocq2lean_obligation_3, Corelib.ssr.ssrbool.orP__rocq2lean_obligation_4, Corelib.ssr.ssrbool.orPP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.orPP__rocq2lean_obligation_2, Corelib.ssr.ssrbool.iffP__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.orTb

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.orTb.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.orbA

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.orbA.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.orbAC

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.orbAC.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.orbACA

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.orbACA.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.orbC

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.orbC.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.orbCA

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.orbCA.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.orbF

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.orbF.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.orbK

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.orbK.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.orbN

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.orbN.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.orbT

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.orbT.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.orb_andl

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.orb_andl.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.orb_andr

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.orb_andr.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.orb_id2l

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.orb_id2l.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.orb_id2r

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.orb_id2r.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.orb_idl

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.orb_idl.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.orb_idr

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.orb_idr.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.orbb

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.orbb.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.pair_andP

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.pair_andP.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.pcan_in_comp

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.pcan_in_comp.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo3", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2043 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.2043 does not hold for the solution"], ["c[] eo3", 12, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（3）：Corelib.ssr.ssrbool.pcan_in_comp__rocq2lean_obligation_1, Corelib.ssr.ssrbool.pcan_in_comp__rocq2lean_obligation_2, Corelib.ssr.ssrbool.pcan_in_comp__rocq2lean_obligation_3。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.pcan_in_inj

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.pcan_in_inj.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2010 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.2010 does not hold for the solution"], ["c[] eo2", 4, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（2）：Corelib.ssr.ssrbool.pcan_in_inj__rocq2lean_obligation_1, Corelib.ssr.ssrbool.pcan_in_inj__rocq2lean_obligation_2。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.pre_symmetric

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.pre_symmetric；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.1473"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.pred

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.pred；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.pred0

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.pred0；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1133 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1133 does not hold for the solution"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.predArgType

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.predArgType；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.predC

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.predC；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1145 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1145 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.predD

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.predD；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1149 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1149 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.predI

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.predI；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1137 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1137 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.predPredType

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.predPredType；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1121 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1121 does not hold for the solution"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.predT

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.predT；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1135 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1135 does not hold for the solution"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.predType

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.predType；目标声明种类：inductive。
- 源端种类：inductive / inductive。
- 分派规则：inductive/generated-template；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["i[di]", 0, "DISCOVERED"], ["i[pl]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.predU

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.predU；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1141 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1141 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.pred_key

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.pred_key；目标声明种类：inductive。
- 源端种类：inductive / inductive。
- 分派规则：inductive/generated-levels；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["i[di]", 0, "DISCOVERED"], ["i[pl]", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.pred_oapp

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.pred_oapp；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2049 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.2049 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.pred_of_argType

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.pred_of_argType；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.pred_of_mem

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.pred_of_mem；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.1208"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.pred_sort

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.pred_sort；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1111 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1111 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.preim

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.preim；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1154 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1154 does not hold for the solution"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.prop_congr

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.prop_congr.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.prop_for

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.prop_for；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.1531"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.prop_in1

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.prop_in1；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1531 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1531 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.prop_in11

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.prop_in11；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1531 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1531 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.prop_in111

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.prop_in111；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1531 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1531 does not hold for the solution"], ["c[]", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.prop_in12

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.prop_in12；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1531 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1531 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.prop_in2

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.prop_in2；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1531 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1531 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.prop_in21

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.prop_in21；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1531 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1531 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.prop_in3

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.prop_in3；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1531 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1531 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.prop_on1

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.prop_on1；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1532 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1532 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.prop_on2

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.prop_on2；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1532 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1532 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.qualifE

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.qualifE.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1343 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1343 does not hold for the solution"], ["c[] eo1", 3, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.qualifier

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.qualifier；目标声明种类：inductive。
- 源端种类：inductive / inductive。
- 分派规则：inductive/generated-template；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["i[di]", 0, "DISCOVERED"], ["i[pl]", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.reflexive

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.reflexive；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.1473"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.registered_applicative_pred

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.registered_applicative_pred；目标声明种类：inductive。
- 源端种类：inductive / inductive。
- 分派规则：inductive/generated-levels；实际启用机制：{"universe_lowered": true, "sort_interp": true}。
- 尝试顺序（标签、毫秒、结果）：[["i[di]", 0, "DISCOVERED"], ["i[pl]", 1, "KERNEL_REJECTED"], ["i[pl,un]", 1, "UNIVERSE_REJECTED"], ["i[]", 0, "KERNEL_REJECTED"], ["i[un]", 1, "UNIVERSE_REJECTED"], ["i[lo,pl,un]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.rel

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.rel；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.relU

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.relU；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1181 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1181 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.rel_of_simpl

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.rel_of_simpl；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1177 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1177 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.relpre

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.relpre；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1188 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1188 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.rev_trans

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.rev_trans.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.1527"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.right_transitive

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.right_transitive；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrfun.eqfun: argument u_Corelib_ssr_ssrbool_1105 + 1: Corelib.ssr.ssrbool.1105 + 1 ≤ Corelib.ssr.ssrfun.96 is not entailed by the source universe graph, nor is Corelib.ssr.ssrfun.96 ≤ Corelib.ssr.ssrbool.1105 (with offset 0)"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.rwP

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.rwP.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.rwP2

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.rwP2.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.sameP

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.sameP.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.simplPredType

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.simplPredType；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1166 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1166 does not hold for the solution"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.simpl_of_mem

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.simpl_of_mem；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1229 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1229 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.simpl_pred

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.simpl_pred；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.simpl_predE

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.simpl_predE.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.simpl_pred_value

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.simpl_pred_value；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"universe_lowered": true}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | level u_Corelib_ssr_ssrbool_1126__c0 + 1 mentions u_Corelib_ssr_ssrbool_1126__c0, which is not a parameter of the declaration"], ["c[]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.simpl_pred: coherence: source level Corelib.ssr.ssrbool.1126 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1126, not u_Corelib_ssr_ssrbool_1253"], ["c[it]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.simpl_pred: coherence: source level Corelib.ssr.ssrbool.1126 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1126 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[un]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.simpl_pred: coherence: source level Corelib.ssr.ssrbool.1126 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1126, not u_Corelib_ssr_ssrbool_1253"], ["c[it,un]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.simpl_pred: coherence: source level Corelib.ssr.ssrbool.1126 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1126 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.simpl_pred: coherence: source level Corelib.ssr.ssrbool.1126 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1126, not u_Corelib_ssr_ssrbool_1253"], ["c[it,cu]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.simpl_pred: coherence: source level Corelib.ssr.ssrbool.1126 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1126 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu,lo]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.simpl_rel

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.simpl_rel；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.sort_of_predArgType

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.sort_of_predArgType；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.sub_in1

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.sub_in1.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.sub_in11

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.sub_in11.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 3, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.sub_in111

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.sub_in111.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1", "Corelib.ssr.ssrbool.1169__c2"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 5, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.sub_in12

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.sub_in12.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2134 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.2134 does not hold for the solution"], ["c[] eo2", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.sub_in2

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.sub_in2.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2112 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.2112 does not hold for the solution"], ["c[] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.sub_in21

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.sub_in21.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo2", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2150 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.2150 does not hold for the solution"], ["c[] eo2", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.sub_in3

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.sub_in3.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2121 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.2121 does not hold for the solution"], ["c[] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.sub_in_bij

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.sub_in_bij.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 5, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（3）：Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_2, Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_3。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.sub_mem

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.sub_mem；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1226 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1226 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.sub_refl

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.sub_refl.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.1237"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.subon1

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.subon1.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 3, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.subon1l

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.subon1l.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1", "Corelib.ssr.ssrbool.1169__c2"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 4, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.subon2

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.subon2.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 3, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.subon_bij

- 结果：带显式待证参数的陈述；不是已证明定理。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.subon_bij.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 7, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（3）：Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_1, Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_2, Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_3。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.subpred

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.subpred；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.1107"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.subrel

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.subrel；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.1173"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.subrelUl

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.subrelUl.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1199 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1199 does not hold for the solution"], ["c[] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.subrelUr

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.subrelUr.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1201 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1201 does not hold for the solution"], ["c[] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.sumboolP

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.sumboolP；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.sym_left_transitive

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.sym_left_transitive.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.left_transitive: coherence: source level Corelib.ssr.ssrbool.1473 is a motive level of the referring declaration but not of the referenced one"], ["c[] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.sym_right_transitive

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.sym_right_transitive.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.right_transitive: coherence: source level Corelib.ssr.ssrbool.1473 is a motive level of the referring declaration but not of the referenced one"], ["c[] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.symmetric

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.symmetric；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.1473"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.symmetric_from_pre

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.symmetric_from_pre.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.1473"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.topred

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.topred；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.ssr.ssrbool.pred_sort T\nargument has type\n  Type u_Corelib_ssr_ssrbool_1105\nbut function has type\n  (T : Type (u_Corelib_ssr_ssrbool_1105 + 1)) →\n    @Rocq.Corelib.ssr.ssrbool.predType T → Type u_Corelib_ssr_ssrbool_1110__c1"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.topredE

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.topredE.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.total

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.total；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.1473"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.transitive

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.transitive；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.1473"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.unfold_in

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.unfold_in.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.unkey_pred

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.unkey_pred；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"universe_lowered": true}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1121"], ["c[]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1345"], ["c[it]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1345; the argument must be the same, not u_Corelib_ssr_ssrbool_1345"], ["c[un]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1345"], ["c[it,un]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1345; the argument must be the same, not u_Corelib_ssr_ssrbool_1345"], ["c[cu]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1345"], ["c[it,cu]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1345; the argument must be the same, not u_Corelib_ssr_ssrbool_1345"], ["c[cu,lo]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.unkey_qualifier

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.unkey_qualifier；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 2, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.keyed_qualifier: coherence: source level Corelib.ssr.ssrbool.1348 is a motive level of the referring declaration but not of the referenced one"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.unless

- 结果：完整定义／数据类型，无待证参数。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.unless；目标声明种类：def。
- 源端种类：constant / transparent。
- 分派规则：constant/transparent；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.355", "Corelib.ssr.ssrbool.356"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：TRANSLATED_AND_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.unlessL

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.unlessL；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.359", "Corelib.ssr.ssrbool.361"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.unlessL__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.unlessP

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.unlessP.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.unlessR

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.unlessR；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.366", "Corelib.ssr.ssrbool.368"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.unlessR__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.unless_contra

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.unless_contra；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.407"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 0, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.unless_contra__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.unless_sym

- 结果：带显式待证参数的定义。
- Lean 名称：RocqPending.Corelib.ssr.ssrbool.unless_sym；目标声明种类：opaque。
- 源端种类：constant / opaque_data。
- 分派规则：constant/opaque_data；实际启用机制：{"admitting_levels": ["Corelib.ssr.ssrbool.374", "Corelib.ssr.ssrbool.375"]}。
- 尝试顺序（标签、毫秒、结果）：[["c[ad]", 1, "PENDING_KERNEL_CHECKED"]]。
- 待证参数（1）：Corelib.ssr.ssrbool.unless_sym__rocq2lean_obligation_1。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：PENDING_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.wlog_neg

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.wlog_neg.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.xorPif

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.xorPif.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

---

Corelib.ssr.ssrbool.xorPifn

- 结果：定理／公理陈述，无待证参数；不是已证明定理。
- Lean 名称：Rocq.Corelib.ssr.ssrbool.xorPifn.statement；目标声明种类：statement。
- 源端种类：constant / statement_only。
- 分派规则：constant/transparent；实际启用机制：{}。
- 尝试顺序（标签、毫秒、结果）：[["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- 待证参数（0）：无。
- 额外 Sort quality 分支：0（有分支时连同主项共 1 种）；完整分支、类型与正文 AST 在同名 JSON。
- 基线状态：STATEMENT_KERNEL_CHECKED；阶段：基线已有结果。
- 基线原因：无阻塞。
- 基线失败路径：未记录／无失败。

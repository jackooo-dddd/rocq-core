# 关系、Classes 与可变参数谓词（第八、九批）

第八批新增 101 个完成根，第九批再新增 25 个。两个模块合计 126 根全部进入明示范围内的完成类别，未通过扩大模块范围改变分母。

| 模块 | 根数 | 类型对应 | 运算对应 | 完整原生陈述 |
|---|---:|---:|---:|---:|
| Relations.Relation_Definitions | 23 | 5 | 8 | 10 |
| Classes.RelationClasses | 103 | 12 | 24 | 67 |

全库累计 706 / 2180：55 类型、273 运算、378 完整原生陈述；尚有 475 部分陈述、284 仅接口、398 尚无证书、316 尚带条件、1 特殊 Type 值陈述。类型对应类别包括归纳类型、类型别名、函数类型及证明结构，并非全是新的数据类型。

## 原生目标与使用

- relation、unary/binary/ternary_operation、unary_predicate、binary_relation 对应普通 Lean 函数类型。unary_predicate 的两项独立 universe 参数均保留，经显式 PULift 转换后得到 A → Prop。
- equivalence/Equivalence 对应 Lean 现成 Equivalence。relation inclusion/subrelation 对应 Subrelation。
- preorder、PER、StrictOrder 等对应原生量词和 And 组成的精确性质。没有将“与原生逻辑表达式等价”误标成 Lean 现成类的实例。
- RewriteRelation 的源构造器没有字段，是一个标记；对应 True。这个对应本身不赋予关系自反、对称等性质。
- Classes.PartialOrder 的等价关系 E 仍是参数，精确目标为 ∀ x y, E x y ↔ R x y ∧ R y x，并保留 E 的等价性和 R 的预序前提。没有假定 E 是 Lean Eq。
- 已证明一个真实消费例：机械 equivalence → 原生 Setoid → Quotient.sound。示例允许 Lean 原生商类型 API 使用机械侧提供的关系证据；示例不额外计 Corelib 根。

## Tlist 与可变参数运算

Tlist.{u} 与 List (Type u) 双向互逆。Arguments 将原生类型列表解释为嵌套参数元组：空列表为 PUnit，非空列表为 A × Arguments tail。

arrows ts B 经显式 curry/uncurry 对应 Arguments (typesTo ts) → B，两个方向均有往返证明。谓词进一步去掉 PULift Prop，成为 Arguments (...) → Prop。

12 个运算对应均已检查：Tlist_rec/rect → List.rec；pointwise_extension → 对同一参数元组逐点运算；pointwise_lifting → 对元组全称量化；predicate_all/exists → ∀/∃；predicate_equivalence/implication → 逐点 iff/蕴含；predicate_intersection/union → 逐点 And/Or；true/false_predicate → 常量 True/False。

这不是只包装源函数：右侧运算只用指定的原生逻辑/函数表达式；转换函数是已证互逆的参数表示。

## 陈述与条件

RelationClassStatements 使用既有证书自动重新规范化 65 项基线部分陈述，56 项完全原生化。候选报告仍如实记录另外 9 项在这次自动阶段未完成；之后 VariadicStatements 为这 9 项提供了手写目标及证明，当前逐根账本中不再残留。

这 9 项是 Tlist 的两个归纳陈述和可变参数谓词关系的七个性质。每项精确原生陈述与原陈述都独立证明，iff 由两份证明构成；操作级转换另外由 VariadicPredicates 证明。没有把 iff 的存在冒充任意陈述的通用证明翻译算法。

本批另外闭合两个条件根：PartialOrder_inverse 和 subrelation_partial_order，使用三份空公理闭包的见证，分别证明反向预序、逐点 iff 的等价性、子关系的预序性。原始条件清单从 Classes/RelationClasses/translation_report.json 抽取并核对。

全库机械产物仍保留 331 个条件根；本层累计闭合 15 个（7 定义、8 陈述），使用 13 个不同闭合见证，剩余 316。累计新增原陈述证明为 38 份；本批增加 21 份（10 个关系投影、9 个可变参数性质、2 个条件陈述）。自动得到的 56 份 iff 不单独声称已经证明其原陈述。

## 文件与验证

- proofs/RelationDefinitions.lean、RelationClasses.lean、RelationClassStatements.lean。
- proofs/VariadicPredicates.lean、VariadicStatements.lean、RelationConditions.lean。
- build_relation_statements.py：从冻结基线选择 65 项并重建自动陈述 profile。
- reports/relations-module-coverage.json：两个模块的逐根类别核对结果。
- reports/relation-statement-candidates.json：56 成功、9 自动阶段残留，后者由手写证书覆盖。
- reports/CERTIFICATES.md、CORELIB_LEDGER.csv：每一源根的完整证明类型及原生目标。
- reports/condition-discharges.json、original-statement-proofs.json：条件与原陈述证明分别记录。

六个新增 profile 均通过 Lean 4.33.1 kernel 及公理闭包审计，累计 23 个 profile 的源码哈希与成功记录一致。真实商类型例使用标准 Quot.sound；条件见证的公理闭包为空。

此结论只覆盖上述两个模块，不包括 CRelationClasses、Morphisms、CMorphisms 等全部 Classes 文件。统一跨模块导入和 Mathlib 集成尚未完成；继续按 PLAN.md 执行。

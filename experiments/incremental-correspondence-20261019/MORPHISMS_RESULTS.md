# Morphisms（第十批）

本批新增 68 个完成根：5 个类型/标记、8 个运算、55 个完全原生陈述。连同基线已有的 19 个完整原生陈述，Classes.Morphisms 的 87 个根全部进入明示范围内的完成类别。

全库累计 774 / 2180：60 类型、281 运算、433 完整原生陈述。剩余 420 部分陈述、275 仅接口、394 尚无证书、316 尚带条件、1 特殊 Type 值陈述。

## 精确目标

| 源项 | 原生对应 |
|---|---|
| Proper、ProperProxy | R f f |
| ReflexiveProxy | ∀ x, R x x |
| respectful | ∀ x y, R x y → S (f x) (g y) |
| respectful_hetero | ∀ x y, R x y → S x y (f x) (g y)，保留两个依赖返回族 |
| pointwise_relation | ∀ x, R (f x) (g x) |
| forall_relation | ∀ x, R x (f x) (g x) |
| Normalizes | ∀ x y, R x y ↔ S x y |
| forall_def | 原生依赖函数类型 |
| Params、PartialApplication、apply_subrelation、normalization_done | True：四者都是没有字段的标记 |

八个运算目标均为指定原生逻辑表达式，标为 native_expression；未声称它们全部是 Mathlib 现成 API。Normalizes 在这里是关系等价的命题，不是一个运行时标准化过程。Params 标记的同构对任意源 arity 成立；没有借此改变机械 Nat 的表示。

respectful 按机械签名覆盖同一 Type u 的输入/输出；pointwise_relation 覆盖两个独立 Type universe；respectful_hetero 覆盖四个独立 Sort universe 及依赖返回族。证书完整类型是最终范围依据。

## 下游自动使用

build_morphism_statements.py 从冻结基线选择 55 个部分陈述，使用关系、逻辑和函数整体对应重新规范化，55 个全部通过：
- 自动构造原陈述 ↔ 原生陈述的证明。
- 递归展开 NativeBridge 别名检查，原生目标无机械源符号。
- 函数作为参数传递时也使用已证整体等式：compose、impl、pointwise_relation。
- 一项陈述的无用 unit 参数通过已证的“∀ unit, P ↔ P”去掉，而非无依据删去参数。

这些是 55 份陈述等价证书；本批没有另行登记原陈述证明。因此全库新增原陈述证明总数仍为 38，不增加为 93。

proper_across_iso 是一个实际使用例：输入一个载体 Iso、函数运算对应、原生函数保持关系的证明，得到机械函数的 Proper 证明。运算对应 hf 是显式前提，不因函数类型可转换而擅自认为源函数和任意原生函数行为相同。示例不额外计根。

## 验证与复用边界

proofs/Morphisms.lean 和 proofs/MorphismStatements.lean 均通过 Lean 4.33.1 kernel 和公理审计；累计 25 个 profile 的源码哈希与成功记录匹配。无新增条件根消解，仍为 15 个已闭合、316 个待处理。

Morphisms profile 复用了经筛选的关系辅助证明，并在 Morphisms 实际导出闭包内重新检查。未将其它 profile 的同名 Rocq2LeanOut 强行混合导入；P7 的统一跨模块导入仍需处理。重复辅助证明不重复计根。

证据：
- reports/morphism-statement-candidates.json：55/55 自动原生化。
- reports/relations-module-coverage.json：Relation_Definitions 23、RelationClasses 103、Morphisms 87 共 213 根的分类核对。
- reports/CERTIFICATES.md、CORELIB_LEDGER.csv、summary.json：完整映射及当前统计。
- reports/Morphisms-audit.json、MorphismStatements-audit.json：证明类型、公理闭包与源引用。

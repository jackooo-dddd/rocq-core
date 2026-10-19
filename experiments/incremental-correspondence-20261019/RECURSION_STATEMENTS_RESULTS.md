# 第六批：二元递归、依赖陈述与基本消去器

新增 30 个完成根：25 个运算、5 个完全原生陈述，总数 531 → 561。当前为 37 类型根、227 运算根、297 完全原生陈述根。另补一份 sum → PSum 的完整 Sort 证书，不重复增加类型根数。

新增 PairRecursion、DependentStatements、DatatypeElimination 三个 profile 均通过 Lean kernel 与公理闭包检查。累计 15 个 profile 有与当前源码对应的成功记录；旧的 12 个沿用已有结果，本批没有重跑旧机械翻译、45 个接口回归或 Mathlib。

## 二元良基递归

| 源声明 | 原生目标 |
|---|---|
| Init.Wf.Fix_F_2 | WellFounded.fixF，输入为原生 Prod |
| Init.Wf.well_founded_induction_type_2 | WellFounded.fix，输入为原生 Prod |

证明包含机械 pair 与原生 Prod 之间的 Acc、WellFounded 双向转换。关系从原生 pair 拉回到机械 pair；步函数接收原生参数；P : A → B → Type w 保持对两个参数的依赖，A/B 的 universe 分别为 Type u/Type v。

使用例 pair_countdown_mechanical_correct：用原生 Nat 的和作为度量，为机械二元递归提供终止性证明，再复用原生递归正确性定理，证明结果等于 x+y。使用例和辅助桥接不额外计 Corelib 根。

文件：proofs/PairRecursion.lean。

## 同一条件证明复用到五个陈述

五个根都依赖已证明的 sig_of_sig2 投影义务。本批为每个根分别提供实际实例化、原生 iff、原陈述证明：

| 源陈述 | 原生内容 |
|---|---|
| proj3_sig | 带 P ∧ Q 属性的 Subtype 元素满足 Q |
| proj1_sig_of_sig2_eq | 相等元素具有相等 val |
| sig_of_sig2_eq | 删除第二个证明属性保持相等 |
| eq_sig2_hprop | 删除第二个证明属性后的相等推出原元素相等 |
| eq_sig2_hprop_iff | 上述相等关系的 iff |

原有 Q 证明唯一性前提保留在原生陈述中；没有把源端语义前提当作抽取义务删掉。源 Eq、依赖 Subtype 参数和投影通过既有 correspondence 转换。

原生目标检查递归展开 NativeBridge 辅助定义，确认没有 Rocq、RocqPending、Rocq2Lean 符号。另有独立的原陈述证明；不是只有 iff 或接口。

累计已有 9 个带条件根在本层闭合实例化：4 个定义、5 个陈述。复用的独立义务见证仍为 5 个，公理闭包均为空。本层未解决条件根为 322；原始机械导出仍保留 331 个条件接口。

文件：proofs/DependentStatements.lean、reports/dependent-native-targets.json、reports/condition-discharges.json、reports/original-statement-proofs.json。

## 基本 datatype 消去器

18 个 rec/rect 运算：
- bool → Bool.rec；
- comparison → Ordering.rec；
- unit → PUnit.rec（Unit 是别名）；
- Empty_set → Empty.rec；
- option → Option.rec；
- list → List.rec；
- prod → PProd.rec；
- sum → PSum.rec；
- result → Except.rec。

另有 curry、uncurry、id、ID、IDProp，共 5 项：分别对应原生 pair 上的参数组合/拆分、id、多态函数类型以及命题。curry/uncurry 和 ID/IDProp 标为原生组合表达式，不冒充同名库 API。

sum 的新类型证书用 PSum 支持 A : Sort u、B : Sort v。prod 的完整 Sort 桥接在当前模块中重新实例化以支持操作，不再登记重复类型根或证书。

### 必须保留的适用范围

- prod/sum 支持完整 Sort 参数；固定 Bool/Ordering/Unit/Empty 没有元素 universe 参数。
- list/option 的元素目前为 Type u；result 的值/错误为 Type u/Type v。尚不宣称覆盖这些源容器所有 Prop 元素实例。
- rec 的 motive 返回 Type；rect 的 motive 可返回 Sort z；均保留依赖返回类型。
- 根计数表示该根已有明确适用范围的已证 correspondence，不表示所有 universe 实例都已覆盖。具体范围在 certificates.json 与完整 Lean 定理类型中逐项记录。

文件：proofs/DatatypeElimination.lean。

## 后续

继续 Eq transport、其余依赖消去器及剩余条件义务；数字写出、统一导入和 Mathlib 集成仍未完成。本批不改机械翻译规则，也没有将机械 nat/eq 改回原生映射。

# 第三十三批：PartialOrder 与 Eq/Iff 等价关系

本批新增 7 个去重根：1 个类型、6 个运算。当前累计 **1621 / 2180**：114 个类型根、622 个运算根、885 个完整原生陈述。剩余 559 个根不计入完成。

## 逐项结果

| 源声明（CRelationClasses） | 已证明的原生目标 |
|---|---|
| PartialOrder | 对每个 x,y 的一对函数：E x y → R x y × R y x，以及 R x y × R y x → E x y；包括两个逆律 |
| antisymmetry | 给定反对称函数本身，保留 E x y 中的数据 |
| flip_Symmetric | h y x，交换端点 |
| flip_Transitive | h z y x，交换两个关系证据的顺序 |
| partial_order_equivalence | 上述 pointwise 函数对的恒等映射 |
| eq_equivalence | Lean Equivalence Eq；三项前置证明闭合，并有源结果类型的双向逆 |
| iff_equivalence | Lean Equivalence Iff；三项前置证明闭合，源 PULift Prop 载体转换为 Prop，并有双向逆 |

证明：[CRelationOrder.lean](proofs/CRelationOrder.lean)。所有源 universe 参数保留；完整类型及公理闭包由审计生成。没有把 Type 值 PartialOrder 宣称为 Lean 的 PartialOrder 类型类。Eq/Iff 的特殊关系值只携带证明，允许转换成 Prop 中的原生 Equivalence；任意 Type 值关系仍保留函数数据。

## 模块剩余项

CRelationClasses 当前为 70 / 81，剩余 11 项均为 opaque_data：

- PartialOrder_inverse、partial_order_antisym；
- flip_Antisymmetric、flip_Equivalence、flip_PER、flip_PreOrder、flip_Reflexive、flip_StrictOrder；
- relation_equivalence_equivalence、relation_implication_preorder、subrelation_symmetric。

这些结果含有任意 Type 值关系中的数据或函数。已有类型 Iso 可以转换它们的接口，但仅凭 opaque 声明的类型，不能证明输出一定等于选定的原生实现。后续需要源端计算等式及其可信翻译，或独立的结果刻画；不能把重新包装源函数算作原生运算对应。当前未判定这些声明不可能对应。

## 验证

- CRelationOrder 证明、逆律、七份覆盖证书和六份前置证明通过 Lean kernel / 公理闭包检查。
- 原生目标正文与类型递归扫描无源符号。
- 90 个增量 profile 的当前源码与依赖指纹匹配验证记录。
- 81 个覆盖 profile、1360 份覆盖证书共同导入通过；1844 个导出入口，12229 个复制依赖声明。入口与副本不增加根覆盖数。
- 机械层仍保留 331 个条件根；correspondence 层已完成其中 293 个，剩余 38 个。
- 未重跑全部机械翻译或全部旧基线证明；本批未安装框架、未改变机械 nat/eq、未修改翻译规则。

# Equivalence、Morphisms_Prop 与 Setoid（第十一批）

新增 40 个完成根：2 个类型、2 个运算、36 个完整原生陈述。全库累计 814 / 2180（62 类型、283 运算、469 陈述）；剩余 384 部分陈述、274 仅接口、391 尚无证书、316 尚带条件、1 特殊陈述。

Classes.Equivalence 的 17 根、Classes.Morphisms_Prop 的 29 根、Setoids.Setoid 的 6 根均有明示范围内的证书。其中 Morphisms_Prop 的 12 个完整原生陈述继承基线，本批新增 17 个；没有重复计数。连同前三个关系模块，6 个模块共 265 根的逐根核对见 reports/relations-module-coverage.json。

## 对应结果

- equiv / pequiv：输入已转换的 Equivalence / PER 证据后，返回的关系等于原关系 R。
- respecting：与 Lean Subtype {f : A → B // ∀ x y, R x y → S (f x) (f y)} 互逆。按照源类型覆盖 A、B : Type u；不擅自扩大到源签名未提供的 universe 范围。
- Setoid_Theory：与现成 Lean Equivalence R 的证明类型互逆。
- Equivalence 的 14 个陈述全部自动原生化，Subtype 的量词和投影通过转换证书处理；其中部分依赖陈述保留不同输入/输出 universe，完整类型见审计。
- Morphisms_Prop 的 17 个陈述全部自动原生化；已有 Acc 转换在本模块实际机械闭包中重检。原生结果包含 Lean Acc 和原生 And/Or/Not/iff。
- Setoid 的构造、自反、对称、传递和 gen_st 五个陈述均有原生 iff，并另有原陈述证明。gen_st 保留源端 Type 0 范围。

respecting 的原生函数包有已检验的复合示例；辅助示例不增加源根数。Morphisms_Prop / Equivalence 的 31 个自动 iff 未额外登记原陈述证明。全库新增原陈述证明由 38 增至 43。

## 验证

4 个新增 profile：EquivalenceBridge、EquivalenceStatements、MorphismsProp、SetoidBridge。均通过 Lean 4.33.1 kernel、公理闭包检查；累计 29 个 profile 的源码哈希与成功记录一致。

新增生成脚本：build_equivalence_statements.py、build_morphisms_prop.py；原生目标递归检查排除隐藏源别名。Acc 及关系辅助证明在各实际闭包中重新编译，不额外重复计根。

无新增条件根消解；机械产物仍 331 条件根，correspondence 层已闭合 15、剩余 316。统一跨模块导入和 Mathlib 集成继续处理。

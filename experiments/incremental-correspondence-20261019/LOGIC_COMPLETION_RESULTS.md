# Init.Logic 完成结果

本批新增 94 个完成根：27 个运算/谓词、67 个完全原生陈述。Init.Logic 的 176 个根现在都有明示范围内的对应：1 类型、48 运算/谓词、127 完全原生陈述。机械产物和机械 Nat/Eq 未改动。

## 共享证明依赖

原先剩余 72 个带条件根，共使用 112 个不同前置声明。前置声明不全是 exporter 的 obligation，也包括源定理的陈述。将前置声明及本次需要的原陈述合并后，选取 151 个证明目标。

LogicWitnesses.lean 为每个目标先证明保留全部前置条件的版本，再按依赖顺序用闭合见证逐一实例化，生成 151 个闭合证明。全部经过 Lean kernel，151 个闭合证明的公理闭包均为空。条件证明本身不计为 correspondence 完成；只有后续运算等式或原生陈述 iff 通过，才升级源根。

本批实际闭合 72 个源根：18 定义、54 陈述。另有 13 个原部分陈述升级。67 个新陈述中 56 个另有原陈述证明（54 个条件陈述及 2 个已在依赖集合中的普通陈述）；其余只计陈述对应。前置证明数量、源根数量、覆盖证书数量分别统计。

## 原生目标

| 源声明组 | 新根 | 原生目标 |
|---|---:|---|
| unique / uniqueness / subrelation | 3 | 原生相等、量词、蕴含组成的谓词；subrelation 保留异质两端类型 |
| False / True / and 的 rec、rect | 6 | False.elim、选定值、对原生 And 投影应用分支 |
| ex / ex2 的 rec、rect | 4 | 从原生 Exists 的命题见证与证明调用依赖分支 |
| eq_ex / eq_ex2 的 rec、rect 及构造器/uncurried 变体 | 14 | 原生相等索引的分支值；证明参数按 proof irrelevance 唯一化 |
| 部分陈述与闭合后的条件陈述 | 67 | 无 Rocq / RocqPending / Rocq2Lean 符号的原生命题 |

这是指定原生表达式的对应。除 False.elim 等明确现成 API 外，不把自行组合的原生消去表达式描述成 Mathlib 现成函数。

存在量词的大消去及上述 eq_ex 消去器在导出签名中要求 A : Prop；本批保持此范围，不宣称对任意 Type 中的数据见证都可消去到 Type。rec 保持 Type 结果，rect 保持源签名的 Sort 结果。相等证明作为索引时，原生 motive 通过转换拉回；分支的所有证明参数属于已居住的命题，proof irrelevance 使任意这类分支由其唯一分支值决定。

## 陈述转换机制

1. 对有条件声明，用闭合见证实例化所有显式前置参数。
2. 用已证 iff 转换相等、逻辑连接词、存在量词、谓词和运输运算。
3. 转换依赖量词及证明参数函数族。相等的两个对象若本身是同一命题的证明，使用通用的证明无关性引理；这类等式可归约为 True，不是将任意源定理替换为 True。
4. 对运输表达式中仍隐藏源项的证明参数，只构造原生证明候选：局部证明、原生 Exists 的命题见证、Eq.symm / Eq.trans / congrArg。要求候选类型一致、候选自身无源符号，且替换前后定义相等；再检查整个命题定义相等。
5. 原生目标展开 NativeBridge 别名后再次审计。67 / 67 无源符号；生成的 iff 均通过 kernel。

## 文件与验证

- proofs/LogicWitnesses.lean、logic-witness-selection.json：151 个目标、前置依赖及闭合证明。
- proofs/LogicNormalization.lean：逻辑、证明参数与运输的通用对应。
- proofs/LogicElimination.lean、LogicExistsElimination.lean、LogicProofElimination.lean：27 个运算/谓词中的消去部分及闭合包装。
- proofs/LogicStatements.lean、logic-statement-command.lean.inc：67 个陈述的归一化、证明参数清理及 iff。
- reports/logic-statement-candidates.json：每个目标的原生命题及残留符号检查。
- reports/logic-module-coverage.json：176 个根的分类。
- reports/logic-witness-dag.json：实际前置证明 DAG；条件集合直接核对冻结导出报告。
- reports/condition-discharges.json：每个升级根实际使用的闭合见证和证书。

六个新 profile 均已编译并审计，依赖源码和 olean 指纹已核对。完整增量共同导入覆盖 812 份证书；当前共 57 个验证 profile，其中 54 个有独立覆盖入口。没有重跑机械翻译或整个旧基线。编译、试探和临时文件仍只留在远程 .work。

全项目当前完成类别为 1079 / 2180；剩余对应任务继续，下一步是 Init.Specif 的共享证明依赖。

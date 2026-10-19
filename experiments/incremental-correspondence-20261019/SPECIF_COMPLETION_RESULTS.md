# Init.Specif 完成结果

本批新增 **80 个完成根**：1 个类型、41 个运算、38 个完全原生陈述。Init.Specif 的 159 个根均已有明示范围内的对应：7 类型、60 运算、92 完全原生陈述。机械译文和机械 Nat/Eq 保持独立类型身份。

**原生目标与适用范围**

| 源声明组 | 新根数 | 原生目标／表达式 |
|---|---:|---|
| Exc | 1 | Option A；类型双向逆覆盖 A : Type u |
| error / value | 2 | none / some；完整 Sort 参数通过 Option (PLift A) 表示 |
| except / absurd_set | 2 | False.elim；保持源签名的 Prop / Type 限制 |
| sumbool / sumor 的 rec、rect | 4 | PSum.rec，依赖 motive 通过对应拉回；rec 为 Type，rect 为 Sort |
| Choice / Choice2 | 2 | Subtype / PSigma 的逐点选择函数及其证明；输入显式提供每点选择，不使用选择公理 |
| bool_choice | 1 | Bool 值选择函数和原生析取证明 |
| dependent_choice | 1 | Nat.rec 迭代及相邻项关系证明 |
| sig2_of_sigT2 | 1 | PSigma 的两个证明字段转为 Subtype 的合取字段 |
| eq_sig / eq_sig2 / eq_sigT / eq_sigT2 的 rec、rect、uncurried 和构造器变体 | 28 | 原生相等索引的分支值；proof_branch1/2/3 证明其覆盖证明参数分支 |
| 关闭条件后的陈述 | 38 | Subtype / PSigma 构造器、投影、相等消去与运输的原生命题 |

上述运算明确区分现成 API 与自行组合的原生表达式。Choice 的 S、T 为 Type，Choice2 的关系返回 Type，遵循实际导出签名；没有把这些实例扩大成所有宇宙的统一结论。Exc 的类型 Iso 限于 Type；error/value 的完整 Sort 适配使用 PLift，不代表改变了机械翻译规则。

**共享证明依赖**

70 个剩余条件根使用 116 个不同前置声明；它们包括抽取义务和被当作前置条件的普通定理。与本批原陈述合并后，共选择 140 个证明目标。每个目标先证明带条件版本，再按实际依赖顺序实例化成闭合证明。140 个闭合证明均经 Lean kernel 检查，公理闭包均为空。

本批实际完成条件闭合及对应的是 70 个源根：32 个定义、38 个陈述；另外 10 根原先只有接口或尚无证书。前置证明、完成根和覆盖证书分别计数。38 个新原生陈述均另有原陈述的闭合证明，陈述 iff 不是这些证明的替代品。

**陈述转换与证明参数**

依赖相等族直接使用原生端点 x = y，避免在 motive 的参数类型里残留 to (of x)。打包相等条件用原生 Exists、Subtype.ext 和 PSigma 等式证明组合。运输公式使用已证的转换自然性引理；针对高阶 motive 显式构造引理实例，由 simp 保存相等证明。

证明参数清理只接受不含源符号的原生候选及其类型，要求与原表达式定义相等，且整条陈述替换前后仍定义相等。源形式的类型可以在归约后与候选类型一致；不能仅凭尚未归约的类型中有源符号就拒绝。最终 38 个目标体连同证明参数和 NativeBridge 别名展开后均无 Rocq / RocqPending / Rocq2Lean 符号，iff 均通过 kernel。没有将任意源定理换成 True；True 仅用于同一命题的两个证明相等等通用证明无关性步骤。

**文件与复现**

- [共享见证](proofs/SpecifWitnesses.lean)、[选择与依赖](specif-witness-selection.json)、[证明 DAG](reports/specif-witness-dag.json)。
- [归一化引理](proofs/SpecifConditionalNormalization.lean)、[38 个陈述](proofs/SpecifClosedStatements.lean)、[逐陈述原生表达式](reports/specif-closed-statement-candidates.json)。
- [类型和消去运算](proofs/SpecifOperations.lean)、[选择与迭代](proofs/SpecifChoice.lean)、[28 个相等消去器](proofs/SpecifEqualityElimination.lean)。
- [模块逐根结果](reports/specif-module-coverage.json)、[全部证书类型及公理](reports/CERTIFICATES.md)、[实际条件装配](reports/condition-discharges.json)。

在本工作区运行：

    python3 verify.py SpecifWitnesses SpecifConditionalNormalization SpecifClosedStatements SpecifOperations SpecifChoice SpecifEqualityElimination
    python3 make_report.py
    python3 interop/pack_all.py SpecifOperations SpecifChoice SpecifEqualityElimination SpecifClosedStatements
    python3 interop/check_all.py
    python3 make_report.py

本批六个 profile 已编译并审计；依赖源码和编译产物与验证记录一致。全部 892 份当前覆盖证书已在 58 个模块中共同导入并审计（1181 个入口，7322 个依赖声明副本）；记录见 reports/interop/all/import-all-validation.json。未重跑整个旧基线或全部机械翻译，编译缓存和试探文件仅在远程 .work。

全项目完成类别为 **1159 / 2180**，仍有 1021 根处于其余类别；本层尚带条件的根从 241 降至 171，原始机械产物的 331 个显式条件根不变。下一步继续其它模块的条件闭合、原生运算等式与剩余部分陈述。

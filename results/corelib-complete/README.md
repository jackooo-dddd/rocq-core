Corelib 全量翻译结果

固定范围：Rocq 9.3.0 安装中的 67 个源模块、2180 个常量／互归纳块根声明。16 个模块没有内核根声明；tactic、notation、extraction 指令不计作已翻译。
结果：2180 项检查通过，0 项受阻。运行：/home/shunqwang4/research/rocq-core/experiments/mechanical-nat-eq-20261019/runs/full-v1。

| 分类 | 数量 | 使用含义 |
|---|---:|---|
| TRANSLATED_AND_CHECKED | 1003 | 完整定义／数据类型，无待证参数 |
| BOOTSTRAP_RESOLVED | 0 | 已有 Lean 对应 |
| STATEMENT_KERNEL_CHECKED | 846 | 定理／公理陈述，无待证参数；不是已证明定理 |
| PENDING_KERNEL_CHECKED | 148 | 带显式待证参数的定义 |
| STATEMENT_PENDING_KERNEL_CHECKED | 183 | 带显式待证参数的陈述；不是已证明定理 |

完整定义可以用于 Lean 类型检查、证明和内核归约。导入器注册内核声明，但不为生成的数据类型自动执行 Lean 代码生成；因此不承诺直接 #eval／编译可执行程序，依赖这些类型的桥接定义可标记 noncomputable 来使用其内核语义。带待证参数的定义必须先提供这些参数。陈述对应一个命题的定义，并非该命题的证明；无待证依赖也不表示定理已经证明。
本次没有 bootstrap 映射。Rocq nat 和 eq 与 List、Bool 一样，机械生成 Rocq 命名空间下的独立归纳类型、构造器及消去器。已经检查它们不与 Lean 原生 Nat/Eq 定义相等。后续独立实验已完成 nat/eq 的双向对应和依赖消去证明；最新证明和旧证书迁移结果见仓库 experiments/mechanical-correspondence-20261019/README.md。


文件对应关系：
- Corelib/.../Name.v：原 Rocq 文件副本。
- Corelib/.../Name.lean：可执行的独立翻译入口，并打印该文件所有根声明、quality 分支及显式条件。
- Corelib/.../Name.txt：Lean 实际打印的类型／正文；不把打印文本伪装成独立可编译包。
- Corelib/.../Name.md：逐声明状态、规则、尝试顺序、条件、基线失败阶段与原因。
- Corelib/.../Name.json：完整源 IR、目标类型／正文 AST、quality 分支、条件声明和验证证据路径。
- declarations.csv：2180 项可筛选总表；summary.json：固定范围、分类、逐模块计数。

过程：MetaRocq 导出依赖闭包与证明条件 → 按声明分派并尝试宇宙解释/表示转换 → Lean 注册声明 → Rocq 源端 roundtrip、独立 Lean consumer 与独立结构审计。所有有根声明的模块均通过这三项检查；补充 campaign 完成。
JSON 中的机制是实际使用记录；并非声称每一项机制都是该声明不可缺少的最小集合。基线失败保留原始报错；未凭错误文本编造缺失规则。
每个 Lean 入口包含自己的依赖闭包。它们是逐文件研究产物，不是保证可同时 import 的统一 Lean 库；入口引用远程冻结运行中的绝对路径，须在保留仓库路径的工作站使用。

运行单个入口：python3 /home/shunqwang4/research/rocq-core/experiments/mechanical-nat-eq-20261019/results/run_lean_entry.py Corelib/Init/Nat.lean。冻结工具链已安装，不需新装框架。

| 源模块 | 根声明数 | 结果 |
|---|---:|---|
| Corelib.Array.ArrayAxioms | 11 | [逐项结果](Corelib/Array/ArrayAxioms.md) |
| Corelib.Array.PrimArray | 8 | [逐项结果](Corelib/Array/PrimArray.md) |
| Corelib.BinNums.IntDef | 39 | [逐项结果](Corelib/BinNums/IntDef.md) |
| Corelib.BinNums.NatDef | 11 | [逐项结果](Corelib/BinNums/NatDef.md) |
| Corelib.BinNums.PosDef | 36 | [逐项结果](Corelib/BinNums/PosDef.md) |
| Corelib.Classes.CMorphisms | 78 | [逐项结果](Corelib/Classes/CMorphisms.md) |
| Corelib.Classes.CRelationClasses | 81 | [逐项结果](Corelib/Classes/CRelationClasses.md) |
| Corelib.Classes.Equivalence | 17 | [逐项结果](Corelib/Classes/Equivalence.md) |
| Corelib.Classes.Init | 2 | [逐项结果](Corelib/Classes/Init.md) |
| Corelib.Classes.Morphisms | 87 | [逐项结果](Corelib/Classes/Morphisms.md) |
| Corelib.Classes.Morphisms_Prop | 29 | [逐项结果](Corelib/Classes/Morphisms_Prop.md) |
| Corelib.Classes.RelationClasses | 103 | [逐项结果](Corelib/Classes/RelationClasses.md) |
| Corelib.Classes.SetoidTactics | 3 | [逐项结果](Corelib/Classes/SetoidTactics.md) |
| Corelib.Compat.Coq818 | 0 | [逐项结果](Corelib/Compat/Coq818.md) |
| Corelib.Compat.Coq819 | 0 | [逐项结果](Corelib/Compat/Coq819.md) |
| Corelib.Compat.Coq820 | 0 | [逐项结果](Corelib/Compat/Coq820.md) |
| Corelib.Compat.Rocq90 | 0 | [逐项结果](Corelib/Compat/Rocq90.md) |
| Corelib.Compat.Rocq91 | 0 | [逐项结果](Corelib/Compat/Rocq91.md) |
| Corelib.Compat.Rocq92 | 0 | [逐项结果](Corelib/Compat/Rocq92.md) |
| Corelib.Floats.FloatAxioms | 33 | [逐项结果](Corelib/Floats/FloatAxioms.md) |
| Corelib.Floats.FloatClass | 1 | [逐项结果](Corelib/Floats/FloatClass.md) |
| Corelib.Floats.FloatOps | 8 | [逐项结果](Corelib/Floats/FloatOps.md) |
| Corelib.Floats.PrimFloat | 37 | [逐项结果](Corelib/Floats/PrimFloat.md) |
| Corelib.Floats.SpecFloat | 55 | [逐项结果](Corelib/Floats/SpecFloat.md) |
| Corelib.Init.Byte | 10 | [逐项结果](Corelib/Init/Byte.md) |
| Corelib.Init.Datatypes | 110 | [逐项结果](Corelib/Init/Datatypes.md) |
| Corelib.Init.Decimal | 40 | [逐项结果](Corelib/Init/Decimal.md) |
| Corelib.Init.Equality | 22 | [逐项结果](Corelib/Init/Equality.md) |
| Corelib.Init.Hexadecimal | 38 | [逐项结果](Corelib/Init/Hexadecimal.md) |
| Corelib.Init.Logic | 176 | [逐项结果](Corelib/Init/Logic.md) |
| Corelib.Init.Ltac | 0 | [逐项结果](Corelib/Init/Ltac.md) |
| Corelib.Init.Nat | 58 | [逐项结果](Corelib/Init/Nat.md) |
| Corelib.Init.Notations | 0 | [逐项结果](Corelib/Init/Notations.md) |
| Corelib.Init.Number | 17 | [逐项结果](Corelib/Init/Number.md) |
| Corelib.Init.Peano | 36 | [逐项结果](Corelib/Init/Peano.md) |
| Corelib.Init.Prelude | 3 | [逐项结果](Corelib/Init/Prelude.md) |
| Corelib.Init.Specif | 159 | [逐项结果](Corelib/Init/Specif.md) |
| Corelib.Init.Sumbool | 7 | [逐项结果](Corelib/Init/Sumbool.md) |
| Corelib.Init.Tactics | 2 | [逐项结果](Corelib/Init/Tactics.md) |
| Corelib.Init.Tauto | 0 | [逐项结果](Corelib/Init/Tauto.md) |
| Corelib.Init.Wf | 21 | [逐项结果](Corelib/Init/Wf.md) |
| Corelib.Lists.ListDef | 10 | [逐项结果](Corelib/Lists/ListDef.md) |
| Corelib.Numbers.BinNums | 15 | [逐项结果](Corelib/Numbers/BinNums.md) |
| Corelib.Numbers.Cyclic.Int63.CarryType | 1 | [逐项结果](Corelib/Numbers/Cyclic/Int63/CarryType.md) |
| Corelib.Numbers.Cyclic.Int63.PrimInt63 | 37 | [逐项结果](Corelib/Numbers/Cyclic/Int63/PrimInt63.md) |
| Corelib.Numbers.Cyclic.Int63.Sint63Axioms | 8 | [逐项结果](Corelib/Numbers/Cyclic/Int63/Sint63Axioms.md) |
| Corelib.Numbers.Cyclic.Int63.Uint63Axioms | 48 | [逐项结果](Corelib/Numbers/Cyclic/Int63/Uint63Axioms.md) |
| Corelib.Program.Basics | 6 | [逐项结果](Corelib/Program/Basics.md) |
| Corelib.Program.Tactics | 1 | [逐项结果](Corelib/Program/Tactics.md) |
| Corelib.Program.Utils | 0 | [逐项结果](Corelib/Program/Utils.md) |
| Corelib.Program.Wf | 12 | [逐项结果](Corelib/Program/Wf.md) |
| Corelib.Relations.Relation_Definitions | 23 | [逐项结果](Corelib/Relations/Relation_Definitions.md) |
| Corelib.Setoids.Setoid | 6 | [逐项结果](Corelib/Setoids/Setoid.md) |
| Corelib.Strings.PrimString | 17 | [逐项结果](Corelib/Strings/PrimString.md) |
| Corelib.Strings.PrimStringAxioms | 12 | [逐项结果](Corelib/Strings/PrimStringAxioms.md) |
| Corelib.derive.Derive | 0 | [逐项结果](Corelib/derive/Derive.md) |
| Corelib.extraction.ExtrHaskellBasic | 0 | [逐项结果](Corelib/extraction/ExtrHaskellBasic.md) |
| Corelib.extraction.ExtrOcamlBasic | 0 | [逐项结果](Corelib/extraction/ExtrOcamlBasic.md) |
| Corelib.extraction.Extraction | 0 | [逐项结果](Corelib/extraction/Extraction.md) |
| Corelib.ssr.ssrbool | 451 | [逐项结果](Corelib/ssr/ssrbool.md) |
| Corelib.ssr.ssrclasses | 4 | [逐项结果](Corelib/ssr/ssrclasses.md) |
| Corelib.ssr.ssreflect | 0 | [逐项结果](Corelib/ssr/ssreflect.md) |
| Corelib.ssr.ssreflect_rw | 55 | [逐项结果](Corelib/ssr/ssreflect_rw.md) |
| Corelib.ssr.ssrfun | 128 | [逐项结果](Corelib/ssr/ssrfun.md) |
| Corelib.ssr.ssrsetoid | 1 | [逐项结果](Corelib/ssr/ssrsetoid.md) |
| Corelib.ssr.ssrunder | 7 | [逐项结果](Corelib/ssr/ssrunder.md) |
| Corelib.ssrmatching.ssrmatching | 0 | [逐项结果](Corelib/ssrmatching/ssrmatching.md) |

大体积 JSON 在 Git 中保存为无损 .json.gz；原始 .json 保留在工作站。克隆后在仓库根运行 python3 scripts/restore_artifacts.py 可恢复原文件；完整清单见仓库 ARTIFACTS.json。编译缓存与中间尝试不提交。

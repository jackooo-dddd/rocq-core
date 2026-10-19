# Rocq Corelib → Lean


- [实际使用规则清单](results/USED_RULES.md)：原 34 条＋实测命中的 10 条 M 规则，共 44 项；关闭 3 条零命中 M 路径后，2180 根仍全部通过。
- [Nat 完整案例](results/casestudy/README.md)：源类型与58项运算、逐声明译文/过程、导出文件解释及原生对应证明。

当前基线：**先机械翻译，后证明与 Lean 原生对象的 correspondence**。

- 67 个模块、2180 个根声明：0 受阻，0 验证失败。
- 1003 项定义／数据类型、846 项无条件陈述、148 项带条件定义、183 项带条件陈述；331 项条件仍在机械产物中显式保留；correspondence 层已闭合实例化其中 314 项，本层剩余 17。
- Relation_Definitions、RelationClasses、Morphisms、Equivalence、Morphisms_Prop、Setoid 六个模块的 265 根均有明示范围内的对应证书；其他 Classes 模块继续推进。
- 源 nat、eq 均生成独立归纳类型，不再映射原生 Nat/Eq。其双向对应和依赖消去对应已在 Lean 中证明。
- 最新覆盖：164 个类型根、908 个运算根、1028 个完整原生陈述，共 2100 / 2180；其余类别见对应报告。陈述 iff 本身不是业务定理证明；318 个陈述另有独立闭合的原陈述证明。

[最新 correspondence 计划与增量结果](experiments/incremental-correspondence-20261019/README.md) · [依赖 DAG](experiments/incremental-correspondence-20261019/DAG.md)

[当前结果与验证](RESULTS.md) · [全部规则与使用次数](results/corelib-complete/ALL_RULES.md) · [correspondence](results/corelib-complete/CORRESPONDENCE.md) · [逐文件翻译](results/corelib-complete/README.md) · [证明目录](experiments/mechanical-correspondence-20261019/README.md)

translator/ 已同步经验证的机械 nat/eq 实现。实验固定快照和证明保存在 experiments/ 中。
规则目录保留 118 个审阅编号，其中 T06 已停用；它们包含检查与调度，不能解释为 118 条独立语义转换规则。

历史 839 项结果和旧 bootstrap 基线保留供比较，不代表当前行为。历史完整运行、失败尝试、构建缓存留在远程工作站并由 .gitignore 排除。发布范围及复现说明见 [PUBLISHING.txt](PUBLISHING.txt)。

跨模块消费已验证：145 个包含覆盖证书的 profile、1848 份增量证书可共同导入。另有机械 Nat、SSR Option、Setoid 与 Mathlib 的实际消费例，验证范围见 [P7 结果](experiments/incremental-correspondence-20261019/INTEROP_RESULTS.md)。

最新完成模块包括 Init.Nat、Init.Peano、Init.Datatypes、Init.Logic、Init.Specif 和 Lists.ListDef；每个证书的 universe 与参数范围仍需按完整类型理解。[Init.Specif 最新结果](experiments/incremental-correspondence-20261019/SPECIF_COMPLETION_RESULTS.md)新增 80 个完成根。

[SSR 函数与谓词最新结果](experiments/incremental-correspondence-20261019/SSR_FUN_RESULTS.md)：27 个谓词自动生成原生目标，50 个陈述全部原生化，Option 运算扩展到完整 Sort 参数。

[SSR 数据与条件声明最新结果](experiments/incremental-correspondence-20261019/SSR_DATA_RESULTS.md)：新增 23 根，ssrfun 已完成 124 / 128；四个 opaque 计算函数仍缺可用计算等式。

[SSR Bool 最新结果](experiments/incremental-correspondence-20261019/SSR_BOOL_DATA_RESULTS.md)：新增 14 个类型、34 个运算、46 个完整原生陈述；ssrbool 完成 251 / 451。

[SSR 包装与陈述最新结果](experiments/incremental-correspondence-20261019/SSR_PACKAGING_RESULTS.md)：新增 52 根；ssrbool 已完成 301 / 451，原有部分陈述全部完成。

具体对应例子与证明位置见 [CORRESPONDENCE_EXAMPLES.md](results/CORRESPONDENCE_EXAMPLES.md)：gcd、sqrt、饱和减法、mask、带符号幂／移位、if_spec 与 Type 值关系。

[二进制运算完成结果](experiments/incremental-correspondence-20261019/BATCH37_39_RESULTS.md)：BinNums.PosDef／NatDef／IntDef 的 86 根全部有对应证书；包括除法取整方向、平方根与余数、任意运算的二进制迭代。Numbers.BinNums 的消去器已在后续批次完成。

[依赖消去与数字表示最新结果](experiments/incremental-correspondence-20261019/BATCH40_43_RESULTS.md)：Numbers.BinNums 15/15、Init.Decimal 40/40、Init.Hexadecimal 38/38、Init.Number 17/17；保留格式、前导零和负零，9 个相等判定函数的 36 个前提已闭合。

[字节、机器整数、字节串与通用相等接口](experiments/incremental-correspondence-20261019/BATCH44_48_RESULTS.md)：新增 64 根；Byte、PrimInt63、CarryType、PrimString、Init.Equality、PrimArray 已完成明示范围内的对应。

[良基递归与 SSR 重写接口](experiments/incremental-correspondence-20261019/BATCH49_54_RESULTS.md)：新增 76 根，条件剩余 17；Init.Wf、ssrclasses、ssrunder 完成，Program.Wf 10/12、ssreflect_rw 52/55。

[63 位整数定义与转换](experiments/incremental-correspondence-20261019/BATCH55_56_RESULTS.md)：Uint63Axioms 的 22 个透明定义全部对应到原生 BitVec/Nat/Int 表达式；全部输入与任意递归位数均覆盖。

[63 位整数规格](experiments/incremental-correspondence-20261019/BATCH57_59_RESULTS.md)：15 项规格完成原生陈述对应，并独立证明源陈述；Uint63Axioms 当前 37/48。

[整数算术、移位与零位计数规格](experiments/incremental-correspondence-20261019/BATCH60_62_RESULTS.md)：新增 9 项全域规格和原陈述证明；Uint63Axioms 已审计完成 46/48。

[机器整数规格完成](experiments/incremental-correspondence-20261019/BATCH63_65_RESULTS.md)：Uint63Axioms 48/48、Sint63Axioms 8/8；全部规格保留原始前提并独立证明。另补现成 BitVec.sdiv/srem 的直接对应。

[符号浮点完成](experiments/incremental-correspondence-20261019/BATCH76_81_RESULTS.md)：SpecFloat 55/55，比较、加减乘除、开方和相邻值均证明为原生 Bool/Nat/Int 的精确符号算法。尚未证明等于运行时 Float API。

[原语浮点表示与运算完成](experiments/incremental-correspondence-20261019/BATCH82_85_RESULTS.md)：PrimFloat 37/37，规范 binary64 对应 Option/Sum/Fin/BitVec 组合，逐位整数开方另证明等于 Nat.sqrt。

[浮点转换与规格陈述对应](experiments/incremental-correspondence-20261019/BATCH86_89_RESULTS.md)：FloatOps 8/8、FloatAxioms 33/33；其中 24 项是完整原生陈述 iff，没有将它们计作独立证明的原定理。

[计算透明变体](experiments/incremental-correspondence-20261019/transparent-data/README.md)：保留机械正文、仅将非 Prop opaque 数据重新导出为 def，已单独证明 37/80 个剩余候选根；原冻结基线仍为 2100/2180。这些是新命名空间定义的对应，不是原 opaque 常量与新定义的等式。

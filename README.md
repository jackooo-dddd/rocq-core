# Rocq Corelib → Lean

- [实际使用规则清单](results/USED_RULES.md)：仅列当前机械基线有使用证据的条目及原语映射。
- [Nat 完整案例](results/casestudy/README.md)：源类型与58项运算、逐声明译文/过程、导出文件解释及原生对应证明。

当前基线：**先机械翻译，后证明与 Lean 原生对象的 correspondence**。

- 67 个模块、2180 个根声明：0 受阻，0 验证失败。
- 1003 项定义／数据类型、846 项无条件陈述、148 项带条件定义、183 项带条件陈述；331 项条件仍在机械产物中显式保留；correspondence 层已闭合实例化其中 164 项，本层剩余 167。
- Relation_Definitions、RelationClasses、Morphisms、Equivalence、Morphisms_Prop、Setoid 六个模块的 265 根均有明示范围内的对应证书；其他 Classes 模块继续推进。
- 源 nat、eq 均生成独立归纳类型，不再映射原生 Nat/Eq。其双向对应和依赖消去对应已在 Lean 中证明。
- 最新覆盖：84 个类型根、504 个运算根、767 个完整原生陈述，共 1355 / 2180；其余类别见对应报告。陈述 iff 本身不是业务定理证明；139 个陈述另有独立闭合的原陈述证明。

[最新 correspondence 计划与增量结果](experiments/incremental-correspondence-20261019/README.md) · [依赖 DAG](experiments/incremental-correspondence-20261019/DAG.md)

[当前结果与验证](RESULTS.md) · [全部规则与使用次数](results/corelib-complete/ALL_RULES.md) · [correspondence](results/corelib-complete/CORRESPONDENCE.md) · [逐文件翻译](results/corelib-complete/README.md) · [证明目录](experiments/mechanical-correspondence-20261019/README.md)

translator/ 已同步经验证的机械 nat/eq 实现。实验固定快照和证明保存在 experiments/ 中。
规则目录保留 118 个审阅编号，其中 T06 已停用；它们包含检查与调度，不能解释为 118 条独立语义转换规则。

历史 839 项结果和旧 bootstrap 基线保留供比较，不代表当前行为。历史完整运行、失败尝试、构建缓存留在远程工作站并由 .gitignore 排除。发布范围及复现说明见 [PUBLISHING.txt](PUBLISHING.txt)。

跨模块消费已验证：68 个包含覆盖证书的 profile、1093 份增量证书可共同导入。另有机械 Nat、SSR Option、Setoid 与 Mathlib 的实际消费例，验证范围见 [P7 结果](experiments/incremental-correspondence-20261019/INTEROP_RESULTS.md)。

最新完成模块包括 Init.Nat、Init.Peano、Init.Datatypes、Init.Logic、Init.Specif 和 Lists.ListDef；每个证书的 universe 与参数范围仍需按完整类型理解。[Init.Specif 最新结果](experiments/incremental-correspondence-20261019/SPECIF_COMPLETION_RESULTS.md)新增 80 个完成根。

[SSR 函数与谓词最新结果](experiments/incremental-correspondence-20261019/SSR_FUN_RESULTS.md)：27 个谓词自动生成原生目标，50 个陈述全部原生化，Option 运算扩展到完整 Sort 参数。

[SSR 数据与条件声明最新结果](experiments/incremental-correspondence-20261019/SSR_DATA_RESULTS.md)：新增 23 根，ssrfun 已完成 124 / 128；四个 opaque 计算函数仍缺可用计算等式。

[SSR Bool 最新结果](experiments/incremental-correspondence-20261019/SSR_BOOL_DATA_RESULTS.md)：新增 14 个类型、34 个运算、46 个完整原生陈述；ssrbool 完成 251 / 451。

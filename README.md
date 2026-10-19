# Rocq Corelib → Lean

- [Nat 完整案例](results/casestudy/README.md)：源类型与58项运算、逐声明译文/过程、导出文件解释及原生对应证明。

当前基线：**先机械翻译，后证明与 Lean 原生对象的 correspondence**。

- 67 个模块、2180 个根声明：0 受阻，0 验证失败。
- 1003 项定义／数据类型、846 项无条件陈述、148 项带条件定义、183 项带条件陈述；331 项条件仍在机械产物中显式保留；correspondence 层已闭合实例化其中 15 项，本层剩余 316。
- Relation_Definitions、RelationClasses、Morphisms、Equivalence、Morphisms_Prop、Setoid 六个模块的 265 根均有明示范围内的对应证书；其他 Classes 模块继续推进。
- 源 nat、eq 均生成独立归纳类型，不再映射原生 Nat/Eq。其双向对应和依赖消去对应已在 Lean 中证明。
- 最新覆盖：63 个类型根、294 个运算根、518 个完整原生陈述；其他覆盖与限制见对应报告。陈述 iff 本身不是业务定理证明；其中 43 个陈述另有原生性质推导的证明（8 个数字比较、5 个依赖 Subtype、4 个 Eq/布尔等式、26 个关系与 Classes/Setoid 性质）。

[最新 correspondence 计划与增量结果](experiments/incremental-correspondence-20261019/README.md) · [依赖 DAG](experiments/incremental-correspondence-20261019/DAG.md)

[当前结果与验证](RESULTS.md) · [全部规则与使用次数](results/corelib-complete/ALL_RULES.md) · [correspondence](results/corelib-complete/CORRESPONDENCE.md) · [逐文件翻译](results/corelib-complete/README.md) · [证明目录](experiments/mechanical-correspondence-20261019/README.md)

translator/ 已同步经验证的机械 nat/eq 实现。实验固定快照和证明保存在 experiments/ 中。
规则目录保留 118 个审阅编号，其中 T06 已停用；它们包含检查与调度，不能解释为 118 条独立语义转换规则。

历史 839 项结果和旧 bootstrap 基线保留供比较，不代表当前行为。历史完整运行、失败尝试、构建缓存留在远程工作站并由 .gitignore 排除。发布范围及复现说明见 [PUBLISHING.txt](PUBLISHING.txt)。

跨模块消费已验证：30 个 profile 的 585 份增量证书可共同导入；机械 Nat、SSR Option 和 Setoid 可组合使用，并调用 Mathlib 的 Nat.prime_two。详见 [P7 验证范围](experiments/incremental-correspondence-20261019/INTEROP_RESULTS.md)。

最新数字写出批次新增 12 个完成根，累计 875；对应原生表达式及打印数值证明见 [数字写出结果](experiments/incremental-correspondence-20261019/NUMERIC_WRITE_RESULTS.md)。

# Rocq Corelib → Lean

- [Nat 完整案例](results/casestudy/README.md)：源类型与58项运算、逐声明译文/过程、导出文件解释及原生对应证明。

当前基线：**先机械翻译，后证明与 Lean 原生对象的 correspondence**。

- 67 个模块、2180 个根声明：0 受阻，0 验证失败。
- 1003 项定义／数据类型、846 项无条件陈述、148 项带条件定义、183 项带条件陈述；331 项条件仍显式保留。
- 源 nat、eq 均生成独立归纳类型，不再映射原生 Nat/Eq。其双向对应和依赖消去对应已在 Lean 中证明。
- 最新覆盖：33 个类型根、150 个运算根、284 个完整原生陈述；其他覆盖与限制见对应报告。陈述 iff 不是业务定理证明。

[最新 correspondence 计划与增量结果](experiments/incremental-correspondence-20261019/README.md) · [依赖 DAG](experiments/incremental-correspondence-20261019/DAG.md)

[当前结果与验证](RESULTS.md) · [全部规则与使用次数](results/corelib-complete/ALL_RULES.md) · [correspondence](results/corelib-complete/CORRESPONDENCE.md) · [逐文件翻译](results/corelib-complete/README.md) · [证明目录](experiments/mechanical-correspondence-20261019/README.md)

translator/ 已同步经验证的机械 nat/eq 实现。实验固定快照和证明保存在 experiments/ 中。
规则目录保留 118 个审阅编号，其中 T06 已停用；它们包含检查与调度，不能解释为 118 条独立语义转换规则。

历史 839 项结果和旧 bootstrap 基线保留供比较，不代表当前行为。历史完整运行、失败尝试、构建缓存留在远程工作站并由 .gitignore 排除。发布范围及复现说明见 [PUBLISHING.txt](PUBLISHING.txt)。

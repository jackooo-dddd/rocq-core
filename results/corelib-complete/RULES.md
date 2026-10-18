规则与精简结果

本页按机制归类，分类数量不等于代码中的规则/开关数量。逐声明实际规则、所有尝试标签、宇宙实例、转换及条件见同名 JSON/MD。

1. 源端分类和证明条件：按实际归约后的 Prop/SProp 结果分类，保留局部假设的应用；证明实现抽取成显式条件，支持多态条件的不同实例。最终 pending 状态依据实际剩余条件 telescope。
2. 宇宙约束与解释：完整导出并重查原生事实；显式参数、模板 Sort 参数、局部约束闭包与必要的实例对应保留。带全局上界的局部解释只处理受检查的向外约束片段；公开参数、原生约束和引用检查没有省略。
3. SProp/Prop/Type quality：23 个原始根以原生检查过的完整 quality family 表示，共603种实例（23个主项加580个额外分支）。不把23个原始根从统计范围删除。
4. 精确源转换：透明别名的实际实例替换、beta/delta/zeta 化简、已知构造器驱动的受限递归求值。独立审计重建每次展开；不任意展开 opaque 证明。
5. 显式累积表示：PULift up/down，函数参数和结果的组合转换，以及非递归、单构造器、无索引记录的逐字段转换。保留字段次序、载荷、全部依赖类型及公共条件。
6. 递归与消去：结构递归、真实内核 recursor、accessibility/well-founded 对应和受检查的 deferred guard 处理；终止性所需条件保持显式。
7. 原语模型：kernel-registered Int63→BitVec63；有界数组；字节串；保留符号零/无穷/NaN的 binary64 模型。操作身份、大小界限、构造器角色、源端原语与目标载荷分别核查。
8. 原生对应：nat→Lean Nat，eq→Lean Eq；其他数据类型按报告生成，不能自动声称与 Lean 同名类型可互换。

检查配套包括源端 roundtrip、独立 Lean consumer/内核检查、独立结构审计、公共接口/宇宙检查及错误注入测试。定理陈述不是定理证明；待证条件没有被藏成 axiom 或 sorry。

最后一轮精简 main74→main75：
- liftCoerceValue 的 Type 路径不再先走独立 direct up/down，再走组合 up/down；统一由递归组合规则处理，直接转换是其基本情况。
- 两处失败回滚合并为 tryLiftConversion，同时恢复 elaborator 状态与转换计数。
- 保留 Prop-only 早期路径的限制；不删除独立校验、不改变源范围。
- 全2180项覆盖保持0受阻，完整回归和所有 campaign 检查通过。
- 包含依赖、辅助声明及 quality 分支的全部 4314 条逐模块声明出现，其状态、名称、目标种类、类型、正文、构造器、宇宙参数及待证条件均与精简前完全一致（结构 JSON 比较，不是仅比较成功率）。

这是一轮经验证的重复机制合并，不是“规则数量已达到数学上的全局最小值”的证明。保留未能证明冗余的通用规则，尤其不能仅凭2180个根的命中次数删除其依赖或MathComp可能需要的路径。

规则命中统计见 rule-usage.json；精简补丁见 simplification.patch；全声明比较见 simplification-artifacts.json。早期失败实验留在 work/snapshots 和 work/tests 中，不作为成功证据。

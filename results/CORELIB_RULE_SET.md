# 已验证的 Corelib 翻译规则集合

已在独立翻译器验证：**67 模块、2180 根，0 受阻**。源端、Lean consumer、结构 audit 全部通过。

配置由固定核心和 **13 个启用的可选转换入口**组成；本轮从 21 个入口中关闭了 8 个。
这些数量不是 34 个使用证据条目的重新计数，也不是全局最小语义规则数。

[完整规则集合、保留／关闭清单及失败见证](../experiments/corelib-rule-set-20261019/README.md)

[实际配置](../experiments/corelib-rule-set-20261019/corelib.json) · [固定核心](../experiments/corelib-rule-set-20261019/FIXED_CORE.md) · [验证结果](../experiments/corelib-rule-set-20261019/VALIDATION.json)

nat、eq 仍机械生成独立归纳类型；普通定理仍按陈述模式处理，显式待证条件不会被视为已经证明。
相比旧基线有 174 个声明的目标表示变化（其中 71 个原始根）；未据此宣称已重跑全部旧 correspondence。

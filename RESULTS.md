# 当前 Corelib 机械翻译与对应证明

已验证快照：experiments/mechanical-nat-eq-20261019/translator；完整运行：experiments/mechanical-nat-eq-20261019/runs/full-v1。
当前 translator/ 已采用相同的机械 nat/eq 实现；main75 是取消 bootstrap 前的历史基线。

67 个源模块，2180 个根声明，0 受阻、0 验证失败。1003 项定义／数据类型、846 项无条件陈述、148 项带条件定义、183 项带条件陈述；无 BOOTSTRAP_RESOLVED，331 项待证明条件仍然保留。普通定理陈述不是其证明。

nat 和 eq 都通过普通归纳规则翻译为独立目标类型。与 Lean Nat/Eq 的双向对应、依赖 transport、主要运算保持另行证明；主对应公理闭包为空。旧 98 个证明文件原样运行有 12 个失败，迁移后 101 个 profile 全部通过。
旧 28 份类型 Iso、109 份运算证书、845 份陈述 iff 已重验。当前总覆盖和 5 项自动依赖接口限制见对应报告，不能把“0 机械翻译受阻”当成“全部原生对应已证明”。

- [逐模块翻译、目标 AST 与条件](results/corelib-complete/README.md)
- [2180 项翻译总表](results/corelib-complete/declarations.csv)
- [规则清单](results/corelib-complete/ALL_RULES.md)与[逐项使用次数](results/corelib-complete/RULE_USAGE.md)
- [Universe 统计](results/corelib-complete/UNIVERSES.md)
- [correspondence 总览](results/corelib-complete/CORRESPONDENCE.md)
- [逐项对应覆盖](experiments/incremental-correspondence-20261019/reports/CORELIB_LEDGER.csv)
- [迁移检查](experiments/mechanical-correspondence-20261019/reports/REGRESSION.json)
- [统一使用示例](experiments/mechanical-correspondence-20261019/UseNative.lean)

main74→main75 的精简证据保留为历史比较；取消 nat/eq bootstrap 没有增加新翻译规则。

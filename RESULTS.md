# 当前 Corelib 机械翻译与对应证明

机械翻译快照：experiments/mechanical-nat-eq-20261019/runs/full-v1。67 个源模块、2180 个去重根，0 受阻、0 验证失败；nat/eq 使用独立归纳结构，随后证明对应。

机械产物包含 1003 项定义／数据类型、846 项无条件陈述、148 项带条件定义、183 项带条件陈述。331 项条件仍在机械产物中显式保留。普通定理陈述不是其证明。

## 对应结果

| 版本 | 类型对应 | 运算对应 | 原生陈述 iff | 完成根 | 剩余 |
|---|---:|---:|---:|---:|---:|
| 原冻结机械版本 | 164 | 908 | 1028 | 2100 / 2180 | 80 |
| 计算透明变体 | 164 | 988 | 1028 | 2180 / 2180 | 0 |

变体把保留正文的非 Prop opaque 数据声明在独立命名空间重导出为 def。它保留改名后的类型、universe 和正文，重新进行 kernel 检查；不声称旧 opaque 常量与新定义的值等式已被证明。正式 translator/ 及原冻结机械产物保持原有语义。

原有 2100 根经 173 个 profile 重新检查，新增 80 根经 6 个 profile 证明；共同导入、标准公理检查和 Mathlib 消费例全部通过。2180 是逐根覆盖，具体参数与质量分支范围见证书。1028 项陈述 iff 不等于 1028 个源定理已经证明；另有 318 份原陈述 Prop 证明。

## 入口

- [变体说明、证明与复现](experiments/incremental-correspondence-20261019/transparent-data/README.md)
- [完整变体逐根账本](experiments/incremental-correspondence-20261019/transparent-data/reports/FULL_VARIANT_LEDGER.json)
- [完整变体验证摘要](experiments/incremental-correspondence-20261019/transparent-data/reports/FULL_VARIANT_SUMMARY.json)
- [原冻结对应账本](experiments/incremental-correspondence-20261019/reports/CORELIB_LEDGER.csv)
- [具体对应与消费例](results/CORRESPONDENCE_EXAMPLES.md)
- [逐模块机械翻译、目标 AST 与条件](results/corelib-complete/README.md)
- [2180 项机械翻译总表](results/corelib-complete/declarations.csv)
- [实际使用规则](results/USED_RULES.md)、[全部规则](results/corelib-complete/ALL_RULES.md)、[使用次数](results/corelib-complete/RULE_USAGE.md)
- [Universe 统计](results/corelib-complete/UNIVERSES.md)
- [对应范围解释](results/corelib-complete/CORRESPONDENCE.md)

原生目标包括现成 API、组合表达式及表示模型。浮点符号算法的对应不表示已经证明运行时 Float API 的对应；全体 Corelib 根有证书也不等于完整 MathComp/Prosa 已自动互通。

构建缓存、完整编译日志和临时输入仅保留在远程 .work 中。原机械 nat/eq 迁移及各批次结果保留为历史记录。

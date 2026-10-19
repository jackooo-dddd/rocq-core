# 当前规则审阅入口：机械 nat／eq

[全部规则与逐项使用统计](results/corelib-complete/ALL_RULES.md) · [重试统计](results/corelib-complete/RULE_USAGE.md) · [CSV](results/corelib-complete/RULE_USAGE.csv) · [命中声明 JSON](results/corelib-complete/RULE_USAGE.json)

范围：67 模块、2180 个根。118 个审阅编号中 T06 已停用；其余仍包含检查和调度机制，不等于 117 条新增语义规则。61 个原语操作映射另列。
nat/eq 普通归纳生成，不再 bootstrap；类型对应与运算对应在翻译后证明，见 [CORRESPONDENCE.md](results/corelib-complete/CORRESPONDENCE.md)。

统计已从 mechanical-nat-eq-20261019/full-v1 重新提取。报告命中、覆盖、下界、未记录四种口径保持不变；未记录不等于零。
复现：python3 scripts/catalog_rule_usage.py。它读取已提交的紧凑证据；加 --extract 从完整逐文件结果重提取。

历史 main75 的规则统计保存在 results/corelib-main75-bootstrap，早期工作目录留在远程；当前源码、证明、关键结果随本次提交发布。

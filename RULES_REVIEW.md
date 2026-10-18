main75 规则审阅入口

[全部规则、适用限制与逐项使用统计](results/corelib-complete/ALL_RULES.md)
[使用统计与重试次数](results/corelib-complete/RULE_USAGE.md)
[可筛选 CSV](results/corelib-complete/RULE_USAGE.csv)
[逐声明命中证据 JSON](results/corelib-complete/RULE_USAGE.json)

范围：2180 个原始 Corelib 根。118 个审阅条目包含翻译、校验及调度机制，并非 118 条新增语义规则；另列 61 个原语映射。
统计区分主表示与纳入 quality 分支后的根覆盖。46 项有明确报告命中，23 项只能统计覆盖范围，3 项为可确认下界，46 项没有独立事件记录。未记录不等于零；父规则使用次数不能分摊成子规则的使用次数。

复现：在仓库根目录运行 python3 scripts/catalog_rule_usage.py。
输入是随本次提交保存的 rule-usage-evidence.json。脚本重建统计并交叉核对已有 11 个汇总字段；不用运行 Lean 或访问远程机器。完整命中名单在 JSON 中。

来源：远程 /home/shunqwang4/research/rocq-core/work/snapshots/quality-main75/translator 及 work/runs/quality-main75-full。
本次提交保存规则审阅材料与紧凑统计证据；完整逐模块 AST、运行目录和此前未提交的翻译器实验改动仍在远程。

# 导出文件逐项说明

列出三个冻结运行目录中的每个文件；未收录的编译缓存仍留在远程原目录。

| 模块 | 文件 | 已收录 | 解释 |
|---|---|---|---|
| Datatypes | .Export.aux | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Datatypes | .rocq2lean.lock | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Datatypes | Export.glob | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Datatypes | [Export.v](exports/Datatypes/Export.v) | 是 | MetaRocq 导出驱动：导入模块并指定 roots。 |
| Datatypes | Export.vo | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Datatypes | [audit.json](exports/Datatypes/audit.json) | 是 | 独立结构审计结果。 |
| Datatypes | [audit.log](exports/Datatypes/audit.log) | 是 | 阶段日志：audit.log；用于定位导出、翻译或验证问题。 |
| Datatypes | [consumer.log](exports/Datatypes/consumer.log) | 是 | 阶段日志：consumer.log；用于定位导出、翻译或验证问题。 |
| Datatypes | [consumer_result.json](exports/Datatypes/consumer_result.json) | 是 | 独立 Lean consumer 检查结果。 |
| Datatypes | [contract.json](exports/Datatypes/contract.json) | 是 | 导入/消费检查所用声明与约束契约。 |
| Datatypes | [export-0.log](exports/Datatypes/export-0.log) | 是 | 阶段日志：export-0.log；用于定位导出、翻译或验证问题。 |
| Datatypes | [inventory.json](exports/Datatypes/inventory.json) | 是 | 本模块原始 root 清单。 |
| Datatypes | [lean/Consumer.lean](exports/Datatypes/lean/Consumer.lean) | 是 | 独立 consumer 校验入口。 |
| Datatypes | lean/Rocq2LeanOut.ilean | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Datatypes | [lean/Rocq2LeanOut.lean](exports/Datatypes/lean/Rocq2LeanOut.lean) | 是 | 从 IR/报告注册 Lean 内核声明的导入入口。 |
| Datatypes | lean/Rocq2LeanOut.olean | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Datatypes | [logs/translate.log](exports/Datatypes/logs/translate.log) | 是 | 阶段日志：logs/translate.log；用于定位导出、翻译或验证问题。 |
| Datatypes | [result.json](exports/Datatypes/result.json) | 是 | 模块导出、翻译与验证汇总。 |
| Datatypes | [roundtrip.log](exports/Datatypes/roundtrip.log) | 是 | 阶段日志：roundtrip.log；用于定位导出、翻译或验证问题。 |
| Datatypes | source-roundtrip/.RoundTrip.aux | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Datatypes | source-roundtrip/.RoundTripNative.aux | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Datatypes | source-roundtrip/.RoundTripStatement.aux | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Datatypes | source-roundtrip/.RoundTripStatementAlone.aux | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Datatypes | source-roundtrip/.RoundTripUniverses.aux | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Datatypes | source-roundtrip/RoundTrip.glob | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Datatypes | [source-roundtrip/RoundTrip.v](exports/Datatypes/source-roundtrip/RoundTrip.v) | 是 | 由 IR 重建的 Rocq 声明，用于源端内核复查。 |
| Datatypes | source-roundtrip/RoundTrip.vo | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Datatypes | source-roundtrip/RoundTripNative.glob | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Datatypes | [source-roundtrip/RoundTripNative.v](exports/Datatypes/source-roundtrip/RoundTripNative.v) | 是 | 原生元数据的源端复查入口。 |
| Datatypes | source-roundtrip/RoundTripNative.vo | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Datatypes | source-roundtrip/RoundTripStatement.glob | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Datatypes | source-roundtrip/RoundTripStatement.keys | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Datatypes | source-roundtrip/RoundTripStatement.v | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Datatypes | source-roundtrip/RoundTripStatement.vo | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Datatypes | source-roundtrip/RoundTripStatementAlone.glob | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Datatypes | source-roundtrip/RoundTripStatementAlone.v | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Datatypes | source-roundtrip/RoundTripStatementAlone.vo | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Datatypes | source-roundtrip/RoundTripUniverses.glob | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Datatypes | [source-roundtrip/RoundTripUniverses.out](exports/Datatypes/source-roundtrip/RoundTripUniverses.out) | 是 | 宇宙复查输出。 |
| Datatypes | [source-roundtrip/RoundTripUniverses.tsv](exports/Datatypes/source-roundtrip/RoundTripUniverses.tsv) | 是 | 宇宙事实表。 |
| Datatypes | [source-roundtrip/RoundTripUniverses.v](exports/Datatypes/source-roundtrip/RoundTripUniverses.v) | 是 | 宇宙上下文的源端复查入口。 |
| Datatypes | source-roundtrip/RoundTripUniverses.vo | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Datatypes | [source-roundtrip/logs/RoundTripStatement.log](exports/Datatypes/source-roundtrip/logs/RoundTripStatement.log) | 是 | 阶段日志：source-roundtrip/logs/RoundTripStatement.log；用于定位导出、翻译或验证问题。 |
| Datatypes | [source-roundtrip/logs/RoundTripStatementAlone.log](exports/Datatypes/source-roundtrip/logs/RoundTripStatementAlone.log) | 是 | 阶段日志：source-roundtrip/logs/RoundTripStatementAlone.log；用于定位导出、翻译或验证问题。 |
| Datatypes | [source-roundtrip/logs/roundtrip.log](exports/Datatypes/source-roundtrip/logs/roundtrip.log) | 是 | 阶段日志：source-roundtrip/logs/roundtrip.log；用于定位导出、翻译或验证问题。 |
| Datatypes | [source-roundtrip/logs/roundtrip_native.log](exports/Datatypes/source-roundtrip/logs/roundtrip_native.log) | 是 | 阶段日志：source-roundtrip/logs/roundtrip_native.log；用于定位导出、翻译或验证问题。 |
| Datatypes | [source-roundtrip/logs/roundtrip_universes.log](exports/Datatypes/source-roundtrip/logs/roundtrip_universes.log) | 是 | 阶段日志：source-roundtrip/logs/roundtrip_universes.log；用于定位导出、翻译或验证问题。 |
| Datatypes | [source-roundtrip/roundtrip.json](exports/Datatypes/source-roundtrip/roundtrip.json) | 是 | 源端 roundtrip 结果。 |
| Datatypes | [source.ndjson](exports/Datatypes/source.ndjson) | 是 | IR 头部、宇宙上下文、依赖顺序中的声明及证明条件；包含依赖闭包。 |
| Datatypes | [translate.log](exports/Datatypes/translate.log) | 是 | 阶段日志：translate.log；用于定位导出、翻译或验证问题。 |
| Datatypes | [translation_manifest.json](exports/Datatypes/translation_manifest.json) | 是 | 运行输入、报告和生成模块的关联信息。 |
| Datatypes | [translation_report.json](exports/Datatypes/translation_report.json) | 是 | 目标状态、类型/正文 AST、报告字段、依赖与条件。 |
| Datatypes | [translation_timing.json](exports/Datatypes/translation_timing.json) | 是 | 逐声明 tier 标签、耗时和结果；不是逐 AST 事件日志。 |
| Nat | .Export.aux | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Nat | .rocq2lean.lock | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Nat | Export.glob | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Nat | [Export.v](exports/Nat/Export.v) | 是 | MetaRocq 导出驱动：导入模块并指定 roots。 |
| Nat | Export.vo | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Nat | [audit.json](exports/Nat/audit.json) | 是 | 独立结构审计结果。 |
| Nat | [audit.log](exports/Nat/audit.log) | 是 | 阶段日志：audit.log；用于定位导出、翻译或验证问题。 |
| Nat | [consumer.log](exports/Nat/consumer.log) | 是 | 阶段日志：consumer.log；用于定位导出、翻译或验证问题。 |
| Nat | [consumer_result.json](exports/Nat/consumer_result.json) | 是 | 独立 Lean consumer 检查结果。 |
| Nat | [contract.json](exports/Nat/contract.json) | 是 | 导入/消费检查所用声明与约束契约。 |
| Nat | [export-0.log](exports/Nat/export-0.log) | 是 | 阶段日志：export-0.log；用于定位导出、翻译或验证问题。 |
| Nat | [inventory.json](exports/Nat/inventory.json) | 是 | 本模块原始 root 清单。 |
| Nat | [lean/Consumer.lean](exports/Nat/lean/Consumer.lean) | 是 | 独立 consumer 校验入口。 |
| Nat | lean/Rocq2LeanOut.ilean | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Nat | [lean/Rocq2LeanOut.lean](exports/Nat/lean/Rocq2LeanOut.lean) | 是 | 从 IR/报告注册 Lean 内核声明的导入入口。 |
| Nat | lean/Rocq2LeanOut.olean | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Nat | [logs/translate.log](exports/Nat/logs/translate.log) | 是 | 阶段日志：logs/translate.log；用于定位导出、翻译或验证问题。 |
| Nat | [result.json](exports/Nat/result.json) | 是 | 模块导出、翻译与验证汇总。 |
| Nat | [roundtrip.log](exports/Nat/roundtrip.log) | 是 | 阶段日志：roundtrip.log；用于定位导出、翻译或验证问题。 |
| Nat | source-roundtrip/.RoundTrip.aux | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Nat | source-roundtrip/.RoundTripNative.aux | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Nat | source-roundtrip/.RoundTripUniverses.aux | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Nat | source-roundtrip/RoundTrip.glob | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Nat | [source-roundtrip/RoundTrip.v](exports/Nat/source-roundtrip/RoundTrip.v) | 是 | 由 IR 重建的 Rocq 声明，用于源端内核复查。 |
| Nat | source-roundtrip/RoundTrip.vo | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Nat | source-roundtrip/RoundTripNative.glob | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Nat | [source-roundtrip/RoundTripNative.v](exports/Nat/source-roundtrip/RoundTripNative.v) | 是 | 原生元数据的源端复查入口。 |
| Nat | source-roundtrip/RoundTripNative.vo | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Nat | source-roundtrip/RoundTripUniverses.glob | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Nat | [source-roundtrip/RoundTripUniverses.out](exports/Nat/source-roundtrip/RoundTripUniverses.out) | 是 | 宇宙复查输出。 |
| Nat | [source-roundtrip/RoundTripUniverses.tsv](exports/Nat/source-roundtrip/RoundTripUniverses.tsv) | 是 | 宇宙事实表。 |
| Nat | [source-roundtrip/RoundTripUniverses.v](exports/Nat/source-roundtrip/RoundTripUniverses.v) | 是 | 宇宙上下文的源端复查入口。 |
| Nat | source-roundtrip/RoundTripUniverses.vo | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Nat | [source-roundtrip/logs/roundtrip.log](exports/Nat/source-roundtrip/logs/roundtrip.log) | 是 | 阶段日志：source-roundtrip/logs/roundtrip.log；用于定位导出、翻译或验证问题。 |
| Nat | [source-roundtrip/logs/roundtrip_native.log](exports/Nat/source-roundtrip/logs/roundtrip_native.log) | 是 | 阶段日志：source-roundtrip/logs/roundtrip_native.log；用于定位导出、翻译或验证问题。 |
| Nat | [source-roundtrip/logs/roundtrip_universes.log](exports/Nat/source-roundtrip/logs/roundtrip_universes.log) | 是 | 阶段日志：source-roundtrip/logs/roundtrip_universes.log；用于定位导出、翻译或验证问题。 |
| Nat | [source-roundtrip/roundtrip.json](exports/Nat/source-roundtrip/roundtrip.json) | 是 | 源端 roundtrip 结果。 |
| Nat | [source.ndjson](exports/Nat/source.ndjson) | 是 | IR 头部、宇宙上下文、依赖顺序中的声明及证明条件；包含依赖闭包。 |
| Nat | [translate.log](exports/Nat/translate.log) | 是 | 阶段日志：translate.log；用于定位导出、翻译或验证问题。 |
| Nat | [translation_manifest.json](exports/Nat/translation_manifest.json) | 是 | 运行输入、报告和生成模块的关联信息。 |
| Nat | [translation_report.json](exports/Nat/translation_report.json) | 是 | 目标状态、类型/正文 AST、报告字段、依赖与条件。 |
| Nat | [translation_timing.json](exports/Nat/translation_timing.json) | 是 | 逐声明 tier 标签、耗时和结果；不是逐 AST 事件日志。 |
| Peano | .Export.aux | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Peano | .rocq2lean.lock | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Peano | Export.glob | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Peano | [Export.v](exports/Peano/Export.v) | 是 | MetaRocq 导出驱动：导入模块并指定 roots。 |
| Peano | Export.vo | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Peano | [audit.json](exports/Peano/audit.json) | 是 | 独立结构审计结果。 |
| Peano | [audit.log](exports/Peano/audit.log) | 是 | 阶段日志：audit.log；用于定位导出、翻译或验证问题。 |
| Peano | [consumer.log](exports/Peano/consumer.log) | 是 | 阶段日志：consumer.log；用于定位导出、翻译或验证问题。 |
| Peano | [consumer_result.json](exports/Peano/consumer_result.json) | 是 | 独立 Lean consumer 检查结果。 |
| Peano | [contract.json](exports/Peano/contract.json) | 是 | 导入/消费检查所用声明与约束契约。 |
| Peano | [export-0.log](exports/Peano/export-0.log) | 是 | 阶段日志：export-0.log；用于定位导出、翻译或验证问题。 |
| Peano | [inventory.json](exports/Peano/inventory.json) | 是 | 本模块原始 root 清单。 |
| Peano | [lean/Consumer.lean](exports/Peano/lean/Consumer.lean) | 是 | 独立 consumer 校验入口。 |
| Peano | lean/Rocq2LeanOut.ilean | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Peano | [lean/Rocq2LeanOut.lean](exports/Peano/lean/Rocq2LeanOut.lean) | 是 | 从 IR/报告注册 Lean 内核声明的导入入口。 |
| Peano | lean/Rocq2LeanOut.olean | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Peano | [logs/translate.log](exports/Peano/logs/translate.log) | 是 | 阶段日志：logs/translate.log；用于定位导出、翻译或验证问题。 |
| Peano | [result.json](exports/Peano/result.json) | 是 | 模块导出、翻译与验证汇总。 |
| Peano | [roundtrip.log](exports/Peano/roundtrip.log) | 是 | 阶段日志：roundtrip.log；用于定位导出、翻译或验证问题。 |
| Peano | source-roundtrip/.RoundTrip.aux | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Peano | source-roundtrip/.RoundTripNative.aux | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Peano | source-roundtrip/.RoundTripStatement.aux | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Peano | source-roundtrip/.RoundTripStatementAlone.aux | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Peano | source-roundtrip/.RoundTripUniverses.aux | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Peano | source-roundtrip/RoundTrip.glob | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Peano | [source-roundtrip/RoundTrip.v](exports/Peano/source-roundtrip/RoundTrip.v) | 是 | 由 IR 重建的 Rocq 声明，用于源端内核复查。 |
| Peano | source-roundtrip/RoundTrip.vo | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Peano | source-roundtrip/RoundTripNative.glob | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Peano | [source-roundtrip/RoundTripNative.v](exports/Peano/source-roundtrip/RoundTripNative.v) | 是 | 原生元数据的源端复查入口。 |
| Peano | source-roundtrip/RoundTripNative.vo | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Peano | source-roundtrip/RoundTripStatement.glob | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Peano | source-roundtrip/RoundTripStatement.keys | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Peano | source-roundtrip/RoundTripStatement.v | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Peano | source-roundtrip/RoundTripStatement.vo | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Peano | source-roundtrip/RoundTripStatementAlone.glob | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Peano | source-roundtrip/RoundTripStatementAlone.v | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Peano | source-roundtrip/RoundTripStatementAlone.vo | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Peano | source-roundtrip/RoundTripUniverses.glob | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Peano | [source-roundtrip/RoundTripUniverses.out](exports/Peano/source-roundtrip/RoundTripUniverses.out) | 是 | 宇宙复查输出。 |
| Peano | [source-roundtrip/RoundTripUniverses.tsv](exports/Peano/source-roundtrip/RoundTripUniverses.tsv) | 是 | 宇宙事实表。 |
| Peano | [source-roundtrip/RoundTripUniverses.v](exports/Peano/source-roundtrip/RoundTripUniverses.v) | 是 | 宇宙上下文的源端复查入口。 |
| Peano | source-roundtrip/RoundTripUniverses.vo | 否 | 编译缓存、锁或辅助产物，保留原运行路径，不重复提交。 |
| Peano | [source-roundtrip/logs/RoundTripStatement.log](exports/Peano/source-roundtrip/logs/RoundTripStatement.log) | 是 | 阶段日志：source-roundtrip/logs/RoundTripStatement.log；用于定位导出、翻译或验证问题。 |
| Peano | [source-roundtrip/logs/RoundTripStatementAlone.log](exports/Peano/source-roundtrip/logs/RoundTripStatementAlone.log) | 是 | 阶段日志：source-roundtrip/logs/RoundTripStatementAlone.log；用于定位导出、翻译或验证问题。 |
| Peano | [source-roundtrip/logs/roundtrip.log](exports/Peano/source-roundtrip/logs/roundtrip.log) | 是 | 阶段日志：source-roundtrip/logs/roundtrip.log；用于定位导出、翻译或验证问题。 |
| Peano | [source-roundtrip/logs/roundtrip_native.log](exports/Peano/source-roundtrip/logs/roundtrip_native.log) | 是 | 阶段日志：source-roundtrip/logs/roundtrip_native.log；用于定位导出、翻译或验证问题。 |
| Peano | [source-roundtrip/logs/roundtrip_universes.log](exports/Peano/source-roundtrip/logs/roundtrip_universes.log) | 是 | 阶段日志：source-roundtrip/logs/roundtrip_universes.log；用于定位导出、翻译或验证问题。 |
| Peano | [source-roundtrip/roundtrip.json](exports/Peano/source-roundtrip/roundtrip.json) | 是 | 源端 roundtrip 结果。 |
| Peano | [source.ndjson](exports/Peano/source.ndjson) | 是 | IR 头部、宇宙上下文、依赖顺序中的声明及证明条件；包含依赖闭包。 |
| Peano | [translate.log](exports/Peano/translate.log) | 是 | 阶段日志：translate.log；用于定位导出、翻译或验证问题。 |
| Peano | [translation_manifest.json](exports/Peano/translation_manifest.json) | 是 | 运行输入、报告和生成模块的关联信息。 |
| Peano | [translation_report.json](exports/Peano/translation_report.json) | 是 | 目标状态、类型/正文 AST、报告字段、依赖与条件。 |
| Peano | [translation_timing.json](exports/Peano/translation_timing.json) | 是 | 逐声明 tier 标签、耗时和结果；不是逐 AST 事件日志。 |

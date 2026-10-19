# 增量 correspondence 工作区

当前完成类别为 **1614 / 2180 个去重源根**，经过三十二批增量工作。计划入口：[PLAN.md](PLAN.md)、[DAG.md](DAG.md)；具体例子见 [CORRESPONDENCE_EXAMPLES.md](../../results/CORRESPONDENCE_EXAMPLES.md)。

这里的“完成”表示已经证明明示范围内的类型双向逆、指定原生运算对应或原生陈述 iff；并不将只有接口、部分原生陈述或尚未闭合的对应计入。

| 主分类 | 冻结基线 | 当前 |
|---|---:|---:|
| 类型对应 | 29 | 113 |
| 运算／谓词对应 | 114 | 616 |
| 完全原生陈述 | 143 | 885 |
| 只有接口 | 375 | 138 |
| 部分原生陈述 | 702 | 135 |
| 尚无证书 | 485 | 252 |
| 条件根尚未完成对应 | 331 | 40 |
| 非 Prop 特殊陈述 | 1 | 1 |

类型数统计源根，包含类型别名及类型构造函数，不等于不同 datatype 的数量。原生目标分为现成 API、原生组合表达式和原生表示，见逐项证书的 target_class。完全原生陈述的 iff 不自动证明原定理；另外登记的 199 份原陈述证明单独报告。

机械导出仍有 331 个带显式条件根；correspondence 层已用闭合证明实例化其中 291 个并完成对应。剩余 40 个条件类别根不全是缺前置证明：例如 ssrbool 的 5 个数据选择函数已证明前置条件，仍缺结果对应。

## 本轮新增

第二十八至三十二批共新增 **88 个根、89 份覆盖证书**，从 1526 推进到 1614。详情见 [第二十八至三十一批](BATCH28_31_RESULTS.md) 及 [第三十二批](CRELATION_STATEMENTS_RESULTS.md)。

- SSR 索引类型与函数：20 根；ssrbool 当前 440 / 451。
- 二进制迭代、整数幂、奇偶性和有符号移位：6 根；Pos.iter 有两份不同范围的证书，仅计一个根。
- Init.Sumbool：7 根，模块全部对应；另有 bool_eq_ind 原陈述证明。
- Type 值关系 CRelationClasses：38 根，保留计算数据、函数及各宇宙；加上最新 17 根后模块当前 63 / 81。

[历史批次和下一步](PLAN.md) 保留全部执行记录。未完成的 566 个根继续逐项处理；没有把“尚未找到证明”解释成不可能建立对应。

## 验证范围

89 个增量 Lean profile 有与当前源码和依赖产物匹配的成功验证记录。累计 1353 份增量覆盖证书已共同导入检查；共同导入细节见 [记录](reports/interop/all/import-all-validation.json)。

新证明逐一检查公理闭包。指定原生目标递归检查类型、正文及 NativeBridge 辅助定义，不允许隐藏源符号。若某证明只覆盖特定 Type／Sort 或需要函数对应假设，证书 scope 和完整类型会明确保留。

机械 nat/eq 没有恢复 bootstrap。旧基线证明沿用既有验证结果；本轮未重跑全部机械翻译或全部旧基线证明。Mathlib 的既有数字转换与消费案例见 [INTEROP_RESULTS.md](INTEROP_RESULTS.md)，本轮新增检查包括与 Mathlib 模块共同导入，不等于对所有原生 API 做了运行时测试。

## 产物

- [逐根覆盖账本](reports/CORELIB_LEDGER.csv)、[摘要](reports/summary.json)、[任务表](tasks.csv)。
- [完整证书类型和公理闭包](reports/CERTIFICATES.md)、[机器可读证书](reports/certificates.json)。
- certificates.json：明确的源根 → 证书注册表；make_report.py 只计实际验证通过的注册项。
- proofs/：手写或生成的完整 Lean 对应证明。
- [条件闭合证据](reports/condition-discharges.json)、[逐 profile 验证](reports/validation.json)。
- 编译文件、探测脚本及临时输出只保存在远程 .work，不同步到 Git 或 Mac。

## 复现

在本目录执行：

    python3 verify.py
    python3 make_report.py
    python3 interop/pack_all.py
    python3 interop/check_all.py
    python3 make_report.py

需要先按机械基线和旧 correspondence 的 README 构建 pinned Lean 4.33.1 环境及冻结导入。只重查指定 profile 时可运行 python3 verify.py BinaryPower；验证器会重建过期依赖及受影响使用者。若修改已打包 profile，还须重跑相应 pack_all.py 以及 check_all.py。

## 下一步

沿 P3/P4/P5/P6 继续 Type 值关系的剩余陈述、二进制数位运算／除法、数字表示及依赖消去。一般函数的原生目标仍需显式指定；已有的步函数证书组合、SSR 谓词归一化和陈述转换可复用，尚未实现任意函数目标自动合成。

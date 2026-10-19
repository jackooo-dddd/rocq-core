# 增量 correspondence 工作区

当前完成 **1871 / 2180 个去重源根**，经过五十四批增量工作。计划：[PLAN.md](PLAN.md)；依赖图：[DAG.md](DAG.md)；[具体例子](../../results/CORRESPONDENCE_EXAMPLES.md)。

“完成”表示已经证明明示范围内的类型双向逆、指定原生运算对应或原生陈述 iff。只有接口、部分原生陈述或尚未闭合的对应不计入。

| 主分类 | 冻结基线 | 当前 |
|---|---:|---:|
| 类型对应 | 29 | 154 |
| 运算／谓词对应 | 114 | 771 |
| 完全原生陈述 | 143 | 946 |
| 只有接口 | 375 | 41 |
| 部分原生陈述 | 702 | 82 |
| 尚无证书 | 485 | 169 |
| 条件根尚未完成对应 | 331 | 17 |
| 非 Prop 特殊陈述尚未处理 | 1 | 0 |

类型数统计源根，包括类型别名、类型构造函数和已桥接的 Type 值陈述，不等于不同 datatype 的数量。原生目标分为现成 API、原生组合表达式和原生表示，见证书 target_class。陈述 iff 不自动证明原定理；另有 260 份原陈述的独立 Prop 证明。

机械导出仍有 331 个带显式条件根；correspondence 层已用闭合证明实例化其中 314 个并完成对应。剩余 17 个条件类别根不全缺前置证明：例如 ssrbool 的 5 个数据选择函数已证明前置条件，仍缺结果对应。

## 本轮新增

[第四十九至五十四批](BATCH49_54_RESULTS.md) 新增 **76 个根、76 份证书**，从 1795 推进到 1871。

- Init.Wf 21/21：良基递归方程、完整原生陈述及依赖归纳条件。
- Program.Wf 10/12：子类型递归对应 WellFounded.fix；两项 opaque_data 计算仍缺等式。
- ssreflect_rw 52/55：包装类型、锁定解锁、任意元数合同性；三项不透明计算仍未完成。
- ssrclasses 4/4、ssrunder 7/7：原生 Std.Refl 和实际关系接口。

全范围还有 309 根未完成。继续 Uint63Axioms / Sint63Axioms；历史批次见 PLAN.md。

## 验证范围

113 个增量 Lean profile 有与当前源码和依赖产物匹配的成功验证记录。1615 份增量覆盖证书已共同导入检查，见 [共同导入记录](reports/interop/all/import-all-validation.json)。

新证明检查公理闭包。指定原生目标递归检查类型、正文及 NativeBridge 辅助定义，不允许隐藏源符号。限制范围或函数对应假设在证书 scope 和完整类型中保留。

机械 nat/eq 不变。旧基线证明沿用既有验证结果；本轮没有重跑全部机械翻译或全部旧证明。新 Mathlib 位运算对应实际编译；旧数字打印及 Nat/SSR/Setoid 消费例沿用既有验证。详见 [跨模块消费](INTEROP_RESULTS.md)。

## 产物

- [逐根覆盖账本](reports/CORELIB_LEDGER.csv)、[摘要](reports/summary.json)、[任务表](tasks.csv)。
- [完整证书类型和公理闭包](reports/CERTIFICATES.md)、[机器可读证书](reports/certificates.json)。
- certificates.json：明确的源根 → 证书注册表；make_report.py 只计通过检查的注册项。
- proofs/：完整 Lean 对应证明；[CMorphisms 模块账本](reports/cmorphisms-module-coverage.json)。
- [条件闭合证据](reports/condition-discharges.json)、[逐 profile 验证](reports/validation.json)。
- 编译文件、探测脚本及临时输出只在远程 .work，不同步到 Git 或 Mac。

## 复现

在本目录执行：

    python3 verify.py
    python3 make_report.py
    python3 interop/pack_all.py
    python3 interop/check_all.py
    python3 make_report.py

Mathlib profile 使用远程已经安装的相同 Lean 工具链与库。以上命令会完整重检；本轮只重编译六个新 profile，并执行全体共同导入检查。

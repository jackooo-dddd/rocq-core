# 依赖消去与条件实例化：第五批

本批 16 个新运算根通过 correspondence，另增加 5 份覆盖完整 Sort 范围的类型证书；这 5 个类型根原来已有 Type 范围证书，因此不重复增加类型根数。当前完成类别合计 531 / 2180：37 类型、202 运算、292 完全原生陈述。

## 完整 Sort 范围

| 机械类型 | 原生目标 | 新证书 |
|---|---|---|
| sig A P | Subtype P | subtypeIso |
| sig2 A P Q | Subtype (fun x => P x ∧ Q x) | subtype2Iso |
| sigT A P | PSigma P | psigmaIso |
| sigT2 A P Q | PSigma (fun x => PProd (P x) (Q x)) | psigma2Iso |
| prod A B | PProd A B | pprodIso |

载体 A 和数据族允许 Sort u，包括 Prop；没有强行限制为 Type，也没有把数据族压成命题。已有 Type → Sigma/Prod 的桥接仍保留，新增 PSigma/PProd 版本用于源端更广的 universe 范围。

## 12 项原本无条件的操作

prod_of_sigT、sigT_of_prod、sigT_of_sigT2：对应原生依赖 pair 与普通 pair 的构造/投影。
projT3：对应第三分量；使用 HEq 明确保留依赖索引，不假装两个返回类型已经定义相等。

sig/sig2/sigT/sigT2 各自的 rec、rect，共 8 项：
- 原生回调及 motive 通过类型转换用于机械消去器；
- 输出等于 Subtype.rec、PSigma.rec 或明确的原生依赖模式匹配；
- rec 的结果按源签名是 Type，rect 可为 Sort；
- motive 仍可依赖完整输入，没有降为常量返回类型。

## 4 项带条件操作已实际实例化

| 原机械声明 | 条件参数数 | 无条件使用入口 |
|---|---:|---|
| sigT_of_sig | 1 | NativeBridge.Incremental.sigTOfSigClosed |
| sig_of_sigT | 1 | NativeBridge.Incremental.sigOfSigTClosed |
| sig_of_sig2 | 1 | NativeBridge.Incremental.sigOfSig2Closed |
| sigT2_of_sig2 | 3 | NativeBridge.Incremental.sigT2OfSig2Closed |

其中 sig_of_sig2 的义务被复用，合计 5 个独立闭合见证，6 次条件参数供给。5 份见证的公理闭包全部为空。每个入口都实际调用原 RocqPending 定义，并显式提供完整的证明参数；另有对应定理证明结果等于指定的原生构造/投影。没有仅仅删去参数，也没有假定义务成立。

检查包括：
- 与冻结 translation_report 中 pending_hypotheses 的集合逐项匹配；
- 见证的 Lean 类型对应实际义务；
- 闭合入口的公开类型不再含义务参数；
- 具体实例化及运算对应通过 kernel、公理闭包检查。

原始机械导出没有重写：它仍有 331 个带条件声明。correspondence 层的 4 个闭合入口已经可用，所以本层尚未处理的条件根为 327。账本保留原 status=PENDING_KERNEL_CHECKED 和 prerequisites，同时更新 bridge_status，避免混淆。

文件：
- proofs/DependentElimination.lean：类型桥接、16 项运算证明、5 个见证、4 个入口。
- condition-obligations.json：从冻结导出抽取的条件清单。
- reports/condition-discharges.json：逐根条件、见证完整类型、公理及入口类型。
- reports/DependentElimination-audit.json、validation.json：成功验证证据。

## 验证范围与后续

新增 profile DependentElimination 通过；共 12 个增量 profile 有成功记录，旧 profile 的证书与源码仍由汇总脚本检查。审计器增加了 RocqPending 引用采集以支持上述实例化，公理许可没有改变；此前 profile 的成功审计沿用原记录，未重新宣称全部执行。

计划下一步：
- 用这些完整 Sort 桥接处理更多依赖陈述和 Eq transport；
- 复用已证投影义务，但每个下游根仍需实际实例化、验证，不能仅因依赖一个已证义务就自动报成功；
- 继续二元良基递归、数字写出及统一导入；整个计划尚未完成。

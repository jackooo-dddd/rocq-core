# Correspondence 后续计划

状态：2026-10-19 开始；先建立计划和依赖图，再执行证明。此目录是新增工作区，旧实验作为不可变基线。

目标：在机械翻译之后，证明与指定 Lean 原生类型、运算的对应，并让已有证书可被后续声明复用。机械 nat/eq 不回退为 bootstrap。

## 基线

2180 个去重根：TYPE_ISO 29，OPERATION_CORRESPONDENCE 114，STATEMENT_FULL_NATIVE 143，STATEMENT_PARTIAL 702，TRANSPORT_INTERFACE_ONLY 375，NOT_YET_BRIDGED 485，EXPLICIT_PROOF_PARAMETERS 331，TYPE_VALUED_STATEMENT 1。
来源：../mechanical-correspondence-20261019/reports/CORELIB_LEDGER.csv。
历史证书不因新实验而重新宣称已执行；本轮新增证明独立验证，汇总时标明基线继承。

## 执行顺序和验收

| 步骤 | 工作 | 前置依赖 | 验收 | 状态 |
|---|---|---|---|---|
| P0 | 仓库归档、保留源码与关键结果 | 远程归档验证 | Mac 清理前确认可恢复；不删除远程运行环境 | 已完成：归档验证记录见 ../../docs/STORAGE_CLEANUP.json |
| P1 | 2180 项基线任务表、源依赖图和桥接任务 DAG | 原始 IR、覆盖账本 | 节点可追踪，区分来源事实与规划依赖，检查 DAG | 已完成：tasks.csv、dependency-graph.json，2180 根 / 9457 条依赖 |
| P2 | 已有证书复用及函数组合机制 | Nat/Bool/Option/函数 Iso | 在真实导入上组合证书；未知操作不误报成功 | 首批已验证：Registry、transport_comp、两项自动组合；通用化继续 |
| P3a | Program.Basics 组合器及 SSR Option、simpl_fun | P2、Option Iso、Eq 桥接 | 类型往返、运算等式分别登记，Lean kernel 和公理闭包检查 | 首批已验证：6 Basics + 17 SSR 运算/谓词 + 1 SSR 类型；详见证书表 |
| P3b | 数值、比较、数字表示及其转换 | Nat/N/Z/Bool Iso、表示类型桥接 | 明确原生目标、规范形式和参数范围 | Nat.iter；数字表示/读取/比较/规范化已推进；写出与进位语义待继续 |
| P4 | 依赖函数、Sigma/Subtype、Eq transport、Acc | P2、依赖消去对应 | 保持索引/证明依赖及实际 universe 范围 | 已开始：Acc Iso、7 项良基递归/谓词对应；二元版本及 Sigma 待继续 |
| P5 | 将 375 项接口逐步升级到运算对应 | P3/P4 的证书 | 对指定原生运算的等式/iff，不把接口往返混算 | 四批推进；当前仅接口 319 项 |
| P6 | 再处理 702 项部分陈述和共享证明义务 | 运算证书、依赖转换 | 原生陈述 iff；331 项条件未消去前继续显式保留 | SSRBool 升级 141 项；数字比较再升级并证明 8 项；331 项条件未消去 |
| P7 | 统一导入与 Lean/Mathlib 组合使用 | 已验收证书 | 跨模块使用，记录实际测试边界和剩余失败 | 待开始 |

P2/P3a 采用小步循环：先实现最小可复用机制，再在具体函数上验证，补证书后回到机制层。
首批选 Program.Basics、SSR Option/函数包装和 Nat.iter；不把同一声明的多份证书重复计入根数。
Classes 的关系性质可在基础桥接后推进；Type 值关系不能擅自压成 Prop。浮点、数组边界约定作为单独语义专题。

## 每步产物

- PLAN.md：步骤状态、完成证据与下一步。
- DAG.md：可读的任务依赖图；dependency-graph.json / source-dependencies.csv：实际源依赖和 SCC 信息。
- tasks.csv：每根的基线状态、源依赖和本轮进度。
- proofs/：手写通用对应；生成的完整证明文件、脚本及注册表。
- reports/：kernel 验证、公理闭包、显式源根到证书映射、更新后的覆盖账本。
- .work/：编译缓存、探测、临时输出，仅远程保留。

## 计数与正确性

新证书必须显式登记所证明的源声明，不能仅因定理类型提到某声明就记为覆盖。
区分类型双向逆、原生接口往返、运算一致性、陈述 iff；带额外假设必须保留。
不能由“生成器未找到桥接”推断数学上不可能。不能把规范化/单向解释冒充 bijection。
原生目标可以是指定 Lean 组合表达式，但必须与现成 API 的直接对应分别标记。
每一轮只更新实际通过验证的条目；未完成步骤继续列出，不标为完成。

## 第一批执行记录

P0/P1 已完成。P2/P3a 首批 5 个 profile 全部通过，新增 1 个类型根、24 个运算/谓词根（含 Nat.iter）。P3b 已开始 Nat.iter，其余数值工作待继续。P4/P6/P7 尚未开始。P5 本批升级了 23 个接口根，另补 1 个此前无证书的运算根；还有 352 个仅接口根。

代码检查发现类型别名可能绕过桥接查找；新生成器在 identityIso 判定前执行弱头正规化，并用机械 Bool 的 simpl_fun 参数验证自动得到原生 Bool 函数接口。该修改尚未推广验证全部旧接口。

## 第二批执行记录

SSR Bool/关系谓词、pred/rel 类型对应和 reflect 的原生逻辑对应已通过局部 kernel 检查；已将这些规则应用于 216 项部分原生化陈述，141 项无源符号，75 项继续保留为部分对应。预计覆盖数量见 ESTIMATE.md（主观规划预估，不作已证结果）。

第二批新增 3 个类型根（pred、rel、reflect），12 个运算/谓词根，141 个完全原生陈述根。七个证明 profile 全部通过。完整计数以 reports/summary.json 为准。

生成器回归暴露出过早 whnf 会越过数组/字符串已登记桥接；调整为先匹配已登记桥接，再在 identityIso 之前展开未知别名。45 个旧接口 profile 的检查记录在 reports/alias-regression.json，最终 45 个 profile 全部通过，旧接口无丢失/新增，方可发布。

## 第三、四批执行记录

新增 4 类型、36 运算/谓词、8 完全原生陈述；后 8 项另有原陈述证明。累计完成类别 515 / 2180，11 个 profile 验证记录通过。数字表示及边界、Acc/WellFounded/Fix 与原生定理复用的具体结果见 NUMERIC_WF_RESULTS.md。P3b/P4/P5/P6 均继续，P7 尚未完成。

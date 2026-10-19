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
| P3b | 数值、比较、数字表示及其转换 | Nat/N/Z/Bool Iso、表示类型桥接 | 明确原生目标、规范形式和参数范围 | Nat.iter；数字表示/读取/比较/规范化已推进；写出与进位语义已证明；七种顶层打印已对应 Mathlib Nat.digits；有符号读取待继续 |
| P4 | 依赖函数、Sigma/Subtype、Eq transport、Acc | P2、依赖消去对应 | 保持索引/证明依赖及实际 universe 范围 | 已开始：Acc 与 7 项良基递归/谓词；完整 Sort 的 Sigma/Subtype、二元良基递归、基本容器消去；Eq/布尔等式已推进，剩余依赖陈述继续 |
| P5 | 将 375 项接口逐步升级到运算对应 | P3/P4 的证书 | 对指定原生运算的等式/iff，不把接口往返混算 | 十五批推进；当前仅接口 263 项 |
| P6 | 再处理 702 项部分陈述和共享证明义务 | 运算证书、依赖转换 | 原生陈述 iff；未解决的证明条件继续显式保留 | SSRBool 升级 141 项；数字比较再升级并证明 8 项；16 个条件根已闭合实例化，本层剩余 315 |
| P7 | 统一导入与 Lean/Mathlib 组合使用 | 已验收证书 | 跨模块使用，记录实际测试边界和剩余失败 | 首批验收通过：36 profile / 613 证书共同导入；Nat + SSR + Setoid 组合、Mathlib Nat.prime_two 消费通过；见 INTEROP_RESULTS.md |

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

## 第五批执行记录

完整 Sort 的 sig/sig2/sigT/sigT2/prod 类型桥接新增 5 份证书，类型根不重复计数；新增 16 个运算根。5 个空公理闭包见证实际实例化了 4 个条件根；本层剩余 327，原始机械导出仍为 331。当前完成类别 531 根，12 个增量 profile 有成功记录。详见 DEPENDENT_RESULTS.md。

## 第六批执行记录

新增 2 个二元良基递归、23 个基本 datatype 运算/消去器、5 个闭合条件后的原生陈述，共 30 根，总完成 561。5 个新陈述均有原陈述证明，复用既有义务见证；独立见证仍是 5 个，已实例化条件根为 9。新增 PSum 的完整 Sort 类型证书不重复计根。15 个 profile 有成功记录。见 RECURSION_STATEMENTS_RESULTS.md。

## 第七批执行记录

Eq transport 与布尔等式新增 19 根，总完成 580。17 个 profile 验证记录通过；本层条件根剩余 318。新增 4 个完整原生陈述均另有原陈述证明。详情见 EQUALITY_RESULTS.md。

## 第八、九批执行记录

两个关系模块共 126 根全部得到明示范围内证书，新增 17 类型、32 运算、77 完整原生陈述；其中 21 份另有原陈述证明。Tlist/变参谓词和两个条件根已处理。累计完成 706，23 个增量 profile 记录通过。详见 RELATIONS_RESULTS.md。

## 第十批执行记录

Morphisms 新增 5 类型/标记、8 运算、55 完整原生陈述，共 68 根；该模块 87 根全部有明示范围内对应。累计完成 774；25 个增量 profile 验证记录通过，新增原陈述证明仍为 38。详见 MORPHISMS_RESULTS.md。

## 第十一批执行记录

新增 Equivalence / Morphisms_Prop / Setoid 的 40 个完成根，总完成 814；这三个模块共 52 根有明示范围内证书。29 个 profile 记录通过，新增原陈述证明为 43。见 EQUIVALENCE_SETOID_RESULTS.md。下一步检查 P7 的统一导入，同时保持剩余对应任务。

## P7 首批执行记录

28 个 profile 的 535 份增量覆盖证书及附加证明，共 585 入口 / 2967 依赖声明副本，共同导入成功。原始机械类型身份保留，通过原生接口跨闭包组合。Mathlib 消费与新增公理拒绝测试通过；覆盖根数仍为 814。详见 INTEROP_RESULTS.md。

## 第十二批执行记录

Init.Specif 的 49 个部分陈述中，49 个均已证明等价于无源符号的原生陈述。新增 Subtype / PSigma 量词、函数族、等式及投影规则；不新增原陈述证明。累计完成 863 根，31 个 profile 验证通过。见 SPECIF_STATEMENTS_RESULTS.md。

## 第十三批执行记录

数字写出新增 1 类型、11 运算，累计完成 875 根。通用进位、迭代以及机械打印结果的数值性质均已证明。32 个 profile 有当前源码的成功记录；七种顶层打印随后已补充现成 Nat.digits 的适配等式。见 NUMERIC_WRITE_RESULTS.md。

## 第十四、十五批执行记录

有符号读取新增 3 根；Nat 的 gcd、divmod、sqrt/log2 与两个内部迭代器再新增 6 根。Init.Nat 的 58 根均有明示范围内证书。全项目完成类别 884，37 个 profile 验证通过，全部 613 份覆盖证书共同导入通过。gcd 的终止条件由标准 Lean 公理下的闭合证明处理，剩余条件根 315。见 SIGNED_READ_RESULTS.md 与 NAT_COMPLETION_RESULTS.md。

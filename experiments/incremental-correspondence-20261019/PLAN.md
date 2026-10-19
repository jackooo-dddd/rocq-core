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
| P3b | 数值、比较、数字表示及其转换 | Nat/N/Z/Bool Iso、表示类型桥接 | 明确原生目标、规范形式和参数范围 | Nat.iter；数字表示/读取/比较/规范化已推进；写出与进位语义已证明；七种顶层打印已对应 Mathlib Nat.digits；positive/N/Z 按位运算已对应；有符号读取待继续 |
| P4 | 依赖函数、Sigma/Subtype、Eq transport、Acc | P2、依赖消去对应 | 保持索引/证明依赖及实际 universe 范围 | 已开始：Acc 与 7 项良基递归/谓词；完整 Sort 的 Sigma/Subtype、二元良基递归、基本容器消去；Eq/布尔等式已推进，剩余依赖陈述继续 |
| P5 | 将 375 项接口逐步升级到运算对应 | P3/P4 的证书 | 对指定原生运算的等式/iff，不把接口往返混算 | 三十六批推进；当前仅接口 121 项 |
| P6 | 再处理 702 项部分陈述和共享证明义务 | 运算证书、依赖转换 | 原生陈述 iff；未解决的证明条件继续显式保留 | SSRBool 升级 141 项；数字比较再升级并证明 8 项；293 个条件根已闭合实例化并完成对应，本层剩余 38 |
| P7 | 统一导入与 Lean/Mathlib 组合使用 | 已验收证书 | 跨模块使用，记录实际测试边界和剩余失败 | 首批验收通过：84 覆盖 profile / 1392 证书共同导入；Nat + SSR + Setoid 组合、Mathlib Nat.prime_two 消费通过；见 INTEROP_RESULTS.md |

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

## 第十六批执行记录

Peano 新增 1 运算、5 完全原生陈述；模块 36 根全部有范围明确的证书。31 个 Peano 陈述全部检查，26 个既有完成根不重复计数。按账本实际选用模块复查旧 143 个完全原生目标，全部通过。累计完成 890；39 个 profile、619 份增量覆盖证书共同导入通过。下一步继续基础消去器、List 与二进制数运算。见 PEANO_RESULTS.md。

## 第十七批执行记录

List 剩余 3 根及二进制数比较/倍增/折半等 29 根通过，总完成 922；43 个 profile，651 份覆盖证书共同导入通过。下一步：Pos.mask 的无损表示、减法的双递归不变量，再组合 N/Z 减法和加法。见 LIST_BINARY_RESULTS.md。

## 第十八批执行记录

mask 的无损 Iso、两项消去器、两个归纳陈述及减法不变量已经证明，并完成 N.sub、Z.pos_sub/add/sub。新增 15 根，累计完成 937。47 个增量 profile 重编译通过，666 份覆盖证书共同导入通过。下一步补 Datatypes 的原生陈述和完整 Sort 参数对应，继续二进制数未完成的位运算/迭代。见 BINARY_MASK_RESULTS.md。

## 第十九批执行记录

Datatypes 37 个剩余部分陈述全部原生化，4 个索引消去器及 2 个条件转换已处理；模块 110 根均有范围明确的对应。新增完成根 48，累计 985；51 个 profile、718 份覆盖证书共同导入通过。完整 Sort 容器对应在桥接层使用 PLift，Type 情况与原桥接兼容；机械规则不变。下一步继续 Init.Logic / Specif 的共享证明义务和剩余消去操作。见 DATATYPE_COMPLETION_RESULTS.md。

## 第二十批执行记录

Init.Logic 的 151 个共享依赖/原陈述目标已有空公理闭包的闭合证明。72 个条件根（18 定义、54 陈述）实际完成对应，另升级 13 个部分陈述和 9 个运算；新增 94 根。模块 176 根全部有明示范围内证书，总完成类别 1079。57 个验证 profile、812 份覆盖证书共同导入通过。下一步继续 Init.Specif 的共享依赖、依赖数据消去和相等消去。见 LOGIC_COMPLETION_RESULTS.md。

## 第二十一批执行记录

Init.Specif 的 140 个共享依赖/原陈述目标已有空公理闭包的闭合证明，70 个条件根实际完成对应。新增 1 类型、41 运算、38 完全原生陈述，共 80 根；模块 159 根均有明示范围内证书，累计完成类别 1159。63 个验证 profile；当前 892 份覆盖证书已共同导入通过。下一步继续其它模块的条件闭合与原生运算等式。见 SPECIF_COMPLETION_RESULTS.md。

## 第二十二批执行记录

SSR 新增 27 个谓词、50 个完全原生陈述、bijective 与 NonPropType.type 两个类型对应；5 个 Option 运算补充完整 Sort 证明。新增完成根 79，累计 1238，68 个 profile 验证通过。ssrfun 仍有 27 根未完成，下一步处理包装类型、数据投影与六个条件根。见 SSR_FUN_RESULTS.md。

## 第二十三批执行记录

SSR 包装类型、依赖数据与部分函数新增 23 根，总完成 1261。71 个验证 profile、999 份增量证书共同导入通过；ssrfun 剩余四个 opaque 计算函数，需额外计算方程，不能只读 body 后视为对应。接下来在记录该依赖缺口后继续 ssrbool 等透明操作与证明条件闭合；不改变冻结机械产物的声明含义。见 SSR_DATA_RESULTS.md。

## 第二十四批执行记录

SSR Bool 新增 14 类型、34 运算、46 完整原生陈述，共 94 根，总完成 1355。模块 451 根完成 251 根；75 个部分陈述中 46 个完成，29 个继续保留源符号。74 个验证 profile、1093 份覆盖证书共同导入通过。下一步补 manifest/keyed 包装、mem/prop_in/prop_on 依赖及共享证明条件。计算性 opaque 的方程缺口单独保留，不以 body 副本冒充对应证明。见 SSR_BOOL_DATA_RESULTS.md。

## 第二十五批执行记录

SSR 包装及 locked/master_key 新增 8 类型、15 运算；29 个剩余部分陈述中 28 个自动原生化，if_arg 用独立自然目标及原陈述证明完成。总新增 52 根，总完成 1407。ssrbool 完成 301 / 451，原有部分陈述全部完成；其余未完成主要是 128 个条件根。76 个验证 profile、1145 份覆盖证书；打包器新增保留 opacity 的支持后，70 个覆盖 profile 全部重新打包并共同导入通过。后续按共享依赖闭合条件，并保留计算性 opaque 和携带载体类型的包之间的等式限制。见 SSR_PACKAGING_RESULTS.md。

下一批 128 个 ssrbool 条件根中，73 个是陈述、55 个是定义；直接依赖共 275 个不同前置声明。DefaultKeying 两个导出源名使用斜杠，而账本使用点，后续须显式归一化并保留原始来源，避免漏计。

## 第二十六批执行记录

SSR Bool 的 314 个依赖/原陈述目标已有闭合证明，覆盖 271 / 275 个前置声明；124 个条件根的全部前置证明已齐备。完成对应 83 根（73 陈述、10 运算），总完成 1490；80 个验证 profile，1228 份证书共同导入通过。仍有四个共享前置声明未证明，以及已闭合但未对应的 opaque 结果。下一步先处理四个缺口，再利用 reflect 等输出的单值性质推进不透明证明包装；任意数据选择函数的计算等式仍单独处理。见 SSR_CONDITIONS_RESULTS.md。

## 第二十七批执行记录

补齐 ssrbool 最后四个共享前置证明，275 个前置声明全部闭合。23 个 reflect 函数及 13 个逻辑/判定/包装函数完成对应，均保持源函数原有 opacity。累计完成 1526，83 个验证 profile，1264 份证书共同导入。ssrbool 剩余 31 根；下一步处理 alt_spec / if_spec 索引类型、剩余限制域谓词与容器判别。五个数据选择函数仍需独立计算证据。见 SSR_REFLECTION_RESULTS.md。


## 第二十八至三十一批执行记录

第二十八批补齐 alt_spec / if_spec 类型往返及四个下游函数，又完成限制域谓词和容器分支判别，共新增 20 根（2 类型、18 运算），累计 1546。

第二十九批证明二进制迭代对应 Nat.rec，并组合乘法、除以二的证书完成整数幂、奇偶性和有符号移位。新增 6 根、7 份证书，累计 1552；负指数返回零、负移位量反转方向、负数右移向下取整的约定均保留。

第三十批完成 Init.Sumbool 的全部 7 根，累计 1559；12 个闭合前置证明处理 4 个原条件根。bool_eq_ind 另有原陈述证明。与／或操作覆盖任意四个命题，不限定成 Decidable 的互补情形。

第三十一批完成 CRelationClasses 的 18 个类型对应与 20 个投影／组合运算，累计 1597。Type 值关系保留其数据，不与普通 Prop 类型类混同；iffT 只要求两个方向的函数，不要求双向逆。

88 个增量 profile 当前验证通过；79 个覆盖 profile、1336 份证书共同导入检查通过。详细证据见 BATCH28_31_RESULTS.md，具体用例见 ../../results/CORRESPONDENCE_EXAMPLES.md。下一步先复用 CRelationData 的类型桥接推进剩余陈述，并继续二进制运算／数字表示；opaque 数据函数仍需独立计算证据。

## 第三十二批执行记录

复用 Type 值关系桥接，新增 StrictOrder 类型及投影、15 个完整原生陈述，共 17 根，累计 1614 / 2180；15 项另有原陈述证明。CRelationClasses 达到 63 / 81。89 个验证 profile、80 个覆盖 profile 的 1353 份证书共同导入通过。下一步处理 PartialOrder 的数据表示、剩余二进制运算和数据不透明性缺口；详见 CRELATION_STATEMENTS_RESULTS.md。

## 第三十三批：偏序与相等／逻辑等价关系

新增 7 根，当前 1621 / 2180；CRelationClasses 为 70 / 81。PartialOrder 保留 Type 值关系中的双向函数；eq_equivalence、iff_equivalence 转为 Lean Equivalence Eq/Iff，并证明两个逆律及六个前置条件。90 个 profile、1360 份覆盖证书验证，81 个覆盖 profile 共同导入通过。详见 [结果](CRELATION_ORDER_RESULTS.md)。剩余 11 个 CRelationClasses 根均为 opaque_data，先保留为缺结果刻画，再推进其他模块中透明运算与可原生化陈述。

## 第三十四至三十六批：关系保持与按位运算

新增 30 根，当前 1651 / 2180。CMorphisms 的 19 根覆盖透明关系接口、标记、Type 值陈述与计算函数；positive/N 的 8 根和 Z 的 3 根证明与 Nat/Mathlib Int 按位运算一致。位差另补两份 Mathlib API 证书，根数不重复计算。

93 个 profile 有当前验证记录，84 个覆盖 profile / 1392 份证书共同导入通过。四个负数输入例子与从 Nat.and_comm 推回机械 N.land 的交换律均实际编译。详见 [结果](BATCH34_36_RESULTS.md)。

下一步：IntDef 剩余 8 项（div、div_eucl、modulo、pos_div_eucl、quot、quotrem、rem、sqrtrem），先分清向下取整和向零取整，再证明正数除法核心及有符号组合；继续复用既有数值 Iso、比较、减法和递归不变量。CMorphisms 剩余 54 项，其中部分透明外层仍依赖 opaque_data 内部计算，不将这种外层误判为已经能证明原生实现等式。

## 第三十七至三十九批：二进制运算模块完成

新增 13 根、16 份证书，累计 1664 / 2180。除法 8 根、平方根 4 根、iter_op 1 根；后者分别提供无条件二进制括号对应、结合律下 foldr 对应，以及 Nat.add/mul 特例。BinNums.PosDef 36/36、NatDef 11/11、IntDef 39/39。

97 个 profile 有当前验证记录；88 个覆盖 profile、1408 份证书共同导入通过。详见 [结果](BATCH37_39_RESULTS.md)。

下一步按依赖推进 Numbers.BinNums 的 6 个依赖消去器和 6 个归纳陈述：先建立完整原生递归目标，再证明实际源消去器计算相符，最后原生化归纳陈述。其余数值表示和 opaque 数据计算缺口继续保留，不能从签名猜测实现等式。

## 第四十至四十三批：依赖消去和数字表示完成

新增 67 根，当前 1731 / 2180。Numbers.BinNums 15/15、Init.Decimal 40/40、Init.Hexadecimal 38/38、Init.Number 17/17 全部完成明示范围内的对应。9 个相等判定函数的 36 个前置证明闭合；条件对应剩余 29。原陈述独立证明新增 20，总数 220。

101 个 profile 验证通过；92 个覆盖 profile、1475 份证书共同导入。详见 [结果](BATCH40_43_RESULTS.md)。

下一步处理 Init.Byte 的 9 根：先建立八位布尔元组与 Fin 256 / BitVec 8 的对应，再处理 of_bits/to_bits、依赖消去及两个往返陈述。保留实际位序；全域枚举的证明由 kernel 检查，不用样本测试代替。

## 第四十四至四十八批：字节与原生数据操作

新增 64 根，当前 1795 / 2180。Byte 10/10、PrimInt63 37/37、CarryType 1/1、PrimString 17/17、Init.Equality 22/22、PrimArray 8/8。107 个 profile 验证，98 个覆盖 profile / 1539 份证书共同导入通过。详见 [结果](BATCH44_48_RESULTS.md)。

下一步：Init.Wf 的 10 个无条件陈述先原生化并独立证明，再处理 Acc_inv_dep 的显式条件。复用已有 Acc/WellFounded Iso 和 Fix/Fix_F 对应，保留原始声明的外延性前提和 universe 范围。随后推进 Program.Wf、SSR 重写接口与浮点表示；opaque 数据缺口仍需计算证据。

## 第四十九至五十四批：良基递归与 SSR 重写

新增 76 根，当前 1871 / 2180；Init.Wf 21/21、Program.Wf 10/12、ssreflect_rw 52/55、ssrclasses 4/4、ssrunder 7/7。314 个原有条件根已闭合并完成对应，剩余 17；原陈述独立证明 260。113 个 profile 验证，104 个覆盖 profile / 1615 份证书共同导入通过。详见 [结果](BATCH49_54_RESULTS.md)。

下一步：Uint63Axioms / Sint63Axioms。先桥接其透明定义（进位定义、比较、位测试、to_Z、位宽），再依赖已有机器整数和二进制整数对应处理规格陈述。规格 iff 和原规格证明分别统计。浮点模型、opaque 数据计算及剩余类接口继续按账本保留。

## 第五十五至五十六批：Uint63 透明定义完成

新增 22 个根，当前 1893 / 2180。Uint63Operations 16 项，Uint63Conversions 6 项；任意递归 fuel、负整数、越界位索引均覆盖。115 个 profile 验证，106 个覆盖 profile / 1637 份证书共同导入通过。详见 [结果](BATCH55_56_RESULTS.md)。

下一步：Uint63Statements，先证明位运算、eqb、of_to_Z 的源陈述和原生对应，再利用整数算术／比较桥接处理余下规格。

## 第五十七至五十九批：Uint63 规格

新增 15 个根，1908 / 2180；Uint63Axioms 37/48。15 项均独立证明源陈述，完整原生命题证书同时通过。118 个 profile 验证；109 个覆盖 profile、1652 份证书共同导入。详见 [结果](BATCH57_59_RESULTS.md)。

下一步处理 11 个余下规格，先在本模块实际依赖闭包中重检 Z 算术和除法证明；该闭包不含 N/mask，因此仅复用所需 Z 路径。之后推进 Sint63Axioms 与其余模块。

## 第六十至六十二批：算术与位计数规格

新增 9 根，1917 / 2180；Uint63Axioms 46/48。加减乘除模、左右移位、clz/ctz 规格全部独立证明。122 个 profile 验证；112 个覆盖 profile、1661 份证书共同导入。见 [结果](BATCH60_62_RESULTS.md)。

继续 Uint63WideSpecs：mulc 的宽乘法等式已单独通过；diveucl_21 正在处理商的范围界限和源 product 返回值的转换。该 profile 整体通过后再登记两根。

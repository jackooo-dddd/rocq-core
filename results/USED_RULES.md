# Corelib 翻译逐条规则清单

本清单按原 ALL_RULES 的逐项粒度展开，不再使用“固定核心＋可选机制”的分组。范围为当前 67 个模块、2180 个原始根。

**翻译／源准备条目共 104 项：本集合启用 102 项、不启用 2 项；另外逐条列出 9 项检查（8 项启用）和 5 项调度。**
4 个原语类型和 61 个原语操作也分别列出；它们是 N 组规则的具体映射，不与规则条目重复相加。

**“启用”表示纳入这套充分集合，满足适用条件时可以使用；不表示每项都在本次产生了译文，也不表示每项都不可删除。**
已确认命中、仅有范围／元数据证据、尚未独立记录分别说明。没有独立记录的规则明确保留，不把它们写成“没用到”。
证据数字沿用机械基线逐根统计，本次重跑已核对目标声明不变；它们不是新增的逐规则执行计数。表中 a / b 分别表示主产物覆盖的去重根数／纳入 quality family 辅助产物后的去重根数，不是成功率。
原先 34 项只是有产物证据的清单；现在补全源准备、match、递归、转换子机制和求解路径，使整套实现的规则不再隐含在“核心”里。

**完整验证已通过：重新导出并翻译 2180 / 2180 项，0 受阻；51 个含声明模块的源端 roundtrip、Lean consumer、结构 audit 全部通过。**
普通定理仍翻译陈述；331 个根仍带明确待证参数。这不是原定理证明全部移植或已建立 correspondence。

| 类别 | 纳入集合 | 不启用 |
|---|---:|---:|
| 翻译／源准备规则 | 102 | 2 |
| 接受条件与独立检查 | 8 | 1 |
| 调度与回滚 | 5 | 0 |

**E：声明、导出与证明条件**

| 编号 | 规则 | 本集合是否启用 | 作用 | 使用证据／保留理由 | 实现位置 |
|---|---|---|---|---|---|
| E01 | 依赖闭包导出 | 是 | 导出声明及依赖，记录原生宇宙事实、实例、透明性、quality、relevance 和 body_state；按依赖顺序处理。 | 处理范围：2180 / 2180 个根；此证据不等于独立调用记录。 | [r2l_export.ml:1677](../experiments/mechanical-nat-eq-20261019/translator/rocq/exporter/src/r2l_export.ml#L1677) |
| E02 | 归约后分类 | 是 | 沿类型的乘积和透明归约识别最终 Prop/SProp；不能仅凭未归约的表面 Type 分类。 | 源端元数据：2070 / 2070 个根；此证据不等于独立调用记录。 | [r2l_export.ml:983](../experiments/mechanical-nat-eq-20261019/translator/rocq/exporter/src/r2l_export.ml#L983)；[r2l_export.ml:1017](../experiments/mechanical-nat-eq-20261019/translator/rocq/exporter/src/r2l_export.ml#L1017) |
| E03 | 普通定理／公理的 statement 模式 | 是 | 翻译命题为 Prop 的定义，不把原公理变成 Lean axiom，也不默认搬运普通定理证明。 | 已确认产物／导出证据：1029 / 1029 个根。最终陈述产物。 | [r2l_export.ml:1200](../experiments/mechanical-nat-eq-20261019/translator/rocq/exporter/src/r2l_export.ml#L1200)；[Emit.lean:587](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L587) |
| E04 | 嵌入证明抽取 | 是 | 计算定义中的证明片段抽成命名 obligation；需要时在目标声明前增加显式假设参数。 | 已确认产物／导出证据：244 / 244 个根。自身源 IR 带 obligations；不等于所有继承待证条件的根。 | [r2l_export.ml:1060](../experiments/mechanical-nat-eq-20261019/translator/rocq/exporter/src/r2l_export.ml#L1060) |
| E05 | 局部证明应用保留 | 是 | 以局部假设为头的证明应用保留；其中构造出的证明参数仍按源端准备规则处理。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [r2l_export.ml:1060](../experiments/mechanical-nat-eq-20261019/translator/rocq/exporter/src/r2l_export.ml#L1060) |
| E06 | 证明结构保留重试 | 是 | 准备失败时，可保留构造器形证明及引用的证明应用结构；所需全局证明仍作为明确前提。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [r2l_export.ml:1200](../experiments/mechanical-nat-eq-20261019/translator/rocq/exporter/src/r2l_export.ml#L1200) |
| E07 | 中性证明投影保留 | 是 | 单构造器 proof 的投影／取字段 match 可保留；透明头仅在符合限定形状时展开。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [r2l_export.ml:1060](../experiments/mechanical-nat-eq-20261019/translator/rocq/exporter/src/r2l_export.ml#L1060) |
| E08 | 透明计算定义 | 是 | 源定义的类型及正文均翻译，注册为 Lean def。 | 已确认产物／导出证据：934 / 934 个根。最终 def 产物覆盖。 | [Emit.lean:215](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L215) |
| E09 | 不透明数据定义 | 是 | opaque_data 的准备后正文仍检查并注册为 Lean opaque，保持不透明性。 | 已确认产物／导出证据：107 / 107 个根。最终 opaque 产物覆盖，含 quality family。 | [Emit.lean:215](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L215) |
| E10 | 不透明接口策略 | 是 | opaque_interface 策略仅导出类型接口和数据任务；不能与保留实现的 opaque_data 混为一谈。 | 既有统计口径为 0；保留实现，不将该 0 外推为所有依赖或重试中的零调用。 | [Emit.lean:2380](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L2380) |
| E11 | 封装实现准备 | 是 | 准备 sealed module／锁定实现时保留源端重新检查，不能把解封装作为不受检查的改写。 | 源端元数据：7 / 7 个根；此证据不等于独立调用记录。 | [r2l_export.ml:238](../experiments/mechanical-nat-eq-20261019/translator/rocq/exporter/src/r2l_export.ml#L238) |
| E12 | 多态条件与状态 | 是 | 条件按所需宇宙实例使用；最终 pending 状态依据实际剩余假设，源转换后不用的条件可消除。 | 已确认产物／导出证据：331 / 331 个根。最终有显式条件；条件合并／消除的内部次数未单列。 | [Emit.lean:415](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L415)；[Translate.lean:676](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L676) |
| E13 | 延后 guard 处理 | 是 | 源准备可将某些 guard 问题交给后续结构／良基转换；延后本身不等于终止性证明。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [r2l_export.ml:1200](../experiments/mechanical-nat-eq-20261019/translator/rocq/exporter/src/r2l_export.ml#L1200) |
| E14 | 条件装配 | 否 | Assemble 可使用经检查的外部证明填充任务、重译依赖并保留 opaque；不是自动证明器。 | 本次调用 translate，不调用 assemble；不填充外部证明。 | [Emit.lean:2040](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L2040) |

**T：基本项与数据类型**

| 编号 | 规则 | 本集合是否启用 | 作用 | 使用证据／保留理由 | 实现位置 |
|---|---|---|---|---|---|
| T01 | 变量和绑定 | 是 | rel 映射为对应绑定变量，保持作用域和 de Bruijn 对应。 | 已确认产物／导出证据：1982 / 1982 个根。最终 AST 含 bvar；不是 rel 转换调用次数。 | [Translate.lean:2124](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L2124) |
| T02 | Π、λ、let、应用 | 是 | 分别生成 forall、lambda、let 和 application；保留类型注解并进行类型检查。 | 已确认产物／导出证据：2155 / 2155 个根。最终 AST 含绑定／应用结构。 | [Translate.lean:2124](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L2124) |
| T03 | 常量、归纳类型与构造器引用 | 是 | 引用已注册目标，并附对应的宇宙实例；不按名字相似程度猜测对应。 | 已确认产物／导出证据：2090 / 2097 个根。最终 AST 含常量引用，含辅助引用。 | [Translate.lean:3386](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L3386) |
| T04 | cast | 是 | 源可转换的 cast 可消去；不直接可转换时必须走受检查的修复或显式表示转换。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:2124](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L2124) |
| T05 | SP：SProp → Prop | 是 | 目标采用 Lean Prop；保留源端消去和 relevance 检查，不把 SProp 约束任意放宽。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:570](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L570) |
| T06 | 旧 Bootstrap nat／eq（已停用） | 否 | 空 bootstrap 表；源 nat、eq 均由 T07 生成独立归纳类型。保留编号用于历史比较，当前命中 0；correspondence 在翻译后单独证明。 | bootstrapRules 为空；nat/eq 走普通归纳类型生成。 | [Bootstrap.lean:39](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Bootstrap.lean#L39) |
| T07 | 普通单体归纳块 | 是 | 保留参数、索引、构造器顺序；通过 Lean 内核的归纳声明检查。 | 已确认产物／导出证据：110 / 110 个根。最终生成归纳块的覆盖。 | [Emit.lean:1349](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L1349) |
| T08 | 原生记录及投影 | 是 | 符合单构造器、无索引、非递归形状的 primitive record 可用结构表示及 Expr.proj。 | 既有统计口径为 0；保留实现，不将该 0 外推为所有依赖或重试中的零调用。 | [Emit.lean:1349](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L1349) |
| T09 | 非均匀参数 | 是 | 源 nparams_rec 之后不保持均匀的参数转为 Lean 索引。 | 源端元数据：1 / 1 个根；此证据不等于独立调用记录。 | [Emit.lean:1349](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L1349) |
| T10 | T：非递归 coinductive | 是 | 符合条件的非递归单体 coinductive 转为普通 inductive；递归 cofix 不因此获得支持。 | 已确认产物／导出证据：4 / 4 个根。最终报告 coinductive_as_inductive 非空／非零。 | [Translate.lean:1087](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L1087)；[Emit.lean:1349](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L1349) |
| T11 | 受限嵌套归纳与带条件归纳 | 是 | 支持限定的单体嵌套匹配／结构递归；归纳目标必要时带前置证明条件，不等于任意互归纳支持。 | 既有统计口径为 0；保留实现，不将该 0 外推为所有依赖或重试中的零调用。 | [Translate.lean:787](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L787)；[Emit.lean:1349](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L1349) |

**M：匹配、递归和计算转换**

| 编号 | 规则 | 本集合是否启用 | 作用 | 使用证据／保留理由 | 实现位置 |
|---|---|---|---|---|---|
| M01 | M3b：依赖 match | 是 | 用真实 Lean recursor；由源 predicate 构造 motive，并按内核字段和 IH 布置分支。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:2465](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L2465) |
| M02 | 非均匀 match | 是 | 受限非均匀参数片段使用 convoy／Eq.rec；已知构造器的 match 优先做 ι 归约。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:2602](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L2602) |
| M03 | 单函数结构递归 | 是 | 递减参数改写为 recursor；递减参数之后的实参可变化。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:2817](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L2817) |
| M04 | 变化前置参数泛化 | 是 | 在保留参数的类型不依赖其变化的条件下，将变化的前置参数移入 motive。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:864](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L864) |
| M05 | 索引与函数递归字段 | 是 | 泛化索引；函数形递归字段产生带相应参数的归纳假设。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:1769](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L1769)；[Translate.lean:2817](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L2817) |
| M06 | ι 泛化递归 | 是 | 外层 match 不在递减参数上时，对整个函数体代入递减构造器再归约；不任意重排 match。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:2817](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L2817) |
| M07 | 结构互递归 | 是 | 对同一归纳类型、相同递减位置及兼容前置类型的函数，构造联合 PProd 递归结果再投影。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:3264](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L3264) |
| M08 | 递归暴露 | 是 | ζ 展开递归 let，限定地展开透明辅助调用，使递归使用显露出来。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:1372](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L1372)；[Translate.lean:985](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L985) |
| M09 | Course-of-values | 是 | 特定非直接递归字段调用失败后，用 below／PProd 缓存；受索引、非均匀和嵌套形状限制。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:1829](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L1829)；[Translate.lean:3212](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L3212) |
| M10 | Accessibility 转换 | 是 | 特定从 Prop 递归产生数据的情形，构造调用关系及源 guard 支持的良基证书。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:2989](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L2989) |
| M11 | 显式良基回退 | 是 | statement 模式下可用 Acc.rec，并把未解决的良基性／展开等式证明列为显式任务。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:3100](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L3100) |
| M12 | 构造器形索引 | 是 | 支持限定的非递归单构造器记录索引，以字段投影恢复不同的早期实参；拒绝重复叶子等不支持形状。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:1728](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L1728) |
| M13 | 递归 cast 修复 | 是 | 通过病例分析与等式 transport 处理需要展开 fix 才成立的转换；不是任意强制转换。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:1853](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L1853) |

**U：宇宙解释与求解**

| 编号 | 规则 | 本集合是否启用 | 作用 | 使用证据／保留理由 | 实现位置 |
|---|---|---|---|---|---|
| U01 | R0：原生事实 | 是 | 从源内核获得并复核全局及多态上下文中的宇宙约束。 | 处理范围：2180 / 2180 个根；此证据不等于独立调用记录。 | [r2l_export.ml:599](../experiments/mechanical-nat-eq-20261019/translator/rocq/exporter/src/r2l_export.ml#L599) |
| U02 | R1：基础 sort 映射 | 是 | Prop 映射 Sort 0；一般 Type(l+n) 映射 Sort(I(l)+n+1)，max 分量逐项解释；R8 是特定例外。 | 已确认产物／导出证据：1782 / 1782 个根。最终 AST 含 Sort，未区分普通读取和 R8。 | [Translate.lean:570](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L570) |
| U03 | R2／R2T：宇宙参数化 | 是 | 将常量接口以及归纳块 arity／构造器中的相应全局层级参数化。 | 已确认产物／导出证据：1031 / 1031 个根。最终公开 u_ 层级参数覆盖，排除显式 v_i。 | [Emit.lean:587](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L587)；[Emit.lean:1349](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L1349) |
| U04 | R2S：公开层级求解 | 是 | 自己的层级先作 metavariable，经类型统一后检查原生约束；自由的公开层级泛化。 | 已确认产物／导出证据：129 / 129 个根。最终报告 solved_levels 非空／非零。 公开与正文局部求解未独立拆分。 | [Translate.lean:3962](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L3962) |
| U05 | R2B：正文局部层级 | 是 | 只在正文出现的局部层级可求解或取受约束的最小模型。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:3802](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L3802)；[Translate.lean:3780](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L3780) |
| U06 | R3：引用一致性与不抬高 | 是 | 共享层级复用或受检查地重新实例化；所有引用实例必须满足源界限与一致性要求。 | 已确认产物／导出证据：867 / 867 个根。最终报告 universe_checks 非空／非零。 | [Translate.lean:3700](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L3700) |
| U07 | R3′／R3″：残留实例 | 是 | 未解层级不能当通配符；一般化及默认零均有适用条件与后续检查。 | 已确认产物／导出证据：1 / 1 个根。最终报告 universe_residuals 非空／非零。 | [Emit.lean:270](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L270) |
| U08 | R4：Lean 内部 Eq 层级检查 | 是 | 辅助转换证明中原生 Lean Eq 的参数层级由实参类型决定并重查；这不是源 eq→Lean Eq 的直接映射。源 eq 现在使用普通模板归纳块规则。 | 产物结构：6 / 6 个根；此证据不等于独立调用记录。 | [Translate.lean:630](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L630) |
| U09 | R5／R5S：模板层级 | 是 | 模板层级依原生模板绑定及实参类型实例化；非模板附加层级由构造器等约束求解。 | 已确认产物／导出证据：27 / 27 个根。最终报告 template 非空／非零。 统计模板块本身，下游实例化另属引用。 | [Emit.lean:1307](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L1307)；[Translate.lean:697](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L697) |
| U10 | R6：显式多态常量 | 是 | 保留原显式宇宙参数和每次引用的原实例；不能静默丢弃约束。 | 已确认产物／导出证据：194 / 194 个根。对应声明有显式多态宇宙参数。 | [Emit.lean:587](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L587) |
| U11 | 多态归纳块 | 是 | 同样保留显式宇宙参数及实例；源码／文档的 R6-I 标记存在重用，须结合机制阅读。 | 已确认产物／导出证据：6 / 6 个根。对应声明有显式多态宇宙参数。 | [Emit.lean:1349](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L1349) |
| U12 | R2⁺：事实化简 | 是 | 用原生可证的大小关系删除 max 中被支配的项。 | 结果报告字段：1 / 1 个根；此证据不等于独立调用记录。 | [Translate.lean:513](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L513) |
| U13 | R2F／R2F-c：约束解释 | 是 | 以 max(u_l, 下界的解释+偏移) 表示层级，使受支持的约束对解释后的参数成立。 | 已确认产物／导出证据：1 / 1 个根。最终报告 level_interp 非空／非零。 | [Translate.lean:3816](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L3816) |
| U14 | R3-P：局部与全局联合蕴含 | 是 | 引用检查同时使用局部多态约束及原生全局图。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:3651](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L3651) |
| U15 | R3G：隐含层级发现 | 是 | 由实际引用的自由层级类发现必要的公开参数；保留引用证据，去掉未使用的发现项。 | 已确认产物／导出证据：227 / 227 个根。最终报告 implicit_levels 非空／非零。 | [Emit.lean:1701](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L1701)；[Emit.lean:587](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L587) |
| U16 | R3G-F：结果 sort 层级 | 是 | 对符合来源条件的字段／结果-sort 隐含层级使用受限读取；不能借此改变 carrier。 | 既有统计口径为 0；保留实现，不将该 0 外推为所有依赖或重试中的零调用。 | [Emit.lean:1344](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L1344)；[Emit.lean:1349](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L1349) |
| U17 | R8：Sort 化 | 是 | 仅在限定 arity／motive 等位置，将 Type 层级改作可含 Prop 的 Sort 参数；跨引用处理相应 +1 偏移。 | 已确认产物／导出证据：598 / 598 个根。最终报告 admitting_levels 非空／非零。 | [Translate.lean:3528](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L3528) |
| U18 | R-CARRIER P1 | 是 | R2F 中不让 carrier 因同块的特定其他层级被抬高；依据被识别的层级对，非删除所有下界。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Split.lean:285](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Split.lean#L285) |
| U19 | R-CARRIER P2 | 是 | 对类型中确实独立的隐含操作数层级类生成独立副本；类型统一要求相同的类不拆开。 | 已确认产物／导出证据：66 / 66 个根。最终报告 level_copies 非空／非零。 | [Emit.lean:935](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L935) |
| U20 | R-CARRIER P3 | 是 | 证明局部层级不能充当公开操作数宇宙类的代表。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Emit.lean:1018](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L1018) |
| U21 | R-SPLIT | 是 | 仅对符合出现位置条件的共享源层级拆分参数副本；结果使用 max，保留对角实例及引用界限；可回退不拆分。 | 既有统计口径为 0；保留实现，不将该 0 外推为所有依赖或重试中的零调用。 | [Emit.lean:2312](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L2312) |
| U22 | Rule R：语义一致性 | 是 | 在源事实的所有模型下比较层级解释，而非仅比较表达式字符串；每个分量仍过 R3。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:608](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L608)；[Translate.lean:3599](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L3599) |
| U23 | Rule H：条件实例 | 是 | 待证命题可在所需较低实例使用，避免提前锁死公开 carrier；仍检查不抬高。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:638](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L638) |
| U24 | 逐出现层级／unify | 是 | 引用发生处先分配新 metavariable，求解后重绑定共享自由层级并检查一致性。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:608](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L608)；[Emit.lean:1779](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L1779) |
| U25 | sort_interp | 是 | 归纳块参数保持普通读取，仅结果 sort 使用约束解释。 | 结果报告字段：5 / 5 个根；此证据不等于独立调用记录。 | [Emit.lean:1460](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L1460) |
| U26 | 求解器 P2／joint | 是 | 有限尝试联合出现的 max 层级变量；定义的后续重试按更少不必要默认化等条件选择。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Emit.lean:496](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L496) |
| U27 | 求解器 P3／hypExact | 是 | 每次使用先保留精确条件实例；宇宙求解后只合并同一叶子且类型一致的条件。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:638](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L638)；[Emit.lean:1779](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L1779) |
| U28 | R3↑／R3↓ | 是 | 在受原生事实检查的片段使用累积抬升或较低引用实例；不是无限制改层级。 | 策略标志：22 / 22 个根；此证据不等于独立调用记录。 | [Emit.lean:1779](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L1779) |
| U29 | R2B-P | 是 | 受限 Prop 相关局部解释需源端 CheckInstance；当前 statement 路径拒绝这类特殊化，不能用于缩窄定理。 | 已确认产物／导出证据：1 / 1 个根。最终报告 r2bp_levels 非空／非零。 | [Emit.lean:1296](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L1296) |
| U30 | R2B-S | 是 | 只允许符合条件的结果 sort 降低，不能降低 binder 层级；受保护接口及 statement 检查约束。 | 已确认产物／导出证据：1 / 1 个根。最终报告 sort_lowered_levels 非空／非零。 | [Translate.lean:3518](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L3518) |
| U31 | R2B-V | 是 | 从 Type-valued 正文继承实际结果 sort，仅限结果位置；不改公开 binder，不从 Prop 任意扩展。 | 已确认产物／导出证据：1 / 1 个根。最终报告 result_sort_inherited 非空／非零。 | [Emit.lean:590](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L590) |
| U32 | 局部多态约束解释／polyUniverseInterpretation | 是 | 对受支持的带偏移约束闭包生成 max 解释，保留原显式参数及源允许实例；不接受正环等不支持情形。 | 已确认产物／导出证据：26 / 33 个根。最终报告 poly_level_interp 非空／非零。 | [Translate.lean:29](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L29) |
| U33 | 带全局上界的片段 | 是 | 只处理受检查的向外 local／Set→global 约束；逐项检查原生条件，不宣称任意目标参数满足全局界限。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:29](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L29) |
| U34 | 精确 R6 回退与等层级归并 | 是 | 局部解释不可用时保留精确实例；Type transport 前可合并原生相等的全局层级。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Emit.lean:630](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L630) |
| U35 | 最小默认与有界 max 求解 | 是 | 只在限定的解释／Type 转换路径提前默认封闭正文局部层级；候选须经统一、原生事实、R3 和内核检查。 | 部分子机制：1 / 1 个根；此证据不等于独立调用记录。 | [Translate.lean:3918](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L3918)；[Translate.lean:3941](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L3941) |
| U36 | Q-a：phantom sort | 是 | 只处理识别出的 phantom 形状，将相应 sort 实参改写为配对的值／类型表示并清理消失的专属层级；一般 Q-b 未实现。 | 既有统计口径为 0；保留实现，不将该 0 外推为所有依赖或重试中的零调用。 | [Translate.lean:1153](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L1153) |

**C：源端可转换展开**

| 编号 | 规则 | 本集合是否启用 | 作用 | 使用证据／保留理由 | 实现位置 |
|---|---|---|---|---|---|
| C01 | 别名前缀 | 是 | 处理限定 let／lambda 前缀中的 ζ 转换。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:1032](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L1032) |
| C02 | 透明引用别名 | 是 | 展开符合条件的常量头引用、部分应用及无 lambda 的透明别名。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:1045](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L1045) |
| C03 | 纯绑定变量组合子 | 是 | lambda 前缀之后仅由绑定变量及应用组成的透明组合子可展开；不扩成任意项。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:1038](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L1038) |
| C04 | 类型缩写闭包 | 是 | 透明多态／类型别名与计算类型的可用性做联合闭包，只有已知可转换项才参与。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Emit.lean:2134](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L2134) |
| C05 | 精确实例替换 | 是 | 展开时在 sort、case、fix、原语等位置精确代入源宇宙实例，保持绑定。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:1209](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L1209) |
| C06 | 已知构造器驱动计算 | 是 | 限定单 fix、已知递减构造器的 βδιζ 计算；有界执行，不任意展开 opaque／deferred guard 正文。 | 已确认产物／导出证据：8 / 8 个根。最终报告 source_computed 非空／非零。 | [Translate.lean:1248](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L1248) |
| C07 | Set-motive 展开 | 是 | 对符合条件的透明常量展开以恢复可用于 Prop 的 motive；逐应用记录转换，裸引用不必一律展开。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Emit.lean:587](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L587) |

**L：显式表示转换**

| 编号 | 规则 | 本集合是否启用 | 作用 | 使用证据／保留理由 | 实现位置 |
|---|---|---|---|---|---|
| L01 | Rule P：命题载荷提升 | 是 | 用可容纳 Prop 的 PULift 包装命题／证明载荷，使其达到所声明的 Type 表示。 | 已确认产物／导出证据：1 / 1 个根。prop_lift 非 null；深度 0 也算命中。 | [Emit.lean:587](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L587)；[Translate.lean:1914](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L1914) |
| L02 | Prop up／down | 是 | 在实参、结果和 cast 位置按需求使用构造／投影；保持 let 和 cast 的声明上界。 | 已确认产物／导出证据：2 / 2 个根。最终报告 prop_lift_coercions 非空／非零。 | [Translate.lean:1914](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L1914)；[Translate.lean:1929](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L1929) |
| L03 | Type up／down | 是 | 对受支持的较低 Type 载荷用 PULift 达到公开上界，保留所需公开参数。 | 已确认产物／导出证据：46 / 53 个根。type_lift 非 null 或 type_lift_coercions>0。 | [Translate.lean:1966](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L1966) |
| L04 | 函数 η 转换 | 是 | 递归转换参数和结果；输入逆向适配，输出正向适配，不改变源参数顺序。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:1966](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L1966) |
| L05 | 类型位置解包 | 是 | 包装的值被当作类型使用时，先恢复其中的实际类型。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:2110](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L2110) |
| L06 | 包装函数应用 | 是 | 有限次解开外层 PULift 后，对适配后的实参执行应用。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:2074](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L2074) |
| L07 | 同记录逐字段转换 | 是 | 仅同一非递归、单构造器、无索引记录；使用真实 recursor 保留字段次序及依赖类型。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:1966](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L1966) |
| L08 | 组合转换 | 是 | 外层 PULift 可与内部函数／记录转换组合；main75 中直接 Type up/down 是这条递归机制的基本情况。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:1966](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L1966) |
| L09 | 延迟不确定模板转换 | 是 | 模板 Sort 还可能为 Prop 时，先普通统一，再决定是否适用 Type lift。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Translate.lean:1954](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L1954) |
| L10 | 提升命题的陈述视图 | 是 | 符合条件且未受保护的 lifted Prop 头部可沿透明链恢复命题视图；仍检查接口与 up 对应。 | 既有统计口径为 0；保留实现，不将该 0 外推为所有依赖或重试中的零调用。 | [Emit.lean:1760](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L1760) |

**Q：Sort quality 多态**

| 编号 | 规则 | 本集合是否启用 | 作用 | 使用证据／保留理由 | 实现位置 |
|---|---|---|---|---|---|
| Q01 | 原生 quality 绑定 | 是 | 保留共享 quality 变量，以及它在参数、结果中的原生绑定关系。 | 源端元数据：50 / 50 个根；此证据不等于独立调用记录。 | [r2l_export.ml:424](../experiments/mechanical-nat-eq-20261019/translator/rocq/exporter/src/r2l_export.ml#L424)；[r2l_export.ml:1409](../experiments/mechanical-nat-eq-20261019/translator/rocq/exporter/src/r2l_export.ml#L1409) |
| Q02 | 模板 Sort 参数 | 是 | 固定 Prop／Type 模板可生成 Sort 参数，固定 Type 的最低层级要求仍保留；失败时可回退旧 Type 路径。 | 已确认产物／导出证据：22 / 22 个根。最终报告 template_sort 非空／非零。 | [Emit.lean:1433](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L1433) |
| Q03 | 共享 quality 模板族 | 是 | 限定的单体、非递归、均匀无索引模板族生成 Prop／Type 两种表示，全部检查后才接受。 | 已确认产物／导出证据：5 / 5 个根。最终报告 quality_prop 非空／非零。 | [Quality.lean:54](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Quality.lean#L54)；[Emit.lean:2090](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L2090) |
| Q04 | 按源注解分派 | 是 | 使用源实参注解、局部 let、声明结果与源 case 上下文选择分支，不仅猜测目标项的 sort。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [QualitySource.lean:250](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/QualitySource.lean#L250) |
| Q05 | 原生有限 quality family | 是 | 对受支持的无约束 quality 变量覆盖 SProp／Prop／Type 的全部 3^q 组合；本次 23 根对应 603 个分支实例。 | 已确认产物／导出证据：23 / 23 个根。原生 quality_family 根；同一根的所有分支完整检查。 | [r2l_export.ml:1409](../experiments/mechanical-nat-eq-20261019/translator/rocq/exporter/src/r2l_export.ml#L1409)；[quality_families.py:10](../experiments/mechanical-nat-eq-20261019/translator/tools/quality_families.py#L10) |
| Q06 | 原生重检查及实现保留 | 是 | 每个 quality 分支实例化原类型和正文并重检查；这类有来源证明的 family 连 Prop 分支也保留实现，是普通 statement 策略的专门例外。 | 源端元数据：23 / 23 个根；此证据不等于独立调用记录。 | [r2l_export.ml:1852](../experiments/mechanical-nat-eq-20261019/translator/rocq/exporter/src/r2l_export.ml#L1852)；[quality_families.py:105](../experiments/mechanical-nat-eq-20261019/translator/tools/quality_families.py#L105) |
| Q07 | 封闭 quality 引用 | 是 | 含裸引用及部分应用，使用精确实例分派；未解 quality 不能默认为全 Type。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [r2l_export.ml:1561](../experiments/mechanical-nat-eq-20261019/translator/rocq/exporter/src/r2l_export.ml#L1561) |

**N：原语表示与适配**

| 编号 | 规则 | 本集合是否启用 | 作用 | 使用证据／保留理由 | 实现位置 |
|---|---|---|---|---|---|
| N01 | Int63 | 是 | 类型使用 BitVec 63；保留无符号／有符号及模 2^63 语义，字面量检查范围。 | 源端元数据：31 / 31 个根；此证据不等于独立调用记录。 | [Translate.lean:107](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L107) |
| N02 | Array | 是 | 有界持久数组，保留元素类型、顺序、default 与原生大小上界。 | 源端元数据：7 / 7 个根；此证据不等于独立调用记录。 | [Translate.lean:136](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L136) |
| N03 | String | 是 | 有界字节串，保留 NUL 和非 UTF 字节；不是直接改成 Unicode String。 | 源端元数据：7 / 7 个根；此证据不等于独立调用记录。 | [Translate.lean:145](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L145) |
| N04 | Float | 是 | 二进制 64 位模型，保留舍入、符号零、无穷与 NaN 表示策略；不能以未经核查的宿主 Float 替代。 | 源端元数据：20 / 20 个根；此证据不等于独立调用记录。 | [Translate.lean:169](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L169) |
| N05 | 结构结果适配 | 是 | 布尔、比较、carry、pair、float classification 按源内核注册的构造器角色重建。 | 源端元数据：22 / 22 个根；此证据不等于独立调用记录。 | [Translate.lean:159](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L159)；[Translate.lean:191](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L191) |
| N06 | 字面量、身份与原语公理 | 是 | 检查原生操作身份、字面量载荷和模板实例；原语性质的源公理仍按命题陈述处理，不新增 Lean 公理。 | 部分子机制：65 / 65 个根；此证据不等于独立调用记录。 | [Translate.lean:2124](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L2124) |

**V：接受条件与独立验证（不是产生译文的改写规则）**

| 编号 | 规则 | 本集合是否启用 | 作用 | 使用证据／保留理由 | 实现位置 |
|---|---|---|---|---|---|
| V01 | 源内核检查 | 是 | 复核 source flags、guard、positivity、宇宙、消去与 relevance，按所用转换核查源实例。 | 处理范围：2180 / 2180 个根；此证据不等于独立调用记录。 | [roundtrip.py:438](../experiments/mechanical-nat-eq-20261019/translator/tools/roundtrip.py#L438) |
| V02 | Bootstrap 签名检查 | 否 | 已有目标必须匹配源身份、类型和构造器适配。 | 没有 bootstrap 注册项，因此不应用 bootstrap 签名适配。 | [Bootstrap.lean:49](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Bootstrap.lean#L49) |
| V03 | Lean 内核检查 | 是 | 注册实际目标声明；不得留下未解 metavariable；声明必须在公开宇宙参数下合法。 | 处理范围：2180 / 2180 个根；此证据不等于独立调用记录。 | [Kernel.lean:23](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Kernel.lean#L23)；[Kernel.lean:38](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Kernel.lean#L38) |
| V04 | P0 与陈述一般性 | 是 | 保护指定接口；freeLevelPin、binder independence 等防止通过锁死公开参数取得成功。 | 处理范围：2056 / 2056 个根；此证据不等于独立调用记录。 | [Emit.lean:375](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L375)；[Emit.lean:538](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L538) |
| V05 | 宇宙事实与引用检查 | 是 | 原生约束、R3 引用界限及一致性是独立接受条件。 | 结果报告字段：867 / 867 个根；此证据不等于独立调用记录。 | [Translate.lean:3853](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L3853)；[Translate.lean:3780](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Translate.lean#L3780) |
| V06 | 依赖与条件完整性 | 是 | 缺依赖则阻塞；目标类型、namespace、pending 状态必须与实际前提一致。 | 处理范围：2180 / 2180 个根；此证据不等于独立调用记录。 | [Emit.lean:197](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L197) |
| V07 | 独立 consumer | 是 | 重新导入实际目标，检查种类、正文、不透明性、构造器、依赖、宇宙及公理闭包。 | 模块验证结果：2180 / 2180 个根；此证据不等于独立调用记录。 | [Verify.lean:239](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Verify.lean#L239) |
| V08 | 独立结构审计 | 是 | 重建源展开与 recursor／η／lift／字段对应；仅内核类型正确还不够。 | 模块验证结果：2180 / 2180 个根；此证据不等于独立调用记录。 | [audit.py:4362](../experiments/mechanical-nat-eq-20261019/translator/tools/audit.py#L4362) |
| V09 | 覆盖与资源失败 | 是 | quality 分支及根声明必须完整；超时、预算耗尽和异常不计成功。 | 处理范围：2180 / 2180 个根；此证据不等于独立调用记录。 | [Command.lean:61](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Command.lean#L61)；[Emit.lean:1742](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L1742) |

**S：尝试调度与状态管理（不另算语义规则）**

| 编号 | 规则 | 本集合是否启用 | 作用 | 使用证据／保留理由 | 实现位置 |
|---|---|---|---|---|---|
| S01 | 固定声明分派 | 是 | 按 inductive／constant、template、statement、Type-valued、split、protected 等属性选择处理路径。 | 处理范围：2180 / 2180 个根；此证据不等于独立调用记录。 | [Emit.lean:2112](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L2112) |
| S02 | 有门槛的阶梯 | 是 | 按固定顺序尝试不同开关组合；之前的错误及适用条件限制后续尝试，不是穷举所有组合。 | 尝试记录：2175 / 2175 个根；此证据不等于独立调用记录。 | [Emit.lean:2337](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L2337) |
| S03 | 提前转换与一般性重试 | 是 | 部分 Type transport 提前尝试；定义首次通过后仍可能比较更少默认化的候选，故不总是第一次通过即最终结束。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Emit.lean:2470](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L2470) |
| S04 | 归纳块自己的阶梯 | 是 | 普通参数、事实解释、隐含层级、sort_interp、源展开等分别有受控尝试。 | 尝试记录：105 / 105 个根；此证据不等于独立调用记录。 | [Emit.lean:2802](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L2802) |
| S05 | 失败回滚与预算 | 是 | 失败时恢复 Meta 状态及转换计数；分层和声明级资源限制。一次局部预算耗尽不应概括为必然终止全部阶梯。 | 子机制未独立记录；本集合保留，不将其冒充已命中或未使用。 | [Emit.lean:1742](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L1742)；[Emit.lean:1779](../experiments/mechanical-nat-eq-20261019/translator/Rocq2Lean/Emit.lean#L1779) |

**原语类型映射（逐项）**

| 源声明 | 目标表示 | 本集合启用 |
|---|---|---|
| Corelib.Array.PrimArray.array | Rocq2Lean.PrimArray.Rep | 是 |
| Corelib.Floats.PrimFloat.float | Rocq2Lean.PrimFloat.Rep | 是 |
| Corelib.Numbers.Cyclic.Int63.PrimInt63.int | BitVec | 是 |
| Corelib.Strings.PrimString.string | Rocq2Lean.PrimString.Rep | 是 |

**原语操作映射（逐项）**

| 原语 | 目标操作 | 源声明 | 本集合启用 |
|---|---|---|---|
| add | BitVec.add | Corelib.Numbers.Cyclic.Int63.PrimInt63.add | 是 |
| sub | BitVec.sub | Corelib.Numbers.Cyclic.Int63.PrimInt63.sub | 是 |
| mul | BitVec.mul | Corelib.Numbers.Cyclic.Int63.PrimInt63.mul | 是 |
| div | PrimInt63.udiv | Corelib.Numbers.Cyclic.Int63.PrimInt63.div | 是 |
| rem | PrimInt63.umod | Corelib.Numbers.Cyclic.Int63.PrimInt63.mod | 是 |
| l_and | PrimInt63.land | Corelib.Numbers.Cyclic.Int63.PrimInt63.land | 是 |
| l_or | PrimInt63.lor | Corelib.Numbers.Cyclic.Int63.PrimInt63.lor | 是 |
| l_xor | PrimInt63.lxor | Corelib.Numbers.Cyclic.Int63.PrimInt63.lxor | 是 |
| divs | PrimInt63.sdiv | Corelib.Numbers.Cyclic.Int63.PrimInt63.divs | 是 |
| rems | PrimInt63.smod | Corelib.Numbers.Cyclic.Int63.PrimInt63.mods | 是 |
| l_sl | PrimInt63.lsl | Corelib.Numbers.Cyclic.Int63.PrimInt63.lsl | 是 |
| l_sr | PrimInt63.lsr | Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr | 是 |
| a_sr | PrimInt63.asr | Corelib.Numbers.Cyclic.Int63.PrimInt63.asr | 是 |
| head0 | PrimInt63.head0 | Corelib.Numbers.Cyclic.Int63.PrimInt63.head0 | 是 |
| tail0 | PrimInt63.tail0 | Corelib.Numbers.Cyclic.Int63.PrimInt63.tail0 | 是 |
| addMulDiv | PrimInt63.addmuldiv | Corelib.Numbers.Cyclic.Int63.PrimInt63.addmuldiv | 是 |
| eq | PrimInt63.eqb | Corelib.Numbers.Cyclic.Int63.PrimInt63.eqb | 是 |
| lt | PrimInt63.ltb | Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb | 是 |
| le | PrimInt63.leb | Corelib.Numbers.Cyclic.Int63.PrimInt63.leb | 是 |
| lts | PrimInt63.ltsb | Corelib.Numbers.Cyclic.Int63.PrimInt63.ltsb | 是 |
| les | PrimInt63.lesb | Corelib.Numbers.Cyclic.Int63.PrimInt63.lesb | 是 |
| arraymake | PrimArray.make | Corelib.Array.PrimArray.make | 是 |
| arrayget | PrimArray.get | Corelib.Array.PrimArray.get | 是 |
| arrayset | PrimArray.set | Corelib.Array.PrimArray.set | 是 |
| arraylength | PrimArray.length | Corelib.Array.PrimArray.length | 是 |
| arraydefault | PrimArray.default | Corelib.Array.PrimArray.default | 是 |
| arraycopy | PrimArray.copy | Corelib.Array.PrimArray.copy | 是 |
| string_make | PrimString.make | Corelib.Strings.PrimString.make | 是 |
| string_length | PrimString.length | Corelib.Strings.PrimString.length | 是 |
| string_get | PrimString.get | Corelib.Strings.PrimString.get | 是 |
| string_sub | PrimString.sub | Corelib.Strings.PrimString.sub | 是 |
| string_cat | PrimString.cat | Corelib.Strings.PrimString.cat | 是 |
| string_compare | PrimString.compare | Corelib.Strings.PrimString.compare | 是 |
| compare | PrimInt63.compare | Corelib.Numbers.Cyclic.Int63.PrimInt63.compare | 是 |
| compares | PrimInt63.compares | Corelib.Numbers.Cyclic.Int63.PrimInt63.compares | 是 |
| addc | PrimInt63.addc | Corelib.Numbers.Cyclic.Int63.PrimInt63.addc | 是 |
| addCarryC | PrimInt63.addcarryc | Corelib.Numbers.Cyclic.Int63.PrimInt63.addcarryc | 是 |
| subc | PrimInt63.subc | Corelib.Numbers.Cyclic.Int63.PrimInt63.subc | 是 |
| subCarryC | PrimInt63.subcarryc | Corelib.Numbers.Cyclic.Int63.PrimInt63.subcarryc | 是 |
| mulc | PrimInt63.mulc | Corelib.Numbers.Cyclic.Int63.PrimInt63.mulc | 是 |
| diveucl | PrimInt63.diveucl | Corelib.Numbers.Cyclic.Int63.PrimInt63.diveucl | 是 |
| div21 | PrimInt63.div21 | Corelib.Numbers.Cyclic.Int63.PrimInt63.diveucl_21 | 是 |
| fabs | PrimFloat.abs | Corelib.Floats.PrimFloat.abs | 是 |
| fopp | PrimFloat.opp | Corelib.Floats.PrimFloat.opp | 是 |
| fadd | PrimFloat.add | Corelib.Floats.PrimFloat.add | 是 |
| fsub | PrimFloat.sub | Corelib.Floats.PrimFloat.sub | 是 |
| fmul | PrimFloat.mul | Corelib.Floats.PrimFloat.mul | 是 |
| fdiv | PrimFloat.div | Corelib.Floats.PrimFloat.div | 是 |
| fsqrt | PrimFloat.sqrt | Corelib.Floats.PrimFloat.sqrt | 是 |
| float_of_int | PrimFloat.ofUint63 | Corelib.Floats.PrimFloat.of_uint63 | 是 |
| normfr_mantissa | PrimFloat.normfrMantissa | Corelib.Floats.PrimFloat.normfr_mantissa | 是 |
| ldshiftexp | PrimFloat.ldshiftexp | Corelib.Floats.PrimFloat.ldshiftexp | 是 |
| next_up | PrimFloat.nextUp | Corelib.Floats.PrimFloat.next_up | 是 |
| next_down | PrimFloat.nextDown | Corelib.Floats.PrimFloat.next_down | 是 |
| feq | PrimFloat.eqb | Corelib.Floats.PrimFloat.eqb | 是 |
| fequal | PrimFloat.equal | Corelib.Floats.PrimFloat.Leibniz.eqb | 是 |
| flt | PrimFloat.ltb | Corelib.Floats.PrimFloat.ltb | 是 |
| fle | PrimFloat.leb | Corelib.Floats.PrimFloat.leb | 是 |
| fcompare | PrimFloat.compare | Corelib.Floats.PrimFloat.compare | 是 |
| fclassify | PrimFloat.classify | Corelib.Floats.PrimFloat.classify | 是 |
| frshiftexp | PrimFloat.frshiftexp | Corelib.Floats.PrimFloat.frshiftexp | 是 |

**充分性验证与运行**

- [规则配置](used-rules-validation/RULES.json)：逐项启用 ID、原语表和已验证实现；没有未列出的“固定核心”选项。
- [逐项机器可读清单](used-rules-validation/ITEMS.json)：每行的作用、证据状态及实现位置。
- [完整验证](used-rules-validation/VALIDATION.json)与[逐模块结果](used-rules-validation/modules.json)：本次重新导出、翻译和三个独立检查的结果。
- [既有逐项使用统计](../experiments/mechanical-nat-eq-20261019/results/RULE_USAGE.json)：使用证据的原始名单；未知调用数仍为未知。

这是一套经验证的保守充分集合，尚不声称“只有实际命中的规则”或“最小规则集合”。
验证绑定完整逐项配置及实现，当前提供整套已验证配置；修改或删减配置后，不能沿用本次 PASS，需要重新验证。

仓库根运行：

    python3 scripts/used_translation_rules.py --check
    python3 scripts/translate_corelib_rules.py --input /path/source.ndjson --out /path/output

运行入口核对规则配置及实现后调用原翻译器；独立 consumer 和 audit 仍属于完整验收。源 IR、contract 和公开接口保护策略与原流程相同。
编译文件、完整导出及运行日志保留远程 .work/used-rules-20261019/；Git/Mac 保存本表、配置、验证摘要和脚本。

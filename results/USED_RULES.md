# 当前 Corelib 翻译中有使用证据的规则

当前共 **44 个有使用证据的翻译／宇宙处理条目 = 34 个原有条目 + 10 个实测 M 类条目**。另列 **4 个原语类型映射、61 个原语操作映射**；映射实例与机制条目粒度不同，分别统计。

范围：当前 Corelib 清单的 **67 个模块、2180 个去重根声明**。原有条目依据机械 nat／eq 基线 mechanical-nat-eq-20261019/full-v1 的导出产物、最终译文与报告；M 类依据 used-rule-coverage-20261019 的成功路径记录及同范围重跑。重跑目标声明与原基线一致。本文件不汇总历史运行的命中，也不包含后续 correspondence 证明规则。

源 nat、eq 均生成独立的机械归纳类型，计入 T07；没有启用将这两个根直接替换为 Lean Nat、Eq 的旧 T06 bootstrap。

**如何读数量和证据**

本表只纳入能由当前产物或最终保留路径确认的条目。规则有实现、开关打开、源端出现某种语法，或失败尝试曾经过某分支，都不能单独算作使用证据。

| 计数列 | 单位与含义 |
|---|---|
| 主表示根数 | 检查每个根的主译文；符合该行证据条件的根按源名称去重。 |
| 含 quality 分支根数 | 同时检查主译文和该根的 quality 分支；任一表示命中即计该根一次。 |
| M 直接根数 | 本次保留记录归属到请求根本身的声明数；不把仅在其依赖中命中的规则归给该根。 |
| M 全部声明数 | 本次保留记录涉及的全部源声明，含根、依赖和辅助声明；跨模块重复出现按名称去重。 |
| 映射根数 | 该原语映射涉及的去重源根；已检查这些根自身的目标 AST。 |

这些列均不是执行调用次数，也不是成功率。同一声明可命中多条规则，各行不能相加。M 的“全部声明数”与“含 quality 分支根数”统计对象不同，不能互换。M 原始 JSON 另有含重复依赖的保留事件数，本文没有把它当作独立声明数或尝试总次数。

| 证据类别 | 具体检查了什么 |
|---|---|
| 产物结构 | 在最终通过检查的目标 AST 中找到变量、绑定结构、引用或 Sort 等对应结构。 |
| 导出产物 | 导出 IR 已实际产生具名 obligation，且对应根译文通过检查；不只是源端有证明语法。 |
| 结果报告字段 | 最终接受结果有对应字段和值，例如实际展开名称、层级解或提升信息；逐行说明判断条件。 |
| 分支核对 | 源 quality 家族成员数与全部已通过检查的译文分支一致。 |
| 成功路径记录 | M 转换实际生效，且其记录留在最终接受环境中；被回滚或返回失败状态的尝试不计。 |
| 原语目标引用 | 映射根自身的最终 AST 实际引用指定目标表示或操作。 |

**翻译、导出与宇宙处理：34 项**

保留原编号便于追溯；编号不连续表示其他目录项没有列入本次已确认清单。U06 等条目属于接受条件检查，因此这里使用“处理条目”，不把所有条目都称作语义改写。

| 原编号 | 规则／机制 | 实际作用 | 主表示根数 | 含 quality 分支根数 | 证据类别及判断条件 | 命中实例 |
|---|---|---|---:|---:|---|---|
| C-整体 | 透明 δβ 展开 | 按源可转换性展开透明定义；未归因到各别名子机制。 | 156 | 156 | 结果报告字段：最终 delta_inlined 列出实际展开的名称。 | Corelib.Classes.CMorphisms.Normalizes |
| C06 | 已知构造器驱动计算 | 限定单 fix、已知递减构造器的 βδιζ 计算；有界执行，不任意展开 opaque／deferred guard 正文。 | 8 | 8 | 结果报告字段：最终 source_computed 非空／非零。 | Corelib.Classes.Morphisms.PartialOrder_proper |
| E03 | 普通定理／公理的 statement 模式 | 翻译命题为 Prop 的定义，不把原公理变成 Lean axiom，也不默认搬运普通定理证明。 | 1029 | 1029 | 结果报告字段：最终 target_kind=statement | Corelib.Array.ArrayAxioms.array_ext |
| E04 | 嵌入证明抽取 | 证明片段抽成具名 obligation；只确认抽取结果，不声称已证明这些条件。 | 244 | 244 | 导出产物：导出 IR 已产生具名 obligations，且对应根译文检查通过。 | Corelib.Classes.CMorphisms.PartialOrder_StrictOrder |
| E08 | 透明计算定义 | 源定义的类型及正文均翻译，注册为 Lean def。 | 934 | 934 | 结果报告字段：最终 target_kind=def | Corelib.Array.PrimArray.array |
| E09 | 不透明数据定义 | opaque_data 的准备后正文仍检查并注册为 Lean opaque，保持不透明性。 | 107 | 107 | 结果报告字段：最终 target_kind=opaque | Corelib.Classes.CMorphisms.PER_type_morphism_obligation_1 |
| E12 | 显式前提参数 | 译文保留尚未装配的证明参数；不据此统计条件合并或删除。 | 331 | 331 | 结果报告字段：最终 pending_hypotheses 非空。 | Corelib.Classes.CMorphisms.PartialOrder_StrictOrder |
| L01 | Rule P：命题载荷提升 | 用可容纳 Prop 的 PULift 包装命题／证明载荷，使其达到所声明的 Type 表示。 | 1 | 1 | 结果报告字段：最终 prop_lift 给出提升深度（深度 0 也有效）。 | Corelib.Classes.CRelationClasses.complement |
| L02 | Prop up／down | 在实参、结果和 cast 位置按需求使用构造／投影；保持 let 和 cast 的声明上界。 | 2 | 2 | 结果报告字段：最终 prop_lift_coercions 非空／非零。 | Corelib.Classes.CRelationClasses.Asymmetric |
| L03 | Type up／down | 对受支持的较低 Type 载荷用 PULift 达到公开上界，保留所需公开参数。 | 46 | 53 | 结果报告字段：最终 type_lift 给出深度，或 type_lift_coercions > 0；不拆分内部转换路径。 | Corelib.Classes.CMorphisms.Normalizes |
| Q02 | 模板 Sort 参数 | 固定 Prop／Type 模板可生成 Sort 参数，固定 Type 的最低层级要求仍保留；失败时可回退旧 Type 路径。 | 22 | 22 | 结果报告字段：最终 template_sort 非空／非零。 | Corelib.Classes.Morphisms.Params |
| Q03 | 共享 quality 模板族 | 限定的单体、非递归、均匀无索引模板族生成 Prop／Type 两种表示，全部检查后才接受。 | 5 | 5 | 结果报告字段：最终 quality_prop 非空／非零。最终产物包含 quality_prop 分支。 | Corelib.Init.Datatypes.prod |
| Q05 | 原生有限 quality family | 对受支持的无约束 quality 变量覆盖 SProp／Prop／Type 的全部 3^q 组合；本次 23 根对应 603 个分支实例。 | 23 | 23 | 分支核对：除源 quality_family 元数据外，已核对全部分支的数量及成功状态；同根只计一次。 | Corelib.Init.Equality.Has_J |
| T01 | 变量和绑定 | rel 映射为对应绑定变量，保持作用域和 de Bruijn 对应。 | 1982 | 1982 | 产物结构：最终 AST 存在 bvar。 | Corelib.Array.ArrayAxioms.array_ext |
| T02 | Π、λ、let、应用 | 分别生成 forall、lambda、let 和 application；保留类型注解并进行类型检查。 | 2155 | 2155 | 产物结构：最终 AST 存在 forall / lam / let / app；此处作为一个结构类，不拆分次数。 | Corelib.Array.ArrayAxioms.array_ext |
| T03 | 常量、归纳类型与构造器引用 | 引用已注册目标，并附对应的宇宙实例；不按名字相似程度猜测对应。 | 2090 | 2097 | 产物结构：最终 AST 有常量引用，含辅助声明。 | Corelib.Array.ArrayAxioms.array_ext |
| T07 | 普通单体归纳块 | 保留参数、索引、构造器顺序；通过 Lean 内核的归纳声明检查。 | 110 | 110 | 结果报告字段：最终 target_kind=inductive | Corelib.Init.Datatypes.nat；Corelib.Init.Logic.eq |
| T10 | T：非递归 coinductive | 符合条件的非递归单体 coinductive 转为普通 inductive；递归 cofix 不因此获得支持。 | 4 | 4 | 结果报告字段：最终 coinductive_as_inductive 非空／非零。 | Corelib.Classes.CMorphisms.apply_subrelation |
| U02 | R1：基础 sort 映射 | Prop 映射 Sort 0；一般 Type(l+n) 映射 Sort(I(l)+n+1)，max 分量逐项解释；R8 是特定例外。 | 1782 | 1782 | 产物结构：最终 AST 存在 Sort；只确认 sort 表示，不将此数归给每一种 sort 子规则。 | Corelib.Array.ArrayAxioms.array_ext |
| U03 | R2／R2T：宇宙参数化 | 将常量接口以及归纳块 arity／构造器中的相应全局层级参数化。 | 1031 | 1031 | 结果报告字段：最终公开参数出现 u_ 层级。 | Corelib.BinNums.PosDef.Pos.iter |
| U04 | R2S：公开层级求解 | 自己的层级先作 metavariable，经类型统一后检查原生约束；自由的公开层级泛化。 | 129 | 129 | 结果报告字段：最终 solved_levels 非空／非零。记录具体层级解；公开与正文局部求解不再细分。 | Corelib.Classes.Equivalence.equiv |
| U06 | R3：引用一致性与不抬高 | 共享层级复用或受检查地重新实例化；所有引用实例必须满足源界限与一致性要求。 | 867 | 867 | 结果报告字段：最终 universe_checks 非空／非零。记录已执行的引用宇宙检查；这是接受条件，不是改写。 | Corelib.BinNums.IntDef.Z.pow_pos |
| U07 | R3′／R3″：残留实例 | 未解层级不能当通配符；一般化及默认零均有适用条件与后续检查。 | 1 | 1 | 结果报告字段：最终 universe_residuals 非空／非零。只确认 residual 实例处理，不把两个历史命名子规则分别计数。 | Corelib.ssr.ssrbool.all_sig_cond_dep |
| U09 | R5／R5S：模板层级 | 模板层级依原生模板绑定及实参类型实例化；非模板附加层级由构造器等约束求解。 | 27 | 27 | 结果报告字段：最终 template 非空／非零。只计模板块本身，不计下游每次实例化。 | Corelib.Classes.Morphisms.Params |
| U10 | R6：显式多态常量 | 保留原显式宇宙参数和每次引用的原实例；不能静默丢弃约束。 | 194 | 194 | 结果报告字段：最终声明有显式多态宇宙参数。 | Corelib.Array.ArrayAxioms.array_ext |
| U11 | 多态归纳块 | 同样保留显式宇宙参数及实例；源码／文档的 R6-I 标记存在重用，须结合机制阅读。 | 6 | 6 | 结果报告字段：最终声明有显式多态宇宙参数。 | Corelib.Classes.CMorphisms.Params |
| U13 | R2F／R2F-c：约束解释 | 以 max(u_l, 下界的解释+偏移) 表示层级，使受支持的约束对解释后的参数成立。 | 1 | 1 | 结果报告字段：最终 level_interp 非空／非零。 | Corelib.Classes.RelationClasses.unary_predicate |
| U15 | R3G：隐含层级发现 | 由实际引用的自由层级类发现必要的公开参数；保留引用证据，去掉未使用的发现项。 | 227 | 227 | 结果报告字段：最终 implicit_levels 非空／非零。 | Corelib.Classes.Equivalence.equiv |
| U17 | R8：Sort 化 | 仅在限定 arity／motive 等位置，将 Type 层级改作可含 Prop 的 Sort 参数；跨引用处理相应 +1 偏移。 | 598 | 598 | 结果报告字段：最终 admitting_levels 非空／非零。 | Corelib.BinNums.PosDef.Pos.iter |
| U19 | R-CARRIER P2 | 对类型中确实独立的隐含操作数层级类生成独立副本；类型统一要求相同的类不拆开。 | 66 | 66 | 结果报告字段：最终 level_copies 非空／非零。 | Corelib.ssr.ssrbool.canLR_in |
| U29 | R2B-P | 受限 Prop 相关局部解释需源端 CheckInstance；当前 statement 路径拒绝这类特殊化，不能用于缩窄定理。 | 1 | 1 | 结果报告字段：最终 r2bp_levels 非空／非零。 | Corelib.ssr.ssreflect_rw.nary_congruence_statement |
| U30 | R2B-S | 只允许符合条件的结果 sort 降低，不能降低 binder 层级；受保护接口及 statement 检查约束。 | 1 | 1 | 结果报告字段：最终 sort_lowered_levels 非空／非零。 | Corelib.Init.Datatypes.CompSpecT |
| U31 | R2B-V | 从 Type-valued 正文继承实际结果 sort，仅限结果位置；不改公开 binder，不从 Prop 任意扩展。 | 1 | 1 | 结果报告字段：最终 result_sort_inherited 非空／非零。记录最终采用结果 sort 继承。 | Corelib.Init.Datatypes.CompSpecT |
| U32 | 局部多态约束解释／polyUniverseInterpretation | 对受支持的带偏移约束闭包生成 max 解释，保留原显式参数及源允许实例；不接受正环等不支持情形。 | 26 | 33 | 结果报告字段：最终 poly_level_interp 非空／非零。 | Corelib.Classes.CMorphisms.Normalizes |

**匹配与递归转换：10 项 M 规则**

以下每项都有独立的成功路径记录。记录随环境 saveState／restore 回滚；重试正常返回失败状态时也会清除该次记录。只进入转换函数、产生后又被丢弃的候选结果不计入。

| 编号 | 规则 | 实际作用 | 直接根数 | 全部声明数（含依赖／辅助声明） | 命中实例 |
|---|---|---|---:|---:|---|
| M01 | M3b：依赖 match | 用真实 Lean recursor；由源 predicate 构造 motive，并按内核字段和 IH 布置分支。 | 439 | 492 | Corelib.Array.ArrayAxioms.length_make |
| M02 | 非均匀 match | 受限非均匀参数片段使用 convoy／Eq.rec；已知构造器的 match 优先做 ι 归约。 | 8 | 9 | Corelib.Init.Wf.Fix_F |
| M03 | 单函数结构递归 | 递减参数改写为 recursor；递减参数之后的实参可变化。 | 89 | 90 | Corelib.BinNums.IntDef.Z.pos_div_eucl |
| M04 | 变化前置参数泛化 | 在保留参数的类型不依赖其变化的条件下，将变化的前置参数移入 motive。 | 11 | 11 | Corelib.BinNums.IntDef.Z.pos_sub |
| M05 | 索引与函数递归字段 | 泛化索引；函数形递归字段产生带相应参数的归纳假设。 | 5 | 5 | Corelib.Init.Wf.Acc_rec |
| M06 | ι 泛化递归 | 外层 match 不在递减参数上时，对整个函数体代入递减构造器再归约；不任意重排 match。 | 10 | 10 | Corelib.BinNums.IntDef.Z.pos_sub |
| M07 | 结构互递归 | 对同一归纳类型、相同递减位置及兼容前置类型的函数，构造联合 PProd 递归结果再投影。 | 8 | 8 | Corelib.BinNums.PosDef.Pos.add |
| M09 | Course-of-values | 特定非直接递归字段调用失败后，用 below／PProd 缓存；受索引、非均匀和嵌套形状限制。 | 3 | 3 | Corelib.BinNums.PosDef.Pos.sqrtrem |
| M11 | 显式良基回退 | statement 模式下可用 Acc.rec，并把未解决的良基性／展开等式证明列为显式任务。 | 1 | 1 | Corelib.Init.Nat.gcd |
| M12 | 构造器形索引 | 支持限定的非递归单构造器记录索引，以字段投影恢复不同的早期实参；拒绝重复叶子等不支持形状。 | 1 | 1 | Corelib.Init.Wf.Fix_F_2 |

各行的全部命中名称见 [M 类逐项统计](../experiments/used-rule-coverage-20261019/M_RULE_USAGE.json)。M11 的显式良基回退仍可能引入待证明条件；命中不表示良基性证明已完成。

**原语类型映射：4 项**

证据类别为“原语目标引用”：已检查映射根自身的最终 AST。这里列的是 Rocq 原语的表示选择；机械 nat、eq 不属于这四项原语映射。

| 源类型根 | 目标表示 | 映射根数 |
|---|---|---:|
| Corelib.Array.PrimArray.array | Rocq2Lean.PrimArray.Rep | 1 |
| Corelib.Floats.PrimFloat.float | Rocq2Lean.PrimFloat.Rep | 1 |
| Corelib.Numbers.Cyclic.Int63.PrimInt63.int | BitVec | 1 |
| Corelib.Strings.PrimString.string | Rocq2Lean.PrimString.Rep | 1 |

**原语操作映射：61 项**

证据类别同为“原语目标引用”：下列源根自身实际引用指定 Lean 目标。每个操作单独列出，不重复加入原语家族汇总项。目标可以是 Rocq2Lean 适配实现；此证据不等于已证明该操作与 Lean／Mathlib 现成运算的 correspondence。

| 源操作标识 | Lean 目标 | 映射根数 | 源声明 |
|---|---|---:|---|
| add | BitVec.add | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.add |
| sub | BitVec.sub | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.sub |
| mul | BitVec.mul | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.mul |
| div | PrimInt63.udiv | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.div |
| rem | PrimInt63.umod | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.mod |
| l_and | PrimInt63.land | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.land |
| l_or | PrimInt63.lor | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.lor |
| l_xor | PrimInt63.lxor | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.lxor |
| divs | PrimInt63.sdiv | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.divs |
| rems | PrimInt63.smod | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.mods |
| l_sl | PrimInt63.lsl | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.lsl |
| l_sr | PrimInt63.lsr | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr |
| a_sr | PrimInt63.asr | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.asr |
| head0 | PrimInt63.head0 | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.head0 |
| tail0 | PrimInt63.tail0 | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.tail0 |
| addMulDiv | PrimInt63.addmuldiv | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.addmuldiv |
| eq | PrimInt63.eqb | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.eqb |
| lt | PrimInt63.ltb | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb |
| le | PrimInt63.leb | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.leb |
| lts | PrimInt63.ltsb | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.ltsb |
| les | PrimInt63.lesb | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.lesb |
| arraymake | PrimArray.make | 1 | Corelib.Array.PrimArray.make |
| arrayget | PrimArray.get | 1 | Corelib.Array.PrimArray.get |
| arrayset | PrimArray.set | 1 | Corelib.Array.PrimArray.set |
| arraylength | PrimArray.length | 1 | Corelib.Array.PrimArray.length |
| arraydefault | PrimArray.default | 1 | Corelib.Array.PrimArray.default |
| arraycopy | PrimArray.copy | 1 | Corelib.Array.PrimArray.copy |
| string_make | PrimString.make | 1 | Corelib.Strings.PrimString.make |
| string_length | PrimString.length | 1 | Corelib.Strings.PrimString.length |
| string_get | PrimString.get | 1 | Corelib.Strings.PrimString.get |
| string_sub | PrimString.sub | 1 | Corelib.Strings.PrimString.sub |
| string_cat | PrimString.cat | 1 | Corelib.Strings.PrimString.cat |
| string_compare | PrimString.compare | 1 | Corelib.Strings.PrimString.compare |
| compare | PrimInt63.compare | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.compare |
| compares | PrimInt63.compares | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.compares |
| addc | PrimInt63.addc | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.addc |
| addCarryC | PrimInt63.addcarryc | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.addcarryc |
| subc | PrimInt63.subc | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.subc |
| subCarryC | PrimInt63.subcarryc | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.subcarryc |
| mulc | PrimInt63.mulc | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.mulc |
| diveucl | PrimInt63.diveucl | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.diveucl |
| div21 | PrimInt63.div21 | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.diveucl_21 |
| fabs | PrimFloat.abs | 1 | Corelib.Floats.PrimFloat.abs |
| fopp | PrimFloat.opp | 1 | Corelib.Floats.PrimFloat.opp |
| fadd | PrimFloat.add | 1 | Corelib.Floats.PrimFloat.add |
| fsub | PrimFloat.sub | 1 | Corelib.Floats.PrimFloat.sub |
| fmul | PrimFloat.mul | 1 | Corelib.Floats.PrimFloat.mul |
| fdiv | PrimFloat.div | 1 | Corelib.Floats.PrimFloat.div |
| fsqrt | PrimFloat.sqrt | 1 | Corelib.Floats.PrimFloat.sqrt |
| float_of_int | PrimFloat.ofUint63 | 1 | Corelib.Floats.PrimFloat.of_uint63 |
| normfr_mantissa | PrimFloat.normfrMantissa | 1 | Corelib.Floats.PrimFloat.normfr_mantissa |
| ldshiftexp | PrimFloat.ldshiftexp | 1 | Corelib.Floats.PrimFloat.ldshiftexp |
| next_up | PrimFloat.nextUp | 1 | Corelib.Floats.PrimFloat.next_up |
| next_down | PrimFloat.nextDown | 1 | Corelib.Floats.PrimFloat.next_down |
| feq | PrimFloat.eqb | 1 | Corelib.Floats.PrimFloat.eqb |
| fequal | PrimFloat.equal | 1 | Corelib.Floats.PrimFloat.Leibniz.eqb |
| flt | PrimFloat.ltb | 1 | Corelib.Floats.PrimFloat.ltb |
| fle | PrimFloat.leb | 1 | Corelib.Floats.PrimFloat.leb |
| fcompare | PrimFloat.compare | 1 | Corelib.Floats.PrimFloat.compare |
| fclassify | PrimFloat.classify | 1 | Corelib.Floats.PrimFloat.classify |
| frshiftexp | PrimFloat.frshiftexp | 1 | Corelib.Floats.PrimFloat.frshiftexp |

**全库验证结果与清单的适用范围**

同范围重跑覆盖 67 个模块，其中 51 个含请求根，16 个在此层面没有请求根。2180 个根的结果如下；有请求根的模块均通过源端 roundtrip、独立 Lean consumer 和结构 audit。

| 最终状态 | 根数 | 通过检查意味着什么 |
|---|---:|---|
| TRANSLATED_AND_CHECKED | 1003 | 译文通过检查，未携带待装配证明前提。 |
| STATEMENT_KERNEL_CHECKED | 846 | 定理等声明的陈述通过内核检查，未携带待装配证明前提；不表示源证明已翻译。 |
| PENDING_KERNEL_CHECKED | 148 | 带显式证明前提的译文通过检查；这些前提尚待证明或装配。 |
| STATEMENT_PENDING_KERNEL_CHECKED | 183 | 带显式证明前提的陈述通过内核检查；源证明及前提不能据此视为已完成。 |

合计 2180 根；受阻 0，验证失败 0。其中 331 根带显式待证明前提。

M 测量中的零命中项 M08、M10、M13 未收入上面的使用清单；已关闭这些路径并完成同范围重跑，目标类型、正文、构造器、宇宙与前提保持不变。[禁用重跑记录](../experiments/used-rule-coverage-20261019/M_PRUNING_VALIDATION.json) 保存逐模块结果。

这支持当前配置完成上述 Corelib 范围的机械翻译，及这 3 条 M 路径在本范围可以禁用。**44 是当前证据粒度下的清单条目数，不是已证明最小且穷尽所有实现分支的规则数。**原有 C-整体、L03、U04 等仍合并了内部子机制；非 M 路径尚未逐项关闭验证。未列出的非 M 子机制不能据此判为未使用，完整合并口径见 [非 M 范围说明](../experiments/used-rule-coverage-20261019/NON_M_SCOPE.md)。

**证据文件与复现**

| 文件 | 内容与用途 |
|---|---|
| [逐根产物证据](../experiments/mechanical-nat-eq-20261019/results/rule-usage-evidence.json) | source、primary、variants 及检查结果；用于原有条目的筛选。 |
| [原有条目的命中名单](../experiments/mechanical-nat-eq-20261019/results/RULE_USAGE.json) | 原编号的 names／family_names；C-整体直接筛选 delta_inlined。 |
| [M 成功路径统计](../experiments/used-rule-coverage-20261019/M_RULE_USAGE.json) | 每条 M 规则的根名单、全部声明名单和保留事件数。 |
| [M 禁用后的全库验证](../experiments/used-rule-coverage-20261019/M_PRUNING_VALIDATION.json) | 同范围重跑、逐模块检查、状态计数和目标不变结果。 |
| [记录可靠性测试](../experiments/used-rule-coverage-20261019/INSTRUMENTATION_TESTS.json) | 验证接受路径保留记录、禁用路径拒绝、回滚和正常返回失败均不留下命中。 |
| [完整规则目录](../experiments/mechanical-nat-eq-20261019/results/ALL_RULES.md) | 追溯历史编号与规则说明；目录成员不自动视为本次已使用。 |
| [本文生成脚本](../scripts/used_translation_rules.py) | 从上述证据生成全文，核对名单、计数、成功状态、原语引用及 M 验证的一致性。 |

在仓库根生成或检查本文：

    python3 scripts/used_translation_rules.py
    python3 scripts/used_translation_rules.py --check

上述命令读取已保存证据，不重新编译或翻译 Corelib。完整测量、编译和重跑步骤见 [M 工作区说明](../experiments/used-rule-coverage-20261019/README.md)。原始导出、编译文件及日志保留在远程 .work/used-rule-coverage-20261019/，不提交到 Git。

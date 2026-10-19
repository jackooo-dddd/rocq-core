# Correspondence 第二十八至三十一批

本轮在原有 1526 个完成根上新增 **71 个去重根、72 份覆盖证书**，达到 **1597 / 2180**。额外的一份证书是 Pos.iter 的载体转换版本，不重复计根。机械翻译产物及 nat/eq 的独立归纳结构保持原样。

| 批次 | 新增根 | 新增证书 | 内容 |
|---|---:|---:|---|
| 28 | 20 | 20 | SSR：2 个索引类型，18 个分支、反射、限制域谓词及包装操作 |
| 29 | 6 | 7 | Pos.iter、Z.pow_pos、Z.pow、Z.even、Z.shiftl、Z.shiftr |
| 30 | 7 | 7 | Init.Sumbool 全模块：6 个运算、1 个原生陈述 iff，并证明原陈述 |
| 31 | 38 | 38 | CRelationClasses：18 个类型对应、20 个投影／组合操作 |

## 索引与不透明性

[SSRBoolIndexed.lean](proofs/SSRBoolIndexed.lean) 将 alt_spec、if_spec 对应到 PLift 包装的原生条件命题，分别保留布尔索引、分支证据和值索引。两种类型都有完整的往返证明。

altP、boolP、ifP、ifPn 的全部前置条件均用已有闭合证明实例化。对应目标由原生 Bool 独立构造；转换后输出属于单值类型，利用其单值性证明相等。没有展开原来的 opaque 函数，也没有给它们补假定的计算方程。

[SSRBoolRestrictions.lean](proofs/SSRBoolRestrictions.lean) 新增左右分支判断、10 个限制域／应用谓词、sumboolP 和成员包装转换。phantom 证明参数可以任意取，目标表达式忽略这些参数；mem_pred 经已证 memIso 转换成原生 Bool 谓词。is_inleft 保留 Sort 参数。

ssrbool 目前完成 440 / 451。剩余 11 项包括 5 个 opaque 数据选择函数、impliesP、clone_pred 和 4 个携带载体的 predType 包。五个条件根的前置证明已齐备，但仍未得到结果对应，不把它们算作已完成。

## 数值运算

[BinaryPower.lean](proofs/BinaryPower.lean) 证明二进制迭代与 Nat.rec 迭代一致，覆盖任意 Sort 载体。进一步给出转换函数的组合版本：必须显式提供步函数的对应证明。

- Z.pow_pos 对应 Int 的自然数指数幂。
- Z.pow 对应负指数返回零、非负指数计算自然数次幂的表达式。
- Z.even 对应整数模 2 等于零的 Bool 判定。
- Z.shiftl 对应正移位乘 2 的幂、负移位做整数除法。
- Z.shiftr 对应反向移位；负数除法采用 Lean 的欧几里得除法，对正的 2 的幂即向下取整。

四个具体例子也在该文件中通过 kernel：(-2)^(-3)=0、(-2)^3=-8、(-3) 右移 1 位=-2、3 左移 -1 位=1。这里的幂和移位均指机械 Rocq 运算经转换后的结果。

## Sumbool

[SumboolBridge.lean](proofs/SumboolBridge.lean) 证明了本模块全部 7 个根。12 个前置 obligation 给出闭合证明，4 个原带条件根完成对应。bool_eq_ind 既有原生陈述 iff，也有独立的原陈述证明。

sumbool_and、sumbool_or 对应 PSum 的分支组合，覆盖任意 A、B、C、D；不要求 B=¬A、D=¬C。bool_of_sumbool 的目标保留 Bool 标签及分支证明，不能仅丢掉证明返回 Bool。bool_eq_rec 的对应保持导出签名中的 Type-valued motive，不宣称已扩展成任意宇宙的消去器。

## Type 值关系

[CRelationData.lean](proofs/CRelationData.lean) 保留关系值中的数据及其函数操作。

PreOrder、PER、Equivalence 对应原生函数的乘积；iffT 对应两个方向的函数，没有附加互逆条件，因此不等于 Lean Equiv。relation_conjunction、relation_disjunction 分别对应 Prod 和 Sum，并对原机械 PULift 的额外宇宙给出双向转换。

complement、Irreflexive、Asymmetric 的载荷本身只包含反证，证明其到原生命题的 Iso；这不等于将任意 Type 值关系压成 Prop。RewriteRelation 是无数据的逻辑标记，对应 True。

本模块当前 46 / 81 个根完成。带实际函数数据的 opaque 结果，不能只靠证明无关性建立计算对应；剩余条目继续按源码透明性及输出数据逐项处理。

## 验证

5 个新增 profile 的证明均编译并通过公理闭包检查，允许范围仅为 Lean 标准公理；没有新增公理或 sorry。每个指定原生目标的类型与定义体都递归检查 NativeBridge 辅助定义，不残留源端符号。

全部 88 个增量 profile 有匹配当前源码和依赖的成功记录；79 个覆盖 profile 的 1336 份覆盖证书共同导入通过。本轮重新编译新增证明及受影响依赖，并重新执行共同导入；没有重跑所有旧基线证明或 Corelib 机械翻译，也没有重跑旧 Mathlib 消费示例。

精确证书类型及公理依赖见 [证书报告](reports/CERTIFICATES.md)，逐根状态见 [覆盖账本](reports/CORELIB_LEDGER.csv)，共同导入见 [验证记录](reports/interop/all/import-all-validation.json)。编译缓存和探索脚本仅保存在远程 .work。

## 后续顺序

继续 P3/P4/P5/P6：优先复用 Type 值关系的类型桥接处理剩余陈述，再推进二进制位运算、除法与数字表示。对 opaque 函数区分可由输出类型唯一确定的结果，以及仍需计算等式的任意数据结果。当前剩余 583 根尚未达到完成类别，不能由未找到证明推断不存在对应。

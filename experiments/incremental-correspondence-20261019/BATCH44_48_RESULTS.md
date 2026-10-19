# 第四十四至四十八批：字节、机器整数、字节串与通用相等接口

本轮新增 **64 个去重根、64 份覆盖证书**，从 1731 推进到 **1795 / 2180**。这批不修改机械翻译器，不把机械 nat/eq 换成原生类型。

| 批次 | 新根 | 结果 |
|---|---:|---|
| 44：Byte | 9 | Init.Byte 10/10 |
| 45：WordOperations | 18 | PrimInt63 37/37，CarryType 1/1 |
| 46：PrimitiveStrings | 14 | PrimString 17/17 |
| 47：GenericEquality | 22 | Init.Equality 22/22 |
| 48：ArrayCapacity | 1 | PrimArray 8/8 |

“模块完成”沿用本项目的明示范围：类型双向逆、指定无源符号原生运算，或完整原生陈述 iff。原生组合表达式不冒充现成 API。

## Byte

[ByteOperations.lean](proofs/ByteOperations.lean) 将源八位机械 bool/prod 结构对应到八个原生 Bool，byte 对应 Fin 256。to_bits 的第一个分量是最低位。of_bits/to_bits 两个方向覆盖全部 256 种值，使用 kernel 检查的等式证明；不是抽样测试。

[ByteElimination.lean](proofs/ByteElimination.lean) 将 256 分支消去器对应到嵌套 Fin.cases，保留依赖 motive 和全部分支。rec/rect、ind/sind 分开记录；两个往返陈述和两个归纳陈述另有原陈述证明。生成器 [generate_byte_elimination.py](generate_byte_elimination.py) 保留完整生成方式。

## 63 位整数

[WordOperations.lean](proofs/WordOperations.lean) 对所有输入证明进位、借位、乘法高低半字、除法、移位、解析及计数的对应。

- head0 / tail0 分别等于 Lean **BitVec.clz / BitVec.ctz**；零的结果都是 63。证明使用 log2 刻画及首个置位位置，而不是有限样例。
- addc / addcarryc / subc / subcarryc 保留溢出或借位 Bool。
- divs / mods 对应 Int.tdiv / Int.tmod 后转回 BitVec 63；不宣称已经直接对应 BitVec.sdiv / srem。
- diveucl_21 保留 high < divisor 的限制；不满足时返回 (0,0)。
- addmuldiv 的互补移位量采用 63 位模减法；asr 保留负移位量的特殊分支。
- parser 保留符号，负零也拒绝。carry 的完整 Sort 参数对应 PProd Bool A。

八个边界例子随证明文件编译，包括最大值进位、零减一借位、零的前后导零数、负零解析和无效双字除法。

## 有界字节串

[PrimitiveStrings.lean](proofs/PrimitiveStrings.lean) 使用原生表示 Σ n : Fin 16777212, Vector (BitVec 8) n.val。保留任意字节和 NUL，不将其当成 Unicode String。

make 对应 Vector.replicate 加长度截断／字节取模；sub 和 cat 对应无源符号的向量切片与有界拼接。compare / eqb 对应原生向量上的字节字典序函数；**尚未证明它等于现成 List.compareLex**，证书据此标作 native_expression。

char63 保留完整 BitVec 63；parse 仅接受一个字节，print 仅接受小于 256 的值。NUL、256 的字节取模、超出结尾的空切片均有编译例子。

## 通用相等接口

[GenericEquality.lean](proofs/GenericEquality.lean) 的 7 个类型根对应原生依赖函数空间，15 个运算对应 id 或明确的原生函数组合。保留各源声明的 universe 参数及显式关系／消去函数参数。

这里的 Init.Equality 接口接受 Type 值任意关系，不能声称任意实例都是 Lean Eq。额外构造 PLift Eq 实例，实际证明源 ap / sym 在该实例上分别给出 congrArg / Eq.symm。PLift 是 correspondence 客户端中的显式适配，不是机械翻译规则或新的公理。

[ArrayCapacity.lean](proofs/ArrayCapacity.lean) 补齐数组最大长度 4194303 的精确对应。

## 检查与剩余工作

107 个 profile 有当前源码和依赖匹配的成功记录；98 个覆盖 profile、1539 份证书共同导入通过。统一打包包含 2057 个入口、15609 个依赖副本；副本不增加覆盖计数。公理闭包审计、原生目标递归源符号检查均通过。

当前分类：142 类型、743 运算、910 完整原生陈述；56 只有接口、110 部分陈述、190 尚无证书、29 条件根尚未完成。原陈述独立证明为 224。剩余 **385 根**；下一步处理良基递归陈述及其依赖。

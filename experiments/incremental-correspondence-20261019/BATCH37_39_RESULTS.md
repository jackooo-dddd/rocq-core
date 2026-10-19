# 第三十七至三十九批：二进制除法、平方根与迭代

新增 **13 个去重根、16 份覆盖证书**，当前 **1664 / 2180**：127 类型根、651 运算根、886 完整原生陈述。其余为 111 只有接口、134 部分陈述、233 尚无证书、38 条件对应未完成。

| 模块 | 完成 / 总数 |
|---|---:|
| BinNums.PosDef | 36 / 36 |
| BinNums.NatDef | 11 / 11 |
| BinNums.IntDef | 39 / 39 |

这三个运算模块共 86 根已全部有明示范围内的证书。另一个 Numbers.BinNums 模块有 15 根，当前只完成其 3 个类型根；它的递归消去器和归纳陈述是下一步，不包含在上述完成声明内。

## 第三十七批：除法 8 根

[BinaryDivision.lean](proofs/BinaryDivision.lean)

| 源声明 | 已证明的原生目标 |
|---|---|
| N.pos_div_eucl | 非零除数：Nat 的除法／余数；零除数：(2^log2(p)-1,p) |
| Z.pos_div_eucl | 正除数：Int ediv/emod；非正除数：显式 log2／幂表达式 |
| Z.quotrem | (Int.tdiv, Int.tmod) |
| Z.quot | Int.tdiv |
| Z.rem | Int.tmod |
| Z.div_eucl | (Int.fdiv, Int.fmod) |
| Z.div | Int.fdiv |
| Z.modulo | Int.fmod |

证明覆盖完整输入域，包括零除数。内部 Z.pos_div_eucl 对 b≤0 的结果为：
k = 2^log2(p)，结果 (2k-1, p-k-(k-1)b)。这是内部算法的实际行为，不把它声称为标准除法。

顶层 Z.div 向下取整，Z.quot 向零取整；例如 -7/3 分别得到 -3 和 -2，余数分别为 2 和 -1。8 个边界例子已编译。证明通过位递归不变量和原生商余数唯一性完成。

## 第三十八批：平方根 4 根

[BinarySqrtRem.lean](proofs/BinarySqrtRem.lean) 与 [BinaryPositiveSqrt.lean](proofs/BinaryPositiveSqrt.lean)

- Pos.sqrtrem_step：所有 mask 输入及任意两个高阶函数；函数对应假设显式保留，不限定成位构造器。
- Pos.sqrtrem：转换结果为 (Nat.sqrt n, some (n - Nat.sqrt n * Nat.sqrt n))。
- Pos.sqrt：转换结果等于 Nat.sqrt n。
- Z.sqrtrem：对 z.toNat 使用上述原生平方根；负数得到 (0,0)。

不变量为 n=s*s+r、s>0、r<2*s+1。结合 Nat.sqrt 的上下界证明唯一性。12345 得到根 111、余数 24 的例子，以及负数例子均通过 kernel 检查；另有直接使用 Nat.sqrt_le 的消费证明。

IntDef 导出闭包含 Pos.sqrtrem，但不含 Pos.sqrt 根。generate_positive_sqrt.py 在实际 PosDef 闭包中复用证明文本并独立检查；没有生成替代的 Rocq 声明。重复的辅助证明不增加根数。

## 第三十九批：高阶迭代 1 根、4 份证书

[BinaryIterOp.lean](proofs/BinaryIterOp.lean)

- 任意 Sort 载体和任意二元运算：对应以 Nat 为索引的二进制迭代，保留原括号顺序。
- 运算满足结合律时：对应 List.foldr op a (List.replicate (p-1) a)。
- Nat.add 实例：等于 p*a。
- Nat.mul 实例：等于 a^p。

线性 fold 的结合律假设不可删。已证明反例：op(a,b)=a+2b，重复四份 5 时，源二进制括号得到 45，线性 fold 得到 75。四份证书只计一个源根。

## 验证

97 个增量 profile 有当前成功记录。88 个覆盖 profile、1408 份证书共同导入通过；1893 个导出入口、13257 个依赖副本。副本和辅助定理不计源根。coimport_not_current_coverage=false。

全部新证明检查公理闭包及原生目标无源符号；无新增公理或未完成证明。机械 nat/eq 和原翻译产物保持不变。原陈述独立 Prop 证明数仍为 200，本批没有把运算等式混算为原陈述证明。

下一步：Numbers.BinNums 的 6 个依赖消去器与 6 个归纳陈述，再继续数值表示和其余可证明的透明定义。

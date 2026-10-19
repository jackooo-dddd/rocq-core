# 第七十一至七十五批：基础标记与符号浮点

新增 **50 个去重根、50 份证书**，1950 → **2000 / 2180**。SpecFloat 已完成 **38/55**；这里的目标是无源符号的精确符号表示和整数算法，不是 Lean 运行时 Float。

## 基础项：12 根

| Profile | 根数 | 对应 |
|---|---:|---|
| PreludeCoercions | 3 | 两个类型别名对应原类型；reverse_coercion 返回传入的第一个值 |
| UnconvertibleMarker | 2 | Unconvertible 对应 Unit；unconvertible 是恒等函数 |
| FixPrototype | 1 | fix_proto 对应 id，保留完整 Sort universe |
| DecisionTactics | 2 | decide_left/right 的原生 Decidable 分支消去陈述，并独立证明机械原陈述 |
| DefaultRelationMarker | 3 | DefaultRelation 是 True 标记；default_relation 返回原关系；equivalence_default 原陈述独立证明 |
| SSRSetoidCompatibility | 1 | 两套 Reflexive 都表示 ∀ x, R x x；兼容陈述及原证明 |

Unconvertible 不是 a ≠ b 的证明。DefaultRelation 本身没有装入等价关系证明；它是一个无字段标记。保留定义的实际含义，不按名称增加性质。

## 符号浮点：38 根

[SpecFloatRepresentation.lean](proofs/SpecFloatRepresentation.lean) 的 14 根：

- spec_float 双向对应 SpecValue：带符号零、带符号无穷、单个 NaN，以及 Bool × 正 Nat 有效数字 × Int 指数的有限值。
- location 对应 Option Ordering；shr_record 对应 Int × Bool × Bool，后两位是舍入位和 sticky 位。
- 绝对值、取负、三项投影、location/shift 状态转换，以及四项 location 消去/归纳声明。
- 保留所有源结构，包括不满足 valid_binary 的有限值；不先过滤无效输入。

[SpecFloatRounding.lean](proofs/SpecFloatRounding.lean) 的 12 根：

- cond_Zopp、emin、fexp：条件取负、3−emax−prec、max(e−prec, emin)。
- digits2_pos、Zdigits2：正数的 log2+1；整数零为 0，非零按绝对值计算。
- canonical_mantissa、bounded、valid_binary：显式原生 Bool 判定。
- round_nearest_even：低于半单位不加一，高于半单位加一，恰好一半时按整数奇偶决定。
- new_location_even/odd/new_location：以原生 Int 比较构造准确的舍入位置。

[SpecFloatShift.lean](proofs/SpecFloatShift.lean) 的 5 根：

- iter_pos 对应 Nat 次函数迭代，保留任意 Sort。
- shr_1 使用 Int.tdiv 2，即向零取整；新舍入位取绝对值的低位，新 sticky 位是旧两位之 OR。
- shr 对正移位量迭代并增加指数；零或负移位量保持输入。
- shr_fexp 组合已经证明的位数、指数和移位转换。
- shl_align 对更小目标指数用 2 的幂放大有效数字；其他情况保持原值和指数。

[SpecFloatNormalize.lean](proofs/SpecFloatNormalize.lean) 的 7 根：

- binary_round_aux 连接两次指数移位及中间的最近偶数舍入，保留零、有限值、溢出无穷和负结果 NaN 分支。
- binary_round 先对齐再舍入；binary_normalize 对整数符号分支并保留零的指定符号。
- SFone、SFldexp、SFnormfr_mantissa、SFclassify 通过上述对应组合。分类使用已经桥接的 Fin 9 编码，顺序为正/负正规数、正/负非正规数、正/负零、正/负无穷、NaN。

[SpecFloatArithmeticSupport.lean](proofs/SpecFloatArithmeticSupport.lean) 只提供本源闭包重新检查的二进制整数证明，不增加覆盖数。表示别名用 abbrev，保持定义相等，也避免后续组合证明的类型透明度障碍。

## 统计和检查

161 类型根、835 运算根、1004 完全原生陈述，共 **2000**。剩余 **180**：132 尚无证书、24 部分陈述、7 仅接口、17 条件根。独立原陈述证明共 318。

145 个 profile 验证通过；130 个覆盖 profile / 1748 份增量证书共同导入，2372 个入口、21186 个复制声明。所有新目标递归检查无源符号，证明公理闭包通过检查；没有新增公理。

还有 17 项 SpecFloat 运算未完成，主要为比较、加减乘除、开方、相邻浮点值及 frexp/ulp 等；PrimFloat 和 FloatAxioms 的整体对应尚未完成。CMorphisms 的许多剩余项是 opaque 的 Type 值计算，不能仅根据签名证明它们等于某个新写的算法。下一步继续符号浮点运算，并保留此区别。

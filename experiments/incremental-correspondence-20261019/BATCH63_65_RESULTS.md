# 第六十三至六十五批：机器整数规格完成

新增 **10 个去重根、13 份覆盖证书**，1917 → **1927 / 2180**。Uint63Axioms **48/48**、Sint63Axioms **8/8** 均完成明示范围内的对应。

## 无符号宽运算

[Uint63WideSpecs.lean](proofs/Uint63WideSpecs.lean) 完成最后两项：

- mulc_spec：高字乘 2^63 加低字，精确重建完整乘积。先证明商小于 2^63，保证高字没有截断信息。
- diveucl_21_spec：保留 hi < divisor 的原始前提，证明双字被除数的商和余数均能装入 63 位，并独立构造源端两个 Z 相等证明。原生命题用“再次模 2^63 不改变商／余数”表述这两个范围条件。

源返回值使用机械 product、Z 和 Eq；证明没有把这些直接替换成原生类型。数值转换通过之前的明确等式组合。最终文件不足一秒通过单独检查；对已证明源定理使用显式 @ 引用，避免隐式参数搜索展开其计算密集的陈述。

## 有符号整数

[Sint63Operations.lean](proofs/Sint63Operations.lean) 的 5 根：

- min_int 对应 BitVec.ofNat 63 (2^62)，其有符号整数值为 -2^62。
- to_Z 等于 BitVec.toInt，完整覆盖正、零、负区间。
- compare_spec、ltb_spec、leb_spec 对应 Int 的比较／顺序；原陈述也独立证明。

[Sint63Specs.lean](proofs/Sint63Specs.lean) 的 3 根：

- div_spec：保留 x ≠ min_int 或 y ≠ -1 的溢出排除条件；结果等于 Int.tdiv。
- mod_spec：无额外条件，结果等于 Int.tmod，包括零除数。
- asr_spec：负的有符号移位量返回零；其他情况等于原生 sshiftRight。原实现把非负移位量截到 63，已证明这不改变结果。源 Z.pow 的负指数分支为零，因此保留了源规格的完整行为。

三份额外运算证书覆盖已经计数的 PrimInt63.divs、mods、asr：前两个直接等于 Lean 现成 BitVec.sdiv／srem，后者等于带负计数分支的原生组合函数。不重复计根。

Sint63UnsignedSupport、Sint63ArithmeticSupport、Sint63QuotientSupport 它们只提供重新检查的依赖，不增加覆盖根。N 的除法与 Z 的向零取整路径在 Sint63 源闭包重新验证，区别于 Uint63 使用的向下取整路径。

## 总量与验证

154 类型根、795 运算根、978 完整原生陈述，共 1927。剩余 25 仅接口、50 部分陈述、161 尚无证书、17 条件根，共 253。独立原陈述证明共 292。

128 个增量 profile 当前验证通过；115 个覆盖 profile、1674 份证书共同导入，2272 个入口、18986 个依赖副本。BitVec.Bitblast 作为现成库导入，保留 sdiv/srem 性质的原声明身份。全部新证明通过公理闭包和原生目标残留源符号检查。

本批没有重跑整个机械翻译和冻结基线。编译产物仍只留远程 .work。下一步处理 ArrayAxioms 的 11 项和 PrimStringAxioms 的 12 项，再继续剩余模块。

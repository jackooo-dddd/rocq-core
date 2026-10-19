# 第五十五至五十六批：63 位整数定义与转换

新增 22 个去重根、22 份运算证书，1871 → **1893 / 2180**。Uint63Axioms 的 22 个透明定义全部完成；26 个规格陈述尚待后续批次。

## 定义对应（16 根）

[Uint63Operations.lean](proofs/Uint63Operations.lean) 覆盖 digits、size、max_int、addcarry、addc_def、addcarryc_def、subc_def、subcarryc_def、diveucl_def、compare_def、is_zero、addmuldiv_def、is_even、get_digit、bit、set_digit。

- 加法／减法保留 63 位模运算；额外加一／减一的进位借位条件分别证明。
- addc_def / subc_def 的标志对应 BitVec.uaddOverflow / usubOverflow。
- get_digit 和 bit 都等于 getLsbD，索引超过 62 时仍有全域证明。
- set_digit 只在索引小于 63 时更新；索引 63 保持原值，顶位 62 可设置。
- addmuldiv_def 保留原函数使用的模 63 位减法计算移位量，未擅自换成自然数饱和减法。
- compare_def 对应无符号 toNat 的 compare。

## 数值转换（6 根）

[Uint63Conversions.lean](proofs/Uint63Conversions.lean)：

| 源定义 | 已证明的原生结果 |
|---|---|
| of_pos_rec n p | BitVec.ofNat 63 (positiveTo p % 2^(natTo n)) |
| of_pos p | BitVec.ofNat 63 (positiveTo p) |
| of_Z z | BitVec.ofInt 63 (zTo z) |
| wB | 整数 2^63 |
| to_Z_rec n x | Int.ofNat (x.toNat % 2^(natTo n)) |
| to_Z x | Int.ofNat x.toNat |

两个递归证明覆盖任意 fuel，不仅是最终调用的 63；of_Z 包括任意负整数。机械 positive/Z/nat 本身保持独立结构，转换等式单独证明。

证明通过逐位归纳和低位模数分解完成。to_Z_rec 的递归器 motive 显式保持源类型写法，避免检查时因类型别名引发昂贵定义展开；没有提高信任范围或加入公理。

## 统计与检查

154 个类型根、793 个运算根、946 个完整原生陈述，共 1893。剩余：27 仅接口、82 部分陈述、161 尚无证书、17 条件根未完成，共 287。

115 个 profile 验证通过，1637 份增量证书通过公理闭包与原生目标检查。106 个覆盖 profile 共同导入成功，共 2203 个入口、16332 个依赖副本；入口／副本数不是去重根数。独立原陈述证明仍为 260，条件剩余仍为 17。

本批没有重跑全部机械翻译或所有冻结基线证明。编译产物和中间探测仍只在远程 .work。下一步独立证明位运算、相等判断和整数转换往返规格，再处理剩余算术与有符号规格。

# 第五十七至五十九批：63 位整数规格

新增 15 个去重根及 15 份完整原生陈述证书，1893 → **1908 / 2180**。15 项原机械陈述均有独立闭合证明；不是只给出 iff。

| 批次 | 文件 | 根 |
|---|---|---:|
| 57 | [Uint63Statements.lean](proofs/Uint63Statements.lean) | 6 |
| 58 | [Uint63DefinitionSpecs.lean](proofs/Uint63DefinitionSpecs.lean) | 7 |
| 59 | [Uint63OrderSpecs.lean](proofs/Uint63OrderSpecs.lean) | 2 |

## 本批陈述

- eqb_correct、eqb_refl：原生 BitVec 布尔相等的正确性与自反性。
- land_spec、lor_spec、lxor_spec：任意 word-valued 索引上的逐位 AND／OR／XOR 方程，越界情况也覆盖。
- of_to_Z：BitVec.ofInt 63 (Int.ofNat x.toNat) = x；源 of_Z (to_Z x) = x 也独立证明。
- addc_def_spec、addcarryc_def_spec、subc_def_spec、subcarryc_def_spec：原语和普通定义的进位／借位算法相等，保留溢出边界和额外一位运算。
- compare_def_spec：原语的比较分支与无符号 Nat compare 一致。
- diveucl_def_spec、addmuldiv_def_spec：原语与普通定义一致。两边转换后使用同一原生表达式，因此原生命题化简为反身等式；源端两种实现的相等仍独立检查。
- ltb_spec、leb_spec：布尔无符号比较与 to_Z 得到的整数顺序一致。机械 positive/Z 的比较辅助证明在当前源模块闭包重新检查。

没有使用新公理。类型别名／Iso 投影在复杂位运算参数上的定义展开曾导致检查超时；辅助引理直接写出输入类型和 bool/carry 的单射性，避免这些无谓展开，所有最终文件均通过检查。

## 当前范围

Uint63Axioms **37 / 48**。剩余 11 根：add_spec、sub_spec、mul_spec、div_spec、mod_spec、lsl_spec、lsr_spec、mulc_spec、diveucl_21_spec、head0_spec、tail0_spec。

全 Corelib：154 类型根、793 运算根、961 完整原生陈述，共 1908。剩余 27 仅接口、67 部分陈述、161 尚无证书、17 条件根，共 272。独立原陈述证明总数为 275。

118 个增量 profile 当前验证通过；109 个覆盖 profile、1652 份证书共同导入成功，2233 个入口、16814 个依赖副本。公理闭包与原生目标源符号检查通过。没有重跑全部机械翻译或冻结基线；中间编译文件仍仅留远程。

下一步复用二进制加减乘除、幂的证明，独立验证于 Uint63Axioms 的实际依赖闭包，然后完成剩余算术和移位规格。未被此闭包导出的 N／mask 辅助声明不会直接混入。

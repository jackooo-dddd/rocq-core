# 数字写出与进位对应

新增 11 个运算根、1 个类型根，全部由 Lean kernel 检查。当前总完成类别 875 / 2180。数字读取及规范化的旧结果另见 NUMERIC_WF_RESULTS.md。

| 源声明 | 已证明的原生目标 |
|---|---|
| Decimal.Little.succ / Hexadecimal.Little.succ | List (Fin 10/16) 上的原生进位函数 increment |
| Nat.to_little_uint / to_little_hex_uint | Nat.rec 对上述进位函数的迭代，保留任意输入累积器 |
| Nat.to_uint / to_hex_uint | 从 [0] 迭代后反转得到的大端数字列表 printDigits |
| Nat.to_int / to_hex_int | 正号标签与 printDigits 的乘积 |
| Nat.to_num_uint / to_num_hex_uint / to_num_int | 保留十进制/十六进制标签的 Sum 包装 |
| Number.signed_int | Sum (Bool × List (Fin 10)) (Bool × List (Fin 16)) 的双向逆 |

这些是完全由原生数据和函数组成的指定表达式，并非机械函数的包装。它们尚未证明等于 Mathlib 现成的 Nat.digits；证书 target_class 明确登记为 native_expression / native_representation。Mathlib 的零为 []，Rocq 打印的零为 [0]，将来直接对应必须写明这个差异。

另外证明了通用的进位数值性质 value(increment ds) = value(ds) + 1、迭代数值性质 value(iterate n ds) = value(ds) + n，以及两种机械 Nat 打印的数值均恰为 natTo n。这里 value 是原生小端位权折叠，打印结果反转后使用；不是仅以有限样例检查。

符号和进制标签、前导零都属于表示信息，不把 signed_int 的表示 Iso 冒充到原生 Int 的双射。十进制/十六进制 signed_int 的辅助 Iso 在 Nat 导出闭包重检，已有源根不重复登记。

证明：proofs/NumericWrite.lean。核验与公理闭包：reports/NumericWrite-audit.json。新增原生类型根 1、运算根 11；原陈述证明数不变。该批尚未进入 P7 的 585 份证书固定共同导入快照。

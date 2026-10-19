# 数字写出与进位对应

新增 11 个运算根、1 个类型根，全部由 Lean kernel 检查。本批初步完成时总完成类别 875 / 2180。数字读取及规范化的旧结果另见 NUMERIC_WF_RESULTS.md。

| 源声明 | 已证明的原生目标 |
|---|---|
| Decimal.Little.succ / Hexadecimal.Little.succ | List (Fin 10/16) 上的原生进位函数 increment |
| Nat.to_little_uint / to_little_hex_uint | Nat.rec 对上述进位函数的迭代，保留任意输入累积器 |
| Nat.to_uint / to_hex_uint | 从 [0] 迭代后反转得到的大端数字列表 printDigits |
| Nat.to_int / to_hex_int | 正号标签与 printDigits 的乘积 |
| Nat.to_num_uint / to_num_hex_uint / to_num_int | 保留十进制/十六进制标签的 Sum 包装 |
| Number.signed_int | Sum (Bool × List (Fin 10)) (Bool × List (Fin 16)) 的双向逆 |

这些是完全由原生数据和函数组成的指定表达式，并非机械函数的包装。其中七个顶层打印函数另外都已证明对应 Mathlib 现成的 Nat.digits，新增证书 target_class 为 existing_api，并显式保留反转顺序、符号/进制标签和零值适配。原始递归表达式证书仍为 native_expression；不会合并或重复计源根。Mathlib 的零为 []，Rocq 打印的零为 [0]，对应式明确使用 if n = 0 then [0] else (Nat.digits b n).reverse。

另外证明了通用的进位数值性质 value(increment ds) = value(ds) + 1、迭代数值性质 value(iterate n ds) = value(ds) + n，以及两种机械 Nat 打印的数值均恰为 natTo n。这里 value 是原生小端位权折叠，打印结果反转后使用；不是仅以有限样例检查。

符号和进制标签、前导零都属于表示信息，不把 signed_int 的表示 Iso 冒充到原生 Int 的双射。十进制/十六进制 signed_int 的辅助 Iso 在 Nat 导出闭包重检，已有源根不重复登记。

证明：proofs/NumericWrite.lean。核验与公理闭包：reports/NumericWrite-audit.json。新增原生类型根 1、运算根 11；原陈述证明数不变。该批已纳入最新 P7 共同导入快照。

## Mathlib 现成 API 对应

proofs/NumericMathlib.lean 证明进位保持末位非零的规范性、打印值正确，再调用 Nat.digits_ofDigits 得到唯一的 Mathlib 数字序列。七个顶层打印分别有独立的等式证书。总完成根仍为 875；增量证书 604 份，33 个 profile 已验证。Mathlib 提交和 Digits/Defs.olean 指纹记录于 reports/validation.json。

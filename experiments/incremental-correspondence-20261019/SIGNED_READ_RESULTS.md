# 有符号数字读取

Nat.of_int、of_hex_int、of_num_int 三个根均已证明对应原生 Int 数值上的函数：

    if z < 0 then none else some z.toNat

z 由保留符号和进制的原生数字表示计算。证明覆盖空列表、前导零、正零、负零及负的非零数；负零产生 some 0，负的非零数产生 none。不是不加条件地替换为 Int.toNat。

proofs/NumericSigned.lean 先证明源规范化对应原生 List.dropWhile，再证明去掉前导零保持数值，以及数值为零恰好等价于去零后为空，从而得到上述原生 Int 接口。所有三种入口均有独立证书；另有负零和负一的边界证明。

新增 3 个运算根。类型表示到 Int 的数值解释是多对一，不声称 signed_int 与 Int 有双射。具体公理闭包见 reports/NumericSigned-audit.json。

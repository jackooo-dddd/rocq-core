# 第四十至四十三批：依赖消去与数字表示

新增 **67 个去重根、67 份证书**，累计 **1731 / 2180**：130 类型根、695 运算根、906 完整原生陈述。其余为 100 只有接口、114 部分陈述、206 尚无证书、29 条件对应未完成。

| 本批完成的模块 | 新增根 | 当前完成 / 总数 |
|---|---:|---:|
| Numbers.BinNums | 12 | 15 / 15 |
| Init.Decimal | 21 | 40 / 40 |
| Init.Hexadecimal | 19 | 38 / 38 |
| Init.Number | 15 | 17 / 17 |

## 依赖消去器与归纳原则

[BinaryElimination.lean](proofs/BinaryElimination.lean) 的 6 个消去器证明覆盖随输入变化的返回类型：positive 对应正自然数 subtype 上的二进制递归，N 对应 Nat 的零／正数分支，Z 对应 Int 的零／正／负分支。

rect 保留任意 Sort，rec 保留原 Type 范围。原生 motive 沿已证明的 Iso 拉回源类型。一个已检查的例子返回 Fin (n+1)，因此不是只证明常量返回类型。

6 个 ind/sind 陈述对应完整原生归纳／分支原则，同时各自有源陈述闭合证明。继上一批后，二进制类型和运算四个模块合计 101 / 101 根完成。

## 数字表示的完整信息

[DecimalRepresentation.lean](proofs/DecimalRepresentation.lean)、[HexadecimalRepresentation.lean](proofs/HexadecimalRepresentation.lean)、[NumberRepresentation.lean](proofs/NumberRepresentation.lean)。

| 源类型 | 原生表示 |
|---|---|
| Decimal.decimal | 带符号十进制整数数字 × 小数数字 × 可选带符号十进制指数 |
| Hexadecimal.hexadecimal | 带符号十六进制整数数字 × 小数数字 × 可选带符号十进制指数 |
| Number.number | 上述两个原生记录的 Sum，保留格式标签 |

每项都证明两个逆律。前导零、空数字串、负零、是否显式写指数以及格式标签都保留。十六进制字面量的指数部分仍用十进制表示，不能统一替换成十六进制数字。

完成的运算包括结构相等测试、首尾删除、尾零消除及计数、小端 double/succ_double、身份函数、依赖消去器、相等判定。目标使用 List、Fin、Bool、Prod、Option、Sum 和 Decidable 及其组合表达式。

源 del_head 在删去恰好全部数字时得到 []，超出长度时得到 [0]；del_head_int 丢弃符号，而 del_tail_int 保留符号。对应证明覆盖这些区别。十进制 12300 的尾零消除得到 ([1,2,3],2)；小端 [5,9] 加倍得到 [0,9,1]。负零和正零在表示上仍不同。这些例子均编译检查。

十六进制与 Number 的生成脚本只复用证明文本，分别在实际源模块闭包中重新检查，不新增或替换 Rocq 源声明。复用的辅助类型 Iso 不额外计根。

## 相等判定的证明前提

三个表示模块的 9 个 eq_dec 函数共 36 个前提均已给出闭合证明，并显式实例化原始 RocqPending 函数。证书陈述直接引用实际源函数；闭合包装函数另行审计。

输出 sumbool 转为原生 Decidable equality，并证明等于原生判定。原生比较的是完整表示，不是把字符串求数值后比较。机械产物的 331 个条件根不变，correspondence 层已完成其中 302 个，剩余 29 个。

本批新增 20 份原陈述独立 Prop 证明，总数 220；没有把原生陈述 iff 直接当作原定理已证明。

## 验证与下一步

101 个增量 profile 有当前验证；92 个覆盖 profile、1475 份证书共同导入通过。1989 个导出入口、14200 个依赖副本。新目标递归检查无源符号，公理闭包均通过。

共同导入的检查入口增长后触发了审计代码的默认递归深度；check_all.py 将 maxRecDepth 显式设为 16384 后重新通过。检查内容与允许公理集合没有减少。

下一步继续 Init.Byte 的 9 个剩余根，再按共享依赖处理其他尚未完成模块。剩余 449 根不等于 449 个不可能对应的对象。

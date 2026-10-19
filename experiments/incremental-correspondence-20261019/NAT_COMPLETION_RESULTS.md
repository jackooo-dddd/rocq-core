# Init.Nat 对应完成范围

Init.Nat 的 58 个去重源根均已取得各自明示范围内的证书：1 个类型根、57 个运算根。逐根数据见 reports/nat-module-coverage.json 和 CORELIB_LEDGER.csv。

## 最近完成的运算

| 运算 | 原生目标与范围 |
|---|---|
| gcd | Nat.gcd；所有参数；已证明并实例化原始终止条件 |
| divmod | Nat 的除法、取模和显式累积器适配；四个参数任意，包括 u > y |
| sqrt | Nat.sqrt；所有输入，包括零 |
| log2 | Nat.log2；所有输入，包括零 |
| sqrt_iter、log2_iter | 独立的原生递归状态函数；四个参数任意 |
| 七种顶层数字打印 | Mathlib Nat.digits 加上顺序、零和标签适配 |
| 三种有符号读取 | 原生 Int 数值上的 if z < 0 then none else some z.toNat |

两个内部迭代器的全部状态可对应原生递归函数；只有满足算法不变量的状态才解释为 sqrt/log2。顶层 sqrt/log2 的初始化满足不变量，因此顶层与现成 API 的等式无需额外前提。两类结果分别登记，不能把内部函数也说成直接等于 Nat.sqrt / Nat.log2。

sqrt 证明维持区间 p² ≤ n < (p+1)²；log2 证明维持 2^p ≤ q 和 q+r+1 = 2^(p+1)。随后用原生 sqrt/log2 的唯一性得到等式。

divmodNative 显式处理任意累积状态：若 x ≤ u，结果为 (q,u-x)；否则 t=x-(u+1)+(q+1)*(y+1)，结果为 (t/(y+1), y-t%(y+1))。对应不是只覆盖调用时常见的 u ≤ y。

## gcd 条件

原始机械 gcd 仍带终止条件，本次没有改写或重新运行机械翻译。闭合包装 gcdClosed 以 natTo 为下降量，利用已证明的 modulo 对应与原生 Nat.mod_lt 证明终止，再证明等于 Nat.gcd。

这份见证公理闭包为 propext、Quot.sound，均为已有 Lean 标准公理；没有新增公理、sorry 或未证明的源条件。因此目前 14 份闭合见证中 13 份公理闭包为空、1 份使用标准公理。条件根已处理 16 个，correspondence 层剩余 315；机械产物依然保留原来的 331 个条件根。

## 文件

- proofs/NatGcd.lean：终止、闭合包装和 gcd 对应。
- proofs/NatArithmetic.lean：divmod 全参数语义。
- proofs/NatIterators.lean：两种状态迭代器、循环不变量、sqrt/log2 对应。
- proofs/NumericWrite.lean、NumericMathlib.lean、NumericSigned.lean：数字转换。
- reports/CERTIFICATES.md：完整签名、适用范围和公理闭包。

本结论只针对 Init.Nat 这 58 个根；Init.Peano 的定理、其他二进制数模块和全 Corelib 的剩余声明仍需继续。

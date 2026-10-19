# 第六十至六十二批：整数算术、移位与零位计数

新增 9 根，1908 → **1917 / 2180**。每项既有完整原生陈述 iff，也有独立机械源陈述证明。

| profile | 根 | 原生意义 |
|---|---:|---|
| [Uint63ArithmeticSpecs](proofs/Uint63ArithmeticSpecs.lean) | 5 | 加减乘模 2^63；无符号除法与余数 |
| [Uint63ShiftSpecs](proofs/Uint63ShiftSpecs.lean) | 2 | 左移乘 2^p 再取模；右移除以 2^p |
| [Uint63CountSpecs](proofs/Uint63CountSpecs.lean) | 2 | clz 的正规化界限；ctz 的奇数因子分解 |

[Uint63ArithmeticSupport](proofs/Uint63ArithmeticSupport.lean) 是共享证明依赖，不新增覆盖根。它选取已有 positive/Z 的加减乘、幂、比较、向下取整除法证明，在 Uint63Axioms 的实际源依赖闭包重新检查；没有直接导入另一个源闭包中的同名 Rocq2LeanOut。

算术证明覆盖零除数和减法下溢。使用 Int.fdiv/fmod 保留源 Z 的取整方向；在无符号输入及正模数上再连接 Lean 的标准整数运算。移位证明覆盖所有 word-valued 移位量，包含大于等于 63 的情况。

head0_spec 保留非零前提，证明 2^62 ≤ 2^clz(x) * x < 2^63。tail0_spec 同样保留非零前提，证明存在非负整数 y，使 x = (2*y+1)*2^ctz(x)。先由 getLsbD 的最低有效位性质证明 Nat 版本，再显式构造机械 Z 见证，完成源 exists 陈述。

当前 Uint63Axioms 已审计完成 46/48；mulc_spec 与 diveucl_21_spec 在后续 profile 继续。宽乘法已经单独通过，但在该 profile 完整审计前不计入。

全库：154 类型根、793 运算根、970 完整原生陈述，共 1917。剩余 27 仅接口、58 部分陈述、161 尚无证书、17 条件根，共 263。原陈述独立证明总数 284。

122 个增量 profile 验证通过；112 个覆盖 profile、1661 份证书共同导入，2251 个入口、17904 个依赖副本。所有新证书的公理闭包与原生目标检查通过。没有重跑全部机械翻译或冻结基线。编译产物与中间输出只留远程 .work。

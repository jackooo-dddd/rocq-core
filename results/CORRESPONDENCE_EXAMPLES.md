# 机械 Rocq → Lean 的 correspondence 实例

这些是已经通过 Lean kernel 检查的通用证明，不是仅测试几个输入。下文为阅读省略长命名空间：R 表示机械函数，toNat／toInt 表示已证往返的数值类型转换。具体数字示例若未单独标注，是通用定理的实例说明，不是声称执行过机械代码的 #eval。

## 1. gcd：先证明条件，再得到原生运算

    toNat (gcdClosed a b) = Nat.gcd (toNat a) (toNat b)

gcdClosed 用已证明的终止条件实例化原始机械 gcd。证明利用余数对应和 Nat.mod_lt；最终等式覆盖所有自然数输入。因此可以用 Lean 的 gcd 定理推导机械结果的性质。

证书：gcd_agrees；[证明源码](../experiments/incremental-correspondence-20261019/proofs/NatGcd.lean)。

## 2. sqrt：内部迭代不是简单重命名

    toNat (R.Nat.sqrt n) = Nat.sqrt (toNat n)

通过迭代状态不变量及平方根的区间刻画证明，例如输入 15 的结果是 3。内部 sqrt_iter 对任意状态先对应独立的原生状态递归函数；只有满足不变量的状态才可解释成平方根。顶层初始化满足不变量，所以顶层定理无额外输入条件。

证书：sqrt_agrees；[证明源码](../experiments/incremental-correspondence-20261019/proofs/NatIterators.lean)。

## 3. positive、N 的减法边界不同

    positiveTo (R.Pos.sub p q) = max 1 (positiveTo p - positiveTo q)
    binaryNatTo (R.N.sub n m) = binaryNatTo n - binaryNatTo m

positive 不含零，因此它的 3−5 得到 1；N 含零，3−5 得到 0。二者都能对应原生表达式，但不能不加适配地替换成同一个运算。

[positive 减法证明](../experiments/incremental-correspondence-20261019/proofs/BinaryMask.lean)；
[N 减法证明](../experiments/incremental-correspondence-20261019/proofs/BinaryNatSub.lean)。

## 4. mask 与 Option Nat：无损保留源信息

| 机械构造器 | 原生值 |
|---|---|
| IsNeg | none |
| IsNul | some 0 |
| IsPos p | some (positiveTo p) |

maskIso 包含两条往返定理。还有运算对应：

    maskTo (R.Pos.sub_mask p q)
      = if positiveTo q ≤ positiveTo p
        then some (positiveTo p - positiveTo q)
        else none

IsNeg 本身没有携带负差的绝对值，所以这里的 none 没有丢失原类型存储的数据。不是把有信息损失的数值解释冒充双射。

[类型与运算证明](../experiments/incremental-correspondence-20261019/proofs/BinaryMask.lean)。

## 5. 有符号幂与移位：必须保留约定

    toInt (R.Z.pow x y)
      = if toInt y < 0 then 0 else (toInt x) ^ (toInt y).toNat

    shiftLeftNative x n
      = if n < 0 then x / 2 ^ (-n).toNat else 2 ^ n.toNat * x

    toInt (R.Z.shiftr x n)
      = shiftLeftNative (toInt x) (-toInt n)

Z.pow_pos 直接对应原生 Int 的自然数次幂；Z.pow 另有负指数返回零的约定。移位的除数总是正的 2 的幂，负被除数采用向下取整。

下面四个实例另有已检查证明：

| 机械运算的数值输入 | 转换后结果 | 实例定理 |
|---|---:|---|
| Z.pow (-2) (-3) | 0 | example_negative_exponent |
| Z.pow_pos (-2) 3 | -8 | example_negative_base |
| Z.shiftr (-3) 1 | -2 | example_negative_right_shift |
| Z.shiftl 3 (-1) | 1 | example_negative_shift_count |

[通用证明与四个实例](../experiments/incremental-correspondence-20261019/proofs/BinaryPower.lean)。

## 6. if_spec：对应依赖索引中的信息

固定 A、b、vTrue、vFalse、notB 后，机械 if_spec 在索引 c、x 处对应：

    PLift (if c then b = true ∧ x = vTrue
                else notB ∧ x = vFalse)

b、c 已转换为原生 Bool；A 保留任意导出 Type 宇宙。这个表示保存分支证据和结果值等式。ifIso 证明双向往返；ifP_agrees、ifPn_agrees 证明源函数输出经转换后等于独立构造的原生证据。证明保持源函数 opaque。

[索引类型及函数证明](../experiments/incremental-correspondence-20261019/proofs/SSRBoolIndexed.lean)。

## 7. Type 值关系：保留数据，而非只留一个命题

对于 R : A → A → Type v，机械 CRelationClasses.Equivalence 的原生表示是：

    ((x : A) → R x x)
      × (((x y : A) → R x y → R y x)
          × ((x y z : A) → R x y → R y z → R x z))

EquivalenceIso 给出双向逆，三个字段投影也有对应等式。这里的函数可能有不同计算行为，不能压成普通 Prop 的自反／对称／传递断言。

同模块的 iffT A B 对应：

    (A → B) × (B → A)

它不要求两个函数互为逆，所以不是 Equiv A B。对应到的是原生函数和乘积的组合，而非同名的现成类型类。

[Type 值关系证明](../experiments/incremental-correspondence-20261019/proofs/CRelationData.lean)。

完整签名、假设和公理依赖见 [证书报告](../experiments/incremental-correspondence-20261019/reports/CERTIFICATES.md)；当前总数见 [工作区摘要](../experiments/incremental-correspondence-20261019/reports/summary.json)。原生表达式对应与现成 Lean／Mathlib API 直接对应分别登记。

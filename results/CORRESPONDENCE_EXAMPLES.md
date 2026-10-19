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


## 8. Eq / Iff 的等价关系记录：对应到现成的 Lean 命题

机械 CRelationClasses.eq_equivalence 的关系值是 PULift (机械 eq x y)。通过已证的机械 Eq ↔ Lean Eq，得到：

    equalityEquivalenceIso.to (eqEquivalenceClosed A)
      = equalityEquivalenceNative A

右侧的类型为 Lean 的 Equivalence (@Eq A)，三个字段分别是 Eq.refl、Eq.symm、Eq.trans。equalityEquivalenceIso 还证明正反两条转换互为逆。三个源端前置条件已经证明，不作为用户额外假设。

同理，iff_equivalence 从 PULift Prop 上的机械 iff 转换到 Prop 上的 Equivalence Iff，也有两个逆律。这两个具体关系的值仅为证明；这正是它们可以转成 Prop 中的原生记录，而上一节任意 Type 值关系需要保留计算数据的原因。

[Eq / Iff 与 PartialOrder 的证明](../experiments/incremental-correspondence-20261019/proofs/CRelationOrder.lean)。


## 9. 按位运算：直接对应 Mathlib，并把原生定理推回机械对象

    binaryIntTo (R.Z.land x y) = Int.land (binaryIntTo x) (binaryIntTo y)
    binaryIntTo (R.Z.lor x y)  = Int.lor  (binaryIntTo x) (binaryIntTo y)
    binaryIntTo (R.Z.lxor x y) = Int.xor  (binaryIntTo x) (binaryIntTo y)

这里的目标是 Mathlib 已有的 Int 运算，覆盖任意正负整数，不需要选定机器字长。四个另外检查的实例为：

| 机械输入 | 转换后结果 |
|---|---:|
| Z.land (-3) 6 | 4 |
| Z.lor (-3) (-6) | -1 |
| Z.lxor (-3) 6 | -5 |
| Z.lxor (-3) (-6) | 7 |

positive / N 的对应先通过二进制构造器归纳证明；Z 复用这些结果处理符号。Pos.ldiff、N.ldiff 也已证明等于 Mathlib 的 Nat.ldiff。

在同一文件中，binaryNat_land_comm 把 Nat.and_comm 通过对应等式和 binaryNatIso 的单射性推回，证明：

    R.N.land m n = R.N.land n m

这展示了已经可以使用 Lean 原生定理证明机械对象的性质。通用证明、四个实例和交换律见 [BinaryIntBitwise.lean](../experiments/incremental-correspondence-20261019/proofs/BinaryIntBitwise.lean)。

完整签名、假设和公理依赖见 [证书报告](../experiments/incremental-correspondence-20261019/reports/CERTIFICATES.md)；当前总数见 [工作区摘要](../experiments/incremental-correspondence-20261019/reports/summary.json)。原生表达式对应与现成 Lean／Mathlib API 直接对应分别登记。

## 10. 两种整数除法不能混同

    toInt (R.Z.div a b) = Int.fdiv (toInt a) (toInt b)
    toInt (R.Z.quot a b) = Int.tdiv (toInt a) (toInt b)

-7 除以 3，前者为 -3，后者为 -2；对应余数为 2 和 -1。负除数及零除数都在通用证明范围内。内部 N.pos_div_eucl(5,0) 返回 (3,5)，内部 Z.pos_div_eucl(5,0) 返回 (7,1)，因此不能把内部辅助函数无条件替换为普通除法。

这些具体边界例子均已编译。[证明](../experiments/incremental-correspondence-20261019/proofs/BinaryDivision.lean)。

## 11. 二进制平方根和余数

    sqrtPairTo (R.Pos.sqrtrem p)
      = (Nat.sqrt n, some (n - Nat.sqrt n * Nat.sqrt n))
    -- n = positiveTo p

从每步保持 n=s*s+r、r<2*s+1 证明结果与现成 Nat.sqrt 一致。12345 得到 (111,some 24)；整数负输入得到 (0,0)。这些例子已通过 kernel 检查，还直接用 Nat.sqrt_le 证明机械输出的平方不超过输入。

[证明](../experiments/incremental-correspondence-20261019/proofs/BinarySqrtRem.lean)。

## 12. 高阶迭代：结合律决定能否改成线性 fold

    R.Pos.iter_op Nat Nat.add p a = positiveTo p * a
    R.Pos.iter_op Nat Nat.mul p a = a ^ positiveTo p

任意满足结合律的 op 还对应 List.foldr op a (List.replicate (positiveTo p-1) a)。没有结合律时只保证保留二进制括号的原生版本；已验证 op(a,b)=a+2b 对四份 5 给出 45，而线性 fold 给出 75。

[证明](../experiments/incremental-correspondence-20261019/proofs/BinaryIterOp.lean)。同一 iter_op 根的四份证书不重复计根。

## 13. 返回类型也依赖数值的递归

N_rect 的对应允许原生 motive P : Nat → Sort u。已检查的例子取 P(n)=Fin(n+1)，因此输入改变时返回类型也改变；positive_rect 和 Z_rect 同样保留依赖返回类型。

[证明及例子](../experiments/incremental-correspondence-20261019/proofs/BinaryElimination.lean)。

## 14. 数字表示不能丢掉负零和格式

Decimal.decimal 对应“带符号整数数字、小数数字、可选带符号指数”的原生元组。Hexadecimal.hexadecimal 的指数仍是十进制数字。Number.number 在外层再保留 Decimal/Hexadecimal 的 Sum 标签。

所以这些是无损表示 Iso，结构相等判定保留负零／正零、前导零和指数是否出现的区别。9 个原本带条件的 eq_dec 函数已通过闭合前置证明，对应完整原生 Decidable equality。

[十进制证明](../experiments/incremental-correspondence-20261019/proofs/DecimalRepresentation.lean)、
[十六进制证明](../experiments/incremental-correspondence-20261019/proofs/HexadecimalRepresentation.lean)、
[格式组合证明](../experiments/incremental-correspondence-20261019/proofs/NumberRepresentation.lean)。

## 15. 63 位计数与溢出

[WordOperations.lean](../experiments/incremental-correspondence-20261019/proofs/WordOperations.lean) 对任意 x : BitVec 63 证明机械 head0 x = x.clz、tail0 x = x.ctz。例：head0 1 = 62，tail0 8 = 3，零的两种计数都是 63。addc 最大值 1 对应 (true, 0)，同时保留进位标志。

## 16. 字节序列并非 Unicode 文本

[PrimitiveStrings.lean](../experiments/incremental-correspondence-20261019/proofs/PrimitiveStrings.lean)：机械 make 1 256 的字节取模后，parse 得到 some 0；而字符 print 256 返回 none。这两个接口的输入约定不同，证明保留了差异。所有字节，包括 NUL，均无损保留。

## 17. 通用关系接口实例化为 Lean Eq

[GenericEquality.lean](../experiments/incremental-correspondence-20261019/proofs/GenericEquality.lean) 用 PLift (x = y) 满足源 Type 值关系的要求。实例化机械 ap 后得到 PLift (congrArg f h)，实例化 sym 后得到 PLift h.symm，两项都由 kernel 验证。任意关系的接口对应和这一特定 Eq 实例分别陈述。

## 18. Program.Wf 的子类型递归

[ProgramWellFounded.lean](../experiments/incremental-correspondence-20261019/proofs/ProgramWellFounded.lean) 把源函数收到的机械 sig 输入转为 Lean Subtype {y // R y x}，递归结果等于 WellFounded.fix 的结果。两个回调转换器证明互为逆；proj2_sig 等前提已经给出闭合证明，不需要用户再提供。

## 19. 任意元数的合同性

[SSRRewriteData.lean](../experiments/incremental-correspondence-20261019/proofs/SSRRewriteData.lean) 对所有机械 n 证明 nary_congruence_statement n k 等价于原生 Nat 上的递归谓词；每层函数参数使用 Lean Eq。随后 [SSRRewriteStatements.lean](../experiments/incremental-correspondence-20261019/proofs/SSRRewriteStatements.lean) 对所有 arity 用归纳证明完整合同性陈述，既有对应证书，也有原陈述证明。

## 20. 把 SSR 自反性作为原生实例使用

[SSRClasses.lean](../experiments/incremental-correspondence-20261019/proofs/SSRClasses.lean) 证明源 Reflexive A R ↔ Std.Refl R。转换后的证据可用于 Lean 的 Std.Refl.refl；Eq 和 Iff 的两个原陈述也都有独立证明。

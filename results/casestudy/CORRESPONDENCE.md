# 与 Lean 原生 Nat 的对应

## 类型和构造器

[fragments/MechanicalNat.lean](correspondence/fragments/MechanicalNat.lean) 是最短阅读入口；[NatEq.lean](correspondence/NatEq.lean) 是含公共定义和审计的完整 profile。

    natTo : MechanicalNat → Nat
    natOf : Nat → MechanicalNat

已证明两条逆律：

    natOf (natTo n) = n
    natTo (natOf n) = n

natIso 将二者包装成 Iso。MechanicalNat 是本文对 Rocq.Corelib.Init.Datatypes.nat 的简称，不是另定义的第三种类型。

构造器对应有四份明确证明：natTo_zero、natTo_succ、natOf_zero、natOf_succ：

    natTo O = 0
    natTo (S n) = Nat.succ (natTo n)
    natOf 0 = O
    natOf (Nat.succ n) = S (natOf n)

NatEq 还包含机械 eq 与 Lean Eq 的转换及在自然数上的一致性。这是在两个独立类型之间证明对应，不能把两者写成定义相等。

## 运算与消去器

- [MechanicalNatOps](correspondence/fragments/MechanicalNatOps.lean)：zero/one/two、succ/pred、加减乘幂、布尔比较等。
- [MechanicalNatExtra](correspondence/fragments/MechanicalNatExtra.lean)：比较、奇偶等进一步证明。
- [MechanicalNatDiv](correspondence/fragments/MechanicalNatDiv.lean)：除法相关证明；每个定理的参数与条件以实际类型为准。
- [MechanicalNatBits](correspondence/fragments/MechanicalNatBits.lean)：位操作证明。
- [DependentNat](correspondence/DependentNat.lean)：源 nat_rec/nat_rect 的依赖消去对应；不是自动生成的任意依赖函数空间往返接口。
- [Peano](correspondence/Peano.lean)：自然数关系及陈述转换。
- [Interface_Init_Nat](correspondence/Interface_Init_Nat.lean)：自动接口及往返。
- [UseNative](correspondence/UseNative.lean)：在统一生成环境中使用原生 Nat 加法等；依赖原实验的 UnifiedInterfaces。
- [Boundaries](correspondence/Boundaries.lean)：数字表示等边界及辅助对应。

例如 nat_add_agrees 的内容为：

    natTo (Rocq.Corelib.Init.Nat.add n m) = natTo n + natTo m

nat_mul_agrees 对乘法给出同类结论。相关 Lean 源文件包含证明正文；audits/ 中记录定理类型和公理依赖。

## 99 个专题根的覆盖

| 类别 | 根数 | 含义 |
|---|---:|---|
| TYPE_ISO | 2 | nat 与 Init.Nat.t 的类型对应 |
| OPERATION_CORRESPONDENCE | 39 | 已有指定运算/谓词/消去器对应证书 |
| STATEMENT_FULL_NATIVE | 28 | 转换后的陈述不残留源符号；不是业务定理证明 |
| STATEMENT_PARTIAL | 5 | 陈述 iff 已有，但仍残留源符号 |
| TRANSPORT_INTERFACE_ONLY | 15 | 有接口往返；尚不能据此认定与 Lean 同名运算一致 |
| EXPLICIT_PROOF_PARAMETERS | 1 | gcd 仍需终止性条件 |
| NOT_YET_BRIDGED | 9 | 尚无所需桥接证书 |
| 合计 | 99 | 每个根按既有 ledger 的主要类别归类 |

Init.Nat 的58项单独看：33项运算对应、1项类型对应、14项仅接口、1项带条件、9项未桥接。
9项未桥接是 of_hex_int、of_int、of_num_int、of_num_uint、to_hex_int、to_int、to_num_hex_uint、to_num_int、to_num_uint。它们涉及数字表示转换；未桥接不等于无法建立对应。

完整逐项证书名、接口特殊化、仍残留的源符号见 [DECLARATIONS.csv](correspondence/DECLARATIONS.csv)与[逐项页面](DECLARATIONS.md)。
这些数字是主要类别计数，不是所有证明证书数量；同一项可能既有运算对应又有接口往返。

## 证据与复核

correspondence/audits/、logs/ 和 VERIFIED.json 是既有实验记录。VERIFIED.json 的101个通过 profile 是整个实验范围，不能写成本案例重新检查了101个。

本案例 verify.py 另行复核主要 Nat/Peano/依赖消去/接口/陈述 profile 及原生使用演示，准确清单与新结果见 VALIDATION.json。
它使用原样复制的证明源文本，只在临时副本中把审计文件输出重定向到 .work/，不更改证明。

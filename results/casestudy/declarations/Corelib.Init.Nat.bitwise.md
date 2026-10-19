# Corelib.Init.Nat.bitwise

[总索引](../DECLARATIONS.md) · [源模块](../source/Nat.v) · [完整记录](Corelib.Init.Nat.bitwise.json)

机械结果：TRANSLATED_AND_CHECKED；分派：constant/transparent；待证参数：0。

## 源端信息

源 IR 类型、正文/归纳块在同名 JSON 的 mechanical_record.source_ir；原始源码在完整 .v 中。

## Lean 实际打印结果

```lean
def Rocq.Corelib.Init.Nat.bitwise : (Rocq.Corelib.Init.Datatypes.bool →
    Rocq.Corelib.Init.Datatypes.bool → Rocq.Corelib.Init.Datatypes.bool) →
  Rocq.Corelib.Init.Datatypes.nat →
    Rocq.Corelib.Init.Datatypes.nat → Rocq.Corelib.Init.Datatypes.nat → Rocq.Corelib.Init.Datatypes.nat :=
fun op n a b =>
  Rocq.Corelib.Init.Datatypes.nat.rec.{1} (motive := fun n =>
    Rocq.Corelib.Init.Datatypes.nat → Rocq.Corelib.Init.Datatypes.nat → Rocq.Corelib.Init.Datatypes.nat)
    (fun a b => Rocq.Corelib.Init.Datatypes.nat.O)
    (fun a _ih a_1 b =>
      Rocq.Corelib.Init.Nat.add
        (Rocq.Corelib.Init.Datatypes.bool.rec.{1} Rocq.Corelib.Init.Datatypes.nat.O.S Rocq.Corelib.Init.Datatypes.nat.O
          (op (Rocq.Corelib.Init.Nat.odd a_1) (Rocq.Corelib.Init.Nat.odd b)))
        (Rocq.Corelib.Init.Nat.mul Rocq.Corelib.Init.Datatypes.nat.O.S.S
          (_ih (Rocq.Corelib.Init.Nat.div2 a_1) (Rocq.Corelib.Init.Nat.div2 b))))
    n a b
```

## 翻译过程记录

| 尝试标签 | 耗时 ms | 结果 |
|---|---|---|
| c[] | 0 | TRANSLATED_AND_CHECKED |

标签表示尝试配置；不是逐 AST 步骤日志。0 ms 是计时精度下的记录，不表示没有执行。

待证参数：[]。

完整 target_report 保留宇宙字段、目标 AST 与分支；prerequisite_declarations 保留条件声明。报告字段与开关不能直接换算为规则调用次数。源 roundtrip、consumer、audit 结果见 module_validation。

## 与原生 Lean 的对应

覆盖类别：OPERATION_CORRESPONDENCE。

类型/运算证书：NativeBridge.nat_bitwise_agrees。

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Nat.bitwise.roundtrip。

陈述 iff 证书：未记录。

陈述 iff 不证明命题本身；接口往返不自动证明等于 Lean 同名运算。

## 已收录证书的实际类型

NativeBridge.Interfaces.Rocq.Corelib.Init.Nat.bitwise.roundtrip

```lean
((NativeBridge.boolIso.functions (NativeBridge.boolIso.functions NativeBridge.boolIso)).functions
        (NativeBridge.natIso.functions
          (NativeBridge.natIso.functions (NativeBridge.natIso.functions NativeBridge.natIso)))).of
    (((NativeBridge.boolIso.functions (NativeBridge.boolIso.functions NativeBridge.boolIso)).functions
          (NativeBridge.natIso.functions
            (NativeBridge.natIso.functions (NativeBridge.natIso.functions NativeBridge.natIso)))).to
      Rocq.Corelib.Init.Nat.bitwise) =
  Rocq.Corelib.Init.Nat.bitwise
```

公理依赖：['propext', 'Quot.sound']。

NativeBridge.nat_bitwise_agrees

```lean
∀ (op : NativeBridge.RBool → NativeBridge.RBool → NativeBridge.RBool) (f : Bool → Bool → Bool),
  (∀ (x y : NativeBridge.RBool), NativeBridge.boolTo (op x y) = f (NativeBridge.boolTo x) (NativeBridge.boolTo y)) →
    f false false = false →
      ∀ (n a b : NativeBridge.MN),
        NativeBridge.natTo (Rocq.Corelib.Init.Nat.bitwise op n a b) =
          Nat.bitwise f (NativeBridge.natTo a) (NativeBridge.natTo b) % 2 ^ NativeBridge.natTo n
```

公理依赖：['propext', 'Quot.sound']。

[对应证明说明](../CORRESPONDENCE.md)

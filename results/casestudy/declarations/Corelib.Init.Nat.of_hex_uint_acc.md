# Corelib.Init.Nat.of_hex_uint_acc

[总索引](../DECLARATIONS.md) · [源模块](../source/Nat.v) · [完整记录](Corelib.Init.Nat.of_hex_uint_acc.json)

机械结果：TRANSLATED_AND_CHECKED；分派：constant/transparent；待证参数：0。

## 源端信息

源 IR 类型、正文/归纳块在同名 JSON 的 mechanical_record.source_ir；原始源码在完整 .v 中。

## Lean 实际打印结果

```lean
def Rocq.Corelib.Init.Nat.of_hex_uint_acc : Rocq.Corelib.Init.Hexadecimal.uint →
  Rocq.Corelib.Init.Datatypes.nat → Rocq.Corelib.Init.Datatypes.nat :=
fun d acc =>
  Rocq.Corelib.Init.Hexadecimal.uint.rec.{1} (motive := fun d =>
    Rocq.Corelib.Init.Datatypes.nat → Rocq.Corelib.Init.Datatypes.nat) (fun acc => acc)
    (fun a _ih acc =>
      _ih (Rocq.Corelib.Init.Nat.tail_mul Rocq.Corelib.Init.Datatypes.nat.O.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S acc))
    (fun a _ih acc =>
      _ih (Rocq.Corelib.Init.Nat.tail_mul Rocq.Corelib.Init.Datatypes.nat.O.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S acc).S)
    (fun a _ih acc =>
      _ih (Rocq.Corelib.Init.Nat.tail_mul Rocq.Corelib.Init.Datatypes.nat.O.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S acc).S.S)
    (fun a _ih acc =>
      _ih (Rocq.Corelib.Init.Nat.tail_mul Rocq.Corelib.Init.Datatypes.nat.O.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S acc).S.S.S)
    (fun a _ih acc =>
      _ih
        (Rocq.Corelib.Init.Nat.tail_mul Rocq.Corelib.Init.Datatypes.nat.O.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S acc).S.S.S.S)
    (fun a _ih acc =>
      _ih
        (Rocq.Corelib.Init.Nat.tail_mul Rocq.Corelib.Init.Datatypes.nat.O.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S
                    acc).S.S.S.S.S)
    (fun a _ih acc =>
      _ih
        (Rocq.Corelib.Init.Nat.tail_mul Rocq.Corelib.Init.Datatypes.nat.O.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S
                      acc).S.S.S.S.S.S)
    (fun a _ih acc =>
      _ih
        (Rocq.Corelib.Init.Nat.tail_mul Rocq.Corelib.Init.Datatypes.nat.O.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S
                        acc).S.S.S.S.S.S.S)
    (fun a _ih acc =>
      _ih
        (Rocq.Corelib.Init.Nat.tail_mul Rocq.Corelib.Init.Datatypes.nat.O.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S
                          acc).S.S.S.S.S.S.S.S)
    (fun a _ih acc =>
      _ih
        (Rocq.Corelib.Init.Nat.tail_mul Rocq.Corelib.Init.Datatypes.nat.O.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S
                            acc).S.S.S.S.S.S.S.S.S)
    (fun a _ih acc =>
      _ih
        (Rocq.Corelib.Init.Nat.tail_mul Rocq.Corelib.Init.Datatypes.nat.O.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S
                              acc).S.S.S.S.S.S.S.S.S.S)
    (fun a _ih acc =>
      _ih
        (Rocq.Corelib.Init.Nat.tail_mul Rocq.Corelib.Init.Datatypes.nat.O.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S
                                acc).S.S.S.S.S.S.S.S.S.S.S)
    (fun a _ih acc =>
      _ih
        (Rocq.Corelib.Init.Nat.tail_mul Rocq.Corelib.Init.Datatypes.nat.O.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S
                                  acc).S.S.S.S.S.S.S.S.S.S.S.S)
    (fun a _ih acc =>
      _ih
        (Rocq.Corelib.Init.Nat.tail_mul Rocq.Corelib.Init.Datatypes.nat.O.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S
                                    acc).S.S.S.S.S.S.S.S.S.S.S.S.S)
    (fun a _ih acc =>
      _ih
        (Rocq.Corelib.Init.Nat.tail_mul Rocq.Corelib.Init.Datatypes.nat.O.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S
                                      acc).S.S.S.S.S.S.S.S.S.S.S.S.S.S)
    (fun a _ih acc =>
      _ih
        (Rocq.Corelib.Init.Nat.tail_mul Rocq.Corelib.Init.Datatypes.nat.O.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S.S
                                        acc).S.S.S.S.S.S.S.S.S.S.S.S.S.S.S)
    d acc
```

## 翻译过程记录

| 尝试标签 | 耗时 ms | 结果 |
|---|---|---|
| c[] | 1 | TRANSLATED_AND_CHECKED |

标签表示尝试配置；不是逐 AST 步骤日志。0 ms 是计时精度下的记录，不表示没有执行。

待证参数：[]。

完整 target_report 保留宇宙字段、目标 AST 与分支；prerequisite_declarations 保留条件声明。报告字段与开关不能直接换算为规则调用次数。源 roundtrip、consumer、audit 结果见 module_validation。

## 与原生 Lean 的对应

覆盖类别：TRANSPORT_INTERFACE_ONLY。

类型/运算证书：未记录。

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Nat.of_hex_uint_acc.roundtrip。

陈述 iff 证书：未记录。

陈述 iff 不证明命题本身；接口往返不自动证明等于 Lean 同名运算。

## 已收录证书的实际类型

NativeBridge.Interfaces.Rocq.Corelib.Init.Nat.of_hex_uint_acc.roundtrip

```lean
(NativeBridge.hexadecimalDigitsIso.functions (NativeBridge.natIso.functions NativeBridge.natIso)).of
    ((NativeBridge.hexadecimalDigitsIso.functions (NativeBridge.natIso.functions NativeBridge.natIso)).to
      Rocq.Corelib.Init.Nat.of_hex_uint_acc) =
  Rocq.Corelib.Init.Nat.of_hex_uint_acc
```

公理依赖：['propext', 'Quot.sound']。

[对应证明说明](../CORRESPONDENCE.md)

# Corelib.Init.Nat.of_num_int

[总索引](../DECLARATIONS.md) · [源模块](../source/Nat.v) · [完整记录](Corelib.Init.Nat.of_num_int.json)

机械结果：TRANSLATED_AND_CHECKED；分派：constant/transparent；待证参数：0。

## 源端信息

源 IR 类型、正文/归纳块在同名 JSON 的 mechanical_record.source_ir；原始源码在完整 .v 中。

## Lean 实际打印结果

```lean
def Rocq.Corelib.Init.Nat.of_num_int : Rocq.Corelib.Init.Number.signed_int →
  Rocq.Corelib.Init.Datatypes.option.{1} Rocq.Corelib.Init.Datatypes.nat :=
fun d =>
  Rocq.Corelib.Init.Number.signed_int.rec.{1} (fun i => Rocq.Corelib.Init.Nat.of_int i)
    (fun i => Rocq.Corelib.Init.Nat.of_hex_int i) d
```

## 翻译过程记录

| 尝试标签 | 耗时 ms | 结果 |
|---|---|---|
| c[] | 0 | TRANSLATED_AND_CHECKED |

标签表示尝试配置；不是逐 AST 步骤日志。0 ms 是计时精度下的记录，不表示没有执行。

待证参数：[]。

完整 target_report 保留宇宙字段、目标 AST 与分支；prerequisite_declarations 保留条件声明。报告字段与开关不能直接换算为规则调用次数。源 roundtrip、consumer、audit 结果见 module_validation。

## 与原生 Lean 的对应

覆盖类别：NOT_YET_BRIDGED。

类型/运算证书：未记录。

接口往返证书：未记录。

陈述 iff 证书：未记录。

陈述 iff 不证明命题本身；接口往返不自动证明等于 Lean 同名运算。

## 已收录证书的实际类型

证书类型以复制的 audit 为准；其他证书见原实验。

[对应证明说明](../CORRESPONDENCE.md)

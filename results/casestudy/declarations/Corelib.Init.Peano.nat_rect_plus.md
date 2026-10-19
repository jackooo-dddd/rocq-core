# Corelib.Init.Peano.nat_rect_plus

[总索引](../DECLARATIONS.md) · [源模块](../source/Peano.v) · [完整记录](Corelib.Init.Peano.nat_rect_plus.json)

机械结果：STATEMENT_KERNEL_CHECKED；分派：constant/transparent；待证参数：0。

## 源端信息

源 IR 类型、正文/归纳块在同名 JSON 的 mechanical_record.source_ir；原始源码在完整 .v 中。

## Lean 实际打印结果

```lean
def Rocq.Corelib.Init.Peano.nat_rect_plus.statement.{u_Corelib_Init_Peano_98} : Prop :=
∀ (n m : Rocq.Corelib.Init.Datatypes.nat) (A : Sort u_Corelib_Init_Peano_98) (f : A → A) (x : A),
  Rocq.Corelib.Init.Logic.eq.{u_Corelib_Init_Peano_98} A
    (Rocq.Corelib.Init.Datatypes.nat_rect.{u_Corelib_Init_Peano_98} (fun n => A) x (fun n => f)
      (Rocq.Corelib.Init.Nat.add n m))
    (Rocq.Corelib.Init.Datatypes.nat_rect.{u_Corelib_Init_Peano_98} (fun n => A)
      (Rocq.Corelib.Init.Datatypes.nat_rect.{u_Corelib_Init_Peano_98} (fun n => A) x (fun n => f) m) (fun n => f) n)
```

## 翻译过程记录

| 尝试标签 | 耗时 ms | 结果 |
|---|---|---|
| c[ad] eo1 | 1 | TRANSLATED_AND_CHECKED |

标签表示尝试配置；不是逐 AST 步骤日志。0 ms 是计时精度下的记录，不表示没有执行。

待证参数：[]。

完整 target_report 保留宇宙字段、目标 AST 与分支；prerequisite_declarations 保留条件声明。报告字段与开关不能直接换算为规则调用次数。源 roundtrip、consumer、audit 结果见 module_validation。

## 与原生 Lean 的对应

覆盖类别：STATEMENT_PARTIAL。

类型/运算证书：未记录。

接口往返证书：未记录。

陈述 iff 证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.nat_rect_plus.statement.correspondence。

陈述 iff 不证明命题本身；接口往返不自动证明等于 Lean 同名运算。

原生陈述：

```lean
∀ (n n_1 : Nat) (A : Sort u_Corelib_Init_Peano_98) (f : A → A) (x : A),
  Rocq.Corelib.Init.Datatypes.nat_rect (fun n => A) x (fun n => f)
      (Rocq.Corelib.Init.Nat.add (NativeBridge.natOf n) (NativeBridge.natOf n_1)) =
    Rocq.Corelib.Init.Datatypes.nat_rect (fun n => A)
      (Rocq.Corelib.Init.Datatypes.nat_rect (fun n => A) x (fun n => f) (NativeBridge.natOf n_1)) (fun n => f)
      (NativeBridge.natOf n)
```

尚存源符号：Rocq.Corelib.Init.Datatypes.nat_rect;Rocq.Corelib.Init.Datatypes.nat;Rocq.Corelib.Init.Nat.add。

## 已收录证书的实际类型

NativeBridge.Statements.Rocq.Corelib.Init.Peano.nat_rect_plus.statement.correspondence

```lean
Rocq.Corelib.Init.Peano.nat_rect_plus.statement ↔
  NativeBridge.Statements.Rocq.Corelib.Init.Peano.nat_rect_plus.statement.native
```

公理依赖：['propext', 'Quot.sound']。

[对应证明说明](../CORRESPONDENCE.md)

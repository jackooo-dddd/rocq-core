# Corelib.Init.Peano.nat_double_ind

[总索引](../DECLARATIONS.md) · [源模块](../source/Peano.v) · [完整记录](Corelib.Init.Peano.nat_double_ind.json)

机械结果：STATEMENT_KERNEL_CHECKED；分派：constant/transparent；待证参数：0。

## 源端信息

源 IR 类型、正文/归纳块在同名 JSON 的 mechanical_record.source_ir；原始源码在完整 .v 中。

## Lean 实际打印结果

```lean
def Rocq.Corelib.Init.Peano.nat_double_ind.statement : Prop :=
∀ (R : Rocq.Corelib.Init.Datatypes.nat → Rocq.Corelib.Init.Datatypes.nat → Prop),
  (∀ (n : Rocq.Corelib.Init.Datatypes.nat), R Rocq.Corelib.Init.Datatypes.nat.O n) →
    (∀ (n : Rocq.Corelib.Init.Datatypes.nat), R n.S Rocq.Corelib.Init.Datatypes.nat.O) →
      (∀ (n m : Rocq.Corelib.Init.Datatypes.nat), R n m → R n.S m.S) → ∀ (n m : Rocq.Corelib.Init.Datatypes.nat), R n m
```

## 翻译过程记录

| 尝试标签 | 耗时 ms | 结果 |
|---|---|---|
| c[] | 0 | TRANSLATED_AND_CHECKED |

标签表示尝试配置；不是逐 AST 步骤日志。0 ms 是计时精度下的记录，不表示没有执行。

待证参数：[]。

完整 target_report 保留宇宙字段、目标 AST 与分支；prerequisite_declarations 保留条件声明。报告字段与开关不能直接换算为规则调用次数。源 roundtrip、consumer、audit 结果见 module_validation。

## 与原生 Lean 的对应

覆盖类别：STATEMENT_FULL_NATIVE。

类型/运算证书：未记录。

接口往返证书：未记录。

陈述 iff 证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.nat_double_ind.statement.correspondence。

陈述 iff 不证明命题本身；接口往返不自动证明等于 Lean 同名运算。

原生陈述：

```lean
∀ (f : Nat → Nat → Prop),
  (∀ (n : Nat), f 0 n) →
    (∀ (n : Nat), f n.succ 0) → (∀ (n n_1 : Nat), f n n_1 → f n.succ n_1.succ) → ∀ (n n_1 : Nat), f n n_1
```

## 已收录证书的实际类型

NativeBridge.Statements.Rocq.Corelib.Init.Peano.nat_double_ind.statement.correspondence

```lean
Rocq.Corelib.Init.Peano.nat_double_ind.statement ↔
  NativeBridge.Statements.Rocq.Corelib.Init.Peano.nat_double_ind.statement.native
```

公理依赖：['propext', 'Quot.sound']。

[对应证明说明](../CORRESPONDENCE.md)

# Corelib.Classes.Morphisms_Prop

每项对应机械翻译基线中的一个 root。完整 native statement / interface 类型在总 JSON 文件中。



## Corelib.Classes.Morphisms_Prop.Acc_pt_morphism

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Morphisms_Prop.Acc_pt_morphism.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.Acc_pt_morphism.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_Prop_34) (E R : A → A → Prop),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A E →
    (∀ (x y : A), E x y → ∀ (x_1 y_1 : A), E x_1 y_1 → (R x x_1 → R y y_1) ∧ (R y y_1 → R x x_1)) →
      ∀ (x y : A),
        E x y →
          (Rocq.Corelib.Init.Wf.Acc A R x → Rocq.Corelib.Init.Wf.Acc A R y) ∧
            (Rocq.Corelib.Init.Wf.Acc A R y → Rocq.Corelib.Init.Wf.Acc A R x)
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Init.Wf.Acc

## Corelib.Classes.Morphisms_Prop.Acc_rel_morphism

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Morphisms_Prop.Acc_rel_morphism.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.Acc_rel_morphism.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_Prop_36) (x y : A → A → Prop),
  (∀ (x_1 x_2 : A), x x_1 x_2 ↔ y x_1 x_2) →
    ∀ (x_1 y_1 : A),
      x_1 = y_1 →
        (Rocq.Corelib.Init.Wf.Acc A x x_1 → Rocq.Corelib.Init.Wf.Acc A y y_1) ∧
          (Rocq.Corelib.Init.Wf.Acc A y y_1 → Rocq.Corelib.Init.Wf.Acc A x x_1)
```

残留源符号：Rocq.Corelib.Init.Wf.Acc

## Corelib.Classes.Morphisms_Prop.all_flip_impl_morphism

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Classes.Morphisms_Prop.all_flip_impl_morphism.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.all_flip_impl_morphism.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_Prop_33) (x y : A → Prop),
  (∀ (a : A), y a → x a) → (∀ (x : A), y x) → ∀ (x_1 : A), x x_1
```

## Corelib.Classes.Morphisms_Prop.all_flip_impl_morphism_obligation_1

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Classes.Morphisms_Prop.all_flip_impl_morphism_obligation_1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.all_flip_impl_morphism_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_Prop_33) (x y : A → Prop),
  (∀ (a : A), y a → x a) → (∀ (x : A), y x) → ∀ (x_1 : A), x x_1
```

## Corelib.Classes.Morphisms_Prop.all_iff_morphism

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Classes.Morphisms_Prop.all_iff_morphism.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.all_iff_morphism.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_Prop_31) (x y : A → Prop),
  (∀ (a : A), (x a → y a) ∧ (y a → x a)) →
    ((∀ (x_1 : A), x x_1) → ∀ (x : A), y x) ∧ ((∀ (x : A), y x) → ∀ (x_1 : A), x x_1)
```

## Corelib.Classes.Morphisms_Prop.all_iff_morphism_obligation_1

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Classes.Morphisms_Prop.all_iff_morphism_obligation_1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.all_iff_morphism_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_Prop_31) (x y : A → Prop),
  (∀ (a : A), (x a → y a) ∧ (y a → x a)) →
    ((∀ (x_1 : A), x x_1) → ∀ (x : A), y x) ∧ ((∀ (x : A), y x) → ∀ (x_1 : A), x x_1)
```

## Corelib.Classes.Morphisms_Prop.all_impl_morphism

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Classes.Morphisms_Prop.all_impl_morphism.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.all_impl_morphism.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_Prop_32) (x y : A → Prop),
  (∀ (a : A), x a → y a) → (∀ (x_1 : A), x x_1) → ∀ (x : A), y x
```

## Corelib.Classes.Morphisms_Prop.all_impl_morphism_obligation_1

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Classes.Morphisms_Prop.all_impl_morphism_obligation_1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.all_impl_morphism_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_Prop_32) (x y : A → Prop),
  (∀ (a : A), x a → y a) → (∀ (x_1 : A), x x_1) → ∀ (x : A), y x
```

## Corelib.Classes.Morphisms_Prop.and_iff_morphism

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Morphisms_Prop.and_iff_morphism.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.and_iff_morphism.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.Proper (Prop → Prop → Prop)
  (Rocq.Corelib.Classes.Morphisms.respectful Prop (Prop → Prop) Rocq.Corelib.Init.Logic.iff
    (Rocq.Corelib.Classes.Morphisms.respectful Prop Prop Rocq.Corelib.Init.Logic.iff Rocq.Corelib.Init.Logic.iff))
  Rocq.Corelib.Init.Logic.and
```

残留源符号：Rocq.Corelib.Classes.Morphisms.Proper;Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Init.Logic.iff;Rocq.Corelib.Init.Logic.and

## Corelib.Classes.Morphisms_Prop.and_iff_morphism_obligation_1

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Morphisms_Prop.and_iff_morphism_obligation_1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.and_iff_morphism_obligation_1.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.respectful Prop (Prop → Prop) Rocq.Corelib.Init.Logic.iff
  (Rocq.Corelib.Classes.Morphisms.respectful Prop Prop Rocq.Corelib.Init.Logic.iff Rocq.Corelib.Init.Logic.iff)
  Rocq.Corelib.Init.Logic.and Rocq.Corelib.Init.Logic.and
```

残留源符号：Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Init.Logic.iff;Rocq.Corelib.Init.Logic.and

## Corelib.Classes.Morphisms_Prop.and_impl_morphism

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Morphisms_Prop.and_impl_morphism.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.and_impl_morphism.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.Proper (Prop → Prop → Prop)
  (Rocq.Corelib.Classes.Morphisms.respectful Prop (Prop → Prop) Rocq.Corelib.Program.Basics.impl
    (Rocq.Corelib.Classes.Morphisms.respectful Prop Prop Rocq.Corelib.Program.Basics.impl
      Rocq.Corelib.Program.Basics.impl))
  Rocq.Corelib.Init.Logic.and
```

残留源符号：Rocq.Corelib.Classes.Morphisms.Proper;Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Program.Basics.impl;Rocq.Corelib.Init.Logic.and

## Corelib.Classes.Morphisms_Prop.and_impl_morphism_obligation_1

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Morphisms_Prop.and_impl_morphism_obligation_1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.and_impl_morphism_obligation_1.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.respectful Prop (Prop → Prop) Rocq.Corelib.Program.Basics.impl
  (Rocq.Corelib.Classes.Morphisms.respectful Prop Prop Rocq.Corelib.Program.Basics.impl
    Rocq.Corelib.Program.Basics.impl)
  Rocq.Corelib.Init.Logic.and Rocq.Corelib.Init.Logic.and
```

残留源符号：Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Program.Basics.impl;Rocq.Corelib.Init.Logic.and

## Corelib.Classes.Morphisms_Prop.ex_flip_impl_morphism

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Classes.Morphisms_Prop.ex_flip_impl_morphism.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.ex_flip_impl_morphism.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_Prop_28) (x y : A → Prop), (∀ (a : A), y a → x a) → (∃ x, y x) → ∃ x_1, x x_1
```

## Corelib.Classes.Morphisms_Prop.ex_flip_impl_morphism_obligation_1

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Classes.Morphisms_Prop.ex_flip_impl_morphism_obligation_1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.ex_flip_impl_morphism_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_Prop_28) (x y : A → Prop), (∀ (a : A), y a → x a) → (∃ x, y x) → ∃ x_1, x x_1
```

## Corelib.Classes.Morphisms_Prop.ex_iff_morphism

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Classes.Morphisms_Prop.ex_iff_morphism.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.ex_iff_morphism.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_Prop_21) (x y : A → Prop),
  (∀ (a : A), (x a → y a) ∧ (y a → x a)) → ((∃ x_1, x x_1) → ∃ x, y x) ∧ ((∃ x, y x) → ∃ x_1, x x_1)
```

## Corelib.Classes.Morphisms_Prop.ex_iff_morphism_obligation_1

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Classes.Morphisms_Prop.ex_iff_morphism_obligation_1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.ex_iff_morphism_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_Prop_21) (x y : A → Prop),
  (∀ (a : A), (x a → y a) ∧ (y a → x a)) → ((∃ x_1, x x_1) → ∃ x, y x) ∧ ((∃ x, y x) → ∃ x_1, x x_1)
```

## Corelib.Classes.Morphisms_Prop.ex_impl_morphism

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Classes.Morphisms_Prop.ex_impl_morphism.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.ex_impl_morphism.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_Prop_25) (x y : A → Prop), (∀ (a : A), x a → y a) → (∃ x_1, x x_1) → ∃ x, y x
```

## Corelib.Classes.Morphisms_Prop.ex_impl_morphism_obligation_1

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Classes.Morphisms_Prop.ex_impl_morphism_obligation_1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.ex_impl_morphism_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_Prop_25) (x y : A → Prop), (∀ (a : A), x a → y a) → (∃ x_1, x x_1) → ∃ x, y x
```

## Corelib.Classes.Morphisms_Prop.iff_iff_iff_impl_morphism

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Morphisms_Prop.iff_iff_iff_impl_morphism.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.iff_iff_iff_impl_morphism.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.Proper (Prop → Prop → Prop)
  (Rocq.Corelib.Classes.Morphisms.respectful Prop (Prop → Prop) Rocq.Corelib.Init.Logic.iff
    (Rocq.Corelib.Classes.Morphisms.respectful Prop Prop Rocq.Corelib.Init.Logic.iff Rocq.Corelib.Init.Logic.iff))
  Rocq.Corelib.Program.Basics.impl
```

残留源符号：Rocq.Corelib.Classes.Morphisms.Proper;Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Init.Logic.iff;Rocq.Corelib.Program.Basics.impl

## Corelib.Classes.Morphisms_Prop.iff_iff_iff_impl_morphism_obligation_1

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Morphisms_Prop.iff_iff_iff_impl_morphism_obligation_1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.iff_iff_iff_impl_morphism_obligation_1.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.respectful Prop (Prop → Prop) Rocq.Corelib.Init.Logic.iff
  (Rocq.Corelib.Classes.Morphisms.respectful Prop Prop Rocq.Corelib.Init.Logic.iff Rocq.Corelib.Init.Logic.iff)
  Rocq.Corelib.Program.Basics.impl Rocq.Corelib.Program.Basics.impl
```

残留源符号：Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Init.Logic.iff;Rocq.Corelib.Program.Basics.impl

## Corelib.Classes.Morphisms_Prop.not_iff_morphism

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Morphisms_Prop.not_iff_morphism.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.not_iff_morphism.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.Proper (Prop → Prop)
  (Rocq.Corelib.Classes.Morphisms.respectful Prop Prop Rocq.Corelib.Init.Logic.iff Rocq.Corelib.Init.Logic.iff)
  Rocq.Corelib.Init.Logic.not
```

残留源符号：Rocq.Corelib.Classes.Morphisms.Proper;Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Init.Logic.iff;Rocq.Corelib.Init.Logic.not

## Corelib.Classes.Morphisms_Prop.not_iff_morphism_obligation_1

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Morphisms_Prop.not_iff_morphism_obligation_1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.not_iff_morphism_obligation_1.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.respectful Prop Prop Rocq.Corelib.Init.Logic.iff Rocq.Corelib.Init.Logic.iff
  Rocq.Corelib.Init.Logic.not Rocq.Corelib.Init.Logic.not
```

残留源符号：Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Init.Logic.iff;Rocq.Corelib.Init.Logic.not

## Corelib.Classes.Morphisms_Prop.not_impl_morphism

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Morphisms_Prop.not_impl_morphism.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.not_impl_morphism.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.Proper (Prop → Prop)
  (Rocq.Corelib.Classes.Morphisms.respectful Prop Prop
    (Rocq.Corelib.Program.Basics.flip Prop Prop Prop Rocq.Corelib.Program.Basics.impl) Rocq.Corelib.Program.Basics.impl)
  Rocq.Corelib.Init.Logic.not
```

残留源符号：Rocq.Corelib.Classes.Morphisms.Proper;Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Program.Basics.flip;Rocq.Corelib.Program.Basics.impl;Rocq.Corelib.Init.Logic.not

## Corelib.Classes.Morphisms_Prop.not_impl_morphism_obligation_1

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Morphisms_Prop.not_impl_morphism_obligation_1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.not_impl_morphism_obligation_1.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.respectful Prop Prop
  (Rocq.Corelib.Program.Basics.flip Prop Prop Prop Rocq.Corelib.Program.Basics.impl) Rocq.Corelib.Program.Basics.impl
  Rocq.Corelib.Init.Logic.not Rocq.Corelib.Init.Logic.not
```

残留源符号：Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Program.Basics.flip;Rocq.Corelib.Program.Basics.impl;Rocq.Corelib.Init.Logic.not

## Corelib.Classes.Morphisms_Prop.or_iff_morphism

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Morphisms_Prop.or_iff_morphism.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.or_iff_morphism.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.Proper (Prop → Prop → Prop)
  (Rocq.Corelib.Classes.Morphisms.respectful Prop (Prop → Prop) Rocq.Corelib.Init.Logic.iff
    (Rocq.Corelib.Classes.Morphisms.respectful Prop Prop Rocq.Corelib.Init.Logic.iff Rocq.Corelib.Init.Logic.iff))
  Rocq.Corelib.Init.Logic.or
```

残留源符号：Rocq.Corelib.Classes.Morphisms.Proper;Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Init.Logic.iff;Rocq.Corelib.Init.Logic.or

## Corelib.Classes.Morphisms_Prop.or_iff_morphism_obligation_1

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Morphisms_Prop.or_iff_morphism_obligation_1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.or_iff_morphism_obligation_1.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.respectful Prop (Prop → Prop) Rocq.Corelib.Init.Logic.iff
  (Rocq.Corelib.Classes.Morphisms.respectful Prop Prop Rocq.Corelib.Init.Logic.iff Rocq.Corelib.Init.Logic.iff)
  Rocq.Corelib.Init.Logic.or Rocq.Corelib.Init.Logic.or
```

残留源符号：Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Init.Logic.iff;Rocq.Corelib.Init.Logic.or

## Corelib.Classes.Morphisms_Prop.or_impl_morphism

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Morphisms_Prop.or_impl_morphism.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.or_impl_morphism.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.Proper (Prop → Prop → Prop)
  (Rocq.Corelib.Classes.Morphisms.respectful Prop (Prop → Prop) Rocq.Corelib.Program.Basics.impl
    (Rocq.Corelib.Classes.Morphisms.respectful Prop Prop Rocq.Corelib.Program.Basics.impl
      Rocq.Corelib.Program.Basics.impl))
  Rocq.Corelib.Init.Logic.or
```

残留源符号：Rocq.Corelib.Classes.Morphisms.Proper;Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Program.Basics.impl;Rocq.Corelib.Init.Logic.or

## Corelib.Classes.Morphisms_Prop.or_impl_morphism_obligation_1

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Morphisms_Prop.or_impl_morphism_obligation_1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.or_impl_morphism_obligation_1.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.respectful Prop (Prop → Prop) Rocq.Corelib.Program.Basics.impl
  (Rocq.Corelib.Classes.Morphisms.respectful Prop Prop Rocq.Corelib.Program.Basics.impl
    Rocq.Corelib.Program.Basics.impl)
  Rocq.Corelib.Init.Logic.or Rocq.Corelib.Init.Logic.or
```

残留源符号：Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Program.Basics.impl;Rocq.Corelib.Init.Logic.or

## Corelib.Classes.Morphisms_Prop.well_founded_morphism

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Morphisms_Prop.well_founded_morphism.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.well_founded_morphism.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_Prop_39) (x y : A → A → Prop),
  (∀ (x_1 x_2 : A), x x_1 x_2 ↔ y x_1 x_2) →
    ((∀ (a : A), Rocq.Corelib.Init.Wf.Acc A x a) → ∀ (a : A), Rocq.Corelib.Init.Wf.Acc A y a) ∧
      ((∀ (a : A), Rocq.Corelib.Init.Wf.Acc A y a) → ∀ (a : A), Rocq.Corelib.Init.Wf.Acc A x a)
```

残留源符号：Rocq.Corelib.Init.Wf.Acc
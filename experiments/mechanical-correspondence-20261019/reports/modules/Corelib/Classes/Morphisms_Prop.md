# Corelib.Classes.Morphisms_Prop

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.Classes.Morphisms_Prop.Acc_pt_morphism

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms_Prop.Acc_pt_morphism.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.Acc_pt_morphism.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_Prop_34) (E R : A → A → Prop),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A E →
    (∀ (x y : A), E x y → ∀ (x_1 y_1 : A), E x_1 y_1 → (R x x_1 → R y y_1) ∧ (R y y_1 → R x x_1)) →
      ∀ (x y : A),
        E x y →
          (Rocq.Corelib.Init.Wf.Acc A R x → Rocq.Corelib.Init.Wf.Acc A R y) ∧
            (Rocq.Corelib.Init.Wf.Acc A R y → Rocq.Corelib.Init.Wf.Acc A R x)
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Init.Wf.Acc

## Corelib.Classes.Morphisms_Prop.Acc_rel_morphism

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms_Prop.Acc_rel_morphism.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.Acc_rel_morphism.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_Prop_36) (x y : A → A → Prop),
  (∀ (x_1 x_2 : A), x x_1 x_2 ↔ y x_1 x_2) →
    ∀ (x_1 y_1 : A),
      x_1 = y_1 →
        (Rocq.Corelib.Init.Wf.Acc A x x_1 → Rocq.Corelib.Init.Wf.Acc A y y_1) ∧
          (Rocq.Corelib.Init.Wf.Acc A y y_1 → Rocq.Corelib.Init.Wf.Acc A x x_1)
```

Residual source symbols: Rocq.Corelib.Init.Wf.Acc

## Corelib.Classes.Morphisms_Prop.all_flip_impl_morphism

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms_Prop.all_flip_impl_morphism.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.all_flip_impl_morphism.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_Prop_33) (x y : A → Prop),
  (∀ (a : A), y a → x a) → (∀ (x : A), y x) → ∀ (x_1 : A), x x_1
```

## Corelib.Classes.Morphisms_Prop.all_flip_impl_morphism_obligation_1

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms_Prop.all_flip_impl_morphism_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.all_flip_impl_morphism_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_Prop_33) (x y : A → Prop),
  (∀ (a : A), y a → x a) → (∀ (x : A), y x) → ∀ (x_1 : A), x x_1
```

## Corelib.Classes.Morphisms_Prop.all_iff_morphism

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms_Prop.all_iff_morphism.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.all_iff_morphism.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_Prop_31) (x y : A → Prop),
  (∀ (a : A), (x a → y a) ∧ (y a → x a)) →
    ((∀ (x_1 : A), x x_1) → ∀ (x : A), y x) ∧ ((∀ (x : A), y x) → ∀ (x_1 : A), x x_1)
```

## Corelib.Classes.Morphisms_Prop.all_iff_morphism_obligation_1

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms_Prop.all_iff_morphism_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.all_iff_morphism_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_Prop_31) (x y : A → Prop),
  (∀ (a : A), (x a → y a) ∧ (y a → x a)) →
    ((∀ (x_1 : A), x x_1) → ∀ (x : A), y x) ∧ ((∀ (x : A), y x) → ∀ (x_1 : A), x x_1)
```

## Corelib.Classes.Morphisms_Prop.all_impl_morphism

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms_Prop.all_impl_morphism.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.all_impl_morphism.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_Prop_32) (x y : A → Prop),
  (∀ (a : A), x a → y a) → (∀ (x_1 : A), x x_1) → ∀ (x : A), y x
```

## Corelib.Classes.Morphisms_Prop.all_impl_morphism_obligation_1

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms_Prop.all_impl_morphism_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.all_impl_morphism_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_Prop_32) (x y : A → Prop),
  (∀ (a : A), x a → y a) → (∀ (x_1 : A), x x_1) → ∀ (x : A), y x
```

## Corelib.Classes.Morphisms_Prop.and_iff_morphism

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms_Prop.and_iff_morphism.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.and_iff_morphism.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.Proper (Prop → Prop → Prop)
  (Rocq.Corelib.Classes.Morphisms.respectful Prop (Prop → Prop) Rocq.Corelib.Init.Logic.iff
    (Rocq.Corelib.Classes.Morphisms.respectful Prop Prop Rocq.Corelib.Init.Logic.iff Rocq.Corelib.Init.Logic.iff))
  Rocq.Corelib.Init.Logic.and
```

Residual source symbols: Rocq.Corelib.Classes.Morphisms.Proper;Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Init.Logic.iff;Rocq.Corelib.Init.Logic.and

## Corelib.Classes.Morphisms_Prop.and_iff_morphism_obligation_1

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms_Prop.and_iff_morphism_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.and_iff_morphism_obligation_1.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.respectful Prop (Prop → Prop) Rocq.Corelib.Init.Logic.iff
  (Rocq.Corelib.Classes.Morphisms.respectful Prop Prop Rocq.Corelib.Init.Logic.iff Rocq.Corelib.Init.Logic.iff)
  Rocq.Corelib.Init.Logic.and Rocq.Corelib.Init.Logic.and
```

Residual source symbols: Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Init.Logic.iff;Rocq.Corelib.Init.Logic.and

## Corelib.Classes.Morphisms_Prop.and_impl_morphism

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms_Prop.and_impl_morphism.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.and_impl_morphism.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.Proper (Prop → Prop → Prop)
  (Rocq.Corelib.Classes.Morphisms.respectful Prop (Prop → Prop) Rocq.Corelib.Program.Basics.impl
    (Rocq.Corelib.Classes.Morphisms.respectful Prop Prop Rocq.Corelib.Program.Basics.impl
      Rocq.Corelib.Program.Basics.impl))
  Rocq.Corelib.Init.Logic.and
```

Residual source symbols: Rocq.Corelib.Classes.Morphisms.Proper;Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Program.Basics.impl;Rocq.Corelib.Init.Logic.and

## Corelib.Classes.Morphisms_Prop.and_impl_morphism_obligation_1

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms_Prop.and_impl_morphism_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.and_impl_morphism_obligation_1.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.respectful Prop (Prop → Prop) Rocq.Corelib.Program.Basics.impl
  (Rocq.Corelib.Classes.Morphisms.respectful Prop Prop Rocq.Corelib.Program.Basics.impl
    Rocq.Corelib.Program.Basics.impl)
  Rocq.Corelib.Init.Logic.and Rocq.Corelib.Init.Logic.and
```

Residual source symbols: Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Program.Basics.impl;Rocq.Corelib.Init.Logic.and

## Corelib.Classes.Morphisms_Prop.ex_flip_impl_morphism

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms_Prop.ex_flip_impl_morphism.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.ex_flip_impl_morphism.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_Prop_28) (x y : A → Prop), (∀ (a : A), y a → x a) → (∃ x, y x) → ∃ x_1, x x_1
```

## Corelib.Classes.Morphisms_Prop.ex_flip_impl_morphism_obligation_1

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms_Prop.ex_flip_impl_morphism_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.ex_flip_impl_morphism_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_Prop_28) (x y : A → Prop), (∀ (a : A), y a → x a) → (∃ x, y x) → ∃ x_1, x x_1
```

## Corelib.Classes.Morphisms_Prop.ex_iff_morphism

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms_Prop.ex_iff_morphism.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.ex_iff_morphism.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_Prop_21) (x y : A → Prop),
  (∀ (a : A), (x a → y a) ∧ (y a → x a)) → ((∃ x_1, x x_1) → ∃ x, y x) ∧ ((∃ x, y x) → ∃ x_1, x x_1)
```

## Corelib.Classes.Morphisms_Prop.ex_iff_morphism_obligation_1

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms_Prop.ex_iff_morphism_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.ex_iff_morphism_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_Prop_21) (x y : A → Prop),
  (∀ (a : A), (x a → y a) ∧ (y a → x a)) → ((∃ x_1, x x_1) → ∃ x, y x) ∧ ((∃ x, y x) → ∃ x_1, x x_1)
```

## Corelib.Classes.Morphisms_Prop.ex_impl_morphism

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms_Prop.ex_impl_morphism.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.ex_impl_morphism.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_Prop_25) (x y : A → Prop), (∀ (a : A), x a → y a) → (∃ x_1, x x_1) → ∃ x, y x
```

## Corelib.Classes.Morphisms_Prop.ex_impl_morphism_obligation_1

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms_Prop.ex_impl_morphism_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.ex_impl_morphism_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_Prop_25) (x y : A → Prop), (∀ (a : A), x a → y a) → (∃ x_1, x x_1) → ∃ x, y x
```

## Corelib.Classes.Morphisms_Prop.iff_iff_iff_impl_morphism

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms_Prop.iff_iff_iff_impl_morphism.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.iff_iff_iff_impl_morphism.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.Proper (Prop → Prop → Prop)
  (Rocq.Corelib.Classes.Morphisms.respectful Prop (Prop → Prop) Rocq.Corelib.Init.Logic.iff
    (Rocq.Corelib.Classes.Morphisms.respectful Prop Prop Rocq.Corelib.Init.Logic.iff Rocq.Corelib.Init.Logic.iff))
  Rocq.Corelib.Program.Basics.impl
```

Residual source symbols: Rocq.Corelib.Classes.Morphisms.Proper;Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Init.Logic.iff;Rocq.Corelib.Program.Basics.impl

## Corelib.Classes.Morphisms_Prop.iff_iff_iff_impl_morphism_obligation_1

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms_Prop.iff_iff_iff_impl_morphism_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.iff_iff_iff_impl_morphism_obligation_1.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.respectful Prop (Prop → Prop) Rocq.Corelib.Init.Logic.iff
  (Rocq.Corelib.Classes.Morphisms.respectful Prop Prop Rocq.Corelib.Init.Logic.iff Rocq.Corelib.Init.Logic.iff)
  Rocq.Corelib.Program.Basics.impl Rocq.Corelib.Program.Basics.impl
```

Residual source symbols: Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Init.Logic.iff;Rocq.Corelib.Program.Basics.impl

## Corelib.Classes.Morphisms_Prop.not_iff_morphism

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms_Prop.not_iff_morphism.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.not_iff_morphism.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.Proper (Prop → Prop)
  (Rocq.Corelib.Classes.Morphisms.respectful Prop Prop Rocq.Corelib.Init.Logic.iff Rocq.Corelib.Init.Logic.iff)
  Rocq.Corelib.Init.Logic.not
```

Residual source symbols: Rocq.Corelib.Classes.Morphisms.Proper;Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Init.Logic.iff;Rocq.Corelib.Init.Logic.not

## Corelib.Classes.Morphisms_Prop.not_iff_morphism_obligation_1

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms_Prop.not_iff_morphism_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.not_iff_morphism_obligation_1.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.respectful Prop Prop Rocq.Corelib.Init.Logic.iff Rocq.Corelib.Init.Logic.iff
  Rocq.Corelib.Init.Logic.not Rocq.Corelib.Init.Logic.not
```

Residual source symbols: Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Init.Logic.iff;Rocq.Corelib.Init.Logic.not

## Corelib.Classes.Morphisms_Prop.not_impl_morphism

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms_Prop.not_impl_morphism.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.not_impl_morphism.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.Proper (Prop → Prop)
  (Rocq.Corelib.Classes.Morphisms.respectful Prop Prop
    (Rocq.Corelib.Program.Basics.flip Prop Prop Prop Rocq.Corelib.Program.Basics.impl) Rocq.Corelib.Program.Basics.impl)
  Rocq.Corelib.Init.Logic.not
```

Residual source symbols: Rocq.Corelib.Classes.Morphisms.Proper;Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Program.Basics.flip;Rocq.Corelib.Program.Basics.impl;Rocq.Corelib.Init.Logic.not

## Corelib.Classes.Morphisms_Prop.not_impl_morphism_obligation_1

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms_Prop.not_impl_morphism_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.not_impl_morphism_obligation_1.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.respectful Prop Prop
  (Rocq.Corelib.Program.Basics.flip Prop Prop Prop Rocq.Corelib.Program.Basics.impl) Rocq.Corelib.Program.Basics.impl
  Rocq.Corelib.Init.Logic.not Rocq.Corelib.Init.Logic.not
```

Residual source symbols: Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Program.Basics.flip;Rocq.Corelib.Program.Basics.impl;Rocq.Corelib.Init.Logic.not

## Corelib.Classes.Morphisms_Prop.or_iff_morphism

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms_Prop.or_iff_morphism.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.or_iff_morphism.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.Proper (Prop → Prop → Prop)
  (Rocq.Corelib.Classes.Morphisms.respectful Prop (Prop → Prop) Rocq.Corelib.Init.Logic.iff
    (Rocq.Corelib.Classes.Morphisms.respectful Prop Prop Rocq.Corelib.Init.Logic.iff Rocq.Corelib.Init.Logic.iff))
  Rocq.Corelib.Init.Logic.or
```

Residual source symbols: Rocq.Corelib.Classes.Morphisms.Proper;Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Init.Logic.iff;Rocq.Corelib.Init.Logic.or

## Corelib.Classes.Morphisms_Prop.or_iff_morphism_obligation_1

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms_Prop.or_iff_morphism_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.or_iff_morphism_obligation_1.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.respectful Prop (Prop → Prop) Rocq.Corelib.Init.Logic.iff
  (Rocq.Corelib.Classes.Morphisms.respectful Prop Prop Rocq.Corelib.Init.Logic.iff Rocq.Corelib.Init.Logic.iff)
  Rocq.Corelib.Init.Logic.or Rocq.Corelib.Init.Logic.or
```

Residual source symbols: Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Init.Logic.iff;Rocq.Corelib.Init.Logic.or

## Corelib.Classes.Morphisms_Prop.or_impl_morphism

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms_Prop.or_impl_morphism.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.or_impl_morphism.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.Proper (Prop → Prop → Prop)
  (Rocq.Corelib.Classes.Morphisms.respectful Prop (Prop → Prop) Rocq.Corelib.Program.Basics.impl
    (Rocq.Corelib.Classes.Morphisms.respectful Prop Prop Rocq.Corelib.Program.Basics.impl
      Rocq.Corelib.Program.Basics.impl))
  Rocq.Corelib.Init.Logic.or
```

Residual source symbols: Rocq.Corelib.Classes.Morphisms.Proper;Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Program.Basics.impl;Rocq.Corelib.Init.Logic.or

## Corelib.Classes.Morphisms_Prop.or_impl_morphism_obligation_1

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms_Prop.or_impl_morphism_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.or_impl_morphism_obligation_1.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.respectful Prop (Prop → Prop) Rocq.Corelib.Program.Basics.impl
  (Rocq.Corelib.Classes.Morphisms.respectful Prop Prop Rocq.Corelib.Program.Basics.impl
    Rocq.Corelib.Program.Basics.impl)
  Rocq.Corelib.Init.Logic.or Rocq.Corelib.Init.Logic.or
```

Residual source symbols: Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Program.Basics.impl;Rocq.Corelib.Init.Logic.or

## Corelib.Classes.Morphisms_Prop.well_founded_morphism

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms_Prop.well_founded_morphism.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms_Prop.well_founded_morphism.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_Prop_39) (x y : A → A → Prop),
  (∀ (x_1 x_2 : A), x x_1 x_2 ↔ y x_1 x_2) →
    ((∀ (a : A), Rocq.Corelib.Init.Wf.Acc A x a) → ∀ (a : A), Rocq.Corelib.Init.Wf.Acc A y a) ∧
      ((∀ (a : A), Rocq.Corelib.Init.Wf.Acc A y a) → ∀ (a : A), Rocq.Corelib.Init.Wf.Acc A x a)
```

Residual source symbols: Rocq.Corelib.Init.Wf.Acc
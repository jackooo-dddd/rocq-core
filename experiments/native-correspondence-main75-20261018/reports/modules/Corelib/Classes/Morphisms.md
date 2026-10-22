# Corelib.Classes.Morphisms

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.Classes.Morphisms.Normalizes

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Classes.Morphisms.Normalizes

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Classes.Morphisms.Normalizes.roundtrip

## Corelib.Classes.Morphisms.PER_morphism

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.PER_morphism.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.PER_morphism.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_77) (R : A → A → Prop),
  Rocq.Corelib.Classes.RelationClasses.PER A R →
    ∀ (x y : A), R x y → ∀ (x_1 y_1 : A), R x_1 y_1 → (R x x_1 → R y y_1) ∧ (R y y_1 → R x x_1)
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.PER

## Corelib.Classes.Morphisms.PER_morphism_obligation_1

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.PER_morphism_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.PER_morphism_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_77) (R : A → A → Prop),
  Rocq.Corelib.Classes.RelationClasses.PER A R →
    ∀ (x y : A), R x y → ∀ (x_1 y_1 : A), R x_1 y_1 → (R x x_1 → R y y_1) ∧ (R y y_1 → R x x_1)
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.PER

## Corelib.Classes.Morphisms.Params

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.Morphisms.Params

## Corelib.Classes.Morphisms.PartialApplication

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.Morphisms.PartialApplication

## Corelib.Classes.Morphisms.PartialOrder_StrictOrder

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.PartialOrder_StrictOrder.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.PartialOrder_StrictOrder.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (eqA : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (equ : Rocq.Corelib.Classes.RelationClasses.Equivalence A eqA)
  (R : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (preo : Rocq.Corelib.Classes.RelationClasses.PreOrder A R),
  Rocq.Corelib.Classes.RelationClasses.PartialOrder A eqA equ R preo →
    Rocq.Corelib.Classes.RelationClasses.StrictOrder A
      (Rocq.Corelib.Classes.RelationClasses.relation_conjunction A R
        (Rocq.Corelib.Classes.RelationClasses.complement A eqA))
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.PreOrder;Rocq.Corelib.Classes.RelationClasses.PartialOrder;Rocq.Corelib.Classes.RelationClasses.StrictOrder;Rocq.Corelib.Classes.RelationClasses.relation_conjunction;Rocq.Corelib.Classes.RelationClasses.complement

## Corelib.Classes.Morphisms.PartialOrder_proper

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.PartialOrder_proper.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.PartialOrder_proper.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_183) (eqA : A → A → Prop),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A eqA →
    ∀ (R : A → A → Prop),
      Rocq.Corelib.Classes.RelationClasses.PreOrder A R →
        (∀ (x x_1 : A), eqA x x_1 ↔ R x x_1 ∧ R x_1 x) →
          ∀ (x y : A), eqA x y → ∀ (x_1 y_1 : A), eqA x_1 y_1 → (R x x_1 → R y y_1) ∧ (R y y_1 → R x x_1)
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.PreOrder

## Corelib.Classes.Morphisms.Proper

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Classes.Morphisms.Proper

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Classes.Morphisms.Proper.roundtrip

## Corelib.Classes.Morphisms.ProperProxy

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Classes.Morphisms.ProperProxy

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Classes.Morphisms.ProperProxy.roundtrip

## Corelib.Classes.Morphisms.ReflexiveProxy

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Classes.Morphisms.ReflexiveProxy

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Classes.Morphisms.ReflexiveProxy.roundtrip

## Corelib.Classes.Morphisms.Reflexive_partial_app_morphism

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.Reflexive_partial_app_morphism.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.Reflexive_partial_app_morphism.statement.correspondence

```lean
∀ (A B : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (R' : Rocq.Corelib.Relations.Relation_Definitions.relation B) (m : A → B),
  Rocq.Corelib.Classes.Morphisms.Proper (A → B) (Rocq.Corelib.Classes.Morphisms.respectful A B R R') m →
    ∀ (x : A), Rocq.Corelib.Classes.Morphisms.ProperProxy A R x → Rocq.Corelib.Classes.Morphisms.Proper B R' (m x)
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.Morphisms.Proper;Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Classes.Morphisms.ProperProxy

## Corelib.Classes.Morphisms.StrictOrder_PartialOrder

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.StrictOrder_PartialOrder.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.StrictOrder_PartialOrder.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_196) (eqA : A → A → Prop),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A eqA →
    ∀ (R : A → A → Prop),
      Rocq.Corelib.Classes.RelationClasses.StrictOrder A R →
        (∀ (x y : A), eqA x y → ∀ (x_1 y_1 : A), eqA x_1 y_1 → (R x x_1 → R y y_1) ∧ (R y y_1 → R x x_1)) →
          ∀ (x x_1 : A), eqA x x_1 ↔ (R x x_1 ∨ eqA x x_1) ∧ (R x_1 x ∨ eqA x_1 x)
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.StrictOrder

## Corelib.Classes.Morphisms.StrictOrder_PreOrder

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.StrictOrder_PreOrder.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.StrictOrder_PreOrder.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_192) (eqA : A → A → Prop),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A eqA →
    ∀ (R : A → A → Prop),
      Rocq.Corelib.Classes.RelationClasses.StrictOrder A R →
        (∀ (x y : A), eqA x y → ∀ (x_1 y_1 : A), eqA x_1 y_1 → (R x x_1 → R y y_1) ∧ (R y y_1 → R x x_1)) →
          Rocq.Corelib.Classes.RelationClasses.PreOrder A fun x x_1 => R x x_1 ∨ eqA x x_1
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.StrictOrder;Rocq.Corelib.Classes.RelationClasses.PreOrder

## Corelib.Classes.Morphisms.apply_subrelation

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.Morphisms.apply_subrelation

## Corelib.Classes.Morphisms.complement_proper

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms.complement_proper.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.complement_proper.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_77) (RA R : A → A → Prop),
  (∀ (x y : A), RA x y → ∀ (x_1 y_1 : A), RA x_1 y_1 → (R x x_1 → R y y_1) ∧ (R y y_1 → R x x_1)) →
    ∀ (x y : A),
      RA x y →
        ∀ (x_1 y_1 : A), RA x_1 y_1 → ((R x x_1 → False) → R y y_1 → False) ∧ ((R y y_1 → False) → R x x_1 → False)
```

## Corelib.Classes.Morphisms.complement_proper_obligation_1

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms.complement_proper_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.complement_proper_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_77) (RA R : A → A → Prop),
  (∀ (x y : A), RA x y → ∀ (x_1 y_1 : A), RA x_1 y_1 → (R x x_1 → R y y_1) ∧ (R y y_1 → R x x_1)) →
    ∀ (x y : A),
      RA x y →
        ∀ (x_1 y_1 : A), RA x_1 y_1 → ((R x x_1 → False) → R y y_1 → False) ∧ ((R y y_1 → False) → R x x_1 → False)
```

## Corelib.Classes.Morphisms.compose_proper

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.compose_proper.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.compose_proper.statement.correspondence

```lean
∀ (A B C : Type u_Corelib_Classes_Morphisms_77) (RA : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (RB : Rocq.Corelib.Relations.Relation_Definitions.relation B)
  (RC : Rocq.Corelib.Relations.Relation_Definitions.relation C),
  Rocq.Corelib.Classes.Morphisms.Proper ((B → C) → (A → B) → A → C)
    (Rocq.Corelib.Classes.Morphisms.respectful (B → C) ((A → B) → A → C)
      (Rocq.Corelib.Classes.Morphisms.respectful B C RB RC)
      (Rocq.Corelib.Classes.Morphisms.respectful (A → B) (A → C) (Rocq.Corelib.Classes.Morphisms.respectful A B RA RB)
        (Rocq.Corelib.Classes.Morphisms.respectful A C RA RC)))
    (Rocq.Corelib.Program.Basics.compose A B C)
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.Morphisms.Proper;Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Program.Basics.compose

## Corelib.Classes.Morphisms.compose_proper_obligation_1

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.compose_proper_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.compose_proper_obligation_1.statement.correspondence

```lean
∀ (A B C : Type u_Corelib_Classes_Morphisms_77) (RA : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (RB : Rocq.Corelib.Relations.Relation_Definitions.relation B)
  (RC : Rocq.Corelib.Relations.Relation_Definitions.relation C),
  Rocq.Corelib.Classes.Morphisms.respectful (B → C) ((A → B) → A → C)
    (Rocq.Corelib.Classes.Morphisms.respectful B C RB RC)
    (Rocq.Corelib.Classes.Morphisms.respectful (A → B) (A → C) (Rocq.Corelib.Classes.Morphisms.respectful A B RA RB)
      (Rocq.Corelib.Classes.Morphisms.respectful A C RA RC))
    (Rocq.Corelib.Program.Basics.compose A B C) (Rocq.Corelib.Program.Basics.compose A B C)
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Program.Basics.compose

## Corelib.Classes.Morphisms.eq_pars

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.eq_pars.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.eq_pars.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.Params ((A : Sort u_Corelib_Init_Logic_19) → A → A → Prop) (@Eq) Nat.zero.succ
```

Residual source symbols: Rocq.Corelib.Classes.Morphisms.Params

## Corelib.Classes.Morphisms.eq_proper_proxy

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.eq_proper_proxy.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.eq_proper_proxy.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (x : A), Rocq.Corelib.Classes.Morphisms.ProperProxy A Eq x
```

Residual source symbols: Rocq.Corelib.Classes.Morphisms.ProperProxy

## Corelib.Classes.Morphisms.eq_rewrite_relation

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.eq_rewrite_relation.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.eq_rewrite_relation.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21), Rocq.Corelib.Classes.RelationClasses.RewriteRelation A Eq
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.RewriteRelation

## Corelib.Classes.Morphisms.eq_subrelation

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.eq_subrelation.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.eq_subrelation.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Reflexive A R → Rocq.Corelib.Classes.RelationClasses.subrelation A Eq R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Reflexive;Rocq.Corelib.Classes.RelationClasses.subrelation

## Corelib.Classes.Morphisms.flip1

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.flip1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.flip1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21)
  (R' R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.subrelation A R' R →
    Rocq.Corelib.Classes.RelationClasses.subrelation A
      (Rocq.Corelib.Program.Basics.flip A A Prop (Rocq.Corelib.Program.Basics.flip A A Prop R')) R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.subrelation;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.Morphisms.flip2

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.flip2.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.flip2.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21)
  (R R' : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.subrelation A R R' →
    Rocq.Corelib.Classes.RelationClasses.subrelation A R
      (Rocq.Corelib.Program.Basics.flip A A Prop (Rocq.Corelib.Program.Basics.flip A A Prop R'))
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.subrelation;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.Morphisms.flip_arrow

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms.flip_arrow.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.flip_arrow.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_138) (B : Type u_Corelib_Classes_Morphisms_139) (R R''' : A → A → Prop),
  (∀ (x x_1 : A), R x x_1 ↔ R''' x_1 x) →
    ∀ (R' R'' : B → B → Prop),
      (∀ (x x_1 : B), R' x x_1 ↔ R'' x_1 x) →
        ∀ (x x_1 : A → B),
          (∀ (x_2 y : A), R x_2 y → R' (x x_2) (x_1 y)) ↔ ∀ (x_2 y : A), R''' x_2 y → R'' (x_1 x_2) (x y)
```

## Corelib.Classes.Morphisms.flip_atom

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.flip_atom.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.flip_atom.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.Morphisms.Normalizes A R
    (Rocq.Corelib.Program.Basics.flip A A Prop (Rocq.Corelib.Program.Basics.flip A A Prop R))
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.Morphisms.Normalizes;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.Morphisms.flip_forall

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms.flip_forall.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.flip_forall.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_144) (B : A → Type u_Corelib_Classes_Morphisms_145)
  (R R' : (a : A) → B a → B a → Prop),
  (∀ (a : A) (x x_1 : B a), R a x x_1 ↔ R' a x_1 x) →
    ∀ (x x_1 : (a : A) → B a), (∀ (a : A), R a (x a) (x_1 a)) ↔ ∀ (a : A), R' a (x_1 a) (x a)
```

## Corelib.Classes.Morphisms.flip_pars

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.flip_pars.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.flip_pars.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.Params
  ((A : Sort u_Corelib_Program_Basics_36) →
    (B : Sort u_Corelib_Program_Basics_37) → (C : Sort u_Corelib_Program_Basics_38) → (A → B → C) → B → A → C)
  Rocq.Corelib.Program.Basics.flip Nat.zero.succ.succ.succ.succ
```

Residual source symbols: Rocq.Corelib.Classes.Morphisms.Params;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.Morphisms.flip_proper

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.flip_proper.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.flip_proper.statement.correspondence

```lean
∀ (A B C : Type u_Corelib_Classes_Morphisms_77) (RA : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (RB : Rocq.Corelib.Relations.Relation_Definitions.relation B)
  (RC : Rocq.Corelib.Relations.Relation_Definitions.relation C) (f : A → B → C),
  Rocq.Corelib.Classes.Morphisms.Proper (A → B → C)
      (Rocq.Corelib.Classes.Morphisms.respectful A (B → C) RA (Rocq.Corelib.Classes.Morphisms.respectful B C RB RC)) f →
    Rocq.Corelib.Classes.Morphisms.Proper (B → A → C)
      (Rocq.Corelib.Classes.Morphisms.respectful B (A → C) RB (Rocq.Corelib.Classes.Morphisms.respectful A C RA RC))
      (Rocq.Corelib.Program.Basics.flip A B C f)
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.Morphisms.Proper;Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.Morphisms.flip_proper_obligation_1

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.flip_proper_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.flip_proper_obligation_1.statement.correspondence

```lean
∀ (A B C : Type u_Corelib_Classes_Morphisms_77) (RA : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (RB : Rocq.Corelib.Relations.Relation_Definitions.relation B)
  (RC : Rocq.Corelib.Relations.Relation_Definitions.relation C) (f : A → B → C),
  Rocq.Corelib.Classes.Morphisms.Proper (A → B → C)
      (Rocq.Corelib.Classes.Morphisms.respectful A (B → C) RA (Rocq.Corelib.Classes.Morphisms.respectful B C RB RC)) f →
    Rocq.Corelib.Classes.Morphisms.Proper (B → A → C)
      (Rocq.Corelib.Classes.Morphisms.respectful B (A → C) RB (Rocq.Corelib.Classes.Morphisms.respectful A C RA RC))
      (Rocq.Corelib.Program.Basics.flip A B C f)
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.Morphisms.Proper;Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.Morphisms.flip_respectful

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.flip_respectful.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.flip_respectful.statement.correspondence

```lean
∀ (A B : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (R' : Rocq.Corelib.Relations.Relation_Definitions.relation B),
  Rocq.Corelib.Classes.RelationClasses.relation_equivalence (A → B)
    (Rocq.Corelib.Program.Basics.flip (A → B) (A → B) Prop (Rocq.Corelib.Classes.Morphisms.respectful A B R R'))
    (Rocq.Corelib.Classes.Morphisms.respectful A B (Rocq.Corelib.Program.Basics.flip A A Prop R)
      (Rocq.Corelib.Program.Basics.flip B B Prop R'))
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.relation_equivalence;Rocq.Corelib.Program.Basics.flip;Rocq.Corelib.Classes.Morphisms.respectful

## Corelib.Classes.Morphisms.forall_def

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Classes.Morphisms.forall_def

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Classes.Morphisms.forall_def.roundtrip

## Corelib.Classes.Morphisms.forall_relation

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.Morphisms.forall_relation

Reason for interface not covered: No registered type bijection for (a : A) → Rocq.Corelib.Relations.Relation_Definitions.relation (P a)

## Corelib.Classes.Morphisms.forall_subrelation

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.forall_subrelation.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.forall_subrelation.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (P : A → Type u_Corelib_Relations_Relation_Definitions_21)
  (R S : (x : A) → Rocq.Corelib.Relations.Relation_Definitions.relation (P x)),
  (∀ (a : A), Rocq.Corelib.Classes.RelationClasses.subrelation (P a) (R a) (S a)) →
    Rocq.Corelib.Classes.RelationClasses.subrelation ((x : A) → P x)
      (Rocq.Corelib.Classes.Morphisms.forall_relation A P R) (Rocq.Corelib.Classes.Morphisms.forall_relation A P S)
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.subrelation;Rocq.Corelib.Classes.Morphisms.forall_relation

## Corelib.Classes.Morphisms.iff_flip_impl_subrelation

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.iff_flip_impl_subrelation.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.iff_flip_impl_subrelation.statement.correspondence

```lean
Rocq.Corelib.Classes.RelationClasses.subrelation Prop Rocq.Corelib.Init.Logic.iff
  (Rocq.Corelib.Program.Basics.flip Prop Prop Prop Rocq.Corelib.Program.Basics.impl)
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.subrelation;Rocq.Corelib.Init.Logic.iff;Rocq.Corelib.Program.Basics.flip;Rocq.Corelib.Program.Basics.impl

## Corelib.Classes.Morphisms.iff_impl_subrelation

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.iff_impl_subrelation.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.iff_impl_subrelation.statement.correspondence

```lean
Rocq.Corelib.Classes.RelationClasses.subrelation Prop Rocq.Corelib.Init.Logic.iff Rocq.Corelib.Program.Basics.impl
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.subrelation;Rocq.Corelib.Init.Logic.iff;Rocq.Corelib.Program.Basics.impl

## Corelib.Classes.Morphisms.iff_pars

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.iff_pars.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.iff_pars.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.Params (Prop → Prop → Prop) Rocq.Corelib.Init.Logic.iff Nat.zero
```

Residual source symbols: Rocq.Corelib.Classes.Morphisms.Params;Rocq.Corelib.Init.Logic.iff

## Corelib.Classes.Morphisms.impl_pars

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.impl_pars.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.impl_pars.statement.correspondence

```lean
Rocq.Corelib.Classes.Morphisms.Params (Prop → Prop → Prop) Rocq.Corelib.Program.Basics.impl Nat.zero
```

Residual source symbols: Rocq.Corelib.Classes.Morphisms.Params;Rocq.Corelib.Program.Basics.impl

## Corelib.Classes.Morphisms.normalization_done

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.Morphisms.normalization_done

## Corelib.Classes.Morphisms.normalizes

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.normalizes.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.normalizes.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21)
  (m m' : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.Morphisms.Normalizes A m m' → Rocq.Corelib.Classes.RelationClasses.relation_equivalence A m m'
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.Morphisms.Normalizes;Rocq.Corelib.Classes.RelationClasses.relation_equivalence

## Corelib.Classes.Morphisms.per_partial_app_morphism

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.per_partial_app_morphism.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.per_partial_app_morphism.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_77) (R : A → A → Prop),
  Rocq.Corelib.Classes.RelationClasses.PER A R → ∀ (x x_1 y : A), R x_1 y → (R x x_1 → R x y) ∧ (R x y → R x x_1)
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.PER

## Corelib.Classes.Morphisms.per_partial_app_morphism_obligation_1

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.per_partial_app_morphism_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.per_partial_app_morphism_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_77) (R : A → A → Prop),
  Rocq.Corelib.Classes.RelationClasses.PER A R → ∀ (x x_1 y : A), R x_1 y → (R x x_1 → R x y) ∧ (R x y → R x x_1)
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.PER

## Corelib.Classes.Morphisms.pointwise_pointwise

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.pointwise_pointwise.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.pointwise_pointwise.statement.correspondence

```lean
∀ (A B : Type u_Corelib_Classes_Morphisms_57) (R : Rocq.Corelib.Relations.Relation_Definitions.relation B),
  Rocq.Corelib.Classes.RelationClasses.relation_equivalence (A → B)
    (Rocq.Corelib.Classes.Morphisms.pointwise_relation A B R) (Rocq.Corelib.Classes.Morphisms.respectful A B Eq R)
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.relation_equivalence;Rocq.Corelib.Classes.Morphisms.pointwise_relation;Rocq.Corelib.Classes.Morphisms.respectful

## Corelib.Classes.Morphisms.pointwise_relation

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Classes.Morphisms.pointwise_relation

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Classes.Morphisms.pointwise_relation.roundtrip

## Corelib.Classes.Morphisms.pointwise_subrelation

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.pointwise_subrelation.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.pointwise_subrelation.statement.correspondence

```lean
∀ (A B : Type u_Corelib_Classes_Morphisms_57) (R R' : Rocq.Corelib.Relations.Relation_Definitions.relation B),
  Rocq.Corelib.Classes.RelationClasses.subrelation B R R' →
    Rocq.Corelib.Classes.RelationClasses.subrelation (A → B) (Rocq.Corelib.Classes.Morphisms.pointwise_relation A B R)
      (Rocq.Corelib.Classes.Morphisms.pointwise_relation A B R')
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.subrelation;Rocq.Corelib.Classes.Morphisms.pointwise_relation

## Corelib.Classes.Morphisms.proper_eq

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.proper_eq.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.proper_eq.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (x : A), Rocq.Corelib.Classes.Morphisms.Proper A Eq x
```

Residual source symbols: Rocq.Corelib.Classes.Morphisms.Proper

## Corelib.Classes.Morphisms.proper_flip_proper

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.proper_flip_proper.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.proper_flip_proper.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (m : A),
  Rocq.Corelib.Classes.Morphisms.Proper A R m →
    Rocq.Corelib.Classes.Morphisms.Proper A (Rocq.Corelib.Program.Basics.flip A A Prop R) m
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.Morphisms.Proper;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.Morphisms.proper_normalizes_proper

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.proper_normalizes_proper.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.proper_normalizes_proper.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21)
  (R0 R1 : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.Morphisms.Normalizes A R0 R1 →
    ∀ (m : A), Rocq.Corelib.Classes.Morphisms.Proper A R1 m → Rocq.Corelib.Classes.Morphisms.Proper A R0 m
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.Morphisms.Normalizes;Rocq.Corelib.Classes.Morphisms.Proper

## Corelib.Classes.Morphisms.proper_prf

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.proper_prf.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.proper_prf.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (m : A), Rocq.Corelib.Classes.Morphisms.Proper A R m → R m m
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.Morphisms.Proper

## Corelib.Classes.Morphisms.proper_proper

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms.proper_proper.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.proper_proper.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_131) (x y : A → A → Prop),
  (∀ (x_1 x_2 : A), x x_1 x_2 ↔ y x_1 x_2) →
    ∀ (x_1 y_1 : A), x_1 = y_1 → (x x_1 x_1 → y y_1 y_1) ∧ (y y_1 y_1 → x x_1 x_1)
```

## Corelib.Classes.Morphisms.proper_proper_proxy

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.proper_proper_proxy.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.proper_proper_proxy.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (x : A)
  (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.Morphisms.Proper A R x → Rocq.Corelib.Classes.Morphisms.ProperProxy A R x
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.Morphisms.Proper;Rocq.Corelib.Classes.Morphisms.ProperProxy

## Corelib.Classes.Morphisms.proper_proxy

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.proper_proxy.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.proper_proxy.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (m : A), Rocq.Corelib.Classes.Morphisms.ProperProxy A R m → R m m
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.Morphisms.ProperProxy

## Corelib.Classes.Morphisms.proper_subrelation_proper

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms.proper_subrelation_proper.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.proper_subrelation_proper.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_57) (x y : A → A → Prop),
  (∀ (x_1 y_1 : A), x x_1 y_1 → y x_1 y_1) → ∀ (x_1 y_1 : A), x_1 = y_1 → x x_1 x_1 → y y_1 y_1
```

## Corelib.Classes.Morphisms.proper_sym_flip

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms.proper_sym_flip.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.proper_sym_flip.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_152) (R1 : A → A → Prop),
  (∀ (x y : A), R1 x y → R1 y x) →
    ∀ (B : Type u_Corelib_Classes_Morphisms_156) (R2 : B → B → Prop) (f : A → B),
      (∀ (x y : A), R1 x y → R2 (f x) (f y)) → ∀ (x y : A), R1 x y → R2 (f y) (f x)
```

## Corelib.Classes.Morphisms.proper_sym_flip_2

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms.proper_sym_flip_2.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.proper_sym_flip_2.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_159) (R1 : A → A → Prop),
  (∀ (x y : A), R1 x y → R1 y x) →
    ∀ (B : Type u_Corelib_Classes_Morphisms_162) (R2 : B → B → Prop),
      (∀ (x y : B), R2 x y → R2 y x) →
        ∀ (C : Type u_Corelib_Classes_Morphisms_166) (R3 : C → C → Prop) (f : A → B → C),
          (∀ (x y : A), R1 x y → ∀ (x_1 y_1 : B), R2 x_1 y_1 → R3 (f x x_1) (f y y_1)) →
            ∀ (x y : A), R1 x y → ∀ (x_1 y_1 : B), R2 x_1 y_1 → R3 (f y y_1) (f x x_1)
```

## Corelib.Classes.Morphisms.proper_sym_impl_iff

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms.proper_sym_impl_iff.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.proper_sym_impl_iff.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_169) (R : A → A → Prop),
  (∀ (x y : A), R x y → R y x) →
    ∀ (f : A → Prop), (∀ (x y : A), R x y → f x → f y) → ∀ (x y : A), R x y → (f x → f y) ∧ (f y → f x)
```

## Corelib.Classes.Morphisms.proper_sym_impl_iff_2

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms.proper_sym_impl_iff_2.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.proper_sym_impl_iff_2.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_173) (R : A → A → Prop),
  (∀ (x y : A), R x y → R y x) →
    ∀ (B : Type u_Corelib_Classes_Morphisms_176) (R' : B → B → Prop),
      (∀ (x y : B), R' x y → R' y x) →
        ∀ (f : A → B → Prop),
          (∀ (x y : A), R x y → ∀ (x_1 y_1 : B), R' x_1 y_1 → f x x_1 → f y y_1) →
            ∀ (x y : A), R x y → ∀ (x_1 y_1 : B), R' x_1 y_1 → (f x x_1 → f y y_1) ∧ (f y y_1 → f x x_1)
```

## Corelib.Classes.Morphisms.reflexive_eq_dom_reflexive

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.reflexive_eq_dom_reflexive.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.reflexive_eq_dom_reflexive.statement.correspondence

```lean
∀ (A B : Type u_Corelib_Relations_Relation_Definitions_21)
  (R' : Rocq.Corelib.Relations.Relation_Definitions.relation B),
  Rocq.Corelib.Classes.RelationClasses.Reflexive B R' →
    Rocq.Corelib.Classes.RelationClasses.Reflexive (A → B) (Rocq.Corelib.Classes.Morphisms.respectful A B Eq R')
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Reflexive;Rocq.Corelib.Classes.Morphisms.respectful

## Corelib.Classes.Morphisms.reflexive_proper

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.reflexive_proper.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.reflexive_proper.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.Morphisms.ReflexiveProxy A R → ∀ (x : A), Rocq.Corelib.Classes.Morphisms.Proper A R x
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.Morphisms.ReflexiveProxy;Rocq.Corelib.Classes.Morphisms.Proper

## Corelib.Classes.Morphisms.reflexive_proper_proxy

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.reflexive_proper_proxy.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.reflexive_proper_proxy.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.Morphisms.ReflexiveProxy A R → ∀ (x : A), Rocq.Corelib.Classes.Morphisms.ProperProxy A R x
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.Morphisms.ReflexiveProxy;Rocq.Corelib.Classes.Morphisms.ProperProxy

## Corelib.Classes.Morphisms.reflexive_proxy

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.reflexive_proxy.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.reflexive_proxy.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.Morphisms.ReflexiveProxy A R → ∀ (x : A), R x x
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.Morphisms.ReflexiveProxy

## Corelib.Classes.Morphisms.reflexive_reflexive_proxy

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.reflexive_reflexive_proxy.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.reflexive_reflexive_proxy.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Reflexive A R → Rocq.Corelib.Classes.Morphisms.ReflexiveProxy A R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Reflexive;Rocq.Corelib.Classes.Morphisms.ReflexiveProxy

## Corelib.Classes.Morphisms.respectful

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Classes.Morphisms.respectful

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Classes.Morphisms.respectful.roundtrip

## Corelib.Classes.Morphisms.respectful_hetero

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Classes.Morphisms.respectful_hetero

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Classes.Morphisms.respectful_hetero.roundtrip

## Corelib.Classes.Morphisms.respectful_morphism

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.respectful_morphism.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.respectful_morphism.statement.correspondence

```lean
∀ (A B : Type u_Corelib_Relations_Relation_Definitions_21),
  Rocq.Corelib.Classes.Morphisms.Proper
    (Rocq.Corelib.Relations.Relation_Definitions.relation A →
      Rocq.Corelib.Relations.Relation_Definitions.relation B →
        Rocq.Corelib.Relations.Relation_Definitions.relation (A → B))
    (Rocq.Corelib.Classes.Morphisms.respectful (Rocq.Corelib.Relations.Relation_Definitions.relation A)
      (Rocq.Corelib.Relations.Relation_Definitions.relation B →
        Rocq.Corelib.Relations.Relation_Definitions.relation (A → B))
      (Rocq.Corelib.Classes.RelationClasses.relation_equivalence A)
      (Rocq.Corelib.Classes.Morphisms.respectful (Rocq.Corelib.Relations.Relation_Definitions.relation B)
        (Rocq.Corelib.Relations.Relation_Definitions.relation (A → B))
        (Rocq.Corelib.Classes.RelationClasses.relation_equivalence B)
        (Rocq.Corelib.Classes.RelationClasses.relation_equivalence (A → B))))
    (Rocq.Corelib.Classes.Morphisms.respectful A B)
```

Residual source symbols: Rocq.Corelib.Classes.Morphisms.Proper;Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.Morphisms.respectful;Rocq.Corelib.Classes.RelationClasses.relation_equivalence

## Corelib.Classes.Morphisms.respectful_per

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.respectful_per.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.respectful_per.statement.correspondence

```lean
∀ (A B : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.PER A R →
    ∀ (R' : Rocq.Corelib.Relations.Relation_Definitions.relation B),
      Rocq.Corelib.Classes.RelationClasses.PER B R' →
        Rocq.Corelib.Classes.RelationClasses.PER (A → B) (Rocq.Corelib.Classes.Morphisms.respectful A B R R')
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.PER;Rocq.Corelib.Classes.Morphisms.respectful

## Corelib.Classes.Morphisms.respectful_per_obligation_1

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.respectful_per_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.respectful_per_obligation_1.statement.correspondence

```lean
∀ (A B : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.PER A R →
    ∀ (R' : Rocq.Corelib.Relations.Relation_Definitions.relation B),
      Rocq.Corelib.Classes.RelationClasses.PER B R' →
        Rocq.Corelib.Classes.RelationClasses.Symmetric (A → B) (Rocq.Corelib.Classes.Morphisms.respectful A B R R')
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.PER;Rocq.Corelib.Classes.RelationClasses.Symmetric;Rocq.Corelib.Classes.Morphisms.respectful

## Corelib.Classes.Morphisms.respectful_per_obligation_2

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.respectful_per_obligation_2.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.respectful_per_obligation_2.statement.correspondence

```lean
∀ (A B : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.PER A R →
    ∀ (R' : Rocq.Corelib.Relations.Relation_Definitions.relation B),
      Rocq.Corelib.Classes.RelationClasses.PER B R' →
        Rocq.Corelib.Classes.RelationClasses.Transitive (A → B) (Rocq.Corelib.Classes.Morphisms.respectful A B R R')
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.PER;Rocq.Corelib.Classes.RelationClasses.Transitive;Rocq.Corelib.Classes.Morphisms.respectful

## Corelib.Classes.Morphisms.rewrite_relation_eq_dom

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.rewrite_relation_eq_dom.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.rewrite_relation_eq_dom.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_50) (B : Type u_Corelib_Classes_Morphisms_49) (R : B → B → Prop),
  Rocq.Corelib.Classes.RelationClasses.RewriteRelation B R →
    Rocq.Corelib.Classes.RelationClasses.RewriteRelation (A → B) fun f g => ∀ (x y : A), x = y → R (f x) (g y)
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.RewriteRelation

## Corelib.Classes.Morphisms.rewrite_relation_pointwise

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.rewrite_relation_pointwise.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.rewrite_relation_pointwise.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_39) (B : Type u_Corelib_Classes_Morphisms_38)
  (R : Rocq.Corelib.Relations.Relation_Definitions.relation B),
  Rocq.Corelib.Classes.RelationClasses.RewriteRelation B R →
    Rocq.Corelib.Classes.RelationClasses.RewriteRelation (A → B)
      (Rocq.Corelib.Classes.Morphisms.pointwise_relation A B R)
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.RewriteRelation;Rocq.Corelib.Classes.Morphisms.pointwise_relation

## Corelib.Classes.Morphisms.subrelation_id_proper

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms.subrelation_id_proper.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.subrelation_id_proper.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_57) (RA RA' : A → A → Prop),
  (∀ (x y : A), RA x y → RA' x y) → ∀ (x y : A), RA x y → RA' x y
```

## Corelib.Classes.Morphisms.subrelation_proper

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.subrelation_proper.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.subrelation_proper.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_57) (R' : A → A → Prop) (m : A),
  R' m m → ∀ (R : A → A → Prop) (unc : Rocq.Corelib.Init.Datatypes.unit), (∀ (x y : A), R' x y → R x y) → R m m
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.unit

## Corelib.Classes.Morphisms.subrelation_refl

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.subrelation_refl.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.subrelation_refl.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.subrelation A R R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.subrelation

## Corelib.Classes.Morphisms.subrelation_respectful

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.subrelation_respectful.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.subrelation_respectful.statement.correspondence

```lean
∀ (A B : Type u_Corelib_Relations_Relation_Definitions_21)
  (RA' RA : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.subrelation A RA' RA →
    ∀ (RB RB' : Rocq.Corelib.Relations.Relation_Definitions.relation B),
      Rocq.Corelib.Classes.RelationClasses.subrelation B RB RB' →
        Rocq.Corelib.Classes.RelationClasses.subrelation (A → B) (Rocq.Corelib.Classes.Morphisms.respectful A B RA RB)
          (Rocq.Corelib.Classes.Morphisms.respectful A B RA' RB')
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.subrelation;Rocq.Corelib.Classes.Morphisms.respectful

## Corelib.Classes.Morphisms.symmetric_equiv_flip

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.symmetric_equiv_flip.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.symmetric_equiv_flip.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Symmetric A R →
    Rocq.Corelib.Classes.RelationClasses.relation_equivalence A R (Rocq.Corelib.Program.Basics.flip A A Prop R)
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Symmetric;Rocq.Corelib.Classes.RelationClasses.relation_equivalence;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.Morphisms.trans_co_eq_inv_impl_morphism

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms.trans_co_eq_inv_impl_morphism.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.trans_co_eq_inv_impl_morphism.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_77) (R : A → A → Prop),
  (∀ (x y z : A), R x y → R y z → R x z) → ∀ (x y : A), R x y → ∀ (x_1 y_1 : A), x_1 = y_1 → R y y_1 → R x x_1
```

## Corelib.Classes.Morphisms.trans_co_eq_inv_impl_morphism_obligation_1

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms.trans_co_eq_inv_impl_morphism_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.trans_co_eq_inv_impl_morphism_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_77) (R : A → A → Prop),
  (∀ (x y z : A), R x y → R y z → R x z) → ∀ (x y : A), R x y → ∀ (x_1 y_1 : A), x_1 = y_1 → R y y_1 → R x x_1
```

## Corelib.Classes.Morphisms.trans_co_impl_morphism

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms.trans_co_impl_morphism.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.trans_co_impl_morphism.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_77) (R : A → A → Prop),
  (∀ (x y z : A), R x y → R y z → R x z) → ∀ (x x_1 y : A), R x_1 y → R x x_1 → R x y
```

## Corelib.Classes.Morphisms.trans_co_impl_morphism_obligation_1

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms.trans_co_impl_morphism_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.trans_co_impl_morphism_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_77) (R : A → A → Prop),
  (∀ (x y z : A), R x y → R y z → R x z) → ∀ (x x_1 y : A), R x_1 y → R x x_1 → R x y
```

## Corelib.Classes.Morphisms.trans_contra_co_morphism

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms.trans_contra_co_morphism.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.trans_contra_co_morphism.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_77) (R : A → A → Prop),
  (∀ (x y z : A), R x y → R y z → R x z) → ∀ (x y : A), R y x → ∀ (x_1 y_1 : A), R x_1 y_1 → R x x_1 → R y y_1
```

## Corelib.Classes.Morphisms.trans_contra_co_morphism_obligation_1

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms.trans_contra_co_morphism_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.trans_contra_co_morphism_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_77) (R : A → A → Prop),
  (∀ (x y z : A), R x y → R y z → R x z) → ∀ (x y : A), R y x → ∀ (x_1 y_1 : A), R x_1 y_1 → R x x_1 → R y y_1
```

## Corelib.Classes.Morphisms.trans_contra_inv_impl_morphism

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms.trans_contra_inv_impl_morphism.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.trans_contra_inv_impl_morphism.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_77) (R : A → A → Prop),
  (∀ (x y z : A), R x y → R y z → R x z) → ∀ (x x_1 y : A), R y x_1 → R x y → R x x_1
```

## Corelib.Classes.Morphisms.trans_contra_inv_impl_morphism_obligation_1

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Classes.Morphisms.trans_contra_inv_impl_morphism_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.trans_contra_inv_impl_morphism_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_77) (R : A → A → Prop),
  (∀ (x y z : A), R x y → R y z → R x z) → ∀ (x x_1 y : A), R y x_1 → R x y → R x x_1
```

## Corelib.Classes.Morphisms.trans_sym_co_inv_impl_morphism

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.trans_sym_co_inv_impl_morphism.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.trans_sym_co_inv_impl_morphism.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_77) (R : A → A → Prop),
  Rocq.Corelib.Classes.RelationClasses.PER A R → ∀ (x x_1 y : A), R x_1 y → R x y → R x x_1
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.PER

## Corelib.Classes.Morphisms.trans_sym_co_inv_impl_morphism_obligation_1

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.trans_sym_co_inv_impl_morphism_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.trans_sym_co_inv_impl_morphism_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_77) (R : A → A → Prop),
  Rocq.Corelib.Classes.RelationClasses.PER A R → ∀ (x x_1 y : A), R x_1 y → R x y → R x x_1
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.PER

## Corelib.Classes.Morphisms.trans_sym_contra_impl_morphism

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.trans_sym_contra_impl_morphism.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.trans_sym_contra_impl_morphism.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_77) (R : A → A → Prop),
  Rocq.Corelib.Classes.RelationClasses.PER A R → ∀ (x x_1 y : A), R y x_1 → R x x_1 → R x y
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.PER

## Corelib.Classes.Morphisms.trans_sym_contra_impl_morphism_obligation_1

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Morphisms.trans_sym_contra_impl_morphism_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Morphisms.trans_sym_contra_impl_morphism_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_77) (R : A → A → Prop),
  Rocq.Corelib.Classes.RelationClasses.PER A R → ∀ (x x_1 y : A), R y x_1 → R x x_1 → R x y
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.PER
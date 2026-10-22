# Corelib.Classes.RelationClasses

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.Classes.RelationClasses.Antisymmetric

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.RelationClasses.Antisymmetric

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Classes.RelationClasses.Equivalence A eqA

## Corelib.Classes.RelationClasses.Asymmetric

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Classes.RelationClasses.Asymmetric

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Classes.RelationClasses.Asymmetric.roundtrip

## Corelib.Classes.RelationClasses.Equivalence

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.RelationClasses.Equivalence

## Corelib.Classes.RelationClasses.Equivalence_PER

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.Equivalence_PER.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.Equivalence_PER.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A R → Rocq.Corelib.Classes.RelationClasses.PER A R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.PER

## Corelib.Classes.RelationClasses.Equivalence_PreOrder

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.Equivalence_PreOrder.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.Equivalence_PreOrder.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A R → Rocq.Corelib.Classes.RelationClasses.PreOrder A R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.PreOrder

## Corelib.Classes.RelationClasses.Equivalence_Reflexive

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.Equivalence_Reflexive.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.Equivalence_Reflexive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A R → Rocq.Corelib.Classes.RelationClasses.Reflexive A R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.Reflexive

## Corelib.Classes.RelationClasses.Equivalence_Symmetric

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.Equivalence_Symmetric.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.Equivalence_Symmetric.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A R → Rocq.Corelib.Classes.RelationClasses.Symmetric A R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.Symmetric

## Corelib.Classes.RelationClasses.Equivalence_Transitive

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.Equivalence_Transitive.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.Equivalence_Transitive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A R → Rocq.Corelib.Classes.RelationClasses.Transitive A R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.Transitive

## Corelib.Classes.RelationClasses.Irreflexive

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Classes.RelationClasses.Irreflexive

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Classes.RelationClasses.Irreflexive.roundtrip

## Corelib.Classes.RelationClasses.PER

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.RelationClasses.PER

## Corelib.Classes.RelationClasses.PER_Symmetric

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.PER_Symmetric.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.PER_Symmetric.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.PER A R → Rocq.Corelib.Classes.RelationClasses.Symmetric A R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.PER;Rocq.Corelib.Classes.RelationClasses.Symmetric

## Corelib.Classes.RelationClasses.PER_Transitive

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.PER_Transitive.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.PER_Transitive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.PER A R → Rocq.Corelib.Classes.RelationClasses.Transitive A R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.PER;Rocq.Corelib.Classes.RelationClasses.Transitive

## Corelib.Classes.RelationClasses.PartialOrder

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.RelationClasses.PartialOrder

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Classes.RelationClasses.Equivalence A eqA

## Corelib.Classes.RelationClasses.PartialOrder_inverse

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Classes.RelationClasses.PartialOrder_inverse.statement

## Corelib.Classes.RelationClasses.PreOrder

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.RelationClasses.PreOrder

## Corelib.Classes.RelationClasses.PreOrder_Reflexive

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.PreOrder_Reflexive.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.PreOrder_Reflexive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.PreOrder A R → Rocq.Corelib.Classes.RelationClasses.Reflexive A R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.PreOrder;Rocq.Corelib.Classes.RelationClasses.Reflexive

## Corelib.Classes.RelationClasses.PreOrder_Transitive

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.PreOrder_Transitive.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.PreOrder_Transitive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.PreOrder A R → Rocq.Corelib.Classes.RelationClasses.Transitive A R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.PreOrder;Rocq.Corelib.Classes.RelationClasses.Transitive

## Corelib.Classes.RelationClasses.Reflexive

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Classes.RelationClasses.Reflexive

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Classes.RelationClasses.Reflexive.roundtrip

## Corelib.Classes.RelationClasses.RewriteRelation

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.RelationClasses.RewriteRelation

## Corelib.Classes.RelationClasses.StrictOrder

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.RelationClasses.StrictOrder

## Corelib.Classes.RelationClasses.StrictOrder_Asymmetric

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.StrictOrder_Asymmetric.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.StrictOrder_Asymmetric.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.StrictOrder A R → Rocq.Corelib.Classes.RelationClasses.Asymmetric A R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.StrictOrder;Rocq.Corelib.Classes.RelationClasses.Asymmetric

## Corelib.Classes.RelationClasses.StrictOrder_Irreflexive

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.StrictOrder_Irreflexive.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.StrictOrder_Irreflexive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.StrictOrder A R → Rocq.Corelib.Classes.RelationClasses.Irreflexive A R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.StrictOrder;Rocq.Corelib.Classes.RelationClasses.Irreflexive

## Corelib.Classes.RelationClasses.StrictOrder_Transitive

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.StrictOrder_Transitive.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.StrictOrder_Transitive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.StrictOrder A R → Rocq.Corelib.Classes.RelationClasses.Transitive A R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.StrictOrder;Rocq.Corelib.Classes.RelationClasses.Transitive

## Corelib.Classes.RelationClasses.Symmetric

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Classes.RelationClasses.Symmetric

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Classes.RelationClasses.Symmetric.roundtrip

## Corelib.Classes.RelationClasses.Tlist

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.RelationClasses.Tlist

## Corelib.Classes.RelationClasses.Tlist_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.Tlist_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.Tlist_ind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Classes.RelationClasses.Tlist → Prop),
  P Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil →
    (∀ (T : Type u_Corelib_Classes_RelationClasses_72) (t : Rocq.Corelib.Classes.RelationClasses.Tlist),
        P t → P (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons T t)) →
      ∀ (t : Rocq.Corelib.Classes.RelationClasses.Tlist), P t
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.Tlist;Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil;Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons

## Corelib.Classes.RelationClasses.Tlist_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.RelationClasses.Tlist_rec

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Classes.RelationClasses.Tlist → Type) →
  P Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil →
    ((T : Type u_Corelib_Classes_RelationClasses_72) →
        (t : Rocq.Corelib.Classes.RelationClasses.Tlist) →
          P t → P (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons T t)) →
      (t : Rocq.Corelib.Classes.RelationClasses.Tlist) → P t

## Corelib.Classes.RelationClasses.Tlist_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.RelationClasses.Tlist_rect

Reason for interface not covered: No registered type bijection for (P:
    Rocq.Corelib.Classes.RelationClasses.Tlist → Type u_Corelib_Classes_RelationClasses_73) →
  P Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil →
    ((T : Type u_Corelib_Classes_RelationClasses_72) →
        (t : Rocq.Corelib.Classes.RelationClasses.Tlist) →
          P t → P (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons T t)) →
      (t : Rocq.Corelib.Classes.RelationClasses.Tlist) → P t

## Corelib.Classes.RelationClasses.Tlist_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.Tlist_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.Tlist_sind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Classes.RelationClasses.Tlist → Prop),
  P Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil →
    (∀ (T : Type u_Corelib_Classes_RelationClasses_72) (t : Rocq.Corelib.Classes.RelationClasses.Tlist),
        P t → P (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons T t)) →
      ∀ (t : Rocq.Corelib.Classes.RelationClasses.Tlist), P t
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.Tlist;Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil;Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons

## Corelib.Classes.RelationClasses.Transitive

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Classes.RelationClasses.Transitive

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Classes.RelationClasses.Transitive.roundtrip

## Corelib.Classes.RelationClasses.antisymmetry

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.antisymmetry.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.antisymmetry.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (eqA : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (equ : Rocq.Corelib.Classes.RelationClasses.Equivalence A eqA)
  (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Antisymmetric A eqA equ R → ∀ (x y : A), R x y → R y x → eqA x y
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.Antisymmetric

## Corelib.Classes.RelationClasses.arrows

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.RelationClasses.arrows

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Classes.RelationClasses.Tlist

## Corelib.Classes.RelationClasses.asymmetry

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.asymmetry.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.asymmetry.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Asymmetric A R → ∀ (x y : A), R x y → R y x → False
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Asymmetric

## Corelib.Classes.RelationClasses.binary_operation

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Classes.RelationClasses.binary_operation

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Classes.RelationClasses.binary_operation.roundtrip

## Corelib.Classes.RelationClasses.binary_relation

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Classes.RelationClasses.binary_relation

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Classes.RelationClasses.binary_relation.roundtrip

## Corelib.Classes.RelationClasses.complement

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Classes.RelationClasses.complement

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Classes.RelationClasses.complement.roundtrip

## Corelib.Classes.RelationClasses.complement_Irreflexive

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.complement_Irreflexive.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.complement_Irreflexive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Reflexive A R →
    Rocq.Corelib.Classes.RelationClasses.Irreflexive A (Rocq.Corelib.Classes.RelationClasses.complement A R)
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Reflexive;Rocq.Corelib.Classes.RelationClasses.Irreflexive;Rocq.Corelib.Classes.RelationClasses.complement

## Corelib.Classes.RelationClasses.complement_Symmetric

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.complement_Symmetric.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.complement_Symmetric.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Symmetric A R →
    Rocq.Corelib.Classes.RelationClasses.Symmetric A (Rocq.Corelib.Classes.RelationClasses.complement A R)
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Symmetric;Rocq.Corelib.Classes.RelationClasses.complement

## Corelib.Classes.RelationClasses.complement_inverse

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.complement_inverse.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.complement_inverse.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop),
  Rocq.Corelib.Init.Logic.eq (Rocq.Corelib.Relations.Relation_Definitions.relation A)
    (Rocq.Corelib.Classes.RelationClasses.complement A (Rocq.Corelib.Program.Basics.flip A A Prop R))
    (Rocq.Corelib.Program.Basics.flip A A Prop (Rocq.Corelib.Classes.RelationClasses.complement A R))
```

Residual source symbols: Rocq.Corelib.Init.Logic.eq;Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.complement;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.RelationClasses.eq_Reflexive

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.eq_Reflexive.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.eq_Reflexive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21),
  Rocq.Corelib.Classes.RelationClasses.Reflexive A (Rocq.Corelib.Init.Logic.eq A)
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.Reflexive;Rocq.Corelib.Init.Logic.eq

## Corelib.Classes.RelationClasses.eq_Symmetric

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.eq_Symmetric.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.eq_Symmetric.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21),
  Rocq.Corelib.Classes.RelationClasses.Symmetric A (Rocq.Corelib.Init.Logic.eq A)
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.Symmetric;Rocq.Corelib.Init.Logic.eq

## Corelib.Classes.RelationClasses.eq_Transitive

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.eq_Transitive.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.eq_Transitive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21),
  Rocq.Corelib.Classes.RelationClasses.Transitive A (Rocq.Corelib.Init.Logic.eq A)
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.Transitive;Rocq.Corelib.Init.Logic.eq

## Corelib.Classes.RelationClasses.eq_equivalence

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.eq_equivalence.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.eq_equivalence.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A (Rocq.Corelib.Init.Logic.eq A)
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Init.Logic.eq

## Corelib.Classes.RelationClasses.equivalence_rewrite_relation

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.equivalence_rewrite_relation.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.equivalence_rewrite_relation.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (eqA : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A eqA → Rocq.Corelib.Classes.RelationClasses.RewriteRelation A eqA
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.RewriteRelation

## Corelib.Classes.RelationClasses.false_predicate

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.RelationClasses.false_predicate

Reason for interface not covered: No registered type bijection for (l : Rocq.Corelib.Classes.RelationClasses.Tlist) →
  Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop)

## Corelib.Classes.RelationClasses.flip_Antisymmetric

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.flip_Antisymmetric.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.flip_Antisymmetric.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (eqA : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (equ : Rocq.Corelib.Classes.RelationClasses.Equivalence A eqA)
  (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Antisymmetric A eqA equ R →
    Rocq.Corelib.Classes.RelationClasses.Antisymmetric A eqA equ (Rocq.Corelib.Program.Basics.flip A A Prop R)
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.Antisymmetric;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.RelationClasses.flip_Asymmetric

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.flip_Asymmetric.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.flip_Asymmetric.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Asymmetric A R →
    Rocq.Corelib.Classes.RelationClasses.Asymmetric A (Rocq.Corelib.Program.Basics.flip A A Prop R)
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Asymmetric;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.RelationClasses.flip_Equivalence

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.flip_Equivalence.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.flip_Equivalence.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A R →
    Rocq.Corelib.Classes.RelationClasses.Equivalence A (Rocq.Corelib.Program.Basics.flip A A Prop R)
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.RelationClasses.flip_Irreflexive

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.flip_Irreflexive.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.flip_Irreflexive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Irreflexive A R →
    Rocq.Corelib.Classes.RelationClasses.Irreflexive A (Rocq.Corelib.Program.Basics.flip A A Prop R)
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Irreflexive;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.RelationClasses.flip_PER

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.flip_PER.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.flip_PER.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.PER A R →
    Rocq.Corelib.Classes.RelationClasses.PER A (Rocq.Corelib.Program.Basics.flip A A Prop R)
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.PER;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.RelationClasses.flip_PreOrder

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.flip_PreOrder.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.flip_PreOrder.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.PreOrder A R →
    Rocq.Corelib.Classes.RelationClasses.PreOrder A (Rocq.Corelib.Program.Basics.flip A A Prop R)
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.PreOrder;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.RelationClasses.flip_Reflexive

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.flip_Reflexive.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.flip_Reflexive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Reflexive A R →
    Rocq.Corelib.Classes.RelationClasses.Reflexive A (Rocq.Corelib.Program.Basics.flip A A Prop R)
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Reflexive;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.RelationClasses.flip_StrictOrder

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.flip_StrictOrder.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.flip_StrictOrder.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.StrictOrder A R →
    Rocq.Corelib.Classes.RelationClasses.StrictOrder A (Rocq.Corelib.Program.Basics.flip A A Prop R)
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.StrictOrder;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.RelationClasses.flip_Symmetric

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.flip_Symmetric.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.flip_Symmetric.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Symmetric A R →
    Rocq.Corelib.Classes.RelationClasses.Symmetric A (Rocq.Corelib.Program.Basics.flip A A Prop R)
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Symmetric;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.RelationClasses.flip_Transitive

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.flip_Transitive.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.flip_Transitive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Transitive A R →
    Rocq.Corelib.Classes.RelationClasses.Transitive A (Rocq.Corelib.Program.Basics.flip A A Prop R)
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Transitive;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.RelationClasses.iff_Reflexive

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.iff_Reflexive.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.iff_Reflexive.statement.correspondence

```lean
Rocq.Corelib.Classes.RelationClasses.Reflexive Prop Rocq.Corelib.Init.Logic.iff
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.Reflexive;Rocq.Corelib.Init.Logic.iff

## Corelib.Classes.RelationClasses.iff_Symmetric

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.iff_Symmetric.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.iff_Symmetric.statement.correspondence

```lean
Rocq.Corelib.Classes.RelationClasses.Symmetric Prop Rocq.Corelib.Init.Logic.iff
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.Symmetric;Rocq.Corelib.Init.Logic.iff

## Corelib.Classes.RelationClasses.iff_Transitive

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.iff_Transitive.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.iff_Transitive.statement.correspondence

```lean
Rocq.Corelib.Classes.RelationClasses.Transitive Prop Rocq.Corelib.Init.Logic.iff
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.Transitive;Rocq.Corelib.Init.Logic.iff

## Corelib.Classes.RelationClasses.iff_equivalence

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.iff_equivalence.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.iff_equivalence.statement.correspondence

```lean
Rocq.Corelib.Classes.RelationClasses.Equivalence Prop Rocq.Corelib.Init.Logic.iff
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Init.Logic.iff

## Corelib.Classes.RelationClasses.iff_rewrite_relation

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.iff_rewrite_relation.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.iff_rewrite_relation.statement.correspondence

```lean
Rocq.Corelib.Classes.RelationClasses.RewriteRelation Prop Rocq.Corelib.Init.Logic.iff
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.RewriteRelation;Rocq.Corelib.Init.Logic.iff

## Corelib.Classes.RelationClasses.impl_Reflexive

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.impl_Reflexive.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.impl_Reflexive.statement.correspondence

```lean
Rocq.Corelib.Classes.RelationClasses.Reflexive Prop Rocq.Corelib.Program.Basics.impl
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.Reflexive;Rocq.Corelib.Program.Basics.impl

## Corelib.Classes.RelationClasses.impl_Reflexive_obligation_1

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.impl_Reflexive_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.impl_Reflexive_obligation_1.statement.correspondence

```lean
∀ (x : Prop), Rocq.Corelib.Program.Basics.impl x x
```

Residual source symbols: Rocq.Corelib.Program.Basics.impl

## Corelib.Classes.RelationClasses.impl_Transitive

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.impl_Transitive.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.impl_Transitive.statement.correspondence

```lean
Rocq.Corelib.Classes.RelationClasses.Transitive Prop Rocq.Corelib.Program.Basics.impl
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.Transitive;Rocq.Corelib.Program.Basics.impl

## Corelib.Classes.RelationClasses.impl_Transitive_obligation_1

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.impl_Transitive_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.impl_Transitive_obligation_1.statement.correspondence

```lean
∀ (x y z : Prop),
  Rocq.Corelib.Program.Basics.impl x y → Rocq.Corelib.Program.Basics.impl y z → Rocq.Corelib.Program.Basics.impl x z
```

Residual source symbols: Rocq.Corelib.Program.Basics.impl

## Corelib.Classes.RelationClasses.impl_rewrite_relation

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.impl_rewrite_relation.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.impl_rewrite_relation.statement.correspondence

```lean
Rocq.Corelib.Classes.RelationClasses.RewriteRelation Prop Rocq.Corelib.Program.Basics.impl
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.RewriteRelation;Rocq.Corelib.Program.Basics.impl

## Corelib.Classes.RelationClasses.inverse_impl_rewrite_relation

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.inverse_impl_rewrite_relation.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.inverse_impl_rewrite_relation.statement.correspondence

```lean
Rocq.Corelib.Classes.RelationClasses.RewriteRelation Prop
  (Rocq.Corelib.Program.Basics.flip Prop Prop Prop Rocq.Corelib.Program.Basics.impl)
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.RewriteRelation;Rocq.Corelib.Program.Basics.flip;Rocq.Corelib.Program.Basics.impl

## Corelib.Classes.RelationClasses.irreflexivity

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.irreflexivity.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.irreflexivity.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Irreflexive A R →
    Rocq.Corelib.Classes.RelationClasses.Reflexive A (Rocq.Corelib.Classes.RelationClasses.complement A R)
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Irreflexive;Rocq.Corelib.Classes.RelationClasses.Reflexive;Rocq.Corelib.Classes.RelationClasses.complement

## Corelib.Classes.RelationClasses.is_subrelation

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.is_subrelation.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.is_subrelation.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21)
  (R R' : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.subrelation A R R' → ∀ (x y : A), R x y → R' x y
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.subrelation

## Corelib.Classes.RelationClasses.neq_Symmetric

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.neq_Symmetric.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.neq_Symmetric.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21),
  Rocq.Corelib.Classes.RelationClasses.Symmetric A fun x y => ¬x = y
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.Symmetric

## Corelib.Classes.RelationClasses.partial_order_antisym

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.partial_order_antisym.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.partial_order_antisym.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_98) (eqA : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (equ : Rocq.Corelib.Classes.RelationClasses.Equivalence A eqA)
  (R : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (preo : Rocq.Corelib.Classes.RelationClasses.PreOrder A R),
  Rocq.Corelib.Classes.RelationClasses.PartialOrder A eqA equ R preo →
    Rocq.Corelib.Classes.RelationClasses.Antisymmetric A eqA equ R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.PreOrder;Rocq.Corelib.Classes.RelationClasses.PartialOrder;Rocq.Corelib.Classes.RelationClasses.Antisymmetric

## Corelib.Classes.RelationClasses.partial_order_equivalence

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.partial_order_equivalence.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.partial_order_equivalence.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_98) (eqA : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (equ : Rocq.Corelib.Classes.RelationClasses.Equivalence A eqA)
  (R : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (preo : Rocq.Corelib.Classes.RelationClasses.PreOrder A R),
  Rocq.Corelib.Classes.RelationClasses.PartialOrder A eqA equ R preo →
    Rocq.Corelib.Classes.RelationClasses.relation_equivalence A eqA
      (Rocq.Corelib.Classes.RelationClasses.relation_conjunction A R (Rocq.Corelib.Program.Basics.flip A A Prop R))
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.PreOrder;Rocq.Corelib.Classes.RelationClasses.PartialOrder;Rocq.Corelib.Classes.RelationClasses.relation_equivalence;Rocq.Corelib.Classes.RelationClasses.relation_conjunction;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.RelationClasses.pointwise_extension

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.RelationClasses.pointwise_extension

Reason for interface not covered: No registered type bijection for (l : Rocq.Corelib.Classes.RelationClasses.Tlist) →
  Rocq.Corelib.Classes.RelationClasses.binary_operation (Rocq.Corelib.Classes.RelationClasses.arrows l T)

## Corelib.Classes.RelationClasses.pointwise_lifting

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.RelationClasses.pointwise_lifting

Reason for interface not covered: No registered type bijection for (l : Rocq.Corelib.Classes.RelationClasses.Tlist) →
  Rocq.Corelib.Classes.RelationClasses.arrows
    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop))
      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop))
        Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))
    (PULift Prop)

## Corelib.Classes.RelationClasses.predicate_all

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.RelationClasses.predicate_all

Reason for interface not covered: No registered type bijection for (l : Rocq.Corelib.Classes.RelationClasses.Tlist) →
  Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop) → Prop

## Corelib.Classes.RelationClasses.predicate_equivalence

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.RelationClasses.predicate_equivalence

Reason for interface not covered: No registered type bijection for (l : Rocq.Corelib.Classes.RelationClasses.Tlist) →
  Rocq.Corelib.Classes.RelationClasses.arrows
    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop))
      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop))
        Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))
    (PULift Prop)

## Corelib.Classes.RelationClasses.predicate_equivalence_equivalence

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.predicate_equivalence_equivalence.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.predicate_equivalence_equivalence.statement.correspondence

```lean
∀ (l : Rocq.Corelib.Classes.RelationClasses.Tlist),
  Rocq.Corelib.Classes.RelationClasses.Equivalence (Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop))
    fun a a_1 =>
    (Rocq.Corelib.Classes.RelationClasses.pointwise_lifting (fun a a_2 => { down := a.down ↔ a_2.down }) l a a_1).down
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.Tlist;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.arrows;Rocq.Corelib.Classes.RelationClasses.pointwise_lifting

## Corelib.Classes.RelationClasses.predicate_equivalence_equivalence_obligation_1

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.predicate_equivalence_equivalence_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.predicate_equivalence_equivalence_obligation_1.statement.correspondence

```lean
∀ (l : Rocq.Corelib.Classes.RelationClasses.Tlist) (x : Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop)),
  (Rocq.Corelib.Classes.RelationClasses.pointwise_lifting (fun a a_1 => { down := a.down ↔ a_1.down }) l x x).down
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.Tlist;Rocq.Corelib.Classes.RelationClasses.arrows;Rocq.Corelib.Classes.RelationClasses.pointwise_lifting

## Corelib.Classes.RelationClasses.predicate_equivalence_equivalence_obligation_2

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.predicate_equivalence_equivalence_obligation_2.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.predicate_equivalence_equivalence_obligation_2.statement.correspondence

```lean
∀ (l : Rocq.Corelib.Classes.RelationClasses.Tlist) (x y : Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop)),
  (Rocq.Corelib.Classes.RelationClasses.pointwise_lifting (fun a a_1 => { down := a.down ↔ a_1.down }) l x y).down →
    (Rocq.Corelib.Classes.RelationClasses.pointwise_lifting (fun a a_1 => { down := a.down ↔ a_1.down }) l y x).down
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.Tlist;Rocq.Corelib.Classes.RelationClasses.arrows;Rocq.Corelib.Classes.RelationClasses.pointwise_lifting

## Corelib.Classes.RelationClasses.predicate_equivalence_equivalence_obligation_3

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.predicate_equivalence_equivalence_obligation_3.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.predicate_equivalence_equivalence_obligation_3.statement.correspondence

```lean
∀ (l : Rocq.Corelib.Classes.RelationClasses.Tlist)
  (x y z : Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop)),
  (Rocq.Corelib.Classes.RelationClasses.pointwise_lifting (fun a a_1 => { down := a.down ↔ a_1.down }) l x y).down →
    (Rocq.Corelib.Classes.RelationClasses.pointwise_lifting (fun a a_1 => { down := a.down ↔ a_1.down }) l y z).down →
      (Rocq.Corelib.Classes.RelationClasses.pointwise_lifting (fun a a_1 => { down := a.down ↔ a_1.down }) l x z).down
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.Tlist;Rocq.Corelib.Classes.RelationClasses.arrows;Rocq.Corelib.Classes.RelationClasses.pointwise_lifting

## Corelib.Classes.RelationClasses.predicate_exists

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.RelationClasses.predicate_exists

Reason for interface not covered: No registered type bijection for (l : Rocq.Corelib.Classes.RelationClasses.Tlist) →
  Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop) → Prop

## Corelib.Classes.RelationClasses.predicate_implication

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.RelationClasses.predicate_implication

Reason for interface not covered: No registered type bijection for (l : Rocq.Corelib.Classes.RelationClasses.Tlist) →
  Rocq.Corelib.Classes.RelationClasses.arrows
    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop))
      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop))
        Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))
    (PULift Prop)

## Corelib.Classes.RelationClasses.predicate_implication_preorder

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.predicate_implication_preorder.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.predicate_implication_preorder.statement.correspondence

```lean
∀ (l : Rocq.Corelib.Classes.RelationClasses.Tlist),
  Rocq.Corelib.Classes.RelationClasses.PreOrder (Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop))
    fun a a_1 =>
    (Rocq.Corelib.Classes.RelationClasses.pointwise_lifting
        (fun a a_2 => { down := Rocq.Corelib.Program.Basics.impl a.down a_2.down }) l a a_1).down
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.Tlist;Rocq.Corelib.Classes.RelationClasses.PreOrder;Rocq.Corelib.Classes.RelationClasses.arrows;Rocq.Corelib.Classes.RelationClasses.pointwise_lifting;Rocq.Corelib.Program.Basics.impl

## Corelib.Classes.RelationClasses.predicate_implication_preorder_obligation_1

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.predicate_implication_preorder_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.predicate_implication_preorder_obligation_1.statement.correspondence

```lean
∀ (l : Rocq.Corelib.Classes.RelationClasses.Tlist) (x : Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop)),
  (Rocq.Corelib.Classes.RelationClasses.pointwise_lifting
      (fun a a_1 => { down := Rocq.Corelib.Program.Basics.impl a.down a_1.down }) l x x).down
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.Tlist;Rocq.Corelib.Classes.RelationClasses.arrows;Rocq.Corelib.Classes.RelationClasses.pointwise_lifting;Rocq.Corelib.Program.Basics.impl

## Corelib.Classes.RelationClasses.predicate_implication_preorder_obligation_2

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.predicate_implication_preorder_obligation_2.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.predicate_implication_preorder_obligation_2.statement.correspondence

```lean
∀ (l : Rocq.Corelib.Classes.RelationClasses.Tlist)
  (x y z : Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop)),
  (Rocq.Corelib.Classes.RelationClasses.pointwise_lifting
        (fun a a_1 => { down := Rocq.Corelib.Program.Basics.impl a.down a_1.down }) l x y).down →
    (Rocq.Corelib.Classes.RelationClasses.pointwise_lifting
          (fun a a_1 => { down := Rocq.Corelib.Program.Basics.impl a.down a_1.down }) l y z).down →
      (Rocq.Corelib.Classes.RelationClasses.pointwise_lifting
          (fun a a_1 => { down := Rocq.Corelib.Program.Basics.impl a.down a_1.down }) l x z).down
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.Tlist;Rocq.Corelib.Classes.RelationClasses.arrows;Rocq.Corelib.Classes.RelationClasses.pointwise_lifting;Rocq.Corelib.Program.Basics.impl

## Corelib.Classes.RelationClasses.predicate_intersection

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.RelationClasses.predicate_intersection

Reason for interface not covered: No registered type bijection for (l : Rocq.Corelib.Classes.RelationClasses.Tlist) →
  Rocq.Corelib.Classes.RelationClasses.arrows
    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop))
      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop))
        Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))
    (Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop))

## Corelib.Classes.RelationClasses.predicate_union

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.RelationClasses.predicate_union

Reason for interface not covered: No registered type bijection for (l : Rocq.Corelib.Classes.RelationClasses.Tlist) →
  Rocq.Corelib.Classes.RelationClasses.arrows
    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop))
      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop))
        Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))
    (Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop))

## Corelib.Classes.RelationClasses.reflexivity

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.reflexivity.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.reflexivity.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Reflexive A R → ∀ (x : A), R x x
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Reflexive

## Corelib.Classes.RelationClasses.relation_conjunction

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Classes.RelationClasses.relation_conjunction

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Classes.RelationClasses.relation_conjunction.roundtrip

## Corelib.Classes.RelationClasses.relation_disjunction

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Classes.RelationClasses.relation_disjunction

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Classes.RelationClasses.relation_disjunction.roundtrip

## Corelib.Classes.RelationClasses.relation_equivalence

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Classes.RelationClasses.relation_equivalence

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Classes.RelationClasses.relation_equivalence.roundtrip

## Corelib.Classes.RelationClasses.relation_equivalence_equivalence

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.relation_equivalence_equivalence.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.relation_equivalence_equivalence.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_98),
  Rocq.Corelib.Classes.RelationClasses.Equivalence (Rocq.Corelib.Relations.Relation_Definitions.relation A)
    (Rocq.Corelib.Classes.RelationClasses.relation_equivalence A)
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.relation_equivalence

## Corelib.Classes.RelationClasses.relation_equivalence_rewrite_relation

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.relation_equivalence_rewrite_relation.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.relation_equivalence_rewrite_relation.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_98),
  Rocq.Corelib.Classes.RelationClasses.RewriteRelation (Rocq.Corelib.Relations.Relation_Definitions.relation A)
    (Rocq.Corelib.Classes.RelationClasses.relation_equivalence A)
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.RewriteRelation;Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.relation_equivalence

## Corelib.Classes.RelationClasses.relation_implication_preorder

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.relation_implication_preorder.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.relation_implication_preorder.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21),
  Rocq.Corelib.Classes.RelationClasses.PreOrder (Rocq.Corelib.Relations.Relation_Definitions.relation A)
    (Rocq.Corelib.Classes.RelationClasses.subrelation A)
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.PreOrder;Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.subrelation

## Corelib.Classes.RelationClasses.subrelation

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Classes.RelationClasses.subrelation

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Classes.RelationClasses.subrelation.roundtrip

## Corelib.Classes.RelationClasses.subrelation_partial_order

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Classes.RelationClasses.subrelation_partial_order.statement

## Corelib.Classes.RelationClasses.subrelation_partial_order_obligation_1

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.subrelation_partial_order_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.subrelation_partial_order_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_98),
  Rocq.Corelib.Classes.RelationClasses.relation_equivalence (Rocq.Corelib.Relations.Relation_Definitions.relation A)
    (Rocq.Corelib.Classes.RelationClasses.relation_equivalence A)
    (Rocq.Corelib.Classes.RelationClasses.relation_conjunction (Rocq.Corelib.Relations.Relation_Definitions.relation A)
      (Rocq.Corelib.Classes.RelationClasses.subrelation A)
      (Rocq.Corelib.Program.Basics.flip (Rocq.Corelib.Relations.Relation_Definitions.relation A)
        (Rocq.Corelib.Relations.Relation_Definitions.relation A) Prop
        (Rocq.Corelib.Classes.RelationClasses.subrelation A)))
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.relation_equivalence;Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.relation_conjunction;Rocq.Corelib.Classes.RelationClasses.subrelation;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.RelationClasses.subrelation_symmetric

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.subrelation_symmetric.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.subrelation_symmetric.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Symmetric A R →
    Rocq.Corelib.Classes.RelationClasses.subrelation A (Rocq.Corelib.Program.Basics.flip A A Prop R) R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Symmetric;Rocq.Corelib.Classes.RelationClasses.subrelation;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.RelationClasses.symmetry

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.symmetry.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.symmetry.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Symmetric A R → ∀ (x y : A), R x y → R y x
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Symmetric

## Corelib.Classes.RelationClasses.ternary_operation

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Classes.RelationClasses.ternary_operation

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Classes.RelationClasses.ternary_operation.roundtrip

## Corelib.Classes.RelationClasses.transitivity

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.RelationClasses.transitivity.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.transitivity.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Transitive A R → ∀ (x y z : A), R x y → R y z → R x z
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Transitive

## Corelib.Classes.RelationClasses.true_predicate

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.RelationClasses.true_predicate

Reason for interface not covered: No registered type bijection for (l : Rocq.Corelib.Classes.RelationClasses.Tlist) →
  Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop)

## Corelib.Classes.RelationClasses.unary_operation

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Classes.RelationClasses.unary_operation

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Classes.RelationClasses.unary_operation.roundtrip

## Corelib.Classes.RelationClasses.unary_predicate

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Classes.RelationClasses.unary_predicate

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Classes.RelationClasses.unary_predicate.roundtrip
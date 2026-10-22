# Corelib.Relations.Relation_Definitions

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.Relations.Relation_Definitions.PER

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Relations.Relation_Definitions.PER

## Corelib.Relations.Relation_Definitions.antisymmetric

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Relations.Relation_Definitions.antisymmetric

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Relations.Relation_Definitions.antisymmetric.roundtrip

## Corelib.Relations.Relation_Definitions.commut

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Relations.Relation_Definitions.commut

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Relations.Relation_Definitions.commut.roundtrip

## Corelib.Relations.Relation_Definitions.equiv

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Relations.Relation_Definitions.equiv

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Relations.Relation_Definitions.equiv.roundtrip

## Corelib.Relations.Relation_Definitions.equiv_refl

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Relations.Relation_Definitions.equiv_refl.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Relations.Relation_Definitions.equiv_refl.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Relations.Relation_Definitions.equivalence A R →
    Rocq.Corelib.Relations.Relation_Definitions.reflexive A R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Relations.Relation_Definitions.equivalence;Rocq.Corelib.Relations.Relation_Definitions.reflexive

## Corelib.Relations.Relation_Definitions.equiv_sym

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Relations.Relation_Definitions.equiv_sym.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Relations.Relation_Definitions.equiv_sym.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Relations.Relation_Definitions.equivalence A R →
    Rocq.Corelib.Relations.Relation_Definitions.symmetric A R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Relations.Relation_Definitions.equivalence;Rocq.Corelib.Relations.Relation_Definitions.symmetric

## Corelib.Relations.Relation_Definitions.equiv_trans

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Relations.Relation_Definitions.equiv_trans.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Relations.Relation_Definitions.equiv_trans.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Relations.Relation_Definitions.equivalence A R →
    Rocq.Corelib.Relations.Relation_Definitions.transitive A R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Relations.Relation_Definitions.equivalence;Rocq.Corelib.Relations.Relation_Definitions.transitive

## Corelib.Relations.Relation_Definitions.equivalence

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Relations.Relation_Definitions.equivalence

## Corelib.Relations.Relation_Definitions.inclusion

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Relations.Relation_Definitions.inclusion

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Relations.Relation_Definitions.inclusion.roundtrip

## Corelib.Relations.Relation_Definitions.ord_antisym

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Relations.Relation_Definitions.ord_antisym.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Relations.Relation_Definitions.ord_antisym.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Relations.Relation_Definitions.order A R → Rocq.Corelib.Relations.Relation_Definitions.antisymmetric A R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Relations.Relation_Definitions.order;Rocq.Corelib.Relations.Relation_Definitions.antisymmetric

## Corelib.Relations.Relation_Definitions.ord_refl

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Relations.Relation_Definitions.ord_refl.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Relations.Relation_Definitions.ord_refl.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Relations.Relation_Definitions.order A R → Rocq.Corelib.Relations.Relation_Definitions.reflexive A R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Relations.Relation_Definitions.order;Rocq.Corelib.Relations.Relation_Definitions.reflexive

## Corelib.Relations.Relation_Definitions.ord_trans

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Relations.Relation_Definitions.ord_trans.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Relations.Relation_Definitions.ord_trans.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Relations.Relation_Definitions.order A R → Rocq.Corelib.Relations.Relation_Definitions.transitive A R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Relations.Relation_Definitions.order;Rocq.Corelib.Relations.Relation_Definitions.transitive

## Corelib.Relations.Relation_Definitions.order

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Relations.Relation_Definitions.order

## Corelib.Relations.Relation_Definitions.per_sym

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Relations.Relation_Definitions.per_sym.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Relations.Relation_Definitions.per_sym.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Relations.Relation_Definitions.PER A R → Rocq.Corelib.Relations.Relation_Definitions.symmetric A R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Relations.Relation_Definitions.PER;Rocq.Corelib.Relations.Relation_Definitions.symmetric

## Corelib.Relations.Relation_Definitions.per_trans

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Relations.Relation_Definitions.per_trans.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Relations.Relation_Definitions.per_trans.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Relations.Relation_Definitions.PER A R → Rocq.Corelib.Relations.Relation_Definitions.transitive A R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Relations.Relation_Definitions.PER;Rocq.Corelib.Relations.Relation_Definitions.transitive

## Corelib.Relations.Relation_Definitions.preord_refl

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Relations.Relation_Definitions.preord_refl.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Relations.Relation_Definitions.preord_refl.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Relations.Relation_Definitions.preorder A R → Rocq.Corelib.Relations.Relation_Definitions.reflexive A R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Relations.Relation_Definitions.preorder;Rocq.Corelib.Relations.Relation_Definitions.reflexive

## Corelib.Relations.Relation_Definitions.preord_trans

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Relations.Relation_Definitions.preord_trans.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Relations.Relation_Definitions.preord_trans.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Relations.Relation_Definitions.preorder A R → Rocq.Corelib.Relations.Relation_Definitions.transitive A R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Relations.Relation_Definitions.preorder;Rocq.Corelib.Relations.Relation_Definitions.transitive

## Corelib.Relations.Relation_Definitions.preorder

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Relations.Relation_Definitions.preorder

## Corelib.Relations.Relation_Definitions.reflexive

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Relations.Relation_Definitions.reflexive

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Relations.Relation_Definitions.reflexive.roundtrip

## Corelib.Relations.Relation_Definitions.relation

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Relations.Relation_Definitions.relation

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Relations.Relation_Definitions.relation.roundtrip

## Corelib.Relations.Relation_Definitions.same_relation

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Relations.Relation_Definitions.same_relation

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Relations.Relation_Definitions.same_relation.roundtrip

## Corelib.Relations.Relation_Definitions.symmetric

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Relations.Relation_Definitions.symmetric

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Relations.Relation_Definitions.symmetric.roundtrip

## Corelib.Relations.Relation_Definitions.transitive

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Relations.Relation_Definitions.transitive

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Relations.Relation_Definitions.transitive.roundtrip
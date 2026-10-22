# Corelib.Setoids.Setoid

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.Setoids.Setoid.Build_Setoid_Theory

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Setoids.Setoid.Build_Setoid_Theory.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Setoids.Setoid.Build_Setoid_Theory.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Reflexive A R →
    Rocq.Corelib.Classes.RelationClasses.Symmetric A R →
      Rocq.Corelib.Classes.RelationClasses.Transitive A R → Rocq.Corelib.Classes.RelationClasses.Equivalence A R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Reflexive;Rocq.Corelib.Classes.RelationClasses.Symmetric;Rocq.Corelib.Classes.RelationClasses.Transitive;Rocq.Corelib.Classes.RelationClasses.Equivalence

## Corelib.Setoids.Setoid.Seq_refl

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Setoids.Setoid.Seq_refl.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Setoids.Setoid.Seq_refl.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (Aeq : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Setoids.Setoid.Setoid_Theory A Aeq → ∀ (x : A), Aeq x x
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Setoids.Setoid.Setoid_Theory

## Corelib.Setoids.Setoid.Seq_sym

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Setoids.Setoid.Seq_sym.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Setoids.Setoid.Seq_sym.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (Aeq : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Setoids.Setoid.Setoid_Theory A Aeq → ∀ (x y : A), Aeq x y → Aeq y x
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Setoids.Setoid.Setoid_Theory

## Corelib.Setoids.Setoid.Seq_trans

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Setoids.Setoid.Seq_trans.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Setoids.Setoid.Seq_trans.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (Aeq : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Setoids.Setoid.Setoid_Theory A Aeq → ∀ (x y z : A), Aeq x y → Aeq y z → Aeq x z
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Setoids.Setoid.Setoid_Theory

## Corelib.Setoids.Setoid.Setoid_Theory

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Setoids.Setoid.Setoid_Theory

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Setoids.Setoid.Setoid_Theory.roundtrip

## Corelib.Setoids.Setoid.gen_st

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Setoids.Setoid.gen_st.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Setoids.Setoid.gen_st.statement.correspondence

```lean
∀ (A : Type), Rocq.Corelib.Setoids.Setoid.Setoid_Theory A (Rocq.Corelib.Init.Logic.eq A)
```

Residual source symbols: Rocq.Corelib.Setoids.Setoid.Setoid_Theory;Rocq.Corelib.Init.Logic.eq
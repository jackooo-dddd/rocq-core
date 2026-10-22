# Corelib.Classes.Equivalence

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.Classes.Equivalence.equiv

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.Equivalence.equiv

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Classes.RelationClasses.Equivalence A R

## Corelib.Classes.Equivalence.equiv_reflexive

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Equivalence.equiv_reflexive.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Equivalence.equiv_reflexive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (sa : Rocq.Corelib.Classes.RelationClasses.Equivalence A R),
  Rocq.Corelib.Classes.RelationClasses.Reflexive A (Rocq.Corelib.Classes.Equivalence.equiv A R sa)
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.Reflexive;Rocq.Corelib.Classes.Equivalence.equiv

## Corelib.Classes.Equivalence.equiv_reflexive_obligation_1

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Equivalence.equiv_reflexive_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Equivalence.equiv_reflexive_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (sa : Rocq.Corelib.Classes.RelationClasses.Equivalence A R) (x : A), Rocq.Corelib.Classes.Equivalence.equiv A R sa x x
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.Equivalence.equiv

## Corelib.Classes.Equivalence.equiv_symmetric

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Equivalence.equiv_symmetric.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Equivalence.equiv_symmetric.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (sa : Rocq.Corelib.Classes.RelationClasses.Equivalence A R),
  Rocq.Corelib.Classes.RelationClasses.Symmetric A (Rocq.Corelib.Classes.Equivalence.equiv A R sa)
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.Symmetric;Rocq.Corelib.Classes.Equivalence.equiv

## Corelib.Classes.Equivalence.equiv_symmetric_obligation_1

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Equivalence.equiv_symmetric_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Equivalence.equiv_symmetric_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (sa : Rocq.Corelib.Classes.RelationClasses.Equivalence A R) (x y : A),
  Rocq.Corelib.Classes.Equivalence.equiv A R sa x y → Rocq.Corelib.Classes.Equivalence.equiv A R sa y x
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.Equivalence.equiv

## Corelib.Classes.Equivalence.equiv_transitive

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Equivalence.equiv_transitive.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Equivalence.equiv_transitive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (sa : Rocq.Corelib.Classes.RelationClasses.Equivalence A R),
  Rocq.Corelib.Classes.RelationClasses.Transitive A (Rocq.Corelib.Classes.Equivalence.equiv A R sa)
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.Transitive;Rocq.Corelib.Classes.Equivalence.equiv

## Corelib.Classes.Equivalence.equiv_transitive_obligation_1

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Equivalence.equiv_transitive_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Equivalence.equiv_transitive_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (sa : Rocq.Corelib.Classes.RelationClasses.Equivalence A R) (x y z : A),
  Rocq.Corelib.Classes.Equivalence.equiv A R sa x y →
    Rocq.Corelib.Classes.Equivalence.equiv A R sa y z → Rocq.Corelib.Classes.Equivalence.equiv A R sa x z
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.Equivalence.equiv

## Corelib.Classes.Equivalence.pequiv

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.Equivalence.pequiv

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Classes.RelationClasses.PER A R

## Corelib.Classes.Equivalence.pointwise_equivalence

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Equivalence.pointwise_equivalence.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Equivalence.pointwise_equivalence.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_39) (B : Type u_Corelib_Classes_Morphisms_38)
  (eqB : Rocq.Corelib.Relations.Relation_Definitions.relation B),
  Rocq.Corelib.Classes.RelationClasses.Equivalence B eqB →
    Rocq.Corelib.Classes.RelationClasses.Equivalence (A → B) (Rocq.Corelib.Classes.Morphisms.pointwise_relation A B eqB)
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.Morphisms.pointwise_relation

## Corelib.Classes.Equivalence.pointwise_reflexive

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Equivalence.pointwise_reflexive.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Equivalence.pointwise_reflexive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_39) (B : Type u_Corelib_Classes_Morphisms_38)
  (eqB : Rocq.Corelib.Relations.Relation_Definitions.relation B),
  Rocq.Corelib.Classes.RelationClasses.Reflexive B eqB →
    Rocq.Corelib.Classes.RelationClasses.Reflexive (A → B) (Rocq.Corelib.Classes.Morphisms.pointwise_relation A B eqB)
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Reflexive;Rocq.Corelib.Classes.Morphisms.pointwise_relation

## Corelib.Classes.Equivalence.pointwise_symmetric

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Equivalence.pointwise_symmetric.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Equivalence.pointwise_symmetric.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_39) (B : Type u_Corelib_Classes_Morphisms_38)
  (eqB : Rocq.Corelib.Relations.Relation_Definitions.relation B),
  Rocq.Corelib.Classes.RelationClasses.Symmetric B eqB →
    Rocq.Corelib.Classes.RelationClasses.Symmetric (A → B) (Rocq.Corelib.Classes.Morphisms.pointwise_relation A B eqB)
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Symmetric;Rocq.Corelib.Classes.Morphisms.pointwise_relation

## Corelib.Classes.Equivalence.pointwise_transitive

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Equivalence.pointwise_transitive.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Equivalence.pointwise_transitive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_39) (B : Type u_Corelib_Classes_Morphisms_38)
  (eqB : Rocq.Corelib.Relations.Relation_Definitions.relation B),
  Rocq.Corelib.Classes.RelationClasses.Transitive B eqB →
    Rocq.Corelib.Classes.RelationClasses.Transitive (A → B) (Rocq.Corelib.Classes.Morphisms.pointwise_relation A B eqB)
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Transitive;Rocq.Corelib.Classes.Morphisms.pointwise_relation

## Corelib.Classes.Equivalence.respecting

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.Equivalence.respecting

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Classes.RelationClasses.Equivalence A R

## Corelib.Classes.Equivalence.respecting_equiv

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Equivalence.respecting_equiv.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Equivalence.respecting_equiv.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Equivalence_46) (R : A → A → Prop),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A R →
    ∀ (B : Type u_Corelib_Classes_Equivalence_49) (R' : B → B → Prop),
      Rocq.Corelib.Classes.RelationClasses.Equivalence B R' →
        Rocq.Corelib.Classes.RelationClasses.Equivalence
          (Rocq.Corelib.Init.Specif.sig (A → B) fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y)) fun f g =>
          ∀ (x y : A),
            R x y →
              R'
                (Rocq.Corelib.Init.Specif.proj1_sig (A → B) (fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y)) f
                  x)
                (Rocq.Corelib.Init.Specif.proj1_sig (A → B) (fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y)) g
                  y)
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Init.Specif.sig;Rocq.Corelib.Init.Specif.proj1_sig

## Corelib.Classes.Equivalence.respecting_equiv_obligation_1

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Equivalence.respecting_equiv_obligation_1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Equivalence.respecting_equiv_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Equivalence_46) (R : A → A → Prop),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A R →
    ∀ (B : Type u_Corelib_Classes_Equivalence_49) (R' : B → B → Prop),
      Rocq.Corelib.Classes.RelationClasses.Equivalence B R' →
        ∀ (x : Rocq.Corelib.Init.Specif.sig (A → B) fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y))
          (x_1 y : A),
          R x_1 y →
            R'
              (Rocq.Corelib.Init.Specif.proj1_sig (A → B) (fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y)) x
                x_1)
              (Rocq.Corelib.Init.Specif.proj1_sig (A → B) (fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y)) x
                y)
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Init.Specif.sig;Rocq.Corelib.Init.Specif.proj1_sig

## Corelib.Classes.Equivalence.respecting_equiv_obligation_2

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Equivalence.respecting_equiv_obligation_2.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Equivalence.respecting_equiv_obligation_2.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Equivalence_46) (R : A → A → Prop),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A R →
    ∀ (B : Type u_Corelib_Classes_Equivalence_49) (R' : B → B → Prop),
      Rocq.Corelib.Classes.RelationClasses.Equivalence B R' →
        ∀ (x y : Rocq.Corelib.Init.Specif.sig (A → B) fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y)),
          (∀ (x_1 y_1 : A),
              R x_1 y_1 →
                R'
                  (Rocq.Corelib.Init.Specif.proj1_sig (A → B) (fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y))
                    x x_1)
                  (Rocq.Corelib.Init.Specif.proj1_sig (A → B) (fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y))
                    y y_1)) →
            ∀ (x_1 y_1 : A),
              R x_1 y_1 →
                R'
                  (Rocq.Corelib.Init.Specif.proj1_sig (A → B) (fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y))
                    y x_1)
                  (Rocq.Corelib.Init.Specif.proj1_sig (A → B) (fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y))
                    x y_1)
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Init.Specif.sig;Rocq.Corelib.Init.Specif.proj1_sig

## Corelib.Classes.Equivalence.respecting_equiv_obligation_3

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.Equivalence.respecting_equiv_obligation_3.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.Equivalence.respecting_equiv_obligation_3.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Equivalence_46) (R : A → A → Prop),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A R →
    ∀ (B : Type u_Corelib_Classes_Equivalence_49) (R' : B → B → Prop),
      Rocq.Corelib.Classes.RelationClasses.Equivalence B R' →
        ∀ (x y z : Rocq.Corelib.Init.Specif.sig (A → B) fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y)),
          (∀ (x_1 y_1 : A),
              R x_1 y_1 →
                R'
                  (Rocq.Corelib.Init.Specif.proj1_sig (A → B) (fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y))
                    x x_1)
                  (Rocq.Corelib.Init.Specif.proj1_sig (A → B) (fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y))
                    y y_1)) →
            (∀ (x y_1 : A),
                R x y_1 →
                  R'
                    (Rocq.Corelib.Init.Specif.proj1_sig (A → B)
                      (fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y)) y x)
                    (Rocq.Corelib.Init.Specif.proj1_sig (A → B)
                      (fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y)) z y_1)) →
              ∀ (x_1 y : A),
                R x_1 y →
                  R'
                    (Rocq.Corelib.Init.Specif.proj1_sig (A → B)
                      (fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y)) x x_1)
                    (Rocq.Corelib.Init.Specif.proj1_sig (A → B)
                      (fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y)) z y)
```

Residual source symbols: Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Init.Specif.sig;Rocq.Corelib.Init.Specif.proj1_sig
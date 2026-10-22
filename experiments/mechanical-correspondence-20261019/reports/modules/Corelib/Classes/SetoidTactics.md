# Corelib.Classes.SetoidTactics

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.Classes.SetoidTactics.DefaultRelation

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.SetoidTactics.DefaultRelation

## Corelib.Classes.SetoidTactics.default_relation

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Classes.SetoidTactics.default_relation

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Classes.SetoidTactics.DefaultRelation A R

## Corelib.Classes.SetoidTactics.equivalence_default

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Classes.SetoidTactics.equivalence_default.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Classes.SetoidTactics.equivalence_default.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A R → Rocq.Corelib.Classes.SetoidTactics.DefaultRelation A R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.SetoidTactics.DefaultRelation
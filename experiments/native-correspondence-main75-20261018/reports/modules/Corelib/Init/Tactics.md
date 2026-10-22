# Corelib.Init.Tactics

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.Init.Tactics.decide_left

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Tactics.decide_left.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Tactics.decide_left.statement.correspondence

```lean
∀ (C : Prop) (decide : Rocq.Corelib.Init.Specif.sumbool C (Rocq.Corelib.Init.Logic.not C)),
  C →
    ∀ (P : Rocq.Corelib.Init.Specif.sumbool C (Rocq.Corelib.Init.Logic.not C) → Prop),
      (∀ (H : C), P (Rocq.Corelib.Init.Specif.sumbool.left C (Rocq.Corelib.Init.Logic.not C) H)) → P decide
```

Residual source symbols: Rocq.Corelib.Init.Specif.sumbool;Rocq.Corelib.Init.Logic.not;Rocq.Corelib.Init.Specif.sumbool.left

## Corelib.Init.Tactics.decide_right

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Tactics.decide_right.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Tactics.decide_right.statement.correspondence

```lean
∀ (C : Prop) (decide : Rocq.Corelib.Init.Specif.sumbool C (Rocq.Corelib.Init.Logic.not C)),
  ¬C →
    ∀ (P : Rocq.Corelib.Init.Specif.sumbool C (Rocq.Corelib.Init.Logic.not C) → Prop),
      (∀ (H : ¬C), P (Rocq.Corelib.Init.Specif.sumbool.right C (Rocq.Corelib.Init.Logic.not C) ⋯)) → P decide
```

Residual source symbols: Rocq.Corelib.Init.Specif.sumbool;Rocq.Corelib.Init.Logic.not;Rocq.Corelib.Init.Specif.sumbool.right
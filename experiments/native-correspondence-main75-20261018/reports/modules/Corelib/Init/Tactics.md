# Corelib.Init.Tactics

每项对应机械翻译基线中的一个 root。完整 native statement / interface 类型在总 JSON 文件中。



## Corelib.Init.Tactics.decide_left

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Tactics.decide_left.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Tactics.decide_left.statement.correspondence

```lean
∀ (C : Prop) (decide : Rocq.Corelib.Init.Specif.sumbool C (Rocq.Corelib.Init.Logic.not C)),
  C →
    ∀ (P : Rocq.Corelib.Init.Specif.sumbool C (Rocq.Corelib.Init.Logic.not C) → Prop),
      (∀ (H : C), P (Rocq.Corelib.Init.Specif.sumbool.left C (Rocq.Corelib.Init.Logic.not C) H)) → P decide
```

残留源符号：Rocq.Corelib.Init.Specif.sumbool;Rocq.Corelib.Init.Logic.not;Rocq.Corelib.Init.Specif.sumbool.left

## Corelib.Init.Tactics.decide_right

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Tactics.decide_right.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Tactics.decide_right.statement.correspondence

```lean
∀ (C : Prop) (decide : Rocq.Corelib.Init.Specif.sumbool C (Rocq.Corelib.Init.Logic.not C)),
  ¬C →
    ∀ (P : Rocq.Corelib.Init.Specif.sumbool C (Rocq.Corelib.Init.Logic.not C) → Prop),
      (∀ (H : ¬C), P (Rocq.Corelib.Init.Specif.sumbool.right C (Rocq.Corelib.Init.Logic.not C) ⋯)) → P decide
```

残留源符号：Rocq.Corelib.Init.Specif.sumbool;Rocq.Corelib.Init.Logic.not;Rocq.Corelib.Init.Specif.sumbool.right
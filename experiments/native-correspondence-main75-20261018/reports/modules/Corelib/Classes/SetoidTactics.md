# Corelib.Classes.SetoidTactics

每项对应机械翻译基线中的一个 root。完整 native statement / interface 类型在总 JSON 文件中。



## Corelib.Classes.SetoidTactics.DefaultRelation

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Classes.SetoidTactics.DefaultRelation

## Corelib.Classes.SetoidTactics.default_relation

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Classes.SetoidTactics.default_relation

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Classes.SetoidTactics.DefaultRelation A R

## Corelib.Classes.SetoidTactics.equivalence_default

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.SetoidTactics.equivalence_default.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.SetoidTactics.equivalence_default.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A R → Rocq.Corelib.Classes.SetoidTactics.DefaultRelation A R
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.SetoidTactics.DefaultRelation
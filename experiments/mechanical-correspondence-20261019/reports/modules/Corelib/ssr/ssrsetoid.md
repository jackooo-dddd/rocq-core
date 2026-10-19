# Corelib.ssr.ssrsetoid

每项对应机械翻译基线中的一个 root。完整 native statement / interface 类型在总 JSON 文件中。



## Corelib.ssr.ssrsetoid.compat_Reflexive

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrsetoid.compat_Reflexive.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrsetoid.compat_Reflexive.statement.correspondence

```lean
∀ (A : Type u_Corelib_ssr_ssrsetoid_22) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Reflexive A R → Rocq.Corelib.ssr.ssrclasses.Reflexive A R
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Reflexive;Rocq.Corelib.ssr.ssrclasses.Reflexive
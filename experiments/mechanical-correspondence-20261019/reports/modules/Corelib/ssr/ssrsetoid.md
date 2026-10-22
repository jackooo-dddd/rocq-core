# Corelib.ssr.ssrsetoid

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.ssr.ssrsetoid.compat_Reflexive

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrsetoid.compat_Reflexive.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrsetoid.compat_Reflexive.statement.correspondence

```lean
∀ (A : Type u_Corelib_ssr_ssrsetoid_22) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Reflexive A R → Rocq.Corelib.ssr.ssrclasses.Reflexive A R
```

Residual source symbols: Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Reflexive;Rocq.Corelib.ssr.ssrclasses.Reflexive
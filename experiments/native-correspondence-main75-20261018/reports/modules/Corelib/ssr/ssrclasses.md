# Corelib.ssr.ssrclasses

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.ssr.ssrclasses.Reflexive

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrclasses.Reflexive

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrclasses.Reflexive.roundtrip

## Corelib.ssr.ssrclasses.eq_Reflexive

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrclasses.eq_Reflexive.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrclasses.eq_Reflexive.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrclasses_23), Rocq.Corelib.ssr.ssrclasses.Reflexive A Eq
```

Residual source symbols: Rocq.Corelib.ssr.ssrclasses.Reflexive

## Corelib.ssr.ssrclasses.iff_Reflexive

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrclasses.iff_Reflexive.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrclasses.iff_Reflexive.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrclasses.Reflexive Prop Rocq.Corelib.Init.Logic.iff
```

Residual source symbols: Rocq.Corelib.ssr.ssrclasses.Reflexive;Rocq.Corelib.Init.Logic.iff

## Corelib.ssr.ssrclasses.reflexivity

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrclasses.reflexivity.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrclasses.reflexivity.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrclasses_21) (R : A → A → Prop),
  Rocq.Corelib.ssr.ssrclasses.Reflexive A R → ∀ (x : A), R x x
```

Residual source symbols: Rocq.Corelib.ssr.ssrclasses.Reflexive
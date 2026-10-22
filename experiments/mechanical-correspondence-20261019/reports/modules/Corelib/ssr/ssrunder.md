# Corelib.ssr.ssrunder

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.ssr.ssrunder.Under_rel.Over_rel

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrunder.Under_rel.Over_rel

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrunder.Under_rel.Over_rel.roundtrip

## Corelib.ssr.ssrunder.Under_rel.Under_rel

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel.roundtrip

## Corelib.ssr.ssrunder.Under_rel.Under_relE

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrunder.Under_rel.Under_relE.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrunder.Under_rel.Under_relE.statement.correspondence

```lean
∀ (A : Type u_Corelib_ssr_ssrunder_21) (eqA : A → A → Prop), Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel A eqA = eqA
```

Residual source symbols: Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel

## Corelib.ssr.ssrunder.Under_rel.Under_rel_from_rel

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel_from_rel.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel_from_rel.statement.correspondence

```lean
∀ (A : Type u_Corelib_ssr_ssrunder_21) (eqA : A → A → Prop) (x y : A),
  Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel A eqA x y → eqA x y
```

Residual source symbols: Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel

## Corelib.ssr.ssrunder.Under_rel.over_rel

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrunder.Under_rel.over_rel.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrunder.Under_rel.over_rel.statement.correspondence

```lean
∀ (A : Type u_Corelib_ssr_ssrunder_21) (eqA : A → A → Prop) (x y : A),
  Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel A eqA x y = Rocq.Corelib.ssr.ssrunder.Under_rel.Over_rel A eqA x y
```

Residual source symbols: Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel;Rocq.Corelib.ssr.ssrunder.Under_rel.Over_rel

## Corelib.ssr.ssrunder.Under_rel.over_rel_done

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrunder.Under_rel.over_rel_done.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrunder.Under_rel.over_rel_done.statement.correspondence

```lean
∀ (A : Type u_Corelib_ssr_ssrunder_28) (eqA : A → A → Prop),
  Rocq.Corelib.ssr.ssrclasses.Reflexive A eqA → ∀ (x : A), Rocq.Corelib.ssr.ssrunder.Under_rel.Over_rel A eqA x x
```

Residual source symbols: Rocq.Corelib.ssr.ssrclasses.Reflexive;Rocq.Corelib.ssr.ssrunder.Under_rel.Over_rel

## Corelib.ssr.ssrunder.Under_rel.under_rel_done

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrunder.Under_rel.under_rel_done.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrunder.Under_rel.under_rel_done.statement.correspondence

```lean
∀ (A : Type u_Corelib_ssr_ssrunder_29) (eqA : A → A → Prop),
  Rocq.Corelib.ssr.ssrclasses.Reflexive A eqA → ∀ (x : A), Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel A eqA x x
```

Residual source symbols: Rocq.Corelib.ssr.ssrclasses.Reflexive;Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel
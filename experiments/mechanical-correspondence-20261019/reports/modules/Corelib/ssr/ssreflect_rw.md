# Corelib.ssr.ssreflect_rw

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.ssr.ssreflect_rw.NonPropType.call

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssreflect_rw.NonPropType.call

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssreflect_rw.NonPropType.call_of
  (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.maybeProp T) Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssreflect_rw.NonPropType.call_of

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssreflect_rw.NonPropType.call_of

## Corelib.ssr.ssreflect_rw.NonPropType.callee

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssreflect_rw.NonPropType.callee

Reason for interface not covered: No registered type bijection for (condition : Rocq.Corelib.Init.Datatypes.unit) →
  (result : Rocq.Corelib.Init.Datatypes.bool) →
    Rocq.Corelib.ssr.ssreflect_rw.NonPropType.call_of condition result → Type u_Corelib_ssr_ssreflect_rw_178

## Corelib.ssr.ssreflect_rw.NonPropType.check

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssreflect_rw.NonPropType.check

Reason for interface not covered: No registered type bijection for (result : Rocq.Corelib.Init.Datatypes.bool) →
  (test : Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test_of result) →
    Rocq.Corelib.ssr.ssreflect_rw.NonPropType.call_of (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.condition result test)
        result →
      Rocq.Corelib.ssr.ssreflect_rw.NonPropType.type

## Corelib.ssr.ssreflect_rw.NonPropType.condition

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssreflect_rw.NonPropType.condition

Reason for interface not covered: No registered type bijection for (result : Rocq.Corelib.Init.Datatypes.bool) →
  Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test_of result → Rocq.Corelib.Init.Datatypes.unit

## Corelib.ssr.ssreflect_rw.NonPropType.frame

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssreflect_rw.NonPropType.frame

Reason for interface not covered: No registered type bijection for (t : Rocq.Corelib.ssr.ssreflect_rw.NonPropType.type) →
  Rocq.Corelib.ssr.ssreflect_rw.NonPropType.call_of
    (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.condition (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result t)
      (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test t))
    (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result t)

## Corelib.ssr.ssreflect_rw.NonPropType.maybeProp

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssreflect_rw.NonPropType.maybeProp

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssreflect_rw.NonPropType.maybeProp.roundtrip

## Corelib.ssr.ssreflect_rw.NonPropType.result

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssreflect_rw.NonPropType.type

## Corelib.ssr.ssreflect_rw.NonPropType.test

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test

Reason for interface not covered: No registered type bijection for (t : Rocq.Corelib.ssr.ssreflect_rw.NonPropType.type) →
  Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test_of (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result t)

## Corelib.ssr.ssreflect_rw.NonPropType.test_Prop

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test_Prop

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test_of Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.ssr.ssreflect_rw.NonPropType.test_negative

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test_negative

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test_of
  Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssreflect_rw.NonPropType.test_of

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test_of

## Corelib.ssr.ssreflect_rw.NonPropType.type

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssreflect_rw.NonPropType.type

## Corelib.ssr.ssreflect_rw.TheCanonical.get

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssreflect_rw.TheCanonical.get

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssreflect_rw.TheCanonical.put vT sT v v s

## Corelib.ssr.ssreflect_rw.TheCanonical.get_by

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssreflect_rw.TheCanonical.get_by

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssreflect_rw.TheCanonical.put vT sT v v s

## Corelib.ssr.ssreflect_rw.TheCanonical.put

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssreflect_rw.TheCanonical.put

## Corelib.ssr.ssreflect_rw.UnderE

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssreflect_rw.UnderE.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssreflect_rw.UnderE.statement.correspondence

```lean
∀ (A : Type u_Corelib_ssr_ssrunder_21) (eqA : A → A → Prop), Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel A eqA = eqA
```

Residual source symbols: Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel

## Corelib.ssr.ssreflect_rw.abstract

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssreflect_rw.abstract

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssreflect_rw.abstract.roundtrip

## Corelib.ssr.ssreflect_rw.abstract_context

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssreflect_rw.abstract_context

## Corelib.ssr.ssreflect_rw.abstract_key

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssreflect_rw.abstract_key

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssreflect_rw.abstract_key.roundtrip

## Corelib.ssr.ssreflect_rw.abstract_lock

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssreflect_rw.abstract_lock

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssreflect_rw.abstract_lock.roundtrip

## Corelib.ssr.ssreflect_rw.argumentType

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssreflect_rw.argumentType

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssreflect_rw.argumentType.roundtrip

## Corelib.ssr.ssreflect_rw.dependentReturnType

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssreflect_rw.dependentReturnType

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssreflect_rw.dependentReturnType.roundtrip

## Corelib.ssr.ssreflect_rw.external_view

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssreflect_rw.external_view

## Corelib.ssr.ssreflect_rw.external_view_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssreflect_rw.external_view_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssreflect_rw.external_view_ind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.ssr.ssreflect_rw.external_view → Prop),
  (∀ (T : Type u_Corelib_ssr_ssreflect_rw_25), P (Rocq.Corelib.ssr.ssreflect_rw.external_view.tactic_view T)) →
    ∀ (e : Rocq.Corelib.ssr.ssreflect_rw.external_view), P e
```

Residual source symbols: Rocq.Corelib.ssr.ssreflect_rw.external_view;Rocq.Corelib.ssr.ssreflect_rw.external_view.tactic_view

## Corelib.ssr.ssreflect_rw.external_view_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssreflect_rw.external_view_rec

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.ssr.ssreflect_rw.external_view → Type) →
  ((T : Type u_Corelib_ssr_ssreflect_rw_25) → P (Rocq.Corelib.ssr.ssreflect_rw.external_view.tactic_view T)) →
    (e : Rocq.Corelib.ssr.ssreflect_rw.external_view) → P e

## Corelib.ssr.ssreflect_rw.external_view_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssreflect_rw.external_view_rect

Reason for interface not covered: No registered type bijection for (P:
    Rocq.Corelib.ssr.ssreflect_rw.external_view → Type u_Corelib_ssr_ssreflect_rw_27) →
  ((T : Type u_Corelib_ssr_ssreflect_rw_25) → P (Rocq.Corelib.ssr.ssreflect_rw.external_view.tactic_view T)) →
    (e : Rocq.Corelib.ssr.ssreflect_rw.external_view) → P e

## Corelib.ssr.ssreflect_rw.external_view_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssreflect_rw.external_view_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssreflect_rw.external_view_sind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.ssr.ssreflect_rw.external_view → Prop),
  (∀ (T : Type u_Corelib_ssr_ssreflect_rw_25), P (Rocq.Corelib.ssr.ssreflect_rw.external_view.tactic_view T)) →
    ∀ (e : Rocq.Corelib.ssr.ssreflect_rw.external_view), P e
```

Residual source symbols: Rocq.Corelib.ssr.ssreflect_rw.external_view;Rocq.Corelib.ssr.ssreflect_rw.external_view.tactic_view

## Corelib.ssr.ssreflect_rw.iffLR

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.ssr.ssreflect_rw.iffLR.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssreflect_rw.iffLR.statement.correspondence

```lean
∀ (P Q : Prop), (P ↔ Q) → P → Q
```

## Corelib.ssr.ssreflect_rw.iffLRn

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.ssr.ssreflect_rw.iffLRn.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssreflect_rw.iffLRn.statement.correspondence

```lean
∀ (P Q : Prop), (P ↔ Q) → ¬P → ¬Q
```

## Corelib.ssr.ssreflect_rw.iffRL

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.ssr.ssreflect_rw.iffRL.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssreflect_rw.iffRL.statement.correspondence

```lean
∀ (P Q : Prop), (P ↔ Q) → Q → P
```

## Corelib.ssr.ssreflect_rw.iffRLn

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.ssr.ssreflect_rw.iffRLn.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssreflect_rw.iffRLn.statement.correspondence

```lean
∀ (P Q : Prop), (P ↔ Q) → ¬Q → ¬P
```

## Corelib.ssr.ssreflect_rw.lock

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssreflect_rw.lock.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssreflect_rw.lock.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssreflect_rw_77) (x : A), x = Rocq.Corelib.ssr.ssreflect_rw.locked A x
```

Residual source symbols: Rocq.Corelib.ssr.ssreflect_rw.locked

## Corelib.ssr.ssreflect_rw.locked

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssreflect_rw.locked

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssreflect_rw.locked.roundtrip

## Corelib.ssr.ssreflect_rw.locked_with

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssreflect_rw.locked_with

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssreflect_rw.locked_with.roundtrip

## Corelib.ssr.ssreflect_rw.locked_withE

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssreflect_rw.locked_withE.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssreflect_rw.locked_withE.statement.correspondence

```lean
∀ (T : Sort u_Corelib_ssr_ssreflect_rw_99) (k : Rocq.Corelib.Init.Datatypes.unit) (x : T),
  Rocq.Corelib.ssr.ssreflect_rw.locked_with k T x = x
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.unit;Rocq.Corelib.ssr.ssreflect_rw.locked_with

## Corelib.ssr.ssreflect_rw.locked_with_unlockable

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssreflect_rw.locked_with_unlockable

## Corelib.ssr.ssreflect_rw.master_key

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssreflect_rw.master_key

## Corelib.ssr.ssreflect_rw.nary_congruence

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssreflect_rw.nary_congruence.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssreflect_rw.nary_congruence.statement.correspondence

```lean
∀ (n : Nat), Rocq.Corelib.ssr.ssreflect_rw.nary_congruence_statement (NativeBridge.natOf n) fun B e => ∀ (y : B), e y y
```

Residual source symbols: Rocq.Corelib.ssr.ssreflect_rw.nary_congruence_statement

## Corelib.ssr.ssreflect_rw.nary_congruence_statement

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssreflect_rw.nary_congruence_statement

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssreflect_rw.nary_congruence_statement.roundtrip

## Corelib.ssr.ssreflect_rw.over

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssreflect_rw.over.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssreflect_rw.over.statement.correspondence

```lean
∀ (A : Type u_Corelib_ssr_ssrunder_21) (eqA : A → A → Prop) (x y : A),
  Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel A eqA x y = Rocq.Corelib.ssr.ssrunder.Under_rel.Over_rel A eqA x y
```

Residual source symbols: Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel;Rocq.Corelib.ssr.ssrunder.Under_rel.Over_rel

## Corelib.ssr.ssreflect_rw.phant

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssreflect_rw.phant

## Corelib.ssr.ssreflect_rw.phantom

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssreflect_rw.phantom

## Corelib.ssr.ssreflect_rw.protect_term

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssreflect_rw.protect_term

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssreflect_rw.protect_term.roundtrip

## Corelib.ssr.ssreflect_rw.returnType

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssreflect_rw.returnType

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssreflect_rw.returnType.roundtrip

## Corelib.ssr.ssreflect_rw.ssr_congr_arrow

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssreflect_rw.ssr_congr_arrow

## Corelib.ssr.ssreflect_rw.ssr_converse

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssreflect_rw.ssr_converse

## Corelib.ssr.ssreflect_rw.ssr_have

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.ssr.ssreflect_rw.ssr_have.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssreflect_rw.ssr_have.statement.correspondence

```lean
∀ (Plemma Pgoal : Prop), Plemma → (Plemma → Pgoal) → Pgoal
```

## Corelib.ssr.ssreflect_rw.ssr_have_upoly

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssreflect_rw.ssr_have_upoly

## Corelib.ssr.ssreflect_rw.unlock

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssreflect_rw.unlock.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssreflect_rw.unlock.statement.correspondence

```lean
∀ (T : Sort u_Corelib_ssr_ssreflect_rw_88) (x : T) (C : Rocq.Corelib.ssr.ssreflect_rw.unlockable T x),
  Rocq.Corelib.ssr.ssreflect_rw.unlocked T x C = x
```

Residual source symbols: Rocq.Corelib.ssr.ssreflect_rw.unlockable;Rocq.Corelib.ssr.ssreflect_rw.unlocked

## Corelib.ssr.ssreflect_rw.unlock_with

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssreflect_rw.unlock_with.statement

## Corelib.ssr.ssreflect_rw.unlockable

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssreflect_rw.unlockable

## Corelib.ssr.ssreflect_rw.unlocked

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssreflect_rw.unlocked

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssreflect_rw.unlockable T v

## Corelib.ssr.ssreflect_rw.vm_compute

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssreflect_rw.vm_compute.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssreflect_rw.vm_compute.statement.correspondence

```lean
∀ (T : Sort u_Corelib_ssr_ssreflect_rw_187) (x y : T), Rocq.Corelib.ssr.ssreflect_rw.vm_compute_eq T x y → x = y
```

Residual source symbols: Rocq.Corelib.ssr.ssreflect_rw.vm_compute_eq

## Corelib.ssr.ssreflect_rw.vm_compute_eq

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssreflect_rw.vm_compute_eq

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssreflect_rw.vm_compute_eq.roundtrip
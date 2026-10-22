# Corelib.Init.Logic

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.Init.Logic.False

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Logic.False

Operation/Type Certificate: NativeBridge.false_agrees

## Corelib.Init.Logic.False_ind

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.False_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.False_ind.statement.correspondence

```lean
∀ (P : Prop), False → P
```

## Corelib.Init.Logic.False_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Logic.False_rec

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Logic.False

## Corelib.Init.Logic.False_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Logic.False_rect

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Logic.False

## Corelib.Init.Logic.False_sind

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.False_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.False_sind.statement.correspondence

```lean
∀ (P : Prop), False → P
```

## Corelib.Init.Logic.True

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Logic.True

Operation/Type Certificate: NativeBridge.true_agrees

## Corelib.Init.Logic.True_ind

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.True_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.True_ind.statement.correspondence

```lean
∀ (P : Prop), P → True → P
```

## Corelib.Init.Logic.True_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Logic.True_rec

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Logic.True

## Corelib.Init.Logic.True_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Logic.True_rect

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Logic.True

## Corelib.Init.Logic.True_sind

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.True_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.True_sind.statement.correspondence

```lean
∀ (P : Prop), P → True → P
```

## Corelib.Init.Logic.absurd

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.absurd.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.absurd.statement.correspondence

```lean
∀ (A C : Prop), A → ¬A → C
```

## Corelib.Init.Logic.all

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Logic.all

Operation/Type Certificate: NativeBridge.all_agrees

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Logic.all.roundtrip

## Corelib.Init.Logic.and

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Logic.and

Operation/Type Certificate: NativeBridge.and_agrees

## Corelib.Init.Logic.and_assoc

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.and_assoc.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.and_assoc.statement.correspondence

```lean
∀ (A B C : Prop), (A ∧ B) ∧ C ↔ A ∧ B ∧ C
```

## Corelib.Init.Logic.and_cancel_l

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.and_cancel_l.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.and_cancel_l.statement.correspondence

```lean
∀ (A B C : Prop), (B → A) → (C → A) → ((A ∧ B ↔ A ∧ C) ↔ (B ↔ C))
```

## Corelib.Init.Logic.and_cancel_r

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.and_cancel_r.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.and_cancel_r.statement.correspondence

```lean
∀ (A B C : Prop), (B → A) → (C → A) → ((B ∧ A ↔ C ∧ A) ↔ (B ↔ C))
```

## Corelib.Init.Logic.and_comm

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.and_comm.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.and_comm.statement.correspondence

```lean
∀ (A B : Prop), A ∧ B ↔ B ∧ A
```

## Corelib.Init.Logic.and_iff_compat_l

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.and_iff_compat_l.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.and_iff_compat_l.statement.correspondence

```lean
∀ (A B C : Prop), (B ↔ C) → (A ∧ B ↔ A ∧ C)
```

## Corelib.Init.Logic.and_iff_compat_r

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.and_iff_compat_r.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.and_iff_compat_r.statement.correspondence

```lean
∀ (A B C : Prop), (B ↔ C) → (B ∧ A ↔ C ∧ A)
```

## Corelib.Init.Logic.and_ind

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.and_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.and_ind.statement.correspondence

```lean
∀ (A B P : Prop), (A → B → P) → A ∧ B → P
```

## Corelib.Init.Logic.and_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Logic.and_rec

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Logic.and A B

## Corelib.Init.Logic.and_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Logic.and_rect

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Logic.and A B

## Corelib.Init.Logic.and_sind

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.and_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.and_sind.statement.correspondence

```lean
∀ (A B P : Prop), (A → B → P) → A ∧ B → P
```

## Corelib.Init.Logic.eq

Status: BOOTSTRAP_EQ. The translator has reused Lean Eq; it is not a new equality relationship.

Original target: Eq

## Corelib.Init.Logic.eq_ex

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex.statement

## Corelib.Init.Logic.eq_ex2

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex2.statement

## Corelib.Init.Logic.eq_ex2_eta

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex2_eta.statement

## Corelib.Init.Logic.eq_ex2_hprop

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex2_hprop.statement

## Corelib.Init.Logic.eq_ex2_hprop_iff

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex2_hprop_iff.statement

## Corelib.Init.Logic.eq_ex2_ind

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex2_ind.statement

## Corelib.Init.Logic.eq_ex2_ind_uncurried

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex2_ind_uncurried.statement

## Corelib.Init.Logic.eq_ex2_nondep

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Logic.eq_ex2_nondep.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.eq_ex2_nondep.statement.correspondence

```lean
∀ (A B C : Prop) (u v : ∃ x, B ∧ C), ⋯ = ⋯ → ⋯ = ⋯ → ⋯ = ⋯ → ⋯ = ⋯
```

Residual source symbols: Rocq.Corelib.Init.Logic.ex2.rec;Rocq.Corelib.Init.Logic.ex2

## Corelib.Init.Logic.eq_ex2_rec

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex2_rec

## Corelib.Init.Logic.eq_ex2_rec_uncurried

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex2_rec_uncurried

## Corelib.Init.Logic.eq_ex2_rect

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex2_rect

## Corelib.Init.Logic.eq_ex2_rect_ex_intro2

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex2_rect_ex_intro2

## Corelib.Init.Logic.eq_ex2_rect_ex_intro2_l

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex2_rect_ex_intro2_l

## Corelib.Init.Logic.eq_ex2_rect_ex_intro2_r

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex2_rect_ex_intro2_r

## Corelib.Init.Logic.eq_ex2_rect_uncurried

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex2_rect_uncurried

## Corelib.Init.Logic.eq_ex2_uncurried

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex2_uncurried.statement

## Corelib.Init.Logic.eq_ex2_uncurried_iff

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex2_uncurried_iff.statement

## Corelib.Init.Logic.eq_ex_eta

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex_eta.statement

## Corelib.Init.Logic.eq_ex_hprop

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Logic.eq_ex_hprop.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.eq_ex_hprop.statement.correspondence

```lean
∀ (A : Prop) (P : A → Prop), (∀ (x : A) (p q : P x), p = q) → ∀ (u v : ∃ a, P a), ⋯ = ⋯ → ⋯ = ⋯
```

Residual source symbols: Rocq.Corelib.Init.Logic.ex.rec;Rocq.Corelib.Init.Logic.ex

## Corelib.Init.Logic.eq_ex_hprop_iff

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Logic.eq_ex_hprop_iff.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.eq_ex_hprop_iff.statement.correspondence

```lean
∀ (A : Prop) (P : A → Prop), (∀ (x : A) (p q : P x), p = q) → ∀ (u v : ∃ a, P a), ⋯ = ⋯ ↔ ⋯ = ⋯
```

Residual source symbols: Rocq.Corelib.Init.Logic.ex;Rocq.Corelib.Init.Logic.ex.rec

## Corelib.Init.Logic.eq_ex_ind

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex_ind.statement

## Corelib.Init.Logic.eq_ex_ind_uncurried

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex_ind_uncurried.statement

## Corelib.Init.Logic.eq_ex_intro

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex_intro.statement

## Corelib.Init.Logic.eq_ex_intro2

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex_intro2.statement

## Corelib.Init.Logic.eq_ex_intro2_hprop

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex_intro2_hprop.statement

## Corelib.Init.Logic.eq_ex_intro2_hprop_nondep

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex_intro2_hprop_nondep.statement

## Corelib.Init.Logic.eq_ex_intro2_l

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex_intro2_l.statement

## Corelib.Init.Logic.eq_ex_intro2_r

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex_intro2_r.statement

## Corelib.Init.Logic.eq_ex_intro2_uncurried

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex_intro2_uncurried.statement

## Corelib.Init.Logic.eq_ex_intro_hprop

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex_intro_hprop.statement

## Corelib.Init.Logic.eq_ex_intro_l

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex_intro_l.statement

## Corelib.Init.Logic.eq_ex_intro_r

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex_intro_r.statement

## Corelib.Init.Logic.eq_ex_intro_uncurried

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex_intro_uncurried.statement

## Corelib.Init.Logic.eq_ex_rec

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex_rec

## Corelib.Init.Logic.eq_ex_rec_uncurried

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex_rec_uncurried

## Corelib.Init.Logic.eq_ex_rect

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex_rect

## Corelib.Init.Logic.eq_ex_rect_ex_intro

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex_rect_ex_intro

## Corelib.Init.Logic.eq_ex_rect_ex_intro_l

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex_rect_ex_intro_l

## Corelib.Init.Logic.eq_ex_rect_ex_intro_r

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex_rect_ex_intro_r

## Corelib.Init.Logic.eq_ex_rect_uncurried

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex_rect_uncurried

## Corelib.Init.Logic.eq_ex_uncurried

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex_uncurried.statement

## Corelib.Init.Logic.eq_ex_uncurried_iff

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_ex_uncurried_iff.statement

## Corelib.Init.Logic.eq_id_comm_l

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_id_comm_l.statement

## Corelib.Init.Logic.eq_id_comm_r

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_id_comm_r.statement

## Corelib.Init.Logic.eq_ind

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.eq_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.eq_ind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_22) (x : A) (P : A → Prop), P x → ∀ (a : A), x = a → P a
```

## Corelib.Init.Logic.eq_ind_r

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.eq_ind_r.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.eq_ind_r.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_61) (x : A) (P : A → Prop), P x → ∀ (y : A), y = x → P y
```

## Corelib.Init.Logic.eq_rec

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Logic.eq_rec

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Logic.eq_rec.roundtrip

## Corelib.Init.Logic.eq_rec_r

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_rec_r

## Corelib.Init.Logic.eq_rect

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Logic.eq_rect

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Logic.eq_rect.roundtrip

## Corelib.Init.Logic.eq_rect_r

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_rect_r

## Corelib.Init.Logic.eq_refl_map_distr

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_refl_map_distr.statement

## Corelib.Init.Logic.eq_rew

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Logic.eq_rew

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Logic.eq_rew.roundtrip

## Corelib.Init.Logic.eq_rew_dep

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Logic.eq_rew_dep

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Logic.eq_rew_dep.roundtrip

## Corelib.Init.Logic.eq_rew_fwd_dep

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Logic.eq_rew_fwd_dep

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Logic.eq_rew_fwd_dep.roundtrip

## Corelib.Init.Logic.eq_rew_fwd_r_dep

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Logic.eq_rew_fwd_r_dep

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Logic.eq_rew_fwd_r_dep.roundtrip

## Corelib.Init.Logic.eq_rew_r

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Logic.eq_rew_r

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Logic.eq_rew_r.roundtrip

## Corelib.Init.Logic.eq_rew_r_dep

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_rew_r_dep

## Corelib.Init.Logic.eq_sind

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.eq_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.eq_sind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_24) (x : A) (P : A → Prop), P x → ∀ (a : A), x = a → P a
```

## Corelib.Init.Logic.eq_sind_r

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.eq_sind_r.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.eq_sind_r.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_59) (x : A) (P : A → Prop), P x → ∀ (y : A), y = x → P y
```

## Corelib.Init.Logic.eq_stepl

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.eq_stepl.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.eq_stepl.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_383) (x y z : A), x = y → x = z → z = y
```

## Corelib.Init.Logic.eq_sym

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.eq_sym.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.eq_sym.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_31) (x y : A), x = y → y = x
```

## Corelib.Init.Logic.eq_sym_involutive

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_sym_involutive.statement

## Corelib.Init.Logic.eq_sym_map_distr

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_sym_map_distr.statement

## Corelib.Init.Logic.eq_trans

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.eq_trans.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.eq_trans.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_45) (x y z : A), x = y → y = z → x = z
```

## Corelib.Init.Logic.eq_trans_assoc

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_trans_assoc.statement

## Corelib.Init.Logic.eq_trans_map

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_trans_map.statement

## Corelib.Init.Logic.eq_trans_map_distr

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_trans_map_distr.statement

## Corelib.Init.Logic.eq_trans_r

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.eq_trans_r.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.eq_trans_r.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_45) (x y z : A), x = y → z = y → x = z
```

## Corelib.Init.Logic.eq_trans_refl_l

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_trans_refl_l.statement

## Corelib.Init.Logic.eq_trans_refl_r

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_trans_refl_r.statement

## Corelib.Init.Logic.eq_trans_rew_distr

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_trans_rew_distr.statement

## Corelib.Init.Logic.eq_trans_sym_distr

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_trans_sym_distr.statement

## Corelib.Init.Logic.eq_trans_sym_inv_l

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_trans_sym_inv_l.statement

## Corelib.Init.Logic.eq_trans_sym_inv_r

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.eq_trans_sym_inv_r.statement

## Corelib.Init.Logic.ex

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Logic.ex

Operation/Type Certificate: NativeBridge.ex_agrees

## Corelib.Init.Logic.ex2

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Logic.ex2

Operation/Type Certificate: NativeBridge.ex2_agrees

## Corelib.Init.Logic.ex2_eta

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.ex2_eta.statement

## Corelib.Init.Logic.ex2_ind

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.ex2_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.ex2_ind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_11) (P Q : A → Prop) (P0 : Prop), (∀ (x : A), P x → Q x → P0) → (∃ x, P x ∧ Q x) → P0
```

## Corelib.Init.Logic.ex2_rec

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.ex2_rec

## Corelib.Init.Logic.ex2_rect

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.ex2_rect

## Corelib.Init.Logic.ex2_sind

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.ex2_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.ex2_sind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_12) (P Q : A → Prop) (P0 : Prop), (∀ (x : A), P x → Q x → P0) → (∃ x, P x ∧ Q x) → P0
```

## Corelib.Init.Logic.ex_eta

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.ex_eta.statement

## Corelib.Init.Logic.ex_ind

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.ex_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.ex_ind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_6) (P : A → Prop) (P0 : Prop), (∀ (x : A), P x → P0) → (∃ x, P x) → P0
```

## Corelib.Init.Logic.ex_of_ex2

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.ex_of_ex2.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.ex_of_ex2.statement.correspondence

```lean
∀ (A : Prop) (P Q : A → Prop), (∃ x, P x ∧ Q x) → ∃ x, P x
```

## Corelib.Init.Logic.ex_of_ex2_eq

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.ex_of_ex2_eq.statement

## Corelib.Init.Logic.ex_proj1

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.ex_proj1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.ex_proj1.statement.correspondence

```lean
∀ (A : Prop) (P : A → Prop), (∃ x, P x) → A
```

## Corelib.Init.Logic.ex_proj1_eq

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Logic.ex_proj1_eq.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.ex_proj1_eq.statement.correspondence

```lean
∀ (A : Prop) (P : A → Prop) (u v : ∃ a, P a), ⋯ = ⋯ → ⋯ = ⋯
```

Residual source symbols: Rocq.Corelib.Init.Logic.ex;Rocq.Corelib.Init.Logic.ex.rec

## Corelib.Init.Logic.ex_proj1_of_ex2_eq

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Logic.ex_proj1_of_ex2_eq.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.ex_proj1_of_ex2_eq.statement.correspondence

```lean
∀ (A : Prop) (P Q : A → Prop) (u v : ∃ x, P x ∧ Q x), ⋯ = ⋯ → ⋯ = ⋯
```

Residual source symbols: Rocq.Corelib.Init.Logic.ex2;Rocq.Corelib.Init.Logic.ex2.rec

## Corelib.Init.Logic.ex_proj2

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Logic.ex_proj2.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.ex_proj2.statement.correspondence

```lean
∀ (A : Prop) (P : A → Prop) (x : ∃ x, P x), P ⋯
```

Residual source symbols: Rocq.Corelib.Init.Logic.ex.rec;Rocq.Corelib.Init.Logic.ex

## Corelib.Init.Logic.ex_proj2_eq

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.ex_proj2_eq.statement

## Corelib.Init.Logic.ex_proj2_of_ex2_eq

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.ex_proj2_of_ex2_eq.statement

## Corelib.Init.Logic.ex_proj3

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Logic.ex_proj3.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.ex_proj3.statement.correspondence

```lean
∀ (A : Prop) (P Q : A → Prop) (x : ∃ x, P x ∧ Q x), Q ⋯
```

Residual source symbols: Rocq.Corelib.Init.Logic.ex2.rec;Rocq.Corelib.Init.Logic.ex2

## Corelib.Init.Logic.ex_proj3_eq

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.ex_proj3_eq.statement

## Corelib.Init.Logic.ex_rec

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.ex_rec

## Corelib.Init.Logic.ex_rect

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.ex_rect

## Corelib.Init.Logic.ex_sind

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.ex_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.ex_sind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_7) (P : A → Prop) (P0 : Prop), (∀ (x : A), P x → P0) → (∃ x, P x) → P0
```

## Corelib.Init.Logic.exists_inhabited

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.exists_inhabited.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.exists_inhabited.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_374) (P : A → Prop), (∃ x, P x) → Nonempty A
```

## Corelib.Init.Logic.f_equal

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.f_equal.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.f_equal.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_45) (B : Sort u_Corelib_Init_Logic_46) (f : A → B) (x y : A), x = y → f x = f y
```

## Corelib.Init.Logic.f_equal2

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.f_equal2.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.f_equal2.statement.correspondence

```lean
∀ (A1 : Sort u_Corelib_Init_Logic_107) (A2 : Sort u_Corelib_Init_Logic_108) (B : Sort u_Corelib_Init_Logic_109)
  (f : A1 → A2 → B) (x1 y1 : A1) (x2 y2 : A2), x1 = y1 → x2 = y2 → f x1 x2 = f y1 y2
```

## Corelib.Init.Logic.f_equal3

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.f_equal3.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.f_equal3.statement.correspondence

```lean
∀ (A1 : Sort u_Corelib_Init_Logic_114) (A2 : Sort u_Corelib_Init_Logic_115) (A3 : Sort u_Corelib_Init_Logic_116)
  (B : Sort u_Corelib_Init_Logic_117) (f : A1 → A2 → A3 → B) (x1 y1 : A1) (x2 y2 : A2) (x3 y3 : A3),
  x1 = y1 → x2 = y2 → x3 = y3 → f x1 x2 x3 = f y1 y2 y3
```

## Corelib.Init.Logic.f_equal4

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.f_equal4.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.f_equal4.statement.correspondence

```lean
∀ (A1 : Sort u_Corelib_Init_Logic_123) (A2 : Sort u_Corelib_Init_Logic_124) (A3 : Sort u_Corelib_Init_Logic_125)
  (A4 : Sort u_Corelib_Init_Logic_126) (B : Sort u_Corelib_Init_Logic_127) (f : A1 → A2 → A3 → A4 → B) (x1 y1 : A1)
  (x2 y2 : A2) (x3 y3 : A3) (x4 y4 : A4), x1 = y1 → x2 = y2 → x3 = y3 → x4 = y4 → f x1 x2 x3 x4 = f y1 y2 y3 y4
```

## Corelib.Init.Logic.f_equal5

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.f_equal5.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.f_equal5.statement.correspondence

```lean
∀ (A1 : Sort u_Corelib_Init_Logic_134) (A2 : Sort u_Corelib_Init_Logic_135) (A3 : Sort u_Corelib_Init_Logic_136)
  (A4 : Sort u_Corelib_Init_Logic_137) (A5 : Sort u_Corelib_Init_Logic_138) (B : Sort u_Corelib_Init_Logic_139)
  (f : A1 → A2 → A3 → A4 → A5 → B) (x1 y1 : A1) (x2 y2 : A2) (x3 y3 : A3) (x4 y4 : A4) (x5 y5 : A5),
  x1 = y1 → x2 = y2 → x3 = y3 → x4 = y4 → x5 = y5 → f x1 x2 x3 x4 x5 = f y1 y2 y3 y4 y5
```

## Corelib.Init.Logic.f_equal_compose

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.f_equal_compose.statement

## Corelib.Init.Logic.f_equal_dep

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Logic.f_equal_dep.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.f_equal_dep.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_68) (B : A → Sort u_Corelib_Init_Logic_69) (f : (x : A) → B x) (x y : A) (H : x = y),
  Rocq.Corelib.Init.Logic.eq_rect A x B (f x) y H = f y
```

Residual source symbols: Rocq.Corelib.Init.Logic.eq_rect

## Corelib.Init.Logic.f_equal_dep2

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.f_equal_dep2.statement

## Corelib.Init.Logic.forall_exists_coincide_unique_domain

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Logic.forall_exists_coincide_unique_domain.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.forall_exists_coincide_unique_domain.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_361) (P : A → Prop),
  (∀ (Q : A → Prop), (∀ (x : A), P x → Q x) ↔ ∃ x, P x ∧ Q x) → ∃ x, Rocq.Corelib.Init.Logic.unique A (fun x => P x) x
```

Residual source symbols: Rocq.Corelib.Init.Logic.unique

## Corelib.Init.Logic.forall_exists_unique_domain_coincide

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Logic.forall_exists_unique_domain_coincide.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.forall_exists_unique_domain_coincide.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_354) (P : A → Prop),
  (∃ x, Rocq.Corelib.Init.Logic.unique A (fun x => P x) x) → ∀ (Q : A → Prop), (∀ (x : A), P x → Q x) ↔ ∃ x, P x ∧ Q x
```

Residual source symbols: Rocq.Corelib.Init.Logic.unique

## Corelib.Init.Logic.gen

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.gen.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.gen.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_18) (P : A → Prop) (B : Prop), (∀ (y : A), B → P y) → B → ∀ (x : A), P x
```

## Corelib.Init.Logic.iff

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Logic.iff

Operation/Type Certificate: NativeBridge.iff_agrees

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Logic.iff.roundtrip

## Corelib.Init.Logic.iff_and

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.iff_and.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.iff_and.statement.correspondence

```lean
∀ (A B : Prop), (A ↔ B) → (A → B) ∧ (B → A)
```

## Corelib.Init.Logic.iff_refl

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.iff_refl.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.iff_refl.statement.correspondence

```lean
∀ (A : Prop), A ↔ A
```

## Corelib.Init.Logic.iff_stepl

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.iff_stepl.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.iff_stepl.statement.correspondence

```lean
∀ (A B C : Prop), (A ↔ B) → (A ↔ C) → (C ↔ B)
```

## Corelib.Init.Logic.iff_sym

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.iff_sym.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.iff_sym.statement.correspondence

```lean
∀ (A B : Prop), (A ↔ B) → (B ↔ A)
```

## Corelib.Init.Logic.iff_to_and

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.iff_to_and.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.iff_to_and.statement.correspondence

```lean
∀ (A B : Prop), (A ↔ B) ↔ (A → B) ∧ (B → A)
```

## Corelib.Init.Logic.iff_trans

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.iff_trans.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.iff_trans.statement.correspondence

```lean
∀ (A B C : Prop), (A ↔ B) → (B ↔ C) → (A ↔ C)
```

## Corelib.Init.Logic.imp_iff_compat_l

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.imp_iff_compat_l.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.imp_iff_compat_l.statement.correspondence

```lean
∀ (A B C : Prop), (B ↔ C) → (A → B ↔ A → C)
```

## Corelib.Init.Logic.imp_iff_compat_r

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.imp_iff_compat_r.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.imp_iff_compat_r.statement.correspondence

```lean
∀ (A B C : Prop), (B ↔ C) → (B → A ↔ C → A)
```

## Corelib.Init.Logic.inhabited

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Logic.inhabited

Operation/Type Certificate: NativeBridge.inhabited_agrees

## Corelib.Init.Logic.inhabited_covariant

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.inhabited_covariant.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.inhabited_covariant.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_378) (B : Sort u_Corelib_Init_Logic_379) (a : A → B), Nonempty A → Nonempty B
```

## Corelib.Init.Logic.inhabited_ind

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.inhabited_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.inhabited_ind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_370) (P : Prop), (∀ (a : A), P) → Nonempty A → P
```

## Corelib.Init.Logic.inhabited_sind

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.inhabited_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.inhabited_sind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_371) (P : Prop), (∀ (a : A), P) → Nonempty A → P
```

## Corelib.Init.Logic.inst

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.inst.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.inst.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_18) (P : A → Prop) (x : A), (∀ (x : A), P x) → P x
```

## Corelib.Init.Logic.map_subst

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Logic.map_subst.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.map_subst.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_215) (P : A → Sort u_Corelib_Init_Logic_216) (Q : A → Sort u_Corelib_Init_Logic_217)
  (f : (x : A) → P x → Q x) (x y : A) (H : x = y) (z : P x),
  Rocq.Corelib.Init.Logic.eq_rect A x Q (f x z) y H = f y (Rocq.Corelib.Init.Logic.eq_rect A x P z y H)
```

Residual source symbols: Rocq.Corelib.Init.Logic.eq_rect

## Corelib.Init.Logic.map_subst_map

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.map_subst_map.statement

## Corelib.Init.Logic.neg_false

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.neg_false.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.neg_false.statement.correspondence

```lean
∀ (A : Prop), ¬A ↔ (A ↔ False)
```

## Corelib.Init.Logic.not

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Logic.not

Operation/Type Certificate: NativeBridge.not_agrees

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Logic.not.roundtrip

## Corelib.Init.Logic.notT

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Logic.notT

Operation/Type Certificate: NativeBridge.notT_agrees

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Logic.notT.roundtrip

## Corelib.Init.Logic.not_eq_sym

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.not_eq_sym.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.not_eq_sym.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_45) (x y : A), ¬x = y → ¬y = x
```

## Corelib.Init.Logic.not_iff_compat

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.not_iff_compat.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.not_iff_compat.statement.correspondence

```lean
∀ (A B : Prop), (A ↔ B) → (¬A ↔ ¬B)
```

## Corelib.Init.Logic.or

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Logic.or

Operation/Type Certificate: NativeBridge.or_agrees

## Corelib.Init.Logic.or_assoc

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.or_assoc.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.or_assoc.statement.correspondence

```lean
∀ (A B C : Prop), (A ∨ B) ∨ C ↔ A ∨ B ∨ C
```

## Corelib.Init.Logic.or_cancel_l

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.or_cancel_l.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.or_cancel_l.statement.correspondence

```lean
∀ (A B C : Prop), (B → ¬A) → (C → ¬A) → ((A ∨ B ↔ A ∨ C) ↔ (B ↔ C))
```

## Corelib.Init.Logic.or_cancel_r

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.or_cancel_r.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.or_cancel_r.statement.correspondence

```lean
∀ (A B C : Prop), (B → ¬A) → (C → ¬A) → ((B ∨ A ↔ C ∨ A) ↔ (B ↔ C))
```

## Corelib.Init.Logic.or_comm

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.or_comm.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.or_comm.statement.correspondence

```lean
∀ (A B : Prop), A ∨ B ↔ B ∨ A
```

## Corelib.Init.Logic.or_iff_compat_l

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.or_iff_compat_l.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.or_iff_compat_l.statement.correspondence

```lean
∀ (A B C : Prop), (B ↔ C) → (A ∨ B ↔ A ∨ C)
```

## Corelib.Init.Logic.or_iff_compat_r

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.or_iff_compat_r.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.or_iff_compat_r.statement.correspondence

```lean
∀ (A B C : Prop), (B ↔ C) → (B ∨ A ↔ C ∨ A)
```

## Corelib.Init.Logic.or_ind

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.or_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.or_ind.statement.correspondence

```lean
∀ (A B P : Prop), (A → P) → (B → P) → A ∨ B → P
```

## Corelib.Init.Logic.or_sind

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.or_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.or_sind.statement.correspondence

```lean
∀ (A B P : Prop), (A → P) → (B → P) → A ∨ B → P
```

## Corelib.Init.Logic.proj1

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.proj1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.proj1.statement.correspondence

```lean
∀ (A B : Prop), A ∧ B → A
```

## Corelib.Init.Logic.proj2

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Logic.proj2.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.proj2.statement.correspondence

```lean
∀ (A B : Prop), A ∧ B → B
```

## Corelib.Init.Logic.rew_compose

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.rew_compose.statement

## Corelib.Init.Logic.rew_const

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Logic.rew_const.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.rew_const.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_333) (P : Sort u_Corelib_Init_Logic_335) (x y : A) (e : x = y) (k : P),
  Rocq.Corelib.Init.Logic.eq_rect A x (fun a => P) k y e = k
```

Residual source symbols: Rocq.Corelib.Init.Logic.eq_rect

## Corelib.Init.Logic.rew_ex

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.rew_ex.statement

## Corelib.Init.Logic.rew_ex2

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.rew_ex2.statement

## Corelib.Init.Logic.rew_map

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.rew_map.statement

## Corelib.Init.Logic.rew_opp_l

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.rew_opp_l.statement

## Corelib.Init.Logic.rew_opp_r

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.rew_opp_r.statement

## Corelib.Init.Logic.rew_swap

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Logic.rew_swap.statement

## Corelib.Init.Logic.subrelation

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Logic.subrelation

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Logic.subrelation.roundtrip

## Corelib.Init.Logic.unique

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Logic.unique

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Logic.unique.roundtrip

## Corelib.Init.Logic.unique_existence

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Logic.unique_existence.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Logic.unique_existence.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_348) (P : A → Prop),
  (∃ x, P x) ∧ Rocq.Corelib.Init.Logic.uniqueness A P ↔ ∃ x, Rocq.Corelib.Init.Logic.unique A (fun x => P x) x
```

Residual source symbols: Rocq.Corelib.Init.Logic.uniqueness;Rocq.Corelib.Init.Logic.unique

## Corelib.Init.Logic.uniqueness

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Logic.uniqueness

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Logic.uniqueness.roundtrip
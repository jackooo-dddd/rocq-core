# Corelib.Init.Wf

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.Init.Wf.Acc

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Wf.Acc

## Corelib.Init.Wf.Acc_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Wf.Acc_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Wf.Acc_ind.statement.correspondence

```lean
∀ (A : Type u_Corelib_Init_Wf_11) (R : A → A → Prop) (P : A → Prop),
  (∀ (x : A), (∀ (y : A), R y x → Rocq.Corelib.Init.Wf.Acc A R y) → (∀ (y : A), R y x → P y) → P x) →
    ∀ (x : A), Rocq.Corelib.Init.Wf.Acc A R x → P x
```

Residual source symbols: Rocq.Corelib.Init.Wf.Acc

## Corelib.Init.Wf.Acc_intro_generator

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Wf.Acc_intro_generator.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Wf.Acc_intro_generator.statement.correspondence

```lean
∀ (A : Type u_Corelib_Init_Wf_11) (R : A → A → Prop) (n : Nat),
  Rocq.Corelib.Init.Wf.well_founded A R → Rocq.Corelib.Init.Wf.well_founded A R
```

Residual source symbols: Rocq.Corelib.Init.Wf.well_founded

## Corelib.Init.Wf.Acc_inv

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Wf.Acc_inv.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Wf.Acc_inv.statement.correspondence

```lean
∀ (A : Type u_Corelib_Init_Wf_11) (R : A → A → Prop) (x : A),
  Rocq.Corelib.Init.Wf.Acc A R x → ∀ (y : A), R y x → Rocq.Corelib.Init.Wf.Acc A R y
```

Residual source symbols: Rocq.Corelib.Init.Wf.Acc

## Corelib.Init.Wf.Acc_inv_dep

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Wf.Acc_inv_dep.statement

## Corelib.Init.Wf.Acc_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Wf.Acc_rec

Reason for interface not covered: No registered type bijection for (x : A) →
  (∀ (y : A), R y x → Rocq.Corelib.Init.Wf.Acc A R y) → ((y : A) → R y x → P y) → P x

## Corelib.Init.Wf.Acc_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Wf.Acc_rect

Reason for interface not covered: No registered type bijection for (x : A) →
  (∀ (y : A), R y x → Rocq.Corelib.Init.Wf.Acc A R y) → ((y : A) → R y x → P y) → P x

## Corelib.Init.Wf.Acc_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Wf.Acc_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Wf.Acc_sind.statement.correspondence

```lean
∀ (A : Type u_Corelib_Init_Wf_11) (R : A → A → Prop) (P : A → Prop),
  (∀ (x : A), (∀ (y : A), R y x → Rocq.Corelib.Init.Wf.Acc A R y) → (∀ (y : A), R y x → P y) → P x) →
    ∀ (x : A), Rocq.Corelib.Init.Wf.Acc A R x → P x
```

Residual source symbols: Rocq.Corelib.Init.Wf.Acc

## Corelib.Init.Wf.Fix

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Wf.Fix

Reason for interface not covered: No registered type bijection for ∀ (a : A), Rocq.Corelib.Init.Wf.Acc A R a

## Corelib.Init.Wf.Fix_F

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Wf.Fix_F

Reason for interface not covered: No registered type bijection for (x : A) → Rocq.Corelib.Init.Wf.Acc A R x → P x

## Corelib.Init.Wf.Fix_F_2

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Wf.Fix_F_2

Reason for interface not covered: No registered type bijection for (R:
    Rocq.Corelib.Init.Datatypes.prod A B → Rocq.Corelib.Init.Datatypes.prod A B → Prop) →
  (P : A → B → Type u_Corelib_Init_Wf_31) →
    ((x : A) →
        (x' : B) →
          ((y : A) →
              (y' : B) →
                R (Rocq.Corelib.Init.Datatypes.prod.pair A B y y') (Rocq.Corelib.Init.Datatypes.prod.pair A B x x') →
                  P y y') →
            P x x') →
      (x : A) →
        (x' : B) →
          Rocq.Corelib.Init.Wf.Acc (Rocq.Corelib.Init.Datatypes.prod A B) R
              (Rocq.Corelib.Init.Datatypes.prod.pair A B x x') →
            P x x'

## Corelib.Init.Wf.Fix_F_eq

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Wf.Fix_F_eq.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Wf.Fix_F_eq.statement.correspondence

```lean
∀ (A : Type u_Corelib_Init_Wf_11) (R : A → A → Prop) (P : A → Type u_Corelib_Init_Wf_14)
  (F : (x : A) → ((y : A) → R y x → P y) → P x) (x : A) (r : Rocq.Corelib.Init.Wf.Acc A R x),
  (F x fun y p => Rocq.Corelib.Init.Wf.Fix_F A R P F y ⋯) = Rocq.Corelib.Init.Wf.Fix_F A R P F x r
```

Residual source symbols: Rocq.Corelib.Init.Wf.Acc;Rocq.Corelib.Init.Wf.Fix_F;Rocq.Corelib.Init.Wf.Acc.rec;Rocq.Corelib.Init.Wf.Acc.Acc_intro

## Corelib.Init.Wf.Fix_F_inv

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Wf.Fix_F_inv.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Wf.Fix_F_inv.statement.correspondence

```lean
∀ (A : Type u_Corelib_Init_Wf_11) (R : A → A → Prop),
  Rocq.Corelib.Init.Wf.well_founded A R →
    ∀ (P : A → Type u_Corelib_Init_Wf_14) (F : (x : A) → ((y : A) → R y x → P y) → P x),
      (∀ (x : A) (f g : (y : A) → R y x → P y), (∀ (y : A) (p : R y x), f y p = g y p) → F x f = F x g) →
        ∀ (x : A) (r s : Rocq.Corelib.Init.Wf.Acc A R x),
          Rocq.Corelib.Init.Wf.Fix_F A R P F x r = Rocq.Corelib.Init.Wf.Fix_F A R P F x s
```

Residual source symbols: Rocq.Corelib.Init.Wf.well_founded;Rocq.Corelib.Init.Wf.Acc;Rocq.Corelib.Init.Wf.Fix_F

## Corelib.Init.Wf.Fix_F_inv_gen

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Wf.Fix_F_inv_gen.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Wf.Fix_F_inv_gen.statement.correspondence

```lean
∀ (A : Type u_Corelib_Init_Wf_11) (R : A → A → Prop),
  Rocq.Corelib.Init.Wf.well_founded A R →
    ∀ (P : A → Type u_Corelib_Init_Wf_14) (F : (x : A) → ((y : A) → R y x → P y) → P x),
      (∀ (x : A) (f g : (y : A) → R y x → P y), (∀ (y : A) (p q : R y x), f y p = g y q) → F x f = F x g) →
        ∀ (x : A) (r s : Rocq.Corelib.Init.Wf.Acc A R x),
          Rocq.Corelib.Init.Wf.Fix_F A R P F x r = Rocq.Corelib.Init.Wf.Fix_F A R P F x s
```

Residual source symbols: Rocq.Corelib.Init.Wf.well_founded;Rocq.Corelib.Init.Wf.Acc;Rocq.Corelib.Init.Wf.Fix_F

## Corelib.Init.Wf.Fix_eq

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Wf.Fix_eq.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Wf.Fix_eq.statement.correspondence

```lean
∀ (A : Type u_Corelib_Init_Wf_11) (R : A → A → Prop) (Rwf : Rocq.Corelib.Init.Wf.well_founded A R)
  (P : A → Type u_Corelib_Init_Wf_14) (F : (x : A) → ((y : A) → R y x → P y) → P x),
  (∀ (x : A) (f g : (y : A) → R y x → P y), (∀ (y : A) (p : R y x), f y p = g y p) → F x f = F x g) →
    ∀ (x : A), Rocq.Corelib.Init.Wf.Fix A R Rwf P F x = F x fun y p => Rocq.Corelib.Init.Wf.Fix A R Rwf P F y
```

Residual source symbols: Rocq.Corelib.Init.Wf.well_founded;Rocq.Corelib.Init.Wf.Fix

## Corelib.Init.Wf.Fix_eq_gen

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Wf.Fix_eq_gen.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Wf.Fix_eq_gen.statement.correspondence

```lean
∀ (A : Type u_Corelib_Init_Wf_11) (R : A → A → Prop) (Rwf : Rocq.Corelib.Init.Wf.well_founded A R)
  (P : A → Type u_Corelib_Init_Wf_14) (F : (x : A) → ((y : A) → R y x → P y) → P x),
  (∀ (x : A) (f g : (y : A) → R y x → P y), (∀ (y : A) (p q : R y x), f y p = g y q) → F x f = F x g) →
    ∀ (x : A), Rocq.Corelib.Init.Wf.Fix A R Rwf P F x = F x fun y p => Rocq.Corelib.Init.Wf.Fix A R Rwf P F y
```

Residual source symbols: Rocq.Corelib.Init.Wf.well_founded;Rocq.Corelib.Init.Wf.Fix

## Corelib.Init.Wf.well_founded

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Wf.well_founded

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Wf.well_founded.roundtrip

## Corelib.Init.Wf.well_founded_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Wf.well_founded_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Wf.well_founded_ind.statement.correspondence

```lean
∀ (A : Type u_Corelib_Init_Wf_11) (R : A → A → Prop),
  Rocq.Corelib.Init.Wf.well_founded A R → ∀ (P : A → Prop), (∀ (x : A), (∀ (y : A), R y x → P y) → P x) → ∀ (a : A), P a
```

Residual source symbols: Rocq.Corelib.Init.Wf.well_founded

## Corelib.Init.Wf.well_founded_induction

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Wf.well_founded_induction

Reason for interface not covered: No registered type bijection for ∀ (a : A), Rocq.Corelib.Init.Wf.Acc A R a

## Corelib.Init.Wf.well_founded_induction_type

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Wf.well_founded_induction_type

Reason for interface not covered: No registered type bijection for ∀ (a : A), Rocq.Corelib.Init.Wf.Acc A R a

## Corelib.Init.Wf.well_founded_induction_type_2

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Wf.well_founded_induction_type_2

Reason for interface not covered: No registered type bijection for (R:
    Rocq.Corelib.Init.Datatypes.prod A B → Rocq.Corelib.Init.Datatypes.prod A B → Prop) →
  (P : A → B → Type u_Corelib_Init_Wf_31) →
    Rocq.Corelib.Init.Wf.well_founded (Rocq.Corelib.Init.Datatypes.prod A B) R →
      ((x : A) →
          (x' : B) →
            ((y : A) →
                (y' : B) →
                  R (Rocq.Corelib.Init.Datatypes.prod.pair A B y y') (Rocq.Corelib.Init.Datatypes.prod.pair A B x x') →
                    P y y') →
              P x x') →
        (a : A) → (b : B) → P a b
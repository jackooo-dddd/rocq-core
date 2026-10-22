# Corelib.Init.Specif

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.Init.Specif.Choice

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.Choice

## Corelib.Init.Specif.Choice2

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Specif.Choice2

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Specif.Choice2.roundtrip

## Corelib.Init.Specif.Exc

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Specif.Exc

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Specif.Exc.roundtrip

## Corelib.Init.Specif.absurd_set

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Specif.absurd_set

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Logic.False

## Corelib.Init.Specif.bool_choice

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.bool_choice

## Corelib.Init.Specif.dependent_choice

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.dependent_choice

## Corelib.Init.Specif.eq_exist2_curried

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_exist2_curried.statement

## Corelib.Init.Specif.eq_exist2_l

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_exist2_l.statement

## Corelib.Init.Specif.eq_exist2_r

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_exist2_r.statement

## Corelib.Init.Specif.eq_exist2_uncurried

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_exist2_uncurried.statement

## Corelib.Init.Specif.eq_existT2_curried

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.eq_existT2_curried.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_existT2_curried.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_813) (P : A → Sort u_Corelib_Init_Specif_814) (Q : A → Sort u_Corelib_Init_Specif_815)
  (u1 v1 : A) (u2 : P u1) (v2 : P v1) (u3 : Q u1) (v3 : Q v1) (p : u1 = v1),
  Rocq.Corelib.Init.Logic.eq_rect A u1 P u2 v1 ⋯ = v2 →
    Rocq.Corelib.Init.Logic.eq_rect A u1 Q u3 v1 ⋯ = v3 →
      Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q u1 u2 u3 = Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q v1 v2 v3
```

Residual source symbols: Rocq.Corelib.Init.Logic.eq_rect;Rocq.Corelib.Init.Logic.eq;Rocq.Corelib.Init.Specif.sigT2;Rocq.Corelib.Init.Specif.sigT2.existT2

## Corelib.Init.Specif.eq_existT2_l

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.eq_existT2_l.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_existT2_l.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_847) (P : A → Sort u_Corelib_Init_Specif_848) (Q : A → Sort u_Corelib_Init_Specif_849)
  (u1 : A) (u2 : P u1) (u3 : Q u1) (v : Rocq.Corelib.Init.Specif.sigT2 A (fun a => P a) fun a => Q a)
  (p :
    u1 =
      Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
        (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v)),
  Rocq.Corelib.Init.Logic.eq_rect A u1 (fun a => P a) u2
        (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
          (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v))
        ⋯ =
      Rocq.Corelib.Init.Specif.projT2 A (fun a => P a)
        (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v) →
    Rocq.Corelib.Init.Logic.eq_rect A u1 (fun a => Q a) u3
          (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
            (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v))
          ⋯ =
        Rocq.Corelib.Init.Specif.projT3 A (fun a => P a) (fun a => Q a) v →
      Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q u1 u2 u3 = v
```

Residual source symbols: Rocq.Corelib.Init.Specif.sigT2;Rocq.Corelib.Init.Specif.projT1;Rocq.Corelib.Init.Specif.sigT_of_sigT2;Rocq.Corelib.Init.Logic.eq_rect;Rocq.Corelib.Init.Logic.eq;Rocq.Corelib.Init.Specif.projT2;Rocq.Corelib.Init.Specif.projT3;Rocq.Corelib.Init.Specif.sigT2.existT2

## Corelib.Init.Specif.eq_existT2_r

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.eq_existT2_r.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_existT2_r.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_865) (P : A → Sort u_Corelib_Init_Specif_866) (Q : A → Sort u_Corelib_Init_Specif_867)
  (u : Rocq.Corelib.Init.Specif.sigT2 A (fun a => P a) fun a => Q a) (v1 : A) (v2 : P v1) (v3 : Q v1)
  (p :
    Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
        (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u) =
      v1),
  Rocq.Corelib.Init.Logic.eq_rect A
        (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
          (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u))
        (fun a => P a)
        (Rocq.Corelib.Init.Specif.projT2 A (fun a => P a)
          (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u))
        v1 ⋯ =
      v2 →
    Rocq.Corelib.Init.Logic.eq_rect A
          (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
            (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u))
          (fun a => Q a) (Rocq.Corelib.Init.Specif.projT3 A (fun a => P a) (fun a => Q a) u) v1 ⋯ =
        v3 →
      u = Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q v1 v2 v3
```

Residual source symbols: Rocq.Corelib.Init.Specif.sigT2;Rocq.Corelib.Init.Specif.projT1;Rocq.Corelib.Init.Specif.sigT_of_sigT2;Rocq.Corelib.Init.Logic.eq_rect;Rocq.Corelib.Init.Specif.projT2;Rocq.Corelib.Init.Logic.eq;Rocq.Corelib.Init.Specif.projT3;Rocq.Corelib.Init.Specif.sigT2.existT2

## Corelib.Init.Specif.eq_existT2_uncurried

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.eq_existT2_uncurried.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_existT2_uncurried.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_776) (P : A → Sort u_Corelib_Init_Specif_777) (Q : A → Sort u_Corelib_Init_Specif_778)
  (u1 v1 : A) (u2 : P u1) (v2 : P v1) (u3 : Q u1) (v3 : Q v1),
  (Rocq.Corelib.Init.Specif.sigT2.qualityProp (Rocq.Corelib.Init.Logic.eq A u1 v1)
      (fun p => Rocq.Corelib.Init.Logic.eq_rect A u1 P u2 v1 p = v2) fun p =>
      Rocq.Corelib.Init.Logic.eq_rect A u1 Q u3 v1 p = v3) →
    Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q u1 u2 u3 = Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q v1 v2 v3
```

Residual source symbols: Rocq.Corelib.Init.Specif.sigT2.qualityProp;Rocq.Corelib.Init.Logic.eq;Rocq.Corelib.Init.Logic.eq_rect;Rocq.Corelib.Init.Specif.sigT2;Rocq.Corelib.Init.Specif.sigT2.existT2

## Corelib.Init.Specif.eq_existT_curried

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.eq_existT_curried.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_existT_curried.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_257) (P : A → Sort u_Corelib_Init_Specif_258) (u1 v1 : A) (u2 : P u1) (v2 : P v1)
  (p : u1 = v1),
  Rocq.Corelib.Init.Logic.eq_rect A u1 P u2 v1 ⋯ = v2 →
    Rocq.Corelib.Init.Specif.sigT.existT A P u1 u2 = Rocq.Corelib.Init.Specif.sigT.existT A P v1 v2
```

Residual source symbols: Rocq.Corelib.Init.Logic.eq_rect;Rocq.Corelib.Init.Logic.eq;Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.sigT.existT

## Corelib.Init.Specif.eq_existT_curried_congr

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_existT_curried_congr.statement

## Corelib.Init.Specif.eq_existT_curried_map

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_existT_curried_map.statement

## Corelib.Init.Specif.eq_existT_curried_trans

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_existT_curried_trans.statement

## Corelib.Init.Specif.eq_existT_l

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.eq_existT_l.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_existT_l.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_337) (P : A → Sort u_Corelib_Init_Specif_338) (u1 : A) (u2 : P u1)
  (v : Rocq.Corelib.Init.Specif.sigT A fun a => P a) (p : u1 = Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) v),
  Rocq.Corelib.Init.Logic.eq_rect A u1 (fun a => P a) u2 (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) v) ⋯ =
      Rocq.Corelib.Init.Specif.projT2 A (fun a => P a) v →
    Rocq.Corelib.Init.Specif.sigT.existT A (fun a => P a) u1 u2 = v
```

Residual source symbols: Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.projT1;Rocq.Corelib.Init.Logic.eq_rect;Rocq.Corelib.Init.Logic.eq;Rocq.Corelib.Init.Specif.projT2;Rocq.Corelib.Init.Specif.sigT.existT

## Corelib.Init.Specif.eq_existT_r

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.eq_existT_r.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_existT_r.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_349) (P : A → Sort u_Corelib_Init_Specif_350)
  (u : Rocq.Corelib.Init.Specif.sigT A fun a => P a) (v1 : A) (v2 : P v1)
  (p : Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) u = v1),
  Rocq.Corelib.Init.Logic.eq_rect A (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) u) (fun a => P a)
        (Rocq.Corelib.Init.Specif.projT2 A (fun a => P a) u) v1 ⋯ =
      v2 →
    u = Rocq.Corelib.Init.Specif.sigT.existT A (fun a => P a) v1 v2
```

Residual source symbols: Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.projT1;Rocq.Corelib.Init.Logic.eq_rect;Rocq.Corelib.Init.Specif.projT2;Rocq.Corelib.Init.Logic.eq;Rocq.Corelib.Init.Specif.sigT.existT

## Corelib.Init.Specif.eq_existT_uncurried

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.eq_existT_uncurried.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_existT_uncurried.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_232) (P : A → Sort u_Corelib_Init_Specif_233) (u1 v1 : A) (u2 : P u1) (v2 : P v1),
  (Rocq.Corelib.Init.Specif.sigT.qualityProp (Rocq.Corelib.Init.Logic.eq A u1 v1) fun p =>
      Rocq.Corelib.Init.Logic.eq_rect A u1 P u2 v1 p = v2) →
    Rocq.Corelib.Init.Specif.sigT.existT A P u1 u2 = Rocq.Corelib.Init.Specif.sigT.existT A P v1 v2
```

Residual source symbols: Rocq.Corelib.Init.Specif.sigT.qualityProp;Rocq.Corelib.Init.Logic.eq;Rocq.Corelib.Init.Logic.eq_rect;Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.sigT.existT

## Corelib.Init.Specif.eq_exist_curried

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_exist_curried.statement

## Corelib.Init.Specif.eq_exist_l

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_exist_l.statement

## Corelib.Init.Specif.eq_exist_r

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_exist_r.statement

## Corelib.Init.Specif.eq_exist_uncurried

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_exist_uncurried.statement

## Corelib.Init.Specif.eq_sig

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sig.statement

## Corelib.Init.Specif.eq_sig2

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sig2.statement

## Corelib.Init.Specif.eq_sig2_hprop

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sig2_hprop.statement

## Corelib.Init.Specif.eq_sig2_hprop_iff

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sig2_hprop_iff.statement

## Corelib.Init.Specif.eq_sig2_ind

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sig2_ind.statement

## Corelib.Init.Specif.eq_sig2_ind_uncurried

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sig2_ind_uncurried.statement

## Corelib.Init.Specif.eq_sig2_nondep

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sig2_nondep.statement

## Corelib.Init.Specif.eq_sig2_rec

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sig2_rec

## Corelib.Init.Specif.eq_sig2_rec_uncurried

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sig2_rec_uncurried

## Corelib.Init.Specif.eq_sig2_rect

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sig2_rect

## Corelib.Init.Specif.eq_sig2_rect_exist2

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sig2_rect_exist2

## Corelib.Init.Specif.eq_sig2_rect_exist2_l

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sig2_rect_exist2_l

## Corelib.Init.Specif.eq_sig2_rect_exist2_r

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sig2_rect_exist2_r

## Corelib.Init.Specif.eq_sig2_rect_uncurried

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sig2_rect_uncurried

## Corelib.Init.Specif.eq_sig2_uncurried

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sig2_uncurried.statement

## Corelib.Init.Specif.eq_sig2_uncurried_iff

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sig2_uncurried_iff.statement

## Corelib.Init.Specif.eq_sigT

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.eq_sigT.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_sigT.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_326) (P : A → Sort u_Corelib_Init_Specif_327)
  (u v : Rocq.Corelib.Init.Specif.sigT A fun a => P a)
  (p : Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) u = Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) v),
  Rocq.Corelib.Init.Logic.eq_rect A (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) u) (fun a => P a)
        (Rocq.Corelib.Init.Specif.projT2 A (fun a => P a) u) (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) v) ⋯ =
      Rocq.Corelib.Init.Specif.projT2 A (fun a => P a) v →
    u = v
```

Residual source symbols: Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.projT1;Rocq.Corelib.Init.Logic.eq_rect;Rocq.Corelib.Init.Specif.projT2;Rocq.Corelib.Init.Logic.eq

## Corelib.Init.Specif.eq_sigT2

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.eq_sigT2.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_sigT2.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_831) (P : A → Sort u_Corelib_Init_Specif_832) (Q : A → Sort u_Corelib_Init_Specif_833)
  (u v : Rocq.Corelib.Init.Specif.sigT2 A (fun a => P a) fun a => Q a)
  (p :
    Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
        (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u) =
      Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
        (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v)),
  Rocq.Corelib.Init.Logic.eq_rect A
        (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
          (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u))
        (fun a => P a)
        (Rocq.Corelib.Init.Specif.projT2 A (fun a => P a)
          (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u))
        (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
          (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v))
        ⋯ =
      Rocq.Corelib.Init.Specif.projT2 A (fun a => P a)
        (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v) →
    Rocq.Corelib.Init.Logic.eq_rect A
          (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
            (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u))
          (fun a => Q a) (Rocq.Corelib.Init.Specif.projT3 A (fun a => P a) (fun a => Q a) u)
          (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
            (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v))
          ⋯ =
        Rocq.Corelib.Init.Specif.projT3 A (fun a => P a) (fun a => Q a) v →
      u = v
```

Residual source symbols: Rocq.Corelib.Init.Specif.sigT2;Rocq.Corelib.Init.Specif.projT1;Rocq.Corelib.Init.Specif.sigT_of_sigT2;Rocq.Corelib.Init.Logic.eq_rect;Rocq.Corelib.Init.Specif.projT2;Rocq.Corelib.Init.Logic.eq;Rocq.Corelib.Init.Specif.projT3

## Corelib.Init.Specif.eq_sigT2_hprop

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.eq_sigT2_hprop.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_sigT2_hprop.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_884) (P : A → Sort u_Corelib_Init_Specif_890)
  (Q : A → Sort u_Corelib_Init_Specif_887),
  (∀ (x : A) (p q : Q x), p = q) →
    ∀ (u v : Rocq.Corelib.Init.Specif.sigT2 A (fun a => P a) fun a => Q a),
      Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u =
          Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v →
        u = v
```

Residual source symbols: Rocq.Corelib.Init.Specif.sigT2;Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.sigT_of_sigT2

## Corelib.Init.Specif.eq_sigT2_hprop_iff

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.eq_sigT2_hprop_iff.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_sigT2_hprop_iff.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_1072) (P : A → Sort u_Corelib_Init_Specif_1078)
  (Q : A → Sort u_Corelib_Init_Specif_1075),
  (∀ (x : A) (p q : Q x), p = q) →
    ∀ (u v : Rocq.Corelib.Init.Specif.sigT2 A (fun a => P a) fun a => Q a),
      u = v ↔
        Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u =
          Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v
```

Residual source symbols: Rocq.Corelib.Init.Specif.sigT2;Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.sigT_of_sigT2

## Corelib.Init.Specif.eq_sigT2_ind

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sigT2_ind.statement

## Corelib.Init.Specif.eq_sigT2_ind_uncurried

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sigT2_ind_uncurried.statement

## Corelib.Init.Specif.eq_sigT2_nondep

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.eq_sigT2_nondep.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_sigT2_nondep.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_1093) (B : Sort u_Corelib_Init_Specif_1094) (C : Sort u_Corelib_Init_Specif_1095)
  (u v : Rocq.Corelib.Init.Specif.sigT2 A (fun a => B) fun a => C),
  Rocq.Corelib.Init.Specif.projT1 A (fun a => B)
        (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => B) (fun a => C) u) =
      Rocq.Corelib.Init.Specif.projT1 A (fun a => B)
        (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => B) (fun a => C) v) →
    Rocq.Corelib.Init.Specif.projT2 A (fun a => B)
          (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => B) (fun a => C) u) =
        Rocq.Corelib.Init.Specif.projT2 A (fun a => B)
          (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => B) (fun a => C) v) →
      Rocq.Corelib.Init.Specif.projT3 A (fun a => B) (fun a => C) u =
          Rocq.Corelib.Init.Specif.projT3 A (fun a => B) (fun a => C) v →
        u = v
```

Residual source symbols: Rocq.Corelib.Init.Specif.sigT2;Rocq.Corelib.Init.Specif.projT1;Rocq.Corelib.Init.Specif.sigT_of_sigT2;Rocq.Corelib.Init.Specif.projT2;Rocq.Corelib.Init.Specif.projT3

## Corelib.Init.Specif.eq_sigT2_rec

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sigT2_rec

## Corelib.Init.Specif.eq_sigT2_rec_uncurried

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sigT2_rec_uncurried

## Corelib.Init.Specif.eq_sigT2_rect

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sigT2_rect

## Corelib.Init.Specif.eq_sigT2_rect_existT2

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sigT2_rect_existT2

## Corelib.Init.Specif.eq_sigT2_rect_existT2_l

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sigT2_rect_existT2_l

## Corelib.Init.Specif.eq_sigT2_rect_existT2_r

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sigT2_rect_existT2_r

## Corelib.Init.Specif.eq_sigT2_rect_uncurried

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sigT2_rect_uncurried

## Corelib.Init.Specif.eq_sigT2_uncurried

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.eq_sigT2_uncurried.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_sigT2_uncurried.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_797) (P : A → Sort u_Corelib_Init_Specif_798) (Q : A → Sort u_Corelib_Init_Specif_799)
  (u v : Rocq.Corelib.Init.Specif.sigT2 A (fun a => P a) fun a => Q a),
  (Rocq.Corelib.Init.Specif.sigT2.qualityProp
      (Rocq.Corelib.Init.Logic.eq A
        (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
          (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u))
        (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
          (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v)))
      (fun p =>
        Rocq.Corelib.Init.Logic.eq_rect A
            (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
              (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u))
            (fun a => P a)
            (Rocq.Corelib.Init.Specif.projT2 A (fun a => P a)
              (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u))
            (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
              (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v))
            p =
          Rocq.Corelib.Init.Specif.projT2 A (fun a => P a)
            (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v))
      fun p =>
      Rocq.Corelib.Init.Logic.eq_rect A
          (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
            (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u))
          (fun a => Q a) (Rocq.Corelib.Init.Specif.projT3 A (fun a => P a) (fun a => Q a) u)
          (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
            (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v))
          p =
        Rocq.Corelib.Init.Specif.projT3 A (fun a => P a) (fun a => Q a) v) →
    u = v
```

Residual source symbols: Rocq.Corelib.Init.Specif.sigT2;Rocq.Corelib.Init.Specif.sigT2.qualityProp;Rocq.Corelib.Init.Logic.eq;Rocq.Corelib.Init.Specif.projT1;Rocq.Corelib.Init.Specif.sigT_of_sigT2;Rocq.Corelib.Init.Logic.eq_rect;Rocq.Corelib.Init.Specif.projT2;Rocq.Corelib.Init.Specif.projT3

## Corelib.Init.Specif.eq_sigT2_uncurried_iff

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.eq_sigT2_uncurried_iff.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_sigT2_uncurried_iff.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_904) (P : A → Sort u_Corelib_Init_Specif_905) (Q : A → Sort u_Corelib_Init_Specif_908)
  (u v : Rocq.Corelib.Init.Specif.sigT2 A (fun a => P a) fun a => Q a),
  u = v ↔
    Rocq.Corelib.Init.Specif.sigT2.qualityProp
      (Rocq.Corelib.Init.Logic.eq A
        (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
          (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u))
        (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
          (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v)))
      (fun p =>
        Rocq.Corelib.Init.Logic.eq_rect A
            (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
              (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u))
            (fun a => P a)
            (Rocq.Corelib.Init.Specif.projT2 A (fun a => P a)
              (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u))
            (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
              (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v))
            p =
          Rocq.Corelib.Init.Specif.projT2 A (fun a => P a)
            (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v))
      fun p =>
      Rocq.Corelib.Init.Logic.eq_rect A
          (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
            (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u))
          (fun a => Q a) (Rocq.Corelib.Init.Specif.projT3 A (fun a => P a) (fun a => Q a) u)
          (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
            (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v))
          p =
        Rocq.Corelib.Init.Specif.projT3 A (fun a => P a) (fun a => Q a) v
```

Residual source symbols: Rocq.Corelib.Init.Specif.sigT2;Rocq.Corelib.Init.Specif.sigT2.qualityProp;Rocq.Corelib.Init.Logic.eq;Rocq.Corelib.Init.Specif.projT1;Rocq.Corelib.Init.Specif.sigT_of_sigT2;Rocq.Corelib.Init.Logic.eq_rect;Rocq.Corelib.Init.Specif.projT2;Rocq.Corelib.Init.Specif.projT3

## Corelib.Init.Specif.eq_sigT_hprop

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.eq_sigT_hprop.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_sigT_hprop.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_362) (P : A → Sort u_Corelib_Init_Specif_365),
  (∀ (x : A) (p q : P x), p = q) →
    ∀ (u v : Rocq.Corelib.Init.Specif.sigT A fun a => P a),
      Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) u = Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) v → u = v
```

Residual source symbols: Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.projT1

## Corelib.Init.Specif.eq_sigT_hprop_iff

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.eq_sigT_hprop_iff.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_sigT_hprop_iff.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_492) (P : A → Sort u_Corelib_Init_Specif_495),
  (∀ (x : A) (p q : P x), p = q) →
    ∀ (u v : Rocq.Corelib.Init.Specif.sigT A fun a => P a),
      u = v ↔ Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) u = Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) v
```

Residual source symbols: Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.projT1

## Corelib.Init.Specif.eq_sigT_ind

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sigT_ind.statement

## Corelib.Init.Specif.eq_sigT_ind_uncurried

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sigT_ind_uncurried.statement

## Corelib.Init.Specif.eq_sigT_nondep

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.eq_sigT_nondep.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_sigT_nondep.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_507) (B : Sort u_Corelib_Init_Specif_508)
  (u v : Rocq.Corelib.Init.Specif.sigT A fun a => B),
  Rocq.Corelib.Init.Specif.projT1 A (fun a => B) u = Rocq.Corelib.Init.Specif.projT1 A (fun a => B) v →
    Rocq.Corelib.Init.Specif.projT2 A (fun a => B) u = Rocq.Corelib.Init.Specif.projT2 A (fun a => B) v → u = v
```

Residual source symbols: Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.projT1;Rocq.Corelib.Init.Specif.projT2

## Corelib.Init.Specif.eq_sigT_rec

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sigT_rec

## Corelib.Init.Specif.eq_sigT_rec_uncurried

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sigT_rec_uncurried

## Corelib.Init.Specif.eq_sigT_rect

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sigT_rect

## Corelib.Init.Specif.eq_sigT_rect_existT

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sigT_rect_existT

## Corelib.Init.Specif.eq_sigT_rect_existT_l

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sigT_rect_existT_l

## Corelib.Init.Specif.eq_sigT_rect_existT_r

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sigT_rect_existT_r

## Corelib.Init.Specif.eq_sigT_rect_uncurried

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sigT_rect_uncurried

## Corelib.Init.Specif.eq_sigT_uncurried

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.eq_sigT_uncurried.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_sigT_uncurried.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_246) (P : A → Sort u_Corelib_Init_Specif_247)
  (u v : Rocq.Corelib.Init.Specif.sigT A fun a => P a),
  (Rocq.Corelib.Init.Specif.sigT.qualityProp
      (Rocq.Corelib.Init.Logic.eq A (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) u)
        (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) v))
      fun p =>
      Rocq.Corelib.Init.Logic.eq_rect A (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) u) (fun a => P a)
          (Rocq.Corelib.Init.Specif.projT2 A (fun a => P a) u) (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) v) p =
        Rocq.Corelib.Init.Specif.projT2 A (fun a => P a) v) →
    u = v
```

Residual source symbols: Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.sigT.qualityProp;Rocq.Corelib.Init.Logic.eq;Rocq.Corelib.Init.Specif.projT1;Rocq.Corelib.Init.Logic.eq_rect;Rocq.Corelib.Init.Specif.projT2

## Corelib.Init.Specif.eq_sigT_uncurried_iff

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.eq_sigT_uncurried_iff.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_sigT_uncurried_iff.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_375) (P : A → Sort u_Corelib_Init_Specif_376)
  (u v : Rocq.Corelib.Init.Specif.sigT A fun a => P a),
  u = v ↔
    Rocq.Corelib.Init.Specif.sigT.qualityProp
      (Rocq.Corelib.Init.Logic.eq A (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) u)
        (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) v))
      fun p =>
      Rocq.Corelib.Init.Logic.eq_rect A (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) u) (fun a => P a)
          (Rocq.Corelib.Init.Specif.projT2 A (fun a => P a) u) (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) v) p =
        Rocq.Corelib.Init.Specif.projT2 A (fun a => P a) v
```

Residual source symbols: Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.sigT.qualityProp;Rocq.Corelib.Init.Logic.eq;Rocq.Corelib.Init.Specif.projT1;Rocq.Corelib.Init.Logic.eq_rect;Rocq.Corelib.Init.Specif.projT2

## Corelib.Init.Specif.eq_sig_hprop

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.eq_sig_hprop.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_sig_hprop.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_684) (P : A → Prop),
  (∀ (x : A) (p q : P x), p = q) →
    ∀ (u v : Rocq.Corelib.Init.Specif.sig A fun a => P a),
      Rocq.Corelib.Init.Specif.proj1_sig A (fun a => P a) u = Rocq.Corelib.Init.Specif.proj1_sig A (fun a => P a) v →
        u = v
```

Residual source symbols: Rocq.Corelib.Init.Specif.sig;Rocq.Corelib.Init.Specif.proj1_sig

## Corelib.Init.Specif.eq_sig_hprop_iff

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.eq_sig_hprop_iff.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_sig_hprop_iff.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_702) (P : A → Prop),
  (∀ (x : A) (p q : P x), p = q) →
    ∀ (u v : Rocq.Corelib.Init.Specif.sig A fun a => P a),
      u = v ↔
        Rocq.Corelib.Init.Specif.proj1_sig A (fun a => P a) u = Rocq.Corelib.Init.Specif.proj1_sig A (fun a => P a) v
```

Residual source symbols: Rocq.Corelib.Init.Specif.sig;Rocq.Corelib.Init.Specif.proj1_sig

## Corelib.Init.Specif.eq_sig_ind

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sig_ind.statement

## Corelib.Init.Specif.eq_sig_ind_uncurried

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sig_ind_uncurried.statement

## Corelib.Init.Specif.eq_sig_rec

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sig_rec

## Corelib.Init.Specif.eq_sig_rec_uncurried

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sig_rec_uncurried

## Corelib.Init.Specif.eq_sig_rect

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sig_rect

## Corelib.Init.Specif.eq_sig_rect_exist

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sig_rect_exist

## Corelib.Init.Specif.eq_sig_rect_exist_l

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sig_rect_exist_l

## Corelib.Init.Specif.eq_sig_rect_exist_r

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sig_rect_exist_r

## Corelib.Init.Specif.eq_sig_rect_uncurried

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sig_rect_uncurried

## Corelib.Init.Specif.eq_sig_uncurried

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sig_uncurried.statement

## Corelib.Init.Specif.eq_sig_uncurried_iff

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.eq_sig_uncurried_iff.statement

## Corelib.Init.Specif.error

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Specif.error

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Specif.error.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.Init.Specif.ex2_of_sig2

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.ex2_of_sig2.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.ex2_of_sig2.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_123) (P Q : A → Prop) (X : Rocq.Corelib.Init.Specif.sig2 A P Q), ∃ x, P x ∧ Q x
```

Residual source symbols: Rocq.Corelib.Init.Specif.sig2

## Corelib.Init.Specif.ex2_of_sigT2

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.ex2_of_sigT2.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.ex2_of_sigT2.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_127) (P Q : A → Prop) (X : Rocq.Corelib.Init.Specif.sigT2 A P Q), ∃ x, P x ∧ Q x
```

Residual source symbols: Rocq.Corelib.Init.Specif.sigT2

## Corelib.Init.Specif.ex_of_sig

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.ex_of_sig.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.ex_of_sig.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_115) (P : A → Prop) (X : Rocq.Corelib.Init.Specif.sig A P), ∃ x, P x
```

Residual source symbols: Rocq.Corelib.Init.Specif.sig

## Corelib.Init.Specif.ex_of_sigT

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.ex_of_sigT.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.ex_of_sigT.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_119) (P : A → Prop) (X : Rocq.Corelib.Init.Specif.sigT A P), ∃ x, P x
```

Residual source symbols: Rocq.Corelib.Init.Specif.sigT

## Corelib.Init.Specif.except

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Specif.except

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Logic.False

## Corelib.Init.Specif.exists_to_inhabited_sig

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.exists_to_inhabited_sig.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.exists_to_inhabited_sig.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_179) (P : A → Prop),
  (∃ x, P x) → Nonempty (Rocq.Corelib.Init.Specif.sig A fun x => P x)
```

Residual source symbols: Rocq.Corelib.Init.Specif.sig

## Corelib.Init.Specif.inhabited_sig_to_exists

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.inhabited_sig_to_exists.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.inhabited_sig_to_exists.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_189) (P : A → Prop), Nonempty (Rocq.Corelib.Init.Specif.sig A fun x => P x) → ∃ x, P x
```

Residual source symbols: Rocq.Corelib.Init.Specif.sig

## Corelib.Init.Specif.prod_of_sigT

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Specif.prod_of_sigT

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Specif.prod_of_sigT.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.Init.Specif.prod_sigT_prod

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.prod_sigT_prod.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.prod_sigT_prod.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_194) (B : Sort u_Corelib_Init_Specif_195) (s : Rocq.Corelib.Init.Datatypes.prod A B),
  Rocq.Corelib.Init.Specif.prod_of_sigT A B (Rocq.Corelib.Init.Specif.sigT_of_prod A B s) = s
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.prod;Rocq.Corelib.Init.Specif.prod_of_sigT;Rocq.Corelib.Init.Specif.sigT_of_prod

## Corelib.Init.Specif.proj1_sig

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Specif.proj1_sig

Operation/Type Certificate: NativeBridge.proj1_sig_agrees

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Specif.proj1_sig.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.Init.Specif.proj1_sig_eq

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.proj1_sig_eq.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.proj1_sig_eq.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_534) (P : A → Prop) (u v : Rocq.Corelib.Init.Specif.sig A fun a => P a),
  u = v → Rocq.Corelib.Init.Specif.proj1_sig A (fun a => P a) u = Rocq.Corelib.Init.Specif.proj1_sig A (fun a => P a) v
```

Residual source symbols: Rocq.Corelib.Init.Specif.sig;Rocq.Corelib.Init.Specif.proj1_sig

## Corelib.Init.Specif.proj1_sig_of_sig2_eq

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.proj1_sig_of_sig2_eq.statement

## Corelib.Init.Specif.proj2_sig

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.proj2_sig.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.proj2_sig.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_54) (P : A → Prop) (e : Rocq.Corelib.Init.Specif.sig A P),
  P (Rocq.Corelib.Init.Specif.proj1_sig A P e)
```

Residual source symbols: Rocq.Corelib.Init.Specif.sig;Rocq.Corelib.Init.Specif.proj1_sig

## Corelib.Init.Specif.proj2_sig_eq

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.proj2_sig_eq.statement

## Corelib.Init.Specif.proj2_sig_of_sig2_eq

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.proj2_sig_of_sig2_eq.statement

## Corelib.Init.Specif.proj3_sig

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.proj3_sig.statement

## Corelib.Init.Specif.proj3_sig_eq

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.proj3_sig_eq.statement

## Corelib.Init.Specif.projT1

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Specif.projT1

Operation/type certificate: NativeBridge.projT1_agrees; NativeBridge.projT2_agrees

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Specif.projT1.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.Init.Specif.projT1_eq

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.projT1_eq.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.projT1_eq.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_211) (P : A → Sort u_Corelib_Init_Specif_212)
  (u v : Rocq.Corelib.Init.Specif.sigT A fun a => P a),
  u = v → Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) u = Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) v
```

Residual source symbols: Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.projT1

## Corelib.Init.Specif.projT1_of_sigT2_eq

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.projT1_of_sigT2_eq.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.projT1_of_sigT2_eq.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_739) (P : A → Sort u_Corelib_Init_Specif_740) (Q : A → Sort u_Corelib_Init_Specif_741)
  (u v : Rocq.Corelib.Init.Specif.sigT2 A (fun a => P a) fun a => Q a),
  u = v →
    Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
        (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u) =
      Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
        (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v)
```

Residual source symbols: Rocq.Corelib.Init.Specif.sigT2;Rocq.Corelib.Init.Specif.projT1;Rocq.Corelib.Init.Specif.sigT_of_sigT2

## Corelib.Init.Specif.projT2

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Specif.projT2

Operation/Type Certificate: NativeBridge.projT2_agrees

Reason for interface not covered: No registered type bijection for (x : Rocq.Corelib.Init.Specif.sigT A P) → P (Rocq.Corelib.Init.Specif.projT1 A P x)

## Corelib.Init.Specif.projT2_eq

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.projT2_eq.statement

## Corelib.Init.Specif.projT2_of_sigT2_eq

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.projT2_of_sigT2_eq.statement

## Corelib.Init.Specif.projT3

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Specif.projT3

Reason for interface not covered: No registered type bijection for (e : Rocq.Corelib.Init.Specif.sigT2 A P Q) →
  Q (Rocq.Corelib.Init.Specif.projT1 A P (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A P Q e))

## Corelib.Init.Specif.projT3_eq

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.projT3_eq.statement

## Corelib.Init.Specif.rew_sig

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.rew_sig.statement

## Corelib.Init.Specif.rew_sig2

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.rew_sig2.statement

## Corelib.Init.Specif.rew_sigT

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.rew_sigT.statement

## Corelib.Init.Specif.rew_sigT2

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.rew_sigT2.statement

## Corelib.Init.Specif.sig

Status: TYPE_ISO. Proven bidirectional inversion; specific parameters, Type/Sort range witness certificate type.

Original target: Rocq.Corelib.Init.Specif.sig

Operation/Type Certificate: NativeBridge.sigIso

## Corelib.Init.Specif.sig2

Status: TYPE_ISO. Proven bidirectional inversion; specific parameters, Type/Sort range witness certificate type.

Original target: Rocq.Corelib.Init.Specif.sig2

Operation/Type Certificate: NativeBridge.sig2Iso

## Corelib.Init.Specif.sig2_eta

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.sig2_eta.statement

## Corelib.Init.Specif.sig2_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.sig2_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.sig2_ind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_22) (P Q : A → Prop) (P0 : Rocq.Corelib.Init.Specif.sig2 A P Q → Prop),
  (∀ (x : A) (p : P x) (q : Q x), P0 (Rocq.Corelib.Init.Specif.sig2.exist2 A P Q x p q)) →
    ∀ (s : Rocq.Corelib.Init.Specif.sig2 A P Q), P0 s
```

Residual source symbols: Rocq.Corelib.Init.Specif.sig2;Rocq.Corelib.Init.Specif.sig2.exist2

## Corelib.Init.Specif.sig2_of_sigT2

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.sig2_of_sigT2

## Corelib.Init.Specif.sig2_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Specif.sig2_rec

Reason for not covering the interface: No registered type bijection for (P0 : Rocq.Corelib.Init.Specif.sig2 A P Q → Type) →
  ((x : A) → (p : P x) → (q : Q x) → P0 (Rocq.Corelib.Init.Specif.sig2.exist2 A P Q x p q)) →
    (s : Rocq.Corelib.Init.Specif.sig2 A P Q) → P0 s

## Corelib.Init.Specif.sig2_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Specif.sig2_rect

Reason for interface not covered: No registered type bijection for (P0 : Rocq.Corelib.Init.Specif.sig2 A P Q → Type u_Corelib_Init_Specif_20) →
  ((x : A) → (p : P x) → (q : Q x) → P0 (Rocq.Corelib.Init.Specif.sig2.exist2 A P Q x p q)) →
    (s : Rocq.Corelib.Init.Specif.sig2 A P Q) → P0 s

## Corelib.Init.Specif.sig2_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.sig2_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.sig2_sind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_24) (P Q : A → Prop) (P0 : Rocq.Corelib.Init.Specif.sig2 A P Q → Prop),
  (∀ (x : A) (p : P x) (q : Q x), P0 (Rocq.Corelib.Init.Specif.sig2.exist2 A P Q x p q)) →
    ∀ (s : Rocq.Corelib.Init.Specif.sig2 A P Q), P0 s
```

Residual source symbols: Rocq.Corelib.Init.Specif.sig2;Rocq.Corelib.Init.Specif.sig2.exist2

## Corelib.Init.Specif.sigT

Status: TYPE_ISO. Proven bidirectional inversion; specific parameters, Type/Sort range witness certificate type.

Original target: Rocq.Corelib.Init.Specif.sigT

Operation/Type Certificate: NativeBridge.sigmaIso

## Corelib.Init.Specif.sigT2

Status: TYPE_ISO. Proven bidirectional inversion; specific parameters, Type/Sort range witness certificate type.

Original target: Rocq.Corelib.Init.Specif.sigT2

Operation/Type Certificate: NativeBridge.sigma2Iso

## Corelib.Init.Specif.sigT2_eta

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.sigT2_eta.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.sigT2_eta.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_153) (P : A → Sort u_Corelib_Init_Specif_154) (Q : A → Sort u_Corelib_Init_Specif_157)
  (p : Rocq.Corelib.Init.Specif.sigT2 A (fun a => P a) fun a => Q a),
  p =
    Rocq.Corelib.Init.Specif.sigT2.existT2 A (fun a => P a) (fun a => Q a)
      (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
        (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) p))
      (Rocq.Corelib.Init.Specif.projT2 A (fun a => P a)
        (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) p))
      (Rocq.Corelib.Init.Specif.projT3 A (fun a => P a) (fun a => Q a) p)
```

Residual source symbols: Rocq.Corelib.Init.Specif.sigT2;Rocq.Corelib.Init.Specif.sigT2.existT2;Rocq.Corelib.Init.Specif.projT1;Rocq.Corelib.Init.Specif.sigT_of_sigT2;Rocq.Corelib.Init.Specif.projT2;Rocq.Corelib.Init.Specif.projT3

## Corelib.Init.Specif.sigT2_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.sigT2_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.sigT2_ind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_45) (P : A → Sort u_Corelib_Init_Specif_46) (Q : A → Sort u_Corelib_Init_Specif_47)
  (P0 : Rocq.Corelib.Init.Specif.sigT2 A P Q → Prop),
  (∀ (x : A) (p : P x) (q : Q x), P0 (Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q x p q)) →
    ∀ (s : Rocq.Corelib.Init.Specif.sigT2 A P Q), P0 s
```

Residual source symbols: Rocq.Corelib.Init.Specif.sigT2;Rocq.Corelib.Init.Specif.sigT2.existT2

## Corelib.Init.Specif.sigT2_of_sig2

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.sigT2_of_sig2

## Corelib.Init.Specif.sigT2_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Specif.sigT2_rec

Reason for not covering the interface: No registered type bijection for (P0 : Rocq.Corelib.Init.Specif.sigT2 A P Q → Type) →
  ((x : A) → (p : P x) → (q : Q x) → P0 (Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q x p q)) →
    (s : Rocq.Corelib.Init.Specif.sigT2 A P Q) → P0 s

## Corelib.Init.Specif.sigT2_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Specif.sigT2_rect

Reason for interface not covered: No registered type bijection for (P0 : Rocq.Corelib.Init.Specif.sigT2 A P Q → Type u_Corelib_Init_Specif_41) →
  ((x : A) → (p : P x) → (q : Q x) → P0 (Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q x p q)) →
    (s : Rocq.Corelib.Init.Specif.sigT2 A P Q) → P0 s

## Corelib.Init.Specif.sigT2_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.sigT2_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.sigT2_sind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_51) (P : A → Sort u_Corelib_Init_Specif_52) (Q : A → Sort u_Corelib_Init_Specif_53)
  (P0 : Rocq.Corelib.Init.Specif.sigT2 A P Q → Prop),
  (∀ (x : A) (p : P x) (q : Q x), P0 (Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q x p q)) →
    ∀ (s : Rocq.Corelib.Init.Specif.sigT2 A P Q), P0 s
```

Residual source symbols: Rocq.Corelib.Init.Specif.sigT2;Rocq.Corelib.Init.Specif.sigT2.existT2

## Corelib.Init.Specif.sigT_eta

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.sigT_eta.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.sigT_eta.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_134) (P : A → Sort u_Corelib_Init_Specif_135)
  (p : Rocq.Corelib.Init.Specif.sigT A fun a => P a),
  p =
    Rocq.Corelib.Init.Specif.sigT.existT A (fun a => P a) (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) p)
      (Rocq.Corelib.Init.Specif.projT2 A (fun a => P a) p)
```

Residual source symbols: Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.sigT.existT;Rocq.Corelib.Init.Specif.projT1;Rocq.Corelib.Init.Specif.projT2

## Corelib.Init.Specif.sigT_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.sigT_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.sigT_ind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_31) (P : A → Sort u_Corelib_Init_Specif_32)
  (P0 : Rocq.Corelib.Init.Specif.sigT A P → Prop),
  (∀ (x : A) (p : P x), P0 (Rocq.Corelib.Init.Specif.sigT.existT A P x p)) →
    ∀ (s : Rocq.Corelib.Init.Specif.sigT A P), P0 s
```

Residual source symbols: Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.sigT.existT

## Corelib.Init.Specif.sigT_of_prod

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Specif.sigT_of_prod

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Specif.sigT_of_prod.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.Init.Specif.sigT_of_sig

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.sigT_of_sig

## Corelib.Init.Specif.sigT_of_sigT2

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Specif.sigT_of_sigT2

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Specif.sigT_of_sigT2.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.Init.Specif.sigT_of_sigT2_eq

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.sigT_of_sigT2_eq.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.sigT_of_sigT2_eq.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_725) (P : A → Sort u_Corelib_Init_Specif_726) (Q : A → Sort u_Corelib_Init_Specif_727)
  (u v : Rocq.Corelib.Init.Specif.sigT2 A (fun a => P a) fun a => Q a),
  u = v →
    Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u =
      Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v
```

Residual source symbols: Rocq.Corelib.Init.Specif.sigT2;Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.sigT_of_sigT2

## Corelib.Init.Specif.sigT_prod_sigT

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.sigT_prod_sigT.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.sigT_prod_sigT.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_194) (B : Sort u_Corelib_Init_Specif_195)
  (p : Rocq.Corelib.Init.Specif.sigT A fun a => B),
  Rocq.Corelib.Init.Specif.sigT_of_prod A B (Rocq.Corelib.Init.Specif.prod_of_sigT A B p) = p
```

Residual source symbols: Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.sigT_of_prod;Rocq.Corelib.Init.Specif.prod_of_sigT

## Corelib.Init.Specif.sigT_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Specif.sigT_rec

Reason for interface not covered: No registered type bijection for (P0 : Rocq.Corelib.Init.Specif.sigT A P → Type) →
  ((x : A) → (p : P x) → P0 (Rocq.Corelib.Init.Specif.sigT.existT A P x p)) →
    (s : Rocq.Corelib.Init.Specif.sigT A P) → P0 s

## Corelib.Init.Specif.sigT_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Specif.sigT_rect

Reason for not covering the interface: No registered type bijection for (P0 : Rocq.Corelib.Init.Specif.sigT A P → Type u_Corelib_Init_Specif_28) →
  ((x : A) → (p : P x) → P0 (Rocq.Corelib.Init.Specif.sigT.existT A P x p)) →
    (s : Rocq.Corelib.Init.Specif.sigT A P) → P0 s

## Corelib.Init.Specif.sigT_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.sigT_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.sigT_sind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_35) (P : A → Sort u_Corelib_Init_Specif_36)
  (P0 : Rocq.Corelib.Init.Specif.sigT A P → Prop),
  (∀ (x : A) (p : P x), P0 (Rocq.Corelib.Init.Specif.sigT.existT A P x p)) →
    ∀ (s : Rocq.Corelib.Init.Specif.sigT A P), P0 s
```

Residual source symbols: Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.sigT.existT

## Corelib.Init.Specif.sig_eta

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.sig_eta.statement

## Corelib.Init.Specif.sig_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.sig_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.sig_ind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_15) (P : A → Prop) (P0 : Rocq.Corelib.Init.Specif.sig A P → Prop),
  (∀ (x : A) (p : P x), P0 (Rocq.Corelib.Init.Specif.sig.exist A P x p)) →
    ∀ (s : Rocq.Corelib.Init.Specif.sig A P), P0 s
```

Residual source symbols: Rocq.Corelib.Init.Specif.sig;Rocq.Corelib.Init.Specif.sig.exist

## Corelib.Init.Specif.sig_of_sig2

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.sig_of_sig2

## Corelib.Init.Specif.sig_of_sig2_eq

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.sig_of_sig2_eq.statement

## Corelib.Init.Specif.sig_of_sigT

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Specif.sig_of_sigT

## Corelib.Init.Specif.sig_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Specif.sig_rec

Reason for interface not covered: No registered type bijection for (P0 : Rocq.Corelib.Init.Specif.sig A P → Type) →
  ((x : A) → (p : P x) → P0 (Rocq.Corelib.Init.Specif.sig.exist A P x p)) →
    (s : Rocq.Corelib.Init.Specif.sig A P) → P0 s

## Corelib.Init.Specif.sig_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Specif.sig_rect

Reason for not covering the interface: No registered type bijection for (P0 : Rocq.Corelib.Init.Specif.sig A P → Type u_Corelib_Init_Specif_13) →
  ((x : A) → (p : P x) → P0 (Rocq.Corelib.Init.Specif.sig.exist A P x p)) →
    (s : Rocq.Corelib.Init.Specif.sig A P) → P0 s

## Corelib.Init.Specif.sig_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.sig_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.sig_sind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_17) (P : A → Prop) (P0 : Rocq.Corelib.Init.Specif.sig A P → Prop),
  (∀ (x : A) (p : P x), P0 (Rocq.Corelib.Init.Specif.sig.exist A P x p)) →
    ∀ (s : Rocq.Corelib.Init.Specif.sig A P), P0 s
```

Residual source symbols: Rocq.Corelib.Init.Specif.sig;Rocq.Corelib.Init.Specif.sig.exist

## Corelib.Init.Specif.sumbool

Status: TYPE_ISO. Proven bidirectional inversion; specific parameters, Type/Sort range witness certificate type.

Original target: Rocq.Corelib.Init.Specif.sumbool

Operation/type certificate: NativeBridge.sumboolIso; NativeBridge.decidableIso

## Corelib.Init.Specif.sumbool_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.sumbool_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.sumbool_ind.statement.correspondence

```lean
∀ (A B : Prop) (P : Rocq.Corelib.Init.Specif.sumbool A B → Prop),
  (∀ (a : A), P (Rocq.Corelib.Init.Specif.sumbool.left A B a)) →
    (∀ (b : B), P (Rocq.Corelib.Init.Specif.sumbool.right A B b)) → ∀ (s : Rocq.Corelib.Init.Specif.sumbool A B), P s
```

Residual source symbols: Rocq.Corelib.Init.Specif.sumbool;Rocq.Corelib.Init.Specif.sumbool.left;Rocq.Corelib.Init.Specif.sumbool.right

## Corelib.Init.Specif.sumbool_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Specif.sumbool_rec

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Init.Specif.sumbool A B → Type) →
  ((a : A) → P (Rocq.Corelib.Init.Specif.sumbool.left A B a)) →
    ((b : B) → P (Rocq.Corelib.Init.Specif.sumbool.right A B b)) → (s : Rocq.Corelib.Init.Specif.sumbool A B) → P s

## Corelib.Init.Specif.sumbool_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Specif.sumbool_rect

Reason for not covering the interface: No registered type bijection for (P : Rocq.Corelib.Init.Specif.sumbool A B → Type u_Corelib_Init_Specif_1394) →
  ((a : A) → P (Rocq.Corelib.Init.Specif.sumbool.left A B a)) →
    ((b : B) → P (Rocq.Corelib.Init.Specif.sumbool.right A B b)) → (s : Rocq.Corelib.Init.Specif.sumbool A B) → P s

## Corelib.Init.Specif.sumbool_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.sumbool_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.sumbool_sind.statement.correspondence

```lean
∀ (A B : Prop) (P : Rocq.Corelib.Init.Specif.sumbool A B → Prop),
  (∀ (a : A), P (Rocq.Corelib.Init.Specif.sumbool.left A B a)) →
    (∀ (b : B), P (Rocq.Corelib.Init.Specif.sumbool.right A B b)) → ∀ (s : Rocq.Corelib.Init.Specif.sumbool A B), P s
```

Residual source symbols: Rocq.Corelib.Init.Specif.sumbool;Rocq.Corelib.Init.Specif.sumbool.left;Rocq.Corelib.Init.Specif.sumbool.right

## Corelib.Init.Specif.sumor

Status: TYPE_ISO. Proven bidirectional inversion; specific parameters, Type/Sort range witness certificate type.

Original target: Rocq.Corelib.Init.Specif.sumor

Operation/Type Certificate: NativeBridge.sumorIso

## Corelib.Init.Specif.sumor_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.sumor_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.sumor_ind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_1399) (B : Prop) (P : Rocq.Corelib.Init.Specif.sumor A B → Prop),
  (∀ (a : A), P (Rocq.Corelib.Init.Specif.sumor.inleft A B a)) →
    (∀ (b : B), P (Rocq.Corelib.Init.Specif.sumor.inright A B b)) → ∀ (s : Rocq.Corelib.Init.Specif.sumor A B), P s
```

Residual source symbols: Rocq.Corelib.Init.Specif.sumor;Rocq.Corelib.Init.Specif.sumor.inleft;Rocq.Corelib.Init.Specif.sumor.inright

## Corelib.Init.Specif.sumor_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Specif.sumor_rec

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Init.Specif.sumor A B → Type) →
  ((a : A) → P (Rocq.Corelib.Init.Specif.sumor.inleft A B a)) →
    ((b : B) → P (Rocq.Corelib.Init.Specif.sumor.inright A B b)) → (s : Rocq.Corelib.Init.Specif.sumor A B) → P s

## Corelib.Init.Specif.sumor_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Specif.sumor_rect

Reason for not covering the interface: No registered type bijection for (P : Rocq.Corelib.Init.Specif.sumor A B → Type u_Corelib_Init_Specif_1397) →
  ((a : A) → P (Rocq.Corelib.Init.Specif.sumor.inleft A B a)) →
    ((b : B) → P (Rocq.Corelib.Init.Specif.sumor.inright A B b)) → (s : Rocq.Corelib.Init.Specif.sumor A B) → P s

## Corelib.Init.Specif.sumor_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Specif.sumor_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Specif.sumor_sind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_1401) (B : Prop) (P : Rocq.Corelib.Init.Specif.sumor A B → Prop),
  (∀ (a : A), P (Rocq.Corelib.Init.Specif.sumor.inleft A B a)) →
    (∀ (b : B), P (Rocq.Corelib.Init.Specif.sumor.inright A B b)) → ∀ (s : Rocq.Corelib.Init.Specif.sumor A B), P s
```

Residual source symbols: Rocq.Corelib.Init.Specif.sumor;Rocq.Corelib.Init.Specif.sumor.inleft;Rocq.Corelib.Init.Specif.sumor.inright

## Corelib.Init.Specif.value

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Specif.value

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Specif.value.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.
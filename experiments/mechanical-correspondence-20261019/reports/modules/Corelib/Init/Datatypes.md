# Corelib.Init.Datatypes

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.Init.Datatypes.BoolSpec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.BoolSpec

## Corelib.Init.Datatypes.BoolSpec_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.BoolSpec_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.BoolSpec_ind.statement.correspondence

```lean
∀ (P Q : Prop) (P0 : Rocq.Corelib.Init.Datatypes.bool → Prop),
  (P → P0 Rocq.Corelib.Init.Datatypes.bool.true) →
    (Q → P0 Rocq.Corelib.Init.Datatypes.bool.false) →
      ∀ (b : Rocq.Corelib.Init.Datatypes.bool), Rocq.Corelib.Init.Datatypes.BoolSpec P Q b → P0 b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.Init.Datatypes.BoolSpec

## Corelib.Init.Datatypes.BoolSpec_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.BoolSpec_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.BoolSpec_sind.statement.correspondence

```lean
∀ (P Q : Prop) (P0 : Rocq.Corelib.Init.Datatypes.bool → Prop),
  (P → P0 Rocq.Corelib.Init.Datatypes.bool.true) →
    (Q → P0 Rocq.Corelib.Init.Datatypes.bool.false) →
      ∀ (b : Rocq.Corelib.Init.Datatypes.bool), Rocq.Corelib.Init.Datatypes.BoolSpec P Q b → P0 b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.Init.Datatypes.BoolSpec

## Corelib.Init.Datatypes.CompOpp

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Datatypes.CompOpp

Operation/Type Certificate: NativeBridge.compOpp_agrees

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.CompOpp.roundtrip

## Corelib.Init.Datatypes.CompOpp_iff

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.CompOpp_iff.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.CompOpp_iff.statement.correspondence

```lean
∀ (c c' : Rocq.Corelib.Init.Datatypes.comparison),
  Rocq.Corelib.Init.Datatypes.CompOpp c = c' ↔ c = Rocq.Corelib.Init.Datatypes.CompOpp c'
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.comparison;Rocq.Corelib.Init.Datatypes.CompOpp

## Corelib.Init.Datatypes.CompOpp_inj

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.CompOpp_inj.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.CompOpp_inj.statement.correspondence

```lean
∀ (c c' : Rocq.Corelib.Init.Datatypes.comparison),
  Rocq.Corelib.Init.Datatypes.CompOpp c = Rocq.Corelib.Init.Datatypes.CompOpp c' → c = c'
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.comparison;Rocq.Corelib.Init.Datatypes.CompOpp

## Corelib.Init.Datatypes.CompOpp_involutive

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.CompOpp_involutive.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.CompOpp_involutive.statement.correspondence

```lean
∀ (c : Rocq.Corelib.Init.Datatypes.comparison),
  Rocq.Corelib.Init.Datatypes.CompOpp (Rocq.Corelib.Init.Datatypes.CompOpp c) = c
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.comparison;Rocq.Corelib.Init.Datatypes.CompOpp

## Corelib.Init.Datatypes.CompSpec

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Datatypes.CompSpec

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.CompSpec.roundtrip

## Corelib.Init.Datatypes.CompSpec2Type

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Datatypes.CompSpec2Type

## Corelib.Init.Datatypes.CompSpecT

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Datatypes.CompSpecT

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.CompSpecT.roundtrip

## Corelib.Init.Datatypes.CompareSpec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.CompareSpec

## Corelib.Init.Datatypes.CompareSpec2Type

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Datatypes.CompareSpec2Type

## Corelib.Init.Datatypes.CompareSpecT

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.CompareSpecT

## Corelib.Init.Datatypes.CompareSpecT_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.CompareSpecT_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.CompareSpecT_ind.statement.correspondence

```lean
∀ (Peq Plt Pgt : Prop)
  (P : (c : Rocq.Corelib.Init.Datatypes.comparison) → Rocq.Corelib.Init.Datatypes.CompareSpecT Peq Plt Pgt c → Prop),
  (∀ (p : Peq),
      P Rocq.Corelib.Init.Datatypes.comparison.Eq (Rocq.Corelib.Init.Datatypes.CompareSpecT.CompEqT Peq Plt Pgt p)) →
    (∀ (p : Plt),
        P Rocq.Corelib.Init.Datatypes.comparison.Lt (Rocq.Corelib.Init.Datatypes.CompareSpecT.CompLtT Peq Plt Pgt p)) →
      (∀ (p : Pgt),
          P Rocq.Corelib.Init.Datatypes.comparison.Gt
            (Rocq.Corelib.Init.Datatypes.CompareSpecT.CompGtT Peq Plt Pgt p)) →
        ∀ (c : Rocq.Corelib.Init.Datatypes.comparison) (c0 : Rocq.Corelib.Init.Datatypes.CompareSpecT Peq Plt Pgt c),
          P c c0
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.comparison;Rocq.Corelib.Init.Datatypes.CompareSpecT;Rocq.Corelib.Init.Datatypes.comparison.Eq;Rocq.Corelib.Init.Datatypes.CompareSpecT.CompEqT;Rocq.Corelib.Init.Datatypes.comparison.Lt;Rocq.Corelib.Init.Datatypes.CompareSpecT.CompLtT;Rocq.Corelib.Init.Datatypes.comparison.Gt;Rocq.Corelib.Init.Datatypes.CompareSpecT.CompGtT

## Corelib.Init.Datatypes.CompareSpecT_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.CompareSpecT_rec

Reason for interface not covered: No registered type bijection for (P:
    (c : Rocq.Corelib.Init.Datatypes.comparison) → Rocq.Corelib.Init.Datatypes.CompareSpecT Peq Plt Pgt c → Type) →
  ((p : Peq) →
      P Rocq.Corelib.Init.Datatypes.comparison.Eq (Rocq.Corelib.Init.Datatypes.CompareSpecT.CompEqT Peq Plt Pgt p)) →
    ((p : Plt) →
        P Rocq.Corelib.Init.Datatypes.comparison.Lt (Rocq.Corelib.Init.Datatypes.CompareSpecT.CompLtT Peq Plt Pgt p)) →
      ((p : Pgt) →
          P Rocq.Corelib.Init.Datatypes.comparison.Gt
            (Rocq.Corelib.Init.Datatypes.CompareSpecT.CompGtT Peq Plt Pgt p)) →
        (c : Rocq.Corelib.Init.Datatypes.comparison) →
          (c0 : Rocq.Corelib.Init.Datatypes.CompareSpecT Peq Plt Pgt c) → P c c0

## Corelib.Init.Datatypes.CompareSpecT_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.CompareSpecT_rect

Reason for interface not covered: No registered type bijection for (P:
    (c : Rocq.Corelib.Init.Datatypes.comparison) →
      Rocq.Corelib.Init.Datatypes.CompareSpecT Peq Plt Pgt c → Type u_Corelib_Init_Datatypes_250) →
  ((p : Peq) →
      P Rocq.Corelib.Init.Datatypes.comparison.Eq (Rocq.Corelib.Init.Datatypes.CompareSpecT.CompEqT Peq Plt Pgt p)) →
    ((p : Plt) →
        P Rocq.Corelib.Init.Datatypes.comparison.Lt (Rocq.Corelib.Init.Datatypes.CompareSpecT.CompLtT Peq Plt Pgt p)) →
      ((p : Pgt) →
          P Rocq.Corelib.Init.Datatypes.comparison.Gt
            (Rocq.Corelib.Init.Datatypes.CompareSpecT.CompGtT Peq Plt Pgt p)) →
        (c : Rocq.Corelib.Init.Datatypes.comparison) →
          (c0 : Rocq.Corelib.Init.Datatypes.CompareSpecT Peq Plt Pgt c) → P c c0

## Corelib.Init.Datatypes.CompareSpecT_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.CompareSpecT_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.CompareSpecT_sind.statement.correspondence

```lean
∀ (Peq Plt Pgt : Prop)
  (P : (c : Rocq.Corelib.Init.Datatypes.comparison) → Rocq.Corelib.Init.Datatypes.CompareSpecT Peq Plt Pgt c → Prop),
  (∀ (p : Peq),
      P Rocq.Corelib.Init.Datatypes.comparison.Eq (Rocq.Corelib.Init.Datatypes.CompareSpecT.CompEqT Peq Plt Pgt p)) →
    (∀ (p : Plt),
        P Rocq.Corelib.Init.Datatypes.comparison.Lt (Rocq.Corelib.Init.Datatypes.CompareSpecT.CompLtT Peq Plt Pgt p)) →
      (∀ (p : Pgt),
          P Rocq.Corelib.Init.Datatypes.comparison.Gt
            (Rocq.Corelib.Init.Datatypes.CompareSpecT.CompGtT Peq Plt Pgt p)) →
        ∀ (c : Rocq.Corelib.Init.Datatypes.comparison) (c0 : Rocq.Corelib.Init.Datatypes.CompareSpecT Peq Plt Pgt c),
          P c c0
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.comparison;Rocq.Corelib.Init.Datatypes.CompareSpecT;Rocq.Corelib.Init.Datatypes.comparison.Eq;Rocq.Corelib.Init.Datatypes.CompareSpecT.CompEqT;Rocq.Corelib.Init.Datatypes.comparison.Lt;Rocq.Corelib.Init.Datatypes.CompareSpecT.CompLtT;Rocq.Corelib.Init.Datatypes.comparison.Gt;Rocq.Corelib.Init.Datatypes.CompareSpecT.CompGtT

## Corelib.Init.Datatypes.CompareSpec_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.CompareSpec_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.CompareSpec_ind.statement.correspondence

```lean
∀ (Peq Plt Pgt : Prop) (P : Rocq.Corelib.Init.Datatypes.comparison → Prop),
  (Peq → P Rocq.Corelib.Init.Datatypes.comparison.Eq) →
    (Plt → P Rocq.Corelib.Init.Datatypes.comparison.Lt) →
      (Pgt → P Rocq.Corelib.Init.Datatypes.comparison.Gt) →
        ∀ (c : Rocq.Corelib.Init.Datatypes.comparison), Rocq.Corelib.Init.Datatypes.CompareSpec Peq Plt Pgt c → P c
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.comparison;Rocq.Corelib.Init.Datatypes.comparison.Eq;Rocq.Corelib.Init.Datatypes.comparison.Lt;Rocq.Corelib.Init.Datatypes.comparison.Gt;Rocq.Corelib.Init.Datatypes.CompareSpec

## Corelib.Init.Datatypes.CompareSpec_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.CompareSpec_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.CompareSpec_sind.statement.correspondence

```lean
∀ (Peq Plt Pgt : Prop) (P : Rocq.Corelib.Init.Datatypes.comparison → Prop),
  (Peq → P Rocq.Corelib.Init.Datatypes.comparison.Eq) →
    (Plt → P Rocq.Corelib.Init.Datatypes.comparison.Lt) →
      (Pgt → P Rocq.Corelib.Init.Datatypes.comparison.Gt) →
        ∀ (c : Rocq.Corelib.Init.Datatypes.comparison), Rocq.Corelib.Init.Datatypes.CompareSpec Peq Plt Pgt c → P c
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.comparison;Rocq.Corelib.Init.Datatypes.comparison.Eq;Rocq.Corelib.Init.Datatypes.comparison.Lt;Rocq.Corelib.Init.Datatypes.comparison.Gt;Rocq.Corelib.Init.Datatypes.CompareSpec

## Corelib.Init.Datatypes.Empty_set

Status: TYPE_ISO. Proven bidirectional inversion; specific parameters, Type/Sort range witness certificate type.

Original target: Rocq.Corelib.Init.Datatypes.Empty_set

Operation/Type Certificate: NativeBridge.emptyIso

## Corelib.Init.Datatypes.Empty_set_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.Empty_set_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.Empty_set_ind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Init.Datatypes.Empty_set → Prop) (e : Rocq.Corelib.Init.Datatypes.Empty_set), P e
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.Empty_set

## Corelib.Init.Datatypes.Empty_set_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.Empty_set_rec

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.Empty_set → Type) →
  (e : Rocq.Corelib.Init.Datatypes.Empty_set) → P e

## Corelib.Init.Datatypes.Empty_set_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.Empty_set_rect

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.Empty_set → Type u_Corelib_Init_Datatypes_5) →
  (e : Rocq.Corelib.Init.Datatypes.Empty_set) → P e

## Corelib.Init.Datatypes.Empty_set_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.Empty_set_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.Empty_set_sind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Init.Datatypes.Empty_set → Prop) (e : Rocq.Corelib.Init.Datatypes.Empty_set), P e
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.Empty_set

## Corelib.Init.Datatypes.ID

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Datatypes.ID

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.ID.roundtrip

## Corelib.Init.Datatypes.IDProp

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Datatypes.IDProp

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.IDProp.roundtrip

## Corelib.Init.Datatypes.andb

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Datatypes.andb

Operation/Type Certificate: NativeBridge.andb_agrees

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.andb.roundtrip

## Corelib.Init.Datatypes.andb_prop

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.andb_prop.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.andb_prop.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.andb a b = Rocq.Corelib.Init.Datatypes.bool.true →
    a = Rocq.Corelib.Init.Datatypes.bool.true ∧ b = Rocq.Corelib.Init.Datatypes.bool.true
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.andb;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Datatypes.andb_true_intro

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.andb_true_intro.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.andb_true_intro.statement.correspondence

```lean
∀ (b1 b2 : Rocq.Corelib.Init.Datatypes.bool),
  b1 = Rocq.Corelib.Init.Datatypes.bool.true ∧ b2 = Rocq.Corelib.Init.Datatypes.bool.true →
    Rocq.Corelib.Init.Datatypes.andb b1 b2 = Rocq.Corelib.Init.Datatypes.bool.true
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.andb

## Corelib.Init.Datatypes.app

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Datatypes.app

Operation/Type Certificate: NativeBridge.append_agrees

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.app.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.Init.Datatypes.bool

Status: TYPE_ISO. Proven bidirectional inversion; specific parameters, Type/Sort range witness certificate type.

Original target: Rocq.Corelib.Init.Datatypes.bool

Operation/Type Certificate: NativeBridge.boolIso

## Corelib.Init.Datatypes.bool_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.bool_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.bool_ind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Init.Datatypes.bool → Prop),
  P Rocq.Corelib.Init.Datatypes.bool.true →
    P Rocq.Corelib.Init.Datatypes.bool.false → ∀ (b : Rocq.Corelib.Init.Datatypes.bool), P b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.Init.Datatypes.bool_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.bool_rec

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.bool → Type) →
  P Rocq.Corelib.Init.Datatypes.bool.true →
    P Rocq.Corelib.Init.Datatypes.bool.false → (b : Rocq.Corelib.Init.Datatypes.bool) → P b

## Corelib.Init.Datatypes.bool_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.bool_rect

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.bool → Type u_Corelib_Init_Datatypes_7) →
  P Rocq.Corelib.Init.Datatypes.bool.true →
    P Rocq.Corelib.Init.Datatypes.bool.false → (b : Rocq.Corelib.Init.Datatypes.bool) → P b

## Corelib.Init.Datatypes.bool_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.bool_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.bool_sind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Init.Datatypes.bool → Prop),
  P Rocq.Corelib.Init.Datatypes.bool.true →
    P Rocq.Corelib.Init.Datatypes.bool.false → ∀ (b : Rocq.Corelib.Init.Datatypes.bool), P b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.Init.Datatypes.comparison

Status: TYPE_ISO. Proven bidirectional inversion; specific parameters, Type/Sort range witness certificate type.

Original target: Rocq.Corelib.Init.Datatypes.comparison

Operation/Type Certificate: NativeBridge.comparisonIso

## Corelib.Init.Datatypes.comparison_eq_stable

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.comparison_eq_stable.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.comparison_eq_stable.statement.correspondence

```lean
∀ (c c' : Rocq.Corelib.Init.Datatypes.comparison), ¬¬c = c' → c = c'
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.comparison

## Corelib.Init.Datatypes.comparison_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.comparison_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.comparison_ind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Init.Datatypes.comparison → Prop),
  P Rocq.Corelib.Init.Datatypes.comparison.Eq →
    P Rocq.Corelib.Init.Datatypes.comparison.Lt →
      P Rocq.Corelib.Init.Datatypes.comparison.Gt → ∀ (c : Rocq.Corelib.Init.Datatypes.comparison), P c
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.comparison;Rocq.Corelib.Init.Datatypes.comparison.Eq;Rocq.Corelib.Init.Datatypes.comparison.Lt;Rocq.Corelib.Init.Datatypes.comparison.Gt

## Corelib.Init.Datatypes.comparison_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.comparison_rec

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.comparison → Type) →
  P Rocq.Corelib.Init.Datatypes.comparison.Eq →
    P Rocq.Corelib.Init.Datatypes.comparison.Lt →
      P Rocq.Corelib.Init.Datatypes.comparison.Gt → (c : Rocq.Corelib.Init.Datatypes.comparison) → P c

## Corelib.Init.Datatypes.comparison_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.comparison_rect

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.comparison → Type u_Corelib_Init_Datatypes_210) →
  P Rocq.Corelib.Init.Datatypes.comparison.Eq →
    P Rocq.Corelib.Init.Datatypes.comparison.Lt →
      P Rocq.Corelib.Init.Datatypes.comparison.Gt → (c : Rocq.Corelib.Init.Datatypes.comparison) → P c

## Corelib.Init.Datatypes.comparison_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.comparison_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.comparison_sind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Init.Datatypes.comparison → Prop),
  P Rocq.Corelib.Init.Datatypes.comparison.Eq →
    P Rocq.Corelib.Init.Datatypes.comparison.Lt →
      P Rocq.Corelib.Init.Datatypes.comparison.Gt → ∀ (c : Rocq.Corelib.Init.Datatypes.comparison), P c
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.comparison;Rocq.Corelib.Init.Datatypes.comparison.Eq;Rocq.Corelib.Init.Datatypes.comparison.Lt;Rocq.Corelib.Init.Datatypes.comparison.Gt

## Corelib.Init.Datatypes.curry

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Datatypes.curry

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.curry.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.Init.Datatypes.eq_true

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.eq_true

## Corelib.Init.Datatypes.eq_true_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.eq_true_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.eq_true_ind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Init.Datatypes.bool → Prop),
  P Rocq.Corelib.Init.Datatypes.bool.true →
    ∀ (b : Rocq.Corelib.Init.Datatypes.bool), Rocq.Corelib.Init.Datatypes.eq_true b → P b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.eq_true

## Corelib.Init.Datatypes.eq_true_ind_r

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.eq_true_ind_r.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.eq_true_ind_r.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Init.Datatypes.bool → Prop) (b : Rocq.Corelib.Init.Datatypes.bool),
  P b → Rocq.Corelib.Init.Datatypes.eq_true b → P Rocq.Corelib.Init.Datatypes.bool.true
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.eq_true;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Datatypes.eq_true_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.eq_true_rec

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.bool → Type) →
  P Rocq.Corelib.Init.Datatypes.bool.true →
    (b : Rocq.Corelib.Init.Datatypes.bool) → Rocq.Corelib.Init.Datatypes.eq_true b → P b

## Corelib.Init.Datatypes.eq_true_rec_r

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.eq_true_rec_r

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.bool → Type) →
  (b : Rocq.Corelib.Init.Datatypes.bool) →
    P b → Rocq.Corelib.Init.Datatypes.eq_true b → P Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Datatypes.eq_true_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.eq_true_rect

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.bool → Type u_Corelib_Init_Datatypes_24) →
  P Rocq.Corelib.Init.Datatypes.bool.true →
    (b : Rocq.Corelib.Init.Datatypes.bool) → Rocq.Corelib.Init.Datatypes.eq_true b → P b

## Corelib.Init.Datatypes.eq_true_rect_r

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.eq_true_rect_r

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.bool → Type u_Corelib_Init_Datatypes_32) →
  (b : Rocq.Corelib.Init.Datatypes.bool) →
    P b → Rocq.Corelib.Init.Datatypes.eq_true b → P Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Datatypes.eq_true_rew

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.eq_true_rew

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.bool → Type u_Corelib_Init_Datatypes_25) →
  P Rocq.Corelib.Init.Datatypes.bool.true →
    (b : Rocq.Corelib.Init.Datatypes.bool) → Rocq.Corelib.Init.Datatypes.eq_true b → P b

## Corelib.Init.Datatypes.eq_true_rew_dep

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.eq_true_rew_dep

Reason for interface not covered: No registered type bijection for (P:
    (b : Rocq.Corelib.Init.Datatypes.bool) → Rocq.Corelib.Init.Datatypes.eq_true b → Type u_Corelib_Init_Datatypes_26) →
  P Rocq.Corelib.Init.Datatypes.bool.true Rocq.Corelib.Init.Datatypes.eq_true.is_eq_true →
    (b : Rocq.Corelib.Init.Datatypes.bool) → (e : Rocq.Corelib.Init.Datatypes.eq_true b) → P b e

## Corelib.Init.Datatypes.eq_true_rew_fwd_dep

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.eq_true_rew_fwd_dep

Reason for interface not covered: No registered type bijection for (b : Rocq.Corelib.Init.Datatypes.bool) →
  (H : Rocq.Corelib.Init.Datatypes.eq_true b) →
    (P :
        (b : Rocq.Corelib.Init.Datatypes.bool) →
          Rocq.Corelib.Init.Datatypes.eq_true b → Type u_Corelib_Init_Datatypes_27) →
      P b H → P Rocq.Corelib.Init.Datatypes.bool.true Rocq.Corelib.Init.Datatypes.eq_true.is_eq_true

## Corelib.Init.Datatypes.eq_true_rew_r

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.eq_true_rew_r

Reason for interface not covered: No registered type bijection for (b : Rocq.Corelib.Init.Datatypes.bool) →
  (P : Rocq.Corelib.Init.Datatypes.bool → Type u_Corelib_Init_Datatypes_28) →
    P b → Rocq.Corelib.Init.Datatypes.eq_true b → P Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Datatypes.eq_true_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.eq_true_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.eq_true_sind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Init.Datatypes.bool → Prop),
  P Rocq.Corelib.Init.Datatypes.bool.true →
    ∀ (b : Rocq.Corelib.Init.Datatypes.bool), Rocq.Corelib.Init.Datatypes.eq_true b → P b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.eq_true

## Corelib.Init.Datatypes.fst

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Datatypes.fst

Operation/Type Certificate: NativeBridge.fst_agrees

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.fst.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.Init.Datatypes.id

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Datatypes.id

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.id.roundtrip

## Corelib.Init.Datatypes.idProp

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.idProp.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.idProp.statement.correspondence

```lean
Rocq.Corelib.Init.Datatypes.IDProp
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.IDProp

## Corelib.Init.Datatypes.implb

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Datatypes.implb

Operation/Type Certificate: NativeBridge.implb_agrees

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.implb.roundtrip

## Corelib.Init.Datatypes.injective_projections

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.injective_projections.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.injective_projections.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Datatypes_116) (B : Sort u_Corelib_Init_Datatypes_117)
  (p1 p2 : Rocq.Corelib.Init.Datatypes.prod A B),
  Rocq.Corelib.Init.Datatypes.fst A B p1 = Rocq.Corelib.Init.Datatypes.fst A B p2 →
    Rocq.Corelib.Init.Datatypes.snd A B p1 = Rocq.Corelib.Init.Datatypes.snd A B p2 → p1 = p2
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.prod;Rocq.Corelib.Init.Datatypes.fst;Rocq.Corelib.Init.Datatypes.snd

## Corelib.Init.Datatypes.is_true

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Datatypes.is_true

Operation/Type Certificate: NativeBridge.is_true_agrees

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.is_true.roundtrip

## Corelib.Init.Datatypes.length

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Datatypes.length

Operation/Type Certificate: NativeBridge.length_agrees

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.length.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.Init.Datatypes.list

Status: TYPE_ISO. Proven bidirectional inversion; specific parameters, Type/Sort range witness certificate type.

Original target: Rocq.Corelib.Init.Datatypes.list

Operation/Type Certificate: NativeBridge.listIso

## Corelib.Init.Datatypes.list_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.list_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.list_ind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Datatypes_194) (P : Rocq.Corelib.Init.Datatypes.list A → Prop),
  P (Rocq.Corelib.Init.Datatypes.list.nil A) →
    (∀ (a : A) (l : Rocq.Corelib.Init.Datatypes.list A), P l → P (Rocq.Corelib.Init.Datatypes.list.cons A a l)) →
      ∀ (l : Rocq.Corelib.Init.Datatypes.list A), P l
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.list;Rocq.Corelib.Init.Datatypes.list.nil;Rocq.Corelib.Init.Datatypes.list.cons

## Corelib.Init.Datatypes.list_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.list_rec

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.list A → Type) →
  P (Rocq.Corelib.Init.Datatypes.list.nil A) →
    ((a : A) → (l : Rocq.Corelib.Init.Datatypes.list A) → P l → P (Rocq.Corelib.Init.Datatypes.list.cons A a l)) →
      (l : Rocq.Corelib.Init.Datatypes.list A) → P l

## Corelib.Init.Datatypes.list_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.list_rect

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.list A → Type u_Corelib_Init_Datatypes_192) →
  P (Rocq.Corelib.Init.Datatypes.list.nil A) →
    ((a : A) → (l : Rocq.Corelib.Init.Datatypes.list A) → P l → P (Rocq.Corelib.Init.Datatypes.list.cons A a l)) →
      (l : Rocq.Corelib.Init.Datatypes.list A) → P l

## Corelib.Init.Datatypes.list_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.list_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.list_sind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Datatypes_196) (P : Rocq.Corelib.Init.Datatypes.list A → Prop),
  P (Rocq.Corelib.Init.Datatypes.list.nil A) →
    (∀ (a : A) (l : Rocq.Corelib.Init.Datatypes.list A), P l → P (Rocq.Corelib.Init.Datatypes.list.cons A a l)) →
      ∀ (l : Rocq.Corelib.Init.Datatypes.list A), P l
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.list;Rocq.Corelib.Init.Datatypes.list.nil;Rocq.Corelib.Init.Datatypes.list.cons

## Corelib.Init.Datatypes.nat

Status: TYPE_ISO. Proven bidirectional inversion; specific parameters, Type/Sort range witness certificate type.

Original target: Rocq.Corelib.Init.Datatypes.nat

Operation/Type Certificate: NativeBridge.natIso

## Corelib.Init.Datatypes.nat_ind

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Datatypes.nat_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.nat_ind.statement.correspondence

```lean
∀ (f : Nat → Prop), f 0 → (∀ (n : Nat), f n → f n.succ) → ∀ (n : Nat), f n
```

## Corelib.Init.Datatypes.nat_rec

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Datatypes.nat_rec

Operation/Type Certificate: NativeBridge.source_nat_rec_agrees

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.nat → Type) →
  P Rocq.Corelib.Init.Datatypes.nat.O →
    ((n : Rocq.Corelib.Init.Datatypes.nat) → P n → P n.S) → (n : Rocq.Corelib.Init.Datatypes.nat) → P n

## Corelib.Init.Datatypes.nat_rect

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Datatypes.nat_rect

Operation/Type Certificate: NativeBridge.source_nat_rect_agrees

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.nat → Type u_Corelib_Init_Datatypes_33) →
  P Rocq.Corelib.Init.Datatypes.nat.O →
    ((n : Rocq.Corelib.Init.Datatypes.nat) → P n → P n.S) → (n : Rocq.Corelib.Init.Datatypes.nat) → P n

## Corelib.Init.Datatypes.nat_sind

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Datatypes.nat_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.nat_sind.statement.correspondence

```lean
∀ (f : Nat → Prop), f 0 → (∀ (n : Nat), f n → f n.succ) → ∀ (n : Nat), f n
```

## Corelib.Init.Datatypes.negb

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Datatypes.negb

Operation/Type Certificate: NativeBridge.negb_agrees

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.negb.roundtrip

## Corelib.Init.Datatypes.option

Status: TYPE_ISO. Proven bidirectional inversion; specific parameters, Type/Sort range witness certificate type.

Original target: Rocq.Corelib.Init.Datatypes.option

Operation/Type Certificate: NativeBridge.optionIso

## Corelib.Init.Datatypes.option_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.option_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.option_ind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Datatypes_38) (P : Rocq.Corelib.Init.Datatypes.option A → Prop),
  (∀ (a : A), P (Rocq.Corelib.Init.Datatypes.option.Some A a)) →
    P (Rocq.Corelib.Init.Datatypes.option.None A) → ∀ (o : Rocq.Corelib.Init.Datatypes.option A), P o
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.Init.Datatypes.option.Some;Rocq.Corelib.Init.Datatypes.option.None

## Corelib.Init.Datatypes.option_map

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Datatypes.option_map

Operation/Type Certificate: NativeBridge.option_map_agrees

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.option_map.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.Init.Datatypes.option_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.option_rec

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.option A → Type) →
  ((a : A) → P (Rocq.Corelib.Init.Datatypes.option.Some A a)) →
    P (Rocq.Corelib.Init.Datatypes.option.None A) → (o : Rocq.Corelib.Init.Datatypes.option A) → P o

## Corelib.Init.Datatypes.option_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.option_rect

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.option A → Type u_Corelib_Init_Datatypes_36) →
  ((a : A) → P (Rocq.Corelib.Init.Datatypes.option.Some A a)) →
    P (Rocq.Corelib.Init.Datatypes.option.None A) → (o : Rocq.Corelib.Init.Datatypes.option A) → P o

## Corelib.Init.Datatypes.option_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.option_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.option_sind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Datatypes_40) (P : Rocq.Corelib.Init.Datatypes.option A → Prop),
  (∀ (a : A), P (Rocq.Corelib.Init.Datatypes.option.Some A a)) →
    P (Rocq.Corelib.Init.Datatypes.option.None A) → ∀ (o : Rocq.Corelib.Init.Datatypes.option A), P o
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.Init.Datatypes.option.Some;Rocq.Corelib.Init.Datatypes.option.None

## Corelib.Init.Datatypes.orb

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Datatypes.orb

Operation/Type Certificate: NativeBridge.orb_agrees

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.orb.roundtrip

## Corelib.Init.Datatypes.pair_equal_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.pair_equal_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.pair_equal_spec.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Datatypes_126) (B : Sort u_Corelib_Init_Datatypes_127) (a1 a2 : A) (b1 b2 : B),
  Rocq.Corelib.Init.Datatypes.prod.pair A B a1 b1 = Rocq.Corelib.Init.Datatypes.prod.pair A B a2 b2 ↔ a1 = a2 ∧ b1 = b2
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.prod;Rocq.Corelib.Init.Datatypes.prod.pair

## Corelib.Init.Datatypes.prod

Status: TYPE_ISO. Proven bidirectional inversion; specific parameters, Type/Sort range witness certificate type.

Original target: Rocq.Corelib.Init.Datatypes.prod

Operation/Type Certificate: NativeBridge.prodIso

## Corelib.Init.Datatypes.prod_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.prod_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.prod_ind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Datatypes_80) (B : Sort u_Corelib_Init_Datatypes_81)
  (P : Rocq.Corelib.Init.Datatypes.prod A B → Prop),
  (∀ (a : A) (b : B), P (Rocq.Corelib.Init.Datatypes.prod.pair A B a b)) →
    ∀ (p : Rocq.Corelib.Init.Datatypes.prod A B), P p
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.prod;Rocq.Corelib.Init.Datatypes.prod.pair

## Corelib.Init.Datatypes.prod_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.prod_rec

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.prod A B → Type) →
  ((a : A) → (b : B) → P (Rocq.Corelib.Init.Datatypes.prod.pair A B a b)) →
    (p : Rocq.Corelib.Init.Datatypes.prod A B) → P p

## Corelib.Init.Datatypes.prod_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.prod_rect

Reason for not covering the interface: No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.prod A B → Type u_Corelib_Init_Datatypes_77) →
  ((a : A) → (b : B) → P (Rocq.Corelib.Init.Datatypes.prod.pair A B a b)) →
    (p : Rocq.Corelib.Init.Datatypes.prod A B) → P p

## Corelib.Init.Datatypes.prod_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.prod_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.prod_sind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Datatypes_84) (B : Sort u_Corelib_Init_Datatypes_85)
  (P : Rocq.Corelib.Init.Datatypes.prod A B → Prop),
  (∀ (a : A) (b : B), P (Rocq.Corelib.Init.Datatypes.prod.pair A B a b)) →
    ∀ (p : Rocq.Corelib.Init.Datatypes.prod A B), P p
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.prod;Rocq.Corelib.Init.Datatypes.prod.pair

## Corelib.Init.Datatypes.reflect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.reflect

## Corelib.Init.Datatypes.reflect_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.reflect_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.reflect_ind.statement.correspondence

```lean
∀ (P : Prop) (P0 : (b : Rocq.Corelib.Init.Datatypes.bool) → Rocq.Corelib.Init.Datatypes.reflect P b → Prop),
  (∀ (p : P), P0 Rocq.Corelib.Init.Datatypes.bool.true (Rocq.Corelib.Init.Datatypes.reflect.ReflectT P p)) →
    (∀ (n : ¬P), P0 Rocq.Corelib.Init.Datatypes.bool.false (Rocq.Corelib.Init.Datatypes.reflect.ReflectF P ⋯)) →
      ∀ (b : Rocq.Corelib.Init.Datatypes.bool) (r : Rocq.Corelib.Init.Datatypes.reflect P b), P0 b r
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.reflect.ReflectT;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.Init.Datatypes.reflect.ReflectF;Rocq.Corelib.Init.Logic.not

## Corelib.Init.Datatypes.reflect_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.reflect_rec

Reason for interface not covered: No registered type bijection for (P0:
    (b : Rocq.Corelib.Init.Datatypes.bool) → Rocq.Corelib.Init.Datatypes.reflect P b → Type) →
  ((p : P) → P0 Rocq.Corelib.Init.Datatypes.bool.true (Rocq.Corelib.Init.Datatypes.reflect.ReflectT P p)) →
    ((n : Rocq.Corelib.Init.Logic.not P) →
        P0 Rocq.Corelib.Init.Datatypes.bool.false (Rocq.Corelib.Init.Datatypes.reflect.ReflectF P n)) →
      (b : Rocq.Corelib.Init.Datatypes.bool) → (r : Rocq.Corelib.Init.Datatypes.reflect P b) → P0 b r

## Corelib.Init.Datatypes.reflect_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.reflect_rect

Reason for interface not covered: No registered type bijection for (P0:
    (b : Rocq.Corelib.Init.Datatypes.bool) →
      Rocq.Corelib.Init.Datatypes.reflect P b → Type u_Corelib_Init_Datatypes_8) →
  ((p : P) → P0 Rocq.Corelib.Init.Datatypes.bool.true (Rocq.Corelib.Init.Datatypes.reflect.ReflectT P p)) →
    ((n : Rocq.Corelib.Init.Logic.not P) →
        P0 Rocq.Corelib.Init.Datatypes.bool.false (Rocq.Corelib.Init.Datatypes.reflect.ReflectF P n)) →
      (b : Rocq.Corelib.Init.Datatypes.bool) → (r : Rocq.Corelib.Init.Datatypes.reflect P b) → P0 b r

## Corelib.Init.Datatypes.reflect_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.reflect_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.reflect_sind.statement.correspondence

```lean
∀ (P : Prop) (P0 : (b : Rocq.Corelib.Init.Datatypes.bool) → Rocq.Corelib.Init.Datatypes.reflect P b → Prop),
  (∀ (p : P), P0 Rocq.Corelib.Init.Datatypes.bool.true (Rocq.Corelib.Init.Datatypes.reflect.ReflectT P p)) →
    (∀ (n : ¬P), P0 Rocq.Corelib.Init.Datatypes.bool.false (Rocq.Corelib.Init.Datatypes.reflect.ReflectF P ⋯)) →
      ∀ (b : Rocq.Corelib.Init.Datatypes.bool) (r : Rocq.Corelib.Init.Datatypes.reflect P b), P0 b r
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.reflect.ReflectT;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.Init.Datatypes.reflect.ReflectF;Rocq.Corelib.Init.Logic.not

## Corelib.Init.Datatypes.result

Status: TYPE_ISO. Proven bidirectional inversion; specific parameters, Type/Sort range witness certificate type.

Original target: Rocq.Corelib.Init.Datatypes.result

Operation/Type Certificate: NativeBridge.resultIso

## Corelib.Init.Datatypes.result_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.result_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.result_ind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Datatypes_68) (E : Sort u_Corelib_Init_Datatypes_69)
  (P : Rocq.Corelib.Init.Datatypes.result A E → Prop),
  (∀ (a : A), P (Rocq.Corelib.Init.Datatypes.result.Ok A E a)) →
    (∀ (e : E), P (Rocq.Corelib.Init.Datatypes.result.Error A E e)) →
      ∀ (r : Rocq.Corelib.Init.Datatypes.result A E), P r
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.result;Rocq.Corelib.Init.Datatypes.result.Ok;Rocq.Corelib.Init.Datatypes.result.Error

## Corelib.Init.Datatypes.result_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.result_rec

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.result A E → Type) →
  ((a : A) → P (Rocq.Corelib.Init.Datatypes.result.Ok A E a)) →
    ((e : E) → P (Rocq.Corelib.Init.Datatypes.result.Error A E e)) → (r : Rocq.Corelib.Init.Datatypes.result A E) → P r

## Corelib.Init.Datatypes.result_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.result_rect

Reason for not covering the interface: No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.result A E → Type u_Corelib_Init_Datatypes_65) →
  ((a : A) → P (Rocq.Corelib.Init.Datatypes.result.Ok A E a)) →
    ((e : E) → P (Rocq.Corelib.Init.Datatypes.result.Error A E e)) → (r : Rocq.Corelib.Init.Datatypes.result A E) → P r

## Corelib.Init.Datatypes.result_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.result_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.result_sind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Datatypes_72) (E : Sort u_Corelib_Init_Datatypes_73)
  (P : Rocq.Corelib.Init.Datatypes.result A E → Prop),
  (∀ (a : A), P (Rocq.Corelib.Init.Datatypes.result.Ok A E a)) →
    (∀ (e : E), P (Rocq.Corelib.Init.Datatypes.result.Error A E e)) →
      ∀ (r : Rocq.Corelib.Init.Datatypes.result A E), P r
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.result;Rocq.Corelib.Init.Datatypes.result.Ok;Rocq.Corelib.Init.Datatypes.result.Error

## Corelib.Init.Datatypes.rew_pair

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.rew_pair.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.rew_pair.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Datatypes_174) (P : A → Sort u_Corelib_Init_Datatypes_175)
  (Q : A → Sort u_Corelib_Init_Datatypes_176) (x1 x2 : A) (y1 : P x1) (y2 : Q x1) (H : x1 = x2),
  Rocq.Corelib.Init.Datatypes.prod.pair (P x2) (Q x2) (Rocq.Corelib.Init.Logic.eq_rect A x1 P y1 x2 ⋯)
      (Rocq.Corelib.Init.Logic.eq_rect A x1 Q y2 x2 ⋯) =
    Rocq.Corelib.Init.Logic.eq_rect A x1 (fun x => Rocq.Corelib.Init.Datatypes.prod (P x) (Q x))
      (Rocq.Corelib.Init.Datatypes.prod.pair (P x1) (Q x1) y1 y2) x2 ⋯
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.prod;Rocq.Corelib.Init.Datatypes.prod.pair;Rocq.Corelib.Init.Logic.eq_rect;Rocq.Corelib.Init.Logic.eq

## Corelib.Init.Datatypes.snd

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Datatypes.snd

Operation/Type Certificate: NativeBridge.snd_agrees

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.snd.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.Init.Datatypes.sum

Status: TYPE_ISO. Proven bidirectional inversion; specific parameters, Type/Sort range witness certificate type.

Original target: Rocq.Corelib.Init.Datatypes.sum

Operation/Type Certificate: NativeBridge.sumIso

## Corelib.Init.Datatypes.sum_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.sum_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.sum_ind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Datatypes_54) (B : Sort u_Corelib_Init_Datatypes_55)
  (P : Rocq.Corelib.Init.Datatypes.sum A B → Prop),
  (∀ (a : A), P (Rocq.Corelib.Init.Datatypes.sum.inl A B a)) →
    (∀ (b : B), P (Rocq.Corelib.Init.Datatypes.sum.inr A B b)) → ∀ (s : Rocq.Corelib.Init.Datatypes.sum A B), P s
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.sum;Rocq.Corelib.Init.Datatypes.sum.inl;Rocq.Corelib.Init.Datatypes.sum.inr

## Corelib.Init.Datatypes.sum_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.sum_rec

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.sum A B → Type) →
  ((a : A) → P (Rocq.Corelib.Init.Datatypes.sum.inl A B a)) →
    ((b : B) → P (Rocq.Corelib.Init.Datatypes.sum.inr A B b)) → (s : Rocq.Corelib.Init.Datatypes.sum A B) → P s

## Corelib.Init.Datatypes.sum_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.sum_rect

Reason for not covering the interface: No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.sum A B → Type u_Corelib_Init_Datatypes_51) →
  ((a : A) → P (Rocq.Corelib.Init.Datatypes.sum.inl A B a)) →
    ((b : B) → P (Rocq.Corelib.Init.Datatypes.sum.inr A B b)) → (s : Rocq.Corelib.Init.Datatypes.sum A B) → P s

## Corelib.Init.Datatypes.sum_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.sum_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.sum_sind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Datatypes_58) (B : Sort u_Corelib_Init_Datatypes_59)
  (P : Rocq.Corelib.Init.Datatypes.sum A B → Prop),
  (∀ (a : A), P (Rocq.Corelib.Init.Datatypes.sum.inl A B a)) →
    (∀ (b : B), P (Rocq.Corelib.Init.Datatypes.sum.inr A B b)) → ∀ (s : Rocq.Corelib.Init.Datatypes.sum A B), P s
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.sum;Rocq.Corelib.Init.Datatypes.sum.inl;Rocq.Corelib.Init.Datatypes.sum.inr

## Corelib.Init.Datatypes.surjective_pairing

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.surjective_pairing.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.surjective_pairing.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Datatypes_108) (B : Sort u_Corelib_Init_Datatypes_109)
  (p : Rocq.Corelib.Init.Datatypes.prod A B),
  p =
    Rocq.Corelib.Init.Datatypes.prod.pair A B (Rocq.Corelib.Init.Datatypes.fst A B p)
      (Rocq.Corelib.Init.Datatypes.snd A B p)
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.prod;Rocq.Corelib.Init.Datatypes.prod.pair;Rocq.Corelib.Init.Datatypes.fst;Rocq.Corelib.Init.Datatypes.snd

## Corelib.Init.Datatypes.uncurry

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Datatypes.uncurry

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.uncurry.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.Init.Datatypes.unit

Status: TYPE_ISO. Proven bidirectional inversion; specific parameters, Type/Sort range witness certificate type.

Original target: Rocq.Corelib.Init.Datatypes.unit

Operation/Type Certificate: NativeBridge.unitIso

## Corelib.Init.Datatypes.unit_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.unit_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.unit_ind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Init.Datatypes.unit → Prop),
  P Rocq.Corelib.Init.Datatypes.unit.tt → ∀ (u : Rocq.Corelib.Init.Datatypes.unit), P u
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.unit;Rocq.Corelib.Init.Datatypes.unit.tt

## Corelib.Init.Datatypes.unit_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.unit_rec

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.unit → Type) →
  P Rocq.Corelib.Init.Datatypes.unit.tt → (u : Rocq.Corelib.Init.Datatypes.unit) → P u

## Corelib.Init.Datatypes.unit_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Datatypes.unit_rect

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.unit → Type u_Corelib_Init_Datatypes_6) →
  P Rocq.Corelib.Init.Datatypes.unit.tt → (u : Rocq.Corelib.Init.Datatypes.unit) → P u

## Corelib.Init.Datatypes.unit_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Datatypes.unit_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.unit_sind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Init.Datatypes.unit → Prop),
  P Rocq.Corelib.Init.Datatypes.unit.tt → ∀ (u : Rocq.Corelib.Init.Datatypes.unit), P u
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.unit;Rocq.Corelib.Init.Datatypes.unit.tt

## Corelib.Init.Datatypes.xorb

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Datatypes.xorb

Operation/Type Certificate: NativeBridge.xorb_agrees

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.xorb.roundtrip
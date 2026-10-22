# Corelib.Numbers.BinNums

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.Numbers.BinNums.N

Status: TYPE_ISO. Proven bidirectional inversion; specific parameters, Type/Sort range witness certificate type.

Original target: Rocq.Corelib.Numbers.BinNums.N

Operation/Type Certificate: NativeBridge.binaryNatIso

## Corelib.Numbers.BinNums.N_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.BinNums.N_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.BinNums.N_ind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Numbers.BinNums.N → Prop),
  P Rocq.Corelib.Numbers.BinNums.N.N0 →
    (∀ (p : Rocq.Corelib.Numbers.BinNums.positive), P (Rocq.Corelib.Numbers.BinNums.N.Npos p)) →
      ∀ (n : Rocq.Corelib.Numbers.BinNums.N), P n
```

Residual source symbols: Rocq.Corelib.Numbers.BinNums.N;Rocq.Corelib.Numbers.BinNums.N.N0;Rocq.Corelib.Numbers.BinNums.positive;Rocq.Corelib.Numbers.BinNums.N.Npos

## Corelib.Numbers.BinNums.N_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Numbers.BinNums.N_rec

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Numbers.BinNums.N → Type) →
  P Rocq.Corelib.Numbers.BinNums.N.N0 →
    ((p : Rocq.Corelib.Numbers.BinNums.positive) → P (Rocq.Corelib.Numbers.BinNums.N.Npos p)) →
      (n : Rocq.Corelib.Numbers.BinNums.N) → P n

## Corelib.Numbers.BinNums.N_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Numbers.BinNums.N_rect

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Numbers.BinNums.N → Type u_Corelib_Numbers_BinNums_22) →
  P Rocq.Corelib.Numbers.BinNums.N.N0 →
    ((p : Rocq.Corelib.Numbers.BinNums.positive) → P (Rocq.Corelib.Numbers.BinNums.N.Npos p)) →
      (n : Rocq.Corelib.Numbers.BinNums.N) → P n

## Corelib.Numbers.BinNums.N_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.BinNums.N_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.BinNums.N_sind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Numbers.BinNums.N → Prop),
  P Rocq.Corelib.Numbers.BinNums.N.N0 →
    (∀ (p : Rocq.Corelib.Numbers.BinNums.positive), P (Rocq.Corelib.Numbers.BinNums.N.Npos p)) →
      ∀ (n : Rocq.Corelib.Numbers.BinNums.N), P n
```

Residual source symbols: Rocq.Corelib.Numbers.BinNums.N;Rocq.Corelib.Numbers.BinNums.N.N0;Rocq.Corelib.Numbers.BinNums.positive;Rocq.Corelib.Numbers.BinNums.N.Npos

## Corelib.Numbers.BinNums.Z

Status: TYPE_ISO. Proven bidirectional inversion; specific parameters, Type/Sort range witness certificate type.

Original target: Rocq.Corelib.Numbers.BinNums.Z

Operation/Type Certificate: NativeBridge.binaryIntIso

## Corelib.Numbers.BinNums.Z_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.BinNums.Z_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.BinNums.Z_ind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Numbers.BinNums.Z → Prop),
  P Rocq.Corelib.Numbers.BinNums.Z.Z0 →
    (∀ (p : Rocq.Corelib.Numbers.BinNums.positive), P (Rocq.Corelib.Numbers.BinNums.Z.Zpos p)) →
      (∀ (p : Rocq.Corelib.Numbers.BinNums.positive), P (Rocq.Corelib.Numbers.BinNums.Z.Zneg p)) →
        ∀ (z : Rocq.Corelib.Numbers.BinNums.Z), P z
```

Residual source symbols: Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.Numbers.BinNums.Z.Z0;Rocq.Corelib.Numbers.BinNums.positive;Rocq.Corelib.Numbers.BinNums.Z.Zpos;Rocq.Corelib.Numbers.BinNums.Z.Zneg

## Corelib.Numbers.BinNums.Z_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Numbers.BinNums.Z_rec

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Numbers.BinNums.Z → Type) →
  P Rocq.Corelib.Numbers.BinNums.Z.Z0 →
    ((p : Rocq.Corelib.Numbers.BinNums.positive) → P (Rocq.Corelib.Numbers.BinNums.Z.Zpos p)) →
      ((p : Rocq.Corelib.Numbers.BinNums.positive) → P (Rocq.Corelib.Numbers.BinNums.Z.Zneg p)) →
        (z : Rocq.Corelib.Numbers.BinNums.Z) → P z

## Corelib.Numbers.BinNums.Z_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Numbers.BinNums.Z_rect

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Numbers.BinNums.Z → Type u_Corelib_Numbers_BinNums_23) →
  P Rocq.Corelib.Numbers.BinNums.Z.Z0 →
    ((p : Rocq.Corelib.Numbers.BinNums.positive) → P (Rocq.Corelib.Numbers.BinNums.Z.Zpos p)) →
      ((p : Rocq.Corelib.Numbers.BinNums.positive) → P (Rocq.Corelib.Numbers.BinNums.Z.Zneg p)) →
        (z : Rocq.Corelib.Numbers.BinNums.Z) → P z

## Corelib.Numbers.BinNums.Z_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.BinNums.Z_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.BinNums.Z_sind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Numbers.BinNums.Z → Prop),
  P Rocq.Corelib.Numbers.BinNums.Z.Z0 →
    (∀ (p : Rocq.Corelib.Numbers.BinNums.positive), P (Rocq.Corelib.Numbers.BinNums.Z.Zpos p)) →
      (∀ (p : Rocq.Corelib.Numbers.BinNums.positive), P (Rocq.Corelib.Numbers.BinNums.Z.Zneg p)) →
        ∀ (z : Rocq.Corelib.Numbers.BinNums.Z), P z
```

Residual source symbols: Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.Numbers.BinNums.Z.Z0;Rocq.Corelib.Numbers.BinNums.positive;Rocq.Corelib.Numbers.BinNums.Z.Zpos;Rocq.Corelib.Numbers.BinNums.Z.Zneg

## Corelib.Numbers.BinNums.positive

Status: TYPE_ISO. Proven bidirectional inversion; specific parameters, Type/Sort range witness certificate type.

Original target: Rocq.Corelib.Numbers.BinNums.positive

Operation/Type Certificate: NativeBridge.positiveIso

## Corelib.Numbers.BinNums.positive_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.BinNums.positive_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.BinNums.positive_ind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Numbers.BinNums.positive → Prop),
  (∀ (p : Rocq.Corelib.Numbers.BinNums.positive), P p → P p.xI) →
    (∀ (p : Rocq.Corelib.Numbers.BinNums.positive), P p → P p.xO) →
      P Rocq.Corelib.Numbers.BinNums.positive.xH → ∀ (p : Rocq.Corelib.Numbers.BinNums.positive), P p
```

Residual source symbols: Rocq.Corelib.Numbers.BinNums.positive;Rocq.Corelib.Numbers.BinNums.positive.xI;Rocq.Corelib.Numbers.BinNums.positive.xO;Rocq.Corelib.Numbers.BinNums.positive.xH

## Corelib.Numbers.BinNums.positive_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Numbers.BinNums.positive_rec

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Numbers.BinNums.positive → Type) →
  ((p : Rocq.Corelib.Numbers.BinNums.positive) → P p → P p.xI) →
    ((p : Rocq.Corelib.Numbers.BinNums.positive) → P p → P p.xO) →
      P Rocq.Corelib.Numbers.BinNums.positive.xH → (p : Rocq.Corelib.Numbers.BinNums.positive) → P p

## Corelib.Numbers.BinNums.positive_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Numbers.BinNums.positive_rect

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Numbers.BinNums.positive → Type u_Corelib_Numbers_BinNums_21) →
  ((p : Rocq.Corelib.Numbers.BinNums.positive) → P p → P p.xI) →
    ((p : Rocq.Corelib.Numbers.BinNums.positive) → P p → P p.xO) →
      P Rocq.Corelib.Numbers.BinNums.positive.xH → (p : Rocq.Corelib.Numbers.BinNums.positive) → P p

## Corelib.Numbers.BinNums.positive_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.BinNums.positive_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.BinNums.positive_sind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Numbers.BinNums.positive → Prop),
  (∀ (p : Rocq.Corelib.Numbers.BinNums.positive), P p → P p.xI) →
    (∀ (p : Rocq.Corelib.Numbers.BinNums.positive), P p → P p.xO) →
      P Rocq.Corelib.Numbers.BinNums.positive.xH → ∀ (p : Rocq.Corelib.Numbers.BinNums.positive), P p
```

Residual source symbols: Rocq.Corelib.Numbers.BinNums.positive;Rocq.Corelib.Numbers.BinNums.positive.xI;Rocq.Corelib.Numbers.BinNums.positive.xO;Rocq.Corelib.Numbers.BinNums.positive.xH
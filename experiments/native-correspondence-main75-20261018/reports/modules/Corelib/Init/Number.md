# Corelib.Init.Number

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.Init.Number.int_of_int

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Number.int_of_int

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Number.signed_int

## Corelib.Init.Number.internal_number_dec_bl

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Number.internal_number_dec_bl.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Number.internal_number_dec_bl.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Number.number),
  Rocq.Corelib.Init.Number.number_beq x y = Rocq.Corelib.Init.Datatypes.bool.true → x = y
```

Residual source symbols: Rocq.Corelib.Init.Number.number;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Number.number_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Number.internal_number_dec_lb

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Number.internal_number_dec_lb.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Number.internal_number_dec_lb.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Number.number),
  x = y → Rocq.Corelib.Init.Number.number_beq x y = Rocq.Corelib.Init.Datatypes.bool.true
```

Residual source symbols: Rocq.Corelib.Init.Number.number;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Number.number_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Number.internal_signed_int_dec_bl1

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Number.internal_signed_int_dec_bl1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Number.internal_signed_int_dec_bl1.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Number.signed_int),
  Rocq.Corelib.Init.Number.signed_int_beq x y = Rocq.Corelib.Init.Datatypes.bool.true → x = y
```

Residual source symbols: Rocq.Corelib.Init.Number.signed_int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Number.signed_int_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Number.internal_signed_int_dec_lb1

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Number.internal_signed_int_dec_lb1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Number.internal_signed_int_dec_lb1.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Number.signed_int),
  x = y → Rocq.Corelib.Init.Number.signed_int_beq x y = Rocq.Corelib.Init.Datatypes.bool.true
```

Residual source symbols: Rocq.Corelib.Init.Number.signed_int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Number.signed_int_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Number.internal_uint_dec_bl1

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Number.internal_uint_dec_bl1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Number.internal_uint_dec_bl1.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Number.uint),
  Rocq.Corelib.Init.Number.uint_beq x y = Rocq.Corelib.Init.Datatypes.bool.true → x = y
```

Residual source symbols: Rocq.Corelib.Init.Number.uint;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Number.uint_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Number.internal_uint_dec_lb1

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Number.internal_uint_dec_lb1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Number.internal_uint_dec_lb1.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Number.uint),
  x = y → Rocq.Corelib.Init.Number.uint_beq x y = Rocq.Corelib.Init.Datatypes.bool.true
```

Residual source symbols: Rocq.Corelib.Init.Number.uint;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Number.uint_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Number.number

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Number.number

## Corelib.Init.Number.number_beq

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Number.number_beq

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Number.number

## Corelib.Init.Number.number_eq_dec

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Number.number_eq_dec

## Corelib.Init.Number.signed_int

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Number.signed_int

## Corelib.Init.Number.signed_int_beq

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Number.signed_int_beq

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Number.signed_int

## Corelib.Init.Number.signed_int_eq_dec

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Number.signed_int_eq_dec

## Corelib.Init.Number.uint

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Number.uint

## Corelib.Init.Number.uint_beq

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Number.uint_beq

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Number.uint

## Corelib.Init.Number.uint_eq_dec

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Number.uint_eq_dec

## Corelib.Init.Number.uint_of_uint

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Number.uint_of_uint

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Number.uint
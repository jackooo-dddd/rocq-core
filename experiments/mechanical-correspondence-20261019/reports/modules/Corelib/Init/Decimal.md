# Corelib.Init.Decimal

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.Init.Decimal.Little.double

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Decimal.Little.double

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Decimal.Little.double.roundtrip

## Corelib.Init.Decimal.Little.succ

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Decimal.Little.succ

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Decimal.Little.succ.roundtrip

## Corelib.Init.Decimal.Little.succ_double

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Decimal.Little.succ_double

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Decimal.Little.succ_double.roundtrip

## Corelib.Init.Decimal.abs

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Decimal.abs

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Decimal.signed_int

## Corelib.Init.Decimal.app

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Decimal.app

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Decimal.app.roundtrip

## Corelib.Init.Decimal.app_int

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Decimal.app_int

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Decimal.signed_int

## Corelib.Init.Decimal.decimal

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Decimal.decimal

## Corelib.Init.Decimal.decimal_beq

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Decimal.decimal_beq

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Decimal.decimal

## Corelib.Init.Decimal.decimal_eq_dec

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Decimal.decimal_eq_dec

## Corelib.Init.Decimal.del_head

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Decimal.del_head

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Decimal.del_head.roundtrip

## Corelib.Init.Decimal.del_head_int

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Decimal.del_head_int

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Decimal.signed_int

## Corelib.Init.Decimal.del_tail

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Decimal.del_tail

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Decimal.del_tail.roundtrip

## Corelib.Init.Decimal.del_tail_int

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Decimal.del_tail_int

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Decimal.signed_int

## Corelib.Init.Decimal.int_of_int

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Decimal.int_of_int

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Decimal.signed_int

## Corelib.Init.Decimal.internal_decimal_dec_bl

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Decimal.internal_decimal_dec_bl.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Decimal.internal_decimal_dec_bl.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Decimal.decimal),
  Rocq.Corelib.Init.Decimal.decimal_beq x y = Rocq.Corelib.Init.Datatypes.bool.true → x = y
```

Residual source symbols: Rocq.Corelib.Init.Decimal.decimal;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Decimal.decimal_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Decimal.internal_decimal_dec_lb

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Decimal.internal_decimal_dec_lb.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Decimal.internal_decimal_dec_lb.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Decimal.decimal),
  x = y → Rocq.Corelib.Init.Decimal.decimal_beq x y = Rocq.Corelib.Init.Datatypes.bool.true
```

Residual source symbols: Rocq.Corelib.Init.Decimal.decimal;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Decimal.decimal_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Decimal.internal_signed_int_dec_bl

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Decimal.internal_signed_int_dec_bl.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Decimal.internal_signed_int_dec_bl.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Decimal.signed_int),
  Rocq.Corelib.Init.Decimal.signed_int_beq x y = Rocq.Corelib.Init.Datatypes.bool.true → x = y
```

Residual source symbols: Rocq.Corelib.Init.Decimal.signed_int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Decimal.signed_int_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Decimal.internal_signed_int_dec_lb

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Decimal.internal_signed_int_dec_lb.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Decimal.internal_signed_int_dec_lb.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Decimal.signed_int),
  x = y → Rocq.Corelib.Init.Decimal.signed_int_beq x y = Rocq.Corelib.Init.Datatypes.bool.true
```

Residual source symbols: Rocq.Corelib.Init.Decimal.signed_int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Decimal.signed_int_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Decimal.internal_uint_dec_bl

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Decimal.internal_uint_dec_bl.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Decimal.internal_uint_dec_bl.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Decimal.uint),
  Rocq.Corelib.Init.Decimal.uint_beq x y = Rocq.Corelib.Init.Datatypes.bool.true → x = y
```

Residual source symbols: Rocq.Corelib.Init.Decimal.uint;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Decimal.uint_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Decimal.internal_uint_dec_lb

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Decimal.internal_uint_dec_lb.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Decimal.internal_uint_dec_lb.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Decimal.uint),
  x = y → Rocq.Corelib.Init.Decimal.uint_beq x y = Rocq.Corelib.Init.Datatypes.bool.true
```

Residual source symbols: Rocq.Corelib.Init.Decimal.uint;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Decimal.uint_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Decimal.nb_digits

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Decimal.nb_digits

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Decimal.nb_digits.roundtrip

## Corelib.Init.Decimal.norm

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Decimal.norm

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Decimal.signed_int

## Corelib.Init.Decimal.nzhead

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Decimal.nzhead

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Decimal.nzhead.roundtrip

## Corelib.Init.Decimal.nztail

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Decimal.nztail

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Decimal.nztail.roundtrip

## Corelib.Init.Decimal.nztail_int

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Decimal.nztail_int

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Decimal.signed_int

## Corelib.Init.Decimal.opp

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Decimal.opp

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Decimal.signed_int

## Corelib.Init.Decimal.rev

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Decimal.rev

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Decimal.rev.roundtrip

## Corelib.Init.Decimal.revapp

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Decimal.revapp

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Decimal.revapp.roundtrip

## Corelib.Init.Decimal.signed_int

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Decimal.signed_int

## Corelib.Init.Decimal.signed_int_beq

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Decimal.signed_int_beq

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Decimal.signed_int

## Corelib.Init.Decimal.signed_int_eq_dec

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Decimal.signed_int_eq_dec

## Corelib.Init.Decimal.uint

Status: TYPE_ISO. Proven bidirectional inversion; specific parameters, Type/Sort range witness certificate type.

Original target: Rocq.Corelib.Init.Decimal.uint

Operation/Type Certificate: NativeBridge.decimalDigitsIso

## Corelib.Init.Decimal.uint_beq

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Decimal.uint_beq

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Decimal.uint_beq.roundtrip

## Corelib.Init.Decimal.uint_eq_dec

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Decimal.uint_eq_dec

## Corelib.Init.Decimal.uint_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Decimal.uint_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Decimal.uint_ind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Init.Decimal.uint → Prop),
  P Rocq.Corelib.Init.Decimal.uint.Nil →
    (∀ (u : Rocq.Corelib.Init.Decimal.uint), P u → P u.D0) →
      (∀ (u : Rocq.Corelib.Init.Decimal.uint), P u → P u.D1) →
        (∀ (u : Rocq.Corelib.Init.Decimal.uint), P u → P u.D2) →
          (∀ (u : Rocq.Corelib.Init.Decimal.uint), P u → P u.D3) →
            (∀ (u : Rocq.Corelib.Init.Decimal.uint), P u → P u.D4) →
              (∀ (u : Rocq.Corelib.Init.Decimal.uint), P u → P u.D5) →
                (∀ (u : Rocq.Corelib.Init.Decimal.uint), P u → P u.D6) →
                  (∀ (u : Rocq.Corelib.Init.Decimal.uint), P u → P u.D7) →
                    (∀ (u : Rocq.Corelib.Init.Decimal.uint), P u → P u.D8) →
                      (∀ (u : Rocq.Corelib.Init.Decimal.uint), P u → P u.D9) →
                        ∀ (u : Rocq.Corelib.Init.Decimal.uint), P u
```

Residual source symbols: Rocq.Corelib.Init.Decimal.uint;Rocq.Corelib.Init.Decimal.uint.Nil;Rocq.Corelib.Init.Decimal.uint.D0;Rocq.Corelib.Init.Decimal.uint.D1;Rocq.Corelib.Init.Decimal.uint.D2;Rocq.Corelib.Init.Decimal.uint.D3;Rocq.Corelib.Init.Decimal.uint.D4;Rocq.Corelib.Init.Decimal.uint.D5;Rocq.Corelib.Init.Decimal.uint.D6;Rocq.Corelib.Init.Decimal.uint.D7;Rocq.Corelib.Init.Decimal.uint.D8;Rocq.Corelib.Init.Decimal.uint.D9

## Corelib.Init.Decimal.uint_of_uint

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Decimal.uint_of_uint

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Decimal.uint_of_uint.roundtrip

## Corelib.Init.Decimal.uint_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Decimal.uint_rec

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Init.Decimal.uint → Type) →
  P Rocq.Corelib.Init.Decimal.uint.Nil →
    ((u : Rocq.Corelib.Init.Decimal.uint) → P u → P u.D0) →
      ((u : Rocq.Corelib.Init.Decimal.uint) → P u → P u.D1) →
        ((u : Rocq.Corelib.Init.Decimal.uint) → P u → P u.D2) →
          ((u : Rocq.Corelib.Init.Decimal.uint) → P u → P u.D3) →
            ((u : Rocq.Corelib.Init.Decimal.uint) → P u → P u.D4) →
              ((u : Rocq.Corelib.Init.Decimal.uint) → P u → P u.D5) →
                ((u : Rocq.Corelib.Init.Decimal.uint) → P u → P u.D6) →
                  ((u : Rocq.Corelib.Init.Decimal.uint) → P u → P u.D7) →
                    ((u : Rocq.Corelib.Init.Decimal.uint) → P u → P u.D8) →
                      ((u : Rocq.Corelib.Init.Decimal.uint) → P u → P u.D9) → (u : Rocq.Corelib.Init.Decimal.uint) → P u

## Corelib.Init.Decimal.uint_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Decimal.uint_rect

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Init.Decimal.uint → Type u_Corelib_Init_Decimal_32) →
  P Rocq.Corelib.Init.Decimal.uint.Nil →
    ((u : Rocq.Corelib.Init.Decimal.uint) → P u → P u.D0) →
      ((u : Rocq.Corelib.Init.Decimal.uint) → P u → P u.D1) →
        ((u : Rocq.Corelib.Init.Decimal.uint) → P u → P u.D2) →
          ((u : Rocq.Corelib.Init.Decimal.uint) → P u → P u.D3) →
            ((u : Rocq.Corelib.Init.Decimal.uint) → P u → P u.D4) →
              ((u : Rocq.Corelib.Init.Decimal.uint) → P u → P u.D5) →
                ((u : Rocq.Corelib.Init.Decimal.uint) → P u → P u.D6) →
                  ((u : Rocq.Corelib.Init.Decimal.uint) → P u → P u.D7) →
                    ((u : Rocq.Corelib.Init.Decimal.uint) → P u → P u.D8) →
                      ((u : Rocq.Corelib.Init.Decimal.uint) → P u → P u.D9) → (u : Rocq.Corelib.Init.Decimal.uint) → P u

## Corelib.Init.Decimal.uint_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Decimal.uint_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Decimal.uint_sind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Init.Decimal.uint → Prop),
  P Rocq.Corelib.Init.Decimal.uint.Nil →
    (∀ (u : Rocq.Corelib.Init.Decimal.uint), P u → P u.D0) →
      (∀ (u : Rocq.Corelib.Init.Decimal.uint), P u → P u.D1) →
        (∀ (u : Rocq.Corelib.Init.Decimal.uint), P u → P u.D2) →
          (∀ (u : Rocq.Corelib.Init.Decimal.uint), P u → P u.D3) →
            (∀ (u : Rocq.Corelib.Init.Decimal.uint), P u → P u.D4) →
              (∀ (u : Rocq.Corelib.Init.Decimal.uint), P u → P u.D5) →
                (∀ (u : Rocq.Corelib.Init.Decimal.uint), P u → P u.D6) →
                  (∀ (u : Rocq.Corelib.Init.Decimal.uint), P u → P u.D7) →
                    (∀ (u : Rocq.Corelib.Init.Decimal.uint), P u → P u.D8) →
                      (∀ (u : Rocq.Corelib.Init.Decimal.uint), P u → P u.D9) →
                        ∀ (u : Rocq.Corelib.Init.Decimal.uint), P u
```

Residual source symbols: Rocq.Corelib.Init.Decimal.uint;Rocq.Corelib.Init.Decimal.uint.Nil;Rocq.Corelib.Init.Decimal.uint.D0;Rocq.Corelib.Init.Decimal.uint.D1;Rocq.Corelib.Init.Decimal.uint.D2;Rocq.Corelib.Init.Decimal.uint.D3;Rocq.Corelib.Init.Decimal.uint.D4;Rocq.Corelib.Init.Decimal.uint.D5;Rocq.Corelib.Init.Decimal.uint.D6;Rocq.Corelib.Init.Decimal.uint.D7;Rocq.Corelib.Init.Decimal.uint.D8;Rocq.Corelib.Init.Decimal.uint.D9

## Corelib.Init.Decimal.unorm

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Decimal.unorm

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Decimal.unorm.roundtrip
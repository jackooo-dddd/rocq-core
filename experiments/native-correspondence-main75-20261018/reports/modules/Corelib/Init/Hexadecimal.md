# Corelib.Init.Hexadecimal

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.Init.Hexadecimal.Little.double

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Hexadecimal.Little.double

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Hexadecimal.Little.double.roundtrip

## Corelib.Init.Hexadecimal.Little.succ

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Hexadecimal.Little.succ

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Hexadecimal.Little.succ.roundtrip

## Corelib.Init.Hexadecimal.Little.succ_double

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Hexadecimal.Little.succ_double

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Hexadecimal.Little.succ_double.roundtrip

## Corelib.Init.Hexadecimal.abs

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Hexadecimal.abs

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Hexadecimal.signed_int

## Corelib.Init.Hexadecimal.app

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Hexadecimal.app

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Hexadecimal.app.roundtrip

## Corelib.Init.Hexadecimal.app_int

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Hexadecimal.app_int

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Hexadecimal.signed_int

## Corelib.Init.Hexadecimal.del_head

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Hexadecimal.del_head

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Hexadecimal.del_head.roundtrip

## Corelib.Init.Hexadecimal.del_head_int

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Hexadecimal.del_head_int

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Hexadecimal.signed_int

## Corelib.Init.Hexadecimal.del_tail

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Hexadecimal.del_tail

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Hexadecimal.del_tail.roundtrip

## Corelib.Init.Hexadecimal.del_tail_int

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Hexadecimal.del_tail_int

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Hexadecimal.signed_int

## Corelib.Init.Hexadecimal.hexadecimal

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Hexadecimal.hexadecimal

## Corelib.Init.Hexadecimal.hexadecimal_beq

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Hexadecimal.hexadecimal_beq

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Hexadecimal.hexadecimal

## Corelib.Init.Hexadecimal.hexadecimal_eq_dec

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Hexadecimal.hexadecimal_eq_dec

## Corelib.Init.Hexadecimal.internal_hexadecimal_dec_bl

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Hexadecimal.internal_hexadecimal_dec_bl.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Hexadecimal.internal_hexadecimal_dec_bl.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Hexadecimal.hexadecimal),
  Rocq.Corelib.Init.Hexadecimal.hexadecimal_beq x y = Rocq.Corelib.Init.Datatypes.bool.true → x = y
```

Residual source symbols: Rocq.Corelib.Init.Hexadecimal.hexadecimal;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Hexadecimal.hexadecimal_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Hexadecimal.internal_hexadecimal_dec_lb

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Hexadecimal.internal_hexadecimal_dec_lb.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Hexadecimal.internal_hexadecimal_dec_lb.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Hexadecimal.hexadecimal),
  x = y → Rocq.Corelib.Init.Hexadecimal.hexadecimal_beq x y = Rocq.Corelib.Init.Datatypes.bool.true
```

Residual source symbols: Rocq.Corelib.Init.Hexadecimal.hexadecimal;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Hexadecimal.hexadecimal_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Hexadecimal.internal_signed_int_dec_bl0

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Hexadecimal.internal_signed_int_dec_bl0.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Hexadecimal.internal_signed_int_dec_bl0.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Hexadecimal.signed_int),
  Rocq.Corelib.Init.Hexadecimal.signed_int_beq x y = Rocq.Corelib.Init.Datatypes.bool.true → x = y
```

Residual source symbols: Rocq.Corelib.Init.Hexadecimal.signed_int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Hexadecimal.signed_int_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Hexadecimal.internal_signed_int_dec_lb0

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Hexadecimal.internal_signed_int_dec_lb0.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Hexadecimal.internal_signed_int_dec_lb0.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Hexadecimal.signed_int),
  x = y → Rocq.Corelib.Init.Hexadecimal.signed_int_beq x y = Rocq.Corelib.Init.Datatypes.bool.true
```

Residual source symbols: Rocq.Corelib.Init.Hexadecimal.signed_int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Hexadecimal.signed_int_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Hexadecimal.internal_uint_dec_bl0

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Hexadecimal.internal_uint_dec_bl0.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Hexadecimal.internal_uint_dec_bl0.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Hexadecimal.uint),
  Rocq.Corelib.Init.Hexadecimal.uint_beq x y = Rocq.Corelib.Init.Datatypes.bool.true → x = y
```

Residual source symbols: Rocq.Corelib.Init.Hexadecimal.uint;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Hexadecimal.uint_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Hexadecimal.internal_uint_dec_lb0

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Hexadecimal.internal_uint_dec_lb0.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Hexadecimal.internal_uint_dec_lb0.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Hexadecimal.uint),
  x = y → Rocq.Corelib.Init.Hexadecimal.uint_beq x y = Rocq.Corelib.Init.Datatypes.bool.true
```

Residual source symbols: Rocq.Corelib.Init.Hexadecimal.uint;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Hexadecimal.uint_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Hexadecimal.nb_digits

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Hexadecimal.nb_digits

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Hexadecimal.nb_digits.roundtrip

## Corelib.Init.Hexadecimal.norm

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Hexadecimal.norm

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Hexadecimal.signed_int

## Corelib.Init.Hexadecimal.nzhead

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Hexadecimal.nzhead

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Hexadecimal.nzhead.roundtrip

## Corelib.Init.Hexadecimal.nztail

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Hexadecimal.nztail

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Hexadecimal.nztail.roundtrip

## Corelib.Init.Hexadecimal.nztail_int

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Hexadecimal.nztail_int

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Hexadecimal.signed_int

## Corelib.Init.Hexadecimal.opp

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Hexadecimal.opp

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Hexadecimal.signed_int

## Corelib.Init.Hexadecimal.rev

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Hexadecimal.rev

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Hexadecimal.rev.roundtrip

## Corelib.Init.Hexadecimal.revapp

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Hexadecimal.revapp

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Hexadecimal.revapp.roundtrip

## Corelib.Init.Hexadecimal.signed_int

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Hexadecimal.signed_int

## Corelib.Init.Hexadecimal.signed_int_beq

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Hexadecimal.signed_int_beq

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Hexadecimal.signed_int

## Corelib.Init.Hexadecimal.signed_int_eq_dec

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Hexadecimal.signed_int_eq_dec

## Corelib.Init.Hexadecimal.uint

Status: TYPE_ISO. Proven bidirectional inversion; specific parameters, Type/Sort range witness certificate type.

Original target: Rocq.Corelib.Init.Hexadecimal.uint

Operation/Type Certificate: NativeBridge.hexadecimalDigitsIso

## Corelib.Init.Hexadecimal.uint_beq

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Hexadecimal.uint_beq

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Hexadecimal.uint_beq.roundtrip

## Corelib.Init.Hexadecimal.uint_eq_dec

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Hexadecimal.uint_eq_dec

## Corelib.Init.Hexadecimal.uint_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Hexadecimal.uint_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Hexadecimal.uint_ind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Init.Hexadecimal.uint → Prop),
  P Rocq.Corelib.Init.Hexadecimal.uint.Nil →
    (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.D0) →
      (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.D1) →
        (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.D2) →
          (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.D3) →
            (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.D4) →
              (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.D5) →
                (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.D6) →
                  (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.D7) →
                    (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.D8) →
                      (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.D9) →
                        (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.Da) →
                          (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.Db) →
                            (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.Dc) →
                              (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.Dd) →
                                (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.De) →
                                  (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.Df) →
                                    ∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u
```

Residual source symbols: Rocq.Corelib.Init.Hexadecimal.uint;Rocq.Corelib.Init.Hexadecimal.uint.Nil;Rocq.Corelib.Init.Hexadecimal.uint.D0;Rocq.Corelib.Init.Hexadecimal.uint.D1;Rocq.Corelib.Init.Hexadecimal.uint.D2;Rocq.Corelib.Init.Hexadecimal.uint.D3;Rocq.Corelib.Init.Hexadecimal.uint.D4;Rocq.Corelib.Init.Hexadecimal.uint.D5;Rocq.Corelib.Init.Hexadecimal.uint.D6;Rocq.Corelib.Init.Hexadecimal.uint.D7;Rocq.Corelib.Init.Hexadecimal.uint.D8;Rocq.Corelib.Init.Hexadecimal.uint.D9;Rocq.Corelib.Init.Hexadecimal.uint.Da;Rocq.Corelib.Init.Hexadecimal.uint.Db;Rocq.Corelib.Init.Hexadecimal.uint.Dc;Rocq.Corelib.Init.Hexadecimal.uint.Dd;Rocq.Corelib.Init.Hexadecimal.uint.De;Rocq.Corelib.Init.Hexadecimal.uint.Df

## Corelib.Init.Hexadecimal.uint_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Hexadecimal.uint_rec

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Init.Hexadecimal.uint → Type) →
  P Rocq.Corelib.Init.Hexadecimal.uint.Nil →
    ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.D0) →
      ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.D1) →
        ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.D2) →
          ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.D3) →
            ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.D4) →
              ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.D5) →
                ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.D6) →
                  ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.D7) →
                    ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.D8) →
                      ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.D9) →
                        ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.Da) →
                          ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.Db) →
                            ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.Dc) →
                              ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.Dd) →
                                ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.De) →
                                  ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.Df) →
                                    (u : Rocq.Corelib.Init.Hexadecimal.uint) → P u

## Corelib.Init.Hexadecimal.uint_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Hexadecimal.uint_rect

Reason for interface not covered: No registered type bijection for (P : Rocq.Corelib.Init.Hexadecimal.uint → Type u_Corelib_Init_Hexadecimal_38) →
  P Rocq.Corelib.Init.Hexadecimal.uint.Nil →
    ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.D0) →
      ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.D1) →
        ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.D2) →
          ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.D3) →
            ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.D4) →
              ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.D5) →
                ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.D6) →
                  ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.D7) →
                    ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.D8) →
                      ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.D9) →
                        ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.Da) →
                          ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.Db) →
                            ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.Dc) →
                              ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.Dd) →
                                ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.De) →
                                  ((u : Rocq.Corelib.Init.Hexadecimal.uint) → P u → P u.Df) →
                                    (u : Rocq.Corelib.Init.Hexadecimal.uint) → P u

## Corelib.Init.Hexadecimal.uint_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Hexadecimal.uint_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Hexadecimal.uint_sind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Init.Hexadecimal.uint → Prop),
  P Rocq.Corelib.Init.Hexadecimal.uint.Nil →
    (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.D0) →
      (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.D1) →
        (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.D2) →
          (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.D3) →
            (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.D4) →
              (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.D5) →
                (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.D6) →
                  (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.D7) →
                    (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.D8) →
                      (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.D9) →
                        (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.Da) →
                          (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.Db) →
                            (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.Dc) →
                              (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.Dd) →
                                (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.De) →
                                  (∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u → P u.Df) →
                                    ∀ (u : Rocq.Corelib.Init.Hexadecimal.uint), P u
```

Residual source symbols: Rocq.Corelib.Init.Hexadecimal.uint;Rocq.Corelib.Init.Hexadecimal.uint.Nil;Rocq.Corelib.Init.Hexadecimal.uint.D0;Rocq.Corelib.Init.Hexadecimal.uint.D1;Rocq.Corelib.Init.Hexadecimal.uint.D2;Rocq.Corelib.Init.Hexadecimal.uint.D3;Rocq.Corelib.Init.Hexadecimal.uint.D4;Rocq.Corelib.Init.Hexadecimal.uint.D5;Rocq.Corelib.Init.Hexadecimal.uint.D6;Rocq.Corelib.Init.Hexadecimal.uint.D7;Rocq.Corelib.Init.Hexadecimal.uint.D8;Rocq.Corelib.Init.Hexadecimal.uint.D9;Rocq.Corelib.Init.Hexadecimal.uint.Da;Rocq.Corelib.Init.Hexadecimal.uint.Db;Rocq.Corelib.Init.Hexadecimal.uint.Dc;Rocq.Corelib.Init.Hexadecimal.uint.Dd;Rocq.Corelib.Init.Hexadecimal.uint.De;Rocq.Corelib.Init.Hexadecimal.uint.Df

## Corelib.Init.Hexadecimal.unorm

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Hexadecimal.unorm

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Hexadecimal.unorm.roundtrip
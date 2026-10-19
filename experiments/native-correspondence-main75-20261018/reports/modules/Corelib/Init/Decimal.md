# Corelib.Init.Decimal

每项对应机械翻译基线中的一个 root。完整 native statement / interface 类型在总 JSON 文件中。



## Corelib.Init.Decimal.Little.double

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Decimal.Little.double

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Decimal.Little.double.roundtrip

## Corelib.Init.Decimal.Little.succ

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Decimal.Little.succ

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Decimal.Little.succ.roundtrip

## Corelib.Init.Decimal.Little.succ_double

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Decimal.Little.succ_double

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Decimal.Little.succ_double.roundtrip

## Corelib.Init.Decimal.abs

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Decimal.abs

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Decimal.signed_int

## Corelib.Init.Decimal.app

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Decimal.app

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Decimal.app.roundtrip

## Corelib.Init.Decimal.app_int

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Decimal.app_int

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Decimal.signed_int

## Corelib.Init.Decimal.decimal

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Decimal.decimal

## Corelib.Init.Decimal.decimal_beq

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Decimal.decimal_beq

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Decimal.decimal

## Corelib.Init.Decimal.decimal_eq_dec

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Decimal.decimal_eq_dec

## Corelib.Init.Decimal.del_head

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Decimal.del_head

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Decimal.del_head.roundtrip

## Corelib.Init.Decimal.del_head_int

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Decimal.del_head_int

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Decimal.signed_int

## Corelib.Init.Decimal.del_tail

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Decimal.del_tail

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Decimal.del_tail.roundtrip

## Corelib.Init.Decimal.del_tail_int

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Decimal.del_tail_int

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Decimal.signed_int

## Corelib.Init.Decimal.int_of_int

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Decimal.int_of_int

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Decimal.signed_int

## Corelib.Init.Decimal.internal_decimal_dec_bl

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Decimal.internal_decimal_dec_bl.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Decimal.internal_decimal_dec_bl.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Decimal.decimal),
  Rocq.Corelib.Init.Decimal.decimal_beq x y = Rocq.Corelib.Init.Datatypes.bool.true → x = y
```

残留源符号：Rocq.Corelib.Init.Decimal.decimal;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Decimal.decimal_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Decimal.internal_decimal_dec_lb

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Decimal.internal_decimal_dec_lb.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Decimal.internal_decimal_dec_lb.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Decimal.decimal),
  x = y → Rocq.Corelib.Init.Decimal.decimal_beq x y = Rocq.Corelib.Init.Datatypes.bool.true
```

残留源符号：Rocq.Corelib.Init.Decimal.decimal;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Decimal.decimal_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Decimal.internal_signed_int_dec_bl

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Decimal.internal_signed_int_dec_bl.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Decimal.internal_signed_int_dec_bl.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Decimal.signed_int),
  Rocq.Corelib.Init.Decimal.signed_int_beq x y = Rocq.Corelib.Init.Datatypes.bool.true → x = y
```

残留源符号：Rocq.Corelib.Init.Decimal.signed_int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Decimal.signed_int_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Decimal.internal_signed_int_dec_lb

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Decimal.internal_signed_int_dec_lb.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Decimal.internal_signed_int_dec_lb.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Decimal.signed_int),
  x = y → Rocq.Corelib.Init.Decimal.signed_int_beq x y = Rocq.Corelib.Init.Datatypes.bool.true
```

残留源符号：Rocq.Corelib.Init.Decimal.signed_int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Decimal.signed_int_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Decimal.internal_uint_dec_bl

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Decimal.internal_uint_dec_bl.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Decimal.internal_uint_dec_bl.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Decimal.uint),
  Rocq.Corelib.Init.Decimal.uint_beq x y = Rocq.Corelib.Init.Datatypes.bool.true → x = y
```

残留源符号：Rocq.Corelib.Init.Decimal.uint;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Decimal.uint_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Decimal.internal_uint_dec_lb

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Decimal.internal_uint_dec_lb.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Decimal.internal_uint_dec_lb.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Decimal.uint),
  x = y → Rocq.Corelib.Init.Decimal.uint_beq x y = Rocq.Corelib.Init.Datatypes.bool.true
```

残留源符号：Rocq.Corelib.Init.Decimal.uint;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Decimal.uint_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Decimal.nb_digits

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Decimal.nb_digits

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Decimal.nb_digits.roundtrip

## Corelib.Init.Decimal.norm

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Decimal.norm

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Decimal.signed_int

## Corelib.Init.Decimal.nzhead

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Decimal.nzhead

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Decimal.nzhead.roundtrip

## Corelib.Init.Decimal.nztail

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Decimal.nztail

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Decimal.nztail.roundtrip

## Corelib.Init.Decimal.nztail_int

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Decimal.nztail_int

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Decimal.signed_int

## Corelib.Init.Decimal.opp

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Decimal.opp

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Decimal.signed_int

## Corelib.Init.Decimal.rev

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Decimal.rev

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Decimal.rev.roundtrip

## Corelib.Init.Decimal.revapp

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Decimal.revapp

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Decimal.revapp.roundtrip

## Corelib.Init.Decimal.signed_int

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Decimal.signed_int

## Corelib.Init.Decimal.signed_int_beq

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Decimal.signed_int_beq

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Decimal.signed_int

## Corelib.Init.Decimal.signed_int_eq_dec

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Decimal.signed_int_eq_dec

## Corelib.Init.Decimal.uint

状态：TYPE_ISO。已证明双向逆；具体参数、Type/Sort 范围见证书类型。

原始目标：Rocq.Corelib.Init.Decimal.uint

操作/类型证书：NativeBridge.decimalDigitsIso

## Corelib.Init.Decimal.uint_beq

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Decimal.uint_beq

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Decimal.uint_beq.roundtrip

## Corelib.Init.Decimal.uint_eq_dec

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Decimal.uint_eq_dec

## Corelib.Init.Decimal.uint_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Decimal.uint_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Decimal.uint_ind.statement.correspondence

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

残留源符号：Rocq.Corelib.Init.Decimal.uint;Rocq.Corelib.Init.Decimal.uint.Nil;Rocq.Corelib.Init.Decimal.uint.D0;Rocq.Corelib.Init.Decimal.uint.D1;Rocq.Corelib.Init.Decimal.uint.D2;Rocq.Corelib.Init.Decimal.uint.D3;Rocq.Corelib.Init.Decimal.uint.D4;Rocq.Corelib.Init.Decimal.uint.D5;Rocq.Corelib.Init.Decimal.uint.D6;Rocq.Corelib.Init.Decimal.uint.D7;Rocq.Corelib.Init.Decimal.uint.D8;Rocq.Corelib.Init.Decimal.uint.D9

## Corelib.Init.Decimal.uint_of_uint

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Decimal.uint_of_uint

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Decimal.uint_of_uint.roundtrip

## Corelib.Init.Decimal.uint_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Decimal.uint_rec

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Decimal.uint → Type) →
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

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Decimal.uint_rect

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Decimal.uint → Type u_Corelib_Init_Decimal_32) →
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

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Decimal.uint_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Decimal.uint_sind.statement.correspondence

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

残留源符号：Rocq.Corelib.Init.Decimal.uint;Rocq.Corelib.Init.Decimal.uint.Nil;Rocq.Corelib.Init.Decimal.uint.D0;Rocq.Corelib.Init.Decimal.uint.D1;Rocq.Corelib.Init.Decimal.uint.D2;Rocq.Corelib.Init.Decimal.uint.D3;Rocq.Corelib.Init.Decimal.uint.D4;Rocq.Corelib.Init.Decimal.uint.D5;Rocq.Corelib.Init.Decimal.uint.D6;Rocq.Corelib.Init.Decimal.uint.D7;Rocq.Corelib.Init.Decimal.uint.D8;Rocq.Corelib.Init.Decimal.uint.D9

## Corelib.Init.Decimal.unorm

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Decimal.unorm

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Decimal.unorm.roundtrip
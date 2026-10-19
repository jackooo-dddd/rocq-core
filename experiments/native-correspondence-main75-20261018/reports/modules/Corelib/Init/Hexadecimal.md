# Corelib.Init.Hexadecimal

每项对应机械翻译基线中的一个 root。完整 native statement / interface 类型在总 JSON 文件中。



## Corelib.Init.Hexadecimal.Little.double

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Hexadecimal.Little.double

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Hexadecimal.Little.double.roundtrip

## Corelib.Init.Hexadecimal.Little.succ

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Hexadecimal.Little.succ

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Hexadecimal.Little.succ.roundtrip

## Corelib.Init.Hexadecimal.Little.succ_double

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Hexadecimal.Little.succ_double

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Hexadecimal.Little.succ_double.roundtrip

## Corelib.Init.Hexadecimal.abs

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Hexadecimal.abs

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Hexadecimal.signed_int

## Corelib.Init.Hexadecimal.app

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Hexadecimal.app

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Hexadecimal.app.roundtrip

## Corelib.Init.Hexadecimal.app_int

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Hexadecimal.app_int

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Hexadecimal.signed_int

## Corelib.Init.Hexadecimal.del_head

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Hexadecimal.del_head

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Hexadecimal.del_head.roundtrip

## Corelib.Init.Hexadecimal.del_head_int

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Hexadecimal.del_head_int

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Hexadecimal.signed_int

## Corelib.Init.Hexadecimal.del_tail

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Hexadecimal.del_tail

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Hexadecimal.del_tail.roundtrip

## Corelib.Init.Hexadecimal.del_tail_int

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Hexadecimal.del_tail_int

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Hexadecimal.signed_int

## Corelib.Init.Hexadecimal.hexadecimal

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Hexadecimal.hexadecimal

## Corelib.Init.Hexadecimal.hexadecimal_beq

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Hexadecimal.hexadecimal_beq

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Hexadecimal.hexadecimal

## Corelib.Init.Hexadecimal.hexadecimal_eq_dec

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Hexadecimal.hexadecimal_eq_dec

## Corelib.Init.Hexadecimal.internal_hexadecimal_dec_bl

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Hexadecimal.internal_hexadecimal_dec_bl.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Hexadecimal.internal_hexadecimal_dec_bl.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Hexadecimal.hexadecimal),
  Rocq.Corelib.Init.Hexadecimal.hexadecimal_beq x y = Rocq.Corelib.Init.Datatypes.bool.true → x = y
```

残留源符号：Rocq.Corelib.Init.Hexadecimal.hexadecimal;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Hexadecimal.hexadecimal_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Hexadecimal.internal_hexadecimal_dec_lb

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Hexadecimal.internal_hexadecimal_dec_lb.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Hexadecimal.internal_hexadecimal_dec_lb.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Hexadecimal.hexadecimal),
  x = y → Rocq.Corelib.Init.Hexadecimal.hexadecimal_beq x y = Rocq.Corelib.Init.Datatypes.bool.true
```

残留源符号：Rocq.Corelib.Init.Hexadecimal.hexadecimal;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Hexadecimal.hexadecimal_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Hexadecimal.internal_signed_int_dec_bl0

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Hexadecimal.internal_signed_int_dec_bl0.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Hexadecimal.internal_signed_int_dec_bl0.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Hexadecimal.signed_int),
  Rocq.Corelib.Init.Hexadecimal.signed_int_beq x y = Rocq.Corelib.Init.Datatypes.bool.true → x = y
```

残留源符号：Rocq.Corelib.Init.Hexadecimal.signed_int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Hexadecimal.signed_int_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Hexadecimal.internal_signed_int_dec_lb0

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Hexadecimal.internal_signed_int_dec_lb0.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Hexadecimal.internal_signed_int_dec_lb0.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Hexadecimal.signed_int),
  x = y → Rocq.Corelib.Init.Hexadecimal.signed_int_beq x y = Rocq.Corelib.Init.Datatypes.bool.true
```

残留源符号：Rocq.Corelib.Init.Hexadecimal.signed_int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Hexadecimal.signed_int_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Hexadecimal.internal_uint_dec_bl0

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Hexadecimal.internal_uint_dec_bl0.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Hexadecimal.internal_uint_dec_bl0.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Hexadecimal.uint),
  Rocq.Corelib.Init.Hexadecimal.uint_beq x y = Rocq.Corelib.Init.Datatypes.bool.true → x = y
```

残留源符号：Rocq.Corelib.Init.Hexadecimal.uint;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Hexadecimal.uint_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Hexadecimal.internal_uint_dec_lb0

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Hexadecimal.internal_uint_dec_lb0.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Hexadecimal.internal_uint_dec_lb0.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Hexadecimal.uint),
  x = y → Rocq.Corelib.Init.Hexadecimal.uint_beq x y = Rocq.Corelib.Init.Datatypes.bool.true
```

残留源符号：Rocq.Corelib.Init.Hexadecimal.uint;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Hexadecimal.uint_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Hexadecimal.nb_digits

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Hexadecimal.nb_digits

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Hexadecimal.nb_digits.roundtrip

## Corelib.Init.Hexadecimal.norm

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Hexadecimal.norm

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Hexadecimal.signed_int

## Corelib.Init.Hexadecimal.nzhead

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Hexadecimal.nzhead

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Hexadecimal.nzhead.roundtrip

## Corelib.Init.Hexadecimal.nztail

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Hexadecimal.nztail

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Hexadecimal.nztail.roundtrip

## Corelib.Init.Hexadecimal.nztail_int

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Hexadecimal.nztail_int

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Hexadecimal.signed_int

## Corelib.Init.Hexadecimal.opp

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Hexadecimal.opp

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Hexadecimal.signed_int

## Corelib.Init.Hexadecimal.rev

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Hexadecimal.rev

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Hexadecimal.rev.roundtrip

## Corelib.Init.Hexadecimal.revapp

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Hexadecimal.revapp

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Hexadecimal.revapp.roundtrip

## Corelib.Init.Hexadecimal.signed_int

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Hexadecimal.signed_int

## Corelib.Init.Hexadecimal.signed_int_beq

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Hexadecimal.signed_int_beq

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Hexadecimal.signed_int

## Corelib.Init.Hexadecimal.signed_int_eq_dec

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Hexadecimal.signed_int_eq_dec

## Corelib.Init.Hexadecimal.uint

状态：TYPE_ISO。已证明双向逆；具体参数、Type/Sort 范围见证书类型。

原始目标：Rocq.Corelib.Init.Hexadecimal.uint

操作/类型证书：NativeBridge.hexadecimalDigitsIso

## Corelib.Init.Hexadecimal.uint_beq

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Hexadecimal.uint_beq

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Hexadecimal.uint_beq.roundtrip

## Corelib.Init.Hexadecimal.uint_eq_dec

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Hexadecimal.uint_eq_dec

## Corelib.Init.Hexadecimal.uint_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Hexadecimal.uint_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Hexadecimal.uint_ind.statement.correspondence

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

残留源符号：Rocq.Corelib.Init.Hexadecimal.uint;Rocq.Corelib.Init.Hexadecimal.uint.Nil;Rocq.Corelib.Init.Hexadecimal.uint.D0;Rocq.Corelib.Init.Hexadecimal.uint.D1;Rocq.Corelib.Init.Hexadecimal.uint.D2;Rocq.Corelib.Init.Hexadecimal.uint.D3;Rocq.Corelib.Init.Hexadecimal.uint.D4;Rocq.Corelib.Init.Hexadecimal.uint.D5;Rocq.Corelib.Init.Hexadecimal.uint.D6;Rocq.Corelib.Init.Hexadecimal.uint.D7;Rocq.Corelib.Init.Hexadecimal.uint.D8;Rocq.Corelib.Init.Hexadecimal.uint.D9;Rocq.Corelib.Init.Hexadecimal.uint.Da;Rocq.Corelib.Init.Hexadecimal.uint.Db;Rocq.Corelib.Init.Hexadecimal.uint.Dc;Rocq.Corelib.Init.Hexadecimal.uint.Dd;Rocq.Corelib.Init.Hexadecimal.uint.De;Rocq.Corelib.Init.Hexadecimal.uint.Df

## Corelib.Init.Hexadecimal.uint_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Hexadecimal.uint_rec

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Hexadecimal.uint → Type) →
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

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Hexadecimal.uint_rect

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Hexadecimal.uint → Type u_Corelib_Init_Hexadecimal_38) →
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

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Hexadecimal.uint_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Hexadecimal.uint_sind.statement.correspondence

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

残留源符号：Rocq.Corelib.Init.Hexadecimal.uint;Rocq.Corelib.Init.Hexadecimal.uint.Nil;Rocq.Corelib.Init.Hexadecimal.uint.D0;Rocq.Corelib.Init.Hexadecimal.uint.D1;Rocq.Corelib.Init.Hexadecimal.uint.D2;Rocq.Corelib.Init.Hexadecimal.uint.D3;Rocq.Corelib.Init.Hexadecimal.uint.D4;Rocq.Corelib.Init.Hexadecimal.uint.D5;Rocq.Corelib.Init.Hexadecimal.uint.D6;Rocq.Corelib.Init.Hexadecimal.uint.D7;Rocq.Corelib.Init.Hexadecimal.uint.D8;Rocq.Corelib.Init.Hexadecimal.uint.D9;Rocq.Corelib.Init.Hexadecimal.uint.Da;Rocq.Corelib.Init.Hexadecimal.uint.Db;Rocq.Corelib.Init.Hexadecimal.uint.Dc;Rocq.Corelib.Init.Hexadecimal.uint.Dd;Rocq.Corelib.Init.Hexadecimal.uint.De;Rocq.Corelib.Init.Hexadecimal.uint.Df

## Corelib.Init.Hexadecimal.unorm

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Hexadecimal.unorm

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Hexadecimal.unorm.roundtrip
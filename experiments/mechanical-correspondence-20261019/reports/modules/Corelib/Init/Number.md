# Corelib.Init.Number

每项对应机械翻译基线中的一个 root。完整 native statement / interface 类型在总 JSON 文件中。



## Corelib.Init.Number.int_of_int

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Number.int_of_int

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Number.signed_int

## Corelib.Init.Number.internal_number_dec_bl

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Number.internal_number_dec_bl.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Number.internal_number_dec_bl.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Number.number),
  Rocq.Corelib.Init.Number.number_beq x y = Rocq.Corelib.Init.Datatypes.bool.true → x = y
```

残留源符号：Rocq.Corelib.Init.Number.number;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Number.number_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Number.internal_number_dec_lb

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Number.internal_number_dec_lb.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Number.internal_number_dec_lb.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Number.number),
  x = y → Rocq.Corelib.Init.Number.number_beq x y = Rocq.Corelib.Init.Datatypes.bool.true
```

残留源符号：Rocq.Corelib.Init.Number.number;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Number.number_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Number.internal_signed_int_dec_bl1

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Number.internal_signed_int_dec_bl1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Number.internal_signed_int_dec_bl1.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Number.signed_int),
  Rocq.Corelib.Init.Number.signed_int_beq x y = Rocq.Corelib.Init.Datatypes.bool.true → x = y
```

残留源符号：Rocq.Corelib.Init.Number.signed_int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Number.signed_int_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Number.internal_signed_int_dec_lb1

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Number.internal_signed_int_dec_lb1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Number.internal_signed_int_dec_lb1.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Number.signed_int),
  x = y → Rocq.Corelib.Init.Number.signed_int_beq x y = Rocq.Corelib.Init.Datatypes.bool.true
```

残留源符号：Rocq.Corelib.Init.Number.signed_int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Number.signed_int_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Number.internal_uint_dec_bl1

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Number.internal_uint_dec_bl1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Number.internal_uint_dec_bl1.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Number.uint),
  Rocq.Corelib.Init.Number.uint_beq x y = Rocq.Corelib.Init.Datatypes.bool.true → x = y
```

残留源符号：Rocq.Corelib.Init.Number.uint;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Number.uint_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Number.internal_uint_dec_lb1

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Number.internal_uint_dec_lb1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Number.internal_uint_dec_lb1.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Init.Number.uint),
  x = y → Rocq.Corelib.Init.Number.uint_beq x y = Rocq.Corelib.Init.Datatypes.bool.true
```

残留源符号：Rocq.Corelib.Init.Number.uint;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Number.uint_beq;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Number.number

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Number.number

## Corelib.Init.Number.number_beq

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Number.number_beq

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Number.number

## Corelib.Init.Number.number_eq_dec

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Number.number_eq_dec

## Corelib.Init.Number.signed_int

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Number.signed_int

## Corelib.Init.Number.signed_int_beq

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Number.signed_int_beq

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Number.signed_int

## Corelib.Init.Number.signed_int_eq_dec

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Number.signed_int_eq_dec

## Corelib.Init.Number.uint

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Number.uint

## Corelib.Init.Number.uint_beq

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Number.uint_beq

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Number.uint

## Corelib.Init.Number.uint_eq_dec

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Number.uint_eq_dec

## Corelib.Init.Number.uint_of_uint

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Number.uint_of_uint

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Number.uint
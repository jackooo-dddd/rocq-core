# Corelib.Init.Datatypes

每项对应机械翻译基线中的一个 root。完整 native statement / interface 类型在总 JSON 文件中。



## Corelib.Init.Datatypes.BoolSpec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.BoolSpec

## Corelib.Init.Datatypes.BoolSpec_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.BoolSpec_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.BoolSpec_ind.statement.correspondence

```lean
∀ (P Q : Prop) (P0 : Rocq.Corelib.Init.Datatypes.bool → Prop),
  (P → P0 Rocq.Corelib.Init.Datatypes.bool.true) →
    (Q → P0 Rocq.Corelib.Init.Datatypes.bool.false) →
      ∀ (b : Rocq.Corelib.Init.Datatypes.bool), Rocq.Corelib.Init.Datatypes.BoolSpec P Q b → P0 b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.Init.Datatypes.BoolSpec

## Corelib.Init.Datatypes.BoolSpec_sind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.BoolSpec_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.BoolSpec_sind.statement.correspondence

```lean
∀ (P Q : Prop) (P0 : Rocq.Corelib.Init.Datatypes.bool → Prop),
  (P → P0 Rocq.Corelib.Init.Datatypes.bool.true) →
    (Q → P0 Rocq.Corelib.Init.Datatypes.bool.false) →
      ∀ (b : Rocq.Corelib.Init.Datatypes.bool), Rocq.Corelib.Init.Datatypes.BoolSpec P Q b → P0 b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.Init.Datatypes.BoolSpec

## Corelib.Init.Datatypes.CompOpp

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Datatypes.CompOpp

操作/类型证书：NativeBridge.compOpp_agrees

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.CompOpp.roundtrip

## Corelib.Init.Datatypes.CompOpp_iff

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.CompOpp_iff.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.CompOpp_iff.statement.correspondence

```lean
∀ (c c' : Rocq.Corelib.Init.Datatypes.comparison),
  Rocq.Corelib.Init.Datatypes.CompOpp c = c' ↔ c = Rocq.Corelib.Init.Datatypes.CompOpp c'
```

残留源符号：Rocq.Corelib.Init.Datatypes.comparison;Rocq.Corelib.Init.Datatypes.CompOpp

## Corelib.Init.Datatypes.CompOpp_inj

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.CompOpp_inj.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.CompOpp_inj.statement.correspondence

```lean
∀ (c c' : Rocq.Corelib.Init.Datatypes.comparison),
  Rocq.Corelib.Init.Datatypes.CompOpp c = Rocq.Corelib.Init.Datatypes.CompOpp c' → c = c'
```

残留源符号：Rocq.Corelib.Init.Datatypes.comparison;Rocq.Corelib.Init.Datatypes.CompOpp

## Corelib.Init.Datatypes.CompOpp_involutive

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.CompOpp_involutive.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.CompOpp_involutive.statement.correspondence

```lean
∀ (c : Rocq.Corelib.Init.Datatypes.comparison),
  Rocq.Corelib.Init.Datatypes.CompOpp (Rocq.Corelib.Init.Datatypes.CompOpp c) = c
```

残留源符号：Rocq.Corelib.Init.Datatypes.comparison;Rocq.Corelib.Init.Datatypes.CompOpp

## Corelib.Init.Datatypes.CompSpec

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Datatypes.CompSpec

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.CompSpec.roundtrip

## Corelib.Init.Datatypes.CompSpec2Type

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Datatypes.CompSpec2Type

## Corelib.Init.Datatypes.CompSpecT

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Datatypes.CompSpecT

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.CompSpecT.roundtrip

## Corelib.Init.Datatypes.CompareSpec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.CompareSpec

## Corelib.Init.Datatypes.CompareSpec2Type

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Datatypes.CompareSpec2Type

## Corelib.Init.Datatypes.CompareSpecT

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.CompareSpecT

## Corelib.Init.Datatypes.CompareSpecT_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.CompareSpecT_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.CompareSpecT_ind.statement.correspondence

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

残留源符号：Rocq.Corelib.Init.Datatypes.comparison;Rocq.Corelib.Init.Datatypes.CompareSpecT;Rocq.Corelib.Init.Datatypes.comparison.Eq;Rocq.Corelib.Init.Datatypes.CompareSpecT.CompEqT;Rocq.Corelib.Init.Datatypes.comparison.Lt;Rocq.Corelib.Init.Datatypes.CompareSpecT.CompLtT;Rocq.Corelib.Init.Datatypes.comparison.Gt;Rocq.Corelib.Init.Datatypes.CompareSpecT.CompGtT

## Corelib.Init.Datatypes.CompareSpecT_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.CompareSpecT_rec

接口未覆盖原因：No registered type bijection for (P :
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

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.CompareSpecT_rect

接口未覆盖原因：No registered type bijection for (P :
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

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.CompareSpecT_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.CompareSpecT_sind.statement.correspondence

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

残留源符号：Rocq.Corelib.Init.Datatypes.comparison;Rocq.Corelib.Init.Datatypes.CompareSpecT;Rocq.Corelib.Init.Datatypes.comparison.Eq;Rocq.Corelib.Init.Datatypes.CompareSpecT.CompEqT;Rocq.Corelib.Init.Datatypes.comparison.Lt;Rocq.Corelib.Init.Datatypes.CompareSpecT.CompLtT;Rocq.Corelib.Init.Datatypes.comparison.Gt;Rocq.Corelib.Init.Datatypes.CompareSpecT.CompGtT

## Corelib.Init.Datatypes.CompareSpec_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.CompareSpec_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.CompareSpec_ind.statement.correspondence

```lean
∀ (Peq Plt Pgt : Prop) (P : Rocq.Corelib.Init.Datatypes.comparison → Prop),
  (Peq → P Rocq.Corelib.Init.Datatypes.comparison.Eq) →
    (Plt → P Rocq.Corelib.Init.Datatypes.comparison.Lt) →
      (Pgt → P Rocq.Corelib.Init.Datatypes.comparison.Gt) →
        ∀ (c : Rocq.Corelib.Init.Datatypes.comparison), Rocq.Corelib.Init.Datatypes.CompareSpec Peq Plt Pgt c → P c
```

残留源符号：Rocq.Corelib.Init.Datatypes.comparison;Rocq.Corelib.Init.Datatypes.comparison.Eq;Rocq.Corelib.Init.Datatypes.comparison.Lt;Rocq.Corelib.Init.Datatypes.comparison.Gt;Rocq.Corelib.Init.Datatypes.CompareSpec

## Corelib.Init.Datatypes.CompareSpec_sind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.CompareSpec_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.CompareSpec_sind.statement.correspondence

```lean
∀ (Peq Plt Pgt : Prop) (P : Rocq.Corelib.Init.Datatypes.comparison → Prop),
  (Peq → P Rocq.Corelib.Init.Datatypes.comparison.Eq) →
    (Plt → P Rocq.Corelib.Init.Datatypes.comparison.Lt) →
      (Pgt → P Rocq.Corelib.Init.Datatypes.comparison.Gt) →
        ∀ (c : Rocq.Corelib.Init.Datatypes.comparison), Rocq.Corelib.Init.Datatypes.CompareSpec Peq Plt Pgt c → P c
```

残留源符号：Rocq.Corelib.Init.Datatypes.comparison;Rocq.Corelib.Init.Datatypes.comparison.Eq;Rocq.Corelib.Init.Datatypes.comparison.Lt;Rocq.Corelib.Init.Datatypes.comparison.Gt;Rocq.Corelib.Init.Datatypes.CompareSpec

## Corelib.Init.Datatypes.Empty_set

状态：TYPE_ISO。已证明双向逆；具体参数、Type/Sort 范围见证书类型。

原始目标：Rocq.Corelib.Init.Datatypes.Empty_set

操作/类型证书：NativeBridge.emptyIso

## Corelib.Init.Datatypes.Empty_set_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.Empty_set_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.Empty_set_ind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Init.Datatypes.Empty_set → Prop) (e : Rocq.Corelib.Init.Datatypes.Empty_set), P e
```

残留源符号：Rocq.Corelib.Init.Datatypes.Empty_set

## Corelib.Init.Datatypes.Empty_set_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.Empty_set_rec

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.Empty_set → Type) →
  (e : Rocq.Corelib.Init.Datatypes.Empty_set) → P e

## Corelib.Init.Datatypes.Empty_set_rect

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.Empty_set_rect

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.Empty_set → Type u_Corelib_Init_Datatypes_5) →
  (e : Rocq.Corelib.Init.Datatypes.Empty_set) → P e

## Corelib.Init.Datatypes.Empty_set_sind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.Empty_set_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.Empty_set_sind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Init.Datatypes.Empty_set → Prop) (e : Rocq.Corelib.Init.Datatypes.Empty_set), P e
```

残留源符号：Rocq.Corelib.Init.Datatypes.Empty_set

## Corelib.Init.Datatypes.ID

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Datatypes.ID

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.ID.roundtrip

## Corelib.Init.Datatypes.IDProp

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Datatypes.IDProp

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.IDProp.roundtrip

## Corelib.Init.Datatypes.andb

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Datatypes.andb

操作/类型证书：NativeBridge.andb_agrees

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.andb.roundtrip

## Corelib.Init.Datatypes.andb_prop

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.andb_prop.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.andb_prop.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.andb a b = Rocq.Corelib.Init.Datatypes.bool.true →
    a = Rocq.Corelib.Init.Datatypes.bool.true ∧ b = Rocq.Corelib.Init.Datatypes.bool.true
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.andb;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Datatypes.andb_true_intro

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.andb_true_intro.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.andb_true_intro.statement.correspondence

```lean
∀ (b1 b2 : Rocq.Corelib.Init.Datatypes.bool),
  b1 = Rocq.Corelib.Init.Datatypes.bool.true ∧ b2 = Rocq.Corelib.Init.Datatypes.bool.true →
    Rocq.Corelib.Init.Datatypes.andb b1 b2 = Rocq.Corelib.Init.Datatypes.bool.true
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.andb

## Corelib.Init.Datatypes.app

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Datatypes.app

操作/类型证书：NativeBridge.append_agrees

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.app.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.Init.Datatypes.bool

状态：TYPE_ISO。已证明双向逆；具体参数、Type/Sort 范围见证书类型。

原始目标：Rocq.Corelib.Init.Datatypes.bool

操作/类型证书：NativeBridge.boolIso

## Corelib.Init.Datatypes.bool_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.bool_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.bool_ind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Init.Datatypes.bool → Prop),
  P Rocq.Corelib.Init.Datatypes.bool.true →
    P Rocq.Corelib.Init.Datatypes.bool.false → ∀ (b : Rocq.Corelib.Init.Datatypes.bool), P b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.Init.Datatypes.bool_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.bool_rec

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.bool → Type) →
  P Rocq.Corelib.Init.Datatypes.bool.true →
    P Rocq.Corelib.Init.Datatypes.bool.false → (b : Rocq.Corelib.Init.Datatypes.bool) → P b

## Corelib.Init.Datatypes.bool_rect

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.bool_rect

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.bool → Type u_Corelib_Init_Datatypes_7) →
  P Rocq.Corelib.Init.Datatypes.bool.true →
    P Rocq.Corelib.Init.Datatypes.bool.false → (b : Rocq.Corelib.Init.Datatypes.bool) → P b

## Corelib.Init.Datatypes.bool_sind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.bool_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.bool_sind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Init.Datatypes.bool → Prop),
  P Rocq.Corelib.Init.Datatypes.bool.true →
    P Rocq.Corelib.Init.Datatypes.bool.false → ∀ (b : Rocq.Corelib.Init.Datatypes.bool), P b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.Init.Datatypes.comparison

状态：TYPE_ISO。已证明双向逆；具体参数、Type/Sort 范围见证书类型。

原始目标：Rocq.Corelib.Init.Datatypes.comparison

操作/类型证书：NativeBridge.comparisonIso

## Corelib.Init.Datatypes.comparison_eq_stable

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.comparison_eq_stable.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.comparison_eq_stable.statement.correspondence

```lean
∀ (c c' : Rocq.Corelib.Init.Datatypes.comparison), ¬¬c = c' → c = c'
```

残留源符号：Rocq.Corelib.Init.Datatypes.comparison

## Corelib.Init.Datatypes.comparison_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.comparison_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.comparison_ind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Init.Datatypes.comparison → Prop),
  P Rocq.Corelib.Init.Datatypes.comparison.Eq →
    P Rocq.Corelib.Init.Datatypes.comparison.Lt →
      P Rocq.Corelib.Init.Datatypes.comparison.Gt → ∀ (c : Rocq.Corelib.Init.Datatypes.comparison), P c
```

残留源符号：Rocq.Corelib.Init.Datatypes.comparison;Rocq.Corelib.Init.Datatypes.comparison.Eq;Rocq.Corelib.Init.Datatypes.comparison.Lt;Rocq.Corelib.Init.Datatypes.comparison.Gt

## Corelib.Init.Datatypes.comparison_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.comparison_rec

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.comparison → Type) →
  P Rocq.Corelib.Init.Datatypes.comparison.Eq →
    P Rocq.Corelib.Init.Datatypes.comparison.Lt →
      P Rocq.Corelib.Init.Datatypes.comparison.Gt → (c : Rocq.Corelib.Init.Datatypes.comparison) → P c

## Corelib.Init.Datatypes.comparison_rect

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.comparison_rect

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.comparison → Type u_Corelib_Init_Datatypes_210) →
  P Rocq.Corelib.Init.Datatypes.comparison.Eq →
    P Rocq.Corelib.Init.Datatypes.comparison.Lt →
      P Rocq.Corelib.Init.Datatypes.comparison.Gt → (c : Rocq.Corelib.Init.Datatypes.comparison) → P c

## Corelib.Init.Datatypes.comparison_sind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.comparison_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.comparison_sind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Init.Datatypes.comparison → Prop),
  P Rocq.Corelib.Init.Datatypes.comparison.Eq →
    P Rocq.Corelib.Init.Datatypes.comparison.Lt →
      P Rocq.Corelib.Init.Datatypes.comparison.Gt → ∀ (c : Rocq.Corelib.Init.Datatypes.comparison), P c
```

残留源符号：Rocq.Corelib.Init.Datatypes.comparison;Rocq.Corelib.Init.Datatypes.comparison.Eq;Rocq.Corelib.Init.Datatypes.comparison.Lt;Rocq.Corelib.Init.Datatypes.comparison.Gt

## Corelib.Init.Datatypes.curry

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Datatypes.curry

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.curry.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.Init.Datatypes.eq_true

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.eq_true

## Corelib.Init.Datatypes.eq_true_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.eq_true_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.eq_true_ind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Init.Datatypes.bool → Prop),
  P Rocq.Corelib.Init.Datatypes.bool.true →
    ∀ (b : Rocq.Corelib.Init.Datatypes.bool), Rocq.Corelib.Init.Datatypes.eq_true b → P b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.eq_true

## Corelib.Init.Datatypes.eq_true_ind_r

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.eq_true_ind_r.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.eq_true_ind_r.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Init.Datatypes.bool → Prop) (b : Rocq.Corelib.Init.Datatypes.bool),
  P b → Rocq.Corelib.Init.Datatypes.eq_true b → P Rocq.Corelib.Init.Datatypes.bool.true
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.eq_true;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Datatypes.eq_true_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.eq_true_rec

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.bool → Type) →
  P Rocq.Corelib.Init.Datatypes.bool.true →
    (b : Rocq.Corelib.Init.Datatypes.bool) → Rocq.Corelib.Init.Datatypes.eq_true b → P b

## Corelib.Init.Datatypes.eq_true_rec_r

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.eq_true_rec_r

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.bool → Type) →
  (b : Rocq.Corelib.Init.Datatypes.bool) →
    P b → Rocq.Corelib.Init.Datatypes.eq_true b → P Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Datatypes.eq_true_rect

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.eq_true_rect

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.bool → Type u_Corelib_Init_Datatypes_24) →
  P Rocq.Corelib.Init.Datatypes.bool.true →
    (b : Rocq.Corelib.Init.Datatypes.bool) → Rocq.Corelib.Init.Datatypes.eq_true b → P b

## Corelib.Init.Datatypes.eq_true_rect_r

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.eq_true_rect_r

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.bool → Type u_Corelib_Init_Datatypes_32) →
  (b : Rocq.Corelib.Init.Datatypes.bool) →
    P b → Rocq.Corelib.Init.Datatypes.eq_true b → P Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Datatypes.eq_true_rew

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.eq_true_rew

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.bool → Type u_Corelib_Init_Datatypes_25) →
  P Rocq.Corelib.Init.Datatypes.bool.true →
    (b : Rocq.Corelib.Init.Datatypes.bool) → Rocq.Corelib.Init.Datatypes.eq_true b → P b

## Corelib.Init.Datatypes.eq_true_rew_dep

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.eq_true_rew_dep

接口未覆盖原因：No registered type bijection for (P :
    (b : Rocq.Corelib.Init.Datatypes.bool) → Rocq.Corelib.Init.Datatypes.eq_true b → Type u_Corelib_Init_Datatypes_26) →
  P Rocq.Corelib.Init.Datatypes.bool.true Rocq.Corelib.Init.Datatypes.eq_true.is_eq_true →
    (b : Rocq.Corelib.Init.Datatypes.bool) → (e : Rocq.Corelib.Init.Datatypes.eq_true b) → P b e

## Corelib.Init.Datatypes.eq_true_rew_fwd_dep

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.eq_true_rew_fwd_dep

接口未覆盖原因：No registered type bijection for (b : Rocq.Corelib.Init.Datatypes.bool) →
  (H : Rocq.Corelib.Init.Datatypes.eq_true b) →
    (P :
        (b : Rocq.Corelib.Init.Datatypes.bool) →
          Rocq.Corelib.Init.Datatypes.eq_true b → Type u_Corelib_Init_Datatypes_27) →
      P b H → P Rocq.Corelib.Init.Datatypes.bool.true Rocq.Corelib.Init.Datatypes.eq_true.is_eq_true

## Corelib.Init.Datatypes.eq_true_rew_r

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.eq_true_rew_r

接口未覆盖原因：No registered type bijection for (b : Rocq.Corelib.Init.Datatypes.bool) →
  (P : Rocq.Corelib.Init.Datatypes.bool → Type u_Corelib_Init_Datatypes_28) →
    P b → Rocq.Corelib.Init.Datatypes.eq_true b → P Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Init.Datatypes.eq_true_sind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.eq_true_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.eq_true_sind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Init.Datatypes.bool → Prop),
  P Rocq.Corelib.Init.Datatypes.bool.true →
    ∀ (b : Rocq.Corelib.Init.Datatypes.bool), Rocq.Corelib.Init.Datatypes.eq_true b → P b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.eq_true

## Corelib.Init.Datatypes.fst

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Datatypes.fst

操作/类型证书：NativeBridge.fst_agrees

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.fst.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.Init.Datatypes.id

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Datatypes.id

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.id.roundtrip

## Corelib.Init.Datatypes.idProp

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.idProp.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.idProp.statement.correspondence

```lean
Rocq.Corelib.Init.Datatypes.IDProp
```

残留源符号：Rocq.Corelib.Init.Datatypes.IDProp

## Corelib.Init.Datatypes.implb

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Datatypes.implb

操作/类型证书：NativeBridge.implb_agrees

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.implb.roundtrip

## Corelib.Init.Datatypes.injective_projections

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.injective_projections.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.injective_projections.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Datatypes_116) (B : Sort u_Corelib_Init_Datatypes_117)
  (p1 p2 : Rocq.Corelib.Init.Datatypes.prod A B),
  Rocq.Corelib.Init.Datatypes.fst A B p1 = Rocq.Corelib.Init.Datatypes.fst A B p2 →
    Rocq.Corelib.Init.Datatypes.snd A B p1 = Rocq.Corelib.Init.Datatypes.snd A B p2 → p1 = p2
```

残留源符号：Rocq.Corelib.Init.Datatypes.prod;Rocq.Corelib.Init.Datatypes.fst;Rocq.Corelib.Init.Datatypes.snd

## Corelib.Init.Datatypes.is_true

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Datatypes.is_true

操作/类型证书：NativeBridge.is_true_agrees

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.is_true.roundtrip

## Corelib.Init.Datatypes.length

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Datatypes.length

操作/类型证书：NativeBridge.length_agrees

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.length.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.Init.Datatypes.list

状态：TYPE_ISO。已证明双向逆；具体参数、Type/Sort 范围见证书类型。

原始目标：Rocq.Corelib.Init.Datatypes.list

操作/类型证书：NativeBridge.listIso

## Corelib.Init.Datatypes.list_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.list_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.list_ind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Datatypes_194) (P : Rocq.Corelib.Init.Datatypes.list A → Prop),
  P (Rocq.Corelib.Init.Datatypes.list.nil A) →
    (∀ (a : A) (l : Rocq.Corelib.Init.Datatypes.list A), P l → P (Rocq.Corelib.Init.Datatypes.list.cons A a l)) →
      ∀ (l : Rocq.Corelib.Init.Datatypes.list A), P l
```

残留源符号：Rocq.Corelib.Init.Datatypes.list;Rocq.Corelib.Init.Datatypes.list.nil;Rocq.Corelib.Init.Datatypes.list.cons

## Corelib.Init.Datatypes.list_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.list_rec

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.list A → Type) →
  P (Rocq.Corelib.Init.Datatypes.list.nil A) →
    ((a : A) → (l : Rocq.Corelib.Init.Datatypes.list A) → P l → P (Rocq.Corelib.Init.Datatypes.list.cons A a l)) →
      (l : Rocq.Corelib.Init.Datatypes.list A) → P l

## Corelib.Init.Datatypes.list_rect

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.list_rect

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.list A → Type u_Corelib_Init_Datatypes_192) →
  P (Rocq.Corelib.Init.Datatypes.list.nil A) →
    ((a : A) → (l : Rocq.Corelib.Init.Datatypes.list A) → P l → P (Rocq.Corelib.Init.Datatypes.list.cons A a l)) →
      (l : Rocq.Corelib.Init.Datatypes.list A) → P l

## Corelib.Init.Datatypes.list_sind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.list_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.list_sind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Datatypes_196) (P : Rocq.Corelib.Init.Datatypes.list A → Prop),
  P (Rocq.Corelib.Init.Datatypes.list.nil A) →
    (∀ (a : A) (l : Rocq.Corelib.Init.Datatypes.list A), P l → P (Rocq.Corelib.Init.Datatypes.list.cons A a l)) →
      ∀ (l : Rocq.Corelib.Init.Datatypes.list A), P l
```

残留源符号：Rocq.Corelib.Init.Datatypes.list;Rocq.Corelib.Init.Datatypes.list.nil;Rocq.Corelib.Init.Datatypes.list.cons

## Corelib.Init.Datatypes.nat

状态：TYPE_ISO。已证明双向逆；具体参数、Type/Sort 范围见证书类型。

原始目标：Rocq.Corelib.Init.Datatypes.nat

操作/类型证书：NativeBridge.natIso

## Corelib.Init.Datatypes.nat_ind

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Datatypes.nat_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.nat_ind.statement.correspondence

```lean
∀ (f : Nat → Prop), f 0 → (∀ (n : Nat), f n → f n.succ) → ∀ (n : Nat), f n
```

## Corelib.Init.Datatypes.nat_rec

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Datatypes.nat_rec

操作/类型证书：NativeBridge.source_nat_rec_agrees

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.nat → Type) →
  P Rocq.Corelib.Init.Datatypes.nat.O →
    ((n : Rocq.Corelib.Init.Datatypes.nat) → P n → P n.S) → (n : Rocq.Corelib.Init.Datatypes.nat) → P n

## Corelib.Init.Datatypes.nat_rect

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Datatypes.nat_rect

操作/类型证书：NativeBridge.source_nat_rect_agrees

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.nat → Type u_Corelib_Init_Datatypes_33) →
  P Rocq.Corelib.Init.Datatypes.nat.O →
    ((n : Rocq.Corelib.Init.Datatypes.nat) → P n → P n.S) → (n : Rocq.Corelib.Init.Datatypes.nat) → P n

## Corelib.Init.Datatypes.nat_sind

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Datatypes.nat_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.nat_sind.statement.correspondence

```lean
∀ (f : Nat → Prop), f 0 → (∀ (n : Nat), f n → f n.succ) → ∀ (n : Nat), f n
```

## Corelib.Init.Datatypes.negb

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Datatypes.negb

操作/类型证书：NativeBridge.negb_agrees

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.negb.roundtrip

## Corelib.Init.Datatypes.option

状态：TYPE_ISO。已证明双向逆；具体参数、Type/Sort 范围见证书类型。

原始目标：Rocq.Corelib.Init.Datatypes.option

操作/类型证书：NativeBridge.optionIso

## Corelib.Init.Datatypes.option_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.option_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.option_ind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Datatypes_38) (P : Rocq.Corelib.Init.Datatypes.option A → Prop),
  (∀ (a : A), P (Rocq.Corelib.Init.Datatypes.option.Some A a)) →
    P (Rocq.Corelib.Init.Datatypes.option.None A) → ∀ (o : Rocq.Corelib.Init.Datatypes.option A), P o
```

残留源符号：Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.Init.Datatypes.option.Some;Rocq.Corelib.Init.Datatypes.option.None

## Corelib.Init.Datatypes.option_map

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Datatypes.option_map

操作/类型证书：NativeBridge.option_map_agrees

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.option_map.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.Init.Datatypes.option_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.option_rec

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.option A → Type) →
  ((a : A) → P (Rocq.Corelib.Init.Datatypes.option.Some A a)) →
    P (Rocq.Corelib.Init.Datatypes.option.None A) → (o : Rocq.Corelib.Init.Datatypes.option A) → P o

## Corelib.Init.Datatypes.option_rect

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.option_rect

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.option A → Type u_Corelib_Init_Datatypes_36) →
  ((a : A) → P (Rocq.Corelib.Init.Datatypes.option.Some A a)) →
    P (Rocq.Corelib.Init.Datatypes.option.None A) → (o : Rocq.Corelib.Init.Datatypes.option A) → P o

## Corelib.Init.Datatypes.option_sind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.option_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.option_sind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Datatypes_40) (P : Rocq.Corelib.Init.Datatypes.option A → Prop),
  (∀ (a : A), P (Rocq.Corelib.Init.Datatypes.option.Some A a)) →
    P (Rocq.Corelib.Init.Datatypes.option.None A) → ∀ (o : Rocq.Corelib.Init.Datatypes.option A), P o
```

残留源符号：Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.Init.Datatypes.option.Some;Rocq.Corelib.Init.Datatypes.option.None

## Corelib.Init.Datatypes.orb

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Datatypes.orb

操作/类型证书：NativeBridge.orb_agrees

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.orb.roundtrip

## Corelib.Init.Datatypes.pair_equal_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.pair_equal_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.pair_equal_spec.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Datatypes_126) (B : Sort u_Corelib_Init_Datatypes_127) (a1 a2 : A) (b1 b2 : B),
  Rocq.Corelib.Init.Datatypes.prod.pair A B a1 b1 = Rocq.Corelib.Init.Datatypes.prod.pair A B a2 b2 ↔ a1 = a2 ∧ b1 = b2
```

残留源符号：Rocq.Corelib.Init.Datatypes.prod;Rocq.Corelib.Init.Datatypes.prod.pair

## Corelib.Init.Datatypes.prod

状态：TYPE_ISO。已证明双向逆；具体参数、Type/Sort 范围见证书类型。

原始目标：Rocq.Corelib.Init.Datatypes.prod

操作/类型证书：NativeBridge.prodIso

## Corelib.Init.Datatypes.prod_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.prod_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.prod_ind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Datatypes_80) (B : Sort u_Corelib_Init_Datatypes_81)
  (P : Rocq.Corelib.Init.Datatypes.prod A B → Prop),
  (∀ (a : A) (b : B), P (Rocq.Corelib.Init.Datatypes.prod.pair A B a b)) →
    ∀ (p : Rocq.Corelib.Init.Datatypes.prod A B), P p
```

残留源符号：Rocq.Corelib.Init.Datatypes.prod;Rocq.Corelib.Init.Datatypes.prod.pair

## Corelib.Init.Datatypes.prod_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.prod_rec

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.prod A B → Type) →
  ((a : A) → (b : B) → P (Rocq.Corelib.Init.Datatypes.prod.pair A B a b)) →
    (p : Rocq.Corelib.Init.Datatypes.prod A B) → P p

## Corelib.Init.Datatypes.prod_rect

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.prod_rect

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.prod A B → Type u_Corelib_Init_Datatypes_77) →
  ((a : A) → (b : B) → P (Rocq.Corelib.Init.Datatypes.prod.pair A B a b)) →
    (p : Rocq.Corelib.Init.Datatypes.prod A B) → P p

## Corelib.Init.Datatypes.prod_sind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.prod_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.prod_sind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Datatypes_84) (B : Sort u_Corelib_Init_Datatypes_85)
  (P : Rocq.Corelib.Init.Datatypes.prod A B → Prop),
  (∀ (a : A) (b : B), P (Rocq.Corelib.Init.Datatypes.prod.pair A B a b)) →
    ∀ (p : Rocq.Corelib.Init.Datatypes.prod A B), P p
```

残留源符号：Rocq.Corelib.Init.Datatypes.prod;Rocq.Corelib.Init.Datatypes.prod.pair

## Corelib.Init.Datatypes.reflect

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.reflect

## Corelib.Init.Datatypes.reflect_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.reflect_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.reflect_ind.statement.correspondence

```lean
∀ (P : Prop) (P0 : (b : Rocq.Corelib.Init.Datatypes.bool) → Rocq.Corelib.Init.Datatypes.reflect P b → Prop),
  (∀ (p : P), P0 Rocq.Corelib.Init.Datatypes.bool.true (Rocq.Corelib.Init.Datatypes.reflect.ReflectT P p)) →
    (∀ (n : ¬P), P0 Rocq.Corelib.Init.Datatypes.bool.false (Rocq.Corelib.Init.Datatypes.reflect.ReflectF P ⋯)) →
      ∀ (b : Rocq.Corelib.Init.Datatypes.bool) (r : Rocq.Corelib.Init.Datatypes.reflect P b), P0 b r
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.reflect.ReflectT;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.Init.Datatypes.reflect.ReflectF;Rocq.Corelib.Init.Logic.not

## Corelib.Init.Datatypes.reflect_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.reflect_rec

接口未覆盖原因：No registered type bijection for (P0 :
    (b : Rocq.Corelib.Init.Datatypes.bool) → Rocq.Corelib.Init.Datatypes.reflect P b → Type) →
  ((p : P) → P0 Rocq.Corelib.Init.Datatypes.bool.true (Rocq.Corelib.Init.Datatypes.reflect.ReflectT P p)) →
    ((n : Rocq.Corelib.Init.Logic.not P) →
        P0 Rocq.Corelib.Init.Datatypes.bool.false (Rocq.Corelib.Init.Datatypes.reflect.ReflectF P n)) →
      (b : Rocq.Corelib.Init.Datatypes.bool) → (r : Rocq.Corelib.Init.Datatypes.reflect P b) → P0 b r

## Corelib.Init.Datatypes.reflect_rect

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.reflect_rect

接口未覆盖原因：No registered type bijection for (P0 :
    (b : Rocq.Corelib.Init.Datatypes.bool) →
      Rocq.Corelib.Init.Datatypes.reflect P b → Type u_Corelib_Init_Datatypes_8) →
  ((p : P) → P0 Rocq.Corelib.Init.Datatypes.bool.true (Rocq.Corelib.Init.Datatypes.reflect.ReflectT P p)) →
    ((n : Rocq.Corelib.Init.Logic.not P) →
        P0 Rocq.Corelib.Init.Datatypes.bool.false (Rocq.Corelib.Init.Datatypes.reflect.ReflectF P n)) →
      (b : Rocq.Corelib.Init.Datatypes.bool) → (r : Rocq.Corelib.Init.Datatypes.reflect P b) → P0 b r

## Corelib.Init.Datatypes.reflect_sind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.reflect_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.reflect_sind.statement.correspondence

```lean
∀ (P : Prop) (P0 : (b : Rocq.Corelib.Init.Datatypes.bool) → Rocq.Corelib.Init.Datatypes.reflect P b → Prop),
  (∀ (p : P), P0 Rocq.Corelib.Init.Datatypes.bool.true (Rocq.Corelib.Init.Datatypes.reflect.ReflectT P p)) →
    (∀ (n : ¬P), P0 Rocq.Corelib.Init.Datatypes.bool.false (Rocq.Corelib.Init.Datatypes.reflect.ReflectF P ⋯)) →
      ∀ (b : Rocq.Corelib.Init.Datatypes.bool) (r : Rocq.Corelib.Init.Datatypes.reflect P b), P0 b r
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.reflect.ReflectT;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.Init.Datatypes.reflect.ReflectF;Rocq.Corelib.Init.Logic.not

## Corelib.Init.Datatypes.result

状态：TYPE_ISO。已证明双向逆；具体参数、Type/Sort 范围见证书类型。

原始目标：Rocq.Corelib.Init.Datatypes.result

操作/类型证书：NativeBridge.resultIso

## Corelib.Init.Datatypes.result_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.result_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.result_ind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Datatypes_68) (E : Sort u_Corelib_Init_Datatypes_69)
  (P : Rocq.Corelib.Init.Datatypes.result A E → Prop),
  (∀ (a : A), P (Rocq.Corelib.Init.Datatypes.result.Ok A E a)) →
    (∀ (e : E), P (Rocq.Corelib.Init.Datatypes.result.Error A E e)) →
      ∀ (r : Rocq.Corelib.Init.Datatypes.result A E), P r
```

残留源符号：Rocq.Corelib.Init.Datatypes.result;Rocq.Corelib.Init.Datatypes.result.Ok;Rocq.Corelib.Init.Datatypes.result.Error

## Corelib.Init.Datatypes.result_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.result_rec

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.result A E → Type) →
  ((a : A) → P (Rocq.Corelib.Init.Datatypes.result.Ok A E a)) →
    ((e : E) → P (Rocq.Corelib.Init.Datatypes.result.Error A E e)) → (r : Rocq.Corelib.Init.Datatypes.result A E) → P r

## Corelib.Init.Datatypes.result_rect

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.result_rect

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.result A E → Type u_Corelib_Init_Datatypes_65) →
  ((a : A) → P (Rocq.Corelib.Init.Datatypes.result.Ok A E a)) →
    ((e : E) → P (Rocq.Corelib.Init.Datatypes.result.Error A E e)) → (r : Rocq.Corelib.Init.Datatypes.result A E) → P r

## Corelib.Init.Datatypes.result_sind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.result_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.result_sind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Datatypes_72) (E : Sort u_Corelib_Init_Datatypes_73)
  (P : Rocq.Corelib.Init.Datatypes.result A E → Prop),
  (∀ (a : A), P (Rocq.Corelib.Init.Datatypes.result.Ok A E a)) →
    (∀ (e : E), P (Rocq.Corelib.Init.Datatypes.result.Error A E e)) →
      ∀ (r : Rocq.Corelib.Init.Datatypes.result A E), P r
```

残留源符号：Rocq.Corelib.Init.Datatypes.result;Rocq.Corelib.Init.Datatypes.result.Ok;Rocq.Corelib.Init.Datatypes.result.Error

## Corelib.Init.Datatypes.rew_pair

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.rew_pair.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.rew_pair.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Datatypes_174) (P : A → Sort u_Corelib_Init_Datatypes_175)
  (Q : A → Sort u_Corelib_Init_Datatypes_176) (x1 x2 : A) (y1 : P x1) (y2 : Q x1) (H : x1 = x2),
  Rocq.Corelib.Init.Datatypes.prod.pair (P x2) (Q x2) (Rocq.Corelib.Init.Logic.eq_rect A x1 P y1 x2 ⋯)
      (Rocq.Corelib.Init.Logic.eq_rect A x1 Q y2 x2 ⋯) =
    Rocq.Corelib.Init.Logic.eq_rect A x1 (fun x => Rocq.Corelib.Init.Datatypes.prod (P x) (Q x))
      (Rocq.Corelib.Init.Datatypes.prod.pair (P x1) (Q x1) y1 y2) x2 ⋯
```

残留源符号：Rocq.Corelib.Init.Datatypes.prod;Rocq.Corelib.Init.Datatypes.prod.pair;Rocq.Corelib.Init.Logic.eq_rect;Rocq.Corelib.Init.Logic.eq

## Corelib.Init.Datatypes.snd

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Datatypes.snd

操作/类型证书：NativeBridge.snd_agrees

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.snd.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.Init.Datatypes.sum

状态：TYPE_ISO。已证明双向逆；具体参数、Type/Sort 范围见证书类型。

原始目标：Rocq.Corelib.Init.Datatypes.sum

操作/类型证书：NativeBridge.sumIso

## Corelib.Init.Datatypes.sum_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.sum_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.sum_ind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Datatypes_54) (B : Sort u_Corelib_Init_Datatypes_55)
  (P : Rocq.Corelib.Init.Datatypes.sum A B → Prop),
  (∀ (a : A), P (Rocq.Corelib.Init.Datatypes.sum.inl A B a)) →
    (∀ (b : B), P (Rocq.Corelib.Init.Datatypes.sum.inr A B b)) → ∀ (s : Rocq.Corelib.Init.Datatypes.sum A B), P s
```

残留源符号：Rocq.Corelib.Init.Datatypes.sum;Rocq.Corelib.Init.Datatypes.sum.inl;Rocq.Corelib.Init.Datatypes.sum.inr

## Corelib.Init.Datatypes.sum_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.sum_rec

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.sum A B → Type) →
  ((a : A) → P (Rocq.Corelib.Init.Datatypes.sum.inl A B a)) →
    ((b : B) → P (Rocq.Corelib.Init.Datatypes.sum.inr A B b)) → (s : Rocq.Corelib.Init.Datatypes.sum A B) → P s

## Corelib.Init.Datatypes.sum_rect

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.sum_rect

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.sum A B → Type u_Corelib_Init_Datatypes_51) →
  ((a : A) → P (Rocq.Corelib.Init.Datatypes.sum.inl A B a)) →
    ((b : B) → P (Rocq.Corelib.Init.Datatypes.sum.inr A B b)) → (s : Rocq.Corelib.Init.Datatypes.sum A B) → P s

## Corelib.Init.Datatypes.sum_sind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.sum_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.sum_sind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Datatypes_58) (B : Sort u_Corelib_Init_Datatypes_59)
  (P : Rocq.Corelib.Init.Datatypes.sum A B → Prop),
  (∀ (a : A), P (Rocq.Corelib.Init.Datatypes.sum.inl A B a)) →
    (∀ (b : B), P (Rocq.Corelib.Init.Datatypes.sum.inr A B b)) → ∀ (s : Rocq.Corelib.Init.Datatypes.sum A B), P s
```

残留源符号：Rocq.Corelib.Init.Datatypes.sum;Rocq.Corelib.Init.Datatypes.sum.inl;Rocq.Corelib.Init.Datatypes.sum.inr

## Corelib.Init.Datatypes.surjective_pairing

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.surjective_pairing.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.surjective_pairing.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Datatypes_108) (B : Sort u_Corelib_Init_Datatypes_109)
  (p : Rocq.Corelib.Init.Datatypes.prod A B),
  p =
    Rocq.Corelib.Init.Datatypes.prod.pair A B (Rocq.Corelib.Init.Datatypes.fst A B p)
      (Rocq.Corelib.Init.Datatypes.snd A B p)
```

残留源符号：Rocq.Corelib.Init.Datatypes.prod;Rocq.Corelib.Init.Datatypes.prod.pair;Rocq.Corelib.Init.Datatypes.fst;Rocq.Corelib.Init.Datatypes.snd

## Corelib.Init.Datatypes.uncurry

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Datatypes.uncurry

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.uncurry.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.Init.Datatypes.unit

状态：TYPE_ISO。已证明双向逆；具体参数、Type/Sort 范围见证书类型。

原始目标：Rocq.Corelib.Init.Datatypes.unit

操作/类型证书：NativeBridge.unitIso

## Corelib.Init.Datatypes.unit_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.unit_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.unit_ind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Init.Datatypes.unit → Prop),
  P Rocq.Corelib.Init.Datatypes.unit.tt → ∀ (u : Rocq.Corelib.Init.Datatypes.unit), P u
```

残留源符号：Rocq.Corelib.Init.Datatypes.unit;Rocq.Corelib.Init.Datatypes.unit.tt

## Corelib.Init.Datatypes.unit_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.unit_rec

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.unit → Type) →
  P Rocq.Corelib.Init.Datatypes.unit.tt → (u : Rocq.Corelib.Init.Datatypes.unit) → P u

## Corelib.Init.Datatypes.unit_rect

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Datatypes.unit_rect

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Datatypes.unit → Type u_Corelib_Init_Datatypes_6) →
  P Rocq.Corelib.Init.Datatypes.unit.tt → (u : Rocq.Corelib.Init.Datatypes.unit) → P u

## Corelib.Init.Datatypes.unit_sind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Datatypes.unit_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Datatypes.unit_sind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Init.Datatypes.unit → Prop),
  P Rocq.Corelib.Init.Datatypes.unit.tt → ∀ (u : Rocq.Corelib.Init.Datatypes.unit), P u
```

残留源符号：Rocq.Corelib.Init.Datatypes.unit;Rocq.Corelib.Init.Datatypes.unit.tt

## Corelib.Init.Datatypes.xorb

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Datatypes.xorb

操作/类型证书：NativeBridge.xorb_agrees

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Datatypes.xorb.roundtrip
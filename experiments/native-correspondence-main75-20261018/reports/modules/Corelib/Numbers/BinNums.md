# Corelib.Numbers.BinNums

每项对应机械翻译基线中的一个 root。完整 native statement / interface 类型在总 JSON 文件中。



## Corelib.Numbers.BinNums.N

状态：TYPE_ISO。已证明双向逆；具体参数、Type/Sort 范围见证书类型。

原始目标：Rocq.Corelib.Numbers.BinNums.N

操作/类型证书：NativeBridge.binaryNatIso

## Corelib.Numbers.BinNums.N_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.BinNums.N_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.BinNums.N_ind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Numbers.BinNums.N → Prop),
  P Rocq.Corelib.Numbers.BinNums.N.N0 →
    (∀ (p : Rocq.Corelib.Numbers.BinNums.positive), P (Rocq.Corelib.Numbers.BinNums.N.Npos p)) →
      ∀ (n : Rocq.Corelib.Numbers.BinNums.N), P n
```

残留源符号：Rocq.Corelib.Numbers.BinNums.N;Rocq.Corelib.Numbers.BinNums.N.N0;Rocq.Corelib.Numbers.BinNums.positive;Rocq.Corelib.Numbers.BinNums.N.Npos

## Corelib.Numbers.BinNums.N_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Numbers.BinNums.N_rec

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Numbers.BinNums.N → Type) →
  P Rocq.Corelib.Numbers.BinNums.N.N0 →
    ((p : Rocq.Corelib.Numbers.BinNums.positive) → P (Rocq.Corelib.Numbers.BinNums.N.Npos p)) →
      (n : Rocq.Corelib.Numbers.BinNums.N) → P n

## Corelib.Numbers.BinNums.N_rect

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Numbers.BinNums.N_rect

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Numbers.BinNums.N → Type u_Corelib_Numbers_BinNums_22) →
  P Rocq.Corelib.Numbers.BinNums.N.N0 →
    ((p : Rocq.Corelib.Numbers.BinNums.positive) → P (Rocq.Corelib.Numbers.BinNums.N.Npos p)) →
      (n : Rocq.Corelib.Numbers.BinNums.N) → P n

## Corelib.Numbers.BinNums.N_sind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.BinNums.N_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.BinNums.N_sind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Numbers.BinNums.N → Prop),
  P Rocq.Corelib.Numbers.BinNums.N.N0 →
    (∀ (p : Rocq.Corelib.Numbers.BinNums.positive), P (Rocq.Corelib.Numbers.BinNums.N.Npos p)) →
      ∀ (n : Rocq.Corelib.Numbers.BinNums.N), P n
```

残留源符号：Rocq.Corelib.Numbers.BinNums.N;Rocq.Corelib.Numbers.BinNums.N.N0;Rocq.Corelib.Numbers.BinNums.positive;Rocq.Corelib.Numbers.BinNums.N.Npos

## Corelib.Numbers.BinNums.Z

状态：TYPE_ISO。已证明双向逆；具体参数、Type/Sort 范围见证书类型。

原始目标：Rocq.Corelib.Numbers.BinNums.Z

操作/类型证书：NativeBridge.binaryIntIso

## Corelib.Numbers.BinNums.Z_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.BinNums.Z_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.BinNums.Z_ind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Numbers.BinNums.Z → Prop),
  P Rocq.Corelib.Numbers.BinNums.Z.Z0 →
    (∀ (p : Rocq.Corelib.Numbers.BinNums.positive), P (Rocq.Corelib.Numbers.BinNums.Z.Zpos p)) →
      (∀ (p : Rocq.Corelib.Numbers.BinNums.positive), P (Rocq.Corelib.Numbers.BinNums.Z.Zneg p)) →
        ∀ (z : Rocq.Corelib.Numbers.BinNums.Z), P z
```

残留源符号：Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.Numbers.BinNums.Z.Z0;Rocq.Corelib.Numbers.BinNums.positive;Rocq.Corelib.Numbers.BinNums.Z.Zpos;Rocq.Corelib.Numbers.BinNums.Z.Zneg

## Corelib.Numbers.BinNums.Z_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Numbers.BinNums.Z_rec

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Numbers.BinNums.Z → Type) →
  P Rocq.Corelib.Numbers.BinNums.Z.Z0 →
    ((p : Rocq.Corelib.Numbers.BinNums.positive) → P (Rocq.Corelib.Numbers.BinNums.Z.Zpos p)) →
      ((p : Rocq.Corelib.Numbers.BinNums.positive) → P (Rocq.Corelib.Numbers.BinNums.Z.Zneg p)) →
        (z : Rocq.Corelib.Numbers.BinNums.Z) → P z

## Corelib.Numbers.BinNums.Z_rect

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Numbers.BinNums.Z_rect

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Numbers.BinNums.Z → Type u_Corelib_Numbers_BinNums_23) →
  P Rocq.Corelib.Numbers.BinNums.Z.Z0 →
    ((p : Rocq.Corelib.Numbers.BinNums.positive) → P (Rocq.Corelib.Numbers.BinNums.Z.Zpos p)) →
      ((p : Rocq.Corelib.Numbers.BinNums.positive) → P (Rocq.Corelib.Numbers.BinNums.Z.Zneg p)) →
        (z : Rocq.Corelib.Numbers.BinNums.Z) → P z

## Corelib.Numbers.BinNums.Z_sind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.BinNums.Z_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.BinNums.Z_sind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Numbers.BinNums.Z → Prop),
  P Rocq.Corelib.Numbers.BinNums.Z.Z0 →
    (∀ (p : Rocq.Corelib.Numbers.BinNums.positive), P (Rocq.Corelib.Numbers.BinNums.Z.Zpos p)) →
      (∀ (p : Rocq.Corelib.Numbers.BinNums.positive), P (Rocq.Corelib.Numbers.BinNums.Z.Zneg p)) →
        ∀ (z : Rocq.Corelib.Numbers.BinNums.Z), P z
```

残留源符号：Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.Numbers.BinNums.Z.Z0;Rocq.Corelib.Numbers.BinNums.positive;Rocq.Corelib.Numbers.BinNums.Z.Zpos;Rocq.Corelib.Numbers.BinNums.Z.Zneg

## Corelib.Numbers.BinNums.positive

状态：TYPE_ISO。已证明双向逆；具体参数、Type/Sort 范围见证书类型。

原始目标：Rocq.Corelib.Numbers.BinNums.positive

操作/类型证书：NativeBridge.positiveIso

## Corelib.Numbers.BinNums.positive_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.BinNums.positive_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.BinNums.positive_ind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Numbers.BinNums.positive → Prop),
  (∀ (p : Rocq.Corelib.Numbers.BinNums.positive), P p → P p.xI) →
    (∀ (p : Rocq.Corelib.Numbers.BinNums.positive), P p → P p.xO) →
      P Rocq.Corelib.Numbers.BinNums.positive.xH → ∀ (p : Rocq.Corelib.Numbers.BinNums.positive), P p
```

残留源符号：Rocq.Corelib.Numbers.BinNums.positive;Rocq.Corelib.Numbers.BinNums.positive.xI;Rocq.Corelib.Numbers.BinNums.positive.xO;Rocq.Corelib.Numbers.BinNums.positive.xH

## Corelib.Numbers.BinNums.positive_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Numbers.BinNums.positive_rec

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Numbers.BinNums.positive → Type) →
  ((p : Rocq.Corelib.Numbers.BinNums.positive) → P p → P p.xI) →
    ((p : Rocq.Corelib.Numbers.BinNums.positive) → P p → P p.xO) →
      P Rocq.Corelib.Numbers.BinNums.positive.xH → (p : Rocq.Corelib.Numbers.BinNums.positive) → P p

## Corelib.Numbers.BinNums.positive_rect

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Numbers.BinNums.positive_rect

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Numbers.BinNums.positive → Type u_Corelib_Numbers_BinNums_21) →
  ((p : Rocq.Corelib.Numbers.BinNums.positive) → P p → P p.xI) →
    ((p : Rocq.Corelib.Numbers.BinNums.positive) → P p → P p.xO) →
      P Rocq.Corelib.Numbers.BinNums.positive.xH → (p : Rocq.Corelib.Numbers.BinNums.positive) → P p

## Corelib.Numbers.BinNums.positive_sind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.BinNums.positive_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.BinNums.positive_sind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Numbers.BinNums.positive → Prop),
  (∀ (p : Rocq.Corelib.Numbers.BinNums.positive), P p → P p.xI) →
    (∀ (p : Rocq.Corelib.Numbers.BinNums.positive), P p → P p.xO) →
      P Rocq.Corelib.Numbers.BinNums.positive.xH → ∀ (p : Rocq.Corelib.Numbers.BinNums.positive), P p
```

残留源符号：Rocq.Corelib.Numbers.BinNums.positive;Rocq.Corelib.Numbers.BinNums.positive.xI;Rocq.Corelib.Numbers.BinNums.positive.xO;Rocq.Corelib.Numbers.BinNums.positive.xH
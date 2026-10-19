# Corelib.Init.Sumbool

每项对应机械翻译基线中的一个 root。完整 native statement / interface 类型在总 JSON 文件中。



## Corelib.Init.Sumbool.bool_eq_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Sumbool.bool_eq_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Sumbool.bool_eq_ind.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool) (P : Rocq.Corelib.Init.Datatypes.bool → Prop),
  (b = Rocq.Corelib.Init.Datatypes.bool.true → P Rocq.Corelib.Init.Datatypes.bool.true) →
    (b = Rocq.Corelib.Init.Datatypes.bool.false → P Rocq.Corelib.Init.Datatypes.bool.false) → P b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.Init.Sumbool.bool_eq_rec

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Sumbool.bool_eq_rec

## Corelib.Init.Sumbool.bool_of_sumbool

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Sumbool.bool_of_sumbool

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Specif.sig Rocq.Corelib.Init.Datatypes.bool fun b =>
  Rocq.Corelib.Init.Datatypes.bool.rec A B b

## Corelib.Init.Sumbool.sumbool_and

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Sumbool.sumbool_and

## Corelib.Init.Sumbool.sumbool_not

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Sumbool.sumbool_not

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Sumbool.sumbool_not.roundtrip

## Corelib.Init.Sumbool.sumbool_of_bool

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Sumbool.sumbool_of_bool

## Corelib.Init.Sumbool.sumbool_or

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Sumbool.sumbool_or
# Corelib.Program.Wf

每项对应机械翻译基线中的一个 root。完整 native statement / interface 类型在总 JSON 文件中。



## Corelib.Program.Wf.F_unfold

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Program.Wf.F_unfold.statement

## Corelib.Program.Wf.Fix_F_eq

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Program.Wf.Fix_F_eq.statement

## Corelib.Program.Wf.Fix_F_inv

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Program.Wf.Fix_F_inv.statement

## Corelib.Program.Wf.Fix_F_sub

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Program.Wf.Fix_F_sub

## Corelib.Program.Wf.Fix_F_sub_rect

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Program.Wf.Fix_F_sub_rect

## Corelib.Program.Wf.Fix_eq

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Program.Wf.Fix_eq.statement

## Corelib.Program.Wf.Fix_sub

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Program.Wf.Fix_sub

## Corelib.Program.Wf.Fix_sub_rect

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Program.Wf.Fix_sub_rect

## Corelib.Program.Wf.MR

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Program.Wf.MR

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Program.Wf.MR.roundtrip

## Corelib.Program.Wf.eq_Fix_F_sub

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Program.Wf.eq_Fix_F_sub.statement

## Corelib.Program.Wf.fix_sub_eq

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Program.Wf.fix_sub_eq.statement

## Corelib.Program.Wf.measure_wf

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Program.Wf.measure_wf.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Program.Wf.measure_wf.statement.correspondence

```lean
∀ (T : Type u_Corelib_Program_Wf_38) (M : Type u_Corelib_Program_Wf_39) (R : M → M → Prop),
  Rocq.Corelib.Init.Wf.well_founded M R →
    ∀ (m : T → M), Rocq.Corelib.Init.Wf.well_founded T (Rocq.Corelib.Program.Wf.MR T M R m)
```

残留源符号：Rocq.Corelib.Init.Wf.well_founded;Rocq.Corelib.Program.Wf.MR
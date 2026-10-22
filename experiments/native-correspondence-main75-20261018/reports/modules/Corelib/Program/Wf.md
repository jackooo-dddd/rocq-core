# Corelib.Program.Wf

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.Program.Wf.F_unfold

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Program.Wf.F_unfold.statement

## Corelib.Program.Wf.Fix_F_eq

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Program.Wf.Fix_F_eq.statement

## Corelib.Program.Wf.Fix_F_inv

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Program.Wf.Fix_F_inv.statement

## Corelib.Program.Wf.Fix_F_sub

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Program.Wf.Fix_F_sub

## Corelib.Program.Wf.Fix_F_sub_rect

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Program.Wf.Fix_F_sub_rect

## Corelib.Program.Wf.Fix_eq

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Program.Wf.Fix_eq.statement

## Corelib.Program.Wf.Fix_sub

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Program.Wf.Fix_sub

## Corelib.Program.Wf.Fix_sub_rect

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Program.Wf.Fix_sub_rect

## Corelib.Program.Wf.MR

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Program.Wf.MR

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Program.Wf.MR.roundtrip

## Corelib.Program.Wf.eq_Fix_F_sub

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Program.Wf.eq_Fix_F_sub.statement

## Corelib.Program.Wf.fix_sub_eq

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Program.Wf.fix_sub_eq.statement

## Corelib.Program.Wf.measure_wf

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Program.Wf.measure_wf.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Program.Wf.measure_wf.statement.correspondence

```lean
∀ (T : Type u_Corelib_Program_Wf_38) (M : Type u_Corelib_Program_Wf_39) (R : M → M → Prop),
  Rocq.Corelib.Init.Wf.well_founded M R →
    ∀ (m : T → M), Rocq.Corelib.Init.Wf.well_founded T (Rocq.Corelib.Program.Wf.MR T M R m)
```

Residual source symbols: Rocq.Corelib.Init.Wf.well_founded;Rocq.Corelib.Program.Wf.MR
# Corelib.Init.Sumbool

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.Init.Sumbool.bool_eq_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Sumbool.bool_eq_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Sumbool.bool_eq_ind.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool) (P : Rocq.Corelib.Init.Datatypes.bool → Prop),
  (b = Rocq.Corelib.Init.Datatypes.bool.true → P Rocq.Corelib.Init.Datatypes.bool.true) →
    (b = Rocq.Corelib.Init.Datatypes.bool.false → P Rocq.Corelib.Init.Datatypes.bool.false) → P b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.Init.Sumbool.bool_eq_rec

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Sumbool.bool_eq_rec

## Corelib.Init.Sumbool.bool_of_sumbool

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Init.Sumbool.bool_of_sumbool

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Specif.sig Rocq.Corelib.Init.Datatypes.bool fun b =>
  Rocq.Corelib.Init.Datatypes.bool.rec A B b

## Corelib.Init.Sumbool.sumbool_and

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Sumbool.sumbool_and

## Corelib.Init.Sumbool.sumbool_not

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Sumbool.sumbool_not

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Sumbool.sumbool_not.roundtrip

## Corelib.Init.Sumbool.sumbool_of_bool

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Sumbool.sumbool_of_bool

## Corelib.Init.Sumbool.sumbool_or

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.Init.Sumbool.sumbool_or
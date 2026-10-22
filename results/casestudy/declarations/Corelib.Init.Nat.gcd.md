# Corelib.Init.Nat.gcd

[Index](../DECLARATIONS.md) · [Source module](../source/Nat.v) · [Complete record](Corelib.Init.Nat.gcd.json)

Mechanical result: PENDING_KERNEL_CHECKED; dispatch: constant/transparent; proof parameters to discharge: 1.

## Source information

The source IR type and body/inductive block are in field mechanical_record.source_ir of the corresponding JSON file; the original source is in the complete .v file.

## Actual Lean printed output

```lean
def RocqPending.Corelib.Init.Nat.gcd : {h_Corelib_Init_Nat_gcd__rocq2lean_termination_1 :
    Rocq.Corelib.Init.Nat.gcd__rocq2lean_termination_1.statement} →
  Rocq.Corelib.Init.Datatypes.nat → Rocq.Corelib.Init.Datatypes.nat → Rocq.Corelib.Init.Datatypes.nat :=
fun {h_Corelib_Init_Nat_gcd__rocq2lean_termination_1} a b =>
  Acc.rec.{1, 1} (motive := fun s acc => Rocq.Corelib.Init.Datatypes.nat → Rocq.Corelib.Init.Datatypes.nat)
    (fun s h ih b =>
      Rocq.Corelib.Init.Datatypes.nat.rec.{1} (motive := fun t => Eq.{1} s t → Rocq.Corelib.Init.Datatypes.nat)
        (fun h => b) (fun a _ih h => ih (Rocq.Corelib.Init.Nat.modulo b a.S) ⋯ a.S) s ⋯)
    ⋯ b
```

## Translation trace

| Attempt label | Elapsed time (ms) | Result |
|---|---|---|
| c[] | 2 | PENDING_KERNEL_CHECKED |

Labels identify attempt configurations, not a per-AST step log. 0 ms reflects the timing resolution and does not mean that no execution occurred.

Parameters to be verified: ["Corelib.Init.Nat.gcd__rocq2lean_termination_1"].

The complete target_report preserves universe fields, the target AST, and branches; prerequisite_declarations preserves prerequisite declarations. Report fields and switches cannot be converted directly into rule invocation counts. See module_validation for source roundtrip, consumer, and audit results.

## Correspondence to native Lean

Coverage category: EXPLICIT_PROOF_PARAMETERS.

Type/Operation Certificate: Undocumented.

Interface round-trip certificate: Not documented.

Statement iff Certificate: Not documented.

A statement iff does not prove the proposition itself; interface round-trip laws do not automatically prove equality with the corresponding Lean operation.

## Full types of the registered certificates

The certificate type is subject to the copied audit; for other certificates, see the original experiment.

[Correspondence proof description](../CORRESPONDENCE.md)

# Corelib.Init.Datatypes.nat_rect

[Index](../DECLARATIONS.md) · [Source module](../source/Datatypes.v) · [Complete record](Corelib.Init.Datatypes.nat_rect.json)

Mechanical result: TRANSLATED_AND_CHECKED; dispatch: constant/transparent; proof parameters to discharge: 0.

## Source information

The source IR type and body/inductive block are in field mechanical_record.source_ir of the corresponding JSON file; the original source is in the complete .v file.

## Actual Lean printed output

```lean
def Rocq.Corelib.Init.Datatypes.nat_rect.{u_Corelib_Init_Datatypes_33} : (P :
    Rocq.Corelib.Init.Datatypes.nat → Sort u_Corelib_Init_Datatypes_33) →
  P Rocq.Corelib.Init.Datatypes.nat.O →
    ((n : Rocq.Corelib.Init.Datatypes.nat) → P n → P n.S) → (n : Rocq.Corelib.Init.Datatypes.nat) → P n :=
fun P O S n => Rocq.Corelib.Init.Datatypes.nat.rec.{u_Corelib_Init_Datatypes_33} O (fun a _ih => S a _ih) n
```

## Translation trace

| Attempt label | Elapsed time (ms) | Result |
|---|---|---|
| c[ad] | 1 | TRANSLATED_AND_CHECKED |

Labels identify attempt configurations, not a per-AST step log. 0 ms reflects the timing resolution and does not mean that no execution occurred.

Parameters to be verified: [].

The complete target_report preserves universe fields, the target AST, and branches; prerequisite_declarations preserves prerequisite declarations. Report fields and switches cannot be converted directly into rule invocation counts. See module_validation for source roundtrip, consumer, and audit results.

## Correspondence to native Lean

Coverage category: OPERATION_CORRESPONDENCE.

Type/operation certificate: NativeBridge.source_nat_rect_agrees.

Interface round-trip certificate: Not documented.

Statement iff Certificate: Not documented.

A statement iff does not prove the proposition itself; interface round-trip laws do not automatically prove equality with the corresponding Lean operation.

## Full types of the registered certificates

NativeBridge.source_nat_rect_agrees

```lean
∀ {P : Nat → Type u} (z : P 0) (s : (n : Nat) → P n → P (n + 1)) (n : NativeBridge.MN),
  Rocq.Corelib.Init.Datatypes.nat_rect (fun n => P (NativeBridge.natTo n)) z (fun k r => s (NativeBridge.natTo k) r) n =
    Nat.rec z s (NativeBridge.natTo n)
```

Axiomatic dependence: [].

[Correspondence proof description](../CORRESPONDENCE.md)

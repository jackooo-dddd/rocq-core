# Corelib.Init.Nat.to_hex_int

[Index](../DECLARATIONS.md) · [Source module](../source/Nat.v) · [Complete record](Corelib.Init.Nat.to_hex_int.json)

Mechanical result: TRANSLATED_AND_CHECKED; dispatch: constant/transparent; proof parameters to discharge: 0.

## Source information

The source IR type and body/inductive block are in field mechanical_record.source_ir of the corresponding JSON file; the original source is in the complete .v file.

## Actual Lean printed output

```lean
def Rocq.Corelib.Init.Nat.to_hex_int : Rocq.Corelib.Init.Datatypes.nat → Rocq.Corelib.Init.Hexadecimal.signed_int :=
fun n => Rocq.Corelib.Init.Hexadecimal.signed_int.Pos (Rocq.Corelib.Init.Nat.to_hex_uint n)
```

## Translation trace

| Attempt label | Elapsed time (ms) | Result |
|---|---|---|
| c[] | 0 | TRANSLATED_AND_CHECKED |

Labels identify attempt configurations, not a per-AST step log. 0 ms reflects the timing resolution and does not mean that no execution occurred.

Parameters to be verified: [].

The complete target_report preserves universe fields, the target AST, and branches; prerequisite_declarations preserves prerequisite declarations. Report fields and switches cannot be converted directly into rule invocation counts. See module_validation for source roundtrip, consumer, and audit results.

## Correspondence to native Lean

Coverage category: NOT_YET_BRIDGED.

Type/Operation Certificate: Undocumented.

Interface round-trip certificate: Not documented.

Statement iff Certificate: Not documented.

A statement iff does not prove the proposition itself; interface round-trip laws do not automatically prove equality with the corresponding Lean operation.

## Full types of the registered certificates

The certificate type is subject to the copied audit; for other certificates, see the original experiment.

[Correspondence proof description](../CORRESPONDENCE.md)

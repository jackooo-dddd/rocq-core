# Corelib.Init.Nat.of_hex_uint

[Index](../DECLARATIONS.md) · [Source module](../source/Nat.v) · [Complete record](Corelib.Init.Nat.of_hex_uint.json)

Mechanical result: TRANSLATED_AND_CHECKED; dispatch: constant/transparent; proof parameters to discharge: 0.

## Source information

The source IR type and body/inductive block are in field mechanical_record.source_ir of the corresponding JSON file; the original source is in the complete .v file.

## Actual Lean printed output

```lean
def Rocq.Corelib.Init.Nat.of_hex_uint : Rocq.Corelib.Init.Hexadecimal.uint → Rocq.Corelib.Init.Datatypes.nat :=
fun d => Rocq.Corelib.Init.Nat.of_hex_uint_acc d Rocq.Corelib.Init.Datatypes.nat.O
```

## Translation trace

| Attempt label | Elapsed time (ms) | Result |
|---|---|---|
| c[] | 0 | TRANSLATED_AND_CHECKED |

Labels identify attempt configurations, not a per-AST step log. 0 ms reflects the timing resolution and does not mean that no execution occurred.

Parameters to be verified: [].

The complete target_report preserves universe fields, the target AST, and branches; prerequisite_declarations preserves prerequisite declarations. Report fields and switches cannot be converted directly into rule invocation counts. See module_validation for source roundtrip, consumer, and audit results.

## Correspondence to native Lean

Coverage category: TRANSPORT_INTERFACE_ONLY.

Type/Operation Certificate: Undocumented.

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Nat.of_hex_uint.roundtrip.

Statement iff Certificate: Not documented.

A statement iff does not prove the proposition itself; interface round-trip laws do not automatically prove equality with the corresponding Lean operation.

## Full types of the registered certificates

NativeBridge.Interfaces.Rocq.Corelib.Init.Nat.of_hex_uint.roundtrip

```lean
(NativeBridge.hexadecimalDigitsIso.functions NativeBridge.natIso).of
    ((NativeBridge.hexadecimalDigitsIso.functions NativeBridge.natIso).to Rocq.Corelib.Init.Nat.of_hex_uint) =
  Rocq.Corelib.Init.Nat.of_hex_uint
```

Axiom dependencies: ['propext', 'Quot.sound'].

[Correspondence proof description](../CORRESPONDENCE.md)

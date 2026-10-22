# Corelib.Init.Nat.square

[Index](../DECLARATIONS.md) · [Source module](../source/Nat.v) · [Complete record](Corelib.Init.Nat.square.json)

Mechanical result: TRANSLATED_AND_CHECKED; dispatch: constant/transparent; proof parameters to discharge: 0.

## Source information

The source IR type and body/inductive block are in field mechanical_record.source_ir of the corresponding JSON file; the original source is in the complete .v file.

## Actual Lean printed output

```lean
def Rocq.Corelib.Init.Nat.square : Rocq.Corelib.Init.Datatypes.nat → Rocq.Corelib.Init.Datatypes.nat :=
fun n => Rocq.Corelib.Init.Nat.mul n n
```

## Translation trace

| Attempt label | Elapsed time (ms) | Result |
|---|---|---|
| c[] | 0 | TRANSLATED_AND_CHECKED |

Labels identify attempt configurations, not a per-AST step log. 0 ms reflects the timing resolution and does not mean that no execution occurred.

Parameters to be verified: [].

The complete target_report preserves universe fields, the target AST, and branches; prerequisite_declarations preserves prerequisite declarations. Report fields and switches cannot be converted directly into rule invocation counts. See module_validation for source roundtrip, consumer, and audit results.

## Correspondence to native Lean

Coverage category: OPERATION_CORRESPONDENCE.

Type/operation certificate: NativeBridge.nat_square_agrees.

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Nat.square.roundtrip.

Statement iff Certificate: Not documented.

A statement iff does not prove the proposition itself; interface round-trip laws do not automatically prove equality with the corresponding Lean operation.

## Full types of the registered certificates

NativeBridge.Interfaces.Rocq.Corelib.Init.Nat.square.roundtrip

```lean
(NativeBridge.natIso.functions NativeBridge.natIso).of
    ((NativeBridge.natIso.functions NativeBridge.natIso).to Rocq.Corelib.Init.Nat.square) =
  Rocq.Corelib.Init.Nat.square
```

Axiom dependencies: ['propext', 'Quot.sound'].

NativeBridge.nat_square_agrees

```lean
∀ (n : NativeBridge.MN),
  NativeBridge.natTo (Rocq.Corelib.Init.Nat.square n) = NativeBridge.natTo n * NativeBridge.natTo n
```

Axiomatic dependence: [].

[Correspondence proof description](../CORRESPONDENCE.md)

# Corelib.Init.Nat.lor

[Index](../DECLARATIONS.md) · [Source module](../source/Nat.v) · [Complete record](Corelib.Init.Nat.lor.json)

Mechanical result: TRANSLATED_AND_CHECKED; dispatch: constant/transparent; proof parameters to discharge: 0.

## Source information

The source IR type and body/inductive block are in field mechanical_record.source_ir of the corresponding JSON file; the original source is in the complete .v file.

## Actual Lean printed output

```lean
def Rocq.Corelib.Init.Nat.lor : Rocq.Corelib.Init.Datatypes.nat →
  Rocq.Corelib.Init.Datatypes.nat → Rocq.Corelib.Init.Datatypes.nat :=
fun a b => Rocq.Corelib.Init.Nat.bitwise Rocq.Corelib.Init.Datatypes.orb (Rocq.Corelib.Init.Nat.max a b) a b
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

Type/operation certificate: NativeBridge.nat_lor_agrees.

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Nat.lor.roundtrip.

Statement iff Certificate: Not documented.

A statement iff does not prove the proposition itself; interface round-trip laws do not automatically prove equality with the corresponding Lean operation.

## Full types of the registered certificates

NativeBridge.Interfaces.Rocq.Corelib.Init.Nat.lor.roundtrip

```lean
(NativeBridge.natIso.functions (NativeBridge.natIso.functions NativeBridge.natIso)).of
    ((NativeBridge.natIso.functions (NativeBridge.natIso.functions NativeBridge.natIso)).to Rocq.Corelib.Init.Nat.lor) =
  Rocq.Corelib.Init.Nat.lor
```

Axiom dependencies: ['propext', 'Quot.sound'].

NativeBridge.nat_lor_agrees

```lean
∀ (a b : NativeBridge.MN),
  NativeBridge.natTo (Rocq.Corelib.Init.Nat.lor a b) = NativeBridge.natTo a ||| NativeBridge.natTo b
```

Axiom dependencies: ['propext', 'Quot.sound'].

[Correspondence proof description](../CORRESPONDENCE.md)

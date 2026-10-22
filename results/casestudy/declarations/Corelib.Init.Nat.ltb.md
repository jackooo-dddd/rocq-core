# Corelib.Init.Nat.ltb

[Index](../DECLARATIONS.md) · [Source module](../source/Nat.v) · [Complete record](Corelib.Init.Nat.ltb.json)

Mechanical result: TRANSLATED_AND_CHECKED; dispatch: constant/transparent; proof parameters to discharge: 0.

## Source information

The source IR type and body/inductive block are in field mechanical_record.source_ir of the corresponding JSON file; the original source is in the complete .v file.

## Actual Lean printed output

```lean
def Rocq.Corelib.Init.Nat.ltb : Rocq.Corelib.Init.Datatypes.nat →
  Rocq.Corelib.Init.Datatypes.nat → Rocq.Corelib.Init.Datatypes.bool :=
fun n m => Rocq.Corelib.Init.Nat.leb n.S m
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

Type/operation certificate: NativeBridge.nat_ltb_agrees.

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Nat.ltb.roundtrip.

Statement iff Certificate: Not documented.

A statement iff does not prove the proposition itself; interface round-trip laws do not automatically prove equality with the corresponding Lean operation.

## Full types of the registered certificates

NativeBridge.Interfaces.Rocq.Corelib.Init.Nat.ltb.roundtrip

```lean
(NativeBridge.natIso.functions (NativeBridge.natIso.functions NativeBridge.boolIso)).of
    ((NativeBridge.natIso.functions (NativeBridge.natIso.functions NativeBridge.boolIso)).to
      Rocq.Corelib.Init.Nat.ltb) =
  Rocq.Corelib.Init.Nat.ltb
```

Axiom dependencies: ['propext', 'Quot.sound'].

NativeBridge.nat_ltb_agrees

```lean
∀ (n m : NativeBridge.MN),
  NativeBridge.boolTo (Rocq.Corelib.Init.Nat.ltb n m) = decide (NativeBridge.natTo n < NativeBridge.natTo m)
```

Axiomatic dependency: ['propext'].

[Correspondence proof description](../CORRESPONDENCE.md)

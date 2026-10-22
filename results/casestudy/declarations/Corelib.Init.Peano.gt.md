# Corelib.Init.Peano.gt

[Index](../DECLARATIONS.md) · [Source module](../source/Peano.v) · [Complete record](Corelib.Init.Peano.gt.json)

Mechanical result: TRANSLATED_AND_CHECKED; dispatch: constant/transparent; proof parameters to discharge: 0.

## Source information

The source IR type and body/inductive block are in field mechanical_record.source_ir of the corresponding JSON file; the original source is in the complete .v file.

## Actual Lean printed output

```lean
def Rocq.Corelib.Init.Peano.gt : Rocq.Corelib.Init.Datatypes.nat → Rocq.Corelib.Init.Datatypes.nat → Prop :=
fun n m => Rocq.Corelib.Init.Peano.lt m n
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

Type/operation certificate: NativeBridge.peano_gt_agrees.

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Peano.gt.roundtrip.

Statement iff Certificate: Not documented.

A statement iff does not prove the proposition itself; interface round-trip laws do not automatically prove equality with the corresponding Lean operation.

## Full types of the registered certificates

NativeBridge.Interfaces.Rocq.Corelib.Init.Peano.gt.roundtrip

```lean
(NativeBridge.natIso.functions (NativeBridge.natIso.functions (NativeBridge.identityIso Prop))).of
    ((NativeBridge.natIso.functions (NativeBridge.natIso.functions (NativeBridge.identityIso Prop))).to
      Rocq.Corelib.Init.Peano.gt) =
  Rocq.Corelib.Init.Peano.gt
```

Axiom dependencies: ['propext', 'Quot.sound'].

NativeBridge.peano_gt_agrees

```lean
∀ (n m : NativeBridge.MN), Rocq.Corelib.Init.Peano.gt n m ↔ NativeBridge.natTo n > NativeBridge.natTo m
```

Axiomatic dependence: [].

[Correspondence proof description](../CORRESPONDENCE.md)

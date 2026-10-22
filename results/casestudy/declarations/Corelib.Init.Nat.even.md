# Corelib.Init.Nat.even

[Index](../DECLARATIONS.md) · [Source module](../source/Nat.v) · [Complete record](Corelib.Init.Nat.even.json)

Mechanical result: TRANSLATED_AND_CHECKED; dispatch: constant/transparent; proof parameters to discharge: 0.

## Source information

The source IR type and body/inductive block are in field mechanical_record.source_ir of the corresponding JSON file; the original source is in the complete .v file.

## Actual Lean printed output

```lean
def Rocq.Corelib.Init.Nat.even : Rocq.Corelib.Init.Datatypes.nat → Rocq.Corelib.Init.Datatypes.bool :=
fun n =>
  (Rocq.Corelib.Init.Datatypes.nat.rec.{1} ⟨Rocq.Corelib.Init.Datatypes.bool.true, PUnit.unit.{1}⟩
      (fun a _ih =>
        ⟨Rocq.Corelib.Init.Datatypes.nat.rec.{1} (motive := fun z =>
            PProd.{1, 1} Rocq.Corelib.Init.Datatypes.bool
                (Rocq.Corelib.Init.Datatypes.nat.rec.{2} PUnit.{1}
                  (fun a _ih => PProd.{1, 1} (PProd.{1, 1} Rocq.Corelib.Init.Datatypes.bool _ih) PUnit.{1}) z) →
              Rocq.Corelib.Init.Datatypes.bool)
            (fun x => Rocq.Corelib.Init.Datatypes.bool.false) (fun a _ih x => x.2.1.1) a _ih,
          _ih, PUnit.unit.{1}⟩)
      n).1
```

## Translation trace

| Attempt label | Elapsed time (ms) | Result |
|---|---|---|
| c[] | 1 | TRANSLATED_AND_CHECKED |

Labels identify attempt configurations, not a per-AST step log. 0 ms reflects the timing resolution and does not mean that no execution occurred.

Parameters to be verified: [].

The complete target_report preserves universe fields, the target AST, and branches; prerequisite_declarations preserves prerequisite declarations. Report fields and switches cannot be converted directly into rule invocation counts. See module_validation for source roundtrip, consumer, and audit results.

## Correspondence to native Lean

Coverage category: OPERATION_CORRESPONDENCE.

Type/operation certificate: NativeBridge.nat_even_agrees.

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Nat.even.roundtrip.

Statement iff Certificate: Not documented.

A statement iff does not prove the proposition itself; interface round-trip laws do not automatically prove equality with the corresponding Lean operation.

## Full types of the registered certificates

NativeBridge.Interfaces.Rocq.Corelib.Init.Nat.even.roundtrip

```lean
(NativeBridge.natIso.functions NativeBridge.boolIso).of
    ((NativeBridge.natIso.functions NativeBridge.boolIso).to Rocq.Corelib.Init.Nat.even) =
  Rocq.Corelib.Init.Nat.even
```

Axiom dependencies: ['propext', 'Quot.sound'].

NativeBridge.nat_even_agrees

```lean
∀ (n : NativeBridge.MN), NativeBridge.boolTo (Rocq.Corelib.Init.Nat.even n) = decide (NativeBridge.natTo n % 2 = 0)
```

Axiom dependencies: ['propext', 'Quot.sound'].

[Correspondence proof description](../CORRESPONDENCE.md)

# Corelib.Init.Nat.bitwise

[Index](../DECLARATIONS.md) · [Source module](../source/Nat.v) · [Complete record](Corelib.Init.Nat.bitwise.json)

Mechanical result: TRANSLATED_AND_CHECKED; dispatch: constant/transparent; proof parameters to discharge: 0.

## Source information

The source IR type and body/inductive block are in field mechanical_record.source_ir of the corresponding JSON file; the original source is in the complete .v file.

## Actual Lean printed output

```lean
def Rocq.Corelib.Init.Nat.bitwise : (Rocq.Corelib.Init.Datatypes.bool →
    Rocq.Corelib.Init.Datatypes.bool → Rocq.Corelib.Init.Datatypes.bool) →
  Rocq.Corelib.Init.Datatypes.nat →
    Rocq.Corelib.Init.Datatypes.nat → Rocq.Corelib.Init.Datatypes.nat → Rocq.Corelib.Init.Datatypes.nat :=
fun op n a b =>
  Rocq.Corelib.Init.Datatypes.nat.rec.{1} (motive := fun n =>
    Rocq.Corelib.Init.Datatypes.nat → Rocq.Corelib.Init.Datatypes.nat → Rocq.Corelib.Init.Datatypes.nat)
    (fun a b => Rocq.Corelib.Init.Datatypes.nat.O)
    (fun a _ih a_1 b =>
      Rocq.Corelib.Init.Nat.add
        (Rocq.Corelib.Init.Datatypes.bool.rec.{1} Rocq.Corelib.Init.Datatypes.nat.O.S Rocq.Corelib.Init.Datatypes.nat.O
          (op (Rocq.Corelib.Init.Nat.odd a_1) (Rocq.Corelib.Init.Nat.odd b)))
        (Rocq.Corelib.Init.Nat.mul Rocq.Corelib.Init.Datatypes.nat.O.S.S
          (_ih (Rocq.Corelib.Init.Nat.div2 a_1) (Rocq.Corelib.Init.Nat.div2 b))))
    n a b
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

Type/operation certificate: NativeBridge.nat_bitwise_agrees.

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Nat.bitwise.roundtrip.

Statement iff Certificate: Not documented.

A statement iff does not prove the proposition itself; interface round-trip laws do not automatically prove equality with the corresponding Lean operation.

## Full types of the registered certificates

NativeBridge.Interfaces.Rocq.Corelib.Init.Nat.bitwise.roundtrip

```lean
((NativeBridge.boolIso.functions (NativeBridge.boolIso.functions NativeBridge.boolIso)).functions
        (NativeBridge.natIso.functions
          (NativeBridge.natIso.functions (NativeBridge.natIso.functions NativeBridge.natIso)))).of
    (((NativeBridge.boolIso.functions (NativeBridge.boolIso.functions NativeBridge.boolIso)).functions
          (NativeBridge.natIso.functions
            (NativeBridge.natIso.functions (NativeBridge.natIso.functions NativeBridge.natIso)))).to
      Rocq.Corelib.Init.Nat.bitwise) =
  Rocq.Corelib.Init.Nat.bitwise
```

Axiom dependencies: ['propext', 'Quot.sound'].

NativeBridge.nat_bitwise_agrees

```lean
∀ (op : NativeBridge.RBool → NativeBridge.RBool → NativeBridge.RBool) (f : Bool → Bool → Bool),
  (∀ (x y : NativeBridge.RBool), NativeBridge.boolTo (op x y) = f (NativeBridge.boolTo x) (NativeBridge.boolTo y)) →
    f false false = false →
      ∀ (n a b : NativeBridge.MN),
        NativeBridge.natTo (Rocq.Corelib.Init.Nat.bitwise op n a b) =
          Nat.bitwise f (NativeBridge.natTo a) (NativeBridge.natTo b) % 2 ^ NativeBridge.natTo n
```

Axiom dependencies: ['propext', 'Quot.sound'].

[Correspondence proof description](../CORRESPONDENCE.md)

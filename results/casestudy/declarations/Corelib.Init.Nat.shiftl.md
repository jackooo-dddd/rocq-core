# Corelib.Init.Nat.shiftl

[Index](../DECLARATIONS.md) · [Source module](../source/Nat.v) · [Complete record](Corelib.Init.Nat.shiftl.json)

Mechanical result: TRANSLATED_AND_CHECKED; dispatch: constant/transparent; proof parameters to discharge: 0.

## Source information

The source IR type and body/inductive block are in field mechanical_record.source_ir of the corresponding JSON file; the original source is in the complete .v file.

## Actual Lean printed output

```lean
def Rocq.Corelib.Init.Nat.shiftl : (fun a => Rocq.Corelib.Init.Datatypes.nat) Rocq.Corelib.Init.Datatypes.nat.O →
  (n : Rocq.Corelib.Init.Datatypes.nat) → (fun a => Rocq.Corelib.Init.Datatypes.nat) n :=
fun a =>
  Rocq.Corelib.Init.Datatypes.nat_rect.{1} (fun a => Rocq.Corelib.Init.Datatypes.nat) a fun n =>
    Rocq.Corelib.Init.Nat.double
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

Type/operation certificate: NativeBridge.nat_shiftl_agrees.

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Nat.shiftl.roundtrip.

Statement iff Certificate: Not documented.

A statement iff does not prove the proposition itself; interface round-trip laws do not automatically prove equality with the corresponding Lean operation.

## Full types of the registered certificates

NativeBridge.Interfaces.Rocq.Corelib.Init.Nat.shiftl.roundtrip

```lean
(NativeBridge.natIso.functions (NativeBridge.natIso.functions NativeBridge.natIso)).of
    ((NativeBridge.natIso.functions (NativeBridge.natIso.functions NativeBridge.natIso)).to
      Rocq.Corelib.Init.Nat.shiftl) =
  Rocq.Corelib.Init.Nat.shiftl
```

Axiom dependencies: ['propext', 'Quot.sound'].

NativeBridge.nat_shiftl_agrees

```lean
∀ (n k : NativeBridge.MN),
  NativeBridge.natTo (Rocq.Corelib.Init.Nat.shiftl n k) = NativeBridge.natTo n <<< NativeBridge.natTo k
```

Axiom dependencies: ['propext', 'Quot.sound'].

[Correspondence proof description](../CORRESPONDENCE.md)

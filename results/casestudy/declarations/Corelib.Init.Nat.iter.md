# Corelib.Init.Nat.iter

[Index](../DECLARATIONS.md) · [Source module](../source/Nat.v) · [Complete record](Corelib.Init.Nat.iter.json)

Mechanical result: TRANSLATED_AND_CHECKED; dispatch: constant/transparent; proof parameters to discharge: 0.

## Source information

The source IR type and body/inductive block are in field mechanical_record.source_ir of the corresponding JSON file; the original source is in the complete .v file.

## Actual Lean printed output

```lean
def Rocq.Corelib.Init.Nat.iter.{u_Corelib_Init_Nat_149} : Rocq.Corelib.Init.Datatypes.nat →
  (A : Sort u_Corelib_Init_Nat_149) → (A → A) → A → A :=
fun n A f x => Rocq.Corelib.Init.Datatypes.nat_rect.{u_Corelib_Init_Nat_149} (fun n => A) x (fun n => f) n
```

## Translation trace

| Attempt label | Elapsed time (ms) | Result |
|---|---|---|
| c[ad] | 0 | TRANSLATED_AND_CHECKED |

Labels identify attempt configurations, not a per-AST step log. 0 ms reflects the timing resolution and does not mean that no execution occurred.

Parameters to be verified: [].

The complete target_report preserves universe fields, the target AST, and branches; prerequisite_declarations preserves prerequisite declarations. Report fields and switches cannot be converted directly into rule invocation counts. See module_validation for source roundtrip, consumer, and audit results.

## Correspondence to native Lean

Coverage category: TRANSPORT_INTERFACE_ONLY.

Type/Operation Certificate: Undocumented.

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Nat.iter.roundtrip.

Statement iff Certificate: Not documented.

A statement iff does not prove the proposition itself; interface round-trip laws do not automatically prove equality with the corresponding Lean operation.

## Full types of the registered certificates

NativeBridge.Interfaces.Rocq.Corelib.Init.Nat.iter.roundtrip

```lean
(NativeBridge.natIso.functions
        (NativeBridge.Iso.piSame fun A =>
          ((NativeBridge.identityIso A).functions (NativeBridge.identityIso A)).functions
            ((NativeBridge.identityIso A).functions (NativeBridge.identityIso A)))).of
    ((NativeBridge.natIso.functions
          (NativeBridge.Iso.piSame fun A =>
            ((NativeBridge.identityIso A).functions (NativeBridge.identityIso A)).functions
              ((NativeBridge.identityIso A).functions (NativeBridge.identityIso A)))).to
      Rocq.Corelib.Init.Nat.iter) =
  Rocq.Corelib.Init.Nat.iter
```

Axiom dependencies: ['propext', 'Quot.sound'].

[Correspondence proof description](../CORRESPONDENCE.md)

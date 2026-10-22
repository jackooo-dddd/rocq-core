# Corelib.Init.Nat.of_uint_acc

[Index](../DECLARATIONS.md) · [Source module](../source/Nat.v) · [Complete record](Corelib.Init.Nat.of_uint_acc.json)

Mechanical result: TRANSLATED_AND_CHECKED; dispatch: constant/transparent; proof parameters to discharge: 0.

## Source information

The source IR type and body/inductive block are in field mechanical_record.source_ir of the corresponding JSON file; the original source is in the complete .v file.

## Actual Lean printed output

```lean
def Rocq.Corelib.Init.Nat.of_uint_acc : Rocq.Corelib.Init.Decimal.uint →
  Rocq.Corelib.Init.Datatypes.nat → Rocq.Corelib.Init.Datatypes.nat :=
fun d acc =>
  Rocq.Corelib.Init.Decimal.uint.rec.{1} (motive := fun d =>
    Rocq.Corelib.Init.Datatypes.nat → Rocq.Corelib.Init.Datatypes.nat) (fun acc => acc)
    (fun a _ih acc => _ih (Rocq.Corelib.Init.Nat.tail_mul Rocq.Corelib.Init.Datatypes.nat.O.S.S.S.S.S.S.S.S.S.S acc))
    (fun a _ih acc => _ih (Rocq.Corelib.Init.Nat.tail_mul Rocq.Corelib.Init.Datatypes.nat.O.S.S.S.S.S.S.S.S.S.S acc).S)
    (fun a _ih acc =>
      _ih (Rocq.Corelib.Init.Nat.tail_mul Rocq.Corelib.Init.Datatypes.nat.O.S.S.S.S.S.S.S.S.S.S acc).S.S)
    (fun a _ih acc =>
      _ih (Rocq.Corelib.Init.Nat.tail_mul Rocq.Corelib.Init.Datatypes.nat.O.S.S.S.S.S.S.S.S.S.S acc).S.S.S)
    (fun a _ih acc =>
      _ih (Rocq.Corelib.Init.Nat.tail_mul Rocq.Corelib.Init.Datatypes.nat.O.S.S.S.S.S.S.S.S.S.S acc).S.S.S.S)
    (fun a _ih acc =>
      _ih (Rocq.Corelib.Init.Nat.tail_mul Rocq.Corelib.Init.Datatypes.nat.O.S.S.S.S.S.S.S.S.S.S acc).S.S.S.S.S)
    (fun a _ih acc =>
      _ih (Rocq.Corelib.Init.Nat.tail_mul Rocq.Corelib.Init.Datatypes.nat.O.S.S.S.S.S.S.S.S.S.S acc).S.S.S.S.S.S)
    (fun a _ih acc =>
      _ih (Rocq.Corelib.Init.Nat.tail_mul Rocq.Corelib.Init.Datatypes.nat.O.S.S.S.S.S.S.S.S.S.S acc).S.S.S.S.S.S.S)
    (fun a _ih acc =>
      _ih (Rocq.Corelib.Init.Nat.tail_mul Rocq.Corelib.Init.Datatypes.nat.O.S.S.S.S.S.S.S.S.S.S acc).S.S.S.S.S.S.S.S)
    (fun a _ih acc =>
      _ih (Rocq.Corelib.Init.Nat.tail_mul Rocq.Corelib.Init.Datatypes.nat.O.S.S.S.S.S.S.S.S.S.S acc).S.S.S.S.S.S.S.S.S)
    d acc
```

## Translation trace

| Attempt label | Elapsed time (ms) | Result |
|---|---|---|
| c[] | 1 | TRANSLATED_AND_CHECKED |

Labels identify attempt configurations, not a per-AST step log. 0 ms reflects the timing resolution and does not mean that no execution occurred.

Parameters to be verified: [].

The complete target_report preserves universe fields, the target AST, and branches; prerequisite_declarations preserves prerequisite declarations. Report fields and switches cannot be converted directly into rule invocation counts. See module_validation for source roundtrip, consumer, and audit results.

## Correspondence to native Lean

Coverage category: TRANSPORT_INTERFACE_ONLY.

Type/Operation Certificate: Undocumented.

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Nat.of_uint_acc.roundtrip.

Statement iff Certificate: Not documented.

A statement iff does not prove the proposition itself; interface round-trip laws do not automatically prove equality with the corresponding Lean operation.

## Full types of the registered certificates

NativeBridge.Interfaces.Rocq.Corelib.Init.Nat.of_uint_acc.roundtrip

```lean
(NativeBridge.decimalDigitsIso.functions (NativeBridge.natIso.functions NativeBridge.natIso)).of
    ((NativeBridge.decimalDigitsIso.functions (NativeBridge.natIso.functions NativeBridge.natIso)).to
      Rocq.Corelib.Init.Nat.of_uint_acc) =
  Rocq.Corelib.Init.Nat.of_uint_acc
```

Axiom dependencies: ['propext', 'Quot.sound'].

[Correspondence proof description](../CORRESPONDENCE.md)

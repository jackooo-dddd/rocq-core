# Corelib.Init.Peano.le

[Index](../DECLARATIONS.md) · [Source module](../source/Peano.v) · [Complete record](Corelib.Init.Peano.le.json)

Mechanical result: TRANSLATED_AND_CHECKED; dispatch: inductive/generated; proof parameters to discharge: 0.

## Source information

The source IR type and body/inductive block are in field mechanical_record.source_ir of the corresponding JSON file; the original source is in the complete .v file.

## Actual Lean printed output

```lean
inductive Rocq.Corelib.Init.Peano.le : Rocq.Corelib.Init.Datatypes.nat → Rocq.Corelib.Init.Datatypes.nat → Prop
number of parameters: 1
constructors:
Rocq.Corelib.Init.Peano.le.le_n : ∀ (n : Rocq.Corelib.Init.Datatypes.nat), Rocq.Corelib.Init.Peano.le n n
Rocq.Corelib.Init.Peano.le.le_S : ∀ (n m : Rocq.Corelib.Init.Datatypes.nat),
  Rocq.Corelib.Init.Peano.le n m → Rocq.Corelib.Init.Peano.le n m.S
```

## Translation trace

| Attempt label | Elapsed time (ms) | Result |
|---|---|---|
| i[pl] | 0 | TRANSLATED_AND_CHECKED |

Labels identify attempt configurations, not a per-AST step log. 0 ms reflects the timing resolution and does not mean that no execution occurred.

Parameters to be verified: [].

The complete target_report preserves universe fields, the target AST, and branches; prerequisite_declarations preserves prerequisite declarations. Report fields and switches cannot be converted directly into rule invocation counts. See module_validation for source roundtrip, consumer, and audit results.

## Correspondence to native Lean

Coverage category: OPERATION_CORRESPONDENCE.

Type/operation certificate: NativeBridge.peano_le_agrees.

Interface round-trip certificate: Not documented.

Statement iff Certificate: Not documented.

A statement iff does not prove the proposition itself; interface round-trip laws do not automatically prove equality with the corresponding Lean operation.

## Full types of the registered certificates

NativeBridge.peano_le_agrees

```lean
∀ (n m : NativeBridge.MN), Rocq.Corelib.Init.Peano.le n m ↔ NativeBridge.natTo n ≤ NativeBridge.natTo m
```

Axiomatic dependence: [].

[Correspondence proof description](../CORRESPONDENCE.md)

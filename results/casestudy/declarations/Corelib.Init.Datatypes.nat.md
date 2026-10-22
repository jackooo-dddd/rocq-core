# Corelib.Init.Datatypes.nat

[Index](../DECLARATIONS.md) · [Source module](../source/Datatypes.v) · [Complete record](Corelib.Init.Datatypes.nat.json)

Mechanical result: TRANSLATED_AND_CHECKED; dispatch: inductive/generated; proof parameters to discharge: 0.

## Source information

The source IR type and body/inductive block are in field mechanical_record.source_ir of the corresponding JSON file; the original source is in the complete .v file.

## Actual Lean printed output

```lean
inductive Rocq.Corelib.Init.Datatypes.nat : Type
number of parameters: 0
constructors:
Rocq.Corelib.Init.Datatypes.nat.O : Rocq.Corelib.Init.Datatypes.nat
Rocq.Corelib.Init.Datatypes.nat.S : Rocq.Corelib.Init.Datatypes.nat → Rocq.Corelib.Init.Datatypes.nat
```

## Translation trace

| Attempt label | Elapsed time (ms) | Result |
|---|---|---|
| i[pl] | 0 | TRANSLATED_AND_CHECKED |

Labels identify attempt configurations, not a per-AST step log. 0 ms reflects the timing resolution and does not mean that no execution occurred.

Parameters to be verified: [].

The complete target_report preserves universe fields, the target AST, and branches; prerequisite_declarations preserves prerequisite declarations. Report fields and switches cannot be converted directly into rule invocation counts. See module_validation for source roundtrip, consumer, and audit results.

## Correspondence to native Lean

Coverage category: TYPE_ISO.

Type/operation certificate: NativeBridge.natIso.

Interface round-trip certificate: Not documented.

Statement iff Certificate: Not documented.

A statement iff does not prove the proposition itself; interface round-trip laws do not automatically prove equality with the corresponding Lean operation.

## Full types of the registered certificates

NativeBridge.natIso

```lean
NativeBridge.Iso NativeBridge.MN Nat
```

Axiomatic dependence: [].

[Correspondence proof description](../CORRESPONDENCE.md)

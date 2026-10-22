# Corelib.Init.Peano.eq_add_S

[Index](../DECLARATIONS.md) · [Source module](../source/Peano.v) · [Complete record](Corelib.Init.Peano.eq_add_S.json)

Mechanical result: STATEMENT_KERNEL_CHECKED; dispatch: constant/transparent; proof parameters to discharge: 0.

## Source information

The source IR type and body/inductive block are in field mechanical_record.source_ir of the corresponding JSON file; the original source is in the complete .v file.

## Actual Lean printed output

```lean
def Rocq.Corelib.Init.Peano.eq_add_S.statement : Prop :=
∀ (n m : Rocq.Corelib.Init.Datatypes.nat),
  Rocq.Corelib.Init.Logic.eq.{1} Rocq.Corelib.Init.Datatypes.nat n.S m.S →
    Rocq.Corelib.Init.Logic.eq.{1} Rocq.Corelib.Init.Datatypes.nat n m
```

## Translation trace

| Attempt label | Elapsed time (ms) | Result |
|---|---|---|
| c[] | 0 | TRANSLATED_AND_CHECKED |

Labels identify attempt configurations, not a per-AST step log. 0 ms reflects the timing resolution and does not mean that no execution occurred.

Parameters to be verified: [].

The complete target_report preserves universe fields, the target AST, and branches; prerequisite_declarations preserves prerequisite declarations. Report fields and switches cannot be converted directly into rule invocation counts. See module_validation for source roundtrip, consumer, and audit results.

## Correspondence to native Lean

Coverage category: STATEMENT_FULL_NATIVE.

Type/Operation Certificate: Undocumented.

Interface round-trip certificate: Not documented.

Statement iff Certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.eq_add_S.statement.correspondence.

A statement iff does not prove the proposition itself; interface round-trip laws do not automatically prove equality with the corresponding Lean operation.

Native statement:

```lean
∀ (n n_1 : Nat), n.succ = n_1.succ → n = n_1
```

## Full types of the registered certificates

NativeBridge.Statements.Rocq.Corelib.Init.Peano.eq_add_S.statement.correspondence

```lean
Rocq.Corelib.Init.Peano.eq_add_S.statement ↔ NativeBridge.Statements.Rocq.Corelib.Init.Peano.eq_add_S.statement.native
```

Axiom dependencies: ['propext', 'Quot.sound'].

[Correspondence proof description](../CORRESPONDENCE.md)

# Corelib.Init.Peano.le_pred

[Index](../DECLARATIONS.md) · [Source module](../source/Peano.v) · [Complete record](Corelib.Init.Peano.le_pred.json)

Mechanical result: STATEMENT_KERNEL_CHECKED; dispatch: constant/transparent; proof parameters to discharge: 0.

## Source information

The source IR type and body/inductive block are in field mechanical_record.source_ir of the corresponding JSON file; the original source is in the complete .v file.

## Actual Lean printed output

```lean
def Rocq.Corelib.Init.Peano.le_pred.statement : Prop :=
∀ (n m : Rocq.Corelib.Init.Datatypes.nat),
  Rocq.Corelib.Init.Peano.le n m →
    Rocq.Corelib.Init.Peano.le (Rocq.Corelib.Init.Nat.pred n) (Rocq.Corelib.Init.Nat.pred m)
```

## Translation trace

| Attempt label | Elapsed time (ms) | Result |
|---|---|---|
| c[] | 0 | TRANSLATED_AND_CHECKED |

Labels identify attempt configurations, not a per-AST step log. 0 ms reflects the timing resolution and does not mean that no execution occurred.

Parameters to be verified: [].

The complete target_report preserves universe fields, the target AST, and branches; prerequisite_declarations preserves prerequisite declarations. Report fields and switches cannot be converted directly into rule invocation counts. See module_validation for source roundtrip, consumer, and audit results.

## Correspondence to native Lean

Coverage category: STATEMENT_PARTIAL.

Type/Operation Certificate: Undocumented.

Interface round-trip certificate: Not documented.

Statement iff Certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.le_pred.statement.correspondence.

A statement iff does not prove the proposition itself; interface round-trip laws do not automatically prove equality with the corresponding Lean operation.

Native statement:

```lean
∀ (n n_1 : Nat),
  n ≤ n_1 →
    NativeBridge.natTo (Rocq.Corelib.Init.Nat.pred (NativeBridge.natOf n)) ≤
      NativeBridge.natTo (Rocq.Corelib.Init.Nat.pred (NativeBridge.natOf n_1))
```

Surviving source symbol: Rocq.Corelib.Init.Nat.pred.

## Full types of the registered certificates

NativeBridge.Statements.Rocq.Corelib.Init.Peano.le_pred.statement.correspondence

```lean
Rocq.Corelib.Init.Peano.le_pred.statement ↔ NativeBridge.Statements.Rocq.Corelib.Init.Peano.le_pred.statement.native
```

Axiom dependencies: ['propext', 'Quot.sound'].

[Correspondence proof description](../CORRESPONDENCE.md)

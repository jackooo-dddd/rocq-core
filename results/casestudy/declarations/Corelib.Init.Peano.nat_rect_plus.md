# Corelib.Init.Peano.nat_rect_plus

[Index](../DECLARATIONS.md) · [Source module](../source/Peano.v) · [Complete record](Corelib.Init.Peano.nat_rect_plus.json)

Mechanical result: STATEMENT_KERNEL_CHECKED; dispatch: constant/transparent; proof parameters to discharge: 0.

## Source information

The source IR type and body/inductive block are in field mechanical_record.source_ir of the corresponding JSON file; the original source is in the complete .v file.

## Actual Lean printed output

```lean
def Rocq.Corelib.Init.Peano.nat_rect_plus.statement.{u_Corelib_Init_Peano_98} : Prop :=
∀ (n m : Rocq.Corelib.Init.Datatypes.nat) (A : Sort u_Corelib_Init_Peano_98) (f : A → A) (x : A),
  Rocq.Corelib.Init.Logic.eq.{u_Corelib_Init_Peano_98} A
    (Rocq.Corelib.Init.Datatypes.nat_rect.{u_Corelib_Init_Peano_98} (fun n => A) x (fun n => f)
      (Rocq.Corelib.Init.Nat.add n m))
    (Rocq.Corelib.Init.Datatypes.nat_rect.{u_Corelib_Init_Peano_98} (fun n => A)
      (Rocq.Corelib.Init.Datatypes.nat_rect.{u_Corelib_Init_Peano_98} (fun n => A) x (fun n => f) m) (fun n => f) n)
```

## Translation trace

| Attempt label | Elapsed time (ms) | Result |
|---|---|---|
| c[ad] eo1 | 1 | TRANSLATED_AND_CHECKED |

Labels identify attempt configurations, not a per-AST step log. 0 ms reflects the timing resolution and does not mean that no execution occurred.

Parameters to be verified: [].

The complete target_report preserves universe fields, the target AST, and branches; prerequisite_declarations preserves prerequisite declarations. Report fields and switches cannot be converted directly into rule invocation counts. See module_validation for source roundtrip, consumer, and audit results.

## Correspondence to native Lean

Coverage category: STATEMENT_PARTIAL.

Type/Operation Certificate: Undocumented.

Interface round-trip certificate: Not documented.

Statement iff Certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.nat_rect_plus.statement.correspondence.

A statement iff does not prove the proposition itself; interface round-trip laws do not automatically prove equality with the corresponding Lean operation.

Native statement:

```lean
∀ (n n_1 : Nat) (A : Sort u_Corelib_Init_Peano_98) (f : A → A) (x : A),
  Rocq.Corelib.Init.Datatypes.nat_rect (fun n => A) x (fun n => f)
      (Rocq.Corelib.Init.Nat.add (NativeBridge.natOf n) (NativeBridge.natOf n_1)) =
    Rocq.Corelib.Init.Datatypes.nat_rect (fun n => A)
      (Rocq.Corelib.Init.Datatypes.nat_rect (fun n => A) x (fun n => f) (NativeBridge.natOf n_1)) (fun n => f)
      (NativeBridge.natOf n)
```

Surviving source symbols: Rocq.Corelib.Init.Datatypes.nat_rect; Rocq.Corelib.Init.Datatypes.nat; Rocq.Corelib.Init.Nat.add.

## Full types of the registered certificates

NativeBridge.Statements.Rocq.Corelib.Init.Peano.nat_rect_plus.statement.correspondence

```lean
Rocq.Corelib.Init.Peano.nat_rect_plus.statement ↔
  NativeBridge.Statements.Rocq.Corelib.Init.Peano.nat_rect_plus.statement.native
```

Axiom dependencies: ['propext', 'Quot.sound'].

[Correspondence proof description](../CORRESPONDENCE.md)

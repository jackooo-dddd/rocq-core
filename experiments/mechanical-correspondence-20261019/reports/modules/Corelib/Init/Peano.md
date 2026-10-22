# Corelib.Init.Peano

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.Init.Peano.IsSucc

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Init.Peano.IsSucc

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Peano.IsSucc.roundtrip

## Corelib.Init.Peano.O_S

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.O_S.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.O_S.statement.correspondence

```lean
∀ (n : Nat), ¬0 = n.succ
```

## Corelib.Init.Peano.eq_S

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.eq_S.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.eq_S.statement.correspondence

```lean
∀ (n n_1 : Nat), n = n_1 → n.succ = n_1.succ
```

## Corelib.Init.Peano.eq_add_S

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.eq_add_S.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.eq_add_S.statement.correspondence

```lean
∀ (n n_1 : Nat), n.succ = n_1.succ → n = n_1
```

## Corelib.Init.Peano.f_equal2_mult

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.f_equal2_mult.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.f_equal2_mult.statement.correspondence

```lean
∀ (n n_1 n_2 n_3 : Nat), n = n_1 → n_2 = n_3 → n * n_2 = n_1 * n_3
```

## Corelib.Init.Peano.f_equal2_nat

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.f_equal2_nat.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.f_equal2_nat.statement.correspondence

```lean
∀ (B : Sort u_Corelib_Init_Logic_109) (f : Nat → Nat → B) (n n_1 n_2 n_3 : Nat),
  n = n_1 → n_2 = n_3 → f n n_2 = f n_1 n_3
```

## Corelib.Init.Peano.f_equal2_plus

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.f_equal2_plus.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.f_equal2_plus.statement.correspondence

```lean
∀ (n n_1 n_2 n_3 : Nat), n = n_1 → n_2 = n_3 → n + n_2 = n_1 + n_3
```

## Corelib.Init.Peano.f_equal_nat

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.f_equal_nat.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.f_equal_nat.statement.correspondence

```lean
∀ (B : Sort u_Corelib_Init_Logic_46) (f : Nat → B) (n n_1 : Nat), n = n_1 → f n = f n_1
```

## Corelib.Init.Peano.f_equal_pred

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Peano.f_equal_pred.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.f_equal_pred.statement.correspondence

```lean
∀ (n n_1 : Nat),
  n = n_1 →
    NativeBridge.natTo (Rocq.Corelib.Init.Nat.pred (NativeBridge.natOf n)) =
      NativeBridge.natTo (Rocq.Corelib.Init.Nat.pred (NativeBridge.natOf n_1))
```

Residual source symbols: Rocq.Corelib.Init.Nat.pred

## Corelib.Init.Peano.ge

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Peano.ge

Operation/Type Certificate: NativeBridge.peano_ge_agrees

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Peano.ge.roundtrip

## Corelib.Init.Peano.gt

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Peano.gt

Operation/Type Certificate: NativeBridge.peano_gt_agrees

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Peano.gt.roundtrip

## Corelib.Init.Peano.le

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Peano.le

Operation/Type Certificate: NativeBridge.peano_le_agrees

## Corelib.Init.Peano.le_0_n

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.le_0_n.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.le_0_n.statement.correspondence

```lean
∀ (n : Nat), 0 ≤ n
```

## Corelib.Init.Peano.le_S_n

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.le_S_n.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.le_S_n.statement.correspondence

```lean
∀ (n n_1 : Nat), n.succ ≤ n_1.succ → n ≤ n_1
```

## Corelib.Init.Peano.le_ind

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.le_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.le_ind.statement.correspondence

```lean
∀ (n : Nat) (f : Nat → Prop), f n → (∀ (n_1 : Nat), n ≤ n_1 → f n_1 → f n_1.succ) → ∀ (n_1 : Nat), n ≤ n_1 → f n_1
```

## Corelib.Init.Peano.le_n_S

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.le_n_S.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.le_n_S.statement.correspondence

```lean
∀ (n n_1 : Nat), n ≤ n_1 → n.succ ≤ n_1.succ
```

## Corelib.Init.Peano.le_pred

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Peano.le_pred.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.le_pred.statement.correspondence

```lean
∀ (n n_1 : Nat),
  n ≤ n_1 →
    NativeBridge.natTo (Rocq.Corelib.Init.Nat.pred (NativeBridge.natOf n)) ≤
      NativeBridge.natTo (Rocq.Corelib.Init.Nat.pred (NativeBridge.natOf n_1))
```

Residual source symbols: Rocq.Corelib.Init.Nat.pred

## Corelib.Init.Peano.le_sind

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.le_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.le_sind.statement.correspondence

```lean
∀ (n : Nat) (f : Nat → Prop), f n → (∀ (n_1 : Nat), n ≤ n_1 → f n_1 → f n_1.succ) → ∀ (n_1 : Nat), n ≤ n_1 → f n_1
```

## Corelib.Init.Peano.lt

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Init.Peano.lt

Operation/Type Certificate: NativeBridge.peano_lt_agrees

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Init.Peano.lt.roundtrip

## Corelib.Init.Peano.max_l

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.max_l.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.max_l.statement.correspondence

```lean
∀ (n n_1 : Nat), n_1 ≤ n → max n n_1 = n
```

## Corelib.Init.Peano.max_r

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.max_r.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.max_r.statement.correspondence

```lean
∀ (n n_1 : Nat), n ≤ n_1 → max n n_1 = n_1
```

## Corelib.Init.Peano.min_l

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.min_l.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.min_l.statement.correspondence

```lean
∀ (n n_1 : Nat), n ≤ n_1 → min n n_1 = n
```

## Corelib.Init.Peano.min_r

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.min_r.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.min_r.statement.correspondence

```lean
∀ (n n_1 : Nat), n_1 ≤ n → min n n_1 = n_1
```

## Corelib.Init.Peano.mult_n_O

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.mult_n_O.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.mult_n_O.statement.correspondence

```lean
∀ (n : Nat), 0 = n * 0
```

## Corelib.Init.Peano.mult_n_Sm

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.mult_n_Sm.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.mult_n_Sm.statement.correspondence

```lean
∀ (n n_1 : Nat), n * n_1 + n = n * n_1.succ
```

## Corelib.Init.Peano.n_Sn

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.n_Sn.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.n_Sn.statement.correspondence

```lean
∀ (n : Nat), ¬n = n.succ
```

## Corelib.Init.Peano.nat_case

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.nat_case.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.nat_case.statement.correspondence

```lean
∀ (n : Nat) (f : Nat → Prop), f 0 → (∀ (n : Nat), f n.succ) → f n
```

## Corelib.Init.Peano.nat_double_ind

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.nat_double_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.nat_double_ind.statement.correspondence

```lean
∀ (f : Nat → Nat → Prop),
  (∀ (n : Nat), f 0 n) →
    (∀ (n : Nat), f n.succ 0) → (∀ (n n_1 : Nat), f n n_1 → f n.succ n_1.succ) → ∀ (n n_1 : Nat), f n n_1
```

## Corelib.Init.Peano.nat_rect_plus

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Peano.nat_rect_plus.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.nat_rect_plus.statement.correspondence

```lean
∀ (n n_1 : Nat) (A : Sort u_Corelib_Init_Peano_98) (f : A → A) (x : A),
  Rocq.Corelib.Init.Datatypes.nat_rect (fun n => A) x (fun n => f)
      (Rocq.Corelib.Init.Nat.add (NativeBridge.natOf n) (NativeBridge.natOf n_1)) =
    Rocq.Corelib.Init.Datatypes.nat_rect (fun n => A)
      (Rocq.Corelib.Init.Datatypes.nat_rect (fun n => A) x (fun n => f) (NativeBridge.natOf n_1)) (fun n => f)
      (NativeBridge.natOf n)
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.nat_rect;Rocq.Corelib.Init.Datatypes.nat;Rocq.Corelib.Init.Nat.add

## Corelib.Init.Peano.nat_rect_succ_r

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Peano.nat_rect_succ_r.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.nat_rect_succ_r.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Peano_92) (f : A → A) (x : A) (n : Nat),
  Rocq.Corelib.Init.Datatypes.nat_rect (fun n => A) x (fun n => f)
      (Rocq.Corelib.Init.Datatypes.nat.S (NativeBridge.natOf n)) =
    Rocq.Corelib.Init.Datatypes.nat_rect (fun n => A) (f x) (fun n => f) (NativeBridge.natOf n)
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.nat_rect;Rocq.Corelib.Init.Datatypes.nat;Rocq.Corelib.Init.Datatypes.nat.S

## Corelib.Init.Peano.not_eq_S

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.not_eq_S.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.not_eq_S.statement.correspondence

```lean
∀ (n n_1 : Nat), ¬n = n_1 → ¬n.succ = n_1.succ
```

## Corelib.Init.Peano.plus_O_n

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.plus_O_n.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.plus_O_n.statement.correspondence

```lean
∀ (n : Nat), 0 + n = n
```

## Corelib.Init.Peano.plus_Sn_m

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.plus_Sn_m.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.plus_Sn_m.statement.correspondence

```lean
∀ (n n_1 : Nat), n.succ + n_1 = (n + n_1).succ
```

## Corelib.Init.Peano.plus_n_O

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.plus_n_O.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.plus_n_O.statement.correspondence

```lean
∀ (n : Nat), n = n + 0
```

## Corelib.Init.Peano.plus_n_Sm

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.plus_n_Sm.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.plus_n_Sm.statement.correspondence

```lean
∀ (n n_1 : Nat), (n + n_1).succ = n + n_1.succ
```

## Corelib.Init.Peano.pred_Sn

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Peano.pred_Sn.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.pred_Sn.statement.correspondence

```lean
∀ (n : Nat),
  n = NativeBridge.natTo (Rocq.Corelib.Init.Nat.pred (Rocq.Corelib.Init.Datatypes.nat.S (NativeBridge.natOf n)))
```

Residual source symbols: Rocq.Corelib.Init.Nat.pred;Rocq.Corelib.Init.Datatypes.nat.S
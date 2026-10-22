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
∀ (n : Nat), ¬Nat.zero = n.succ
```

## Corelib.Init.Peano.eq_S

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.eq_S.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.eq_S.statement.correspondence

```lean
∀ (x y : Nat), x = y → x.succ = y.succ
```

## Corelib.Init.Peano.eq_add_S

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.eq_add_S.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.eq_add_S.statement.correspondence

```lean
∀ (n m : Nat), n.succ = m.succ → n = m
```

## Corelib.Init.Peano.f_equal2_mult

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.f_equal2_mult.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.f_equal2_mult.statement.correspondence

```lean
∀ (x1 y1 x2 y2 : Nat), x1 = y1 → x2 = y2 → x1 * x2 = y1 * y2
```

## Corelib.Init.Peano.f_equal2_nat

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.f_equal2_nat.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.f_equal2_nat.statement.correspondence

```lean
∀ (B : Sort u_Corelib_Init_Logic_109) (f : Nat → Nat → B) (x1 y1 x2 y2 : Nat), x1 = y1 → x2 = y2 → f x1 x2 = f y1 y2
```

## Corelib.Init.Peano.f_equal2_plus

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.f_equal2_plus.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.f_equal2_plus.statement.correspondence

```lean
∀ (x1 y1 x2 y2 : Nat), x1 = y1 → x2 = y2 → x1 + x2 = y1 + y2
```

## Corelib.Init.Peano.f_equal_nat

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.f_equal_nat.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.f_equal_nat.statement.correspondence

```lean
∀ (B : Sort u_Corelib_Init_Logic_46) (f : Nat → B) (x y : Nat), x = y → f x = f y
```

## Corelib.Init.Peano.f_equal_pred

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Peano.f_equal_pred.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.f_equal_pred.statement.correspondence

```lean
∀ (x y : Nat), x = y → Rocq.Corelib.Init.Nat.pred x = Rocq.Corelib.Init.Nat.pred y
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
∀ (n : Nat), Nat.zero ≤ n
```

## Corelib.Init.Peano.le_S_n

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.le_S_n.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.le_S_n.statement.correspondence

```lean
∀ (n m : Nat), n.succ ≤ m.succ → n ≤ m
```

## Corelib.Init.Peano.le_ind

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.le_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.le_ind.statement.correspondence

```lean
∀ (n : Nat) (P : Nat → Prop), P n → (∀ (m : Nat), n ≤ m → P m → P m.succ) → ∀ (n0 : Nat), n ≤ n0 → P n0
```

## Corelib.Init.Peano.le_n_S

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.le_n_S.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.le_n_S.statement.correspondence

```lean
∀ (n m : Nat), n ≤ m → n.succ ≤ m.succ
```

## Corelib.Init.Peano.le_pred

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Peano.le_pred.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.le_pred.statement.correspondence

```lean
∀ (n m : Nat), n ≤ m → Rocq.Corelib.Init.Nat.pred n ≤ Rocq.Corelib.Init.Nat.pred m
```

Residual source symbols: Rocq.Corelib.Init.Nat.pred

## Corelib.Init.Peano.le_sind

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.le_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.le_sind.statement.correspondence

```lean
∀ (n : Nat) (P : Nat → Prop), P n → (∀ (m : Nat), n ≤ m → P m → P m.succ) → ∀ (n0 : Nat), n ≤ n0 → P n0
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
∀ (n m : Nat), m ≤ n → max n m = n
```

## Corelib.Init.Peano.max_r

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.max_r.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.max_r.statement.correspondence

```lean
∀ (n m : Nat), n ≤ m → max n m = m
```

## Corelib.Init.Peano.min_l

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.min_l.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.min_l.statement.correspondence

```lean
∀ (n m : Nat), n ≤ m → min n m = n
```

## Corelib.Init.Peano.min_r

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.min_r.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.min_r.statement.correspondence

```lean
∀ (n m : Nat), m ≤ n → min n m = m
```

## Corelib.Init.Peano.mult_n_O

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.mult_n_O.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.mult_n_O.statement.correspondence

```lean
∀ (n : Nat), Nat.zero = n * Nat.zero
```

## Corelib.Init.Peano.mult_n_Sm

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.mult_n_Sm.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.mult_n_Sm.statement.correspondence

```lean
∀ (n m : Nat), n * m + n = n * m.succ
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
∀ (n : Nat) (P : Nat → Prop), P Nat.zero → (∀ (m : Nat), P m.succ) → P n
```

## Corelib.Init.Peano.nat_double_ind

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.nat_double_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.nat_double_ind.statement.correspondence

```lean
∀ (R : Nat → Nat → Prop),
  (∀ (n : Nat), R Nat.zero n) →
    (∀ (n : Nat), R n.succ Nat.zero) → (∀ (n m : Nat), R n m → R n.succ m.succ) → ∀ (n m : Nat), R n m
```

## Corelib.Init.Peano.nat_rect_plus

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Peano.nat_rect_plus.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.nat_rect_plus.statement.correspondence

```lean
∀ (n m : Nat) (A : Sort u_Corelib_Init_Peano_98) (f : A → A) (x : A),
  Rocq.Corelib.Init.Datatypes.nat_rect (fun n => A) x (fun n => f) (n + m) =
    Rocq.Corelib.Init.Datatypes.nat_rect (fun n => A)
      (Rocq.Corelib.Init.Datatypes.nat_rect (fun n => A) x (fun n => f) m) (fun n => f) n
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.nat_rect

## Corelib.Init.Peano.nat_rect_succ_r

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Peano.nat_rect_succ_r.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.nat_rect_succ_r.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Peano_92) (f : A → A) (x : A) (n : Nat),
  Rocq.Corelib.Init.Datatypes.nat_rect (fun n => A) x (fun n => f) n.succ =
    Rocq.Corelib.Init.Datatypes.nat_rect (fun n => A) (f x) (fun n => f) n
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.nat_rect

## Corelib.Init.Peano.not_eq_S

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.not_eq_S.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.not_eq_S.statement.correspondence

```lean
∀ (n m : Nat), ¬n = m → ¬n.succ = m.succ
```

## Corelib.Init.Peano.plus_O_n

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.plus_O_n.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.plus_O_n.statement.correspondence

```lean
∀ (n : Nat), Nat.zero + n = n
```

## Corelib.Init.Peano.plus_Sn_m

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.plus_Sn_m.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.plus_Sn_m.statement.correspondence

```lean
∀ (n m : Nat), n.succ + m = (n + m).succ
```

## Corelib.Init.Peano.plus_n_O

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.plus_n_O.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.plus_n_O.statement.correspondence

```lean
∀ (n : Nat), n = n + Nat.zero
```

## Corelib.Init.Peano.plus_n_Sm

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.Init.Peano.plus_n_Sm.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.plus_n_Sm.statement.correspondence

```lean
∀ (n m : Nat), (n + m).succ = n + m.succ
```

## Corelib.Init.Peano.pred_Sn

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Init.Peano.pred_Sn.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Init.Peano.pred_Sn.statement.correspondence

```lean
∀ (n : Nat), n = Rocq.Corelib.Init.Nat.pred n.succ
```

Residual source symbols: Rocq.Corelib.Init.Nat.pred
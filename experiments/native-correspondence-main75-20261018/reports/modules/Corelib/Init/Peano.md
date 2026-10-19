# Corelib.Init.Peano

每项对应机械翻译基线中的一个 root。完整 native statement / interface 类型在总 JSON 文件中。



## Corelib.Init.Peano.IsSucc

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Peano.IsSucc

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Peano.IsSucc.roundtrip

## Corelib.Init.Peano.O_S

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Peano.O_S.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.O_S.statement.correspondence

```lean
∀ (n : Nat), ¬Nat.zero = n.succ
```

## Corelib.Init.Peano.eq_S

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Peano.eq_S.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.eq_S.statement.correspondence

```lean
∀ (x y : Nat), x = y → x.succ = y.succ
```

## Corelib.Init.Peano.eq_add_S

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Peano.eq_add_S.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.eq_add_S.statement.correspondence

```lean
∀ (n m : Nat), n.succ = m.succ → n = m
```

## Corelib.Init.Peano.f_equal2_mult

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Peano.f_equal2_mult.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.f_equal2_mult.statement.correspondence

```lean
∀ (x1 y1 x2 y2 : Nat), x1 = y1 → x2 = y2 → x1 * x2 = y1 * y2
```

## Corelib.Init.Peano.f_equal2_nat

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Peano.f_equal2_nat.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.f_equal2_nat.statement.correspondence

```lean
∀ (B : Sort u_Corelib_Init_Logic_109) (f : Nat → Nat → B) (x1 y1 x2 y2 : Nat), x1 = y1 → x2 = y2 → f x1 x2 = f y1 y2
```

## Corelib.Init.Peano.f_equal2_plus

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Peano.f_equal2_plus.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.f_equal2_plus.statement.correspondence

```lean
∀ (x1 y1 x2 y2 : Nat), x1 = y1 → x2 = y2 → x1 + x2 = y1 + y2
```

## Corelib.Init.Peano.f_equal_nat

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Peano.f_equal_nat.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.f_equal_nat.statement.correspondence

```lean
∀ (B : Sort u_Corelib_Init_Logic_46) (f : Nat → B) (x y : Nat), x = y → f x = f y
```

## Corelib.Init.Peano.f_equal_pred

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Peano.f_equal_pred.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.f_equal_pred.statement.correspondence

```lean
∀ (x y : Nat), x = y → Rocq.Corelib.Init.Nat.pred x = Rocq.Corelib.Init.Nat.pred y
```

残留源符号：Rocq.Corelib.Init.Nat.pred

## Corelib.Init.Peano.ge

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Peano.ge

操作/类型证书：NativeBridge.peano_ge_agrees

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Peano.ge.roundtrip

## Corelib.Init.Peano.gt

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Peano.gt

操作/类型证书：NativeBridge.peano_gt_agrees

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Peano.gt.roundtrip

## Corelib.Init.Peano.le

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Peano.le

操作/类型证书：NativeBridge.peano_le_agrees

## Corelib.Init.Peano.le_0_n

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Peano.le_0_n.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.le_0_n.statement.correspondence

```lean
∀ (n : Nat), Nat.zero ≤ n
```

## Corelib.Init.Peano.le_S_n

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Peano.le_S_n.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.le_S_n.statement.correspondence

```lean
∀ (n m : Nat), n.succ ≤ m.succ → n ≤ m
```

## Corelib.Init.Peano.le_ind

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Peano.le_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.le_ind.statement.correspondence

```lean
∀ (n : Nat) (P : Nat → Prop), P n → (∀ (m : Nat), n ≤ m → P m → P m.succ) → ∀ (n0 : Nat), n ≤ n0 → P n0
```

## Corelib.Init.Peano.le_n_S

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Peano.le_n_S.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.le_n_S.statement.correspondence

```lean
∀ (n m : Nat), n ≤ m → n.succ ≤ m.succ
```

## Corelib.Init.Peano.le_pred

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Peano.le_pred.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.le_pred.statement.correspondence

```lean
∀ (n m : Nat), n ≤ m → Rocq.Corelib.Init.Nat.pred n ≤ Rocq.Corelib.Init.Nat.pred m
```

残留源符号：Rocq.Corelib.Init.Nat.pred

## Corelib.Init.Peano.le_sind

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Peano.le_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.le_sind.statement.correspondence

```lean
∀ (n : Nat) (P : Nat → Prop), P n → (∀ (m : Nat), n ≤ m → P m → P m.succ) → ∀ (n0 : Nat), n ≤ n0 → P n0
```

## Corelib.Init.Peano.lt

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Peano.lt

操作/类型证书：NativeBridge.peano_lt_agrees

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Peano.lt.roundtrip

## Corelib.Init.Peano.max_l

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Peano.max_l.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.max_l.statement.correspondence

```lean
∀ (n m : Nat), m ≤ n → max n m = n
```

## Corelib.Init.Peano.max_r

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Peano.max_r.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.max_r.statement.correspondence

```lean
∀ (n m : Nat), n ≤ m → max n m = m
```

## Corelib.Init.Peano.min_l

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Peano.min_l.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.min_l.statement.correspondence

```lean
∀ (n m : Nat), n ≤ m → min n m = n
```

## Corelib.Init.Peano.min_r

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Peano.min_r.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.min_r.statement.correspondence

```lean
∀ (n m : Nat), m ≤ n → min n m = m
```

## Corelib.Init.Peano.mult_n_O

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Peano.mult_n_O.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.mult_n_O.statement.correspondence

```lean
∀ (n : Nat), Nat.zero = n * Nat.zero
```

## Corelib.Init.Peano.mult_n_Sm

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Peano.mult_n_Sm.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.mult_n_Sm.statement.correspondence

```lean
∀ (n m : Nat), n * m + n = n * m.succ
```

## Corelib.Init.Peano.n_Sn

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Peano.n_Sn.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.n_Sn.statement.correspondence

```lean
∀ (n : Nat), ¬n = n.succ
```

## Corelib.Init.Peano.nat_case

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Peano.nat_case.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.nat_case.statement.correspondence

```lean
∀ (n : Nat) (P : Nat → Prop), P Nat.zero → (∀ (m : Nat), P m.succ) → P n
```

## Corelib.Init.Peano.nat_double_ind

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Peano.nat_double_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.nat_double_ind.statement.correspondence

```lean
∀ (R : Nat → Nat → Prop),
  (∀ (n : Nat), R Nat.zero n) →
    (∀ (n : Nat), R n.succ Nat.zero) → (∀ (n m : Nat), R n m → R n.succ m.succ) → ∀ (n m : Nat), R n m
```

## Corelib.Init.Peano.nat_rect_plus

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Peano.nat_rect_plus.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.nat_rect_plus.statement.correspondence

```lean
∀ (n m : Nat) (A : Sort u_Corelib_Init_Peano_98) (f : A → A) (x : A),
  Rocq.Corelib.Init.Datatypes.nat_rect (fun n => A) x (fun n => f) (n + m) =
    Rocq.Corelib.Init.Datatypes.nat_rect (fun n => A)
      (Rocq.Corelib.Init.Datatypes.nat_rect (fun n => A) x (fun n => f) m) (fun n => f) n
```

残留源符号：Rocq.Corelib.Init.Datatypes.nat_rect

## Corelib.Init.Peano.nat_rect_succ_r

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Peano.nat_rect_succ_r.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.nat_rect_succ_r.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Peano_92) (f : A → A) (x : A) (n : Nat),
  Rocq.Corelib.Init.Datatypes.nat_rect (fun n => A) x (fun n => f) n.succ =
    Rocq.Corelib.Init.Datatypes.nat_rect (fun n => A) (f x) (fun n => f) n
```

残留源符号：Rocq.Corelib.Init.Datatypes.nat_rect

## Corelib.Init.Peano.not_eq_S

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Peano.not_eq_S.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.not_eq_S.statement.correspondence

```lean
∀ (n m : Nat), ¬n = m → ¬n.succ = m.succ
```

## Corelib.Init.Peano.plus_O_n

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Peano.plus_O_n.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.plus_O_n.statement.correspondence

```lean
∀ (n : Nat), Nat.zero + n = n
```

## Corelib.Init.Peano.plus_Sn_m

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Peano.plus_Sn_m.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.plus_Sn_m.statement.correspondence

```lean
∀ (n m : Nat), n.succ + m = (n + m).succ
```

## Corelib.Init.Peano.plus_n_O

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Peano.plus_n_O.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.plus_n_O.statement.correspondence

```lean
∀ (n : Nat), n = n + Nat.zero
```

## Corelib.Init.Peano.plus_n_Sm

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Peano.plus_n_Sm.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.plus_n_Sm.statement.correspondence

```lean
∀ (n m : Nat), (n + m).succ = n + m.succ
```

## Corelib.Init.Peano.pred_Sn

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Peano.pred_Sn.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Peano.pred_Sn.statement.correspondence

```lean
∀ (n : Nat), n = Rocq.Corelib.Init.Nat.pred n.succ
```

残留源符号：Rocq.Corelib.Init.Nat.pred
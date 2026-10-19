# Corelib.Init.Logic

每项对应机械翻译基线中的一个 root。完整 native statement / interface 类型在总 JSON 文件中。



## Corelib.Init.Logic.False

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Logic.False

操作/类型证书：NativeBridge.false_agrees

## Corelib.Init.Logic.False_ind

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.False_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.False_ind.statement.correspondence

```lean
∀ (P : Prop), False → P
```

## Corelib.Init.Logic.False_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Logic.False_rec

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Logic.False

## Corelib.Init.Logic.False_rect

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Logic.False_rect

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Logic.False

## Corelib.Init.Logic.False_sind

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.False_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.False_sind.statement.correspondence

```lean
∀ (P : Prop), False → P
```

## Corelib.Init.Logic.True

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Logic.True

操作/类型证书：NativeBridge.true_agrees

## Corelib.Init.Logic.True_ind

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.True_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.True_ind.statement.correspondence

```lean
∀ (P : Prop), P → True → P
```

## Corelib.Init.Logic.True_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Logic.True_rec

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Logic.True

## Corelib.Init.Logic.True_rect

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Logic.True_rect

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Logic.True

## Corelib.Init.Logic.True_sind

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.True_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.True_sind.statement.correspondence

```lean
∀ (P : Prop), P → True → P
```

## Corelib.Init.Logic.absurd

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.absurd.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.absurd.statement.correspondence

```lean
∀ (A C : Prop), A → ¬A → C
```

## Corelib.Init.Logic.all

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Logic.all

操作/类型证书：NativeBridge.all_agrees

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Logic.all.roundtrip

## Corelib.Init.Logic.and

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Logic.and

操作/类型证书：NativeBridge.and_agrees

## Corelib.Init.Logic.and_assoc

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.and_assoc.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.and_assoc.statement.correspondence

```lean
∀ (A B C : Prop), (A ∧ B) ∧ C ↔ A ∧ B ∧ C
```

## Corelib.Init.Logic.and_cancel_l

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.and_cancel_l.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.and_cancel_l.statement.correspondence

```lean
∀ (A B C : Prop), (B → A) → (C → A) → ((A ∧ B ↔ A ∧ C) ↔ (B ↔ C))
```

## Corelib.Init.Logic.and_cancel_r

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.and_cancel_r.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.and_cancel_r.statement.correspondence

```lean
∀ (A B C : Prop), (B → A) → (C → A) → ((B ∧ A ↔ C ∧ A) ↔ (B ↔ C))
```

## Corelib.Init.Logic.and_comm

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.and_comm.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.and_comm.statement.correspondence

```lean
∀ (A B : Prop), A ∧ B ↔ B ∧ A
```

## Corelib.Init.Logic.and_iff_compat_l

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.and_iff_compat_l.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.and_iff_compat_l.statement.correspondence

```lean
∀ (A B C : Prop), (B ↔ C) → (A ∧ B ↔ A ∧ C)
```

## Corelib.Init.Logic.and_iff_compat_r

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.and_iff_compat_r.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.and_iff_compat_r.statement.correspondence

```lean
∀ (A B C : Prop), (B ↔ C) → (B ∧ A ↔ C ∧ A)
```

## Corelib.Init.Logic.and_ind

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.and_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.and_ind.statement.correspondence

```lean
∀ (A B P : Prop), (A → B → P) → A ∧ B → P
```

## Corelib.Init.Logic.and_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Logic.and_rec

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Logic.and A B

## Corelib.Init.Logic.and_rect

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Logic.and_rect

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Logic.and A B

## Corelib.Init.Logic.and_sind

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.and_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.and_sind.statement.correspondence

```lean
∀ (A B P : Prop), (A → B → P) → A ∧ B → P
```

## Corelib.Init.Logic.eq

状态：BOOTSTRAP_EQ。翻译器已复用 Lean Eq；并非另建相等关系。

原始目标：Eq

## Corelib.Init.Logic.eq_ex

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex.statement

## Corelib.Init.Logic.eq_ex2

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex2.statement

## Corelib.Init.Logic.eq_ex2_eta

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex2_eta.statement

## Corelib.Init.Logic.eq_ex2_hprop

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex2_hprop.statement

## Corelib.Init.Logic.eq_ex2_hprop_iff

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex2_hprop_iff.statement

## Corelib.Init.Logic.eq_ex2_ind

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex2_ind.statement

## Corelib.Init.Logic.eq_ex2_ind_uncurried

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex2_ind_uncurried.statement

## Corelib.Init.Logic.eq_ex2_nondep

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Logic.eq_ex2_nondep.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.eq_ex2_nondep.statement.correspondence

```lean
∀ (A B C : Prop) (u v : ∃ x, B ∧ C), ⋯ = ⋯ → ⋯ = ⋯ → ⋯ = ⋯ → ⋯ = ⋯
```

残留源符号：Rocq.Corelib.Init.Logic.ex2.rec;Rocq.Corelib.Init.Logic.ex2

## Corelib.Init.Logic.eq_ex2_rec

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex2_rec

## Corelib.Init.Logic.eq_ex2_rec_uncurried

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex2_rec_uncurried

## Corelib.Init.Logic.eq_ex2_rect

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex2_rect

## Corelib.Init.Logic.eq_ex2_rect_ex_intro2

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex2_rect_ex_intro2

## Corelib.Init.Logic.eq_ex2_rect_ex_intro2_l

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex2_rect_ex_intro2_l

## Corelib.Init.Logic.eq_ex2_rect_ex_intro2_r

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex2_rect_ex_intro2_r

## Corelib.Init.Logic.eq_ex2_rect_uncurried

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex2_rect_uncurried

## Corelib.Init.Logic.eq_ex2_uncurried

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex2_uncurried.statement

## Corelib.Init.Logic.eq_ex2_uncurried_iff

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex2_uncurried_iff.statement

## Corelib.Init.Logic.eq_ex_eta

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex_eta.statement

## Corelib.Init.Logic.eq_ex_hprop

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Logic.eq_ex_hprop.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.eq_ex_hprop.statement.correspondence

```lean
∀ (A : Prop) (P : A → Prop), (∀ (x : A) (p q : P x), p = q) → ∀ (u v : ∃ a, P a), ⋯ = ⋯ → ⋯ = ⋯
```

残留源符号：Rocq.Corelib.Init.Logic.ex.rec;Rocq.Corelib.Init.Logic.ex

## Corelib.Init.Logic.eq_ex_hprop_iff

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Logic.eq_ex_hprop_iff.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.eq_ex_hprop_iff.statement.correspondence

```lean
∀ (A : Prop) (P : A → Prop), (∀ (x : A) (p q : P x), p = q) → ∀ (u v : ∃ a, P a), ⋯ = ⋯ ↔ ⋯ = ⋯
```

残留源符号：Rocq.Corelib.Init.Logic.ex;Rocq.Corelib.Init.Logic.ex.rec

## Corelib.Init.Logic.eq_ex_ind

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex_ind.statement

## Corelib.Init.Logic.eq_ex_ind_uncurried

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex_ind_uncurried.statement

## Corelib.Init.Logic.eq_ex_intro

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex_intro.statement

## Corelib.Init.Logic.eq_ex_intro2

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex_intro2.statement

## Corelib.Init.Logic.eq_ex_intro2_hprop

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex_intro2_hprop.statement

## Corelib.Init.Logic.eq_ex_intro2_hprop_nondep

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex_intro2_hprop_nondep.statement

## Corelib.Init.Logic.eq_ex_intro2_l

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex_intro2_l.statement

## Corelib.Init.Logic.eq_ex_intro2_r

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex_intro2_r.statement

## Corelib.Init.Logic.eq_ex_intro2_uncurried

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex_intro2_uncurried.statement

## Corelib.Init.Logic.eq_ex_intro_hprop

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex_intro_hprop.statement

## Corelib.Init.Logic.eq_ex_intro_l

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex_intro_l.statement

## Corelib.Init.Logic.eq_ex_intro_r

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex_intro_r.statement

## Corelib.Init.Logic.eq_ex_intro_uncurried

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex_intro_uncurried.statement

## Corelib.Init.Logic.eq_ex_rec

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex_rec

## Corelib.Init.Logic.eq_ex_rec_uncurried

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex_rec_uncurried

## Corelib.Init.Logic.eq_ex_rect

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex_rect

## Corelib.Init.Logic.eq_ex_rect_ex_intro

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex_rect_ex_intro

## Corelib.Init.Logic.eq_ex_rect_ex_intro_l

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex_rect_ex_intro_l

## Corelib.Init.Logic.eq_ex_rect_ex_intro_r

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex_rect_ex_intro_r

## Corelib.Init.Logic.eq_ex_rect_uncurried

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex_rect_uncurried

## Corelib.Init.Logic.eq_ex_uncurried

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex_uncurried.statement

## Corelib.Init.Logic.eq_ex_uncurried_iff

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_ex_uncurried_iff.statement

## Corelib.Init.Logic.eq_id_comm_l

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_id_comm_l.statement

## Corelib.Init.Logic.eq_id_comm_r

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_id_comm_r.statement

## Corelib.Init.Logic.eq_ind

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.eq_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.eq_ind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_22) (x : A) (P : A → Prop), P x → ∀ (a : A), x = a → P a
```

## Corelib.Init.Logic.eq_ind_r

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.eq_ind_r.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.eq_ind_r.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_61) (x : A) (P : A → Prop), P x → ∀ (y : A), y = x → P y
```

## Corelib.Init.Logic.eq_rec

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Logic.eq_rec

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Logic.eq_rec.roundtrip

## Corelib.Init.Logic.eq_rec_r

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_rec_r

## Corelib.Init.Logic.eq_rect

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Logic.eq_rect

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Logic.eq_rect.roundtrip

## Corelib.Init.Logic.eq_rect_r

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_rect_r

## Corelib.Init.Logic.eq_refl_map_distr

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_refl_map_distr.statement

## Corelib.Init.Logic.eq_rew

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Logic.eq_rew

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Logic.eq_rew.roundtrip

## Corelib.Init.Logic.eq_rew_dep

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Logic.eq_rew_dep

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Logic.eq_rew_dep.roundtrip

## Corelib.Init.Logic.eq_rew_fwd_dep

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Logic.eq_rew_fwd_dep

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Logic.eq_rew_fwd_dep.roundtrip

## Corelib.Init.Logic.eq_rew_fwd_r_dep

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Logic.eq_rew_fwd_r_dep

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Logic.eq_rew_fwd_r_dep.roundtrip

## Corelib.Init.Logic.eq_rew_r

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Logic.eq_rew_r

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Logic.eq_rew_r.roundtrip

## Corelib.Init.Logic.eq_rew_r_dep

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_rew_r_dep

## Corelib.Init.Logic.eq_sind

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.eq_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.eq_sind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_24) (x : A) (P : A → Prop), P x → ∀ (a : A), x = a → P a
```

## Corelib.Init.Logic.eq_sind_r

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.eq_sind_r.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.eq_sind_r.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_59) (x : A) (P : A → Prop), P x → ∀ (y : A), y = x → P y
```

## Corelib.Init.Logic.eq_stepl

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.eq_stepl.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.eq_stepl.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_383) (x y z : A), x = y → x = z → z = y
```

## Corelib.Init.Logic.eq_sym

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.eq_sym.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.eq_sym.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_31) (x y : A), x = y → y = x
```

## Corelib.Init.Logic.eq_sym_involutive

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_sym_involutive.statement

## Corelib.Init.Logic.eq_sym_map_distr

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_sym_map_distr.statement

## Corelib.Init.Logic.eq_trans

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.eq_trans.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.eq_trans.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_45) (x y z : A), x = y → y = z → x = z
```

## Corelib.Init.Logic.eq_trans_assoc

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_trans_assoc.statement

## Corelib.Init.Logic.eq_trans_map

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_trans_map.statement

## Corelib.Init.Logic.eq_trans_map_distr

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_trans_map_distr.statement

## Corelib.Init.Logic.eq_trans_r

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.eq_trans_r.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.eq_trans_r.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_45) (x y z : A), x = y → z = y → x = z
```

## Corelib.Init.Logic.eq_trans_refl_l

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_trans_refl_l.statement

## Corelib.Init.Logic.eq_trans_refl_r

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_trans_refl_r.statement

## Corelib.Init.Logic.eq_trans_rew_distr

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_trans_rew_distr.statement

## Corelib.Init.Logic.eq_trans_sym_distr

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_trans_sym_distr.statement

## Corelib.Init.Logic.eq_trans_sym_inv_l

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_trans_sym_inv_l.statement

## Corelib.Init.Logic.eq_trans_sym_inv_r

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.eq_trans_sym_inv_r.statement

## Corelib.Init.Logic.ex

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Logic.ex

操作/类型证书：NativeBridge.ex_agrees

## Corelib.Init.Logic.ex2

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Logic.ex2

操作/类型证书：NativeBridge.ex2_agrees

## Corelib.Init.Logic.ex2_eta

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.ex2_eta.statement

## Corelib.Init.Logic.ex2_ind

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.ex2_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.ex2_ind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_11) (P Q : A → Prop) (P0 : Prop), (∀ (x : A), P x → Q x → P0) → (∃ x, P x ∧ Q x) → P0
```

## Corelib.Init.Logic.ex2_rec

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.ex2_rec

## Corelib.Init.Logic.ex2_rect

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.ex2_rect

## Corelib.Init.Logic.ex2_sind

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.ex2_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.ex2_sind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_12) (P Q : A → Prop) (P0 : Prop), (∀ (x : A), P x → Q x → P0) → (∃ x, P x ∧ Q x) → P0
```

## Corelib.Init.Logic.ex_eta

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.ex_eta.statement

## Corelib.Init.Logic.ex_ind

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.ex_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.ex_ind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_6) (P : A → Prop) (P0 : Prop), (∀ (x : A), P x → P0) → (∃ x, P x) → P0
```

## Corelib.Init.Logic.ex_of_ex2

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.ex_of_ex2.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.ex_of_ex2.statement.correspondence

```lean
∀ (A : Prop) (P Q : A → Prop), (∃ x, P x ∧ Q x) → ∃ x, P x
```

## Corelib.Init.Logic.ex_of_ex2_eq

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.ex_of_ex2_eq.statement

## Corelib.Init.Logic.ex_proj1

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.ex_proj1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.ex_proj1.statement.correspondence

```lean
∀ (A : Prop) (P : A → Prop), (∃ x, P x) → A
```

## Corelib.Init.Logic.ex_proj1_eq

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Logic.ex_proj1_eq.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.ex_proj1_eq.statement.correspondence

```lean
∀ (A : Prop) (P : A → Prop) (u v : ∃ a, P a), ⋯ = ⋯ → ⋯ = ⋯
```

残留源符号：Rocq.Corelib.Init.Logic.ex;Rocq.Corelib.Init.Logic.ex.rec

## Corelib.Init.Logic.ex_proj1_of_ex2_eq

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Logic.ex_proj1_of_ex2_eq.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.ex_proj1_of_ex2_eq.statement.correspondence

```lean
∀ (A : Prop) (P Q : A → Prop) (u v : ∃ x, P x ∧ Q x), ⋯ = ⋯ → ⋯ = ⋯
```

残留源符号：Rocq.Corelib.Init.Logic.ex2;Rocq.Corelib.Init.Logic.ex2.rec

## Corelib.Init.Logic.ex_proj2

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Logic.ex_proj2.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.ex_proj2.statement.correspondence

```lean
∀ (A : Prop) (P : A → Prop) (x : ∃ x, P x), P ⋯
```

残留源符号：Rocq.Corelib.Init.Logic.ex.rec;Rocq.Corelib.Init.Logic.ex

## Corelib.Init.Logic.ex_proj2_eq

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.ex_proj2_eq.statement

## Corelib.Init.Logic.ex_proj2_of_ex2_eq

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.ex_proj2_of_ex2_eq.statement

## Corelib.Init.Logic.ex_proj3

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Logic.ex_proj3.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.ex_proj3.statement.correspondence

```lean
∀ (A : Prop) (P Q : A → Prop) (x : ∃ x, P x ∧ Q x), Q ⋯
```

残留源符号：Rocq.Corelib.Init.Logic.ex2.rec;Rocq.Corelib.Init.Logic.ex2

## Corelib.Init.Logic.ex_proj3_eq

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.ex_proj3_eq.statement

## Corelib.Init.Logic.ex_rec

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.ex_rec

## Corelib.Init.Logic.ex_rect

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.ex_rect

## Corelib.Init.Logic.ex_sind

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.ex_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.ex_sind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_7) (P : A → Prop) (P0 : Prop), (∀ (x : A), P x → P0) → (∃ x, P x) → P0
```

## Corelib.Init.Logic.exists_inhabited

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.exists_inhabited.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.exists_inhabited.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_374) (P : A → Prop), (∃ x, P x) → Nonempty A
```

## Corelib.Init.Logic.f_equal

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.f_equal.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.f_equal.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_45) (B : Sort u_Corelib_Init_Logic_46) (f : A → B) (x y : A), x = y → f x = f y
```

## Corelib.Init.Logic.f_equal2

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.f_equal2.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.f_equal2.statement.correspondence

```lean
∀ (A1 : Sort u_Corelib_Init_Logic_107) (A2 : Sort u_Corelib_Init_Logic_108) (B : Sort u_Corelib_Init_Logic_109)
  (f : A1 → A2 → B) (x1 y1 : A1) (x2 y2 : A2), x1 = y1 → x2 = y2 → f x1 x2 = f y1 y2
```

## Corelib.Init.Logic.f_equal3

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.f_equal3.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.f_equal3.statement.correspondence

```lean
∀ (A1 : Sort u_Corelib_Init_Logic_114) (A2 : Sort u_Corelib_Init_Logic_115) (A3 : Sort u_Corelib_Init_Logic_116)
  (B : Sort u_Corelib_Init_Logic_117) (f : A1 → A2 → A3 → B) (x1 y1 : A1) (x2 y2 : A2) (x3 y3 : A3),
  x1 = y1 → x2 = y2 → x3 = y3 → f x1 x2 x3 = f y1 y2 y3
```

## Corelib.Init.Logic.f_equal4

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.f_equal4.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.f_equal4.statement.correspondence

```lean
∀ (A1 : Sort u_Corelib_Init_Logic_123) (A2 : Sort u_Corelib_Init_Logic_124) (A3 : Sort u_Corelib_Init_Logic_125)
  (A4 : Sort u_Corelib_Init_Logic_126) (B : Sort u_Corelib_Init_Logic_127) (f : A1 → A2 → A3 → A4 → B) (x1 y1 : A1)
  (x2 y2 : A2) (x3 y3 : A3) (x4 y4 : A4), x1 = y1 → x2 = y2 → x3 = y3 → x4 = y4 → f x1 x2 x3 x4 = f y1 y2 y3 y4
```

## Corelib.Init.Logic.f_equal5

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.f_equal5.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.f_equal5.statement.correspondence

```lean
∀ (A1 : Sort u_Corelib_Init_Logic_134) (A2 : Sort u_Corelib_Init_Logic_135) (A3 : Sort u_Corelib_Init_Logic_136)
  (A4 : Sort u_Corelib_Init_Logic_137) (A5 : Sort u_Corelib_Init_Logic_138) (B : Sort u_Corelib_Init_Logic_139)
  (f : A1 → A2 → A3 → A4 → A5 → B) (x1 y1 : A1) (x2 y2 : A2) (x3 y3 : A3) (x4 y4 : A4) (x5 y5 : A5),
  x1 = y1 → x2 = y2 → x3 = y3 → x4 = y4 → x5 = y5 → f x1 x2 x3 x4 x5 = f y1 y2 y3 y4 y5
```

## Corelib.Init.Logic.f_equal_compose

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.f_equal_compose.statement

## Corelib.Init.Logic.f_equal_dep

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Logic.f_equal_dep.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.f_equal_dep.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_68) (B : A → Sort u_Corelib_Init_Logic_69) (f : (x : A) → B x) (x y : A) (H : x = y),
  Rocq.Corelib.Init.Logic.eq_rect A x B (f x) y H = f y
```

残留源符号：Rocq.Corelib.Init.Logic.eq_rect

## Corelib.Init.Logic.f_equal_dep2

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.f_equal_dep2.statement

## Corelib.Init.Logic.forall_exists_coincide_unique_domain

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Logic.forall_exists_coincide_unique_domain.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.forall_exists_coincide_unique_domain.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_361) (P : A → Prop),
  (∀ (Q : A → Prop), (∀ (x : A), P x → Q x) ↔ ∃ x, P x ∧ Q x) → ∃ x, Rocq.Corelib.Init.Logic.unique A (fun x => P x) x
```

残留源符号：Rocq.Corelib.Init.Logic.unique

## Corelib.Init.Logic.forall_exists_unique_domain_coincide

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Logic.forall_exists_unique_domain_coincide.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.forall_exists_unique_domain_coincide.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_354) (P : A → Prop),
  (∃ x, Rocq.Corelib.Init.Logic.unique A (fun x => P x) x) → ∀ (Q : A → Prop), (∀ (x : A), P x → Q x) ↔ ∃ x, P x ∧ Q x
```

残留源符号：Rocq.Corelib.Init.Logic.unique

## Corelib.Init.Logic.gen

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.gen.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.gen.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_18) (P : A → Prop) (B : Prop), (∀ (y : A), B → P y) → B → ∀ (x : A), P x
```

## Corelib.Init.Logic.iff

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Logic.iff

操作/类型证书：NativeBridge.iff_agrees

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Logic.iff.roundtrip

## Corelib.Init.Logic.iff_and

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.iff_and.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.iff_and.statement.correspondence

```lean
∀ (A B : Prop), (A ↔ B) → (A → B) ∧ (B → A)
```

## Corelib.Init.Logic.iff_refl

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.iff_refl.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.iff_refl.statement.correspondence

```lean
∀ (A : Prop), A ↔ A
```

## Corelib.Init.Logic.iff_stepl

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.iff_stepl.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.iff_stepl.statement.correspondence

```lean
∀ (A B C : Prop), (A ↔ B) → (A ↔ C) → (C ↔ B)
```

## Corelib.Init.Logic.iff_sym

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.iff_sym.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.iff_sym.statement.correspondence

```lean
∀ (A B : Prop), (A ↔ B) → (B ↔ A)
```

## Corelib.Init.Logic.iff_to_and

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.iff_to_and.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.iff_to_and.statement.correspondence

```lean
∀ (A B : Prop), (A ↔ B) ↔ (A → B) ∧ (B → A)
```

## Corelib.Init.Logic.iff_trans

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.iff_trans.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.iff_trans.statement.correspondence

```lean
∀ (A B C : Prop), (A ↔ B) → (B ↔ C) → (A ↔ C)
```

## Corelib.Init.Logic.imp_iff_compat_l

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.imp_iff_compat_l.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.imp_iff_compat_l.statement.correspondence

```lean
∀ (A B C : Prop), (B ↔ C) → (A → B ↔ A → C)
```

## Corelib.Init.Logic.imp_iff_compat_r

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.imp_iff_compat_r.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.imp_iff_compat_r.statement.correspondence

```lean
∀ (A B C : Prop), (B ↔ C) → (B → A ↔ C → A)
```

## Corelib.Init.Logic.inhabited

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Logic.inhabited

操作/类型证书：NativeBridge.inhabited_agrees

## Corelib.Init.Logic.inhabited_covariant

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.inhabited_covariant.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.inhabited_covariant.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_378) (B : Sort u_Corelib_Init_Logic_379) (a : A → B), Nonempty A → Nonempty B
```

## Corelib.Init.Logic.inhabited_ind

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.inhabited_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.inhabited_ind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_370) (P : Prop), (∀ (a : A), P) → Nonempty A → P
```

## Corelib.Init.Logic.inhabited_sind

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.inhabited_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.inhabited_sind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_371) (P : Prop), (∀ (a : A), P) → Nonempty A → P
```

## Corelib.Init.Logic.inst

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.inst.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.inst.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_18) (P : A → Prop) (x : A), (∀ (x : A), P x) → P x
```

## Corelib.Init.Logic.map_subst

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Logic.map_subst.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.map_subst.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_215) (P : A → Sort u_Corelib_Init_Logic_216) (Q : A → Sort u_Corelib_Init_Logic_217)
  (f : (x : A) → P x → Q x) (x y : A) (H : x = y) (z : P x),
  Rocq.Corelib.Init.Logic.eq_rect A x Q (f x z) y H = f y (Rocq.Corelib.Init.Logic.eq_rect A x P z y H)
```

残留源符号：Rocq.Corelib.Init.Logic.eq_rect

## Corelib.Init.Logic.map_subst_map

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.map_subst_map.statement

## Corelib.Init.Logic.neg_false

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.neg_false.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.neg_false.statement.correspondence

```lean
∀ (A : Prop), ¬A ↔ (A ↔ False)
```

## Corelib.Init.Logic.not

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Logic.not

操作/类型证书：NativeBridge.not_agrees

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Logic.not.roundtrip

## Corelib.Init.Logic.notT

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Logic.notT

操作/类型证书：NativeBridge.notT_agrees

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Logic.notT.roundtrip

## Corelib.Init.Logic.not_eq_sym

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.not_eq_sym.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.not_eq_sym.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_45) (x y : A), ¬x = y → ¬y = x
```

## Corelib.Init.Logic.not_iff_compat

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.not_iff_compat.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.not_iff_compat.statement.correspondence

```lean
∀ (A B : Prop), (A ↔ B) → (¬A ↔ ¬B)
```

## Corelib.Init.Logic.or

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Logic.or

操作/类型证书：NativeBridge.or_agrees

## Corelib.Init.Logic.or_assoc

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.or_assoc.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.or_assoc.statement.correspondence

```lean
∀ (A B C : Prop), (A ∨ B) ∨ C ↔ A ∨ B ∨ C
```

## Corelib.Init.Logic.or_cancel_l

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.or_cancel_l.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.or_cancel_l.statement.correspondence

```lean
∀ (A B C : Prop), (B → ¬A) → (C → ¬A) → ((A ∨ B ↔ A ∨ C) ↔ (B ↔ C))
```

## Corelib.Init.Logic.or_cancel_r

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.or_cancel_r.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.or_cancel_r.statement.correspondence

```lean
∀ (A B C : Prop), (B → ¬A) → (C → ¬A) → ((B ∨ A ↔ C ∨ A) ↔ (B ↔ C))
```

## Corelib.Init.Logic.or_comm

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.or_comm.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.or_comm.statement.correspondence

```lean
∀ (A B : Prop), A ∨ B ↔ B ∨ A
```

## Corelib.Init.Logic.or_iff_compat_l

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.or_iff_compat_l.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.or_iff_compat_l.statement.correspondence

```lean
∀ (A B C : Prop), (B ↔ C) → (A ∨ B ↔ A ∨ C)
```

## Corelib.Init.Logic.or_iff_compat_r

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.or_iff_compat_r.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.or_iff_compat_r.statement.correspondence

```lean
∀ (A B C : Prop), (B ↔ C) → (B ∨ A ↔ C ∨ A)
```

## Corelib.Init.Logic.or_ind

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.or_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.or_ind.statement.correspondence

```lean
∀ (A B P : Prop), (A → P) → (B → P) → A ∨ B → P
```

## Corelib.Init.Logic.or_sind

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.or_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.or_sind.statement.correspondence

```lean
∀ (A B P : Prop), (A → P) → (B → P) → A ∨ B → P
```

## Corelib.Init.Logic.proj1

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.proj1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.proj1.statement.correspondence

```lean
∀ (A B : Prop), A ∧ B → A
```

## Corelib.Init.Logic.proj2

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.Init.Logic.proj2.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.proj2.statement.correspondence

```lean
∀ (A B : Prop), A ∧ B → B
```

## Corelib.Init.Logic.rew_compose

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.rew_compose.statement

## Corelib.Init.Logic.rew_const

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Logic.rew_const.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.rew_const.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_333) (P : Sort u_Corelib_Init_Logic_335) (x y : A) (e : x = y) (k : P),
  Rocq.Corelib.Init.Logic.eq_rect A x (fun a => P) k y e = k
```

残留源符号：Rocq.Corelib.Init.Logic.eq_rect

## Corelib.Init.Logic.rew_ex

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.rew_ex.statement

## Corelib.Init.Logic.rew_ex2

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.rew_ex2.statement

## Corelib.Init.Logic.rew_map

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.rew_map.statement

## Corelib.Init.Logic.rew_opp_l

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.rew_opp_l.statement

## Corelib.Init.Logic.rew_opp_r

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.rew_opp_r.statement

## Corelib.Init.Logic.rew_swap

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Logic.rew_swap.statement

## Corelib.Init.Logic.subrelation

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Logic.subrelation

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Logic.subrelation.roundtrip

## Corelib.Init.Logic.unique

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Logic.unique

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Logic.unique.roundtrip

## Corelib.Init.Logic.unique_existence

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Logic.unique_existence.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Logic.unique_existence.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_348) (P : A → Prop),
  (∃ x, P x) ∧ Rocq.Corelib.Init.Logic.uniqueness A P ↔ ∃ x, Rocq.Corelib.Init.Logic.unique A (fun x => P x) x
```

残留源符号：Rocq.Corelib.Init.Logic.uniqueness;Rocq.Corelib.Init.Logic.unique

## Corelib.Init.Logic.uniqueness

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Logic.uniqueness

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Logic.uniqueness.roundtrip
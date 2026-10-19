# Corelib.Init.Wf

每项对应机械翻译基线中的一个 root。完整 native statement / interface 类型在总 JSON 文件中。



## Corelib.Init.Wf.Acc

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Wf.Acc

## Corelib.Init.Wf.Acc_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Wf.Acc_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Wf.Acc_ind.statement.correspondence

```lean
∀ (A : Type u_Corelib_Init_Wf_11) (R : A → A → Prop) (P : A → Prop),
  (∀ (x : A), (∀ (y : A), R y x → Rocq.Corelib.Init.Wf.Acc A R y) → (∀ (y : A), R y x → P y) → P x) →
    ∀ (x : A), Rocq.Corelib.Init.Wf.Acc A R x → P x
```

残留源符号：Rocq.Corelib.Init.Wf.Acc

## Corelib.Init.Wf.Acc_intro_generator

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Wf.Acc_intro_generator.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Wf.Acc_intro_generator.statement.correspondence

```lean
∀ (A : Type u_Corelib_Init_Wf_11) (R : A → A → Prop) (n : Nat),
  Rocq.Corelib.Init.Wf.well_founded A R → Rocq.Corelib.Init.Wf.well_founded A R
```

残留源符号：Rocq.Corelib.Init.Wf.well_founded

## Corelib.Init.Wf.Acc_inv

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Wf.Acc_inv.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Wf.Acc_inv.statement.correspondence

```lean
∀ (A : Type u_Corelib_Init_Wf_11) (R : A → A → Prop) (x : A),
  Rocq.Corelib.Init.Wf.Acc A R x → ∀ (y : A), R y x → Rocq.Corelib.Init.Wf.Acc A R y
```

残留源符号：Rocq.Corelib.Init.Wf.Acc

## Corelib.Init.Wf.Acc_inv_dep

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Wf.Acc_inv_dep.statement

## Corelib.Init.Wf.Acc_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Wf.Acc_rec

接口未覆盖原因：No registered type bijection for (x : A) →
  (∀ (y : A), R y x → Rocq.Corelib.Init.Wf.Acc A R y) → ((y : A) → R y x → P y) → P x

## Corelib.Init.Wf.Acc_rect

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Wf.Acc_rect

接口未覆盖原因：No registered type bijection for (x : A) →
  (∀ (y : A), R y x → Rocq.Corelib.Init.Wf.Acc A R y) → ((y : A) → R y x → P y) → P x

## Corelib.Init.Wf.Acc_sind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Wf.Acc_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Wf.Acc_sind.statement.correspondence

```lean
∀ (A : Type u_Corelib_Init_Wf_11) (R : A → A → Prop) (P : A → Prop),
  (∀ (x : A), (∀ (y : A), R y x → Rocq.Corelib.Init.Wf.Acc A R y) → (∀ (y : A), R y x → P y) → P x) →
    ∀ (x : A), Rocq.Corelib.Init.Wf.Acc A R x → P x
```

残留源符号：Rocq.Corelib.Init.Wf.Acc

## Corelib.Init.Wf.Fix

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Wf.Fix

接口未覆盖原因：No registered type bijection for ∀ (a : A), Rocq.Corelib.Init.Wf.Acc A R a

## Corelib.Init.Wf.Fix_F

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Wf.Fix_F

接口未覆盖原因：No registered type bijection for (x : A) → Rocq.Corelib.Init.Wf.Acc A R x → P x

## Corelib.Init.Wf.Fix_F_2

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Wf.Fix_F_2

接口未覆盖原因：No registered type bijection for (R :
    Rocq.Corelib.Init.Datatypes.prod A B → Rocq.Corelib.Init.Datatypes.prod A B → Prop) →
  (P : A → B → Type u_Corelib_Init_Wf_31) →
    ((x : A) →
        (x' : B) →
          ((y : A) →
              (y' : B) →
                R (Rocq.Corelib.Init.Datatypes.prod.pair A B y y') (Rocq.Corelib.Init.Datatypes.prod.pair A B x x') →
                  P y y') →
            P x x') →
      (x : A) →
        (x' : B) →
          Rocq.Corelib.Init.Wf.Acc (Rocq.Corelib.Init.Datatypes.prod A B) R
              (Rocq.Corelib.Init.Datatypes.prod.pair A B x x') →
            P x x'

## Corelib.Init.Wf.Fix_F_eq

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Wf.Fix_F_eq.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Wf.Fix_F_eq.statement.correspondence

```lean
∀ (A : Type u_Corelib_Init_Wf_11) (R : A → A → Prop) (P : A → Type u_Corelib_Init_Wf_14)
  (F : (x : A) → ((y : A) → R y x → P y) → P x) (x : A) (r : Rocq.Corelib.Init.Wf.Acc A R x),
  (F x fun y p => Rocq.Corelib.Init.Wf.Fix_F A R P F y ⋯) = Rocq.Corelib.Init.Wf.Fix_F A R P F x r
```

残留源符号：Rocq.Corelib.Init.Wf.Acc;Rocq.Corelib.Init.Wf.Fix_F;Rocq.Corelib.Init.Wf.Acc.rec;Rocq.Corelib.Init.Wf.Acc.Acc_intro

## Corelib.Init.Wf.Fix_F_inv

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Wf.Fix_F_inv.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Wf.Fix_F_inv.statement.correspondence

```lean
∀ (A : Type u_Corelib_Init_Wf_11) (R : A → A → Prop),
  Rocq.Corelib.Init.Wf.well_founded A R →
    ∀ (P : A → Type u_Corelib_Init_Wf_14) (F : (x : A) → ((y : A) → R y x → P y) → P x),
      (∀ (x : A) (f g : (y : A) → R y x → P y), (∀ (y : A) (p : R y x), f y p = g y p) → F x f = F x g) →
        ∀ (x : A) (r s : Rocq.Corelib.Init.Wf.Acc A R x),
          Rocq.Corelib.Init.Wf.Fix_F A R P F x r = Rocq.Corelib.Init.Wf.Fix_F A R P F x s
```

残留源符号：Rocq.Corelib.Init.Wf.well_founded;Rocq.Corelib.Init.Wf.Acc;Rocq.Corelib.Init.Wf.Fix_F

## Corelib.Init.Wf.Fix_F_inv_gen

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Wf.Fix_F_inv_gen.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Wf.Fix_F_inv_gen.statement.correspondence

```lean
∀ (A : Type u_Corelib_Init_Wf_11) (R : A → A → Prop),
  Rocq.Corelib.Init.Wf.well_founded A R →
    ∀ (P : A → Type u_Corelib_Init_Wf_14) (F : (x : A) → ((y : A) → R y x → P y) → P x),
      (∀ (x : A) (f g : (y : A) → R y x → P y), (∀ (y : A) (p q : R y x), f y p = g y q) → F x f = F x g) →
        ∀ (x : A) (r s : Rocq.Corelib.Init.Wf.Acc A R x),
          Rocq.Corelib.Init.Wf.Fix_F A R P F x r = Rocq.Corelib.Init.Wf.Fix_F A R P F x s
```

残留源符号：Rocq.Corelib.Init.Wf.well_founded;Rocq.Corelib.Init.Wf.Acc;Rocq.Corelib.Init.Wf.Fix_F

## Corelib.Init.Wf.Fix_eq

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Wf.Fix_eq.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Wf.Fix_eq.statement.correspondence

```lean
∀ (A : Type u_Corelib_Init_Wf_11) (R : A → A → Prop) (Rwf : Rocq.Corelib.Init.Wf.well_founded A R)
  (P : A → Type u_Corelib_Init_Wf_14) (F : (x : A) → ((y : A) → R y x → P y) → P x),
  (∀ (x : A) (f g : (y : A) → R y x → P y), (∀ (y : A) (p : R y x), f y p = g y p) → F x f = F x g) →
    ∀ (x : A), Rocq.Corelib.Init.Wf.Fix A R Rwf P F x = F x fun y p => Rocq.Corelib.Init.Wf.Fix A R Rwf P F y
```

残留源符号：Rocq.Corelib.Init.Wf.well_founded;Rocq.Corelib.Init.Wf.Fix

## Corelib.Init.Wf.Fix_eq_gen

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Wf.Fix_eq_gen.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Wf.Fix_eq_gen.statement.correspondence

```lean
∀ (A : Type u_Corelib_Init_Wf_11) (R : A → A → Prop) (Rwf : Rocq.Corelib.Init.Wf.well_founded A R)
  (P : A → Type u_Corelib_Init_Wf_14) (F : (x : A) → ((y : A) → R y x → P y) → P x),
  (∀ (x : A) (f g : (y : A) → R y x → P y), (∀ (y : A) (p q : R y x), f y p = g y q) → F x f = F x g) →
    ∀ (x : A), Rocq.Corelib.Init.Wf.Fix A R Rwf P F x = F x fun y p => Rocq.Corelib.Init.Wf.Fix A R Rwf P F y
```

残留源符号：Rocq.Corelib.Init.Wf.well_founded;Rocq.Corelib.Init.Wf.Fix

## Corelib.Init.Wf.well_founded

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Wf.well_founded

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Wf.well_founded.roundtrip

## Corelib.Init.Wf.well_founded_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Wf.well_founded_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Wf.well_founded_ind.statement.correspondence

```lean
∀ (A : Type u_Corelib_Init_Wf_11) (R : A → A → Prop),
  Rocq.Corelib.Init.Wf.well_founded A R → ∀ (P : A → Prop), (∀ (x : A), (∀ (y : A), R y x → P y) → P x) → ∀ (a : A), P a
```

残留源符号：Rocq.Corelib.Init.Wf.well_founded

## Corelib.Init.Wf.well_founded_induction

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Wf.well_founded_induction

接口未覆盖原因：No registered type bijection for ∀ (a : A), Rocq.Corelib.Init.Wf.Acc A R a

## Corelib.Init.Wf.well_founded_induction_type

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Wf.well_founded_induction_type

接口未覆盖原因：No registered type bijection for ∀ (a : A), Rocq.Corelib.Init.Wf.Acc A R a

## Corelib.Init.Wf.well_founded_induction_type_2

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Wf.well_founded_induction_type_2

接口未覆盖原因：No registered type bijection for (R :
    Rocq.Corelib.Init.Datatypes.prod A B → Rocq.Corelib.Init.Datatypes.prod A B → Prop) →
  (P : A → B → Type u_Corelib_Init_Wf_31) →
    Rocq.Corelib.Init.Wf.well_founded (Rocq.Corelib.Init.Datatypes.prod A B) R →
      ((x : A) →
          (x' : B) →
            ((y : A) →
                (y' : B) →
                  R (Rocq.Corelib.Init.Datatypes.prod.pair A B y y') (Rocq.Corelib.Init.Datatypes.prod.pair A B x x') →
                    P y y') →
              P x x') →
        (a : A) → (b : B) → P a b
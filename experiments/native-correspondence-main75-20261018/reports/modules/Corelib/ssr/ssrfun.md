# Corelib.ssr.ssrfun

每项对应机械翻译基线中的一个 root。完整 native statement / interface 类型在总 JSON 文件中。



## Corelib.ssr.ssrfun.Option.apply

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.Option.apply

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.Option.apply.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.ssr.ssrfun.Option.bind

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.Option.bind

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.Option.bind.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.ssr.ssrfun.Option.default

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.Option.default

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.Option.default.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.ssr.ssrfun.Option.lift

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.Option.lift

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.Option.lift.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.ssr.ssrfun.Option.map

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.Option.map

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.Option.map.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.ssr.ssrfun.SimplFunDelta

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrfun.SimplFunDelta

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun aT rT

## Corelib.ssr.ssrfun.Some_inj

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.Some_inj.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.Some_inj.statement.correspondence

```lean
∀ (T : Rocq.Corelib.ssr.ssreflect_rw.NonPropType.type),
  Rocq.Corelib.ssr.ssrfun.injective
    (Rocq.Corelib.Init.Datatypes.option
      (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.callee
        (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.condition (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result T)
          (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test T))
        (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result T) (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.frame T)))
    (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.callee
      (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.condition (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result T)
        (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test T))
      (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result T) (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.frame T))
    (Rocq.Corelib.Init.Datatypes.option.Some
      (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.callee
        (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.condition (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result T)
          (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test T))
        (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result T) (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.frame T)))
```

残留源符号：Rocq.Corelib.ssr.ssreflect_rw.NonPropType.type;Rocq.Corelib.ssr.ssrfun.injective;Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssreflect_rw.NonPropType.callee;Rocq.Corelib.ssr.ssreflect_rw.NonPropType.condition;Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result;Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test;Rocq.Corelib.ssr.ssreflect_rw.NonPropType.frame;Rocq.Corelib.Init.Datatypes.option.Some

## Corelib.ssr.ssrfun.Tagged

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.Tagged

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.Tagged.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.ssr.ssrfun.Tagged2

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.Tagged2

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.Tagged2.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.ssr.ssrfun.all_equal_to

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.all_equal_to

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.all_equal_to.roundtrip

## Corelib.ssr.ssrfun.all_pair

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrfun.all_pair

接口未覆盖原因：No registered type bijection for (i : I) → Rocq.Corelib.Init.Datatypes.prod (T i) (U i)

## Corelib.ssr.ssrfun.all_sig

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrfun.all_sig

## Corelib.ssr.ssrfun.all_sig2

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrfun.all_sig2

## Corelib.ssr.ssrfun.all_tag

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrfun.all_tag

## Corelib.ssr.ssrfun.all_tag2

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrfun.all_tag2

## Corelib.ssr.ssrfun.associative

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.associative

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.associative.roundtrip

## Corelib.ssr.ssrfun.bij_can_bij

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.bij_can_bij.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.bij_can_bij.statement.correspondence

```lean
∀ (A : Type u_Corelib_ssr_ssrfun_582) (B : Type u_Corelib_ssr_ssrfun_583) (f : B → A),
  Rocq.Corelib.ssr.ssrfun.bijective A B f →
    ∀ (f' : A → B), Rocq.Corelib.ssr.ssrfun.cancel A B f f' → Rocq.Corelib.ssr.ssrfun.bijective B A f'
```

残留源符号：Rocq.Corelib.ssr.ssrfun.bijective;Rocq.Corelib.ssr.ssrfun.cancel

## Corelib.ssr.ssrfun.bij_can_eq

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.bij_can_eq.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.bij_can_eq.statement.correspondence

```lean
∀ (A : Type u_Corelib_ssr_ssrfun_571) (B : Type u_Corelib_ssr_ssrfun_572) (f : B → A),
  Rocq.Corelib.ssr.ssrfun.bijective A B f →
    ∀ (f' f'' : A → B),
      Rocq.Corelib.ssr.ssrfun.cancel A B f f' →
        Rocq.Corelib.ssr.ssrfun.cancel A B f f'' → Rocq.Corelib.ssr.ssrfun.eqfun B A f' f''
```

残留源符号：Rocq.Corelib.ssr.ssrfun.bijective;Rocq.Corelib.ssr.ssrfun.cancel;Rocq.Corelib.ssr.ssrfun.eqfun

## Corelib.ssr.ssrfun.bij_can_sym

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.bij_can_sym.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.bij_can_sym.statement.correspondence

```lean
∀ (A : Type u_Corelib_ssr_ssrfun_571) (B : Type u_Corelib_ssr_ssrfun_572) (f : B → A),
  Rocq.Corelib.ssr.ssrfun.bijective A B f →
    ∀ (f' : A → B), Rocq.Corelib.ssr.ssrfun.cancel B A f' f ↔ Rocq.Corelib.ssr.ssrfun.cancel A B f f'
```

残留源符号：Rocq.Corelib.ssr.ssrfun.bijective;Rocq.Corelib.ssr.ssrfun.cancel

## Corelib.ssr.ssrfun.bij_comp

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.bij_comp.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.bij_comp.statement.correspondence

```lean
∀ (A : Type u_Corelib_ssr_ssrfun_582) (B : Type u_Corelib_ssr_ssrfun_583) (C : Type u_Corelib_ssr_ssrfun_584)
  (f : B → A) (h : C → B),
  Rocq.Corelib.ssr.ssrfun.bijective A B f →
    Rocq.Corelib.ssr.ssrfun.bijective B C h →
      Rocq.Corelib.ssr.ssrfun.bijective A C (Rocq.Corelib.ssr.ssrfun.comp A B C f h)
```

残留源符号：Rocq.Corelib.ssr.ssrfun.bijective;Rocq.Corelib.ssr.ssrfun.comp

## Corelib.ssr.ssrfun.bij_inj

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.bij_inj.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.bij_inj.statement.correspondence

```lean
∀ (A : Type u_Corelib_ssr_ssrfun_571) (B : Type u_Corelib_ssr_ssrfun_572) (f : B → A),
  Rocq.Corelib.ssr.ssrfun.bijective A B f → Rocq.Corelib.ssr.ssrfun.injective A B f
```

残留源符号：Rocq.Corelib.ssr.ssrfun.bijective;Rocq.Corelib.ssr.ssrfun.injective

## Corelib.ssr.ssrfun.bijective

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrfun.bijective

## Corelib.ssr.ssrfun.canLR

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.canLR.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.canLR.statement.correspondence

```lean
∀ (rT : Sort u_Corelib_ssr_ssrfun_398) (aT : Sort u_Corelib_ssr_ssrfun_399) (f : aT → rT) (g : rT → aT) (x : rT)
  (y : aT), Rocq.Corelib.ssr.ssrfun.cancel rT aT f g → x = f y → g x = y
```

残留源符号：Rocq.Corelib.ssr.ssrfun.cancel

## Corelib.ssr.ssrfun.canRL

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.canRL.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.canRL.statement.correspondence

```lean
∀ (rT : Sort u_Corelib_ssr_ssrfun_398) (aT : Sort u_Corelib_ssr_ssrfun_399) (f : aT → rT) (g : rT → aT) (x : aT)
  (y : rT), Rocq.Corelib.ssr.ssrfun.cancel rT aT f g → f x = y → x = g y
```

残留源符号：Rocq.Corelib.ssr.ssrfun.cancel

## Corelib.ssr.ssrfun.can_comp

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.can_comp.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.can_comp.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_512) (B : Sort u_Corelib_ssr_ssrfun_513) (C : Sort u_Corelib_ssr_ssrfun_514)
  (f : B → A) (h : C → B) (f' : A → B) (h' : B → C),
  Rocq.Corelib.ssr.ssrfun.cancel A B f f' →
    Rocq.Corelib.ssr.ssrfun.cancel B C h h' →
      Rocq.Corelib.ssr.ssrfun.cancel A C (Rocq.Corelib.ssr.ssrfun.comp A B C f h)
        (Rocq.Corelib.ssr.ssrfun.comp C B A h' f')
```

残留源符号：Rocq.Corelib.ssr.ssrfun.cancel;Rocq.Corelib.ssr.ssrfun.comp

## Corelib.ssr.ssrfun.can_inj

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.can_inj.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.can_inj.statement.correspondence

```lean
∀ (rT : Sort u_Corelib_ssr_ssrfun_398) (aT : Sort u_Corelib_ssr_ssrfun_399) (f : aT → rT) (g : rT → aT),
  Rocq.Corelib.ssr.ssrfun.cancel rT aT f g → Rocq.Corelib.ssr.ssrfun.injective rT aT f
```

残留源符号：Rocq.Corelib.ssr.ssrfun.cancel;Rocq.Corelib.ssr.ssrfun.injective

## Corelib.ssr.ssrfun.can_pcan

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.can_pcan.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.can_pcan.statement.correspondence

```lean
∀ (rT : Sort u_Corelib_ssr_ssrfun_398) (aT : Sort u_Corelib_ssr_ssrfun_399) (f : aT → rT) (g : rT → aT),
  Rocq.Corelib.ssr.ssrfun.cancel rT aT f g →
    Rocq.Corelib.ssr.ssrfun.pcancel rT aT f fun y => Rocq.Corelib.Init.Datatypes.option.Some aT (g y)
```

残留源符号：Rocq.Corelib.ssr.ssrfun.cancel;Rocq.Corelib.ssr.ssrfun.pcancel;Rocq.Corelib.Init.Datatypes.option.Some

## Corelib.ssr.ssrfun.cancel

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.cancel

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.cancel.roundtrip

## Corelib.ssr.ssrfun.catcomp

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.catcomp

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.catcomp.roundtrip

## Corelib.ssr.ssrfun.commutative

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.commutative

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.commutative.roundtrip

## Corelib.ssr.ssrfun.comp

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.comp

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.comp.roundtrip

## Corelib.ssr.ssrfun.compA

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.compA.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.compA.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_128) (B : Sort u_Corelib_ssr_ssrfun_129) (C : Sort u_Corelib_ssr_ssrfun_130)
  (D : Sort u_Corelib_ssr_ssrfun_131) (f : B → A) (g : C → B) (h : D → C),
  Rocq.Corelib.ssr.ssrfun.comp A B D f (Rocq.Corelib.ssr.ssrfun.comp B C D g h) =
    Rocq.Corelib.ssr.ssrfun.comp A C D (Rocq.Corelib.ssr.ssrfun.comp A B C f g) h
```

残留源符号：Rocq.Corelib.ssr.ssrfun.comp

## Corelib.ssr.ssrfun.congr1

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.ssr.ssrfun.congr1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.congr1.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_45) (B : Sort u_Corelib_Init_Logic_46) (f : A → B) (x y : A), x = y → f x = f y
```

## Corelib.ssr.ssrfun.congr2

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.ssr.ssrfun.congr2.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.congr2.statement.correspondence

```lean
∀ (A1 : Sort u_Corelib_Init_Logic_107) (A2 : Sort u_Corelib_Init_Logic_108) (B : Sort u_Corelib_Init_Logic_109)
  (f : A1 → A2 → B) (x1 y1 : A1) (x2 y2 : A2), x1 = y1 → x2 = y2 → f x1 x2 = f y1 y2
```

## Corelib.ssr.ssrfun.eq_bij

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.eq_bij.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.eq_bij.statement.correspondence

```lean
∀ (A : Type u_Corelib_ssr_ssrfun_582) (B : Type u_Corelib_ssr_ssrfun_583) (f : B → A),
  Rocq.Corelib.ssr.ssrfun.bijective A B f →
    ∀ (g : B → A), Rocq.Corelib.ssr.ssrfun.eqfun A B f g → Rocq.Corelib.ssr.ssrfun.bijective A B g
```

残留源符号：Rocq.Corelib.ssr.ssrfun.bijective;Rocq.Corelib.ssr.ssrfun.eqfun

## Corelib.ssr.ssrfun.eq_can

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.eq_can.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.eq_can.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_512) (B : Sort u_Corelib_ssr_ssrfun_513) (f g : B → A) (f' g' : A → B),
  Rocq.Corelib.ssr.ssrfun.cancel A B f f' →
    Rocq.Corelib.ssr.ssrfun.eqfun A B f g →
      Rocq.Corelib.ssr.ssrfun.eqfun B A f' g' → Rocq.Corelib.ssr.ssrfun.cancel A B g g'
```

残留源符号：Rocq.Corelib.ssr.ssrfun.cancel;Rocq.Corelib.ssr.ssrfun.eqfun

## Corelib.ssr.ssrfun.eq_comp

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.eq_comp.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.eq_comp.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_114) (B : Sort u_Corelib_ssr_ssrfun_115) (C : Sort u_Corelib_ssr_ssrfun_116)
  (f f' : B → A) (g g' : C → B),
  Rocq.Corelib.ssr.ssrfun.eqfun A B f f' →
    Rocq.Corelib.ssr.ssrfun.eqfun B C g g' →
      Rocq.Corelib.ssr.ssrfun.eqfun A C (Rocq.Corelib.ssr.ssrfun.comp A B C f g)
        (Rocq.Corelib.ssr.ssrfun.comp A B C f' g')
```

残留源符号：Rocq.Corelib.ssr.ssrfun.eqfun;Rocq.Corelib.ssr.ssrfun.comp

## Corelib.ssr.ssrfun.eq_inj

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.eq_inj.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.eq_inj.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_512) (B : Sort u_Corelib_ssr_ssrfun_513) (f g : B → A),
  Rocq.Corelib.ssr.ssrfun.injective A B f →
    Rocq.Corelib.ssr.ssrfun.eqfun A B f g → Rocq.Corelib.ssr.ssrfun.injective A B g
```

残留源符号：Rocq.Corelib.ssr.ssrfun.injective;Rocq.Corelib.ssr.ssrfun.eqfun

## Corelib.ssr.ssrfun.eq_omap

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.eq_omap.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.eq_omap.statement.correspondence

```lean
∀ (aT : Sort u_Corelib_ssr_ssrfun_143) (rT : Sort u_Corelib_ssr_ssrfun_144) (f h : aT → rT),
  Rocq.Corelib.ssr.ssrfun.eqfun rT aT f h →
    Rocq.Corelib.ssr.ssrfun.eqfun (Rocq.Corelib.Init.Datatypes.option rT) (Rocq.Corelib.Init.Datatypes.option aT)
      (Rocq.Corelib.ssr.ssrfun.Option.map aT rT f) (Rocq.Corelib.ssr.ssrfun.Option.map aT rT h)
```

残留源符号：Rocq.Corelib.ssr.ssrfun.eqfun;Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.Option.map

## Corelib.ssr.ssrfun.eqfun

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.eqfun

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.eqfun.roundtrip

## Corelib.ssr.ssrfun.eqrel

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.eqrel

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.eqrel.roundtrip

## Corelib.ssr.ssrfun.esym

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.ssr.ssrfun.esym.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.esym.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_31) (x y : A), x = y → y = x
```

## Corelib.ssr.ssrfun.esymK

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrfun.esymK.statement

## Corelib.ssr.ssrfun.etrans

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.ssr.ssrfun.etrans.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.etrans.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_45) (x y z : A), x = y → y = z → x = z
```

## Corelib.ssr.ssrfun.etrans_id

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrfun.etrans_id.statement

## Corelib.ssr.ssrfun.frefl

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.frefl.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.frefl.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_95) (B : Sort u_Corelib_ssr_ssrfun_96) (f : B → A),
  Rocq.Corelib.ssr.ssrfun.eqfun A B f f
```

残留源符号：Rocq.Corelib.ssr.ssrfun.eqfun

## Corelib.ssr.ssrfun.fsym

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.fsym.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.fsym.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_95) (B : Sort u_Corelib_ssr_ssrfun_96) (f g : B → A),
  Rocq.Corelib.ssr.ssrfun.eqfun A B f g → Rocq.Corelib.ssr.ssrfun.eqfun A B g f
```

残留源符号：Rocq.Corelib.ssr.ssrfun.eqfun

## Corelib.ssr.ssrfun.ftrans

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.ftrans.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.ftrans.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_95) (B : Sort u_Corelib_ssr_ssrfun_96) (f g h : B → A),
  Rocq.Corelib.ssr.ssrfun.eqfun A B f g → Rocq.Corelib.ssr.ssrfun.eqfun A B g h → Rocq.Corelib.ssr.ssrfun.eqfun A B f h
```

残留源符号：Rocq.Corelib.ssr.ssrfun.eqfun

## Corelib.ssr.ssrfun.fun_of_simpl

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrfun.fun_of_simpl

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun aT rT

## Corelib.ssr.ssrfun.homomorphism_1

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.homomorphism_1

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.homomorphism_1.roundtrip

## Corelib.ssr.ssrfun.homomorphism_2

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.homomorphism_2

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.homomorphism_2.roundtrip

## Corelib.ssr.ssrfun.idempotent_fun

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.idempotent_fun

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.idempotent_fun.roundtrip

## Corelib.ssr.ssrfun.idempotent_op

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.idempotent_op

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.idempotent_op.roundtrip

## Corelib.ssr.ssrfun.idfun

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.idfun

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.idfun.roundtrip

## Corelib.ssr.ssrfun.inj_can_eq

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.inj_can_eq.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.inj_can_eq.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_512) (B : Sort u_Corelib_ssr_ssrfun_513) (f g : B → A) (f' : A → B),
  Rocq.Corelib.ssr.ssrfun.cancel A B f f' →
    Rocq.Corelib.ssr.ssrfun.injective B A f' →
      Rocq.Corelib.ssr.ssrfun.cancel A B g f' → Rocq.Corelib.ssr.ssrfun.eqfun A B f g
```

残留源符号：Rocq.Corelib.ssr.ssrfun.cancel;Rocq.Corelib.ssr.ssrfun.injective;Rocq.Corelib.ssr.ssrfun.eqfun

## Corelib.ssr.ssrfun.inj_can_sym

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.inj_can_sym.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.inj_can_sym.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_512) (B : Sort u_Corelib_ssr_ssrfun_513) (f : B → A) (f' : A → B),
  Rocq.Corelib.ssr.ssrfun.cancel A B f f' →
    Rocq.Corelib.ssr.ssrfun.injective B A f' → Rocq.Corelib.ssr.ssrfun.cancel B A f' f
```

残留源符号：Rocq.Corelib.ssr.ssrfun.cancel;Rocq.Corelib.ssr.ssrfun.injective

## Corelib.ssr.ssrfun.inj_comp

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.inj_comp.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.inj_comp.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_512) (B : Sort u_Corelib_ssr_ssrfun_513) (C : Sort u_Corelib_ssr_ssrfun_514)
  (f : B → A) (h : C → B),
  Rocq.Corelib.ssr.ssrfun.injective A B f →
    Rocq.Corelib.ssr.ssrfun.injective B C h →
      Rocq.Corelib.ssr.ssrfun.injective A C (Rocq.Corelib.ssr.ssrfun.comp A B C f h)
```

残留源符号：Rocq.Corelib.ssr.ssrfun.injective;Rocq.Corelib.ssr.ssrfun.comp

## Corelib.ssr.ssrfun.inj_compr

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.inj_compr.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.inj_compr.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_512) (B : Sort u_Corelib_ssr_ssrfun_513) (C : Sort u_Corelib_ssr_ssrfun_514)
  (f : B → A) (h : C → B),
  Rocq.Corelib.ssr.ssrfun.injective A C (Rocq.Corelib.ssr.ssrfun.comp A B C f h) →
    Rocq.Corelib.ssr.ssrfun.injective B C h
```

残留源符号：Rocq.Corelib.ssr.ssrfun.injective;Rocq.Corelib.ssr.ssrfun.comp

## Corelib.ssr.ssrfun.inj_id

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.inj_id.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.inj_id.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_512), Rocq.Corelib.ssr.ssrfun.injective A A fun x => x
```

残留源符号：Rocq.Corelib.ssr.ssrfun.injective

## Corelib.ssr.ssrfun.inj_omap

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.inj_omap.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.inj_omap.statement.correspondence

```lean
∀ (aT : Sort u_Corelib_ssr_ssrfun_463) (rT : Sort u_Corelib_ssr_ssrfun_464) (f : aT → rT),
  Rocq.Corelib.ssr.ssrfun.injective rT aT f →
    Rocq.Corelib.ssr.ssrfun.injective (Rocq.Corelib.Init.Datatypes.option rT) (Rocq.Corelib.Init.Datatypes.option aT)
      (Rocq.Corelib.ssr.ssrfun.Option.map aT rT f)
```

残留源符号：Rocq.Corelib.ssr.ssrfun.injective;Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.Option.map

## Corelib.ssr.ssrfun.injective

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.injective

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.injective.roundtrip

## Corelib.ssr.ssrfun.injective2

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.injective2

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.injective2.roundtrip

## Corelib.ssr.ssrfun.inl_inj

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.inl_inj.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.inl_inj.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_690) (B : Sort u_Corelib_ssr_ssrfun_691),
  Rocq.Corelib.ssr.ssrfun.injective (Rocq.Corelib.Init.Datatypes.sum A B) A (Rocq.Corelib.Init.Datatypes.sum.inl A B)
```

残留源符号：Rocq.Corelib.ssr.ssrfun.injective;Rocq.Corelib.Init.Datatypes.sum;Rocq.Corelib.Init.Datatypes.sum.inl

## Corelib.ssr.ssrfun.inr_inj

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.inr_inj.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.inr_inj.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_686) (B : Sort u_Corelib_ssr_ssrfun_687),
  Rocq.Corelib.ssr.ssrfun.injective (Rocq.Corelib.Init.Datatypes.sum A B) B (Rocq.Corelib.Init.Datatypes.sum.inr A B)
```

残留源符号：Rocq.Corelib.ssr.ssrfun.injective;Rocq.Corelib.Init.Datatypes.sum;Rocq.Corelib.Init.Datatypes.sum.inr

## Corelib.ssr.ssrfun.interchange

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.interchange

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.interchange.roundtrip

## Corelib.ssr.ssrfun.inv_bij

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.inv_bij.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.inv_bij.statement.correspondence

```lean
∀ (A : Type u_Corelib_ssr_ssrfun_587) (f : A → A),
  Rocq.Corelib.ssr.ssrfun.involutive A f → Rocq.Corelib.ssr.ssrfun.bijective A A f
```

残留源符号：Rocq.Corelib.ssr.ssrfun.involutive;Rocq.Corelib.ssr.ssrfun.bijective

## Corelib.ssr.ssrfun.inv_inj

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.inv_inj.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.inv_inj.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_587) (f : A → A),
  Rocq.Corelib.ssr.ssrfun.involutive A f → Rocq.Corelib.ssr.ssrfun.injective A A f
```

残留源符号：Rocq.Corelib.ssr.ssrfun.involutive;Rocq.Corelib.ssr.ssrfun.injective

## Corelib.ssr.ssrfun.involutive

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.involutive

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.involutive.roundtrip

## Corelib.ssr.ssrfun.left_commutative

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.left_commutative

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.left_commutative.roundtrip

## Corelib.ssr.ssrfun.left_distributive

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.left_distributive

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.left_distributive.roundtrip

## Corelib.ssr.ssrfun.left_id

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.left_id

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.left_id.roundtrip

## Corelib.ssr.ssrfun.left_injective

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.left_injective

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.left_injective.roundtrip

## Corelib.ssr.ssrfun.left_inverse

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.left_inverse

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.left_inverse.roundtrip

## Corelib.ssr.ssrfun.left_loop

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.left_loop

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.left_loop.roundtrip

## Corelib.ssr.ssrfun.left_zero

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.left_zero

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.left_zero.roundtrip

## Corelib.ssr.ssrfun.monomorphism_1

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.monomorphism_1

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.monomorphism_1.roundtrip

## Corelib.ssr.ssrfun.monomorphism_2

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.monomorphism_2

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.monomorphism_2.roundtrip

## Corelib.ssr.ssrfun.morphism_1

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.morphism_1

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.morphism_1.roundtrip

## Corelib.ssr.ssrfun.morphism_2

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.morphism_2

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.morphism_2.roundtrip

## Corelib.ssr.ssrfun.nesym

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.ssr.ssrfun.nesym.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.nesym.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_45) (x y : A), ¬x = y → ¬y = x
```

## Corelib.ssr.ssrfun.oappEmap

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.oappEmap.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.oappEmap.statement.correspondence

```lean
∀ (aT : Sort u_Corelib_ssr_ssrfun_143) (rT : Sort u_Corelib_ssr_ssrfun_144) (f : aT → rT) (y0 : rT)
  (x : Rocq.Corelib.Init.Datatypes.option aT),
  Rocq.Corelib.ssr.ssrfun.Option.apply aT rT f y0 x =
    Rocq.Corelib.ssr.ssrfun.Option.default rT y0 (Rocq.Corelib.ssr.ssrfun.Option.map aT rT f x)
```

残留源符号：Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.Option.apply;Rocq.Corelib.ssr.ssrfun.Option.default;Rocq.Corelib.ssr.ssrfun.Option.map

## Corelib.ssr.ssrfun.oapp_comp

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.oapp_comp.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.oapp_comp.statement.correspondence

```lean
∀ (aT : Sort u_Corelib_ssr_ssrfun_143) (rT : Sort u_Corelib_ssr_ssrfun_144) (sT : Sort u_Corelib_ssr_ssrfun_145)
  (f : aT → rT) (g : rT → sT) (x : sT),
  Rocq.Corelib.ssr.ssrfun.eqfun sT (Rocq.Corelib.Init.Datatypes.option aT)
    (Rocq.Corelib.ssr.ssrfun.Option.apply aT sT (Rocq.Corelib.ssr.ssrfun.comp sT rT aT g f) x)
    (Rocq.Corelib.ssr.ssrfun.comp sT (Rocq.Corelib.Init.Datatypes.option rT) (Rocq.Corelib.Init.Datatypes.option aT)
      (Rocq.Corelib.ssr.ssrfun.Option.apply rT sT g x) (Rocq.Corelib.ssr.ssrfun.Option.map aT rT f))
```

残留源符号：Rocq.Corelib.ssr.ssrfun.eqfun;Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.Option.apply;Rocq.Corelib.ssr.ssrfun.comp;Rocq.Corelib.ssr.ssrfun.Option.map

## Corelib.ssr.ssrfun.oapp_comp_f

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.oapp_comp_f.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.oapp_comp_f.statement.correspondence

```lean
∀ (aT : Sort u_Corelib_ssr_ssrfun_143) (rT : Sort u_Corelib_ssr_ssrfun_144) (sT : Sort u_Corelib_ssr_ssrfun_145)
  (f : aT → rT) (g : rT → sT) (x : rT),
  Rocq.Corelib.ssr.ssrfun.eqfun sT (Rocq.Corelib.Init.Datatypes.option aT)
    (Rocq.Corelib.ssr.ssrfun.Option.apply aT sT (Rocq.Corelib.ssr.ssrfun.comp sT rT aT g f) (g x))
    (Rocq.Corelib.ssr.ssrfun.comp sT rT (Rocq.Corelib.Init.Datatypes.option aT) g
      (Rocq.Corelib.ssr.ssrfun.Option.apply aT rT f x))
```

残留源符号：Rocq.Corelib.ssr.ssrfun.eqfun;Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.Option.apply;Rocq.Corelib.ssr.ssrfun.comp

## Corelib.ssr.ssrfun.obindEapp

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.obindEapp.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.obindEapp.statement.correspondence

```lean
∀ (aT : Sort u_Corelib_ssr_ssrfun_143) (rT : Sort u_Corelib_ssr_ssrfun_144)
  (fo : aT → Rocq.Corelib.Init.Datatypes.option rT),
  Rocq.Corelib.ssr.ssrfun.Option.bind aT rT fo =
    Rocq.Corelib.ssr.ssrfun.Option.apply aT (Rocq.Corelib.Init.Datatypes.option rT) fo
      (Rocq.Corelib.Init.Datatypes.option.None rT)
```

残留源符号：Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.Option.bind;Rocq.Corelib.ssr.ssrfun.Option.apply;Rocq.Corelib.Init.Datatypes.option.None

## Corelib.ssr.ssrfun.ocan_comp

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.ocan_comp.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.ocan_comp.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_512) (B : Sort u_Corelib_ssr_ssrfun_513) (C : Sort u_Corelib_ssr_ssrfun_514)
  (fo : B → Rocq.Corelib.Init.Datatypes.option A) (ho : C → Rocq.Corelib.Init.Datatypes.option B) (f' : A → B)
  (h' : B → C),
  Rocq.Corelib.ssr.ssrfun.ocancel A B fo f' →
    Rocq.Corelib.ssr.ssrfun.ocancel B C ho h' →
      Rocq.Corelib.ssr.ssrfun.ocancel A C
        (Rocq.Corelib.ssr.ssrfun.comp (Rocq.Corelib.Init.Datatypes.option A) (Rocq.Corelib.Init.Datatypes.option B) C
          (Rocq.Corelib.ssr.ssrfun.Option.bind B A fo) ho)
        (Rocq.Corelib.ssr.ssrfun.comp C B A h' f')
```

残留源符号：Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.ocancel;Rocq.Corelib.ssr.ssrfun.comp;Rocq.Corelib.ssr.ssrfun.Option.bind

## Corelib.ssr.ssrfun.ocancel

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.ocancel

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.ocancel.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.ssr.ssrfun.of_void

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.of_void

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.of_void.roundtrip

## Corelib.ssr.ssrfun.of_voidK

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.of_voidK.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.of_voidK.statement.correspondence

```lean
∀ (T : Sort u_Corelib_ssr_ssrfun_493),
  Rocq.Corelib.ssr.ssrfun.pcancel T Rocq.Corelib.Init.Datatypes.Empty_set (Rocq.Corelib.ssr.ssrfun.of_void T)
    (Rocq.Corelib.ssr.ssrfun.fun_of_simpl T (Rocq.Corelib.Init.Datatypes.option Rocq.Corelib.Init.Datatypes.Empty_set)
      (Rocq.Corelib.ssr.ssrfun.simpl_fun.SimplFun T
        (Rocq.Corelib.Init.Datatypes.option Rocq.Corelib.Init.Datatypes.Empty_set) fun a =>
        Rocq.Corelib.Init.Datatypes.option.None Rocq.Corelib.Init.Datatypes.Empty_set))
```

残留源符号：Rocq.Corelib.ssr.ssrfun.pcancel;Rocq.Corelib.Init.Datatypes.Empty_set;Rocq.Corelib.ssr.ssrfun.of_void;Rocq.Corelib.ssr.ssrfun.fun_of_simpl;Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.simpl_fun.SimplFun;Rocq.Corelib.Init.Datatypes.option.None

## Corelib.ssr.ssrfun.olift_comp

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.olift_comp.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.olift_comp.statement.correspondence

```lean
∀ (aT : Sort u_Corelib_ssr_ssrfun_143) (rT : Sort u_Corelib_ssr_ssrfun_144) (sT : Sort u_Corelib_ssr_ssrfun_145)
  (f : aT → rT) (g : rT → sT),
  Rocq.Corelib.ssr.ssrfun.Option.lift aT sT (Rocq.Corelib.ssr.ssrfun.comp sT rT aT g f) =
    Rocq.Corelib.ssr.ssrfun.comp (Rocq.Corelib.Init.Datatypes.option sT) rT aT
      (Rocq.Corelib.ssr.ssrfun.Option.lift rT sT g) f
```

残留源符号：Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.Option.lift;Rocq.Corelib.ssr.ssrfun.comp

## Corelib.ssr.ssrfun.omapEapp

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.omapEapp.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.omapEapp.statement.correspondence

```lean
∀ (aT : Sort u_Corelib_ssr_ssrfun_143) (rT : Sort u_Corelib_ssr_ssrfun_144) (f : aT → rT),
  Rocq.Corelib.ssr.ssrfun.Option.map aT rT f =
    Rocq.Corelib.ssr.ssrfun.Option.apply aT (Rocq.Corelib.Init.Datatypes.option rT)
      (Rocq.Corelib.ssr.ssrfun.Option.lift aT rT f) (Rocq.Corelib.Init.Datatypes.option.None rT)
```

残留源符号：Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.Option.map;Rocq.Corelib.ssr.ssrfun.Option.apply;Rocq.Corelib.ssr.ssrfun.Option.lift;Rocq.Corelib.Init.Datatypes.option.None

## Corelib.ssr.ssrfun.omapEbind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.omapEbind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.omapEbind.statement.correspondence

```lean
∀ (aT : Sort u_Corelib_ssr_ssrfun_143) (rT : Sort u_Corelib_ssr_ssrfun_144) (f : aT → rT),
  Rocq.Corelib.ssr.ssrfun.Option.map aT rT f =
    Rocq.Corelib.ssr.ssrfun.Option.bind aT rT (Rocq.Corelib.ssr.ssrfun.Option.lift aT rT f)
```

残留源符号：Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.Option.map;Rocq.Corelib.ssr.ssrfun.Option.bind;Rocq.Corelib.ssr.ssrfun.Option.lift

## Corelib.ssr.ssrfun.omapK

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.omapK.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.omapK.statement.correspondence

```lean
∀ (aT : Sort u_Corelib_ssr_ssrfun_483) (rT : Sort u_Corelib_ssr_ssrfun_484) (f : aT → rT) (g : rT → aT),
  Rocq.Corelib.ssr.ssrfun.cancel rT aT f g →
    Rocq.Corelib.ssr.ssrfun.cancel (Rocq.Corelib.Init.Datatypes.option rT) (Rocq.Corelib.Init.Datatypes.option aT)
      (Rocq.Corelib.ssr.ssrfun.Option.map aT rT f) (Rocq.Corelib.ssr.ssrfun.Option.map rT aT g)
```

残留源符号：Rocq.Corelib.ssr.ssrfun.cancel;Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.Option.map

## Corelib.ssr.ssrfun.omap_comp

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.omap_comp.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.omap_comp.statement.correspondence

```lean
∀ (aT : Sort u_Corelib_ssr_ssrfun_143) (rT : Sort u_Corelib_ssr_ssrfun_144) (sT : Sort u_Corelib_ssr_ssrfun_145)
  (f : aT → rT) (g : rT → sT),
  Rocq.Corelib.ssr.ssrfun.eqfun (Rocq.Corelib.Init.Datatypes.option sT) (Rocq.Corelib.Init.Datatypes.option aT)
    (Rocq.Corelib.ssr.ssrfun.Option.map aT sT (Rocq.Corelib.ssr.ssrfun.comp sT rT aT g f))
    (Rocq.Corelib.ssr.ssrfun.comp (Rocq.Corelib.Init.Datatypes.option sT) (Rocq.Corelib.Init.Datatypes.option rT)
      (Rocq.Corelib.Init.Datatypes.option aT) (Rocq.Corelib.ssr.ssrfun.Option.map rT sT g)
      (Rocq.Corelib.ssr.ssrfun.Option.map aT rT f))
```

残留源符号：Rocq.Corelib.ssr.ssrfun.eqfun;Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.Option.map;Rocq.Corelib.ssr.ssrfun.comp

## Corelib.ssr.ssrfun.omap_id

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.omap_id.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.omap_id.statement.correspondence

```lean
∀ (rT : Sort u_Corelib_ssr_ssrfun_144) (x : Rocq.Corelib.Init.Datatypes.option rT),
  Rocq.Corelib.ssr.ssrfun.Option.map rT rT (fun x => x) x = x
```

残留源符号：Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.Option.map

## Corelib.ssr.ssrfun.pair_of_and

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.pair_of_and.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.pair_of_and.statement.correspondence

```lean
∀ (P Q : Prop), P ∧ Q → Rocq.Corelib.Init.Datatypes.prod.qualityProp P Q
```

残留源符号：Rocq.Corelib.Init.Datatypes.prod.qualityProp

## Corelib.ssr.ssrfun.pcan_inj

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.pcan_inj.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.pcan_inj.statement.correspondence

```lean
∀ (rT : Sort u_Corelib_ssr_ssrfun_398) (aT : Sort u_Corelib_ssr_ssrfun_399) (f : aT → rT)
  (g : rT → Rocq.Corelib.Init.Datatypes.option aT),
  Rocq.Corelib.ssr.ssrfun.pcancel rT aT f g → Rocq.Corelib.ssr.ssrfun.injective rT aT f
```

残留源符号：Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.pcancel;Rocq.Corelib.ssr.ssrfun.injective

## Corelib.ssr.ssrfun.pcan_pcomp

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.pcan_pcomp.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.pcan_pcomp.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_512) (B : Sort u_Corelib_ssr_ssrfun_513) (C : Sort u_Corelib_ssr_ssrfun_514)
  (f : B → A) (h : C → B) (f' : A → Rocq.Corelib.Init.Datatypes.option B)
  (h' : B → Rocq.Corelib.Init.Datatypes.option C),
  Rocq.Corelib.ssr.ssrfun.pcancel A B f f' →
    Rocq.Corelib.ssr.ssrfun.pcancel B C h h' →
      Rocq.Corelib.ssr.ssrfun.pcancel A C (Rocq.Corelib.ssr.ssrfun.comp A B C f h)
        (Rocq.Corelib.ssr.ssrfun.pcomp C B A h' f')
```

残留源符号：Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.pcancel;Rocq.Corelib.ssr.ssrfun.comp;Rocq.Corelib.ssr.ssrfun.pcomp

## Corelib.ssr.ssrfun.pcancel

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.pcancel

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.pcancel.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.ssr.ssrfun.pcomp

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.pcomp

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.pcomp.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.ssr.ssrfun.phant_id

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.phant_id

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.phant_id.roundtrip

## Corelib.ssr.ssrfun.rev_left_loop

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.rev_left_loop

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.rev_left_loop.roundtrip

## Corelib.ssr.ssrfun.rev_right_loop

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.rev_right_loop

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.rev_right_loop.roundtrip

## Corelib.ssr.ssrfun.right_commutative

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.right_commutative

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.right_commutative.roundtrip

## Corelib.ssr.ssrfun.right_distributive

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.right_distributive

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.right_distributive.roundtrip

## Corelib.ssr.ssrfun.right_id

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.right_id

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.right_id.roundtrip

## Corelib.ssr.ssrfun.right_injective

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.right_injective

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.right_injective.roundtrip

## Corelib.ssr.ssrfun.right_inverse

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.right_inverse

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.right_inverse.roundtrip

## Corelib.ssr.ssrfun.right_loop

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.right_loop

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.right_loop.roundtrip

## Corelib.ssr.ssrfun.right_zero

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.right_zero

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.right_zero.roundtrip

## Corelib.ssr.ssrfun.rrefl

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.rrefl.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.rrefl.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_95) (B : Sort u_Corelib_ssr_ssrfun_96) (C : Sort u_Corelib_ssr_ssrfun_97)
  (r : C → B → A), Rocq.Corelib.ssr.ssrfun.eqrel A B C r r
```

残留源符号：Rocq.Corelib.ssr.ssrfun.eqrel

## Corelib.ssr.ssrfun.s2val

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.s2val

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.s2val.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.ssr.ssrfun.s2valP

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.s2valP.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.s2valP.statement.correspondence

```lean
∀ (T : Sort u_Corelib_ssr_ssrfun_280) (P Q : T → Prop) (u : Rocq.Corelib.Init.Specif.sig2 T P Q),
  P (Rocq.Corelib.ssr.ssrfun.s2val T P Q u)
```

残留源符号：Rocq.Corelib.Init.Specif.sig2;Rocq.Corelib.ssr.ssrfun.s2val

## Corelib.ssr.ssrfun.s2valP'

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.s2valP'.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.s2valP'.statement.correspondence

```lean
∀ (T : Sort u_Corelib_ssr_ssrfun_280) (P Q : T → Prop) (u : Rocq.Corelib.Init.Specif.sig2 T P Q),
  Q (Rocq.Corelib.ssr.ssrfun.s2val T P Q u)
```

残留源符号：Rocq.Corelib.Init.Specif.sig2;Rocq.Corelib.ssr.ssrfun.s2val

## Corelib.ssr.ssrfun.self_inverse

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.self_inverse

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.self_inverse.roundtrip

## Corelib.ssr.ssrfun.sig_of_sig2

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrfun.sig_of_sig2

## Corelib.ssr.ssrfun.simpl_fun

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrfun.simpl_fun

## Corelib.ssr.ssrfun.svalP

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.svalP.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.svalP.statement.correspondence

```lean
∀ (T : Sort u_Corelib_ssr_ssrfun_280) (P : T → Prop) (u : Rocq.Corelib.Init.Specif.sig T P),
  P (Rocq.Corelib.Init.Specif.proj1_sig T P u)
```

残留源符号：Rocq.Corelib.Init.Specif.sig;Rocq.Corelib.Init.Specif.proj1_sig

## Corelib.ssr.ssrfun.tag

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.tag

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.tag.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.ssr.ssrfun.tag2

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrfun.tag2

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.tag2.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.ssr.ssrfun.tag_of_sig

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrfun.tag_of_sig

## Corelib.ssr.ssrfun.tag_of_tag2

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrfun.tag_of_tag2

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Specif.sigT I fun x =>
  (fun i => Rocq.Corelib.Init.Datatypes.prod (T_ i) (U_ i)) x

## Corelib.ssr.ssrfun.tagged

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrfun.tagged

接口未覆盖原因：No registered type bijection for (w : Rocq.Corelib.Init.Specif.sigT I fun x => T_ x) →
  T_ (Rocq.Corelib.ssr.ssrfun.tag I (fun x => T_ x) w)

## Corelib.ssr.ssrfun.tagged2

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrfun.tagged2

接口未覆盖原因：No registered type bijection for (w : Rocq.Corelib.Init.Specif.sigT2 I T_ U_) →
  T_ (Rocq.Corelib.ssr.ssrfun.tag2 I T_ U_ w)

## Corelib.ssr.ssrfun.tagged2'

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrfun.tagged2'

接口未覆盖原因：No registered type bijection for (w : Rocq.Corelib.Init.Specif.sigT2 I T_ U_) →
  U_ (Rocq.Corelib.ssr.ssrfun.tag2 I T_ U_ w)

## Corelib.ssr.ssrfun.unitE

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrfun.unitE.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.unitE.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.all_equal_to Rocq.Corelib.Init.Datatypes.unit Rocq.Corelib.Init.Datatypes.unit.tt
```

残留源符号：Rocq.Corelib.ssr.ssrfun.all_equal_to;Rocq.Corelib.Init.Datatypes.unit;Rocq.Corelib.Init.Datatypes.unit.tt

## Corelib.ssr.ssrfun.unwrap

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrfun.unwrap

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrfun.wrapped T

## Corelib.ssr.ssrfun.wrap

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrfun.wrap

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrfun.wrapped T

## Corelib.ssr.ssrfun.wrapped

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrfun.wrapped
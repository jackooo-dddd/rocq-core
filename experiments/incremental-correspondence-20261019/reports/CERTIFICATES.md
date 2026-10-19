# 本轮 correspondence 证书

按显式 source → certificate 清单计数，不把类型中提到的其他根算作已覆盖。

## Corelib.Program.Basics.apply

NativeBridge.Incremental.basics_apply_agrees

目标：function application；范围：Sort parameters

```lean
∀ {A : Sort u} {B : Sort v} (f : A → B) (x : A), Rocq.Corelib.Program.Basics.apply A B f x = f x
```

公理闭包：空

## Corelib.Program.Basics.arrow

NativeBridge.Incremental.basics_arrow_agrees

目标：Lean function type；范围：Type parameters

```lean
∀ (A : Type u) (B : Type v), Rocq.Corelib.Program.Basics.arrow A B = (A → B)
```

公理闭包：空

## Corelib.Program.Basics.compose

NativeBridge.Incremental.basics_compose_agrees

目标：Function.comp；范围：Sort parameters

```lean
∀ {A : Sort u} {B : Sort v} {C : Sort w} (g : B → C) (f : A → B), Rocq.Corelib.Program.Basics.compose A B C g f = g ∘ f
```

公理闭包：空

## Corelib.Program.Basics.const

NativeBridge.Incremental.basics_const_agrees

目标：constant lambda；范围：Sort parameters

```lean
∀ {A : Sort u} {B : Sort v} (a : A), Rocq.Corelib.Program.Basics.const A B a = fun x => a
```

公理闭包：空

## Corelib.Program.Basics.flip

NativeBridge.Incremental.basics_flip_agrees

目标：argument-swapping lambda；范围：Sort parameters

```lean
∀ {A : Sort u} {B : Sort v} {C : Sort w} (f : A → B → C), Rocq.Corelib.Program.Basics.flip A B C f = fun b a => f a b
```

公理闭包：空

## Corelib.Program.Basics.impl

NativeBridge.Incremental.basics_impl_agrees

目标：Lean implication；范围：Prop

```lean
∀ (P Q : Prop), Rocq.Corelib.Program.Basics.impl P Q ↔ P → Q
```

公理闭包：空

## Corelib.ssr.ssrfun.Option.apply

NativeBridge.Incremental.ssr_option_apply_agrees

目标：Option.elim；范围：Type parameters; map_transport additionally supports element Iso with explicit function-correspondence premise

```lean
∀ {A : Type u} {B : Type v} (f : A → B) (d : B) (x : Rocq.Corelib.Init.Datatypes.option A),
  Rocq.Corelib.ssr.ssrfun.Option.apply A B f d x = (NativeBridge.optionTo x).elim d f
```

公理闭包：空

## Corelib.ssr.ssrfun.Option.default

NativeBridge.Incremental.ssr_option_default_agrees

目标：Option.getD；范围：Type parameters; map_transport additionally supports element Iso with explicit function-correspondence premise

```lean
∀ {A : Type u} (d : A) (x : Rocq.Corelib.Init.Datatypes.option A),
  Rocq.Corelib.ssr.ssrfun.Option.default A d x = (NativeBridge.optionTo x).getD d
```

公理闭包：空

## Corelib.ssr.ssrfun.Option.lift

NativeBridge.Incremental.ssr_option_lift_agrees

目标：Option.some of function application；范围：Type parameters; map_transport additionally supports element Iso with explicit function-correspondence premise

```lean
∀ {A : Type u} {B : Type v} (f : A → B) (x : A),
  NativeBridge.optionTo (Rocq.Corelib.ssr.ssrfun.Option.lift A B f x) = some (f x)
```

公理闭包：空

## Corelib.ssr.ssrfun.Option.map

NativeBridge.Incremental.ssr_option_map_agrees

目标：Option.map；范围：Type parameters; map_transport additionally supports element Iso with explicit function-correspondence premise

```lean
∀ {A : Type u} {B : Type v} (f : A → B) (x : Rocq.Corelib.Init.Datatypes.option A),
  NativeBridge.optionTo (Rocq.Corelib.ssr.ssrfun.Option.map A B f x) = Option.map f (NativeBridge.optionTo x)
```

公理闭包：空

## Corelib.ssr.ssrfun.Option.bind

NativeBridge.Incremental.ssr_option_bind_agrees

目标：Option.bind；范围：Type parameters; map_transport additionally supports element Iso with explicit function-correspondence premise

```lean
∀ {A : Type u} {B : Type v} (f : A → Rocq.Corelib.Init.Datatypes.option B) (x : Rocq.Corelib.Init.Datatypes.option A),
  NativeBridge.optionTo (Rocq.Corelib.ssr.ssrfun.Option.bind A B f x) =
    (NativeBridge.optionTo x).bind fun a => NativeBridge.optionTo (f a)
```

公理闭包：空

## Corelib.ssr.ssrfun.comp

NativeBridge.Incremental.ssr_comp_agrees

目标：Function.comp；范围：Sort parameters

```lean
∀ {A : Sort u} {B : Sort v} {C : Sort w} (f : B → A) (g : C → B), Rocq.Corelib.ssr.ssrfun.comp A B C f g = f ∘ g
```

公理闭包：空

## Corelib.ssr.ssrfun.catcomp

NativeBridge.Incremental.ssr_catcomp_agrees

目标：Function.comp；范围：Sort parameters

```lean
∀ {A : Sort u} {B : Sort v} {C : Sort w} (g : C → B) (f : B → A), Rocq.Corelib.ssr.ssrfun.catcomp A B C g f = f ∘ g
```

公理闭包：空

## Corelib.ssr.ssrfun.idfun

NativeBridge.Incremental.ssr_idfun_agrees

目标：id；范围：Sort parameters

```lean
∀ {A : Sort u}, Rocq.Corelib.ssr.ssrfun.idfun A = id
```

公理闭包：空

## Corelib.ssr.ssrfun.simpl_fun

NativeBridge.Incremental.simplFunIso

目标：Lean function type A → B；范围：Sort parameters; both inverse laws

```lean
(A : Sort u) → (B : Sort v) → NativeBridge.Iso (Rocq.Corelib.ssr.ssrfun.simpl_fun A B) (A → B)
```

公理闭包：空

## Corelib.ssr.ssrfun.fun_of_simpl

NativeBridge.Incremental.ssr_fun_of_simpl_agrees

目标：function projection under simplFunIso；范围：Sort parameters

```lean
∀ {A : Sort u} {B : Sort v} (f : Rocq.Corelib.ssr.ssrfun.simpl_fun A B),
  Rocq.Corelib.ssr.ssrfun.fun_of_simpl A B f = (NativeBridge.Incremental.simplFunIso A B).to f
```

公理闭包：空

## Corelib.Init.Nat.iter

NativeBridge.Incremental.nat_iter_agrees

目标：Nat.rec iteration expression；范围：Sort result; mechanical index translated by natTo

```lean
∀ {A : Sort u} (f : A → A) (x : A) (n : NativeBridge.MN),
  Rocq.Corelib.Init.Nat.iter n A f x = Nat.rec x (fun x a => f a) (NativeBridge.natTo n)
```

公理闭包：空

## Corelib.Init.Nat.iter

NativeBridge.Incremental.nat_iter_transport

目标：Nat.rec iteration expression with carrier conversion；范围：Sort carrier Iso; explicit step-function correspondence hypothesis

```lean
∀ {A : Sort u} {B : Sort v} (e : NativeBridge.Iso A B) (f : A → A) (g : B → B),
  (∀ (a : A), e.to (f a) = g (e.to a)) →
    ∀ (x : A) (n : NativeBridge.MN),
      e.to (Rocq.Corelib.Init.Nat.iter n A f x) = Nat.rec (e.to x) (fun x b => g b) (NativeBridge.natTo n)
```

公理闭包：空

## Corelib.ssr.ssrfun.cancel

NativeBridge.Incremental.ssr_cancel_agrees

目标：native quantified equality formula (see exact theorem type)；范围：Sort parameters; predicate equivalence, not a proof that arbitrary functions have the property

```lean
∀ {A : Sort u} {B : Sort v} (f : A → B) (g : B → A), Rocq.Corelib.ssr.ssrfun.cancel B A f g ↔ ∀ (x : A), g (f x) = x
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.commutative

NativeBridge.Incremental.ssr_commutative_agrees

目标：native quantified equality formula (see exact theorem type)；范围：Sort parameters; predicate equivalence, not a proof that arbitrary functions have the property

```lean
∀ {A : Sort u} {B : Sort v} (f : A → A → B), Rocq.Corelib.ssr.ssrfun.commutative A B f ↔ ∀ (x y : A), f x y = f y x
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.associative

NativeBridge.Incremental.ssr_associative_agrees

目标：native quantified equality formula (see exact theorem type)；范围：Sort parameters; predicate equivalence, not a proof that arbitrary functions have the property

```lean
∀ {A : Sort u} (f : A → A → A), Rocq.Corelib.ssr.ssrfun.associative A f ↔ ∀ (x y z : A), f x (f y z) = f (f x y) z
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.involutive

NativeBridge.Incremental.ssr_involutive_agrees

目标：native quantified equality formula (see exact theorem type)；范围：Sort parameters; predicate equivalence, not a proof that arbitrary functions have the property

```lean
∀ {A : Sort u} (f : A → A), Rocq.Corelib.ssr.ssrfun.involutive A f ↔ ∀ (x : A), f (f x) = x
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.injective

NativeBridge.Incremental.ssr_injective_agrees

目标：native quantified equality formula (see exact theorem type)；范围：Sort parameters; predicate equivalence, not a proof that arbitrary functions have the property

```lean
∀ {A : Sort u} {B : Sort v} (f : A → B), Rocq.Corelib.ssr.ssrfun.injective B A f ↔ ∀ (x y : A), f x = f y → x = y
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.eqfun

NativeBridge.Incremental.ssr_eqfun_agrees

目标：Lean function equality；范围：Sort parameters; predicate equivalence, not a proof that arbitrary functions have the property

```lean
∀ {A : Sort u} {B : Sort v} (f g : A → B), Rocq.Corelib.ssr.ssrfun.eqfun B A f g ↔ f = g
```

公理闭包：Quot.sound

## Corelib.ssr.ssrfun.eqrel

NativeBridge.Incremental.ssr_eqrel_agrees

目标：Lean function equality；范围：Sort parameters; predicate equivalence, not a proof that arbitrary functions have the property

```lean
∀ {A : Sort u} {B : Sort v} {C : Sort w} (f g : A → B → C), Rocq.Corelib.ssr.ssrfun.eqrel C B A f g ↔ f = g
```

公理闭包：Quot.sound

## Corelib.ssr.ssrfun.left_id

NativeBridge.Incremental.ssr_left_id_agrees

目标：native quantified equality formula (see exact theorem type)；范围：Sort parameters; predicate equivalence, not a proof that arbitrary functions have the property

```lean
∀ {A : Sort u} {B : Sort v} (e : A) (f : A → B → B), Rocq.Corelib.ssr.ssrfun.left_id A B e f ↔ ∀ (x : B), f e x = x
```

公理闭包：propext, Quot.sound

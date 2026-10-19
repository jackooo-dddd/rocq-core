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

## Corelib.ssr.ssrbool.pred

NativeBridge.Incremental.ssrPredIso

目标：B → Bool；范围：Type carriers with explicit Iso A B

```lean
{A : Type u} → {B : Type v} → NativeBridge.Iso A B → NativeBridge.Iso (Rocq.Corelib.ssr.ssrbool.pred A) (B → Bool)
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.rel

NativeBridge.Incremental.ssrRelIso

目标：B → B → Bool；范围：Type carriers with explicit Iso A B

```lean
{A : Type u} → {B : Type v} → NativeBridge.Iso A B → NativeBridge.Iso (Rocq.Corelib.ssr.ssrbool.rel A) (B → B → Bool)
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.reflect

NativeBridge.Incremental.reflectIso

目标：P ↔ boolTo b = true；范围：P : Prop; fixed mechanical Bool index; both inverses; reflectedDecision also gives Decidable P

```lean
(P : Prop) →
  (b : NativeBridge.RBool) →
    NativeBridge.Iso (Rocq.Corelib.Init.Datatypes.reflect P b) (P ↔ NativeBridge.boolTo b = true)
```

公理闭包：空

## Corelib.ssr.ssrbool.addb

NativeBridge.Incremental.ssr_addb_agrees

目标：Bool.xor；范围：mechanical Bool inputs

```lean
∀ (a b : NativeBridge.RBool),
  NativeBridge.boolTo (Rocq.Corelib.ssr.ssrbool.addb a b) = (NativeBridge.boolTo a ^^ NativeBridge.boolTo b)
```

公理闭包：空

## Corelib.ssr.ssrbool.if_expr

NativeBridge.Incremental.ssr_if_expr_agrees

目标：native if on Bool；范围：Sort result

```lean
∀ {C : Sort u} (b : NativeBridge.RBool) (t f : C),
  Rocq.Corelib.ssr.ssrbool.if_expr C b t f = if NativeBridge.boolTo b = true then t else f
```

公理闭包：空

## Corelib.ssr.ssrbool.isSome

NativeBridge.Incremental.ssr_isSome_agrees

目标：Option.isSome；范围：Type carriers; exact converted predicate/operation in certificate

```lean
∀ {A : Type u} (x : Rocq.Corelib.Init.Datatypes.option A),
  NativeBridge.boolTo (Rocq.Corelib.ssr.ssrbool.isSome A x) = (NativeBridge.optionTo x).isSome
```

公理闭包：空

## Corelib.ssr.ssrbool.is_inl

NativeBridge.Incremental.ssr_is_inl_agrees

目标：native Sum case expression；范围：Type carriers; exact converted predicate/operation in certificate

```lean
∀ {A : Type u} {B : Type v} (x : Rocq.Corelib.Init.Datatypes.sum A B),
  NativeBridge.boolTo (Rocq.Corelib.ssr.ssrbool.is_inl A B x) =
    match NativeBridge.sumTo x with
    | Sum.inl val => true
    | Sum.inr val => false
```

公理闭包：空

## Corelib.ssr.ssrbool.subpred

NativeBridge.Incremental.ssr_subpred_agrees

目标：native quantified Boolean/equality formula (see theorem)；范围：Type carriers; exact converted predicate/operation in certificate

```lean
∀ {A : Type u} (p q : A → NativeBridge.RBool),
  Rocq.Corelib.ssr.ssrbool.subpred A p q ↔
    ∀ (x : A), NativeBridge.boolTo (p x) = true → NativeBridge.boolTo (q x) = true
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.subrel

NativeBridge.Incremental.ssr_subrel_agrees

目标：native quantified Boolean/equality formula (see theorem)；范围：Type carriers; exact converted predicate/operation in certificate

```lean
∀ {A : Type u} (p q : A → A → NativeBridge.RBool),
  Rocq.Corelib.ssr.ssrbool.subrel A p q ↔
    ∀ (x y : A), NativeBridge.boolTo (p x y) = true → NativeBridge.boolTo (q x y) = true
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.reflexive

NativeBridge.Incremental.ssr_reflexive_agrees

目标：native quantified Boolean/equality formula (see theorem)；范围：Type carriers; exact converted predicate/operation in certificate

```lean
∀ {A : Type u} (r : A → A → NativeBridge.RBool),
  Rocq.Corelib.ssr.ssrbool.reflexive A r ↔ ∀ (x : A), NativeBridge.boolTo (r x x) = true
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.irreflexive

NativeBridge.Incremental.ssr_irreflexive_agrees

目标：native quantified Boolean/equality formula (see theorem)；范围：Type carriers; exact converted predicate/operation in certificate

```lean
∀ {A : Type u} (r : A → A → NativeBridge.RBool),
  Rocq.Corelib.ssr.ssrbool.irreflexive A r ↔ ∀ (x : A), NativeBridge.boolTo (r x x) = false
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.symmetric

NativeBridge.Incremental.ssr_symmetric_agrees

目标：native quantified Boolean/equality formula (see theorem)；范围：Type carriers; exact converted predicate/operation in certificate

```lean
∀ {A : Type u} (r : A → A → NativeBridge.RBool),
  Rocq.Corelib.ssr.ssrbool.symmetric A r ↔ ∀ (x y : A), NativeBridge.boolTo (r x y) = NativeBridge.boolTo (r y x)
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.transitive

NativeBridge.Incremental.ssr_transitive_agrees

目标：native quantified Boolean/equality formula (see theorem)；范围：Type carriers; exact converted predicate/operation in certificate

```lean
∀ {A : Type u} (r : A → A → NativeBridge.RBool),
  Rocq.Corelib.ssr.ssrbool.transitive A r ↔
    ∀ (y x z : A),
      NativeBridge.boolTo (r x y) = true → NativeBridge.boolTo (r y z) = true → NativeBridge.boolTo (r x z) = true
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.antisymmetric

NativeBridge.Incremental.ssr_antisymmetric_agrees

目标：native quantified Boolean/equality formula (see theorem)；范围：Type carriers; exact converted predicate/operation in certificate

```lean
∀ {A : Type u} (r : A → A → NativeBridge.RBool),
  Rocq.Corelib.ssr.ssrbool.antisymmetric A r ↔
    ∀ (x y : A), NativeBridge.boolTo (r x y) = true ∧ NativeBridge.boolTo (r y x) = true → x = y
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.total

NativeBridge.Incremental.ssr_total_agrees

目标：native quantified Boolean/equality formula (see theorem)；范围：Type carriers; exact converted predicate/operation in certificate

```lean
∀ {A : Type u} (r : A → A → NativeBridge.RBool),
  Rocq.Corelib.ssr.ssrbool.total A r ↔
    ∀ (x y : A), NativeBridge.boolTo (r x y) = true ∨ NativeBridge.boolTo (r y x) = true
```

公理闭包：propext, Quot.sound

## Corelib.Init.Decimal.signed_int

NativeBridge.Incremental.Decimal.signedIso

目标：Bool × List (Fin 10)；范围：all signs and digit strings, including negative zero and leading zeros

```lean
NativeBridge.Iso Rocq.Corelib.Init.Decimal.signed_int (Bool × List (Fin 10))
```

公理闭包：propext

## Corelib.Init.Decimal.revapp

NativeBridge.Incremental.Decimal.revapp_agrees

目标：List.reverse ++ accumulator；范围：all inputs; no source proof obligations

```lean
∀ (xs ys : Rocq.Corelib.Init.Decimal.uint),
  NativeBridge.decimalDigitsTo (Rocq.Corelib.Init.Decimal.revapp xs ys) =
    (NativeBridge.decimalDigitsTo xs).reverse ++ NativeBridge.decimalDigitsTo ys
```

公理闭包：propext

## Corelib.Init.Decimal.rev

NativeBridge.Incremental.Decimal.rev_agrees

目标：List.reverse；范围：all inputs; no source proof obligations

```lean
∀ (xs : Rocq.Corelib.Init.Decimal.uint),
  NativeBridge.decimalDigitsTo (Rocq.Corelib.Init.Decimal.rev xs) = (NativeBridge.decimalDigitsTo xs).reverse
```

公理闭包：propext

## Corelib.Init.Decimal.app

NativeBridge.Incremental.Decimal.app_agrees

目标：List.append；范围：all inputs; no source proof obligations

```lean
∀ (xs ys : Rocq.Corelib.Init.Decimal.uint),
  NativeBridge.decimalDigitsTo (Rocq.Corelib.Init.Decimal.app xs ys) =
    NativeBridge.decimalDigitsTo xs ++ NativeBridge.decimalDigitsTo ys
```

公理闭包：propext

## Corelib.Init.Decimal.nb_digits

NativeBridge.Incremental.Decimal.nb_digits_agrees

目标：List.length；范围：all inputs; no source proof obligations

```lean
∀ (xs : Rocq.Corelib.Init.Decimal.uint),
  NativeBridge.natTo (Rocq.Corelib.Init.Decimal.nb_digits xs) = (NativeBridge.decimalDigitsTo xs).length
```

公理闭包：propext

## Corelib.Init.Decimal.nzhead

NativeBridge.Incremental.Decimal.nzhead_agrees

目标：List.dropWhile (digit == 0)；范围：all inputs; no source proof obligations

```lean
∀ (xs : Rocq.Corelib.Init.Decimal.uint),
  NativeBridge.decimalDigitsTo (Rocq.Corelib.Init.Decimal.nzhead xs) =
    List.dropWhile (fun d => ↑d == 0) (NativeBridge.decimalDigitsTo xs)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Init.Decimal.unorm

NativeBridge.Incremental.Decimal.unorm_agrees

目标：List.dropWhile followed by empty-list replacement with [0]；范围：all inputs; no source proof obligations

```lean
∀ (xs : Rocq.Corelib.Init.Decimal.uint),
  NativeBridge.decimalDigitsTo (Rocq.Corelib.Init.Decimal.unorm xs) =
    match List.dropWhile (fun d => ↑d == 0) (NativeBridge.decimalDigitsTo xs) with
    | [] => [0]
    | ds => ds
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Init.Decimal.abs

NativeBridge.Incremental.Decimal.abs_agrees

目标：Prod.snd on sign-and-digits representation；范围：all inputs; no source proof obligations

```lean
∀ (x : Rocq.Corelib.Init.Decimal.signed_int),
  NativeBridge.decimalDigitsTo (Rocq.Corelib.Init.Decimal.abs x) = (NativeBridge.Incremental.Decimal.signedTo x).snd
```

公理闭包：空

## Corelib.Init.Decimal.opp

NativeBridge.Incremental.Decimal.opp_agrees

目标：Bool.not on sign bit; digits unchanged；范围：all inputs; no source proof obligations

```lean
∀ (x : Rocq.Corelib.Init.Decimal.signed_int),
  NativeBridge.Incremental.Decimal.signedTo (Rocq.Corelib.Init.Decimal.opp x) =
    (!(NativeBridge.Incremental.Decimal.signedTo x).fst, (NativeBridge.Incremental.Decimal.signedTo x).snd)
```

公理闭包：空

## Corelib.Init.Decimal.app_int

NativeBridge.Incremental.Decimal.app_int_agrees

目标：List.append on digits; sign unchanged；范围：all inputs; no source proof obligations

```lean
∀ (x : Rocq.Corelib.Init.Decimal.signed_int) (ds : Rocq.Corelib.Init.Decimal.uint),
  NativeBridge.Incremental.Decimal.signedTo (Rocq.Corelib.Init.Decimal.app_int x ds) =
    ((NativeBridge.Incremental.Decimal.signedTo x).fst,
      (NativeBridge.Incremental.Decimal.signedTo x).snd ++ NativeBridge.decimalDigitsTo ds)
```

公理闭包：propext

## Corelib.Init.Decimal.uint_beq

NativeBridge.Incremental.Decimal.uint_beq_agrees

目标：BEq on List (Fin 10)；范围：all inputs; no source proof obligations

```lean
∀ (xs ys : Rocq.Corelib.Init.Decimal.uint),
  NativeBridge.Incremental.Decimal.digitBoolTo (Rocq.Corelib.Init.Decimal.uint_beq xs ys) =
    (NativeBridge.decimalDigitsTo xs == NativeBridge.decimalDigitsTo ys)
```

公理闭包：propext

## Corelib.Init.Decimal.signed_int_beq

NativeBridge.Incremental.Decimal.signed_int_beq_agrees

目标：BEq on Bool × List (Fin 10)；范围：all inputs; no source proof obligations

```lean
∀ (xs ys : Rocq.Corelib.Init.Decimal.signed_int),
  NativeBridge.Incremental.Decimal.digitBoolTo (Rocq.Corelib.Init.Decimal.signed_int_beq xs ys) =
    (NativeBridge.Incremental.Decimal.signedTo xs == NativeBridge.Incremental.Decimal.signedTo ys)
```

公理闭包：propext

## Corelib.Init.Decimal.norm

NativeBridge.Incremental.Decimal.norm_agrees

目标：List.dropWhile, with either sign of zero canonicalized to (false, [0])；范围：all inputs; no source proof obligations

```lean
∀ (x : Rocq.Corelib.Init.Decimal.signed_int),
  NativeBridge.Incremental.Decimal.signedTo (Rocq.Corelib.Init.Decimal.norm x) =
    have ds := List.dropWhile (fun d => ↑d == 0) (NativeBridge.Incremental.Decimal.signedTo x).snd;
    match ds with
    | [] => (false, [0])
    | d :: rest => ((NativeBridge.Incremental.Decimal.signedTo x).fst, d :: rest)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Init.Hexadecimal.signed_int

NativeBridge.Incremental.Hexadecimal.signedIso

目标：Bool × List (Fin 16)；范围：all signs and digit strings, including negative zero and leading zeros

```lean
NativeBridge.Iso Rocq.Corelib.Init.Hexadecimal.signed_int (Bool × List (Fin 16))
```

公理闭包：propext

## Corelib.Init.Hexadecimal.revapp

NativeBridge.Incremental.Hexadecimal.revapp_agrees

目标：List.reverse ++ accumulator；范围：all inputs; no source proof obligations

```lean
∀ (xs ys : Rocq.Corelib.Init.Hexadecimal.uint),
  NativeBridge.hexadecimalDigitsTo (Rocq.Corelib.Init.Hexadecimal.revapp xs ys) =
    (NativeBridge.hexadecimalDigitsTo xs).reverse ++ NativeBridge.hexadecimalDigitsTo ys
```

公理闭包：propext

## Corelib.Init.Hexadecimal.rev

NativeBridge.Incremental.Hexadecimal.rev_agrees

目标：List.reverse；范围：all inputs; no source proof obligations

```lean
∀ (xs : Rocq.Corelib.Init.Hexadecimal.uint),
  NativeBridge.hexadecimalDigitsTo (Rocq.Corelib.Init.Hexadecimal.rev xs) =
    (NativeBridge.hexadecimalDigitsTo xs).reverse
```

公理闭包：propext

## Corelib.Init.Hexadecimal.app

NativeBridge.Incremental.Hexadecimal.app_agrees

目标：List.append；范围：all inputs; no source proof obligations

```lean
∀ (xs ys : Rocq.Corelib.Init.Hexadecimal.uint),
  NativeBridge.hexadecimalDigitsTo (Rocq.Corelib.Init.Hexadecimal.app xs ys) =
    NativeBridge.hexadecimalDigitsTo xs ++ NativeBridge.hexadecimalDigitsTo ys
```

公理闭包：propext

## Corelib.Init.Hexadecimal.nb_digits

NativeBridge.Incremental.Hexadecimal.nb_digits_agrees

目标：List.length；范围：all inputs; no source proof obligations

```lean
∀ (xs : Rocq.Corelib.Init.Hexadecimal.uint),
  NativeBridge.natTo (Rocq.Corelib.Init.Hexadecimal.nb_digits xs) = (NativeBridge.hexadecimalDigitsTo xs).length
```

公理闭包：propext

## Corelib.Init.Hexadecimal.nzhead

NativeBridge.Incremental.Hexadecimal.nzhead_agrees

目标：List.dropWhile (digit == 0)；范围：all inputs; no source proof obligations

```lean
∀ (xs : Rocq.Corelib.Init.Hexadecimal.uint),
  NativeBridge.hexadecimalDigitsTo (Rocq.Corelib.Init.Hexadecimal.nzhead xs) =
    List.dropWhile (fun d => ↑d == 0) (NativeBridge.hexadecimalDigitsTo xs)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Init.Hexadecimal.unorm

NativeBridge.Incremental.Hexadecimal.unorm_agrees

目标：List.dropWhile followed by empty-list replacement with [0]；范围：all inputs; no source proof obligations

```lean
∀ (xs : Rocq.Corelib.Init.Hexadecimal.uint),
  NativeBridge.hexadecimalDigitsTo (Rocq.Corelib.Init.Hexadecimal.unorm xs) =
    match List.dropWhile (fun d => ↑d == 0) (NativeBridge.hexadecimalDigitsTo xs) with
    | [] => [0]
    | ds => ds
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Init.Hexadecimal.abs

NativeBridge.Incremental.Hexadecimal.abs_agrees

目标：Prod.snd on sign-and-digits representation；范围：all inputs; no source proof obligations

```lean
∀ (x : Rocq.Corelib.Init.Hexadecimal.signed_int),
  NativeBridge.hexadecimalDigitsTo (Rocq.Corelib.Init.Hexadecimal.abs x) =
    (NativeBridge.Incremental.Hexadecimal.signedTo x).snd
```

公理闭包：空

## Corelib.Init.Hexadecimal.opp

NativeBridge.Incremental.Hexadecimal.opp_agrees

目标：Bool.not on sign bit; digits unchanged；范围：all inputs; no source proof obligations

```lean
∀ (x : Rocq.Corelib.Init.Hexadecimal.signed_int),
  NativeBridge.Incremental.Hexadecimal.signedTo (Rocq.Corelib.Init.Hexadecimal.opp x) =
    (!(NativeBridge.Incremental.Hexadecimal.signedTo x).fst, (NativeBridge.Incremental.Hexadecimal.signedTo x).snd)
```

公理闭包：空

## Corelib.Init.Hexadecimal.app_int

NativeBridge.Incremental.Hexadecimal.app_int_agrees

目标：List.append on digits; sign unchanged；范围：all inputs; no source proof obligations

```lean
∀ (x : Rocq.Corelib.Init.Hexadecimal.signed_int) (ds : Rocq.Corelib.Init.Hexadecimal.uint),
  NativeBridge.Incremental.Hexadecimal.signedTo (Rocq.Corelib.Init.Hexadecimal.app_int x ds) =
    ((NativeBridge.Incremental.Hexadecimal.signedTo x).fst,
      (NativeBridge.Incremental.Hexadecimal.signedTo x).snd ++ NativeBridge.hexadecimalDigitsTo ds)
```

公理闭包：propext

## Corelib.Init.Hexadecimal.uint_beq

NativeBridge.Incremental.Hexadecimal.uint_beq_agrees

目标：BEq on List (Fin 16)；范围：all inputs; no source proof obligations

```lean
∀ (xs ys : Rocq.Corelib.Init.Hexadecimal.uint),
  NativeBridge.Incremental.Hexadecimal.digitBoolTo (Rocq.Corelib.Init.Hexadecimal.uint_beq xs ys) =
    (NativeBridge.hexadecimalDigitsTo xs == NativeBridge.hexadecimalDigitsTo ys)
```

公理闭包：propext

## Corelib.Init.Hexadecimal.signed_int_beq

NativeBridge.Incremental.Hexadecimal.signed_int_beq_agrees

目标：BEq on Bool × List (Fin 16)；范围：all inputs; no source proof obligations

```lean
∀ (xs ys : Rocq.Corelib.Init.Hexadecimal.signed_int),
  NativeBridge.Incremental.Hexadecimal.digitBoolTo (Rocq.Corelib.Init.Hexadecimal.signed_int_beq xs ys) =
    (NativeBridge.Incremental.Hexadecimal.signedTo xs == NativeBridge.Incremental.Hexadecimal.signedTo ys)
```

公理闭包：propext

## Corelib.Init.Hexadecimal.norm

NativeBridge.Incremental.Hexadecimal.norm_agrees

目标：List.dropWhile, with either sign of zero canonicalized to (false, [0])；范围：all inputs; no source proof obligations

```lean
∀ (x : Rocq.Corelib.Init.Hexadecimal.signed_int),
  NativeBridge.Incremental.Hexadecimal.signedTo (Rocq.Corelib.Init.Hexadecimal.norm x) =
    have ds := List.dropWhile (fun d => ↑d == 0) (NativeBridge.Incremental.Hexadecimal.signedTo x).snd;
    match ds with
    | [] => (false, [0])
    | d :: rest => ((NativeBridge.Incremental.Hexadecimal.signedTo x).fst, d :: rest)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Init.Number.uint

NativeBridge.Incremental.numberUintIso

目标：Sum (List (Fin 10)) (List (Fin 16))；范围：radix tag and exact digits preserved

```lean
NativeBridge.Iso Rocq.Corelib.Init.Number.uint (List (Fin 10) ⊕ List (Fin 16))
```

公理闭包：propext

## Corelib.Init.Nat.of_uint

NativeBridge.Incremental.decimal_read_agrees

目标：List.foldl (fun acc digit => 10 * acc + digit.val)；范围：all digit strings, including empty/leading-zero strings; zero accumulator; numeric reading is not a bijection

```lean
∀ (ds : Rocq.Corelib.Init.Decimal.uint),
  NativeBridge.natTo (Rocq.Corelib.Init.Nat.of_uint ds) =
    List.foldl (fun a d => 10 * a + ↑d) 0 (NativeBridge.decimalDigitsTo ds)
```

公理闭包：propext, Quot.sound

## Corelib.Init.Nat.of_uint_acc

NativeBridge.Incremental.decimal_read_acc_agrees

目标：List.foldl (fun acc digit => 10 * acc + digit.val)；范围：all digit strings, including empty/leading-zero strings; arbitrary accumulator; numeric reading is not a bijection

```lean
∀ (ds : Rocq.Corelib.Init.Decimal.uint) (acc : NativeBridge.MN),
  NativeBridge.natTo (Rocq.Corelib.Init.Nat.of_uint_acc ds acc) =
    List.foldl (fun a d => 10 * a + ↑d) (NativeBridge.natTo acc) (NativeBridge.decimalDigitsTo ds)
```

公理闭包：propext, Quot.sound

## Corelib.Init.Nat.of_hex_uint

NativeBridge.Incremental.hexadecimal_read_agrees

目标：List.foldl (fun acc digit => 16 * acc + digit.val)；范围：all digit strings, including empty/leading-zero strings; zero accumulator; numeric reading is not a bijection

```lean
∀ (ds : Rocq.Corelib.Init.Hexadecimal.uint),
  NativeBridge.natTo (Rocq.Corelib.Init.Nat.of_hex_uint ds) =
    List.foldl (fun a d => 16 * a + ↑d) 0 (NativeBridge.hexadecimalDigitsTo ds)
```

公理闭包：propext, Quot.sound

## Corelib.Init.Nat.of_hex_uint_acc

NativeBridge.Incremental.hexadecimal_read_acc_agrees

目标：List.foldl (fun acc digit => 16 * acc + digit.val)；范围：all digit strings, including empty/leading-zero strings; arbitrary accumulator; numeric reading is not a bijection

```lean
∀ (ds : Rocq.Corelib.Init.Hexadecimal.uint) (acc : NativeBridge.MN),
  NativeBridge.natTo (Rocq.Corelib.Init.Nat.of_hex_uint_acc ds acc) =
    List.foldl (fun a d => 16 * a + ↑d) (NativeBridge.natTo acc) (NativeBridge.hexadecimalDigitsTo ds)
```

公理闭包：propext, Quot.sound

## Corelib.Init.Nat.of_num_uint

NativeBridge.Incremental.number_read_agrees

目标：Sum case dispatch to radix-10 or radix-16 List.foldl；范围：both radix tags; numeric reading is not a bijection

```lean
∀ (ds : Rocq.Corelib.Init.Number.uint),
  NativeBridge.natTo (Rocq.Corelib.Init.Nat.of_num_uint ds) =
    match NativeBridge.Incremental.numberUintTo ds with
    | Sum.inl xs => List.foldl (fun a d => 10 * a + ↑d) 0 xs
    | Sum.inr xs => List.foldl (fun a d => 16 * a + ↑d) 0 xs
```

公理闭包：propext, Quot.sound

## Corelib.Init.Wf.Acc

NativeBridge.Incremental.accIso

目标：Lean Acc R x；范围：A : Type u; arbitrary relation and index; proof irrelevance supplies inverse laws

```lean
{A : Type u} → (R : A → A → Prop) → (x : A) → NativeBridge.Iso (Rocq.Corelib.Init.Wf.Acc A R x) (Acc R x)
```

公理闭包：空

## Corelib.Init.Wf.well_founded

NativeBridge.Incremental.well_founded_agrees

目标：Lean WellFounded；范围：A : Type u; arbitrary relation; iff of predicates

```lean
∀ {A : Type u} (R : A → A → Prop), Rocq.Corelib.Init.Wf.well_founded A R ↔ WellFounded R
```

公理闭包：空

## Corelib.Init.Wf.Fix_F

NativeBridge.Incremental.fixF_agrees

目标：WellFounded.fixF；范围：A : Type u; P : A → Type v; arbitrary recursive step; accessibility converted

```lean
∀ {A : Type u} (R : A → A → Prop) (P : A → Type v) (F : (x : A) → ((y : A) → R y x → P y) → P x) (x : A)
  (a : Rocq.Corelib.Init.Wf.Acc A R x), Rocq.Corelib.Init.Wf.Fix_F A R P F x a = WellFounded.fixF F x ⋯
```

公理闭包：Quot.sound

## Corelib.Init.Wf.Fix

NativeBridge.Incremental.fix_agrees

目标：WellFounded.fix；范围：A : Type u; P : A → Type v; arbitrary recursive step; well-foundedness converted

```lean
∀ {A : Type u} (R : A → A → Prop) (wf : Rocq.Corelib.Init.Wf.well_founded A R) (P : A → Type v)
  (F : (x : A) → ((y : A) → R y x → P y) → P x) (x : A), Rocq.Corelib.Init.Wf.Fix A R wf P F x = ⋯.fix F x
```

公理闭包：Quot.sound

## Corelib.Init.Wf.Acc_rect

NativeBridge.Incremental.acc_rect_native_callback

目标：Acc.rec；范围：A : Type u; P : A → Type v; native callback transported across Acc conversion

```lean
∀ {A : Type u} (R : A → A → Prop) (P : A → Type v)
  (G : (x : A) → (∀ (y : A), R y x → Acc R y) → ((y : A) → R y x → P y) → P x) (x : A)
  (a : Rocq.Corelib.Init.Wf.Acc A R x), Rocq.Corelib.Init.Wf.Acc_rect A R P (fun x h ih => G x ⋯ ih) x a = Acc.rec G ⋯
```

公理闭包：Quot.sound

## Corelib.Init.Wf.Acc_rec

NativeBridge.Incremental.acc_rec_native_callback

目标：Acc.rec；范围：A : Type u; P : A → Type; native callback transported across Acc conversion

```lean
∀ {A : Type u} (R : A → A → Prop) (P : A → Type)
  (G : (x : A) → (∀ (y : A), R y x → Acc R y) → ((y : A) → R y x → P y) → P x) (x : A)
  (a : Rocq.Corelib.Init.Wf.Acc A R x), Rocq.Corelib.Init.Wf.Acc_rec A R P (fun x h ih => G x ⋯ ih) x a = Acc.rec G ⋯
```

公理闭包：Quot.sound

## Corelib.Init.Wf.well_founded_induction_type

NativeBridge.Incremental.well_founded_induction_type_agrees

目标：WellFounded.fix；范围：A : Type u; P : A → Type v; arbitrary recursive step

```lean
∀ {A : Type u} (R : A → A → Prop) (wf : Rocq.Corelib.Init.Wf.well_founded A R) (P : A → Type v)
  (F : (x : A) → ((y : A) → R y x → P y) → P x) (x : A),
  Rocq.Corelib.Init.Wf.well_founded_induction_type A R wf P F x = ⋯.fix F x
```

公理闭包：Quot.sound

## Corelib.Init.Wf.well_founded_induction

NativeBridge.Incremental.well_founded_induction_agrees

目标：WellFounded.fix；范围：A : Type u; P : A → Type; arbitrary recursive step

```lean
∀ {A : Type u} (R : A → A → Prop) (wf : Rocq.Corelib.Init.Wf.well_founded A R) (P : A → Type)
  (F : (x : A) → ((y : A) → R y x → P y) → P x) (x : A),
  Rocq.Corelib.Init.Wf.well_founded_induction A R wf P F x = ⋯.fix F x
```

公理闭包：Quot.sound

## Corelib.Init.Decimal.internal_uint_dec_bl

NativeBridge.Incremental.Decimal.uint_dec_bl_native

目标：∀ (x y : List (Fin 10)), (x == y) = true → x = y；范围：all representations, including empty, leading-zero and signed-zero cases; native target uses only Bool/List/Fin/Prod/BEq/Eq

```lean
Rocq.Corelib.Init.Decimal.internal_uint_dec_bl.statement ↔ ∀ (x y : List (Fin 10)), (x == y) = true → x = y
```

公理闭包：propext

## Corelib.Init.Decimal.internal_uint_dec_lb

NativeBridge.Incremental.Decimal.uint_dec_lb_native

目标：∀ (x y : List (Fin 10)), x = y → (x == y) = true；范围：all representations, including empty, leading-zero and signed-zero cases; native target uses only Bool/List/Fin/Prod/BEq/Eq

```lean
Rocq.Corelib.Init.Decimal.internal_uint_dec_lb.statement ↔ ∀ (x y : List (Fin 10)), x = y → (x == y) = true
```

公理闭包：propext

## Corelib.Init.Decimal.internal_signed_int_dec_bl

NativeBridge.Incremental.Decimal.signed_int_dec_bl_native

目标：∀ (x y : Bool × List (Fin 10)), (x == y) = true → x = y；范围：all representations, including empty, leading-zero and signed-zero cases; native target uses only Bool/List/Fin/Prod/BEq/Eq

```lean
Rocq.Corelib.Init.Decimal.internal_signed_int_dec_bl.statement ↔ ∀ (x y : Bool × List (Fin 10)), (x == y) = true → x = y
```

公理闭包：propext

## Corelib.Init.Decimal.internal_signed_int_dec_lb

NativeBridge.Incremental.Decimal.signed_int_dec_lb_native

目标：∀ (x y : Bool × List (Fin 10)), x = y → (x == y) = true；范围：all representations, including empty, leading-zero and signed-zero cases; native target uses only Bool/List/Fin/Prod/BEq/Eq

```lean
Rocq.Corelib.Init.Decimal.internal_signed_int_dec_lb.statement ↔ ∀ (x y : Bool × List (Fin 10)), x = y → (x == y) = true
```

公理闭包：propext

## Corelib.Init.Hexadecimal.internal_uint_dec_bl0

NativeBridge.Incremental.Hexadecimal.uint_dec_bl_native

目标：∀ (x y : List (Fin 16)), (x == y) = true → x = y；范围：all representations, including empty, leading-zero and signed-zero cases; native target uses only Bool/List/Fin/Prod/BEq/Eq

```lean
Rocq.Corelib.Init.Hexadecimal.internal_uint_dec_bl0.statement ↔ ∀ (x y : List (Fin 16)), (x == y) = true → x = y
```

公理闭包：propext

## Corelib.Init.Hexadecimal.internal_uint_dec_lb0

NativeBridge.Incremental.Hexadecimal.uint_dec_lb_native

目标：∀ (x y : List (Fin 16)), x = y → (x == y) = true；范围：all representations, including empty, leading-zero and signed-zero cases; native target uses only Bool/List/Fin/Prod/BEq/Eq

```lean
Rocq.Corelib.Init.Hexadecimal.internal_uint_dec_lb0.statement ↔ ∀ (x y : List (Fin 16)), x = y → (x == y) = true
```

公理闭包：propext

## Corelib.Init.Hexadecimal.internal_signed_int_dec_bl0

NativeBridge.Incremental.Hexadecimal.signed_int_dec_bl_native

目标：∀ (x y : Bool × List (Fin 16)), (x == y) = true → x = y；范围：all representations, including empty, leading-zero and signed-zero cases; native target uses only Bool/List/Fin/Prod/BEq/Eq

```lean
Rocq.Corelib.Init.Hexadecimal.internal_signed_int_dec_bl0.statement ↔
  ∀ (x y : Bool × List (Fin 16)), (x == y) = true → x = y
```

公理闭包：propext

## Corelib.Init.Hexadecimal.internal_signed_int_dec_lb0

NativeBridge.Incremental.Hexadecimal.signed_int_dec_lb_native

目标：∀ (x y : Bool × List (Fin 16)), x = y → (x == y) = true；范围：all representations, including empty, leading-zero and signed-zero cases; native target uses only Bool/List/Fin/Prod/BEq/Eq

```lean
Rocq.Corelib.Init.Hexadecimal.internal_signed_int_dec_lb0.statement ↔
  ∀ (x y : Bool × List (Fin 16)), x = y → (x == y) = true
```

公理闭包：propext

## Corelib.Init.Specif.sig

NativeBridge.Incremental.subtypeIso

目标：Subtype P；范围：full source Sort universes; broadens an already-covered root without adding a type root

```lean
(A : Sort u) → (P : A → Prop) → NativeBridge.Iso (Rocq.Corelib.Init.Specif.sig A P) (Subtype P)
```

公理闭包：空

## Corelib.Init.Specif.sig2

NativeBridge.Incremental.subtype2Iso

目标：Subtype (fun x => P x ∧ Q x)；范围：full source Sort universes; broadens an already-covered root without adding a type root

```lean
(A : Sort u) → (P Q : A → Prop) → NativeBridge.Iso (Rocq.Corelib.Init.Specif.sig2 A P Q) { x // P x ∧ Q x }
```

公理闭包：空

## Corelib.Init.Specif.sigT

NativeBridge.Incremental.psigmaIso

目标：PSigma P；范围：full source Sort universes; broadens an already-covered root without adding a type root

```lean
(A : Sort u) → (P : A → Sort v) → NativeBridge.Iso (Rocq.Corelib.Init.Specif.sigT A P) (PSigma P)
```

公理闭包：空

## Corelib.Init.Specif.sigT2

NativeBridge.Incremental.psigma2Iso

目标：PSigma (fun x => PProd (P x) (Q x))；范围：full source Sort universes; broadens an already-covered root without adding a type root

```lean
(A : Sort u) →
  (P : A → Sort v) → (Q : A → Sort w) → NativeBridge.Iso (Rocq.Corelib.Init.Specif.sigT2 A P Q) ((x : A) ×' P x ×' Q x)
```

公理闭包：空

## Corelib.Init.Datatypes.prod

NativeBridge.Incremental.pprodIso

目标：PProd A B；范围：full source Sort universes; broadens an already-covered root without adding a type root

```lean
(A : Sort u) → (B : Sort v) → NativeBridge.Iso (Rocq.Corelib.Init.Datatypes.prod A B) (A ×' B)
```

公理闭包：空

## Corelib.Init.Specif.prod_of_sigT

NativeBridge.Incremental.prod_of_sigT_agrees

目标：PSigma components → PProd；范围：full Sort carrier/family universes; dependent native motive retained; *_rec motive ends in Type, *_rect in Sort

```lean
∀ {A : Sort u} {B : Sort v} (s : Rocq.Corelib.Init.Specif.sigT A fun x => B),
  NativeBridge.Incremental.pprodTo (Rocq.Corelib.Init.Specif.prod_of_sigT A B s) =
    ⟨(NativeBridge.Incremental.psigmaTo s).fst, (NativeBridge.Incremental.psigmaTo s).snd⟩
```

公理闭包：空

## Corelib.Init.Specif.sigT_of_prod

NativeBridge.Incremental.sigT_of_prod_agrees

目标：PProd components → PSigma；范围：full Sort carrier/family universes; dependent native motive retained; *_rec motive ends in Type, *_rect in Sort

```lean
∀ {A : Sort u} {B : Sort v} (s : Rocq.Corelib.Init.Datatypes.prod A B),
  NativeBridge.Incremental.psigmaTo (Rocq.Corelib.Init.Specif.sigT_of_prod A B s) =
    ⟨(NativeBridge.Incremental.pprodTo s).fst, (NativeBridge.Incremental.pprodTo s).snd⟩
```

公理闭包：空

## Corelib.Init.Specif.sigT_of_sigT2

NativeBridge.Incremental.sigT_of_sigT2_agrees

目标：PSigma/PProd projection dropping the third component；范围：full Sort carrier/family universes; dependent native motive retained; *_rec motive ends in Type, *_rect in Sort

```lean
∀ {A : Sort u} {P : A → Sort v} {Q : A → Sort w} (s : Rocq.Corelib.Init.Specif.sigT2 A P Q),
  NativeBridge.Incremental.psigmaTo (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A P Q s) =
    ⟨(NativeBridge.Incremental.psigma2To s).fst, (NativeBridge.Incremental.psigma2To s).snd.fst⟩
```

公理闭包：空

## Corelib.Init.Specif.projT3

NativeBridge.Incremental.projT3_agrees

目标：PSigma.snd.snd (dependent equality stated as HEq)；范围：full Sort carrier/family universes; dependent native motive retained; *_rec motive ends in Type, *_rect in Sort

```lean
∀ {A : Sort u} {P : A → Sort v} {Q : A → Sort w} (s : Rocq.Corelib.Init.Specif.sigT2 A P Q),
  Rocq.Corelib.Init.Specif.projT3 A P Q s ≍ (NativeBridge.Incremental.psigma2To s).snd.snd
```

公理闭包：空

## Corelib.Init.Specif.sig_rect

NativeBridge.Incremental.sig_rect_agrees

目标：Subtype.rec；范围：full Sort carrier/family universes; dependent native motive retained; *_rec motive ends in Type, *_rect in Sort

```lean
∀ {A : Sort u} (P : A → Prop) (C : Subtype P → Sort z) (f : (x : A) → (h : P x) → C ⟨x, h⟩)
  (s : Rocq.Corelib.Init.Specif.sig A P),
  Rocq.Corelib.Init.Specif.sig_rect A P (fun s => C (NativeBridge.Incremental.subtypeTo s)) f s =
    Subtype.rec f (NativeBridge.Incremental.subtypeTo s)
```

公理闭包：空

## Corelib.Init.Specif.sig_rec

NativeBridge.Incremental.sig_rec_agrees

目标：Subtype.rec；范围：full Sort carrier/family universes; dependent native motive retained; *_rec motive ends in Type, *_rect in Sort

```lean
∀ {A : Sort u} (P : A → Prop) (C : Subtype P → Type) (f : (x : A) → (h : P x) → C ⟨x, h⟩)
  (s : Rocq.Corelib.Init.Specif.sig A P),
  Rocq.Corelib.Init.Specif.sig_rec A P (fun s => C (NativeBridge.Incremental.subtypeTo s)) f s =
    Subtype.rec f (NativeBridge.Incremental.subtypeTo s)
```

公理闭包：空

## Corelib.Init.Specif.sig2_rect

NativeBridge.Incremental.sig2_rect_agrees

目标：Subtype.rec with And.left/right；范围：full Sort carrier/family universes; dependent native motive retained; *_rec motive ends in Type, *_rect in Sort

```lean
∀ {A : Sort u} (P Q : A → Prop) (C : { x // P x ∧ Q x } → Sort z) (f : (x : A) → (hp : P x) → (hq : Q x) → C ⟨x, ⋯⟩)
  (s : Rocq.Corelib.Init.Specif.sig2 A P Q),
  Rocq.Corelib.Init.Specif.sig2_rect A P Q (fun s => C (NativeBridge.Incremental.subtype2To s)) f s =
    Subtype.rec (fun x h => f x ⋯ ⋯) (NativeBridge.Incremental.subtype2To s)
```

公理闭包：空

## Corelib.Init.Specif.sig2_rec

NativeBridge.Incremental.sig2_rec_agrees

目标：Subtype.rec with And.left/right；范围：full Sort carrier/family universes; dependent native motive retained; *_rec motive ends in Type, *_rect in Sort

```lean
∀ {A : Sort u} (P Q : A → Prop) (C : { x // P x ∧ Q x } → Type) (f : (x : A) → (hp : P x) → (hq : Q x) → C ⟨x, ⋯⟩)
  (s : Rocq.Corelib.Init.Specif.sig2 A P Q),
  Rocq.Corelib.Init.Specif.sig2_rec A P Q (fun s => C (NativeBridge.Incremental.subtype2To s)) f s =
    Subtype.rec (fun x h => f x ⋯ ⋯) (NativeBridge.Incremental.subtype2To s)
```

公理闭包：空

## Corelib.Init.Specif.sigT_rect

NativeBridge.Incremental.sigT_rect_agrees

目标：PSigma.rec；范围：full Sort carrier/family universes; dependent native motive retained; *_rec motive ends in Type, *_rect in Sort

```lean
∀ {A : Sort u} (P : A → Sort v) (C : PSigma P → Sort z) (f : (x : A) → (p : P x) → C ⟨x, p⟩)
  (s : Rocq.Corelib.Init.Specif.sigT A P),
  Rocq.Corelib.Init.Specif.sigT_rect A P (fun s => C (NativeBridge.Incremental.psigmaTo s)) f s =
    PSigma.rec f (NativeBridge.Incremental.psigmaTo s)
```

公理闭包：空

## Corelib.Init.Specif.sigT_rec

NativeBridge.Incremental.sigT_rec_agrees

目标：PSigma.rec；范围：full Sort carrier/family universes; dependent native motive retained; *_rec motive ends in Type, *_rect in Sort

```lean
∀ {A : Sort u} (P : A → Sort v) (C : PSigma P → Type) (f : (x : A) → (p : P x) → C ⟨x, p⟩)
  (s : Rocq.Corelib.Init.Specif.sigT A P),
  Rocq.Corelib.Init.Specif.sigT_rec A P (fun s => C (NativeBridge.Incremental.psigmaTo s)) f s =
    PSigma.rec f (NativeBridge.Incremental.psigmaTo s)
```

公理闭包：空

## Corelib.Init.Specif.sigT2_rect

NativeBridge.Incremental.sigT2_rect_agrees

目标：PSigma/PProd dependent pattern elimination；范围：full Sort carrier/family universes; dependent native motive retained; *_rec motive ends in Type, *_rect in Sort

```lean
∀ {A : Sort u} (P : A → Sort v) (Q : A → Sort w) (C : (x : A) ×' P x ×' Q x → Sort z)
  (f : (x : A) → (p : P x) → (q : Q x) → C ⟨x, ⟨p, q⟩⟩) (s : Rocq.Corelib.Init.Specif.sigT2 A P Q),
  Rocq.Corelib.Init.Specif.sigT2_rect A P Q (fun s => C (NativeBridge.Incremental.psigma2To s)) f s =
    match NativeBridge.Incremental.psigma2To s with
    | ⟨x, ⟨p, q⟩⟩ => f x p q
```

公理闭包：空

## Corelib.Init.Specif.sigT2_rec

NativeBridge.Incremental.sigT2_rec_agrees

目标：PSigma/PProd dependent pattern elimination；范围：full Sort carrier/family universes; dependent native motive retained; *_rec motive ends in Type, *_rect in Sort

```lean
∀ {A : Sort u} (P : A → Sort v) (Q : A → Sort w) (C : (x : A) ×' P x ×' Q x → Type)
  (f : (x : A) → (p : P x) → (q : Q x) → C ⟨x, ⟨p, q⟩⟩) (s : Rocq.Corelib.Init.Specif.sigT2 A P Q),
  Rocq.Corelib.Init.Specif.sigT2_rec A P Q (fun s => C (NativeBridge.Incremental.psigma2To s)) f s =
    match NativeBridge.Incremental.psigma2To s with
    | ⟨x, ⟨p, q⟩⟩ => f x p q
```

公理闭包：空

## Corelib.Init.Specif.sigT_of_sig

NativeBridge.Incremental.sigT_of_sig_closed_agrees

目标：Subtype → PSigma proof pair；范围：Sort carrier; Prop predicates; all extracted proof parameters explicitly instantiated with checked closed witnesses

```lean
∀ {A : Sort u} (P : A → Prop) (s : Rocq.Corelib.Init.Specif.sig A P),
  NativeBridge.Incremental.psigmaTo (RocqPending.Corelib.Init.Specif.sigT_of_sig A P s) =
    ⟨(NativeBridge.Incremental.subtypeTo s).val, ⋯⟩
```

公理闭包：空

## Corelib.Init.Specif.sig_of_sigT

NativeBridge.Incremental.sig_of_sigT_closed_agrees

目标：PSigma proof pair → Subtype；范围：Sort carrier; Prop predicates; all extracted proof parameters explicitly instantiated with checked closed witnesses

```lean
∀ {A : Sort u} (P : A → Prop) (s : Rocq.Corelib.Init.Specif.sigT A P),
  NativeBridge.Incremental.subtypeTo (RocqPending.Corelib.Init.Specif.sig_of_sigT A P s) =
    ⟨(NativeBridge.Incremental.psigmaTo s).fst, ⋯⟩
```

公理闭包：空

## Corelib.Init.Specif.sig_of_sig2

NativeBridge.Incremental.sig_of_sig2_closed_agrees

目标：Subtype (P ∧ Q) → Subtype P；范围：Sort carrier; Prop predicates; all extracted proof parameters explicitly instantiated with checked closed witnesses

```lean
∀ {A : Sort u} (P Q : A → Prop) (s : Rocq.Corelib.Init.Specif.sig2 A P Q),
  NativeBridge.Incremental.subtypeTo (RocqPending.Corelib.Init.Specif.sig_of_sig2 A P Q s) =
    ⟨(NativeBridge.Incremental.subtype2To s).val, ⋯⟩
```

公理闭包：空

## Corelib.Init.Specif.sigT2_of_sig2

NativeBridge.Incremental.sigT2_of_sig2_closed_agrees

目标：Subtype (P ∧ Q) → PSigma (fun x => PProd (P x) (Q x))；范围：Sort carrier; Prop predicates; all extracted proof parameters explicitly instantiated with checked closed witnesses

```lean
∀ {A : Sort u} (P Q : A → Prop) (s : Rocq.Corelib.Init.Specif.sig2 A P Q),
  NativeBridge.Incremental.psigma2To (RocqPending.Corelib.Init.Specif.sigT2_of_sig2 A P Q s) =
    ⟨(NativeBridge.Incremental.subtype2To s).val, ⟨⋯, ⋯⟩⟩
```

公理闭包：空

## Corelib.Init.Wf.Fix_F_2

NativeBridge.Incremental.fixF2_agrees

目标：WellFounded.fixF on native Prod；范围：A : Type u, B : Type v, P : A → B → Type w; native relation pulled back through prodTo; native step; both component universes and dependent result family retained

```lean
∀ {A : Type u} {B : Type v} (R : A × B → A × B → Prop) (P : A → B → Type w)
  (F : (x : A) → (y : B) → ((a : A) → (b : B) → R (a, b) (x, y) → P a b) → P x y) (x : A) (y : B)
  (ac :
    Rocq.Corelib.Init.Wf.Acc (Rocq.Corelib.Init.Datatypes.prod A B)
      (fun p q => R (NativeBridge.prodTo p) (NativeBridge.prodTo q)) (Rocq.Corelib.Init.Datatypes.prod.pair A B x y)),
  Rocq.Corelib.Init.Wf.Fix_F_2 A B (fun p q => R (NativeBridge.prodTo p) (NativeBridge.prodTo q)) P F x y ac =
    WellFounded.fixF (fun p rec => F p.fst p.snd fun a b h => rec (a, b) h) (x, y) ⋯
```

公理闭包：Quot.sound

## Corelib.Init.Wf.well_founded_induction_type_2

NativeBridge.Incremental.well_founded_induction_type_2_agrees

目标：WellFounded.fix on native Prod；范围：A : Type u, B : Type v, P : A → B → Type w; native relation pulled back through prodTo; native step; both component universes and dependent result family retained

```lean
∀ {A : Type u} {B : Type v} (R : A × B → A × B → Prop) (P : A → B → Type w)
  (wf :
    Rocq.Corelib.Init.Wf.well_founded (Rocq.Corelib.Init.Datatypes.prod A B) fun p q =>
      R (NativeBridge.prodTo p) (NativeBridge.prodTo q))
  (F : (x : A) → (y : B) → ((a : A) → (b : B) → R (a, b) (x, y) → P a b) → P x y) (x : A) (y : B),
  Rocq.Corelib.Init.Wf.well_founded_induction_type_2 A B (fun p q => R (NativeBridge.prodTo p) (NativeBridge.prodTo q))
      P wf F x y =
    ⋯.fix (fun p rec => F p.fst p.snd fun a b h => rec (a, b) h) (x, y)
```

公理闭包：Quot.sound

## Corelib.Init.Datatypes.sum

NativeBridge.Incremental.psumIso

目标：PSum A B；范围：A : Sort u, B : Sort v; broadens the previously covered Type-only sum root

```lean
(A : Sort u) → (B : Sort v) → NativeBridge.Iso (Rocq.Corelib.Init.Datatypes.sum A B) (A ⊕' B)
```

公理闭包：空

## Corelib.Init.Datatypes.bool_rec

NativeBridge.Incremental.datatypes_bool_rec_agrees

目标：Bool.rec；范围：fixed datatype; dependent native motive; result Type

```lean
∀ (P : Bool → Type) (t : P true) (f : P false) (b : NativeBridge.RBool),
  Rocq.Corelib.Init.Datatypes.bool_rec (fun b => P (NativeBridge.boolTo b)) t f b = Bool.rec f t (NativeBridge.boolTo b)
```

公理闭包：空

## Corelib.Init.Datatypes.bool_rect

NativeBridge.Incremental.datatypes_bool_rect_agrees

目标：Bool.rec；范围：fixed datatype; dependent native motive; result Sort z

```lean
∀ (P : Bool → Sort z) (t : P true) (f : P false) (b : NativeBridge.RBool),
  Rocq.Corelib.Init.Datatypes.bool_rect (fun b => P (NativeBridge.boolTo b)) t f b =
    Bool.rec f t (NativeBridge.boolTo b)
```

公理闭包：空

## Corelib.Init.Datatypes.comparison_rec

NativeBridge.Incremental.datatypes_comparison_rec_agrees

目标：Ordering.rec；范围：fixed datatype; dependent native motive; result Type

```lean
∀ (P : Ordering → Type) (e : P Ordering.eq) (l : P Ordering.lt) (g : P Ordering.gt) (c : NativeBridge.RComparison),
  Rocq.Corelib.Init.Datatypes.comparison_rec (fun c => P (NativeBridge.comparisonTo c)) e l g c =
    Ordering.rec l e g (NativeBridge.comparisonTo c)
```

公理闭包：空

## Corelib.Init.Datatypes.comparison_rect

NativeBridge.Incremental.datatypes_comparison_rect_agrees

目标：Ordering.rec；范围：fixed datatype; dependent native motive; result Sort z

```lean
∀ (P : Ordering → Sort z) (e : P Ordering.eq) (l : P Ordering.lt) (g : P Ordering.gt) (c : NativeBridge.RComparison),
  Rocq.Corelib.Init.Datatypes.comparison_rect (fun c => P (NativeBridge.comparisonTo c)) e l g c =
    Ordering.rec l e g (NativeBridge.comparisonTo c)
```

公理闭包：空

## Corelib.Init.Datatypes.unit_rec

NativeBridge.Incremental.datatypes_unit_rec_agrees

目标：PUnit.rec (Unit alias)；范围：fixed datatype; dependent native motive; result Type

```lean
∀ (P : Unit → Type) (h : P ()) (s : Rocq.Corelib.Init.Datatypes.unit),
  Rocq.Corelib.Init.Datatypes.unit_rec (fun s => P (NativeBridge.unitIso.to s)) h s =
    PUnit.rec h (NativeBridge.unitIso.to s)
```

公理闭包：空

## Corelib.Init.Datatypes.unit_rect

NativeBridge.Incremental.datatypes_unit_rect_agrees

目标：PUnit.rec (Unit alias)；范围：fixed datatype; dependent native motive; result Sort z

```lean
∀ (P : Unit → Sort z) (h : P ()) (s : Rocq.Corelib.Init.Datatypes.unit),
  Rocq.Corelib.Init.Datatypes.unit_rect (fun s => P (NativeBridge.unitIso.to s)) h s =
    PUnit.rec h (NativeBridge.unitIso.to s)
```

公理闭包：空

## Corelib.Init.Datatypes.Empty_set_rec

NativeBridge.Incremental.datatypes_Empty_set_rec_agrees

目标：Empty.rec；范围：fixed datatype; dependent native motive; result Type

```lean
∀ (P : Empty → Type) (s : Rocq.Corelib.Init.Datatypes.Empty_set),
  Rocq.Corelib.Init.Datatypes.Empty_set_rec (fun s => P (NativeBridge.emptyIso.to s)) s =
    Empty.rec P (NativeBridge.emptyIso.to s)
```

公理闭包：空

## Corelib.Init.Datatypes.Empty_set_rect

NativeBridge.Incremental.datatypes_Empty_set_rect_agrees

目标：Empty.rec；范围：fixed datatype; dependent native motive; result Sort z

```lean
∀ (P : Empty → Sort z) (s : Rocq.Corelib.Init.Datatypes.Empty_set),
  Rocq.Corelib.Init.Datatypes.Empty_set_rect (fun s => P (NativeBridge.emptyIso.to s)) s =
    Empty.rec P (NativeBridge.emptyIso.to s)
```

公理闭包：空

## Corelib.Init.Datatypes.option_rec

NativeBridge.Incremental.datatypes_option_rec_agrees

目标：Option.rec；范围：element A : Type u; dependent native motive; result Type

```lean
∀ {A : Type u} (P : Option A → Type) (f : (a : A) → P (some a)) (n : P none) (s : Rocq.Corelib.Init.Datatypes.option A),
  Rocq.Corelib.Init.Datatypes.option_rec A (fun s => P (NativeBridge.optionTo s)) f n s =
    Option.rec n f (NativeBridge.optionTo s)
```

公理闭包：空

## Corelib.Init.Datatypes.option_rect

NativeBridge.Incremental.datatypes_option_rect_agrees

目标：Option.rec；范围：element A : Type u; dependent native motive; result Sort z

```lean
∀ {A : Type u} (P : Option A → Sort z) (f : (a : A) → P (some a)) (n : P none)
  (s : Rocq.Corelib.Init.Datatypes.option A),
  Rocq.Corelib.Init.Datatypes.option_rect A (fun s => P (NativeBridge.optionTo s)) f n s =
    Option.rec n f (NativeBridge.optionTo s)
```

公理闭包：空

## Corelib.Init.Datatypes.list_rec

NativeBridge.Incremental.datatypes_list_rec_agrees

目标：List.rec；范围：element A : Type u; dependent native motive; result Type

```lean
∀ {A : Type u} (P : List A → Type) (n : P []) (c : (a : A) → (as : List A) → P as → P (a :: as))
  (s : NativeBridge.RList A),
  Rocq.Corelib.Init.Datatypes.list_rec A (fun s => P (NativeBridge.listTo s)) n
      (fun a as ih => c a (NativeBridge.listTo as) ih) s =
    List.rec n c (NativeBridge.listTo s)
```

公理闭包：空

## Corelib.Init.Datatypes.list_rect

NativeBridge.Incremental.datatypes_list_rect_agrees

目标：List.rec；范围：element A : Type u; dependent native motive; result Sort z

```lean
∀ {A : Type u} (P : List A → Sort z) (n : P []) (c : (a : A) → (as : List A) → P as → P (a :: as))
  (s : NativeBridge.RList A),
  Rocq.Corelib.Init.Datatypes.list_rect A (fun s => P (NativeBridge.listTo s)) n
      (fun a as ih => c a (NativeBridge.listTo as) ih) s =
    List.rec n c (NativeBridge.listTo s)
```

公理闭包：空

## Corelib.Init.Datatypes.prod_rec

NativeBridge.Incremental.datatypes_prod_rec_agrees

目标：PProd.rec；范围：A : Sort u and B : Sort v; dependent native motive; result Type

```lean
∀ {A : Sort u} {B : Sort v} (P : A ×' B → Type) (f : (a : A) → (b : B) → P ⟨a, b⟩)
  (s : Rocq.Corelib.Init.Datatypes.prod A B),
  Rocq.Corelib.Init.Datatypes.prod_rec A B (fun s => P (NativeBridge.Incremental.pprodTo s)) f s =
    PProd.rec f (NativeBridge.Incremental.pprodTo s)
```

公理闭包：空

## Corelib.Init.Datatypes.prod_rect

NativeBridge.Incremental.datatypes_prod_rect_agrees

目标：PProd.rec；范围：A : Sort u and B : Sort v; dependent native motive; result Sort z

```lean
∀ {A : Sort u} {B : Sort v} (P : A ×' B → Sort z) (f : (a : A) → (b : B) → P ⟨a, b⟩)
  (s : Rocq.Corelib.Init.Datatypes.prod A B),
  Rocq.Corelib.Init.Datatypes.prod_rect A B (fun s => P (NativeBridge.Incremental.pprodTo s)) f s =
    PProd.rec f (NativeBridge.Incremental.pprodTo s)
```

公理闭包：空

## Corelib.Init.Datatypes.sum_rec

NativeBridge.Incremental.datatypes_sum_rec_agrees

目标：PSum.rec；范围：A : Sort u and B : Sort v; dependent native motive; result Type

```lean
∀ {A : Sort u} {B : Sort v} (P : A ⊕' B → Type) (l : (a : A) → P (PSum.inl a)) (r : (b : B) → P (PSum.inr b))
  (s : Rocq.Corelib.Init.Datatypes.sum A B),
  Rocq.Corelib.Init.Datatypes.sum_rec A B (fun s => P (NativeBridge.Incremental.psumTo s)) l r s =
    PSum.rec l r (NativeBridge.Incremental.psumTo s)
```

公理闭包：空

## Corelib.Init.Datatypes.sum_rect

NativeBridge.Incremental.datatypes_sum_rect_agrees

目标：PSum.rec；范围：A : Sort u and B : Sort v; dependent native motive; result Sort z

```lean
∀ {A : Sort u} {B : Sort v} (P : A ⊕' B → Sort z) (l : (a : A) → P (PSum.inl a)) (r : (b : B) → P (PSum.inr b))
  (s : Rocq.Corelib.Init.Datatypes.sum A B),
  Rocq.Corelib.Init.Datatypes.sum_rect A B (fun s => P (NativeBridge.Incremental.psumTo s)) l r s =
    PSum.rec l r (NativeBridge.Incremental.psumTo s)
```

公理闭包：空

## Corelib.Init.Datatypes.result_rec

NativeBridge.Incremental.datatypes_result_rec_agrees

目标：Except.rec；范围：value A : Type u and error E : Type v; dependent native motive; result Type

```lean
∀ {A : Type u} {E : Type v} (P : Except E A → Type) (ok : (a : A) → P (Except.ok a))
  (error : (e : E) → P (Except.error e)) (s : Rocq.Corelib.Init.Datatypes.result A E),
  Rocq.Corelib.Init.Datatypes.result_rec A E (fun s => P (NativeBridge.resultTo s)) ok error s =
    Except.rec error ok (NativeBridge.resultTo s)
```

公理闭包：空

## Corelib.Init.Datatypes.result_rect

NativeBridge.Incremental.datatypes_result_rect_agrees

目标：Except.rec；范围：value A : Type u and error E : Type v; dependent native motive; result Sort z

```lean
∀ {A : Type u} {E : Type v} (P : Except E A → Sort z) (ok : (a : A) → P (Except.ok a))
  (error : (e : E) → P (Except.error e)) (s : Rocq.Corelib.Init.Datatypes.result A E),
  Rocq.Corelib.Init.Datatypes.result_rect A E (fun s => P (NativeBridge.resultTo s)) ok error s =
    Except.rec error ok (NativeBridge.resultTo s)
```

公理闭包：空

## Corelib.Init.Datatypes.curry

NativeBridge.Incremental.datatypes_curry_agrees

目标：fun f a b => f ⟨a,b⟩ with PProd；范围：A/B/C : Sort

```lean
∀ {A : Sort u} {B : Sort v} {C : Sort w} (f : A ×' B → C) (a : A) (b : B),
  Rocq.Corelib.Init.Datatypes.curry A B C (fun p => f (NativeBridge.Incremental.pprodTo p)) a b = f ⟨a, b⟩
```

公理闭包：空

## Corelib.Init.Datatypes.uncurry

NativeBridge.Incremental.datatypes_uncurry_agrees

目标：fun f p => f p.fst p.snd with PProd；范围：A/B/C : Sort

```lean
∀ {A : Sort u} {B : Sort v} {C : Sort w} (f : A → B → C) (p : Rocq.Corelib.Init.Datatypes.prod A B),
  Rocq.Corelib.Init.Datatypes.uncurry A B C f p =
    f (NativeBridge.Incremental.pprodTo p).fst (NativeBridge.Incremental.pprodTo p).snd
```

公理闭包：空

## Corelib.Init.Datatypes.id

NativeBridge.Incremental.datatypes_id_agrees

目标：id；范围：A : Type u

```lean
∀ (A : Type u) (x : A), Rocq.Corelib.Init.Datatypes.id A x = id x
```

公理闭包：空

## Corelib.Init.Datatypes.ID

NativeBridge.Incremental.datatypes_ID_agrees

目标：(A : Type u) → A → A；范围：exact equality of types

```lean
Rocq.Corelib.Init.Datatypes.ID = ((A : Type u) → A → A)
```

公理闭包：空

## Corelib.Init.Datatypes.IDProp

NativeBridge.Incremental.datatypes_IDProp_agrees

目标：∀ A : Prop, A → A；范围：iff of predicates

```lean
Rocq.Corelib.Init.Datatypes.IDProp ↔ ∀ (A : Prop), A → A
```

公理闭包：空

## Corelib.Init.Specif.proj3_sig

NativeBridge.Incremental.proj3_sig_native

目标：NativeBridge.Incremental.proj3SigNative；范围：full Sort u carrier; predicates retained; the extracted projection obligation is explicitly proved; native target recursively checked for source references

```lean
RocqPending.Corelib.Init.Specif.proj3_sig.statement ↔ NativeBridge.Incremental.proj3SigNative
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.proj1_sig_of_sig2_eq

NativeBridge.Incremental.proj1_sig_of_sig2_eq_native

目标：NativeBridge.Incremental.proj1SigOfSig2EqNative；范围：full Sort u carrier; predicates retained; the extracted projection obligation is explicitly proved; native target recursively checked for source references

```lean
RocqPending.Corelib.Init.Specif.proj1_sig_of_sig2_eq.statement ↔ NativeBridge.Incremental.proj1SigOfSig2EqNative
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.sig_of_sig2_eq

NativeBridge.Incremental.sig_of_sig2_eq_native

目标：NativeBridge.Incremental.sigOfSig2EqNative；范围：full Sort u carrier; predicates retained; the extracted projection obligation is explicitly proved; native target recursively checked for source references

```lean
RocqPending.Corelib.Init.Specif.sig_of_sig2_eq.statement ↔ NativeBridge.Incremental.sigOfSig2EqNative
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sig2_hprop

NativeBridge.Incremental.eq_sig2_hprop_native

目标：NativeBridge.Incremental.eqSig2HpropNative；范围：full Sort u carrier; predicates retained; the extracted projection obligation is explicitly proved; native target recursively checked for source references

```lean
RocqPending.Corelib.Init.Specif.eq_sig2_hprop.statement ↔ NativeBridge.Incremental.eqSig2HpropNative
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sig2_hprop_iff

NativeBridge.Incremental.eq_sig2_hprop_iff_native

目标：NativeBridge.Incremental.eqSig2HpropIffNative；范围：full Sort u carrier; predicates retained; the extracted projection obligation is explicitly proved; native target recursively checked for source references

```lean
RocqPending.Corelib.Init.Specif.eq_sig2_hprop_iff.statement ↔ NativeBridge.Incremental.eqSig2HpropIffNative
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_rec

NativeBridge.Incremental.eq_rec_native

目标：Eq.ndrec；范围：full Sort carrier; rec result Type, other results Sort; reverse direction uses native equality symmetry; dependent variant retains the equality proof in its motive

```lean
∀ {A : Sort u} (x : A) (P : A → Type) (h : P x) (y : A) (e : NativeBridge.ME A x y),
  Rocq.Corelib.Init.Logic.eq_rec A x P h y e = ⋯ ▸ h
```

公理闭包：空

## Corelib.Init.Logic.eq_rew

NativeBridge.Incremental.eq_rew_native

目标：Eq.ndrec；范围：full Sort carrier; rec result Type, other results Sort; reverse direction uses native equality symmetry; dependent variant retains the equality proof in its motive

```lean
∀ {A : Sort u} (x : A) (P : A → Sort v) (h : P x) (y : A) (e : NativeBridge.ME A x y),
  Rocq.Corelib.Init.Logic.eq_rew A x P h y e = ⋯ ▸ h
```

公理闭包：空

## Corelib.Init.Logic.eq_rew_r

NativeBridge.Incremental.eq_rew_r_native

目标：Eq.ndrec；范围：full Sort carrier; rec result Type, other results Sort; reverse direction uses native equality symmetry; dependent variant retains the equality proof in its motive

```lean
∀ {A : Sort u} (x y : A) (P : A → Sort v) (h : P y) (e : NativeBridge.ME A x y),
  Rocq.Corelib.Init.Logic.eq_rew_r A x y P h e = ⋯ ▸ h
```

公理闭包：空

## Corelib.Init.Logic.eq_rect_r

NativeBridge.Incremental.eq_rect_r_native

目标：Eq.ndrec；范围：full Sort carrier; rec result Type, other results Sort; reverse direction uses native equality symmetry; dependent variant retains the equality proof in its motive

```lean
∀ {A : Sort u} (x : A) (P : A → Sort v) (h : P x) (y : A) (e : NativeBridge.ME A y x),
  RocqPending.Corelib.Init.Logic.eq_rect_r A x P h y e = ⋯ ▸ h
```

公理闭包：空

## Corelib.Init.Logic.eq_rec_r

NativeBridge.Incremental.eq_rec_r_native

目标：Eq.ndrec；范围：full Sort carrier; rec result Type, other results Sort; reverse direction uses native equality symmetry; dependent variant retains the equality proof in its motive

```lean
∀ {A : Sort u} (x : A) (P : A → Type) (h : P x) (y : A) (e : NativeBridge.ME A y x),
  RocqPending.Corelib.Init.Logic.eq_rec_r A x P h y e = ⋯ ▸ h
```

公理闭包：空

## Corelib.Init.Logic.eq_rew_r_dep

NativeBridge.Incremental.eq_rew_r_dep_native

目标：NativeBridge.Incremental.nativeEqRightRec；范围：full Sort carrier; rec result Type, other results Sort; reverse direction uses native equality symmetry; dependent variant retains the equality proof in its motive

```lean
∀ {A : Sort u} (x y : A) (P : (x : A) → x = y → Sort v) (h : P y ⋯) (e : NativeBridge.ME A x y),
  RocqPending.Corelib.Init.Logic.eq_rew_r_dep A x y (fun x e => P x ⋯) h e =
    NativeBridge.Incremental.nativeEqRightRec y P h x ⋯
```

公理闭包：空

## Corelib.Init.Logic.eq_sym_involutive

NativeBridge.Incremental.eq_sym_involutive_native

目标：NativeBridge.Incremental.eqSymInvolutiveNative；范围：full Sort carrier; both source and native proof-equality statements proved by proof irrelevance; source extracted identity witness closed

```lean
RocqPending.Corelib.Init.Logic.eq_sym_involutive.statement ↔ NativeBridge.Incremental.eqSymInvolutiveNative
```

公理闭包：空

## Corelib.Init.Datatypes.eq_true

NativeBridge.Incremental.eqTrueIso

目标：boolTo b = true；范围：every mechanical Bool b; proof-valued equivalence with inverses by proof irrelevance

```lean
(b : NativeBridge.RBool) → NativeBridge.Iso (Rocq.Corelib.Init.Datatypes.eq_true b) (NativeBridge.boolTo b = true)
```

公理闭包：空

## Corelib.Init.Datatypes.eq_true_rec

NativeBridge.Incremental.eq_true_rec_native

目标：Eq.ndrec；范围：native Bool motive; rec result Type, other results Sort; dependent motive includes native proof b = true

```lean
∀ (P : Bool → Type) (b : NativeBridge.RBool) (h : P true) (e : Rocq.Corelib.Init.Datatypes.eq_true b),
  Rocq.Corelib.Init.Datatypes.eq_true_rec (fun b => P (NativeBridge.boolTo b)) h b e = ⋯ ▸ h
```

公理闭包：空

## Corelib.Init.Datatypes.eq_true_rect

NativeBridge.Incremental.eq_true_rect_native

目标：Eq.ndrec；范围：native Bool motive; rec result Type, other results Sort; dependent motive includes native proof b = true

```lean
∀ (P : Bool → Sort u) (b : NativeBridge.RBool) (h : P true) (e : Rocq.Corelib.Init.Datatypes.eq_true b),
  Rocq.Corelib.Init.Datatypes.eq_true_rect (fun b => P (NativeBridge.boolTo b)) h b e = ⋯ ▸ h
```

公理闭包：空

## Corelib.Init.Datatypes.eq_true_rew

NativeBridge.Incremental.eq_true_rew_native

目标：Eq.ndrec；范围：native Bool motive; rec result Type, other results Sort; dependent motive includes native proof b = true

```lean
∀ (P : Bool → Sort u) (b : NativeBridge.RBool) (h : P true) (e : Rocq.Corelib.Init.Datatypes.eq_true b),
  Rocq.Corelib.Init.Datatypes.eq_true_rew (fun b => P (NativeBridge.boolTo b)) h b e = ⋯ ▸ h
```

公理闭包：空

## Corelib.Init.Datatypes.eq_true_rec_r

NativeBridge.Incremental.eq_true_rec_r_native

目标：Eq.ndrec；范围：native Bool motive; rec result Type, other results Sort; dependent motive includes native proof b = true

```lean
∀ (P : Bool → Type) (b : NativeBridge.RBool) (h : P (NativeBridge.boolTo b))
  (e : Rocq.Corelib.Init.Datatypes.eq_true b),
  Rocq.Corelib.Init.Datatypes.eq_true_rec_r (fun b => P (NativeBridge.boolTo b)) b h e = ⋯ ▸ h
```

公理闭包：空

## Corelib.Init.Datatypes.eq_true_rect_r

NativeBridge.Incremental.eq_true_rect_r_native

目标：Eq.ndrec；范围：native Bool motive; rec result Type, other results Sort; dependent motive includes native proof b = true

```lean
∀ (P : Bool → Sort u) (b : NativeBridge.RBool) (h : P (NativeBridge.boolTo b))
  (e : Rocq.Corelib.Init.Datatypes.eq_true b),
  Rocq.Corelib.Init.Datatypes.eq_true_rect_r (fun b => P (NativeBridge.boolTo b)) b h e = ⋯ ▸ h
```

公理闭包：空

## Corelib.Init.Datatypes.eq_true_rew_r

NativeBridge.Incremental.eq_true_rew_r_native

目标：Eq.ndrec；范围：native Bool motive; rec result Type, other results Sort; dependent motive includes native proof b = true

```lean
∀ (P : Bool → Sort u) (b : NativeBridge.RBool) (h : P (NativeBridge.boolTo b))
  (e : Rocq.Corelib.Init.Datatypes.eq_true b),
  Rocq.Corelib.Init.Datatypes.eq_true_rew_r b (fun b => P (NativeBridge.boolTo b)) h e = ⋯ ▸ h
```

公理闭包：空

## Corelib.Init.Datatypes.eq_true_rew_dep

NativeBridge.Incremental.eq_true_rew_dep_native

目标：NativeBridge.Incremental.eqTrueNativeRec；范围：native Bool motive; rec result Type, other results Sort; dependent motive includes native proof b = true

```lean
∀ (P : (b : Bool) → b = true → Sort u) (h : P true ⋯) (b : NativeBridge.RBool)
  (e : Rocq.Corelib.Init.Datatypes.eq_true b),
  Rocq.Corelib.Init.Datatypes.eq_true_rew_dep (fun b e => P (NativeBridge.boolTo b) ⋯) h b e =
    NativeBridge.Incremental.eqTrueNativeRec P h (NativeBridge.boolTo b) ⋯
```

公理闭包：空

## Corelib.Init.Datatypes.eq_true_rew_fwd_dep

NativeBridge.Incremental.eq_true_rew_fwd_dep_native

目标：NativeBridge.Incremental.eqTrueNativeRecBack；范围：native Bool motive; rec result Type, other results Sort; dependent motive includes native proof b = true

```lean
∀ (P : (b : Bool) → b = true → Sort u) (b : NativeBridge.RBool) (e : Rocq.Corelib.Init.Datatypes.eq_true b)
  (h : P (NativeBridge.boolTo b) ⋯),
  Rocq.Corelib.Init.Datatypes.eq_true_rew_fwd_dep b e (fun b e => P (NativeBridge.boolTo b) ⋯) h =
    NativeBridge.Incremental.eqTrueNativeRecBack P (NativeBridge.boolTo b) ⋯ h
```

公理闭包：空

## Corelib.Init.Datatypes.eq_true_ind

NativeBridge.Incremental.eq_true_ind_native

目标：NativeBridge.Incremental.eqTrueIndNative；范围：all native Bool predicates; original theorem proved; no source references in recursively expanded native target

```lean
Rocq.Corelib.Init.Datatypes.eq_true_ind.statement ↔ NativeBridge.Incremental.eqTrueIndNative
```

公理闭包：空

## Corelib.Init.Datatypes.eq_true_sind

NativeBridge.Incremental.eq_true_sind_native

目标：NativeBridge.Incremental.eqTrueIndNative；范围：all native Bool predicates; original theorem proved; no source references in recursively expanded native target

```lean
Rocq.Corelib.Init.Datatypes.eq_true_sind.statement ↔ NativeBridge.Incremental.eqTrueIndNative
```

公理闭包：空

## Corelib.Init.Datatypes.eq_true_ind_r

NativeBridge.Incremental.eq_true_ind_r_native

目标：NativeBridge.Incremental.eqTrueIndRNative；范围：all native Bool predicates; original theorem proved; no source references in recursively expanded native target

```lean
Rocq.Corelib.Init.Datatypes.eq_true_ind_r.statement ↔ NativeBridge.Incremental.eqTrueIndRNative
```

公理闭包：空

## Corelib.Relations.Relation_Definitions.relation

NativeBridge.Incremental.RD.relationIso

目标：A → A → Prop；范围：A : Type u, arbitrary Prop-valued relation; proof structures use proof irrelevance for inverse laws

```lean
(A : Type u) → NativeBridge.Iso (Rocq.Corelib.Relations.Relation_Definitions.relation A) (A → A → Prop)
```

公理闭包：空

## Corelib.Relations.Relation_Definitions.equivalence

NativeBridge.Incremental.RD.equivalenceIso

目标：Equivalence R；范围：A : Type u, arbitrary Prop-valued relation; proof structures use proof irrelevance for inverse laws

```lean
(A : Type u) →
  (R : A → A → Prop) → NativeBridge.Iso (Rocq.Corelib.Relations.Relation_Definitions.equivalence A R) (Equivalence R)
```

公理闭包：空

## Corelib.Relations.Relation_Definitions.preorder

NativeBridge.Incremental.RD.preorderIso

目标：(∀ x, R x x) ∧ (∀ x y z, R x y → R y z → R x z)；范围：A : Type u, arbitrary Prop-valued relation; proof structures use proof irrelevance for inverse laws

```lean
(A : Type u) →
  (R : A → A → Prop) →
    NativeBridge.Iso (Rocq.Corelib.Relations.Relation_Definitions.preorder A R)
      (NativeBridge.Incremental.RD.NativePreorder R)
```

公理闭包：空

## Corelib.Relations.Relation_Definitions.order

NativeBridge.Incremental.RD.orderIso

目标：NativePreorder R ∧ (∀ x y, R x y → R y x → x = y)；范围：A : Type u, arbitrary Prop-valued relation; proof structures use proof irrelevance for inverse laws

```lean
(A : Type u) →
  (R : A → A → Prop) →
    NativeBridge.Iso (Rocq.Corelib.Relations.Relation_Definitions.order A R) (NativeBridge.Incremental.RD.NativeOrder R)
```

公理闭包：propext, Quot.sound

## Corelib.Relations.Relation_Definitions.PER

NativeBridge.Incremental.RD.perIso

目标：symmetry ∧ transitivity；范围：A : Type u, arbitrary Prop-valued relation; proof structures use proof irrelevance for inverse laws

```lean
(A : Type u) →
  (R : A → A → Prop) →
    NativeBridge.Iso (Rocq.Corelib.Relations.Relation_Definitions.PER A R) (NativeBridge.Incremental.RD.NativePER R)
```

公理闭包：空

## Corelib.Relations.Relation_Definitions.reflexive

NativeBridge.Incremental.RD.reflexive_native

目标：∀ x, R x x；范围：A : Type u; iff of relation predicates

```lean
∀ (A : Type u) (R : A → A → Prop), Rocq.Corelib.Relations.Relation_Definitions.reflexive A R ↔ ∀ (x : A), R x x
```

公理闭包：空

## Corelib.Relations.Relation_Definitions.symmetric

NativeBridge.Incremental.RD.symmetric_native

目标：∀ x y, R x y → R y x；范围：A : Type u; iff of relation predicates

```lean
∀ (A : Type u) (R : A → A → Prop),
  Rocq.Corelib.Relations.Relation_Definitions.symmetric A R ↔ ∀ (x y : A), R x y → R y x
```

公理闭包：空

## Corelib.Relations.Relation_Definitions.transitive

NativeBridge.Incremental.RD.transitive_native

目标：∀ x y z, R x y → R y z → R x z；范围：A : Type u; iff of relation predicates

```lean
∀ (A : Type u) (R : A → A → Prop),
  Rocq.Corelib.Relations.Relation_Definitions.transitive A R ↔ ∀ (x y z : A), R x y → R y z → R x z
```

公理闭包：空

## Corelib.Relations.Relation_Definitions.antisymmetric

NativeBridge.Incremental.RD.antisymmetric_native

目标：∀ x y, R x y → R y x → x = y；范围：A : Type u; iff of relation predicates

```lean
∀ (A : Type u) (R : A → A → Prop),
  Rocq.Corelib.Relations.Relation_Definitions.antisymmetric A R ↔ ∀ (x y : A), R x y → R y x → x = y
```

公理闭包：propext, Quot.sound

## Corelib.Relations.Relation_Definitions.inclusion

NativeBridge.Incremental.RD.inclusion_native

目标：Subrelation R S；范围：A : Type u; iff of relation predicates

```lean
∀ (A : Type u) (R S : A → A → Prop), Rocq.Corelib.Relations.Relation_Definitions.inclusion A R S ↔ Subrelation R S
```

公理闭包：空

## Corelib.Relations.Relation_Definitions.same_relation

NativeBridge.Incremental.RD.same_relation_native

目标：∀ x y, R x y ↔ S x y；范围：A : Type u; iff of relation predicates

```lean
∀ (A : Type u) (R S : A → A → Prop),
  Rocq.Corelib.Relations.Relation_Definitions.same_relation A R S ↔ ∀ (x y : A), R x y ↔ S x y
```

公理闭包：空

## Corelib.Relations.Relation_Definitions.commut

NativeBridge.Incremental.RD.commut_native

目标：∀ x y, R y x → ∀ z, S z y → ∃ t, S t x ∧ R z t；范围：A : Type u; iff of relation predicates

```lean
∀ (A : Type u) (R S : A → A → Prop),
  Rocq.Corelib.Relations.Relation_Definitions.commut A R S ↔ ∀ (x y : A), R y x → ∀ (z : A), S z y → ∃ t, S t x ∧ R z t
```

公理闭包：空

## Corelib.Relations.Relation_Definitions.equiv

NativeBridge.Incremental.RD.equiv_native

目标：Equivalence R；范围：A : Type u; iff of relation predicates

```lean
∀ (A : Type u) (R : A → A → Prop), Rocq.Corelib.Relations.Relation_Definitions.equiv A R ↔ Equivalence R
```

公理闭包：空

## Corelib.Relations.Relation_Definitions.equiv_refl

NativeBridge.Incremental.RD.equiv_refl_native

目标：NativeBridge.Incremental.RD.equiv_reflNative；范围：all Type u carriers and Prop-valued relations; native target recursively checked; original projection theorem proved

```lean
Rocq.Corelib.Relations.Relation_Definitions.equiv_refl.statement ↔ NativeBridge.Incremental.RD.equiv_reflNative
```

公理闭包：propext, Quot.sound

## Corelib.Relations.Relation_Definitions.equiv_sym

NativeBridge.Incremental.RD.equiv_sym_native

目标：NativeBridge.Incremental.RD.equiv_symNative；范围：all Type u carriers and Prop-valued relations; native target recursively checked; original projection theorem proved

```lean
Rocq.Corelib.Relations.Relation_Definitions.equiv_sym.statement ↔ NativeBridge.Incremental.RD.equiv_symNative
```

公理闭包：propext, Quot.sound

## Corelib.Relations.Relation_Definitions.equiv_trans

NativeBridge.Incremental.RD.equiv_trans_native

目标：NativeBridge.Incremental.RD.equiv_transNative；范围：all Type u carriers and Prop-valued relations; native target recursively checked; original projection theorem proved

```lean
Rocq.Corelib.Relations.Relation_Definitions.equiv_trans.statement ↔ NativeBridge.Incremental.RD.equiv_transNative
```

公理闭包：propext, Quot.sound

## Corelib.Relations.Relation_Definitions.ord_refl

NativeBridge.Incremental.RD.ord_refl_native

目标：NativeBridge.Incremental.RD.ord_reflNative；范围：all Type u carriers and Prop-valued relations; native target recursively checked; original projection theorem proved

```lean
Rocq.Corelib.Relations.Relation_Definitions.ord_refl.statement ↔ NativeBridge.Incremental.RD.ord_reflNative
```

公理闭包：propext, Quot.sound

## Corelib.Relations.Relation_Definitions.ord_trans

NativeBridge.Incremental.RD.ord_trans_native

目标：NativeBridge.Incremental.RD.ord_transNative；范围：all Type u carriers and Prop-valued relations; native target recursively checked; original projection theorem proved

```lean
Rocq.Corelib.Relations.Relation_Definitions.ord_trans.statement ↔ NativeBridge.Incremental.RD.ord_transNative
```

公理闭包：propext, Quot.sound

## Corelib.Relations.Relation_Definitions.ord_antisym

NativeBridge.Incremental.RD.ord_antisym_native

目标：NativeBridge.Incremental.RD.ord_antisymNative；范围：all Type u carriers and Prop-valued relations; native target recursively checked; original projection theorem proved

```lean
Rocq.Corelib.Relations.Relation_Definitions.ord_antisym.statement ↔ NativeBridge.Incremental.RD.ord_antisymNative
```

公理闭包：propext, Quot.sound

## Corelib.Relations.Relation_Definitions.per_sym

NativeBridge.Incremental.RD.per_sym_native

目标：NativeBridge.Incremental.RD.per_symNative；范围：all Type u carriers and Prop-valued relations; native target recursively checked; original projection theorem proved

```lean
Rocq.Corelib.Relations.Relation_Definitions.per_sym.statement ↔ NativeBridge.Incremental.RD.per_symNative
```

公理闭包：propext, Quot.sound

## Corelib.Relations.Relation_Definitions.per_trans

NativeBridge.Incremental.RD.per_trans_native

目标：NativeBridge.Incremental.RD.per_transNative；范围：all Type u carriers and Prop-valued relations; native target recursively checked; original projection theorem proved

```lean
Rocq.Corelib.Relations.Relation_Definitions.per_trans.statement ↔ NativeBridge.Incremental.RD.per_transNative
```

公理闭包：propext, Quot.sound

## Corelib.Relations.Relation_Definitions.preord_refl

NativeBridge.Incremental.RD.preord_refl_native

目标：NativeBridge.Incremental.RD.preord_reflNative；范围：all Type u carriers and Prop-valued relations; native target recursively checked; original projection theorem proved

```lean
Rocq.Corelib.Relations.Relation_Definitions.preord_refl.statement ↔ NativeBridge.Incremental.RD.preord_reflNative
```

公理闭包：propext, Quot.sound

## Corelib.Relations.Relation_Definitions.preord_trans

NativeBridge.Incremental.RD.preord_trans_native

目标：NativeBridge.Incremental.RD.preord_transNative；范围：all Type u carriers and Prop-valued relations; native target recursively checked; original projection theorem proved

```lean
Rocq.Corelib.Relations.Relation_Definitions.preord_trans.statement ↔ NativeBridge.Incremental.RD.preord_transNative
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.Equivalence

NativeBridge.Incremental.RC.equivalenceIso

目标：Equivalence R；范围：A : Type u; unary_predicate additionally preserves both independent source universe parameters through explicit PULift conversion

```lean
(A : Type u) →
  (R : A → A → Prop) → NativeBridge.Iso (Rocq.Corelib.Classes.RelationClasses.Equivalence A R) (Equivalence R)
```

公理闭包：空

## Corelib.Classes.RelationClasses.PreOrder

NativeBridge.Incremental.RC.preorderIso

目标：NativePreorder R；范围：A : Type u; unary_predicate additionally preserves both independent source universe parameters through explicit PULift conversion

```lean
(A : Type u) →
  (R : A → A → Prop) →
    NativeBridge.Iso (Rocq.Corelib.Classes.RelationClasses.PreOrder A R) (NativeBridge.Incremental.RC.NativePreorder R)
```

公理闭包：空

## Corelib.Classes.RelationClasses.PER

NativeBridge.Incremental.RC.perIso

目标：NativePER R；范围：A : Type u; unary_predicate additionally preserves both independent source universe parameters through explicit PULift conversion

```lean
(A : Type u) →
  (R : A → A → Prop) →
    NativeBridge.Iso (Rocq.Corelib.Classes.RelationClasses.PER A R) (NativeBridge.Incremental.RC.NativePER R)
```

公理闭包：空

## Corelib.Classes.RelationClasses.StrictOrder

NativeBridge.Incremental.RC.strictOrderIso

目标：NativeStrictOrder R；范围：A : Type u; unary_predicate additionally preserves both independent source universe parameters through explicit PULift conversion

```lean
(A : Type u) →
  (R : A → A → Prop) →
    NativeBridge.Iso (Rocq.Corelib.Classes.RelationClasses.StrictOrder A R)
      (NativeBridge.Incremental.RC.NativeStrictOrder R)
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.RewriteRelation

NativeBridge.Incremental.RC.rewriteRelationIso

目标：True；范围：A : Type u; unary_predicate additionally preserves both independent source universe parameters through explicit PULift conversion

```lean
(A : Type u) → (R : A → A → Prop) → NativeBridge.Iso (Rocq.Corelib.Classes.RelationClasses.RewriteRelation A R) True
```

公理闭包：空

## Corelib.Classes.RelationClasses.unary_operation

NativeBridge.Incremental.RC.unaryOperationIso

目标：A → A；范围：A : Type u; unary_predicate additionally preserves both independent source universe parameters through explicit PULift conversion

```lean
(A : Type u) → NativeBridge.Iso (Rocq.Corelib.Classes.RelationClasses.unary_operation A) (A → A)
```

公理闭包：空

## Corelib.Classes.RelationClasses.binary_operation

NativeBridge.Incremental.RC.binaryOperationIso

目标：A → A → A；范围：A : Type u; unary_predicate additionally preserves both independent source universe parameters through explicit PULift conversion

```lean
(A : Type u) → NativeBridge.Iso (Rocq.Corelib.Classes.RelationClasses.binary_operation A) (A → A → A)
```

公理闭包：空

## Corelib.Classes.RelationClasses.ternary_operation

NativeBridge.Incremental.RC.ternaryOperationIso

目标：A → A → A → A；范围：A : Type u; unary_predicate additionally preserves both independent source universe parameters through explicit PULift conversion

```lean
(A : Type u) → NativeBridge.Iso (Rocq.Corelib.Classes.RelationClasses.ternary_operation A) (A → A → A → A)
```

公理闭包：空

## Corelib.Classes.RelationClasses.unary_predicate

NativeBridge.Incremental.RC.unaryPredicateIso

目标：A → Prop；范围：A : Type u; unary_predicate additionally preserves both independent source universe parameters through explicit PULift conversion

```lean
(A : Type u) → NativeBridge.Iso (Rocq.Corelib.Classes.RelationClasses.unary_predicate A) (A → Prop)
```

公理闭包：空

## Corelib.Classes.RelationClasses.binary_relation

NativeBridge.Incremental.RC.binaryRelationIso

目标：A → A → Prop；范围：A : Type u; unary_predicate additionally preserves both independent source universe parameters through explicit PULift conversion

```lean
(A : Type u) → NativeBridge.Iso (Rocq.Corelib.Classes.RelationClasses.binary_relation A) (A → A → Prop)
```

公理闭包：空

## Corelib.Classes.RelationClasses.Reflexive

NativeBridge.Incremental.RC.reflexive_native

目标：∀ x, R x x；范围：A : Type u; relation E remains an arbitrary native equivalence; PartialOrder retains native equivalence and preorder premises, not identified with equality-based Lean PartialOrder

```lean
∀ (A : Type u) (R : A → A → Prop), Rocq.Corelib.Classes.RelationClasses.Reflexive A R ↔ ∀ (x : A), R x x
```

公理闭包：空

## Corelib.Classes.RelationClasses.Symmetric

NativeBridge.Incremental.RC.symmetric_native

目标：∀ x y, R x y → R y x；范围：A : Type u; relation E remains an arbitrary native equivalence; PartialOrder retains native equivalence and preorder premises, not identified with equality-based Lean PartialOrder

```lean
∀ (A : Type u) (R : A → A → Prop), Rocq.Corelib.Classes.RelationClasses.Symmetric A R ↔ ∀ (x y : A), R x y → R y x
```

公理闭包：空

## Corelib.Classes.RelationClasses.Transitive

NativeBridge.Incremental.RC.transitive_native

目标：∀ x y z, R x y → R y z → R x z；范围：A : Type u; relation E remains an arbitrary native equivalence; PartialOrder retains native equivalence and preorder premises, not identified with equality-based Lean PartialOrder

```lean
∀ (A : Type u) (R : A → A → Prop),
  Rocq.Corelib.Classes.RelationClasses.Transitive A R ↔ ∀ (x y z : A), R x y → R y z → R x z
```

公理闭包：空

## Corelib.Classes.RelationClasses.complement

NativeBridge.Incremental.RC.complement_native

目标：¬ R x y；范围：A : Type u; relation E remains an arbitrary native equivalence; PartialOrder retains native equivalence and preorder premises, not identified with equality-based Lean PartialOrder

```lean
∀ (A : Type u) (R : A → A → Prop) (x y : A), Rocq.Corelib.Classes.RelationClasses.complement A R x y ↔ ¬R x y
```

公理闭包：propext

## Corelib.Classes.RelationClasses.Irreflexive

NativeBridge.Incremental.RC.irreflexive_native

目标：∀ x, ¬ R x x；范围：A : Type u; relation E remains an arbitrary native equivalence; PartialOrder retains native equivalence and preorder premises, not identified with equality-based Lean PartialOrder

```lean
∀ (A : Type u) (R : A → A → Prop), Rocq.Corelib.Classes.RelationClasses.Irreflexive A R ↔ ∀ (x : A), ¬R x x
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.Asymmetric

NativeBridge.Incremental.RC.asymmetric_native

目标：∀ x y, R x y → ¬ R y x；范围：A : Type u; relation E remains an arbitrary native equivalence; PartialOrder retains native equivalence and preorder premises, not identified with equality-based Lean PartialOrder

```lean
∀ (A : Type u) (R : A → A → Prop), Rocq.Corelib.Classes.RelationClasses.Asymmetric A R ↔ ∀ (x y : A), R x y → ¬R y x
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.subrelation

NativeBridge.Incremental.RC.subrelation_native

目标：Subrelation R S；范围：A : Type u; relation E remains an arbitrary native equivalence; PartialOrder retains native equivalence and preorder premises, not identified with equality-based Lean PartialOrder

```lean
∀ (A : Type u) (R S : A → A → Prop), Rocq.Corelib.Classes.RelationClasses.subrelation A R S ↔ Subrelation R S
```

公理闭包：空

## Corelib.Classes.RelationClasses.relation_conjunction

NativeBridge.Incremental.RC.conjunction_native

目标：R x y ∧ S x y；范围：A : Type u; relation E remains an arbitrary native equivalence; PartialOrder retains native equivalence and preorder premises, not identified with equality-based Lean PartialOrder

```lean
∀ (A : Type u) (R S : A → A → Prop) (x y : A),
  Rocq.Corelib.Classes.RelationClasses.relation_conjunction A R S x y ↔ R x y ∧ S x y
```

公理闭包：空

## Corelib.Classes.RelationClasses.relation_disjunction

NativeBridge.Incremental.RC.disjunction_native

目标：R x y ∨ S x y；范围：A : Type u; relation E remains an arbitrary native equivalence; PartialOrder retains native equivalence and preorder premises, not identified with equality-based Lean PartialOrder

```lean
∀ (A : Type u) (R S : A → A → Prop) (x y : A),
  Rocq.Corelib.Classes.RelationClasses.relation_disjunction A R S x y ↔ R x y ∨ S x y
```

公理闭包：空

## Corelib.Classes.RelationClasses.relation_equivalence

NativeBridge.Incremental.RC.relation_equivalence_native

目标：∀ x y, R x y ↔ S x y；范围：A : Type u; relation E remains an arbitrary native equivalence; PartialOrder retains native equivalence and preorder premises, not identified with equality-based Lean PartialOrder

```lean
∀ (A : Type u) (R S : A → A → Prop),
  Rocq.Corelib.Classes.RelationClasses.relation_equivalence A R S ↔ ∀ (x y : A), R x y ↔ S x y
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.Antisymmetric

NativeBridge.Incremental.RC.antisymmetric_native

目标：∀ x y, R x y → R y x → E x y；范围：A : Type u; relation E remains an arbitrary native equivalence; PartialOrder retains native equivalence and preorder premises, not identified with equality-based Lean PartialOrder

```lean
∀ (A : Type u) (E R : A → A → Prop) (h : Equivalence E),
  Rocq.Corelib.Classes.RelationClasses.Antisymmetric A E ⋯ R ↔ ∀ (x y : A), R x y → R y x → E x y
```

公理闭包：空

## Corelib.Classes.RelationClasses.PartialOrder

NativeBridge.Incremental.RC.partialOrder_native

目标：∀ x y, E x y ↔ R x y ∧ R y x；范围：A : Type u; relation E remains an arbitrary native equivalence; PartialOrder retains native equivalence and preorder premises, not identified with equality-based Lean PartialOrder

```lean
∀ (A : Type u) (E R : A → A → Prop) (h : Equivalence E) (p : NativeBridge.Incremental.RC.NativePreorder R),
  Rocq.Corelib.Classes.RelationClasses.PartialOrder A E ⋯ R ⋯ ↔ ∀ (x y : A), E x y ↔ R x y ∧ R y x
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.Tlist

NativeBridge.Incremental.Variadic.typesIso

目标：List (Type u)；范围：arbitrary universe u and finite heterogeneous Type u argument list; B : Type u; explicit curry/uncurry inverse proofs

```lean
NativeBridge.Iso Rocq.Corelib.Classes.RelationClasses.Tlist (List (Type u))
```

公理闭包：空

## Corelib.Classes.RelationClasses.arrows

NativeBridge.Incremental.Variadic.arrowsIso

目标：Arguments (typesTo ts) → B；范围：arbitrary universe u and finite heterogeneous Type u argument list; B : Type u; explicit curry/uncurry inverse proofs

```lean
(ts : Rocq.Corelib.Classes.RelationClasses.Tlist) →
  (B : Type u) →
    NativeBridge.Iso (Rocq.Corelib.Classes.RelationClasses.arrows ts B)
      (NativeBridge.Incremental.Variadic.Arguments (NativeBridge.Incremental.Variadic.typesTo ts) → B)
```

公理闭包：Quot.sound

## Corelib.Classes.RelationClasses.Tlist_rec

NativeBridge.Incremental.Variadic.tlist_rec_native

目标：List.rec；范围：all finite Type u lists; tuple argument representation; PULift Prop is explicitly removed for native predicates; Tlist_rect native motive Type v

```lean
∀ (P : List (Type u) → Type) (n : P []) (c : (A : Type u) → (ts : List (Type u)) → P ts → P (A :: ts))
  (ts : Rocq.Corelib.Classes.RelationClasses.Tlist),
  Rocq.Corelib.Classes.RelationClasses.Tlist_rec (fun ts => P (NativeBridge.Incremental.Variadic.typesTo ts)) n
      (fun A ts ih => c A (NativeBridge.Incremental.Variadic.typesTo ts) ih) ts =
    List.rec n c (NativeBridge.Incremental.Variadic.typesTo ts)
```

公理闭包：空

## Corelib.Classes.RelationClasses.Tlist_rect

NativeBridge.Incremental.Variadic.tlist_rect_native

目标：List.rec；范围：all finite Type u lists; tuple argument representation; PULift Prop is explicitly removed for native predicates; Tlist_rect native motive Type v

```lean
∀ (P : List (Type u) → Type v) (n : P []) (c : (A : Type u) → (ts : List (Type u)) → P ts → P (A :: ts))
  (ts : Rocq.Corelib.Classes.RelationClasses.Tlist),
  Rocq.Corelib.Classes.RelationClasses.Tlist_rect (fun ts => P (NativeBridge.Incremental.Variadic.typesTo ts)) n
      (fun A ts ih => c A (NativeBridge.Incremental.Variadic.typesTo ts) ih) ts =
    List.rec n c (NativeBridge.Incremental.Variadic.typesTo ts)
```

公理闭包：空

## Corelib.Classes.RelationClasses.pointwise_extension

NativeBridge.Incremental.Variadic.pointwise_extension_native

目标：fun args => op (f args) (g args)；范围：all finite Type u lists; tuple argument representation; PULift Prop is explicitly removed for native predicates; Tlist_rect native motive Type v

```lean
∀ (B : Type u) (op : B → B → B) (ts : Rocq.Corelib.Classes.RelationClasses.Tlist)
  (f g : Rocq.Corelib.Classes.RelationClasses.arrows ts B)
  (xs : NativeBridge.Incremental.Variadic.Arguments (NativeBridge.Incremental.Variadic.typesTo ts)),
  NativeBridge.Incremental.Variadic.arrowsTo ts B (Rocq.Corelib.Classes.RelationClasses.pointwise_extension B op ts f g)
      xs =
    op (NativeBridge.Incremental.Variadic.arrowsTo ts B f xs) (NativeBridge.Incremental.Variadic.arrowsTo ts B g xs)
```

公理闭包：空

## Corelib.Classes.RelationClasses.pointwise_lifting

NativeBridge.Incremental.Variadic.pointwise_lifting_native

目标：∀ args, op (f args) (g args)；范围：all finite Type u lists; tuple argument representation; PULift Prop is explicitly removed for native predicates; Tlist_rect native motive Type v

```lean
∀ (op : Prop → Prop → Prop) (ts : Rocq.Corelib.Classes.RelationClasses.Tlist)
  (f g : Rocq.Corelib.Classes.RelationClasses.arrows ts (PULift Prop)),
  (Rocq.Corelib.Classes.RelationClasses.pointwise_lifting (fun p q => { down := op p.down q.down }) ts f g).down ↔
    ∀ (xs : NativeBridge.Incremental.Variadic.Arguments (NativeBridge.Incremental.Variadic.typesTo ts)),
      op (NativeBridge.Incremental.Variadic.predicateTo ts f xs) (NativeBridge.Incremental.Variadic.predicateTo ts g xs)
```

公理闭包：空

## Corelib.Classes.RelationClasses.predicate_all

NativeBridge.Incremental.Variadic.predicate_all_native

目标：∀ args, f args；范围：all finite Type u lists; tuple argument representation; PULift Prop is explicitly removed for native predicates; Tlist_rect native motive Type v

```lean
∀ (ts : Rocq.Corelib.Classes.RelationClasses.Tlist) (f : Rocq.Corelib.Classes.RelationClasses.arrows ts (PULift Prop)),
  Rocq.Corelib.Classes.RelationClasses.predicate_all ts f ↔
    ∀ (xs : NativeBridge.Incremental.Variadic.Arguments (NativeBridge.Incremental.Variadic.typesTo ts)),
      NativeBridge.Incremental.Variadic.predicateTo ts f xs
```

公理闭包：空

## Corelib.Classes.RelationClasses.predicate_exists

NativeBridge.Incremental.Variadic.predicate_exists_native

目标：∃ args, f args；范围：all finite Type u lists; tuple argument representation; PULift Prop is explicitly removed for native predicates; Tlist_rect native motive Type v

```lean
∀ (ts : Rocq.Corelib.Classes.RelationClasses.Tlist) (f : Rocq.Corelib.Classes.RelationClasses.arrows ts (PULift Prop)),
  Rocq.Corelib.Classes.RelationClasses.predicate_exists ts f ↔
    ∃ xs, NativeBridge.Incremental.Variadic.predicateTo ts f xs
```

公理闭包：空

## Corelib.Classes.RelationClasses.predicate_equivalence

NativeBridge.Incremental.Variadic.predicate_equivalence_native

目标：∀ args, f args ↔ g args；范围：all finite Type u lists; tuple argument representation; PULift Prop is explicitly removed for native predicates; Tlist_rect native motive Type v

```lean
∀ (ts : Rocq.Corelib.Classes.RelationClasses.Tlist)
  (f g : Rocq.Corelib.Classes.RelationClasses.arrows ts (PULift Prop)),
  (Rocq.Corelib.Classes.RelationClasses.predicate_equivalence ts f g).down ↔
    ∀ (xs : NativeBridge.Incremental.Variadic.Arguments (NativeBridge.Incremental.Variadic.typesTo ts)),
      NativeBridge.Incremental.Variadic.predicateTo ts f xs ↔ NativeBridge.Incremental.Variadic.predicateTo ts g xs
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.predicate_implication

NativeBridge.Incremental.Variadic.predicate_implication_native

目标：∀ args, f args → g args；范围：all finite Type u lists; tuple argument representation; PULift Prop is explicitly removed for native predicates; Tlist_rect native motive Type v

```lean
∀ (ts : Rocq.Corelib.Classes.RelationClasses.Tlist)
  (f g : Rocq.Corelib.Classes.RelationClasses.arrows ts (PULift Prop)),
  (Rocq.Corelib.Classes.RelationClasses.predicate_implication ts f g).down ↔
    ∀ (xs : NativeBridge.Incremental.Variadic.Arguments (NativeBridge.Incremental.Variadic.typesTo ts)),
      NativeBridge.Incremental.Variadic.predicateTo ts f xs → NativeBridge.Incremental.Variadic.predicateTo ts g xs
```

公理闭包：空

## Corelib.Classes.RelationClasses.predicate_intersection

NativeBridge.Incremental.Variadic.predicate_intersection_native

目标：fun args => f args ∧ g args；范围：all finite Type u lists; tuple argument representation; PULift Prop is explicitly removed for native predicates; Tlist_rect native motive Type v

```lean
∀ (ts : Rocq.Corelib.Classes.RelationClasses.Tlist) (f g : Rocq.Corelib.Classes.RelationClasses.arrows ts (PULift Prop))
  (xs : NativeBridge.Incremental.Variadic.Arguments (NativeBridge.Incremental.Variadic.typesTo ts)),
  NativeBridge.Incremental.Variadic.predicateTo ts (Rocq.Corelib.Classes.RelationClasses.predicate_intersection ts f g)
      xs ↔
    NativeBridge.Incremental.Variadic.predicateTo ts f xs ∧ NativeBridge.Incremental.Variadic.predicateTo ts g xs
```

公理闭包：空

## Corelib.Classes.RelationClasses.predicate_union

NativeBridge.Incremental.Variadic.predicate_union_native

目标：fun args => f args ∨ g args；范围：all finite Type u lists; tuple argument representation; PULift Prop is explicitly removed for native predicates; Tlist_rect native motive Type v

```lean
∀ (ts : Rocq.Corelib.Classes.RelationClasses.Tlist) (f g : Rocq.Corelib.Classes.RelationClasses.arrows ts (PULift Prop))
  (xs : NativeBridge.Incremental.Variadic.Arguments (NativeBridge.Incremental.Variadic.typesTo ts)),
  NativeBridge.Incremental.Variadic.predicateTo ts (Rocq.Corelib.Classes.RelationClasses.predicate_union ts f g) xs ↔
    NativeBridge.Incremental.Variadic.predicateTo ts f xs ∨ NativeBridge.Incremental.Variadic.predicateTo ts g xs
```

公理闭包：空

## Corelib.Classes.RelationClasses.true_predicate

NativeBridge.Incremental.Variadic.true_predicate_native

目标：fun _ => True；范围：all finite Type u lists; tuple argument representation; PULift Prop is explicitly removed for native predicates; Tlist_rect native motive Type v

```lean
∀ (ts : Rocq.Corelib.Classes.RelationClasses.Tlist)
  (xs : NativeBridge.Incremental.Variadic.Arguments (NativeBridge.Incremental.Variadic.typesTo ts)),
  NativeBridge.Incremental.Variadic.predicateTo ts (Rocq.Corelib.Classes.RelationClasses.true_predicate ts) xs ↔ True
```

公理闭包：空

## Corelib.Classes.RelationClasses.false_predicate

NativeBridge.Incremental.Variadic.false_predicate_native

目标：fun _ => False；范围：all finite Type u lists; tuple argument representation; PULift Prop is explicitly removed for native predicates; Tlist_rect native motive Type v

```lean
∀ (ts : Rocq.Corelib.Classes.RelationClasses.Tlist)
  (xs : NativeBridge.Incremental.Variadic.Arguments (NativeBridge.Incremental.Variadic.typesTo ts)),
  NativeBridge.Incremental.Variadic.predicateTo ts (Rocq.Corelib.Classes.RelationClasses.false_predicate ts) xs ↔ False
```

公理闭包：空

## Corelib.Classes.RelationClasses.Tlist_ind

NativeBridge.Incremental.VariadicStatements.Tlist_ind_native

目标：NativeBridge.Incremental.VariadicStatements.listIndNative；范围：exact native list/tuple predicate law; iff assembled from independently checked source/native proofs; operation-level transport separately proved in VariadicPredicates

```lean
Rocq.Corelib.Classes.RelationClasses.Tlist_ind.statement ↔ NativeBridge.Incremental.VariadicStatements.listIndNative
```

公理闭包：空

## Corelib.Classes.RelationClasses.Tlist_sind

NativeBridge.Incremental.VariadicStatements.Tlist_sind_native

目标：NativeBridge.Incremental.VariadicStatements.listIndNative；范围：exact native list/tuple predicate law; iff assembled from independently checked source/native proofs; operation-level transport separately proved in VariadicPredicates

```lean
Rocq.Corelib.Classes.RelationClasses.Tlist_sind.statement ↔ NativeBridge.Incremental.VariadicStatements.listIndNative
```

公理闭包：空

## Corelib.Classes.RelationClasses.predicate_equivalence_equivalence

NativeBridge.Incremental.VariadicStatements.predicate_equivalence_equivalence_native

目标：NativeBridge.Incremental.VariadicStatements.predEquivalenceNative；范围：exact native list/tuple predicate law; iff assembled from independently checked source/native proofs; operation-level transport separately proved in VariadicPredicates

```lean
Rocq.Corelib.Classes.RelationClasses.predicate_equivalence_equivalence.statement ↔
  NativeBridge.Incremental.VariadicStatements.predEquivalenceNative
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.predicate_equivalence_equivalence_obligation_1

NativeBridge.Incremental.VariadicStatements.predicate_equivalence_equivalence_obligation_1_native

目标：NativeBridge.Incremental.VariadicStatements.predEquivReflNative；范围：exact native list/tuple predicate law; iff assembled from independently checked source/native proofs; operation-level transport separately proved in VariadicPredicates

```lean
Rocq.Corelib.Classes.RelationClasses.predicate_equivalence_equivalence_obligation_1.statement ↔
  NativeBridge.Incremental.VariadicStatements.predEquivReflNative
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.predicate_equivalence_equivalence_obligation_2

NativeBridge.Incremental.VariadicStatements.predicate_equivalence_equivalence_obligation_2_native

目标：NativeBridge.Incremental.VariadicStatements.predEquivSymmNative；范围：exact native list/tuple predicate law; iff assembled from independently checked source/native proofs; operation-level transport separately proved in VariadicPredicates

```lean
Rocq.Corelib.Classes.RelationClasses.predicate_equivalence_equivalence_obligation_2.statement ↔
  NativeBridge.Incremental.VariadicStatements.predEquivSymmNative
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.predicate_equivalence_equivalence_obligation_3

NativeBridge.Incremental.VariadicStatements.predicate_equivalence_equivalence_obligation_3_native

目标：NativeBridge.Incremental.VariadicStatements.predEquivTransNative；范围：exact native list/tuple predicate law; iff assembled from independently checked source/native proofs; operation-level transport separately proved in VariadicPredicates

```lean
Rocq.Corelib.Classes.RelationClasses.predicate_equivalence_equivalence_obligation_3.statement ↔
  NativeBridge.Incremental.VariadicStatements.predEquivTransNative
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.predicate_implication_preorder

NativeBridge.Incremental.VariadicStatements.predicate_implication_preorder_native

目标：NativeBridge.Incremental.VariadicStatements.predPreorderNative；范围：exact native list/tuple predicate law; iff assembled from independently checked source/native proofs; operation-level transport separately proved in VariadicPredicates

```lean
Rocq.Corelib.Classes.RelationClasses.predicate_implication_preorder.statement ↔
  NativeBridge.Incremental.VariadicStatements.predPreorderNative
```

公理闭包：空

## Corelib.Classes.RelationClasses.predicate_implication_preorder_obligation_1

NativeBridge.Incremental.VariadicStatements.predicate_implication_preorder_obligation_1_native

目标：NativeBridge.Incremental.VariadicStatements.predImpReflNative；范围：exact native list/tuple predicate law; iff assembled from independently checked source/native proofs; operation-level transport separately proved in VariadicPredicates

```lean
Rocq.Corelib.Classes.RelationClasses.predicate_implication_preorder_obligation_1.statement ↔
  NativeBridge.Incremental.VariadicStatements.predImpReflNative
```

公理闭包：空

## Corelib.Classes.RelationClasses.predicate_implication_preorder_obligation_2

NativeBridge.Incremental.VariadicStatements.predicate_implication_preorder_obligation_2_native

目标：NativeBridge.Incremental.VariadicStatements.predImpTransNative；范围：exact native list/tuple predicate law; iff assembled from independently checked source/native proofs; operation-level transport separately proved in VariadicPredicates

```lean
Rocq.Corelib.Classes.RelationClasses.predicate_implication_preorder_obligation_2.statement ↔
  NativeBridge.Incremental.VariadicStatements.predImpTransNative
```

公理闭包：空

## Corelib.Classes.RelationClasses.PartialOrder_inverse

NativeBridge.Incremental.RelationConditions.PartialOrder_inverse_native

目标：NativeBridge.Incremental.RelationConditions.inversePartialOrderNative；范围：all Type u carriers; generalized equivalence relation retained; all extracted obligations explicitly supplied

```lean
RocqPending.Corelib.Classes.RelationClasses.PartialOrder_inverse.statement ↔
  NativeBridge.Incremental.RelationConditions.inversePartialOrderNative
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.subrelation_partial_order

NativeBridge.Incremental.RelationConditions.subrelation_partial_order_native

目标：NativeBridge.Incremental.RelationConditions.subrelationPartialOrderNative；范围：all Type u carriers; generalized equivalence relation retained; all extracted obligations explicitly supplied

```lean
RocqPending.Corelib.Classes.RelationClasses.subrelation_partial_order.statement ↔
  NativeBridge.Incremental.RelationConditions.subrelationPartialOrderNative
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.forall_def

NativeBridge.Incremental.Morphisms.forallDefIso

目标：(a : A) → P a；范围：A : Type u; P : A → Type u

```lean
(A : Type u) → (P : A → Type u) → NativeBridge.Iso (Rocq.Corelib.Classes.Morphisms.forall_def A P) ((a : A) → P a)
```

公理闭包：空

## Corelib.Classes.Morphisms.Params

NativeBridge.Incremental.Morphisms.paramsIso

目标：True；范围：all Sort u carriers, values and mechanical Nat arities; source marker has no fields

```lean
(A : Sort u) →
  (f : A) → (n : Rocq.Corelib.Init.Datatypes.nat) → NativeBridge.Iso (Rocq.Corelib.Classes.Morphisms.Params A f n) True
```

公理闭包：空

## Corelib.Classes.Morphisms.PartialApplication

NativeBridge.Incremental.Morphisms.PartialApplicationIso

目标：True；范围：fieldless source marker

```lean
NativeBridge.Iso Rocq.Corelib.Classes.Morphisms.PartialApplication True
```

公理闭包：空

## Corelib.Classes.Morphisms.apply_subrelation

NativeBridge.Incremental.Morphisms.apply_subrelationIso

目标：True；范围：fieldless source marker

```lean
NativeBridge.Iso Rocq.Corelib.Classes.Morphisms.apply_subrelation True
```

公理闭包：空

## Corelib.Classes.Morphisms.normalization_done

NativeBridge.Incremental.Morphisms.normalization_doneIso

目标：True；范围：fieldless source marker

```lean
NativeBridge.Iso Rocq.Corelib.Classes.Morphisms.normalization_done True
```

公理闭包：空

## Corelib.Classes.Morphisms.Proper

NativeBridge.Incremental.Morphisms.proper_native

目标：R f f；范围：A : Type u

```lean
∀ (A : Type u) (R : A → A → Prop) (f : A), Rocq.Corelib.Classes.Morphisms.Proper A R f ↔ R f f
```

公理闭包：空

## Corelib.Classes.Morphisms.ProperProxy

NativeBridge.Incremental.Morphisms.properProxy_native

目标：R f f；范围：A : Type u

```lean
∀ (A : Type u) (R : A → A → Prop) (f : A), Rocq.Corelib.Classes.Morphisms.ProperProxy A R f ↔ R f f
```

公理闭包：空

## Corelib.Classes.Morphisms.ReflexiveProxy

NativeBridge.Incremental.Morphisms.reflexiveProxy_native

目标：∀ x, R x x；范围：A : Type u

```lean
∀ (A : Type u) (R : A → A → Prop), Rocq.Corelib.Classes.Morphisms.ReflexiveProxy A R ↔ ∀ (x : A), R x x
```

公理闭包：空

## Corelib.Classes.Morphisms.respectful

NativeBridge.Incremental.Morphisms.respectful_native

目标：∀ x y, R x y → S (f x) (g y)；范围：A, B : Type u as in the mechanical signature

```lean
∀ (A B : Type u) (R : A → A → Prop) (S : B → B → Prop) (f g : A → B),
  Rocq.Corelib.Classes.Morphisms.respectful A B R S f g ↔ ∀ (x y : A), R x y → S (f x) (g y)
```

公理闭包：空

## Corelib.Classes.Morphisms.respectful_hetero

NativeBridge.Incremental.Morphisms.respectful_hetero_native

目标：∀ x y, R x y → S x y (f x) (g y)；范围：independent Sort u/v carriers and Sort w/z dependent codomains

```lean
∀ (A : Sort u) (B : Sort v) (C : A → Sort w) (D : B → Sort z) (R : A → B → Prop)
  (S : (x : A) → (y : B) → C x → D y → Prop) (f : (x : A) → C x) (g : (y : B) → D y),
  Rocq.Corelib.Classes.Morphisms.respectful_hetero A B C D R S f g ↔ ∀ (x : A) (y : B), R x y → S x y (f x) (g y)
```

公理闭包：空

## Corelib.Classes.Morphisms.pointwise_relation

NativeBridge.Incremental.Morphisms.pointwise_relation_native

目标：∀ x, R (f x) (g x)；范围：A : Type u, B : Type v with independent universes

```lean
∀ (A : Type u) (B : Type v) (R : B → B → Prop) (f g : A → B),
  Rocq.Corelib.Classes.Morphisms.pointwise_relation A B R f g ↔ ∀ (x : A), R (f x) (g x)
```

公理闭包：空

## Corelib.Classes.Morphisms.forall_relation

NativeBridge.Incremental.Morphisms.forall_relation_native

目标：∀ x, R x (f x) (g x)；范围：A : Type u and dependent P : A → Type u

```lean
∀ (A : Type u) (P : A → Type u) (R : (a : A) → P a → P a → Prop) (f g : (a : A) → P a),
  Rocq.Corelib.Classes.Morphisms.forall_relation A P R f g ↔ ∀ (x : A), R x (f x) (g x)
```

公理闭包：空

## Corelib.Classes.Morphisms.Normalizes

NativeBridge.Incremental.Morphisms.normalizes_native

目标：∀ x y, R x y ↔ S x y；范围：A : Type u; logical relation equivalence, not a runtime normalization algorithm

```lean
∀ (A : Type u) (R S : A → A → Prop), Rocq.Corelib.Classes.Morphisms.Normalizes A R S ↔ ∀ (x y : A), R x y ↔ S x y
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Equivalence.equiv

NativeBridge.Incremental.EquivalenceBridge.equiv_native

目标：R；范围：A : Type u; native Equivalence/PER evidence explicitly converted to source evidence; relation identity

```lean
∀ (A : Type u) (R : A → A → Prop) (h : Equivalence R), Rocq.Corelib.Classes.Equivalence.equiv A R ⋯ = R
```

公理闭包：空

## Corelib.Classes.Equivalence.pequiv

NativeBridge.Incremental.EquivalenceBridge.pequiv_native

目标：R；范围：A : Type u; native Equivalence/PER evidence explicitly converted to source evidence; relation identity

```lean
∀ (A : Type u) (R : A → A → Prop) (h : NativeBridge.Incremental.RC.NativePER R),
  Rocq.Corelib.Classes.Equivalence.pequiv A R ⋯ = R
```

公理闭包：空

## Corelib.Classes.Equivalence.respecting

NativeBridge.Incremental.EquivalenceBridge.respectingIso

目标：{f : A → B // ∀ x y, R x y → S (f x) (f y)}；范围：A, B : Type u as in source signature; arbitrary native equivalence relations and explicit converted evidence

```lean
(A B : Type u) →
  (R : A → A → Prop) →
    (S : B → B → Prop) →
      (ha : Equivalence R) →
        (hb : Equivalence S) →
          NativeBridge.Iso (Rocq.Corelib.Classes.Equivalence.respecting A R ⋯ B S ⋯)
            { f // ∀ (x y : A), R x y → S (f x) (f y) }
```

公理闭包：空

## Corelib.Setoids.Setoid.Setoid_Theory

NativeBridge.Incremental.SetoidBridge.setoidTheoryIso

目标：Equivalence R；范围：all Type u carriers and relations

```lean
(A : Type u) → (R : A → A → Prop) → NativeBridge.Iso (Rocq.Corelib.Setoids.Setoid.Setoid_Theory A R) (Equivalence R)
```

公理闭包：空

## Corelib.Setoids.Setoid.Build_Setoid_Theory

NativeBridge.Incremental.SetoidBridge.Build_Setoid_Theory_native

目标：NativeBridge.Incremental.SetoidBridge.buildTheoryNative；范围：Type u for constructor/projections; gen_st exactly Type 0 as source; original theorem proved using native Equivalence

```lean
Rocq.Corelib.Setoids.Setoid.Build_Setoid_Theory.statement ↔ NativeBridge.Incremental.SetoidBridge.buildTheoryNative
```

公理闭包：propext, Quot.sound

## Corelib.Setoids.Setoid.Seq_refl

NativeBridge.Incremental.SetoidBridge.Seq_refl_native

目标：NativeBridge.Incremental.SetoidBridge.seqReflNative；范围：Type u for constructor/projections; gen_st exactly Type 0 as source; original theorem proved using native Equivalence

```lean
Rocq.Corelib.Setoids.Setoid.Seq_refl.statement ↔ NativeBridge.Incremental.SetoidBridge.seqReflNative
```

公理闭包：propext, Quot.sound

## Corelib.Setoids.Setoid.Seq_sym

NativeBridge.Incremental.SetoidBridge.Seq_sym_native

目标：NativeBridge.Incremental.SetoidBridge.seqSymmNative；范围：Type u for constructor/projections; gen_st exactly Type 0 as source; original theorem proved using native Equivalence

```lean
Rocq.Corelib.Setoids.Setoid.Seq_sym.statement ↔ NativeBridge.Incremental.SetoidBridge.seqSymmNative
```

公理闭包：propext, Quot.sound

## Corelib.Setoids.Setoid.Seq_trans

NativeBridge.Incremental.SetoidBridge.Seq_trans_native

目标：NativeBridge.Incremental.SetoidBridge.seqTransNative；范围：Type u for constructor/projections; gen_st exactly Type 0 as source; original theorem proved using native Equivalence

```lean
Rocq.Corelib.Setoids.Setoid.Seq_trans.statement ↔ NativeBridge.Incremental.SetoidBridge.seqTransNative
```

公理闭包：propext, Quot.sound

## Corelib.Setoids.Setoid.gen_st

NativeBridge.Incremental.SetoidBridge.gen_st_native

目标：NativeBridge.Incremental.SetoidBridge.genStNative；范围：Type u for constructor/projections; gen_st exactly Type 0 as source; original theorem proved using native Equivalence

```lean
Rocq.Corelib.Setoids.Setoid.gen_st.statement ↔ NativeBridge.Incremental.SetoidBridge.genStNative
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.sumor

NativeBridge.Incremental.sumorSortIso

目标：PSum A P；范围：A : Sort u, P : Prop; full Sort extension of the inherited Type-only sumor bridge; source root counted once

```lean
(A : Sort u) → (P : Prop) → NativeBridge.Iso (Rocq.Corelib.Init.Specif.sumor A P) (A ⊕' P)
```

公理闭包：空

## Corelib.Init.Decimal.Little.succ

NativeBridge.Incremental.NumericWrite.decimal_increment_agrees

目标：Native carry on List (Fin 10)；范围：All mechanical Nat inputs; arbitrary digit accumulators for Little operations. Radix 10 or 16. Native expression has no source operations; print value separately proved, all seven top-level printers also have separate NumericMathlib certificates.

```lean
∀ (ds : Rocq.Corelib.Init.Decimal.uint),
  NativeBridge.decimalDigitsTo (Rocq.Corelib.Init.Decimal.Little.succ ds) =
    NativeBridge.Incremental.NumericWrite.increment 10 ⋯ (NativeBridge.decimalDigitsTo ds)
```

公理闭包：propext, Quot.sound

## Corelib.Init.Hexadecimal.Little.succ

NativeBridge.Incremental.NumericWrite.hexadecimal_increment_agrees

目标：Native carry on List (Fin 16)；范围：All mechanical Nat inputs; arbitrary digit accumulators for Little operations. Radix 10 or 16. Native expression has no source operations; print value separately proved, all seven top-level printers also have separate NumericMathlib certificates.

```lean
∀ (ds : Rocq.Corelib.Init.Hexadecimal.uint),
  NativeBridge.hexadecimalDigitsTo (Rocq.Corelib.Init.Hexadecimal.Little.succ ds) =
    NativeBridge.Incremental.NumericWrite.increment 16 ⋯ (NativeBridge.hexadecimalDigitsTo ds)
```

公理闭包：propext, Quot.sound

## Corelib.Init.Nat.to_little_uint

NativeBridge.Incremental.NumericWrite.decimal_little_agrees

目标：Native Nat.rec iteration of decimal digit carry；范围：All mechanical Nat inputs; arbitrary digit accumulators for Little operations. Radix 10 or 16. Native expression has no source operations; print value separately proved, all seven top-level printers also have separate NumericMathlib certificates.

```lean
∀ (n : NativeBridge.MN) (ds : Rocq.Corelib.Init.Decimal.uint),
  NativeBridge.decimalDigitsTo (Rocq.Corelib.Init.Nat.to_little_uint n ds) =
    NativeBridge.Incremental.NumericWrite.iterate 10 ⋯ (NativeBridge.natTo n) (NativeBridge.decimalDigitsTo ds)
```

公理闭包：propext, Quot.sound

## Corelib.Init.Nat.to_little_hex_uint

NativeBridge.Incremental.NumericWrite.hexadecimal_little_agrees

目标：Native Nat.rec iteration of hexadecimal digit carry；范围：All mechanical Nat inputs; arbitrary digit accumulators for Little operations. Radix 10 or 16. Native expression has no source operations; print value separately proved, all seven top-level printers also have separate NumericMathlib certificates.

```lean
∀ (n : NativeBridge.MN) (ds : Rocq.Corelib.Init.Hexadecimal.uint),
  NativeBridge.hexadecimalDigitsTo (Rocq.Corelib.Init.Nat.to_little_hex_uint n ds) =
    NativeBridge.Incremental.NumericWrite.iterate 16 ⋯ (NativeBridge.natTo n) (NativeBridge.hexadecimalDigitsTo ds)
```

公理闭包：propext, Quot.sound

## Corelib.Init.Nat.to_uint

NativeBridge.Incremental.NumericWrite.decimal_print_agrees

目标：Native decimal digit printing: iterate carry from [0], then reverse；范围：All mechanical Nat inputs; arbitrary digit accumulators for Little operations. Radix 10 or 16. Native expression has no source operations; print value separately proved, all seven top-level printers also have separate NumericMathlib certificates.

```lean
∀ (n : NativeBridge.MN),
  NativeBridge.decimalDigitsTo (Rocq.Corelib.Init.Nat.to_uint n) =
    NativeBridge.Incremental.NumericWrite.printDigits 10 ⋯ (NativeBridge.natTo n)
```

公理闭包：propext, Quot.sound

## Corelib.Init.Nat.to_hex_uint

NativeBridge.Incremental.NumericWrite.hexadecimal_print_agrees

目标：Native hexadecimal digit printing: iterate carry from [0], then reverse；范围：All mechanical Nat inputs; arbitrary digit accumulators for Little operations. Radix 10 or 16. Native expression has no source operations; print value separately proved, all seven top-level printers also have separate NumericMathlib certificates.

```lean
∀ (n : NativeBridge.MN),
  NativeBridge.hexadecimalDigitsTo (Rocq.Corelib.Init.Nat.to_hex_uint n) =
    NativeBridge.Incremental.NumericWrite.printDigits 16 ⋯ (NativeBridge.natTo n)
```

公理闭包：propext, Quot.sound

## Corelib.Init.Nat.to_int

NativeBridge.Incremental.NumericWrite.decimal_signed_print_agrees

目标：False sign tag paired with native decimal printDigits；范围：All mechanical Nat inputs; arbitrary digit accumulators for Little operations. Radix 10 or 16. Native expression has no source operations; print value separately proved, all seven top-level printers also have separate NumericMathlib certificates.

```lean
∀ (n : NativeBridge.MN),
  NativeBridge.Incremental.NumericWrite.decimalSignedTo (Rocq.Corelib.Init.Nat.to_int n) =
    (false, NativeBridge.Incremental.NumericWrite.printDigits 10 ⋯ (NativeBridge.natTo n))
```

公理闭包：propext, Quot.sound

## Corelib.Init.Nat.to_hex_int

NativeBridge.Incremental.NumericWrite.hexadecimal_signed_print_agrees

目标：False sign tag paired with native hexadecimal printDigits；范围：All mechanical Nat inputs; arbitrary digit accumulators for Little operations. Radix 10 or 16. Native expression has no source operations; print value separately proved, all seven top-level printers also have separate NumericMathlib certificates.

```lean
∀ (n : NativeBridge.MN),
  NativeBridge.Incremental.NumericWrite.hexadecimalSignedTo (Rocq.Corelib.Init.Nat.to_hex_int n) =
    (false, NativeBridge.Incremental.NumericWrite.printDigits 16 ⋯ (NativeBridge.natTo n))
```

公理闭包：propext, Quot.sound

## Corelib.Init.Nat.to_num_uint

NativeBridge.Incremental.NumericWrite.number_decimal_print_agrees

目标：Sum.inl of native decimal printDigits；范围：All mechanical Nat inputs; arbitrary digit accumulators for Little operations. Radix 10 or 16. Native expression has no source operations; print value separately proved, all seven top-level printers also have separate NumericMathlib certificates.

```lean
∀ (n : NativeBridge.MN),
  NativeBridge.Incremental.numberUintTo (Rocq.Corelib.Init.Nat.to_num_uint n) =
    Sum.inl (NativeBridge.Incremental.NumericWrite.printDigits 10 ⋯ (NativeBridge.natTo n))
```

公理闭包：propext, Quot.sound

## Corelib.Init.Nat.to_num_hex_uint

NativeBridge.Incremental.NumericWrite.number_hexadecimal_print_agrees

目标：Sum.inr of native hexadecimal printDigits；范围：All mechanical Nat inputs; arbitrary digit accumulators for Little operations. Radix 10 or 16. Native expression has no source operations; print value separately proved, all seven top-level printers also have separate NumericMathlib certificates.

```lean
∀ (n : NativeBridge.MN),
  NativeBridge.Incremental.numberUintTo (Rocq.Corelib.Init.Nat.to_num_hex_uint n) =
    Sum.inr (NativeBridge.Incremental.NumericWrite.printDigits 16 ⋯ (NativeBridge.natTo n))
```

公理闭包：propext, Quot.sound

## Corelib.Init.Nat.to_num_int

NativeBridge.Incremental.NumericWrite.number_signed_print_agrees

目标：Sum.inl of positive native signed decimal printDigits；范围：All mechanical Nat inputs; arbitrary digit accumulators for Little operations. Radix 10 or 16. Native expression has no source operations; print value separately proved, all seven top-level printers also have separate NumericMathlib certificates.

```lean
∀ (n : NativeBridge.MN),
  NativeBridge.Incremental.NumericWrite.numberSignedTo (Rocq.Corelib.Init.Nat.to_num_int n) =
    Sum.inl (false, NativeBridge.Incremental.NumericWrite.printDigits 10 ⋯ (NativeBridge.natTo n))
```

公理闭包：propext, Quot.sound

## Corelib.Init.Number.signed_int

NativeBridge.Incremental.NumericWrite.numberSignedIso

目标：Sum (Bool × List (Fin 10)) (Bool × List (Fin 16))；范围：Radix, sign tag, empty representation and redundant zeros retained. Not a bijection to Int.

```lean
NativeBridge.Iso Rocq.Corelib.Init.Number.signed_int (Bool × List (Fin 10) ⊕ Bool × List (Fin 16))
```

公理闭包：propext

## Corelib.Init.Nat.to_uint

NativeBridge.Incremental.NumericMathlib.decimal_print_mathlib

目标：if n = 0 then [0] else (Nat.digits 10 n).reverse；范围：All mechanical Nat inputs after natTo. Output digits mapped with Fin.val; endian reversal and the zero representation [0] vs [] explicitly adapted. Strengthens existing printDigits certificate; source root not counted twice.

```lean
∀ (n : NativeBridge.MN),
  List.map Fin.val (NativeBridge.decimalDigitsTo (Rocq.Corelib.Init.Nat.to_uint n)) =
    if NativeBridge.natTo n = 0 then [0] else (Nat.digits 10 (NativeBridge.natTo n)).reverse
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Init.Nat.to_hex_uint

NativeBridge.Incremental.NumericMathlib.hexadecimal_print_mathlib

目标：if n = 0 then [0] else (Nat.digits 16 n).reverse；范围：All mechanical Nat inputs after natTo. Output digits mapped with Fin.val; endian reversal and the zero representation [0] vs [] explicitly adapted. Strengthens existing printDigits certificate; source root not counted twice.

```lean
∀ (n : NativeBridge.MN),
  List.map Fin.val (NativeBridge.hexadecimalDigitsTo (Rocq.Corelib.Init.Nat.to_hex_uint n)) =
    if NativeBridge.natTo n = 0 then [0] else (Nat.digits 16 (NativeBridge.natTo n)).reverse
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Init.Nat.to_int

NativeBridge.Incremental.NumericMathlib.decimal_signed_print_mathlib

目标：(false, adapted decimal Nat.digits)；范围：All mechanical Nat inputs after natTo. Fin.val applied to output digits; radix/sign tags preserved; zero explicitly [0], nonzero Mathlib digits reversed. Additional stronger certificate, not a new source root.

```lean
∀ (n : NativeBridge.MN),
  have s := NativeBridge.Incremental.NumericWrite.decimalSignedTo (Rocq.Corelib.Init.Nat.to_int n);
  (s.1, List.map Fin.val s.2) =
    (false, if NativeBridge.natTo n = 0 then [0] else (Nat.digits 10 (NativeBridge.natTo n)).reverse)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Init.Nat.to_hex_int

NativeBridge.Incremental.NumericMathlib.hexadecimal_signed_print_mathlib

目标：(false, adapted hexadecimal Nat.digits)；范围：All mechanical Nat inputs after natTo. Fin.val applied to output digits; radix/sign tags preserved; zero explicitly [0], nonzero Mathlib digits reversed. Additional stronger certificate, not a new source root.

```lean
∀ (n : NativeBridge.MN),
  have s := NativeBridge.Incremental.NumericWrite.hexadecimalSignedTo (Rocq.Corelib.Init.Nat.to_hex_int n);
  (s.1, List.map Fin.val s.2) =
    (false, if NativeBridge.natTo n = 0 then [0] else (Nat.digits 16 (NativeBridge.natTo n)).reverse)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Init.Nat.to_num_uint

NativeBridge.Incremental.NumericMathlib.number_decimal_print_mathlib

目标：Sum.inl of adapted decimal Nat.digits；范围：All mechanical Nat inputs after natTo. Fin.val applied to output digits; radix/sign tags preserved; zero explicitly [0], nonzero Mathlib digits reversed. Additional stronger certificate, not a new source root.

```lean
∀ (n : NativeBridge.MN),
  Sum.map (List.map Fin.val) (List.map Fin.val)
      (NativeBridge.Incremental.numberUintTo (Rocq.Corelib.Init.Nat.to_num_uint n)) =
    Sum.inl (if NativeBridge.natTo n = 0 then [0] else (Nat.digits 10 (NativeBridge.natTo n)).reverse)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Init.Nat.to_num_hex_uint

NativeBridge.Incremental.NumericMathlib.number_hexadecimal_print_mathlib

目标：Sum.inr of adapted hexadecimal Nat.digits；范围：All mechanical Nat inputs after natTo. Fin.val applied to output digits; radix/sign tags preserved; zero explicitly [0], nonzero Mathlib digits reversed. Additional stronger certificate, not a new source root.

```lean
∀ (n : NativeBridge.MN),
  Sum.map (List.map Fin.val) (List.map Fin.val)
      (NativeBridge.Incremental.numberUintTo (Rocq.Corelib.Init.Nat.to_num_hex_uint n)) =
    Sum.inr (if NativeBridge.natTo n = 0 then [0] else (Nat.digits 16 (NativeBridge.natTo n)).reverse)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Init.Nat.to_num_int

NativeBridge.Incremental.NumericMathlib.number_signed_print_mathlib

目标：Sum.inl of (false, adapted decimal Nat.digits)；范围：All mechanical Nat inputs after natTo. Fin.val applied to output digits; radix/sign tags preserved; zero explicitly [0], nonzero Mathlib digits reversed. Additional stronger certificate, not a new source root.

```lean
∀ (n : NativeBridge.MN),
  Sum.map (fun s => (s.1, List.map Fin.val s.2)) (fun s => (s.1, List.map Fin.val s.2))
      (NativeBridge.Incremental.NumericWrite.numberSignedTo (Rocq.Corelib.Init.Nat.to_num_int n)) =
    Sum.inl (false, if NativeBridge.natTo n = 0 then [0] else (Nat.digits 10 (NativeBridge.natTo n)).reverse)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Init.Nat.of_int

NativeBridge.Incremental.NumericSigned.decimal_signed_read_int

目标：if signed digit value z < 0 then none else some z.toNat；范围：All signed decimal/hexadecimal digit representations, including empty input, redundant zeros and negative zero. Numeric interpretation is an Int-valued fold, not a bijection from representations to Int. Int.toNat guarded to reject negative nonzero inputs.

```lean
∀ (s : Rocq.Corelib.Init.Decimal.signed_int),
  NativeBridge.Incremental.NumericSigned.optionNatTo (Rocq.Corelib.Init.Nat.of_int s) =
    have z :=
      NativeBridge.Incremental.NumericSigned.signedValue 10 (NativeBridge.Incremental.NumericWrite.decimalSignedTo s);
    if z < 0 then none else some z.toNat
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Init.Nat.of_hex_int

NativeBridge.Incremental.NumericSigned.hexadecimal_signed_read_int

目标：if signed digit value z < 0 then none else some z.toNat；范围：All signed decimal/hexadecimal digit representations, including empty input, redundant zeros and negative zero. Numeric interpretation is an Int-valued fold, not a bijection from representations to Int. Int.toNat guarded to reject negative nonzero inputs.

```lean
∀ (s : Rocq.Corelib.Init.Hexadecimal.signed_int),
  NativeBridge.Incremental.NumericSigned.optionNatTo (Rocq.Corelib.Init.Nat.of_hex_int s) =
    have z :=
      NativeBridge.Incremental.NumericSigned.signedValue 16
        (NativeBridge.Incremental.NumericWrite.hexadecimalSignedTo s);
    if z < 0 then none else some z.toNat
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Init.Nat.of_num_int

NativeBridge.Incremental.NumericSigned.number_signed_read_int

目标：if signed digit value z < 0 then none else some z.toNat；范围：All signed decimal/hexadecimal digit representations, including empty input, redundant zeros and negative zero. Numeric interpretation is an Int-valued fold, not a bijection from representations to Int. Int.toNat guarded to reject negative nonzero inputs.

```lean
∀ (s : Rocq.Corelib.Init.Number.signed_int),
  NativeBridge.Incremental.NumericSigned.optionNatTo (Rocq.Corelib.Init.Nat.of_num_int s) =
    have z :=
      NativeBridge.Incremental.NumericSigned.numberSignedValue (NativeBridge.Incremental.NumericWrite.numberSignedTo s);
    if z < 0 then none else some z.toNat
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Init.Nat.gcd

NativeBridge.Incremental.NatGcd.gcd_agrees

目标：Nat.gcd；范围：All mechanical Nat arguments; termination condition actually discharged using natTo measure and modulo correspondence. Witness uses standard propext and Quot.sound; no new axiom or pending condition.

```lean
∀ (a b : NativeBridge.MN),
  NativeBridge.natTo (RocqPending.Corelib.Init.Nat.gcd a b) = (NativeBridge.natTo a).gcd (NativeBridge.natTo b)
```

公理闭包：propext, Quot.sound

## Corelib.Init.Nat.divmod

NativeBridge.Incremental.NatArithmetic.divmod_agrees

目标：Native Nat division/remainder with explicit quotient and countdown accumulator adapter；范围：All four Nat parameters, including initial countdown u > y. If x ≤ u returns (q,u-x); otherwise t=x-(u+1)+(q+1)*(y+1), result (t/(y+1),y-t%(y+1)).

```lean
∀ (x y q u : NativeBridge.MN),
  Rocq.Corelib.Init.Datatypes.prod.rec (fun q r => (NativeBridge.natTo q, NativeBridge.natTo r))
      (Rocq.Corelib.Init.Nat.divmod x y q u) =
    NativeBridge.Incremental.NatArithmetic.divmodNative (NativeBridge.natTo x) (NativeBridge.natTo y)
      (NativeBridge.natTo q) (NativeBridge.natTo u)
```

公理闭包：propext, Quot.sound

## Corelib.Init.Nat.sqrt_iter

NativeBridge.Incremental.NatIterators.sqrt_iter_agrees

目标：Native Nat recursive sqrtIter；范围：All four Nat state parameters. Arithmetic sqrt interpretation proved separately under the algorithm invariant.

```lean
∀ (k p q r : NativeBridge.MN),
  NativeBridge.natTo (Rocq.Corelib.Init.Nat.sqrt_iter k p q r) =
    NativeBridge.Incremental.NatIterators.sqrtIter (NativeBridge.natTo k) (NativeBridge.natTo p) (NativeBridge.natTo q)
      (NativeBridge.natTo r)
```

公理闭包：空

## Corelib.Init.Nat.log2_iter

NativeBridge.Incremental.NatIterators.log2_iter_agrees

目标：Native Nat recursive log2Iter；范围：All four Nat state parameters. Arithmetic log2 interpretation proved separately under the algorithm invariant.

```lean
∀ (k p q r : NativeBridge.MN),
  NativeBridge.natTo (Rocq.Corelib.Init.Nat.log2_iter k p q r) =
    NativeBridge.Incremental.NatIterators.log2Iter (NativeBridge.natTo k) (NativeBridge.natTo p) (NativeBridge.natTo q)
      (NativeBridge.natTo r)
```

公理闭包：空

## Corelib.Init.Nat.sqrt

NativeBridge.Incremental.NatIterators.sqrt_agrees

目标：Nat.sqrt；范围：All mechanical Nat inputs; proof uses square bounds and uniqueness of native square root.

```lean
∀ (n : NativeBridge.MN), NativeBridge.natTo (Rocq.Corelib.Init.Nat.sqrt n) = (NativeBridge.natTo n).sqrt
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Init.Nat.log2

NativeBridge.Incremental.NatIterators.log2_agrees

目标：Nat.log2；范围：All mechanical Nat inputs, including zero; proof uses powers-of-two bounds and native log2 uniqueness.

```lean
∀ (n : NativeBridge.MN), NativeBridge.natTo (Rocq.Corelib.Init.Nat.log2 n) = (NativeBridge.natTo n).log2
```

公理闭包：propext, Quot.sound

## Corelib.Init.Peano.IsSucc

NativeBridge.Incremental.PeanoBridge.isSucc_agrees

目标：0 < n；范围：All mechanical natural numbers; IsSucc corresponds to native Nat positivity.

```lean
∀ (n : NativeBridge.MN), Rocq.Corelib.Init.Peano.IsSucc n ↔ 0 < NativeBridge.natTo n
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Lists.ListDef.list_compare

NativeBridge.Incremental.ListBridge.list_compare_agrees

目标：List.compareLex；范围：All lists over Type u and all supplied comparators, with comparator results converted to native Ordering. No total-order assumption.

```lean
∀ {A : Type u} (cmp : A → A → Rocq.Corelib.Init.Datatypes.comparison) (xs ys : NativeBridge.RList A),
  NativeBridge.Incremental.ListBridge.comparisonTo (Rocq.Corelib.Lists.ListDef.list_compare A cmp xs ys) =
    List.compareLex (fun x y => NativeBridge.Incremental.ListBridge.comparisonTo (cmp x y)) (NativeBridge.listTo xs)
      (NativeBridge.listTo ys)
```

公理闭包：propext

## Corelib.BinNums.PosDef.Pos.compare_cont

NativeBridge.Incremental.BinaryOrder.compare_cont_agrees

目标：Native Nat comparison with a supplied Ordering on equality；范围：All values of the mechanical numeric input types; no extra hypotheses.

```lean
∀ (r : NativeBridge.RComparison) (p q : NativeBridge.RPositive),
  NativeBridge.comparisonTo (Rocq.Corelib.BinNums.PosDef.Pos.compare_cont r p q) =
    NativeBridge.Incremental.BinaryOrder.compareCont (NativeBridge.comparisonTo r) (NativeBridge.positiveTo p)
      (NativeBridge.positiveTo q)
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.PosDef.Pos.compare

NativeBridge.Incremental.BinaryOrder.positive_compare_agrees

目标：compare on Nat；范围：All values of the mechanical numeric input types; no extra hypotheses.

```lean
∀ (p q : NativeBridge.RPositive),
  NativeBridge.comparisonTo (Rocq.Corelib.BinNums.PosDef.Pos.compare p q) =
    compare (NativeBridge.positiveTo p) (NativeBridge.positiveTo q)
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.PosDef.Pos.div2

NativeBridge.Incremental.BinaryOrder.positive_div2_agrees

目标：max 1 (n / 2)；范围：All values of the mechanical numeric input types; no extra hypotheses.

```lean
∀ (p : NativeBridge.RPositive),
  NativeBridge.positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.div2 p) = max 1 (NativeBridge.positiveTo p / 2)
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.PosDef.Pos.div2_up

NativeBridge.Incremental.BinaryOrder.positive_div2_up_agrees

目标：(n+1) / 2；范围：All values of the mechanical numeric input types; no extra hypotheses.

```lean
∀ (p : NativeBridge.RPositive),
  NativeBridge.positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.div2_up p) = (NativeBridge.positiveTo p + 1) / 2
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.PosDef.Pos.pred_N

NativeBridge.Incremental.BinaryOrder.positive_pred_N_agrees

目标：n - 1 : Nat；范围：All values of the mechanical numeric input types; no extra hypotheses.

```lean
∀ (p : NativeBridge.RPositive),
  NativeBridge.binaryNatTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_N p) = NativeBridge.positiveTo p - 1
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.PosDef.Pos.eqb

NativeBridge.Incremental.BinaryOrder.positive_eqb_agrees

目标：Nat BEq；范围：All values of the mechanical numeric input types; no extra hypotheses.

```lean
∀ (p q : NativeBridge.RPositive),
  NativeBridge.boolTo (Rocq.Corelib.BinNums.PosDef.Pos.eqb p q) =
    (NativeBridge.positiveTo p == NativeBridge.positiveTo q)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.PosDef.Pos.leb

NativeBridge.Incremental.BinaryOrder.positive_leb_agrees

目标：decide (n ≤ m) : Bool；范围：All values of the mechanical numeric input types; no extra hypotheses.

```lean
∀ (p q : NativeBridge.RPositive),
  NativeBridge.boolTo (Rocq.Corelib.BinNums.PosDef.Pos.leb p q) =
    decide (NativeBridge.positiveTo p ≤ NativeBridge.positiveTo q)
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.NatDef.N.compare

NativeBridge.Incremental.BinaryOrder.n_compare_agrees

目标：compare on Nat；范围：All values of the mechanical numeric input types; no extra hypotheses.

```lean
∀ (p q : NativeBridge.RNatBinary),
  NativeBridge.comparisonTo (Rocq.Corelib.BinNums.NatDef.N.compare p q) =
    compare (NativeBridge.binaryNatTo p) (NativeBridge.binaryNatTo q)
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.NatDef.N.leb

NativeBridge.Incremental.BinaryOrder.n_leb_agrees

目标：decide (n ≤ m) : Bool；范围：All values of the mechanical numeric input types; no extra hypotheses.

```lean
∀ (p q : NativeBridge.RNatBinary),
  NativeBridge.boolTo (Rocq.Corelib.BinNums.NatDef.N.leb p q) =
    decide (NativeBridge.binaryNatTo p ≤ NativeBridge.binaryNatTo q)
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.NatDef.N.double

NativeBridge.Incremental.BinaryInt.n_double_agrees

目标：2*n : Nat；范围：All values of the mechanical numeric input types; no extra hypotheses.

```lean
∀ (n : NativeBridge.RNatBinary),
  NativeBridge.binaryNatTo (Rocq.Corelib.BinNums.NatDef.N.double n) = 2 * NativeBridge.binaryNatTo n
```

公理闭包：空

## Corelib.BinNums.NatDef.N.succ_double

NativeBridge.Incremental.BinaryInt.n_succ_double_agrees

目标：2*n+1 : Nat；范围：All values of the mechanical numeric input types; no extra hypotheses.

```lean
∀ (n : NativeBridge.RNatBinary),
  NativeBridge.binaryNatTo (Rocq.Corelib.BinNums.NatDef.N.succ_double n) = 2 * NativeBridge.binaryNatTo n + 1
```

公理闭包：空

## Corelib.BinNums.NatDef.N.succ_pos

NativeBridge.Incremental.BinaryInt.n_succ_pos_agrees

目标：n+1 : Nat；范围：All values of the mechanical numeric input types; no extra hypotheses.

```lean
∀ (n : NativeBridge.RNatBinary),
  NativeBridge.positiveTo (Rocq.Corelib.BinNums.NatDef.N.succ_pos n) = NativeBridge.binaryNatTo n + 1
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.PosDef.Pos.Ndouble

NativeBridge.Incremental.BinaryInt.pos_Ndouble_agrees

目标：2*n : Nat；范围：All values of the mechanical numeric input types; no extra hypotheses.

```lean
∀ (n : NativeBridge.RNatBinary),
  NativeBridge.binaryNatTo (Rocq.Corelib.BinNums.PosDef.Pos.Ndouble n) = 2 * NativeBridge.binaryNatTo n
```

公理闭包：空

## Corelib.BinNums.PosDef.Pos.Nsucc_double

NativeBridge.Incremental.BinaryInt.pos_Nsucc_double_agrees

目标：2*n+1 : Nat；范围：All values of the mechanical numeric input types; no extra hypotheses.

```lean
∀ (n : NativeBridge.RNatBinary),
  NativeBridge.binaryNatTo (Rocq.Corelib.BinNums.PosDef.Pos.Nsucc_double n) = 2 * NativeBridge.binaryNatTo n + 1
```

公理闭包：空

## Corelib.BinNums.IntDef.Z.compare

NativeBridge.Incremental.BinaryInt.z_compare_agrees

目标：compare on Int；范围：All values of the mechanical numeric input types; no extra hypotheses.

```lean
∀ (x y : NativeBridge.RIntBinary),
  NativeBridge.comparisonTo (Rocq.Corelib.BinNums.IntDef.Z.compare x y) =
    compare (NativeBridge.binaryIntTo x) (NativeBridge.binaryIntTo y)
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.IntDef.Z.double

NativeBridge.Incremental.BinaryInt.z_double_agrees

目标：2*z : Int；范围：All values of the mechanical numeric input types; no extra hypotheses.

```lean
∀ (z : NativeBridge.RIntBinary),
  NativeBridge.binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.double z) = 2 * NativeBridge.binaryIntTo z
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.IntDef.Z.succ_double

NativeBridge.Incremental.BinaryInt.z_succ_double_agrees

目标：2*z+1 : Int；范围：All values of the mechanical numeric input types; no extra hypotheses.

```lean
∀ (z : NativeBridge.RIntBinary),
  NativeBridge.binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.succ_double z) = 2 * NativeBridge.binaryIntTo z + 1
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.IntDef.Z.pred_double

NativeBridge.Incremental.BinaryInt.z_pred_double_agrees

目标：2*z-1 : Int；范围：All values of the mechanical numeric input types; no extra hypotheses.

```lean
∀ (z : NativeBridge.RIntBinary),
  NativeBridge.binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.pred_double z) = 2 * NativeBridge.binaryIntTo z - 1
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.IntDef.Z.to_pos

NativeBridge.Incremental.BinaryInt.z_to_pos_agrees

目标：max 1 z.toNat；范围：All values of the mechanical numeric input types; no extra hypotheses.

```lean
∀ (z : NativeBridge.RIntBinary),
  NativeBridge.positiveTo (Rocq.Corelib.BinNums.IntDef.Z.to_pos z) = max 1 (NativeBridge.binaryIntTo z).toNat
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.IntDef.Z.div2

NativeBridge.Incremental.BinaryInt.z_div2_agrees

目标：z / 2 : Int (Euclidean division)；范围：All values of the mechanical numeric input types; no extra hypotheses.

```lean
∀ (z : NativeBridge.RIntBinary),
  NativeBridge.binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.div2 z) = NativeBridge.binaryIntTo z / 2
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.IntDef.Z.lt

NativeBridge.Incremental.BinaryInt.z_lt_agrees

目标：Int <；范围：All values of the mechanical numeric input types; no extra hypotheses.

```lean
∀ (x y : NativeBridge.RIntBinary),
  Rocq.Corelib.BinNums.IntDef.Z.lt x y ↔ NativeBridge.binaryIntTo x < NativeBridge.binaryIntTo y
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.IntDef.Z.gt

NativeBridge.Incremental.BinaryInt.z_gt_agrees

目标：Int >；范围：All values of the mechanical numeric input types; no extra hypotheses.

```lean
∀ (x y : NativeBridge.RIntBinary),
  Rocq.Corelib.BinNums.IntDef.Z.gt x y ↔ NativeBridge.binaryIntTo x > NativeBridge.binaryIntTo y
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.IntDef.Z.le

NativeBridge.Incremental.BinaryInt.z_le_agrees

目标：Int ≤；范围：All values of the mechanical numeric input types; no extra hypotheses.

```lean
∀ (x y : NativeBridge.RIntBinary),
  Rocq.Corelib.BinNums.IntDef.Z.le x y ↔ NativeBridge.binaryIntTo x ≤ NativeBridge.binaryIntTo y
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.IntDef.Z.ge

NativeBridge.Incremental.BinaryInt.z_ge_agrees

目标：Int ≥；范围：All values of the mechanical numeric input types; no extra hypotheses.

```lean
∀ (x y : NativeBridge.RIntBinary),
  Rocq.Corelib.BinNums.IntDef.Z.ge x y ↔ NativeBridge.binaryIntTo x ≥ NativeBridge.binaryIntTo y
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.IntDef.Z.ltb

NativeBridge.Incremental.BinaryInt.z_ltb_agrees

目标：decide (x < y) : Bool；范围：All values of the mechanical numeric input types; no extra hypotheses.

```lean
∀ (x y : NativeBridge.RIntBinary),
  NativeBridge.boolTo (Rocq.Corelib.BinNums.IntDef.Z.ltb x y) =
    decide (NativeBridge.binaryIntTo x < NativeBridge.binaryIntTo y)
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.IntDef.Z.leb

NativeBridge.Incremental.BinaryInt.z_leb_agrees

目标：decide (x ≤ y) : Bool；范围：All values of the mechanical numeric input types; no extra hypotheses.

```lean
∀ (x y : NativeBridge.RIntBinary),
  NativeBridge.boolTo (Rocq.Corelib.BinNums.IntDef.Z.leb x y) =
    decide (NativeBridge.binaryIntTo x ≤ NativeBridge.binaryIntTo y)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.IntDef.Z.eqb

NativeBridge.Incremental.BinaryInt.z_eqb_agrees

目标：Int BEq；范围：All values of the mechanical numeric input types; no extra hypotheses.

```lean
∀ (x y : NativeBridge.RIntBinary),
  NativeBridge.boolTo (Rocq.Corelib.BinNums.IntDef.Z.eqb x y) =
    (NativeBridge.binaryIntTo x == NativeBridge.binaryIntTo y)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.IntDef.Z.max

NativeBridge.Incremental.BinaryInt.z_max_agrees

目标：max : Int → Int → Int；范围：All values of the mechanical numeric input types; no extra hypotheses.

```lean
∀ (x y : NativeBridge.RIntBinary),
  NativeBridge.binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.max x y) =
    max (NativeBridge.binaryIntTo x) (NativeBridge.binaryIntTo y)
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.IntDef.Z.min

NativeBridge.Incremental.BinaryInt.z_min_agrees

目标：min : Int → Int → Int；范围：All values of the mechanical numeric input types; no extra hypotheses.

```lean
∀ (x y : NativeBridge.RIntBinary),
  NativeBridge.binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.min x y) =
    min (NativeBridge.binaryIntTo x) (NativeBridge.binaryIntTo y)
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.PosDef.Pos.mask

NativeBridge.Incremental.BinaryMask.maskIso

目标：Option Nat；范围：IsNeg ↔ none, IsNul ↔ some 0, IsPos p ↔ some (positiveTo p); both inverse laws, all values. Negative magnitude was not stored by source mask.

```lean
NativeBridge.Iso Rocq.Corelib.BinNums.PosDef.Pos.mask (Option Nat)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.PosDef.Pos.double_mask

NativeBridge.Incremental.BinaryMask.double_mask_agrees

目标：Option.map (2*·)；范围：All masks.

```lean
∀ (m : NativeBridge.Incremental.BinaryMask.RMask),
  NativeBridge.Incremental.BinaryMask.maskTo (Rocq.Corelib.BinNums.PosDef.Pos.double_mask m) =
    Option.map (fun x => 2 * x) (NativeBridge.Incremental.BinaryMask.maskTo m)
```

公理闭包：空

## Corelib.BinNums.PosDef.Pos.succ_double_mask

NativeBridge.Incremental.BinaryMask.succ_double_mask_agrees

目标：Option.map (fun n => 2*n+1)；范围：All masks.

```lean
∀ (m : NativeBridge.Incremental.BinaryMask.RMask),
  NativeBridge.Incremental.BinaryMask.maskTo (Rocq.Corelib.BinNums.PosDef.Pos.succ_double_mask m) =
    Option.map (fun n => 2 * n + 1) (NativeBridge.Incremental.BinaryMask.maskTo m)
```

公理闭包：空

## Corelib.BinNums.PosDef.Pos.double_pred_mask

NativeBridge.Incremental.BinaryMask.double_pred_mask_agrees

目标：some (2*n-2)；范围：All positive inputs.

```lean
∀ (p : NativeBridge.RPositive),
  NativeBridge.Incremental.BinaryMask.maskTo (Rocq.Corelib.BinNums.PosDef.Pos.double_pred_mask p) =
    some (2 * NativeBridge.positiveTo p - 2)
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.PosDef.Pos.sub_mask

NativeBridge.Incremental.BinaryMask.sub_mask_agrees

目标：if m ≤ n then some (n-m) else none；范围：All positive inputs; negative result distinguished from zero.

```lean
∀ (p q : NativeBridge.RPositive),
  NativeBridge.Incremental.BinaryMask.maskTo (Rocq.Corelib.BinNums.PosDef.Pos.sub_mask p q) =
    NativeBridge.Incremental.BinaryMask.checkedSub (NativeBridge.positiveTo p) (NativeBridge.positiveTo q)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.PosDef.Pos.sub_mask_carry

NativeBridge.Incremental.BinaryMask.sub_mask_carry_agrees

目标：if m+1 ≤ n then some (n-(m+1)) else none；范围：All positive inputs; includes explicit borrow.

```lean
∀ (p q : NativeBridge.RPositive),
  NativeBridge.Incremental.BinaryMask.maskTo (Rocq.Corelib.BinNums.PosDef.Pos.sub_mask_carry p q) =
    NativeBridge.Incremental.BinaryMask.checkedSub (NativeBridge.positiveTo p) (NativeBridge.positiveTo q + 1)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.PosDef.Pos.sub

NativeBridge.Incremental.BinaryMask.positive_sub_agrees

目标：max 1 (n-m)；范围：All positive inputs; zero and negative differences saturate to one.

```lean
∀ (p q : NativeBridge.RPositive),
  NativeBridge.positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.sub p q) =
    max 1 (NativeBridge.positiveTo p - NativeBridge.positiveTo q)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.PosDef.Pos.mask_rec

NativeBridge.Incremental.BinaryMask.mask_rec_agrees

目标：Native Option/Nat elimination with zero/positive/none branches；范围：All masks; Type-valued motives pulled back from Option Nat.

```lean
∀ (P : Option Nat → Type) (z : P (some 0)) (p : (n : { n // 0 < n }) → P (some n.val)) (neg : P none)
  (m : NativeBridge.Incremental.BinaryMask.RMask),
  Rocq.Corelib.BinNums.PosDef.Pos.mask_rec (fun m => P (NativeBridge.Incremental.BinaryMask.maskTo m)) z
      (fun x => p ⟨NativeBridge.positiveTo x, ⋯⟩) neg m =
    NativeBridge.Incremental.BinaryMask.maskElim z p neg (NativeBridge.Incremental.BinaryMask.maskTo m)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.PosDef.Pos.mask_rect

NativeBridge.Incremental.BinaryMask.mask_rect_agrees

目标：Native Option/Nat elimination with zero/positive/none branches；范围：All masks; Sort u-valued motives pulled back from Option Nat.

```lean
∀ (P : Option Nat → Sort u) (z : P (some 0)) (p : (n : { n // 0 < n }) → P (some n.val)) (neg : P none)
  (m : NativeBridge.Incremental.BinaryMask.RMask),
  Rocq.Corelib.BinNums.PosDef.Pos.mask_rect (fun m => P (NativeBridge.Incremental.BinaryMask.maskTo m)) z
      (fun x => p ⟨NativeBridge.positiveTo x, ⋯⟩) neg m =
    NativeBridge.Incremental.BinaryMask.maskElim z p neg (NativeBridge.Incremental.BinaryMask.maskTo m)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.IntDef.Z.pos_sub

NativeBridge.Incremental.BinaryArithmetic.z_pos_sub_agrees

目标：(n : Int) - (m : Int)；范围：All inputs; source mutual-recursion companion reconstructed as a local definition when not separately exported, with constructor equations checked by rfl. No new source declaration or axiom.

```lean
∀ (p q : NativeBridge.RPositive),
  NativeBridge.binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.pos_sub p q) =
    ↑(NativeBridge.positiveTo p) - ↑(NativeBridge.positiveTo q)
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.IntDef.Z.add

NativeBridge.Incremental.BinaryArithmetic.z_add_agrees

目标：Int addition；范围：All inputs; source mutual-recursion companion reconstructed as a local definition when not separately exported, with constructor equations checked by rfl. No new source declaration or axiom.

```lean
∀ (x y : NativeBridge.RIntBinary),
  NativeBridge.binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.add x y) =
    NativeBridge.binaryIntTo x + NativeBridge.binaryIntTo y
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.IntDef.Z.sub

NativeBridge.Incremental.BinaryArithmetic.z_sub_agrees

目标：Int subtraction；范围：All inputs; source mutual-recursion companion reconstructed as a local definition when not separately exported, with constructor equations checked by rfl. No new source declaration or axiom.

```lean
∀ (x y : NativeBridge.RIntBinary),
  NativeBridge.binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.sub x y) =
    NativeBridge.binaryIntTo x - NativeBridge.binaryIntTo y
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.NatDef.N.sub

NativeBridge.Incremental.BinaryNatSub.n_sub_agrees

目标：Nat subtraction；范围：All inputs; source mutual-recursion companion reconstructed as a local definition when not separately exported, with constructor equations checked by rfl. No new source declaration or axiom.

```lean
∀ (x y : NativeBridge.RNatBinary),
  NativeBridge.binaryNatTo (Rocq.Corelib.BinNums.NatDef.N.sub x y) =
    NativeBridge.binaryNatTo x - NativeBridge.binaryNatTo y
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Init.Datatypes.list

NativeBridge.Incremental.DatatypeNormalization.fullListIso

目标：List (PLift A)；范围：All A : Sort u; erasing PLift for A : Type u agrees with the existing List A bridge.

```lean
(A : Sort u) → NativeBridge.Iso (Rocq.Corelib.Init.Datatypes.list A) (List (PLift A))
```

公理闭包：空

## Corelib.Init.Datatypes.option

NativeBridge.Incremental.DatatypeNormalization.fullOptionIso

目标：Option (PLift A)；范围：All A : Sort u; erasing PLift for A : Type u agrees with the existing Option A bridge.

```lean
(A : Sort u) → NativeBridge.Iso (Rocq.Corelib.Init.Datatypes.option A) (Option (PLift A))
```

公理闭包：空

## Corelib.Init.Datatypes.result

NativeBridge.Incremental.DatatypeNormalization.fullResultIso

目标：Except (PLift E) (PLift A)；范围：All A : Sort u and E : Sort v; Type-specialized compatibility checked.

```lean
(A : Sort u) → (E : Sort v) → NativeBridge.Iso (Rocq.Corelib.Init.Datatypes.result A E) (Except (PLift E) (PLift A))
```

公理闭包：空

## Corelib.Init.Datatypes.CompareSpecT

NativeBridge.Incremental.DatatypeNormalization.compareSpecTIso

目标：PLift of the selected native comparison proposition；范围：All three propositions and all comparison indices.

```lean
(Peq Plt Pgt : Prop) →
  (c : NativeBridge.RComparison) →
    NativeBridge.Iso (Rocq.Corelib.Init.Datatypes.CompareSpecT Peq Plt Pgt c)
      (PLift (NativeBridge.Incremental.DatatypeNormalization.compareSpec Peq Plt Pgt (NativeBridge.comparisonTo c)))
```

公理闭包：空

## Corelib.Init.Datatypes.CompSpecT

NativeBridge.Incremental.DatatypeNormalization.compSpecTIso

目标：PLift of the native relation proposition selected by Ordering；范围：All Type-valued carriers, relation arguments and comparison indices.

```lean
{A : Type u} →
  (eq lt : A → A → Prop) →
    (x y : A) →
      (c : NativeBridge.RComparison) →
        NativeBridge.Iso (Rocq.Corelib.Init.Datatypes.CompSpecT A eq lt x y c)
          (PLift
            (NativeBridge.Incremental.DatatypeNormalization.compareSpec (eq x y) (lt x y) (lt y x)
              (NativeBridge.comparisonTo c)))
```

公理闭包：空

## Corelib.Init.Datatypes.reflect

NativeBridge.Incremental.DatatypeNormalization.reflectIso

目标：PLift (if b then P else ¬P)；范围：All P : Prop and boolean indices; indexed bridge in addition to the existing reflect correspondence.

```lean
(P : Prop) →
  (b : NativeBridge.RBool) →
    NativeBridge.Iso (Rocq.Corelib.Init.Datatypes.reflect P b)
      (PLift (NativeBridge.Incremental.DatatypeNormalization.boolSpec P (¬P) (NativeBridge.boolTo b)))
```

公理闭包：空

## Corelib.Init.Datatypes.BoolSpec

NativeBridge.Incremental.DatatypeNormalization.boolSpec_agrees

目标：if b then P else Q；范围：All proposition/relation arguments and indices; iff of predicates, not a proof that arbitrary inputs satisfy them.

```lean
∀ (P Q : Prop) (b : NativeBridge.RBool),
  Rocq.Corelib.Init.Datatypes.BoolSpec P Q b ↔
    NativeBridge.Incremental.DatatypeNormalization.boolSpec P Q (NativeBridge.boolTo b)
```

公理闭包：空

## Corelib.Init.Datatypes.CompareSpec

NativeBridge.Incremental.DatatypeNormalization.compareSpec_agrees

目标：Ordering-indexed selection of Peq / Plt / Pgt；范围：All proposition/relation arguments and indices; iff of predicates, not a proof that arbitrary inputs satisfy them.

```lean
∀ (Peq Plt Pgt : Prop) (c : NativeBridge.RComparison),
  Rocq.Corelib.Init.Datatypes.CompareSpec Peq Plt Pgt c ↔
    NativeBridge.Incremental.DatatypeNormalization.compareSpec Peq Plt Pgt (NativeBridge.comparisonTo c)
```

公理闭包：空

## Corelib.Init.Datatypes.CompSpec

NativeBridge.Incremental.DatatypeNormalization.compSpec_agrees

目标：Ordering-indexed selection of eq x y / lt x y / lt y x；范围：All proposition/relation arguments and indices; iff of predicates, not a proof that arbitrary inputs satisfy them.

```lean
∀ {A : Sort u} (eq lt : A → A → Prop) (x y : A) (c : NativeBridge.RComparison),
  Rocq.Corelib.Init.Datatypes.CompSpec A eq lt x y c ↔
    NativeBridge.Incremental.DatatypeNormalization.compareSpec (eq x y) (lt x y) (lt y x) (NativeBridge.comparisonTo c)
```

公理闭包：空

## Corelib.Init.Datatypes.CompareSpecT_rec

NativeBridge.Incremental.DatatypeSpecs.compare_rec_agrees

目标：Native Ordering / PLift elimination；范围：Type-valued motives pulled back from the native indexed representation.

```lean
∀ (Peq Plt Pgt : Prop)
  (M : (c : Ordering) → PLift (NativeBridge.Incremental.DatatypeNormalization.compareSpec Peq Plt Pgt c) → Type)
  (he : (h : Peq) → M Ordering.eq { down := h }) (hl : (h : Plt) → M Ordering.lt { down := h })
  (hg : (h : Pgt) → M Ordering.gt { down := h }) (c : NativeBridge.RComparison)
  (h : Rocq.Corelib.Init.Datatypes.CompareSpecT Peq Plt Pgt c),
  Rocq.Corelib.Init.Datatypes.CompareSpecT_rec Peq Plt Pgt
      (fun c h => M (NativeBridge.comparisonTo c) (NativeBridge.Incremental.DatatypeNormalization.compareSpecTTo h)) he
      hl hg c h =
    NativeBridge.Incremental.DatatypeSpecs.compareElim he hl hg (NativeBridge.comparisonTo c)
      (NativeBridge.Incremental.DatatypeNormalization.compareSpecTTo h)
```

公理闭包：空

## Corelib.Init.Datatypes.CompareSpecT_rect

NativeBridge.Incremental.DatatypeSpecs.compare_rect_agrees

目标：Native Ordering / PLift elimination；范围：Sort u-valued motives pulled back from the native indexed representation.

```lean
∀ (Peq Plt Pgt : Prop)
  (M : (c : Ordering) → PLift (NativeBridge.Incremental.DatatypeNormalization.compareSpec Peq Plt Pgt c) → Sort u)
  (he : (h : Peq) → M Ordering.eq { down := h }) (hl : (h : Plt) → M Ordering.lt { down := h })
  (hg : (h : Pgt) → M Ordering.gt { down := h }) (c : NativeBridge.RComparison)
  (h : Rocq.Corelib.Init.Datatypes.CompareSpecT Peq Plt Pgt c),
  Rocq.Corelib.Init.Datatypes.CompareSpecT_rect Peq Plt Pgt
      (fun c h => M (NativeBridge.comparisonTo c) (NativeBridge.Incremental.DatatypeNormalization.compareSpecTTo h)) he
      hl hg c h =
    NativeBridge.Incremental.DatatypeSpecs.compareElim he hl hg (NativeBridge.comparisonTo c)
      (NativeBridge.Incremental.DatatypeNormalization.compareSpecTTo h)
```

公理闭包：空

## Corelib.Init.Datatypes.reflect_rec

NativeBridge.Incremental.DatatypeSpecs.reflect_rec_agrees

目标：Native Bool / PLift elimination；范围：Type-valued motives pulled back from the native indexed representation.

```lean
∀ (P : Prop) (M : (b : Bool) → PLift (NativeBridge.Incremental.DatatypeNormalization.boolSpec P (¬P) b) → Type)
  (ht : (h : P) → M true { down := h }) (hf : (h : ¬P) → M false { down := h }) (b : NativeBridge.RBool)
  (h : Rocq.Corelib.Init.Datatypes.reflect P b),
  Rocq.Corelib.Init.Datatypes.reflect_rec P
      (fun b h => M (NativeBridge.boolTo b) (NativeBridge.Incremental.DatatypeNormalization.reflectTo h)) ht
      (fun n => hf ⋯) b h =
    NativeBridge.Incremental.DatatypeSpecs.reflectElim ht hf (NativeBridge.boolTo b)
      (NativeBridge.Incremental.DatatypeNormalization.reflectTo h)
```

公理闭包：空

## Corelib.Init.Datatypes.reflect_rect

NativeBridge.Incremental.DatatypeSpecs.reflect_rect_agrees

目标：Native Bool / PLift elimination；范围：Sort u-valued motives pulled back from the native indexed representation.

```lean
∀ (P : Prop) (M : (b : Bool) → PLift (NativeBridge.Incremental.DatatypeNormalization.boolSpec P (¬P) b) → Sort u)
  (ht : (h : P) → M true { down := h }) (hf : (h : ¬P) → M false { down := h }) (b : NativeBridge.RBool)
  (h : Rocq.Corelib.Init.Datatypes.reflect P b),
  Rocq.Corelib.Init.Datatypes.reflect_rect P
      (fun b h => M (NativeBridge.boolTo b) (NativeBridge.Incremental.DatatypeNormalization.reflectTo h)) ht
      (fun n => hf ⋯) b h =
    NativeBridge.Incremental.DatatypeSpecs.reflectElim ht hf (NativeBridge.boolTo b)
      (NativeBridge.Incremental.DatatypeNormalization.reflectTo h)
```

公理闭包：空

## Corelib.Init.Datatypes.CompareSpec2Type

NativeBridge.Incremental.DatatypeSpecs.compareSpec2Type_agrees

目标：PLift.up of the corresponding native proposition proof；范围：All inputs; all three source proof obligations instantiated by closed proofs.

```lean
∀ (Peq Plt Pgt : Prop) (c : NativeBridge.RComparison) (h : Rocq.Corelib.Init.Datatypes.CompareSpec Peq Plt Pgt c),
  NativeBridge.Incremental.DatatypeNormalization.compareSpecTTo
      (RocqPending.Corelib.Init.Datatypes.CompareSpec2Type Peq Plt Pgt c h) =
    { down := ⋯ }
```

公理闭包：空

## Corelib.Init.Datatypes.CompSpec2Type

NativeBridge.Incremental.DatatypeSpecs.compSpec2Type_agrees

目标：PLift.up of the corresponding native proposition proof；范围：All inputs; all three source proof obligations instantiated by closed proofs.

```lean
∀ {A : Type u} (eq lt : A → A → Prop) (x y : A) (c : NativeBridge.RComparison)
  (h : Rocq.Corelib.Init.Datatypes.CompSpec A eq lt x y c),
  NativeBridge.Incremental.DatatypeNormalization.compareSpecTTo
      (RocqPending.Corelib.Init.Datatypes.CompSpec2Type A eq lt x y c h) =
    { down := ⋯ }
```

公理闭包：空

## Corelib.Init.Logic.unique

NativeBridge.Incremental.LogicNormalization.unique_agrees

目标：P x ∧ ∀ y, P y → x = y；范围：full source Sort parameters; heterogeneous source/target for subrelation

```lean
∀ (A : Sort u) (P : A → Prop) (x : A), Rocq.Corelib.Init.Logic.unique A P x ↔ P x ∧ ∀ (y : A), P y → x = y
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.uniqueness

NativeBridge.Incremental.LogicNormalization.uniqueness_agrees

目标：∀ x y, P x → P y → x = y；范围：full source Sort parameters; heterogeneous source/target for subrelation

```lean
∀ (A : Sort u) (P : A → Prop), Rocq.Corelib.Init.Logic.uniqueness A P ↔ ∀ (x y : A), P x → P y → x = y
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.subrelation

NativeBridge.Incremental.LogicNormalization.subrelation_agrees

目标：∀ x y, R x y → S x y；范围：full source Sort parameters; heterogeneous source/target for subrelation

```lean
∀ (A : Sort u) (B : Sort v) (R S : A → B → Prop),
  Rocq.Corelib.Init.Logic.subrelation A B R S ↔ ∀ (x : A) (y : B), R x y → S x y
```

公理闭包：空

## Corelib.Init.Logic.False_rec

NativeBridge.Incremental.LogicElimination.false_rec_agrees

目标：False.elim；范围：Type result; source signature preserved

```lean
∀ (P : Type) (h : Rocq.Corelib.Init.Logic.False), Rocq.Corelib.Init.Logic.False_rec P h = ⋯.elim
```

公理闭包：空

## Corelib.Init.Logic.False_rect

NativeBridge.Incremental.LogicElimination.false_rect_agrees

目标：False.elim；范围：Sort result; source signature preserved

```lean
∀ (P : Sort u) (h : Rocq.Corelib.Init.Logic.False), Rocq.Corelib.Init.Logic.False_rect P h = ⋯.elim
```

公理闭包：空

## Corelib.Init.Logic.True_rec

NativeBridge.Incremental.LogicElimination.true_rec_agrees

目标：selected value；范围：Type result; source signature preserved

```lean
∀ (P : Type) (p : P) (h : Rocq.Corelib.Init.Logic.True), Rocq.Corelib.Init.Logic.True_rec P p h = p
```

公理闭包：空

## Corelib.Init.Logic.True_rect

NativeBridge.Incremental.LogicElimination.true_rect_agrees

目标：selected value；范围：Sort result; source signature preserved

```lean
∀ (P : Sort u) (p : P) (h : Rocq.Corelib.Init.Logic.True), Rocq.Corelib.Init.Logic.True_rect P p h = p
```

公理闭包：空

## Corelib.Init.Logic.and_rec

NativeBridge.Incremental.LogicElimination.and_rec_agrees

目标：apply function to native And projections；范围：Type result; source signature preserved

```lean
∀ (A B : Prop) (P : Type) (f : A → B → P) (h : Rocq.Corelib.Init.Logic.and A B),
  Rocq.Corelib.Init.Logic.and_rec A B P f h = f ⋯ ⋯
```

公理闭包：空

## Corelib.Init.Logic.and_rect

NativeBridge.Incremental.LogicElimination.and_rect_agrees

目标：apply function to native And projections；范围：Sort result; source signature preserved

```lean
∀ (A B : Prop) (P : Sort u) (f : A → B → P) (h : Rocq.Corelib.Init.Logic.and A B),
  Rocq.Corelib.Init.Logic.and_rect A B P f h = f ⋯ ⋯
```

公理闭包：空

## Corelib.Init.Logic.ex_rec

NativeBridge.Incremental.LogicExistsElimination.ex_rec_agrees

目标：native Exists elimination through Prop witness and predicate proofs；范围：A : Prop as in exported signature; dependent native Exists motive; Type result

```lean
∀ (A : Prop) (P : A → Prop) (F : Exists P → Type) (f : (x : A) → (p : P x) → F ⋯) (h : Rocq.Corelib.Init.Logic.ex A P),
  RocqPending.Corelib.Init.Logic.ex_rec A P (fun e => F ⋯) f h =
    NativeBridge.Incremental.LogicExistsElimination.nativeExistsElim F f ⋯
```

公理闭包：空

## Corelib.Init.Logic.ex_rect

NativeBridge.Incremental.LogicExistsElimination.ex_rect_agrees

目标：native Exists elimination through Prop witness and predicate proofs；范围：A : Prop as in exported signature; dependent native Exists motive; Sort result

```lean
∀ (A : Prop) (P : A → Prop) (F : Exists P → Sort u) (f : (x : A) → (p : P x) → F ⋯)
  (h : Rocq.Corelib.Init.Logic.ex A P),
  RocqPending.Corelib.Init.Logic.ex_rect A P (fun e => F ⋯) f h =
    NativeBridge.Incremental.LogicExistsElimination.nativeExistsElim F f ⋯
```

公理闭包：空

## Corelib.Init.Logic.ex2_rec

NativeBridge.Incremental.LogicExistsElimination.ex2_rec_agrees

目标：native Exists elimination through Prop witness and predicate proofs；范围：A : Prop as in exported signature; dependent native Exists motive; Type result

```lean
∀ (A : Prop) (P Q : A → Prop) (F : (∃ x, P x ∧ Q x) → Type) (f : (x : A) → (p : P x) → (q : Q x) → F ⋯)
  (h : Rocq.Corelib.Init.Logic.ex2 A P Q),
  RocqPending.Corelib.Init.Logic.ex2_rec A P Q (fun e => F ⋯) f h =
    NativeBridge.Incremental.LogicExistsElimination.nativeExists2Elim F f ⋯
```

公理闭包：空

## Corelib.Init.Logic.ex2_rect

NativeBridge.Incremental.LogicExistsElimination.ex2_rect_agrees

目标：native Exists elimination through Prop witness and predicate proofs；范围：A : Prop as in exported signature; dependent native Exists motive; Sort result

```lean
∀ (A : Prop) (P Q : A → Prop) (F : (∃ x, P x ∧ Q x) → Sort u) (f : (x : A) → (p : P x) → (q : Q x) → F ⋯)
  (h : Rocq.Corelib.Init.Logic.ex2 A P Q),
  RocqPending.Corelib.Init.Logic.ex2_rect A P Q (fun e => F ⋯) f h =
    NativeBridge.Incremental.LogicExistsElimination.nativeExists2Elim F f ⋯
```

公理闭包：空

## Corelib.Init.Logic.eq_ex_rec

NativeBridge.Incremental.LogicProofElimination.eq_ex_rec_agrees

目标：selected native branch value; all proof arguments identified by proof irrelevance；范围：A : Prop as in exported signature; native equality-indexed motive; arbitrary branch value, representing the unique proof-argument fiber; Type result

```lean
∀ (A : Prop) (P : A → Prop) (a b : Rocq.Corelib.Init.Logic.ex A P) (F : ⋯ = ⋯ → Type) (f : F ⋯)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Logic.ex A P) a b),
  RocqPending.Corelib.Init.Logic.eq_ex_rec A P a b (fun e => F ⋯) (fun x x_1 => f) e = f
```

公理闭包：空

## Corelib.Init.Logic.eq_ex_rect

NativeBridge.Incremental.LogicProofElimination.eq_ex_rect_agrees

目标：selected native branch value; all proof arguments identified by proof irrelevance；范围：A : Prop as in exported signature; native equality-indexed motive; arbitrary branch value, representing the unique proof-argument fiber; Sort result

```lean
∀ (A : Prop) (P : A → Prop) (a b : Rocq.Corelib.Init.Logic.ex A P) (F : ⋯ = ⋯ → Sort w) (f : F ⋯)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Logic.ex A P) a b),
  RocqPending.Corelib.Init.Logic.eq_ex_rect A P a b (fun e => F ⋯) (fun x x_1 => f) e = f
```

公理闭包：空

## Corelib.Init.Logic.eq_ex_rec_uncurried

NativeBridge.Incremental.LogicProofElimination.eq_ex_rec_uncurried_agrees

目标：selected native branch value; all proof arguments identified by proof irrelevance；范围：A : Prop as in exported signature; native equality-indexed motive; arbitrary branch value, representing the unique proof-argument fiber; Type result

```lean
∀ (A : Prop) (P : A → Prop) (a b : Rocq.Corelib.Init.Logic.ex A P) (F : ⋯ = ⋯ → Type) (f : F ⋯)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Logic.ex A P) a b),
  RocqPending.Corelib.Init.Logic.eq_ex_rec_uncurried A P a b (fun e => F ⋯) (fun x => f) e = f
```

公理闭包：空

## Corelib.Init.Logic.eq_ex_rect_uncurried

NativeBridge.Incremental.LogicProofElimination.eq_ex_rect_uncurried_agrees

目标：selected native branch value; all proof arguments identified by proof irrelevance；范围：A : Prop as in exported signature; native equality-indexed motive; arbitrary branch value, representing the unique proof-argument fiber; Sort result

```lean
∀ (A : Prop) (P : A → Prop) (a b : Rocq.Corelib.Init.Logic.ex A P) (F : ⋯ = ⋯ → Sort w) (f : F ⋯)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Logic.ex A P) a b),
  RocqPending.Corelib.Init.Logic.eq_ex_rect_uncurried A P a b (fun e => F ⋯) (fun x => f) e = f
```

公理闭包：空

## Corelib.Init.Logic.eq_ex_rect_ex_intro

NativeBridge.Incremental.LogicProofElimination.eq_ex_rect_ex_intro_agrees

目标：selected native branch value; all proof arguments identified by proof irrelevance；范围：A : Prop as in exported signature; native equality-indexed motive; arbitrary branch value, representing the unique proof-argument fiber; Sort result

```lean
∀ (A : Prop) (P : A → Prop) (a1 : A) (a2 : P a1) (b1 : A) (b2 : P b1) (F : ⋯ = ⋯ → Sort w) (f : F ⋯)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Logic.ex A P) ⋯ ⋯),
  RocqPending.Corelib.Init.Logic.eq_ex_rect_ex_intro A P a1 a2 b1 b2 (fun e => F ⋯) (fun x x_1 => f) e = f
```

公理闭包：空

## Corelib.Init.Logic.eq_ex_rect_ex_intro_l

NativeBridge.Incremental.LogicProofElimination.eq_ex_rect_ex_intro_l_agrees

目标：selected native branch value; all proof arguments identified by proof irrelevance；范围：A : Prop as in exported signature; native equality-indexed motive; arbitrary branch value, representing the unique proof-argument fiber; Sort result

```lean
∀ (A : Prop) (P : A → Prop) (a1 : A) (a2 : P a1) (b : Rocq.Corelib.Init.Logic.ex A P) (F : ⋯ = ⋯ → Sort w) (f : F ⋯)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Logic.ex A P) ⋯ b),
  RocqPending.Corelib.Init.Logic.eq_ex_rect_ex_intro_l A P a1 a2 b (fun e => F ⋯) (fun x x_1 => f) e = f
```

公理闭包：空

## Corelib.Init.Logic.eq_ex_rect_ex_intro_r

NativeBridge.Incremental.LogicProofElimination.eq_ex_rect_ex_intro_r_agrees

目标：selected native branch value; all proof arguments identified by proof irrelevance；范围：A : Prop as in exported signature; native equality-indexed motive; arbitrary branch value, representing the unique proof-argument fiber; Sort result

```lean
∀ (A : Prop) (P : A → Prop) (a : Rocq.Corelib.Init.Logic.ex A P) (b1 : A) (b2 : P b1) (F : ⋯ = ⋯ → Sort w) (f : F ⋯)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Logic.ex A P) a ⋯),
  RocqPending.Corelib.Init.Logic.eq_ex_rect_ex_intro_r A P a b1 b2 (fun e => F ⋯) (fun x x_1 => f) e = f
```

公理闭包：空

## Corelib.Init.Logic.eq_ex2_rec

NativeBridge.Incremental.LogicProofElimination.eq_ex2_rec_agrees

目标：selected native branch value; all proof arguments identified by proof irrelevance；范围：A : Prop as in exported signature; native equality-indexed motive; arbitrary branch value, representing the unique proof-argument fiber; Type result

```lean
∀ (A : Prop) (P Q : A → Prop) (a b : Rocq.Corelib.Init.Logic.ex2 A P Q) (F : ⋯ = ⋯ → Type) (f : F ⋯)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Logic.ex2 A P Q) a b),
  RocqPending.Corelib.Init.Logic.eq_ex2_rec A P Q a b (fun e => F ⋯) (fun x x_1 x_2 => f) e = f
```

公理闭包：空

## Corelib.Init.Logic.eq_ex2_rect

NativeBridge.Incremental.LogicProofElimination.eq_ex2_rect_agrees

目标：selected native branch value; all proof arguments identified by proof irrelevance；范围：A : Prop as in exported signature; native equality-indexed motive; arbitrary branch value, representing the unique proof-argument fiber; Sort result

```lean
∀ (A : Prop) (P Q : A → Prop) (a b : Rocq.Corelib.Init.Logic.ex2 A P Q) (F : ⋯ = ⋯ → Sort w) (f : F ⋯)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Logic.ex2 A P Q) a b),
  RocqPending.Corelib.Init.Logic.eq_ex2_rect A P Q a b (fun e => F ⋯) (fun x x_1 x_2 => f) e = f
```

公理闭包：空

## Corelib.Init.Logic.eq_ex2_rec_uncurried

NativeBridge.Incremental.LogicProofElimination.eq_ex2_rec_uncurried_agrees

目标：selected native branch value; all proof arguments identified by proof irrelevance；范围：A : Prop as in exported signature; native equality-indexed motive; arbitrary branch value, representing the unique proof-argument fiber; Type result

```lean
∀ (A : Prop) (P Q : A → Prop) (a b : Rocq.Corelib.Init.Logic.ex2 A P Q) (F : ⋯ = ⋯ → Type) (f : F ⋯)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Logic.ex2 A P Q) a b),
  RocqPending.Corelib.Init.Logic.eq_ex2_rec_uncurried A P Q a b (fun e => F ⋯) (fun x => f) e = f
```

公理闭包：空

## Corelib.Init.Logic.eq_ex2_rect_uncurried

NativeBridge.Incremental.LogicProofElimination.eq_ex2_rect_uncurried_agrees

目标：selected native branch value; all proof arguments identified by proof irrelevance；范围：A : Prop as in exported signature; native equality-indexed motive; arbitrary branch value, representing the unique proof-argument fiber; Sort result

```lean
∀ (A : Prop) (P Q : A → Prop) (a b : Rocq.Corelib.Init.Logic.ex2 A P Q) (F : ⋯ = ⋯ → Sort w) (f : F ⋯)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Logic.ex2 A P Q) a b),
  RocqPending.Corelib.Init.Logic.eq_ex2_rect_uncurried A P Q a b (fun e => F ⋯) (fun x => f) e = f
```

公理闭包：空

## Corelib.Init.Logic.eq_ex2_rect_ex_intro2

NativeBridge.Incremental.LogicProofElimination.eq_ex2_rect_ex_intro2_agrees

目标：selected native branch value; all proof arguments identified by proof irrelevance；范围：A : Prop as in exported signature; native equality-indexed motive; arbitrary branch value, representing the unique proof-argument fiber; Sort result

```lean
∀ (A : Prop) (P Q : A → Prop) (a1 : A) (a2 : P a1) (a3 : Q a1) (b1 : A) (b2 : P b1) (b3 : Q b1) (F : ⋯ = ⋯ → Sort w)
  (f : F ⋯) (e : NativeBridge.ME (Rocq.Corelib.Init.Logic.ex2 A P Q) ⋯ ⋯),
  RocqPending.Corelib.Init.Logic.eq_ex2_rect_ex_intro2 A P Q a1 a2 a3 b1 b2 b3 (fun e => F ⋯) (fun x x_1 x_2 => f) e = f
```

公理闭包：空

## Corelib.Init.Logic.eq_ex2_rect_ex_intro2_l

NativeBridge.Incremental.LogicProofElimination.eq_ex2_rect_ex_intro2_l_agrees

目标：selected native branch value; all proof arguments identified by proof irrelevance；范围：A : Prop as in exported signature; native equality-indexed motive; arbitrary branch value, representing the unique proof-argument fiber; Sort result

```lean
∀ (A : Prop) (P Q : A → Prop) (a1 : A) (a2 : P a1) (a3 : Q a1) (b : Rocq.Corelib.Init.Logic.ex2 A P Q)
  (F : ⋯ = ⋯ → Sort w) (f : F ⋯) (e : NativeBridge.ME (Rocq.Corelib.Init.Logic.ex2 A P Q) ⋯ b),
  RocqPending.Corelib.Init.Logic.eq_ex2_rect_ex_intro2_l A P Q a1 a2 a3 b (fun e => F ⋯) (fun x x_1 x_2 => f) e = f
```

公理闭包：空

## Corelib.Init.Logic.eq_ex2_rect_ex_intro2_r

NativeBridge.Incremental.LogicProofElimination.eq_ex2_rect_ex_intro2_r_agrees

目标：selected native branch value; all proof arguments identified by proof irrelevance；范围：A : Prop as in exported signature; native equality-indexed motive; arbitrary branch value, representing the unique proof-argument fiber; Sort result

```lean
∀ (A : Prop) (P Q : A → Prop) (a : Rocq.Corelib.Init.Logic.ex2 A P Q) (b1 : A) (b2 : P b1) (b3 : Q b1)
  (F : ⋯ = ⋯ → Sort w) (f : F ⋯) (e : NativeBridge.ME (Rocq.Corelib.Init.Logic.ex2 A P Q) a ⋯),
  RocqPending.Corelib.Init.Logic.eq_ex2_rect_ex_intro2_r A P Q a b1 b2 b3 (fun e => F ⋯) (fun x x_1 x_2 => f) e = f
```

公理闭包：空

## Corelib.Init.Specif.Exc

NativeBridge.Incremental.SpecifOperations.excIso

目标：Option A；范围：A : Type u; both inverse laws

```lean
(A : Type u) → NativeBridge.Iso (Rocq.Corelib.Init.Specif.Exc A) (Option A)
```

公理闭包：空

## Corelib.Init.Specif.Choice

NativeBridge.Incremental.SpecifOperations.choice_agrees

目标：nativeChoice: dependent pointwise selection and its proof；范围：S,T : Type, R : S → T → Prop; explicit dependent selections supplied

```lean
∀ (S T : Type) (R : S → T → Prop) (H : (x : S) → Rocq.Corelib.Init.Specif.sig T (R x)),
  NativeBridge.Incremental.subtypeTo (RocqPending.Corelib.Init.Specif.Choice S T R H) =
    NativeBridge.Incremental.SpecifOperations.nativeChoice fun x => NativeBridge.Incremental.subtypeTo (H x)
```

公理闭包：空

## Corelib.Init.Specif.Choice2

NativeBridge.Incremental.SpecifOperations.choice2_agrees

目标：nativeChoice2: PSigma distributes over a dependent function；范围：S,T : Type; R : S → T → Type; explicit dependent selections supplied

```lean
∀ (S T : Type) (R : S → T → Type) (H : (x : S) → Rocq.Corelib.Init.Specif.sigT T (R x)),
  NativeBridge.Incremental.psigmaTo (Rocq.Corelib.Init.Specif.Choice2 S T R H) =
    NativeBridge.Incremental.SpecifOperations.nativeChoice2 fun x => NativeBridge.Incremental.psigmaTo (H x)
```

公理闭包：空

## Corelib.Init.Specif.sig2_of_sigT2

NativeBridge.Incremental.SpecifOperations.sig2_of_sigT2_agrees

目标：PSigma of two proofs → Subtype of conjunction；范围：A : Sort u; P,Q : A → Prop

```lean
∀ (A : Sort u) (P Q : A → Prop) (x : Rocq.Corelib.Init.Specif.sigT2 A P Q),
  NativeBridge.Incremental.subtype2To (RocqPending.Corelib.Init.Specif.sig2_of_sigT2 A P Q x) =
    ⟨(NativeBridge.Incremental.psigma2To x).fst, ⋯⟩
```

公理闭包：空

## Corelib.Init.Specif.error

NativeBridge.Incremental.SpecifOperations.error_agrees

目标：Option.none；范围：A : Sort u; Option (PLift A) adapter

```lean
∀ (A : Sort u), NativeBridge.Incremental.SpecifOperations.optionToLift (Rocq.Corelib.Init.Specif.error A) = none
```

公理闭包：空

## Corelib.Init.Specif.value

NativeBridge.Incremental.SpecifOperations.value_agrees

目标：Option.some；范围：A : Sort u; Option (PLift A) adapter

```lean
∀ (A : Sort u) (a : A),
  NativeBridge.Incremental.SpecifOperations.optionToLift (Rocq.Corelib.Init.Specif.value A a) = some { down := a }
```

公理闭包：空

## Corelib.Init.Specif.except

NativeBridge.Incremental.SpecifOperations.except_agrees

目标：False.elim；范围：A : Type as exported; input translated False converted to Lean False

```lean
∀ (A : Type) (h : Rocq.Corelib.Init.Logic.False), Rocq.Corelib.Init.Specif.except A h = ⋯.elim
```

公理闭包：空

## Corelib.Init.Specif.absurd_set

NativeBridge.Incremental.SpecifOperations.absurd_set_agrees

目标：False.elim；范围：A : Prop, C : Type as exported

```lean
∀ (A : Prop) (C : Type) (h : A) (hn : Rocq.Corelib.Init.Logic.not A),
  Rocq.Corelib.Init.Specif.absurd_set A C h hn = ⋯.elim
```

公理闭包：空

## Corelib.Init.Specif.sumbool_rec

NativeBridge.Incremental.SpecifOperations.sumbool_rec_agrees

目标：PSum.rec；范围：A,B : Prop; native dependent motive returning Type

```lean
∀ (A B : Prop) (P : A ⊕' B → Type) (f : (a : A) → P (PSum.inl a)) (g : (b : B) → P (PSum.inr b))
  (x : Rocq.Corelib.Init.Specif.sumbool A B),
  Rocq.Corelib.Init.Specif.sumbool_rec A B (fun x => P (NativeBridge.sumboolTo x)) f g x =
    PSum.rec f g (NativeBridge.sumboolTo x)
```

公理闭包：空

## Corelib.Init.Specif.sumbool_rect

NativeBridge.Incremental.SpecifOperations.sumbool_rect_agrees

目标：PSum.rec；范围：A,B : Prop; native dependent motive returning Sort u

```lean
∀ (A B : Prop) (P : A ⊕' B → Sort u) (f : (a : A) → P (PSum.inl a)) (g : (b : B) → P (PSum.inr b))
  (x : Rocq.Corelib.Init.Specif.sumbool A B),
  Rocq.Corelib.Init.Specif.sumbool_rect A B (fun x => P (NativeBridge.sumboolTo x)) f g x =
    PSum.rec f g (NativeBridge.sumboolTo x)
```

公理闭包：空

## Corelib.Init.Specif.sumor_rec

NativeBridge.Incremental.SpecifOperations.sumor_rec_agrees

目标：PSum.rec；范围：A : Sort u, B : Prop; native dependent motive returning Type

```lean
∀ (A : Sort u) (B : Prop) (P : A ⊕' B → Type) (f : (a : A) → P (PSum.inl a)) (g : (b : B) → P (PSum.inr b))
  (x : Rocq.Corelib.Init.Specif.sumor A B),
  Rocq.Corelib.Init.Specif.sumor_rec A B (fun x => P (NativeBridge.Incremental.sumorSortTo x)) f g x =
    PSum.rec f g (NativeBridge.Incremental.sumorSortTo x)
```

公理闭包：空

## Corelib.Init.Specif.sumor_rect

NativeBridge.Incremental.SpecifOperations.sumor_rect_agrees

目标：PSum.rec；范围：A : Sort u, B : Prop; native dependent motive returning Sort v

```lean
∀ (A : Sort u) (B : Prop) (P : A ⊕' B → Sort v) (f : (a : A) → P (PSum.inl a)) (g : (b : B) → P (PSum.inr b))
  (x : Rocq.Corelib.Init.Specif.sumor A B),
  Rocq.Corelib.Init.Specif.sumor_rect A B (fun x => P (NativeBridge.Incremental.sumorSortTo x)) f g x =
    PSum.rec f g (NativeBridge.Incremental.sumorSortTo x)
```

公理闭包：空

## Corelib.Init.Specif.bool_choice

NativeBridge.Incremental.SpecifChoice.bool_choice_agrees

目标：nativeBoolChoice: Bool-valued choice with native disjunctive certificate；范围：S : Type, P,Q : S → Prop; supplied pointwise PSum evidence; no choice axiom

```lean
∀ (S : Type) (P Q : S → Prop) (H : (x : S) → Rocq.Corelib.Init.Specif.sumbool (P x) (Q x)),
  NativeBridge.Incremental.SpecifChoice.boolChoiceTo (RocqPending.Corelib.Init.Specif.bool_choice S P Q H) =
    NativeBridge.Incremental.SpecifChoice.nativeBoolChoice fun x => NativeBridge.sumboolTo (H x)
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.dependent_choice

NativeBridge.Incremental.SpecifChoice.dependent_choice_agrees

目标：nativeDependentChoice: Nat.rec iteration with adjacent-step certificates；范围：X : Sort u; R : X → X → Prop; supplied successor-selection function

```lean
∀ (X : Sort u) (R : X → X → Prop) (H : (x : X) → Rocq.Corelib.Init.Specif.sig X (R x)) (x0 : X),
  NativeBridge.Incremental.SpecifChoice.dependentChoiceTo (RocqPending.Corelib.Init.Specif.dependent_choice X R H x0) =
    NativeBridge.Incremental.SpecifChoice.nativeDependentChoice (fun x => NativeBridge.Incremental.subtypeTo (H x)) x0
```

公理闭包：Quot.sound

## Corelib.Init.Specif.eq_sig_rect

NativeBridge.Incremental.SpecifEqualityElimination.eq_sig_rect_agrees

目标：selected native branch value in a native equality-indexed motive；范围：full exported Sort parameters; source equality converted via sig type isomorphism; proof-indexed branch represented by its value, justified by proof_branch1/2/3; Sort result

```lean
∀ (A : Sort u) (P : A → Prop) (a b : Rocq.Corelib.Init.Specif.sig A P)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Specif.sig A P) a b)
  (F : NativeBridge.Incremental.subtypeTo a = NativeBridge.Incremental.subtypeTo b → Sort z) (f : F ⋯),
  RocqPending.Corelib.Init.Specif.eq_sig_rect A P a b (fun e => F ⋯) (fun x x_1 => f) e = f
```

公理闭包：空

## Corelib.Init.Specif.eq_sig_rec

NativeBridge.Incremental.SpecifEqualityElimination.eq_sig_rec_agrees

目标：selected native branch value in a native equality-indexed motive；范围：full exported Sort parameters; source equality converted via sig type isomorphism; proof-indexed branch represented by its value, justified by proof_branch1/2/3; Type result

```lean
∀ (A : Sort u) (P : A → Prop) (a b : Rocq.Corelib.Init.Specif.sig A P)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Specif.sig A P) a b)
  (F : NativeBridge.Incremental.subtypeTo a = NativeBridge.Incremental.subtypeTo b → Type) (f : F ⋯),
  RocqPending.Corelib.Init.Specif.eq_sig_rec A P a b (fun e => F ⋯) (fun x x_1 => f) e = f
```

公理闭包：空

## Corelib.Init.Specif.eq_sig_rect_uncurried

NativeBridge.Incremental.SpecifEqualityElimination.eq_sig_rect_uncurried_agrees

目标：selected native branch value in a native equality-indexed motive；范围：full exported Sort parameters; source equality converted via sig type isomorphism; proof-indexed branch represented by its value, justified by proof_branch1/2/3; Sort result

```lean
∀ (A : Sort u) (P : A → Prop) (a b : Rocq.Corelib.Init.Specif.sig A P)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Specif.sig A P) a b)
  (F : NativeBridge.Incremental.subtypeTo a = NativeBridge.Incremental.subtypeTo b → Sort z) (f : F ⋯),
  RocqPending.Corelib.Init.Specif.eq_sig_rect_uncurried A P a b (fun e => F ⋯) (fun x => f) e = f
```

公理闭包：空

## Corelib.Init.Specif.eq_sig_rec_uncurried

NativeBridge.Incremental.SpecifEqualityElimination.eq_sig_rec_uncurried_agrees

目标：selected native branch value in a native equality-indexed motive；范围：full exported Sort parameters; source equality converted via sig type isomorphism; proof-indexed branch represented by its value, justified by proof_branch1/2/3; Type result

```lean
∀ (A : Sort u) (P : A → Prop) (a b : Rocq.Corelib.Init.Specif.sig A P)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Specif.sig A P) a b)
  (F : NativeBridge.Incremental.subtypeTo a = NativeBridge.Incremental.subtypeTo b → Type) (f : F ⋯),
  RocqPending.Corelib.Init.Specif.eq_sig_rec_uncurried A P a b (fun e => F ⋯) (fun x => f) e = f
```

公理闭包：空

## Corelib.Init.Specif.eq_sig_rect_exist

NativeBridge.Incremental.SpecifEqualityElimination.eq_sig_rect_exist_agrees

目标：selected native branch value in a native equality-indexed motive；范围：full exported Sort parameters; source equality converted via sig type isomorphism; proof-indexed branch represented by its value, justified by proof_branch1/2/3; Sort result

```lean
∀ (A : Sort u) (P : A → Prop) (a1 : A) (a2 : P a1) (b1 : A) (b2 : P b1)
  (e :
    NativeBridge.ME (Rocq.Corelib.Init.Specif.sig A P) (Rocq.Corelib.Init.Specif.sig.exist A P a1 a2)
      (Rocq.Corelib.Init.Specif.sig.exist A P b1 b2))
  (F :
    NativeBridge.Incremental.subtypeTo (Rocq.Corelib.Init.Specif.sig.exist A P a1 a2) =
        NativeBridge.Incremental.subtypeTo (Rocq.Corelib.Init.Specif.sig.exist A P b1 b2) →
      Sort z)
  (f : F ⋯), RocqPending.Corelib.Init.Specif.eq_sig_rect_exist A P a1 a2 b1 b2 (fun e => F ⋯) (fun x x_1 => f) e = f
```

公理闭包：空

## Corelib.Init.Specif.eq_sig_rect_exist_l

NativeBridge.Incremental.SpecifEqualityElimination.eq_sig_rect_exist_l_agrees

目标：selected native branch value in a native equality-indexed motive；范围：full exported Sort parameters; source equality converted via sig type isomorphism; proof-indexed branch represented by its value, justified by proof_branch1/2/3; Sort result

```lean
∀ (A : Sort u) (P : A → Prop) (a1 : A) (a2 : P a1) (b : Rocq.Corelib.Init.Specif.sig A P)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Specif.sig A P) (Rocq.Corelib.Init.Specif.sig.exist A P a1 a2) b)
  (F :
    NativeBridge.Incremental.subtypeTo (Rocq.Corelib.Init.Specif.sig.exist A P a1 a2) =
        NativeBridge.Incremental.subtypeTo b →
      Sort z)
  (f : F ⋯), RocqPending.Corelib.Init.Specif.eq_sig_rect_exist_l A P a1 a2 b (fun e => F ⋯) (fun x x_1 => f) e = f
```

公理闭包：空

## Corelib.Init.Specif.eq_sig_rect_exist_r

NativeBridge.Incremental.SpecifEqualityElimination.eq_sig_rect_exist_r_agrees

目标：selected native branch value in a native equality-indexed motive；范围：full exported Sort parameters; source equality converted via sig type isomorphism; proof-indexed branch represented by its value, justified by proof_branch1/2/3; Sort result

```lean
∀ (A : Sort u) (P : A → Prop) (a : Rocq.Corelib.Init.Specif.sig A P) (b1 : A) (b2 : P b1)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Specif.sig A P) a (Rocq.Corelib.Init.Specif.sig.exist A P b1 b2))
  (F :
    NativeBridge.Incremental.subtypeTo a =
        NativeBridge.Incremental.subtypeTo (Rocq.Corelib.Init.Specif.sig.exist A P b1 b2) →
      Sort z)
  (f : F ⋯), RocqPending.Corelib.Init.Specif.eq_sig_rect_exist_r A P a b1 b2 (fun e => F ⋯) (fun x x_1 => f) e = f
```

公理闭包：空

## Corelib.Init.Specif.eq_sig2_rect

NativeBridge.Incremental.SpecifEqualityElimination.eq_sig2_rect_agrees

目标：selected native branch value in a native equality-indexed motive；范围：full exported Sort parameters; source equality converted via sig2 type isomorphism; proof-indexed branch represented by its value, justified by proof_branch1/2/3; Sort result

```lean
∀ (A : Sort u) (P Q : A → Prop) (a b : Rocq.Corelib.Init.Specif.sig2 A P Q)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Specif.sig2 A P Q) a b)
  (F : NativeBridge.Incremental.subtype2To a = NativeBridge.Incremental.subtype2To b → Sort z) (f : F ⋯),
  RocqPending.Corelib.Init.Specif.eq_sig2_rect A P Q a b (fun e => F ⋯) (fun x x_1 x_2 => f) e = f
```

公理闭包：空

## Corelib.Init.Specif.eq_sig2_rec

NativeBridge.Incremental.SpecifEqualityElimination.eq_sig2_rec_agrees

目标：selected native branch value in a native equality-indexed motive；范围：full exported Sort parameters; source equality converted via sig2 type isomorphism; proof-indexed branch represented by its value, justified by proof_branch1/2/3; Type result

```lean
∀ (A : Sort u) (P Q : A → Prop) (a b : Rocq.Corelib.Init.Specif.sig2 A P Q)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Specif.sig2 A P Q) a b)
  (F : NativeBridge.Incremental.subtype2To a = NativeBridge.Incremental.subtype2To b → Type) (f : F ⋯),
  RocqPending.Corelib.Init.Specif.eq_sig2_rec A P Q a b (fun e => F ⋯) (fun x x_1 x_2 => f) e = f
```

公理闭包：空

## Corelib.Init.Specif.eq_sig2_rect_uncurried

NativeBridge.Incremental.SpecifEqualityElimination.eq_sig2_rect_uncurried_agrees

目标：selected native branch value in a native equality-indexed motive；范围：full exported Sort parameters; source equality converted via sig2 type isomorphism; proof-indexed branch represented by its value, justified by proof_branch1/2/3; Sort result

```lean
∀ (A : Sort u) (P Q : A → Prop) (a b : Rocq.Corelib.Init.Specif.sig2 A P Q)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Specif.sig2 A P Q) a b)
  (F : NativeBridge.Incremental.subtype2To a = NativeBridge.Incremental.subtype2To b → Sort z) (f : F ⋯),
  RocqPending.Corelib.Init.Specif.eq_sig2_rect_uncurried A P Q a b (fun e => F ⋯) (fun x => f) e = f
```

公理闭包：空

## Corelib.Init.Specif.eq_sig2_rec_uncurried

NativeBridge.Incremental.SpecifEqualityElimination.eq_sig2_rec_uncurried_agrees

目标：selected native branch value in a native equality-indexed motive；范围：full exported Sort parameters; source equality converted via sig2 type isomorphism; proof-indexed branch represented by its value, justified by proof_branch1/2/3; Type result

```lean
∀ (A : Sort u) (P Q : A → Prop) (a b : Rocq.Corelib.Init.Specif.sig2 A P Q)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Specif.sig2 A P Q) a b)
  (F : NativeBridge.Incremental.subtype2To a = NativeBridge.Incremental.subtype2To b → Type) (f : F ⋯),
  RocqPending.Corelib.Init.Specif.eq_sig2_rec_uncurried A P Q a b (fun e => F ⋯) (fun x => f) e = f
```

公理闭包：空

## Corelib.Init.Specif.eq_sig2_rect_exist2

NativeBridge.Incremental.SpecifEqualityElimination.eq_sig2_rect_exist2_agrees

目标：selected native branch value in a native equality-indexed motive；范围：full exported Sort parameters; source equality converted via sig2 type isomorphism; proof-indexed branch represented by its value, justified by proof_branch1/2/3; Sort result

```lean
∀ (A : Sort u) (P Q : A → Prop) (a1 : A) (a2 : P a1) (a3 : Q a1) (b1 : A) (b2 : P b1) (b3 : Q b1)
  (e :
    NativeBridge.ME (Rocq.Corelib.Init.Specif.sig2 A P Q) (Rocq.Corelib.Init.Specif.sig2.exist2 A P Q a1 a2 a3)
      (Rocq.Corelib.Init.Specif.sig2.exist2 A P Q b1 b2 b3))
  (F :
    NativeBridge.Incremental.subtype2To (Rocq.Corelib.Init.Specif.sig2.exist2 A P Q a1 a2 a3) =
        NativeBridge.Incremental.subtype2To (Rocq.Corelib.Init.Specif.sig2.exist2 A P Q b1 b2 b3) →
      Sort z)
  (f : F ⋯),
  RocqPending.Corelib.Init.Specif.eq_sig2_rect_exist2 A P Q a1 a2 a3 b1 b2 b3 (fun e => F ⋯) (fun x x_1 x_2 => f) e = f
```

公理闭包：空

## Corelib.Init.Specif.eq_sig2_rect_exist2_l

NativeBridge.Incremental.SpecifEqualityElimination.eq_sig2_rect_exist2_l_agrees

目标：selected native branch value in a native equality-indexed motive；范围：full exported Sort parameters; source equality converted via sig2 type isomorphism; proof-indexed branch represented by its value, justified by proof_branch1/2/3; Sort result

```lean
∀ (A : Sort u) (P Q : A → Prop) (a1 : A) (a2 : P a1) (a3 : Q a1) (b : Rocq.Corelib.Init.Specif.sig2 A P Q)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Specif.sig2 A P Q) (Rocq.Corelib.Init.Specif.sig2.exist2 A P Q a1 a2 a3) b)
  (F :
    NativeBridge.Incremental.subtype2To (Rocq.Corelib.Init.Specif.sig2.exist2 A P Q a1 a2 a3) =
        NativeBridge.Incremental.subtype2To b →
      Sort z)
  (f : F ⋯),
  RocqPending.Corelib.Init.Specif.eq_sig2_rect_exist2_l A P Q a1 a2 a3 b (fun e => F ⋯) (fun x x_1 x_2 => f) e = f
```

公理闭包：空

## Corelib.Init.Specif.eq_sig2_rect_exist2_r

NativeBridge.Incremental.SpecifEqualityElimination.eq_sig2_rect_exist2_r_agrees

目标：selected native branch value in a native equality-indexed motive；范围：full exported Sort parameters; source equality converted via sig2 type isomorphism; proof-indexed branch represented by its value, justified by proof_branch1/2/3; Sort result

```lean
∀ (A : Sort u) (P Q : A → Prop) (a : Rocq.Corelib.Init.Specif.sig2 A P Q) (b1 : A) (b2 : P b1) (b3 : Q b1)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Specif.sig2 A P Q) a (Rocq.Corelib.Init.Specif.sig2.exist2 A P Q b1 b2 b3))
  (F :
    NativeBridge.Incremental.subtype2To a =
        NativeBridge.Incremental.subtype2To (Rocq.Corelib.Init.Specif.sig2.exist2 A P Q b1 b2 b3) →
      Sort z)
  (f : F ⋯),
  RocqPending.Corelib.Init.Specif.eq_sig2_rect_exist2_r A P Q a b1 b2 b3 (fun e => F ⋯) (fun x x_1 x_2 => f) e = f
```

公理闭包：空

## Corelib.Init.Specif.eq_sigT_rect

NativeBridge.Incremental.SpecifEqualityElimination.eq_sigT_rect_agrees

目标：selected native branch value in a native equality-indexed motive；范围：full exported Sort parameters; source equality converted via sigT type isomorphism; proof-indexed branch represented by its value, justified by proof_branch1/2/3; Sort result

```lean
∀ (A : Sort u) (P : A → Sort v) (a b : Rocq.Corelib.Init.Specif.sigT A P)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Specif.sigT A P) a b)
  (F : NativeBridge.Incremental.psigmaTo a = NativeBridge.Incremental.psigmaTo b → Sort z) (f : F ⋯),
  RocqPending.Corelib.Init.Specif.eq_sigT_rect A P a b (fun e => F ⋯) (fun x x_1 => f) e = f
```

公理闭包：空

## Corelib.Init.Specif.eq_sigT_rec

NativeBridge.Incremental.SpecifEqualityElimination.eq_sigT_rec_agrees

目标：selected native branch value in a native equality-indexed motive；范围：full exported Sort parameters; source equality converted via sigT type isomorphism; proof-indexed branch represented by its value, justified by proof_branch1/2/3; Type result

```lean
∀ (A : Sort u) (P : A → Sort v) (a b : Rocq.Corelib.Init.Specif.sigT A P)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Specif.sigT A P) a b)
  (F : NativeBridge.Incremental.psigmaTo a = NativeBridge.Incremental.psigmaTo b → Type) (f : F ⋯),
  RocqPending.Corelib.Init.Specif.eq_sigT_rec A P a b (fun e => F ⋯) (fun x x_1 => f) e = f
```

公理闭包：空

## Corelib.Init.Specif.eq_sigT_rect_uncurried

NativeBridge.Incremental.SpecifEqualityElimination.eq_sigT_rect_uncurried_agrees

目标：selected native branch value in a native equality-indexed motive；范围：full exported Sort parameters; source equality converted via sigT type isomorphism; proof-indexed branch represented by its value, justified by proof_branch1/2/3; Sort result

```lean
∀ (A : Sort u) (P : A → Sort v) (a b : Rocq.Corelib.Init.Specif.sigT A P)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Specif.sigT A P) a b)
  (F : NativeBridge.Incremental.psigmaTo a = NativeBridge.Incremental.psigmaTo b → Sort z) (f : F ⋯),
  RocqPending.Corelib.Init.Specif.eq_sigT_rect_uncurried A P a b (fun e => F ⋯) (fun x => f) e = f
```

公理闭包：空

## Corelib.Init.Specif.eq_sigT_rec_uncurried

NativeBridge.Incremental.SpecifEqualityElimination.eq_sigT_rec_uncurried_agrees

目标：selected native branch value in a native equality-indexed motive；范围：full exported Sort parameters; source equality converted via sigT type isomorphism; proof-indexed branch represented by its value, justified by proof_branch1/2/3; Type result

```lean
∀ (A : Sort u) (P : A → Sort v) (a b : Rocq.Corelib.Init.Specif.sigT A P)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Specif.sigT A P) a b)
  (F : NativeBridge.Incremental.psigmaTo a = NativeBridge.Incremental.psigmaTo b → Type) (f : F ⋯),
  RocqPending.Corelib.Init.Specif.eq_sigT_rec_uncurried A P a b (fun e => F ⋯) (fun x => f) e = f
```

公理闭包：空

## Corelib.Init.Specif.eq_sigT_rect_existT

NativeBridge.Incremental.SpecifEqualityElimination.eq_sigT_rect_existT_agrees

目标：selected native branch value in a native equality-indexed motive；范围：full exported Sort parameters; source equality converted via sigT type isomorphism; proof-indexed branch represented by its value, justified by proof_branch1/2/3; Sort result

```lean
∀ (A : Sort u) (P : A → Sort v) (a1 : A) (a2 : P a1) (b1 : A) (b2 : P b1)
  (e :
    NativeBridge.ME (Rocq.Corelib.Init.Specif.sigT A P) (Rocq.Corelib.Init.Specif.sigT.existT A P a1 a2)
      (Rocq.Corelib.Init.Specif.sigT.existT A P b1 b2))
  (F :
    NativeBridge.Incremental.psigmaTo (Rocq.Corelib.Init.Specif.sigT.existT A P a1 a2) =
        NativeBridge.Incremental.psigmaTo (Rocq.Corelib.Init.Specif.sigT.existT A P b1 b2) →
      Sort z)
  (f : F ⋯), RocqPending.Corelib.Init.Specif.eq_sigT_rect_existT A P a1 a2 b1 b2 (fun e => F ⋯) (fun x x_1 => f) e = f
```

公理闭包：空

## Corelib.Init.Specif.eq_sigT_rect_existT_l

NativeBridge.Incremental.SpecifEqualityElimination.eq_sigT_rect_existT_l_agrees

目标：selected native branch value in a native equality-indexed motive；范围：full exported Sort parameters; source equality converted via sigT type isomorphism; proof-indexed branch represented by its value, justified by proof_branch1/2/3; Sort result

```lean
∀ (A : Sort u) (P : A → Sort v) (a1 : A) (a2 : P a1) (b : Rocq.Corelib.Init.Specif.sigT A P)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Specif.sigT A P) (Rocq.Corelib.Init.Specif.sigT.existT A P a1 a2) b)
  (F :
    NativeBridge.Incremental.psigmaTo (Rocq.Corelib.Init.Specif.sigT.existT A P a1 a2) =
        NativeBridge.Incremental.psigmaTo b →
      Sort z)
  (f : F ⋯), RocqPending.Corelib.Init.Specif.eq_sigT_rect_existT_l A P a1 a2 b (fun e => F ⋯) (fun x x_1 => f) e = f
```

公理闭包：空

## Corelib.Init.Specif.eq_sigT_rect_existT_r

NativeBridge.Incremental.SpecifEqualityElimination.eq_sigT_rect_existT_r_agrees

目标：selected native branch value in a native equality-indexed motive；范围：full exported Sort parameters; source equality converted via sigT type isomorphism; proof-indexed branch represented by its value, justified by proof_branch1/2/3; Sort result

```lean
∀ (A : Sort u) (P : A → Sort v) (a : Rocq.Corelib.Init.Specif.sigT A P) (b1 : A) (b2 : P b1)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Specif.sigT A P) a (Rocq.Corelib.Init.Specif.sigT.existT A P b1 b2))
  (F :
    NativeBridge.Incremental.psigmaTo a =
        NativeBridge.Incremental.psigmaTo (Rocq.Corelib.Init.Specif.sigT.existT A P b1 b2) →
      Sort z)
  (f : F ⋯), RocqPending.Corelib.Init.Specif.eq_sigT_rect_existT_r A P a b1 b2 (fun e => F ⋯) (fun x x_1 => f) e = f
```

公理闭包：空

## Corelib.Init.Specif.eq_sigT2_rect

NativeBridge.Incremental.SpecifEqualityElimination.eq_sigT2_rect_agrees

目标：selected native branch value in a native equality-indexed motive；范围：full exported Sort parameters; source equality converted via sigT2 type isomorphism; proof-indexed branch represented by its value, justified by proof_branch1/2/3; Sort result

```lean
∀ (A : Sort u) (P : A → Sort v) (Q : A → Sort w) (a b : Rocq.Corelib.Init.Specif.sigT2 A P Q)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Specif.sigT2 A P Q) a b)
  (F : NativeBridge.Incremental.psigma2To a = NativeBridge.Incremental.psigma2To b → Sort z) (f : F ⋯),
  RocqPending.Corelib.Init.Specif.eq_sigT2_rect A P Q a b (fun e => F ⋯) (fun x x_1 x_2 => f) e = f
```

公理闭包：空

## Corelib.Init.Specif.eq_sigT2_rec

NativeBridge.Incremental.SpecifEqualityElimination.eq_sigT2_rec_agrees

目标：selected native branch value in a native equality-indexed motive；范围：full exported Sort parameters; source equality converted via sigT2 type isomorphism; proof-indexed branch represented by its value, justified by proof_branch1/2/3; Type result

```lean
∀ (A : Sort u) (P : A → Sort v) (Q : A → Sort w) (a b : Rocq.Corelib.Init.Specif.sigT2 A P Q)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Specif.sigT2 A P Q) a b)
  (F : NativeBridge.Incremental.psigma2To a = NativeBridge.Incremental.psigma2To b → Type) (f : F ⋯),
  RocqPending.Corelib.Init.Specif.eq_sigT2_rec A P Q a b (fun e => F ⋯) (fun x x_1 x_2 => f) e = f
```

公理闭包：空

## Corelib.Init.Specif.eq_sigT2_rect_uncurried

NativeBridge.Incremental.SpecifEqualityElimination.eq_sigT2_rect_uncurried_agrees

目标：selected native branch value in a native equality-indexed motive；范围：full exported Sort parameters; source equality converted via sigT2 type isomorphism; proof-indexed branch represented by its value, justified by proof_branch1/2/3; Sort result

```lean
∀ (A : Sort u) (P : A → Sort v) (Q : A → Sort w) (a b : Rocq.Corelib.Init.Specif.sigT2 A P Q)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Specif.sigT2 A P Q) a b)
  (F : NativeBridge.Incremental.psigma2To a = NativeBridge.Incremental.psigma2To b → Sort z) (f : F ⋯),
  RocqPending.Corelib.Init.Specif.eq_sigT2_rect_uncurried A P Q a b (fun e => F ⋯) (fun x => f) e = f
```

公理闭包：空

## Corelib.Init.Specif.eq_sigT2_rec_uncurried

NativeBridge.Incremental.SpecifEqualityElimination.eq_sigT2_rec_uncurried_agrees

目标：selected native branch value in a native equality-indexed motive；范围：full exported Sort parameters; source equality converted via sigT2 type isomorphism; proof-indexed branch represented by its value, justified by proof_branch1/2/3; Type result

```lean
∀ (A : Sort u) (P : A → Sort v) (Q : A → Sort w) (a b : Rocq.Corelib.Init.Specif.sigT2 A P Q)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Specif.sigT2 A P Q) a b)
  (F : NativeBridge.Incremental.psigma2To a = NativeBridge.Incremental.psigma2To b → Type) (f : F ⋯),
  RocqPending.Corelib.Init.Specif.eq_sigT2_rec_uncurried A P Q a b (fun e => F ⋯) (fun x => f) e = f
```

公理闭包：空

## Corelib.Init.Specif.eq_sigT2_rect_existT2

NativeBridge.Incremental.SpecifEqualityElimination.eq_sigT2_rect_existT2_agrees

目标：selected native branch value in a native equality-indexed motive；范围：full exported Sort parameters; source equality converted via sigT2 type isomorphism; proof-indexed branch represented by its value, justified by proof_branch1/2/3; Sort result

```lean
∀ (A : Sort u) (P : A → Sort v) (Q : A → Sort w) (a1 : A) (a2 : P a1) (a3 : Q a1) (b1 : A) (b2 : P b1) (b3 : Q b1)
  (e :
    NativeBridge.ME (Rocq.Corelib.Init.Specif.sigT2 A P Q) (Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q a1 a2 a3)
      (Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q b1 b2 b3))
  (F :
    NativeBridge.Incremental.psigma2To (Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q a1 a2 a3) =
        NativeBridge.Incremental.psigma2To (Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q b1 b2 b3) →
      Sort z)
  (f : F ⋯),
  RocqPending.Corelib.Init.Specif.eq_sigT2_rect_existT2 A P Q a1 a2 a3 b1 b2 b3 (fun e => F ⋯) (fun x x_1 x_2 => f) e =
    f
```

公理闭包：空

## Corelib.Init.Specif.eq_sigT2_rect_existT2_l

NativeBridge.Incremental.SpecifEqualityElimination.eq_sigT2_rect_existT2_l_agrees

目标：selected native branch value in a native equality-indexed motive；范围：full exported Sort parameters; source equality converted via sigT2 type isomorphism; proof-indexed branch represented by its value, justified by proof_branch1/2/3; Sort result

```lean
∀ (A : Sort u) (P : A → Sort v) (Q : A → Sort w) (a1 : A) (a2 : P a1) (a3 : Q a1)
  (b : Rocq.Corelib.Init.Specif.sigT2 A P Q)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Specif.sigT2 A P Q) (Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q a1 a2 a3) b)
  (F :
    NativeBridge.Incremental.psigma2To (Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q a1 a2 a3) =
        NativeBridge.Incremental.psigma2To b →
      Sort z)
  (f : F ⋯),
  RocqPending.Corelib.Init.Specif.eq_sigT2_rect_existT2_l A P Q a1 a2 a3 b (fun e => F ⋯) (fun x x_1 x_2 => f) e = f
```

公理闭包：空

## Corelib.Init.Specif.eq_sigT2_rect_existT2_r

NativeBridge.Incremental.SpecifEqualityElimination.eq_sigT2_rect_existT2_r_agrees

目标：selected native branch value in a native equality-indexed motive；范围：full exported Sort parameters; source equality converted via sigT2 type isomorphism; proof-indexed branch represented by its value, justified by proof_branch1/2/3; Sort result

```lean
∀ (A : Sort u) (P : A → Sort v) (Q : A → Sort w) (a : Rocq.Corelib.Init.Specif.sigT2 A P Q) (b1 : A) (b2 : P b1)
  (b3 : Q b1)
  (e : NativeBridge.ME (Rocq.Corelib.Init.Specif.sigT2 A P Q) a (Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q b1 b2 b3))
  (F :
    NativeBridge.Incremental.psigma2To a =
        NativeBridge.Incremental.psigma2To (Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q b1 b2 b3) →
      Sort z)
  (f : F ⋯),
  RocqPending.Corelib.Init.Specif.eq_sigT2_rect_existT2_r A P Q a b1 b2 b3 (fun e => F ⋯) (fun x x_1 x_2 => f) e = f
```

公理闭包：空

## Corelib.ssr.ssrfun.all_equal_to

NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.all_equal_to.correspondence

目标：fun T x0 => ∀ (x : T), x = x0；范围：all exported Sort parameters; pointwise predicate iff; native definition body and binder types contain no source symbols

```lean
∀ (T : Sort u_Corelib_ssr_ssrfun_67) (x0 : T),
  Rocq.Corelib.ssr.ssrfun.all_equal_to T x0 ↔
    NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.all_equal_to.native T x0
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.homomorphism_1

NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.homomorphism_1.correspondence

目标：fun aT rT f aP rP => ∀ (x : aT), aP x → rP (f x)；范围：all exported Sort parameters; pointwise predicate iff; native definition body and binder types contain no source symbols

```lean
∀ (aT : Sort u_Corelib_ssr_ssrfun_348) (rT : Sort u_Corelib_ssr_ssrfun_349) (f : aT → rT) (aP : aT → Prop)
  (rP : rT → Prop),
  Rocq.Corelib.ssr.ssrfun.homomorphism_1 aT rT f aP rP ↔
    NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.homomorphism_1.native aT rT f aP rP
```

公理闭包：空

## Corelib.ssr.ssrfun.homomorphism_2

NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.homomorphism_2.correspondence

目标：fun aT rT f aR rR => ∀ (x y : aT), aR x y → rR (f x) (f y)；范围：all exported Sort parameters; pointwise predicate iff; native definition body and binder types contain no source symbols

```lean
∀ (aT : Sort u_Corelib_ssr_ssrfun_348) (rT : Sort u_Corelib_ssr_ssrfun_349) (f : aT → rT) (aR : aT → aT → Prop)
  (rR : rT → rT → Prop),
  Rocq.Corelib.ssr.ssrfun.homomorphism_2 aT rT f aR rR ↔
    NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.homomorphism_2.native aT rT f aR rR
```

公理闭包：空

## Corelib.ssr.ssrfun.idempotent_fun

NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.idempotent_fun.correspondence

目标：fun U f => f ∘ f = f；范围：all exported Sort parameters; pointwise predicate iff; native definition body and binder types contain no source symbols

```lean
∀ (U : Sort u_Corelib_ssr_ssrfun_683) (f : U → U),
  Rocq.Corelib.ssr.ssrfun.idempotent_fun U f ↔
    NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.idempotent_fun.native U f
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.idempotent_op

NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.idempotent_op.correspondence

目标：fun S op => ∀ (x : S), op x x = x；范围：all exported Sort parameters; pointwise predicate iff; native definition body and binder types contain no source symbols

```lean
∀ (S : Sort u_Corelib_ssr_ssrfun_588) (op : S → S → S),
  Rocq.Corelib.ssr.ssrfun.idempotent_op S op ↔
    NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.idempotent_op.native S op
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.injective2

NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.injective2.correspondence

目标：fun rT aT1 aT2 f => ∀ (x1 x2 : aT1) (y1 y2 : aT2), f x1 y1 = f x2 y2 → x1 = x2 ∧ y1 = y2；范围：all exported Sort parameters; pointwise predicate iff; native definition body and binder types contain no source symbols

```lean
∀ (rT : Sort u_Corelib_ssr_ssrfun_454) (aT1 : Sort u_Corelib_ssr_ssrfun_455) (aT2 : Sort u_Corelib_ssr_ssrfun_456)
  (f : aT1 → aT2 → rT),
  Rocq.Corelib.ssr.ssrfun.injective2 rT aT1 aT2 f ↔
    NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.injective2.native rT aT1 aT2 f
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.interchange

NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.interchange.correspondence

目标：fun S op1 op2 => ∀ (x y z t : S), op1 (op2 x y) (op2 z t) = op2 (op1 x z) (op1 y t)；范围：all exported Sort parameters; pointwise predicate iff; native definition body and binder types contain no source symbols

```lean
∀ (S : Sort u_Corelib_ssr_ssrfun_588) (op1 op2 : S → S → S),
  Rocq.Corelib.ssr.ssrfun.interchange S op1 op2 ↔
    NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.interchange.native S op1 op2
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.left_commutative

NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.left_commutative.correspondence

目标：fun S T op => ∀ (x y : S) (z : T), op x (op y z) = op y (op x z)；范围：all exported Sort parameters; pointwise predicate iff; native definition body and binder types contain no source symbols

```lean
∀ (S : Sort u_Corelib_ssr_ssrfun_588) (T : Sort u_Corelib_ssr_ssrfun_589) (op : S → T → T),
  Rocq.Corelib.ssr.ssrfun.left_commutative S T op ↔
    NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.left_commutative.native S T op
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.left_distributive

NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.left_distributive.correspondence

目标：fun S T op add => ∀ (x y : S) (z : T), op (add x y) z = add (op x z) (op y z)；范围：all exported Sort parameters; pointwise predicate iff; native definition body and binder types contain no source symbols

```lean
∀ (S : Sort u_Corelib_ssr_ssrfun_588) (T : Sort u_Corelib_ssr_ssrfun_589) (op : S → T → S) (add : S → S → S),
  Rocq.Corelib.ssr.ssrfun.left_distributive S T op add ↔
    NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.left_distributive.native S T op add
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.left_injective

NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.left_injective.correspondence

目标：fun S T R op => ∀ (x : T) (x_1 y : S), op x_1 x = op y x → x_1 = y；范围：all exported Sort parameters; pointwise predicate iff; native definition body and binder types contain no source symbols

```lean
∀ (S : Sort u_Corelib_ssr_ssrfun_588) (T : Sort u_Corelib_ssr_ssrfun_589) (R : Sort u_Corelib_ssr_ssrfun_590)
  (op : S → T → R),
  Rocq.Corelib.ssr.ssrfun.left_injective S T R op ↔
    NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.left_injective.native S T R op
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.left_inverse

NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.left_inverse.correspondence

目标：fun S T R e inv op => ∀ (x : T), op (inv x) x = e；范围：all exported Sort parameters; pointwise predicate iff; native definition body and binder types contain no source symbols

```lean
∀ (S : Sort u_Corelib_ssr_ssrfun_588) (T : Sort u_Corelib_ssr_ssrfun_589) (R : Sort u_Corelib_ssr_ssrfun_590) (e : R)
  (inv : T → S) (op : S → T → R),
  Rocq.Corelib.ssr.ssrfun.left_inverse S T R e inv op ↔
    NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.left_inverse.native S T R e inv op
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.left_loop

NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.left_loop.correspondence

目标：fun S T inv op => ∀ (x : S) (x_1 : T), op (inv x) (op x x_1) = x_1；范围：all exported Sort parameters; pointwise predicate iff; native definition body and binder types contain no source symbols

```lean
∀ (S : Sort u_Corelib_ssr_ssrfun_588) (T : Sort u_Corelib_ssr_ssrfun_589) (inv : S → S) (op : S → T → T),
  Rocq.Corelib.ssr.ssrfun.left_loop S T inv op ↔
    NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.left_loop.native S T inv op
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.left_zero

NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.left_zero.correspondence

目标：fun S T z op => ∀ (x : T), op z x = z；范围：all exported Sort parameters; pointwise predicate iff; native definition body and binder types contain no source symbols

```lean
∀ (S : Sort u_Corelib_ssr_ssrfun_588) (T : Sort u_Corelib_ssr_ssrfun_589) (z : S) (op : S → T → S),
  Rocq.Corelib.ssr.ssrfun.left_zero S T z op ↔
    NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.left_zero.native S T z op
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.monomorphism_1

NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.monomorphism_1.correspondence

目标：fun aT rT sT f aP rP => ∀ (x : aT), rP (f x) = aP x；范围：all exported Sort parameters; pointwise predicate iff; native definition body and binder types contain no source symbols

```lean
∀ (aT : Sort u_Corelib_ssr_ssrfun_348) (rT : Sort u_Corelib_ssr_ssrfun_349) (sT : Sort u_Corelib_ssr_ssrfun_350)
  (f : aT → rT) (aP : aT → sT) (rP : rT → sT),
  Rocq.Corelib.ssr.ssrfun.monomorphism_1 aT rT sT f aP rP ↔
    NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.monomorphism_1.native aT rT sT f aP rP
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.monomorphism_2

NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.monomorphism_2.correspondence

目标：fun aT rT sT f aR rR => ∀ (x y : aT), rR (f x) (f y) = aR x y；范围：all exported Sort parameters; pointwise predicate iff; native definition body and binder types contain no source symbols

```lean
∀ (aT : Sort u_Corelib_ssr_ssrfun_348) (rT : Sort u_Corelib_ssr_ssrfun_349) (sT : Sort u_Corelib_ssr_ssrfun_350)
  (f : aT → rT) (aR : aT → aT → sT) (rR : rT → rT → sT),
  Rocq.Corelib.ssr.ssrfun.monomorphism_2 aT rT sT f aR rR ↔
    NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.monomorphism_2.native aT rT sT f aR rR
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.morphism_1

NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.morphism_1.correspondence

目标：fun aT rT f aF rF => ∀ (x : aT), f (aF x) = rF (f x)；范围：all exported Sort parameters; pointwise predicate iff; native definition body and binder types contain no source symbols

```lean
∀ (aT : Sort u_Corelib_ssr_ssrfun_348) (rT : Sort u_Corelib_ssr_ssrfun_349) (f : aT → rT) (aF : aT → aT) (rF : rT → rT),
  Rocq.Corelib.ssr.ssrfun.morphism_1 aT rT f aF rF ↔
    NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.morphism_1.native aT rT f aF rF
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.morphism_2

NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.morphism_2.correspondence

目标：fun aT rT f aOp rOp => ∀ (x y : aT), f (aOp x y) = rOp (f x) (f y)；范围：all exported Sort parameters; pointwise predicate iff; native definition body and binder types contain no source symbols

```lean
∀ (aT : Sort u_Corelib_ssr_ssrfun_348) (rT : Sort u_Corelib_ssr_ssrfun_349) (f : aT → rT) (aOp : aT → aT → aT)
  (rOp : rT → rT → rT),
  Rocq.Corelib.ssr.ssrfun.morphism_2 aT rT f aOp rOp ↔
    NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.morphism_2.native aT rT f aOp rOp
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.rev_left_loop

NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.rev_left_loop.correspondence

目标：fun S T inv op => ∀ (x : S) (x_1 : T), op x (op (inv x) x_1) = x_1；范围：all exported Sort parameters; pointwise predicate iff; native definition body and binder types contain no source symbols

```lean
∀ (S : Sort u_Corelib_ssr_ssrfun_588) (T : Sort u_Corelib_ssr_ssrfun_589) (inv : S → S) (op : S → T → T),
  Rocq.Corelib.ssr.ssrfun.rev_left_loop S T inv op ↔
    NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.rev_left_loop.native S T inv op
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.rev_right_loop

NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.rev_right_loop.correspondence

目标：fun S T inv op => ∀ (y : T) (x : S), op (op x (inv y)) y = x；范围：all exported Sort parameters; pointwise predicate iff; native definition body and binder types contain no source symbols

```lean
∀ (S : Sort u_Corelib_ssr_ssrfun_588) (T : Sort u_Corelib_ssr_ssrfun_589) (inv : T → T) (op : S → T → S),
  Rocq.Corelib.ssr.ssrfun.rev_right_loop S T inv op ↔
    NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.rev_right_loop.native S T inv op
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.right_commutative

NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.right_commutative.correspondence

目标：fun S T op => ∀ (x : S) (y z : T), op (op x y) z = op (op x z) y；范围：all exported Sort parameters; pointwise predicate iff; native definition body and binder types contain no source symbols

```lean
∀ (S : Sort u_Corelib_ssr_ssrfun_588) (T : Sort u_Corelib_ssr_ssrfun_589) (op : S → T → S),
  Rocq.Corelib.ssr.ssrfun.right_commutative S T op ↔
    NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.right_commutative.native S T op
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.right_distributive

NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.right_distributive.correspondence

目标：fun S T op add => ∀ (x : S) (y z : T), op x (add y z) = add (op x y) (op x z)；范围：all exported Sort parameters; pointwise predicate iff; native definition body and binder types contain no source symbols

```lean
∀ (S : Sort u_Corelib_ssr_ssrfun_588) (T : Sort u_Corelib_ssr_ssrfun_589) (op : S → T → T) (add : T → T → T),
  Rocq.Corelib.ssr.ssrfun.right_distributive S T op add ↔
    NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.right_distributive.native S T op add
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.right_id

NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.right_id.correspondence

目标：fun S T e op => ∀ (x : S), op x e = x；范围：all exported Sort parameters; pointwise predicate iff; native definition body and binder types contain no source symbols

```lean
∀ (S : Sort u_Corelib_ssr_ssrfun_588) (T : Sort u_Corelib_ssr_ssrfun_589) (e : T) (op : S → T → S),
  Rocq.Corelib.ssr.ssrfun.right_id S T e op ↔
    NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.right_id.native S T e op
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.right_injective

NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.right_injective.correspondence

目标：fun S T R op => ∀ (y : S) (x y_1 : T), op y x = op y y_1 → x = y_1；范围：all exported Sort parameters; pointwise predicate iff; native definition body and binder types contain no source symbols

```lean
∀ (S : Sort u_Corelib_ssr_ssrfun_588) (T : Sort u_Corelib_ssr_ssrfun_589) (R : Sort u_Corelib_ssr_ssrfun_590)
  (op : S → T → R),
  Rocq.Corelib.ssr.ssrfun.right_injective S T R op ↔
    NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.right_injective.native S T R op
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.right_inverse

NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.right_inverse.correspondence

目标：fun S T R e inv op => ∀ (x : S), op x (inv x) = e；范围：all exported Sort parameters; pointwise predicate iff; native definition body and binder types contain no source symbols

```lean
∀ (S : Sort u_Corelib_ssr_ssrfun_588) (T : Sort u_Corelib_ssr_ssrfun_589) (R : Sort u_Corelib_ssr_ssrfun_590) (e : R)
  (inv : S → T) (op : S → T → R),
  Rocq.Corelib.ssr.ssrfun.right_inverse S T R e inv op ↔
    NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.right_inverse.native S T R e inv op
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.right_loop

NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.right_loop.correspondence

目标：fun S T inv op => ∀ (y : T) (x : S), op (op x y) (inv y) = x；范围：all exported Sort parameters; pointwise predicate iff; native definition body and binder types contain no source symbols

```lean
∀ (S : Sort u_Corelib_ssr_ssrfun_588) (T : Sort u_Corelib_ssr_ssrfun_589) (inv : T → T) (op : S → T → S),
  Rocq.Corelib.ssr.ssrfun.right_loop S T inv op ↔
    NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.right_loop.native S T inv op
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.right_zero

NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.right_zero.correspondence

目标：fun S T z op => ∀ (x : S), op x z = z；范围：all exported Sort parameters; pointwise predicate iff; native definition body and binder types contain no source symbols

```lean
∀ (S : Sort u_Corelib_ssr_ssrfun_588) (T : Sort u_Corelib_ssr_ssrfun_589) (z : T) (op : S → T → T),
  Rocq.Corelib.ssr.ssrfun.right_zero S T z op ↔
    NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.right_zero.native S T z op
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.self_inverse

NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.self_inverse.correspondence

目标：fun S T e op => ∀ (x : S), op x x = e；范围：all exported Sort parameters; pointwise predicate iff; native definition body and binder types contain no source symbols

```lean
∀ (S : Sort u_Corelib_ssr_ssrfun_588) (T : Sort u_Corelib_ssr_ssrfun_589) (e : T) (op : S → S → T),
  Rocq.Corelib.ssr.ssrfun.self_inverse S T e op ↔
    NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.self_inverse.native S T e op
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.bijective

NativeBridge.Incremental.SSRFunNormalization.bijectiveIso

目标：exists inverse g with both cancellation laws；范围：A,B : Type; proposition isomorphism; inverse existence, not a claim that an arbitrary function is bijective

```lean
(A : Type u) →
  (B : Type v) →
    (f : B → A) →
      NativeBridge.Iso (Rocq.Corelib.ssr.ssrfun.bijective A B f)
        (∃ g, (∀ (x : B), g (f x) = x) ∧ ∀ (y : A), f (g y) = y)
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.NonPropType.type

NativeBridge.Incremental.SSRNonProp.iso

目标：Bool × Type u；范围：all exported universe parameters; both inverse laws; boolean metadata retained

```lean
NativeBridge.Iso Rocq.Corelib.ssr.ssreflect_rw.NonPropType.type (Bool × Type u)
```

公理闭包：空

## Corelib.ssr.ssrfun.Option.apply

NativeBridge.Incremental.SSRFunOption.apply_agrees

目标：Option.elim；范围：supplements existing Type-only certificate with full Sort parameters; Option (PLift A) representation; same source root counted once

```lean
∀ {A : Sort u} {B : Sort v} (f : A → B) (d : B) (x : Rocq.Corelib.Init.Datatypes.option A),
  Rocq.Corelib.ssr.ssrfun.Option.apply A B f d x = (NativeBridge.Incremental.SSRFunOption.to x).elim d fun a => f a.down
```

公理闭包：空

## Corelib.ssr.ssrfun.Option.default

NativeBridge.Incremental.SSRFunOption.default_agrees

目标：Option.getD with PLift.down；范围：supplements existing Type-only certificate with full Sort parameters; Option (PLift A) representation; same source root counted once

```lean
∀ {A : Sort u} (d : A) (x : Rocq.Corelib.Init.Datatypes.option A),
  Rocq.Corelib.ssr.ssrfun.Option.default A d x = ((NativeBridge.Incremental.SSRFunOption.to x).getD { down := d }).down
```

公理闭包：空

## Corelib.ssr.ssrfun.Option.map

NativeBridge.Incremental.SSRFunOption.map_agrees

目标：Option.map with PLift input/output adapter；范围：supplements existing Type-only certificate with full Sort parameters; Option (PLift A) representation; same source root counted once

```lean
∀ {A : Sort u} {B : Sort v} (f : A → B) (x : Rocq.Corelib.Init.Datatypes.option A),
  NativeBridge.Incremental.SSRFunOption.to (Rocq.Corelib.ssr.ssrfun.Option.map A B f x) =
    Option.map (fun a => { down := f a.down }) (NativeBridge.Incremental.SSRFunOption.to x)
```

公理闭包：空

## Corelib.ssr.ssrfun.Option.bind

NativeBridge.Incremental.SSRFunOption.bind_agrees

目标：Option.bind with PLift input and output conversion；范围：supplements existing Type-only certificate with full Sort parameters; Option (PLift A) representation; same source root counted once

```lean
∀ {A : Sort u} {B : Sort v} (f : A → Rocq.Corelib.Init.Datatypes.option B) (x : Rocq.Corelib.Init.Datatypes.option A),
  NativeBridge.Incremental.SSRFunOption.to (Rocq.Corelib.ssr.ssrfun.Option.bind A B f x) =
    (NativeBridge.Incremental.SSRFunOption.to x).bind fun a => NativeBridge.Incremental.SSRFunOption.to (f a.down)
```

公理闭包：空

## Corelib.ssr.ssrfun.Option.lift

NativeBridge.Incremental.SSRFunOption.lift_agrees

目标：Option.some with PLift output；范围：supplements existing Type-only certificate with full Sort parameters; Option (PLift A) representation; same source root counted once

```lean
∀ {A : Sort u} {B : Sort v} (f : A → B) (x : A),
  NativeBridge.Incremental.SSRFunOption.to (Rocq.Corelib.ssr.ssrfun.Option.lift A B f x) = some { down := f x }
```

公理闭包：空

## Corelib.ssr.ssrfun.wrapped

NativeBridge.Incremental.SSRFunData.wrappedIso

目标：A；范围：A : Type u; both inverse laws

```lean
(A : Type u) → NativeBridge.Iso (Rocq.Corelib.ssr.ssrfun.wrapped A) A
```

公理闭包：空

## Corelib.ssr.ssrfun.wrap

NativeBridge.Incremental.SSRFunData.wrap_agrees

目标：id；范围：A : Type u

```lean
∀ (A : Type u) (x : A), (NativeBridge.Incremental.SSRFunData.wrappedIso A).to (Rocq.Corelib.ssr.ssrfun.wrap A x) = id x
```

公理闭包：空

## Corelib.ssr.ssrfun.unwrap

NativeBridge.Incremental.SSRFunData.unwrap_agrees

目标：id；范围：A : Type u

```lean
∀ (A : Type u) (x : Rocq.Corelib.ssr.ssrfun.wrapped A),
  Rocq.Corelib.ssr.ssrfun.unwrap A x = id ((NativeBridge.Incremental.SSRFunData.wrappedIso A).to x)
```

公理闭包：空

## Corelib.ssr.ssrfun.SimplFunDelta

NativeBridge.Incremental.SSRFunData.simpl_delta_agrees

目标：fun x => f x x；范围：full Sort parameters

```lean
∀ (A : Sort u) (B : Sort v) (f : A → A → B),
  (NativeBridge.Incremental.simplFunIso A B).to (Rocq.Corelib.ssr.ssrfun.SimplFunDelta A B f) = fun x => f x x
```

公理闭包：空

## Corelib.ssr.ssrfun.Tagged

NativeBridge.Incremental.SSRFunData.tagged_constructor_agrees

目标：PSigma.mk；范围：full Sort parameters

```lean
∀ (A : Sort u) (a : A) (P : A → Sort v) (p : P a),
  NativeBridge.Incremental.SSRFunData.sigmaTo (Rocq.Corelib.ssr.ssrfun.Tagged A a P p) = ⟨a, p⟩
```

公理闭包：空

## Corelib.ssr.ssrfun.Tagged2

NativeBridge.Incremental.SSRFunData.tagged2_constructor_agrees

目标：PSigma.mk with PProd.mk；范围：full Sort parameters

```lean
∀ (A : Sort u) (a : A) (P : A → Sort v) (Q : A → Sort w) (p : P a) (q : Q a),
  NativeBridge.Incremental.SSRFunData.sigma2To (Rocq.Corelib.ssr.ssrfun.Tagged2 A a P Q p q) = ⟨a, ⟨p, q⟩⟩
```

公理闭包：空

## Corelib.ssr.ssrfun.tag

NativeBridge.Incremental.SSRFunData.tag_agrees

目标：PSigma.fst；范围：full Sort parameters

```lean
∀ (A : Sort u) (P : A → Sort v) (x : Rocq.Corelib.Init.Specif.sigT A P),
  Rocq.Corelib.ssr.ssrfun.tag A P x = (NativeBridge.Incremental.SSRFunData.sigmaTo x).fst
```

公理闭包：空

## Corelib.ssr.ssrfun.tagged

NativeBridge.Incremental.SSRFunData.tagged_agrees

目标：PSigma.snd；范围：native PSigma inputs; full Sort parameters; sigmaOf/sigmaTo inverse laws

```lean
∀ (A : Sort u) (P : A → Sort v) (x : PSigma P),
  Rocq.Corelib.ssr.ssrfun.tagged A P (NativeBridge.Incremental.SSRFunData.sigmaOf x) = x.snd
```

公理闭包：空

## Corelib.ssr.ssrfun.tag2

NativeBridge.Incremental.SSRFunData.tag2_agrees

目标：PSigma.fst；范围：full Sort parameters

```lean
∀ (A : Sort u) (P : A → Sort v) (Q : A → Sort w) (x : Rocq.Corelib.Init.Specif.sigT2 A P Q),
  Rocq.Corelib.ssr.ssrfun.tag2 A P Q x = (NativeBridge.Incremental.SSRFunData.sigma2To x).fst
```

公理闭包：空

## Corelib.ssr.ssrfun.tagged2

NativeBridge.Incremental.SSRFunData.tagged2_agrees

目标：PSigma.snd followed by PProd.fst；范围：native PSigma inputs; full Sort parameters; sigma2Of/sigma2To inverse laws

```lean
∀ (A : Sort u) (P : A → Sort v) (Q : A → Sort w) (x : (a : A) ×' P a ×' Q a),
  Rocq.Corelib.ssr.ssrfun.tagged2 A P Q (NativeBridge.Incremental.SSRFunData.sigma2Of x) = x.snd.fst
```

公理闭包：空

## Corelib.ssr.ssrfun.tagged2'

NativeBridge.Incremental.SSRFunData.tagged2_second_agrees

目标：PSigma.snd followed by PProd.snd；范围：native PSigma inputs; full Sort parameters; sigma2Of/sigma2To inverse laws

```lean
∀ (A : Sort u) (P : A → Sort v) (Q : A → Sort w) (x : (a : A) ×' P a ×' Q a),
  Rocq.Corelib.ssr.ssrfun.tagged2' A P Q (NativeBridge.Incremental.SSRFunData.sigma2Of x) = x.snd.snd
```

公理闭包：空

## Corelib.ssr.ssrfun.tag_of_tag2

NativeBridge.Incremental.SSRFunData.tag_of_tag2_agrees

目标：id on PSigma of PProd；范围：full Sort parameters

```lean
∀ (A : Sort u) (P : A → Sort v) (Q : A → Sort w) (x : Rocq.Corelib.Init.Specif.sigT2 A P Q),
  NativeBridge.Incremental.SSRFunData.sigmaPairTo (Rocq.Corelib.ssr.ssrfun.tag_of_tag2 A P Q x) =
    id (NativeBridge.Incremental.SSRFunData.sigma2To x)
```

公理闭包：空

## Corelib.ssr.ssrfun.all_pair

NativeBridge.Incremental.SSRFunData.all_pair_agrees

目标：fun f => PProd.mk (fun i => (f i).fst) (fun i => (f i).snd)；范围：dependent function families over Sort

```lean
∀ (I : Sort u) (T : I → Sort v) (U : I → Sort w) (f : (i : I) → Rocq.Corelib.Init.Datatypes.prod (T i) (U i)),
  NativeBridge.Incremental.SSRFunData.pairTo (Rocq.Corelib.ssr.ssrfun.all_pair I T U f) =
    ⟨fun i => (NativeBridge.Incremental.SSRFunData.pairTo (f i)).fst, fun i =>
      (NativeBridge.Incremental.SSRFunData.pairTo (f i)).snd⟩
```

公理闭包：空

## Corelib.ssr.ssrfun.s2val

NativeBridge.Incremental.SSRFunData.s2val_agrees

目标：Subtype.val；范围：A : Sort u; P,Q : A → Prop

```lean
∀ (A : Sort u) (P Q : A → Prop) (x : Rocq.Corelib.Init.Specif.sig2 A P Q),
  Rocq.Corelib.ssr.ssrfun.s2val A P Q x = (NativeBridge.Incremental.SSRFunNormalization.sig2To x).val
```

公理闭包：空

## Corelib.ssr.ssrfun.of_void

NativeBridge.Incremental.SSRFunData.of_void_agrees

目标：Empty.elim；范围：result : Sort u

```lean
∀ (A : Sort u) (x : Rocq.Corelib.Init.Datatypes.Empty_set),
  Rocq.Corelib.ssr.ssrfun.of_void A x = (NativeBridge.Incremental.SSRFunData.emptyTo x).elim
```

公理闭包：空

## Corelib.ssr.ssrfun.phant_id

NativeBridge.Incremental.SSRFunData.phant_id_agrees

目标：True → True；范围：full Sort parameters; source phantom has one proof constructor

```lean
∀ (A : Sort u) (B : Sort v) (a : A) (b : B), Rocq.Corelib.ssr.ssrfun.phant_id A B a b ↔ True → True
```

公理闭包：空

## Corelib.ssr.ssrfun.pcancel

NativeBridge.Incremental.SSRFunData.pcancel_agrees

目标：∀ x, g (f x) = some (PLift.up x)；范围：full Sort parameters; native Option(PLift A) inputs with inverse conversion

```lean
∀ (A : Sort u) (B : Sort v) (f : B → A) (g : A → Option (PLift B)),
  (Rocq.Corelib.ssr.ssrfun.pcancel A B f fun x => NativeBridge.Incremental.SSRFunOption.of (g x)) ↔
    ∀ (x : B), g (f x) = some { down := x }
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.ocancel

NativeBridge.Incremental.SSRFunData.ocancel_agrees

目标：∀ x, (g x).elim x (fun a => h a.down) = x；范围：full Sort parameters; native Option(PLift A) inputs with inverse conversion

```lean
∀ (A : Sort u) (B : Sort v) (g : B → Option (PLift A)) (h : A → B),
  Rocq.Corelib.ssr.ssrfun.ocancel A B (fun x => NativeBridge.Incremental.SSRFunOption.of (g x)) h ↔
    ∀ (x : B), ((g x).elim x fun a => h a.down) = x
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.pcomp

NativeBridge.Incremental.SSRFunData.pcomp_agrees

目标：Option.bind；范围：full Sort parameters; native Option(PLift A) inputs with inverse conversion

```lean
∀ (A : Sort u) (B : Sort v) (C : Sort w) (f : B → Option (PLift A)) (g : C → Option (PLift B)) (x : C),
  NativeBridge.Incremental.SSRFunOption.to
      (Rocq.Corelib.ssr.ssrfun.pcomp A B C (fun b => NativeBridge.Incremental.SSRFunOption.of (f b))
        (fun c => NativeBridge.Incremental.SSRFunOption.of (g c)) x) =
    (g x).bind fun b => f b.down
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.tag_of_sig

NativeBridge.Incremental.SSRFunConditions.tag_of_sig_agrees

目标：fun (x : Subtype P) => PSigma.mk x.val x.property；范围：all explicit prerequisites discharged; source universe parameters preserved

```lean
∀ (A : Sort u) (P : A → Prop) (x : Rocq.Corelib.Init.Specif.sig A P),
  NativeBridge.Incremental.SSRFunData.sigmaTo (RocqPending.Corelib.ssr.ssrfun.tag_of_sig A P x) =
    NativeBridge.Incremental.SSRFunConditions.nativeTagOfSig (NativeBridge.Incremental.SSRFunNormalization.sigTo x)
```

公理闭包：空

## Corelib.ssr.ssrfun.sig_of_sig2

NativeBridge.Incremental.SSRFunConditions.sig_of_sig2_agrees

目标：id on Subtype of conjunction；范围：all explicit prerequisites discharged; source universe parameters preserved

```lean
∀ (A : Sort u) (P Q : A → Prop) (x : Rocq.Corelib.Init.Specif.sig2 A P Q),
  NativeBridge.Incremental.SSRFunConditions.andSubtypeTo (RocqPending.Corelib.ssr.ssrfun.sig_of_sig2 A P Q x) =
    id (NativeBridge.Incremental.SSRFunNormalization.sig2To x)
```

公理闭包：空

## Corelib.ssr.ssrfun.esymK

NativeBridge.Incremental.SSRFunConditions.esym_agrees

目标：∀ (T : Sort u) (x y : T) (h : x = y), h.symm.symm = h；范围：all explicit prerequisites discharged; source universe parameters preserved

```lean
RocqPending.Corelib.ssr.ssrfun.esymK.statement ↔ NativeBridge.Incremental.SSRFunConditions.nativeEsym
```

公理闭包：空

## Corelib.ssr.ssrfun.etrans_id

NativeBridge.Incremental.SSRFunConditions.etrans_agrees

目标：∀ (T : Sort u) (x y : T) (h : x = y), h.trans rfl = h；范围：all explicit prerequisites discharged; source universe parameters preserved

```lean
RocqPending.Corelib.ssr.ssrfun.etrans_id.statement ↔ NativeBridge.Incremental.SSRFunConditions.nativeEtrans
```

公理闭包：空

## Corelib.ssr.ssrbool.simpl_pred

NativeBridge.Incremental.SSRBoolData.simplPredIso

目标：A → Bool；范围：A : Type u; both inverse laws

```lean
(A : Type u) → NativeBridge.Iso (Rocq.Corelib.ssr.ssrbool.simpl_pred A) (A → Bool)
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.simpl_rel

NativeBridge.Incremental.SSRBoolData.simplRelIso

目标：A → A → Bool；范围：A : Type u; both inverse laws

```lean
(A : Type u) → NativeBridge.Iso (Rocq.Corelib.ssr.ssrbool.simpl_rel A) (A → A → Bool)
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.mem_pred

NativeBridge.Incremental.SSRBoolData.memIso

目标：A → Bool；范围：A : Type u; both inverse laws

```lean
(A : Type u) → NativeBridge.Iso (Rocq.Corelib.ssr.ssrbool.mem_pred A) (A → Bool)
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.predArgType

NativeBridge.Incremental.SSRBoolData.predArgIso

目标：Type u；范围：universe preserved; both inverse laws

```lean
NativeBridge.Iso Rocq.Corelib.ssr.ssrbool.predArgType (Type u)
```

公理闭包：空

## Corelib.ssr.ssrbool.predType

NativeBridge.Incremental.SSRBoolData.predTypeIso

目标：Sigma (fun S : Type u => S → A → Bool)；范围：A : Type v; independent carrier universe u; both inverse laws

```lean
(A : Type v) →
  NativeBridge.Iso (Rocq.Corelib.ssr.ssrbool.predType A) (NativeBridge.Incremental.SSRBoolData.nativePredType A)
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.implies

NativeBridge.Incremental.SSRBoolData.impliesIso

目标：P → Q；范围：P : Sort u; Q : Sort v; both inverse laws

```lean
(P : Sort u) → (Q : Sort v) → NativeBridge.Iso (Rocq.Corelib.ssr.ssrbool.implies P Q) (P → Q)
```

公理闭包：空

## Corelib.ssr.ssrbool.decidable

NativeBridge.Incremental.SSRBoolData.decidableIso

目标：Decidable P；范围：P : Prop; both inverse laws; no choice axiom

```lean
(P : Prop) → NativeBridge.Iso (Rocq.Corelib.ssr.ssrbool.decidable P) (Decidable P)
```

公理闭包：空

## Corelib.ssr.ssrbool.sort_of_predArgType

NativeBridge.Incremental.SSRBoolData.sort_of_predArgType_agrees

目标：id on Type u；范围：Type parameters with source universe levels preserved

```lean
∀ (A : Rocq.Corelib.ssr.ssrbool.predArgType), Rocq.Corelib.ssr.ssrbool.sort_of_predArgType A = id A
```

公理闭包：空

## Corelib.ssr.ssrbool.SimplPred

NativeBridge.Incremental.SSRBoolData.simplPred_agrees

目标：id on A → Bool；范围：Type parameters with source universe levels preserved

```lean
∀ (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.pred A),
  (NativeBridge.Incremental.SSRBoolData.simplPredIso A).to (Rocq.Corelib.ssr.ssrbool.SimplPred A p) =
    NativeBridge.Incremental.SSRBoolData.predTo p
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.SimplRel

NativeBridge.Incremental.SSRBoolData.simplRel_agrees

目标：id on A → A → Bool；范围：Type parameters with source universe levels preserved

```lean
∀ (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.rel A),
  (NativeBridge.Incremental.SSRBoolData.simplRelIso A).to (Rocq.Corelib.ssr.ssrbool.SimplRel A p) = fun x y =>
    NativeBridge.boolTo (p x y)
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.fun_of_pred

NativeBridge.Incremental.SSRBoolData.fun_of_pred_agrees

目标：id on A → Bool；范围：Type parameters with source universe levels preserved

```lean
∀ (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.pred A),
  NativeBridge.Incremental.SSRBoolData.predTo (Rocq.Corelib.ssr.ssrbool.fun_of_pred A p) =
    id (NativeBridge.Incremental.SSRBoolData.predTo p)
```

公理闭包：空

## Corelib.ssr.ssrbool.fun_of_rel

NativeBridge.Incremental.SSRBoolData.fun_of_rel_agrees

目标：id on A → A → Bool；范围：Type parameters with source universe levels preserved

```lean
∀ (A : Type u) (r : Rocq.Corelib.ssr.ssrbool.rel A),
  (fun x y => NativeBridge.boolTo (Rocq.Corelib.ssr.ssrbool.fun_of_rel A r x y)) =
    id fun x y => NativeBridge.boolTo (r x y)
```

公理闭包：空

## Corelib.ssr.ssrbool.pred0

NativeBridge.Incremental.SSRBoolData.pred0_agrees

目标：fun _ => false；范围：Type parameters with source universe levels preserved

```lean
∀ (A : Type u),
  (NativeBridge.Incremental.SSRBoolData.simplPredIso A).to (Rocq.Corelib.ssr.ssrbool.pred0 A) = fun x => false
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.predT

NativeBridge.Incremental.SSRBoolData.predT_agrees

目标：fun _ => true；范围：Type parameters with source universe levels preserved

```lean
∀ (A : Type u),
  (NativeBridge.Incremental.SSRBoolData.simplPredIso A).to (Rocq.Corelib.ssr.ssrbool.predT A) = fun x => true
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.predI

NativeBridge.Incremental.SSRBoolData.predI_agrees

目标：fun x => p x && q x；范围：Type parameters with source universe levels preserved

```lean
∀ (A : Type u) (p q : Rocq.Corelib.ssr.ssrbool.pred A),
  (NativeBridge.Incremental.SSRBoolData.simplPredIso A).to (Rocq.Corelib.ssr.ssrbool.predI A p q) = fun x =>
    NativeBridge.Incremental.SSRBoolData.predTo p x && NativeBridge.Incremental.SSRBoolData.predTo q x
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.predU

NativeBridge.Incremental.SSRBoolData.predU_agrees

目标：fun x => p x || q x；范围：Type parameters with source universe levels preserved

```lean
∀ (A : Type u) (p q : Rocq.Corelib.ssr.ssrbool.pred A),
  (NativeBridge.Incremental.SSRBoolData.simplPredIso A).to (Rocq.Corelib.ssr.ssrbool.predU A p q) = fun x =>
    NativeBridge.Incremental.SSRBoolData.predTo p x || NativeBridge.Incremental.SSRBoolData.predTo q x
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.predC

NativeBridge.Incremental.SSRBoolData.predC_agrees

目标：fun x => !(p x)；范围：Type parameters with source universe levels preserved

```lean
∀ (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.pred A),
  (NativeBridge.Incremental.SSRBoolData.simplPredIso A).to (Rocq.Corelib.ssr.ssrbool.predC A p) = fun x =>
    !NativeBridge.Incremental.SSRBoolData.predTo p x
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.predD

NativeBridge.Incremental.SSRBoolData.predD_agrees

目标：fun x => !(q x) && p x；范围：Type parameters with source universe levels preserved

```lean
∀ (A : Type u) (p q : Rocq.Corelib.ssr.ssrbool.pred A),
  (NativeBridge.Incremental.SSRBoolData.simplPredIso A).to (Rocq.Corelib.ssr.ssrbool.predD A p q) = fun x =>
    !NativeBridge.Incremental.SSRBoolData.predTo q x && NativeBridge.Incremental.SSRBoolData.predTo p x
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.preim

NativeBridge.Incremental.SSRBoolData.preim_agrees

目标：Function.comp；范围：Type parameters with source universe levels preserved

```lean
∀ (A : Type u) (B : Type v) (f : A → B) (p : Rocq.Corelib.ssr.ssrbool.pred B),
  (NativeBridge.Incremental.SSRBoolData.simplPredIso A).to (Rocq.Corelib.ssr.ssrbool.preim A B f p) =
    NativeBridge.Incremental.SSRBoolData.predTo p ∘ f
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.relU

NativeBridge.Incremental.SSRBoolData.relU_agrees

目标：fun x y => r x y || s x y；范围：Type parameters with source universe levels preserved

```lean
∀ (A : Type u) (r s : Rocq.Corelib.ssr.ssrbool.rel A),
  (NativeBridge.Incremental.SSRBoolData.simplRelIso A).to (Rocq.Corelib.ssr.ssrbool.relU A r s) = fun x y =>
    NativeBridge.boolTo (r x y) || NativeBridge.boolTo (s x y)
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.relpre

NativeBridge.Incremental.SSRBoolData.relpre_agrees

目标：fun x y => r (f x) (f y)；范围：Type parameters with source universe levels preserved

```lean
∀ (A : Type u) (B : Type v) (f : A → B) (r : Rocq.Corelib.ssr.ssrbool.rel B),
  (NativeBridge.Incremental.SSRBoolData.simplRelIso A).to (Rocq.Corelib.ssr.ssrbool.relpre A B f r) = fun x y =>
    NativeBridge.boolTo (r (f x) (f y))
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.pred_of_argType

NativeBridge.Incremental.SSRBoolData.pred_of_argType_agrees

目标：fun _ => true；范围：Type parameters with source universe levels preserved

```lean
∀ (A : Rocq.Corelib.ssr.ssrbool.predArgType),
  (NativeBridge.Incremental.SSRBoolData.simplPredIso A).to (Rocq.Corelib.ssr.ssrbool.pred_of_argType A) = fun x => true
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.pred_of_mem

NativeBridge.Incremental.SSRBoolData.pred_of_mem_agrees

目标：id on A → Bool；范围：Type parameters with source universe levels preserved

```lean
∀ (A : Type u) (x : Rocq.Corelib.ssr.ssrbool.mem_pred A),
  NativeBridge.Incremental.SSRBoolData.predTo (Rocq.Corelib.ssr.ssrbool.pred_of_mem A x) =
    (NativeBridge.Incremental.SSRBoolData.memIso A).to x
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.in_mem

NativeBridge.Incremental.SSRBoolData.in_mem_agrees

目标：function application；范围：Type parameters with source universe levels preserved

```lean
∀ (A : Type u) (a : A) (x : Rocq.Corelib.ssr.ssrbool.mem_pred A),
  NativeBridge.boolTo (Rocq.Corelib.ssr.ssrbool.in_mem A a x) = (NativeBridge.Incremental.SSRBoolData.memIso A).to x a
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.simpl_of_mem

NativeBridge.Incremental.SSRBoolData.simpl_of_mem_agrees

目标：id on A → Bool；范围：Type parameters with source universe levels preserved

```lean
∀ (A : Type u) (x : Rocq.Corelib.ssr.ssrbool.mem_pred A),
  (NativeBridge.Incremental.SSRBoolData.simplPredIso A).to (Rocq.Corelib.ssr.ssrbool.simpl_of_mem A x) =
    (NativeBridge.Incremental.SSRBoolData.memIso A).to x
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.pred_oapp

NativeBridge.Incremental.SSRBoolData.pred_oapp_agrees

目标：Option.any；范围：Type parameters with source universe levels preserved

```lean
∀ (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.pred A) (x : Rocq.Corelib.Init.Datatypes.option A),
  NativeBridge.boolTo (Rocq.Corelib.ssr.ssrbool.pred_oapp A p x) =
    Option.any (NativeBridge.Incremental.SSRBoolData.predTo p) (NativeBridge.optionTo x)
```

公理闭包：空

## Corelib.ssr.ssrbool.pred_sort

NativeBridge.Incremental.SSRBoolData.pred_sort_agrees

目标：Sigma.fst；范围：Type parameters with source universe levels preserved

```lean
∀ (A : Type v) (x : Rocq.Corelib.ssr.ssrbool.predType A),
  Rocq.Corelib.ssr.ssrbool.pred_sort A x = (NativeBridge.Incremental.SSRBoolData.predTypeTo A x).fst
```

公理闭包：空

## Corelib.ssr.ssrbool.topred

NativeBridge.Incremental.SSRBoolData.topred_agrees

目标：Sigma.snd applied to native carrier element；范围：Type parameters with source universe levels preserved

```lean
∀ (A : Type v) (x : NativeBridge.Incremental.SSRBoolData.nativePredType A) (s : x.fst),
  NativeBridge.Incremental.SSRBoolData.predTo
      (Rocq.Corelib.ssr.ssrbool.topred A (NativeBridge.Incremental.SSRBoolData.predTypeOf A x) s) =
    x.snd s
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.unless

NativeBridge.Incremental.SSRBoolData.unless_agrees

目标：Nonempty P ∨ Nonempty Q；范围：full Sort parameters; constructive equivalence; no classical axiom

```lean
∀ (P : Sort u) (Q : Sort v), Rocq.Corelib.ssr.ssrbool.unless P Q ↔ Nonempty P ∨ Nonempty Q
```

公理闭包：空

## Corelib.ssr.ssrbool.classically

NativeBridge.Incremental.SSRBoolData.classically_agrees

目标：¬¬ Nonempty P；范围：full Sort parameters; constructive equivalence; no classical axiom

```lean
∀ (P : Sort u), Rocq.Corelib.ssr.ssrbool.classically P ↔ ¬¬Nonempty P
```

公理闭包：空

## Corelib.ssr.ssrbool.and3

NativeBridge.Incremental.SSRBoolLogic.and3Iso

目标：right-associated native And of 3 propositions；范围：Prop; both inverse laws

```lean
(P1 P2 P3 : Prop) → NativeBridge.Iso (Rocq.Corelib.ssr.ssrbool.and3 P1 P2 P3) (P1 ∧ P2 ∧ P3)
```

公理闭包：空

## Corelib.ssr.ssrbool.and3_rec

NativeBridge.Incremental.SSRBoolLogic.and3_rec_agrees

目标：apply branch function to native conjunction projections；范围：native conjunction inputs; inverse conversion; result Type

```lean
∀ (P1 P2 P3 : Prop) (C : Type) (f : P1 → P2 → P3 → C) (h : P1 ∧ P2 ∧ P3),
  Rocq.Corelib.ssr.ssrbool.and3_rec P1 P2 P3 C f ⋯ = f ⋯ ⋯ ⋯
```

公理闭包：空

## Corelib.ssr.ssrbool.and3_rect

NativeBridge.Incremental.SSRBoolLogic.and3_rect_agrees

目标：apply branch function to native conjunction projections；范围：native conjunction inputs; inverse conversion; result Sort u

```lean
∀ (P1 P2 P3 : Prop) (C : Sort u) (f : P1 → P2 → P3 → C) (h : P1 ∧ P2 ∧ P3),
  Rocq.Corelib.ssr.ssrbool.and3_rect P1 P2 P3 C f ⋯ = f ⋯ ⋯ ⋯
```

公理闭包：空

## Corelib.ssr.ssrbool.and4

NativeBridge.Incremental.SSRBoolLogic.and4Iso

目标：right-associated native And of 4 propositions；范围：Prop; both inverse laws

```lean
(P1 P2 P3 P4 : Prop) → NativeBridge.Iso (Rocq.Corelib.ssr.ssrbool.and4 P1 P2 P3 P4) (P1 ∧ P2 ∧ P3 ∧ P4)
```

公理闭包：空

## Corelib.ssr.ssrbool.and4_rec

NativeBridge.Incremental.SSRBoolLogic.and4_rec_agrees

目标：apply branch function to native conjunction projections；范围：native conjunction inputs; inverse conversion; result Type

```lean
∀ (P1 P2 P3 P4 : Prop) (C : Type) (f : P1 → P2 → P3 → P4 → C) (h : P1 ∧ P2 ∧ P3 ∧ P4),
  Rocq.Corelib.ssr.ssrbool.and4_rec P1 P2 P3 P4 C f ⋯ = f ⋯ ⋯ ⋯ ⋯
```

公理闭包：空

## Corelib.ssr.ssrbool.and4_rect

NativeBridge.Incremental.SSRBoolLogic.and4_rect_agrees

目标：apply branch function to native conjunction projections；范围：native conjunction inputs; inverse conversion; result Sort u

```lean
∀ (P1 P2 P3 P4 : Prop) (C : Sort u) (f : P1 → P2 → P3 → P4 → C) (h : P1 ∧ P2 ∧ P3 ∧ P4),
  Rocq.Corelib.ssr.ssrbool.and4_rect P1 P2 P3 P4 C f ⋯ = f ⋯ ⋯ ⋯ ⋯
```

公理闭包：空

## Corelib.ssr.ssrbool.and5

NativeBridge.Incremental.SSRBoolLogic.and5Iso

目标：right-associated native And of 5 propositions；范围：Prop; both inverse laws

```lean
(P1 P2 P3 P4 P5 : Prop) → NativeBridge.Iso (Rocq.Corelib.ssr.ssrbool.and5 P1 P2 P3 P4 P5) (P1 ∧ P2 ∧ P3 ∧ P4 ∧ P5)
```

公理闭包：空

## Corelib.ssr.ssrbool.and5_rec

NativeBridge.Incremental.SSRBoolLogic.and5_rec_agrees

目标：apply branch function to native conjunction projections；范围：native conjunction inputs; inverse conversion; result Type

```lean
∀ (P1 P2 P3 P4 P5 : Prop) (C : Type) (f : P1 → P2 → P3 → P4 → P5 → C) (h : P1 ∧ P2 ∧ P3 ∧ P4 ∧ P5),
  Rocq.Corelib.ssr.ssrbool.and5_rec P1 P2 P3 P4 P5 C f ⋯ = f ⋯ ⋯ ⋯ ⋯ ⋯
```

公理闭包：空

## Corelib.ssr.ssrbool.and5_rect

NativeBridge.Incremental.SSRBoolLogic.and5_rect_agrees

目标：apply branch function to native conjunction projections；范围：native conjunction inputs; inverse conversion; result Sort u

```lean
∀ (P1 P2 P3 P4 P5 : Prop) (C : Sort u) (f : P1 → P2 → P3 → P4 → P5 → C) (h : P1 ∧ P2 ∧ P3 ∧ P4 ∧ P5),
  Rocq.Corelib.ssr.ssrbool.and5_rect P1 P2 P3 P4 P5 C f ⋯ = f ⋯ ⋯ ⋯ ⋯ ⋯
```

公理闭包：空

## Corelib.ssr.ssrbool.or3

NativeBridge.Incremental.SSRBoolLogic.or3Iso

目标：right-associated native Or of 3 propositions；范围：Prop; both inverse laws

```lean
(P1 P2 P3 : Prop) → NativeBridge.Iso (Rocq.Corelib.ssr.ssrbool.or3 P1 P2 P3) (P1 ∨ P2 ∨ P3)
```

公理闭包：空

## Corelib.ssr.ssrbool.or4

NativeBridge.Incremental.SSRBoolLogic.or4Iso

目标：right-associated native Or of 4 propositions；范围：Prop; both inverse laws

```lean
(P1 P2 P3 P4 : Prop) → NativeBridge.Iso (Rocq.Corelib.ssr.ssrbool.or4 P1 P2 P3 P4) (P1 ∨ P2 ∨ P3 ∨ P4)
```

公理闭包：空

## Corelib.ssr.ssrbool.collective_pred

NativeBridge.Incremental.SSRBoolLogic.collectiveIso

目标：A → Bool；范围：A : Type u; both inverse laws

```lean
(A : Type u) → NativeBridge.Iso (Rocq.Corelib.ssr.ssrbool.collective_pred A) (A → Bool)
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.applicative_pred

NativeBridge.Incremental.SSRBoolLogic.applicativeIso

目标：A → Bool；范围：A : Type u; both inverse laws

```lean
(A : Type u) → NativeBridge.Iso (Rocq.Corelib.ssr.ssrbool.applicative_pred A) (A → Bool)
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.PredOfSimpl.coerce

NativeBridge.Incremental.SSRBoolLogic.coerce_agrees

目标：id on A → Bool；范围：A : Type u; native Bool-valued predicates

```lean
∀ (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.simpl_pred A),
  NativeBridge.Incremental.SSRBoolData.predTo (Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce A p) =
    (NativeBridge.Incremental.SSRBoolData.simplPredIso A).to p
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.pre_symmetric

NativeBridge.Incremental.SSRBoolLogic.pre_symmetric_agrees

目标：∀ x y, r x y = true → r y x = true；范围：A : Type u; native Bool-valued predicates

```lean
∀ (A : Type u) (r : Rocq.Corelib.ssr.ssrbool.rel A),
  Rocq.Corelib.ssr.ssrbool.pre_symmetric A r ↔
    ∀ (x y : A), NativeBridge.boolTo (r x y) = true → NativeBridge.boolTo (r y x) = true
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.left_transitive

NativeBridge.Incremental.SSRBoolLogic.left_transitive_agrees

目标：∀ x y, r x y = true → ∀ z, r x z = r y z；范围：A : Type u; native Bool-valued predicates

```lean
∀ (A : Type u) (r : Rocq.Corelib.ssr.ssrbool.rel A),
  Rocq.Corelib.ssr.ssrbool.left_transitive A r ↔
    ∀ (x y : A),
      NativeBridge.boolTo (r x y) = true → ∀ (z : A), NativeBridge.boolTo (r x z) = NativeBridge.boolTo (r y z)
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.right_transitive

NativeBridge.Incremental.SSRBoolLogic.right_transitive_agrees

目标：∀ x y, r x y = true → ∀ z, r z x = r z y；范围：A : Type u; native Bool-valued predicates

```lean
∀ (A : Type u) (r : Rocq.Corelib.ssr.ssrbool.rel A),
  Rocq.Corelib.ssr.ssrbool.right_transitive A r ↔
    ∀ (x y : A),
      NativeBridge.boolTo (r x y) = true → ∀ (z : A), NativeBridge.boolTo (r z x) = NativeBridge.boolTo (r z y)
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.equivalence_rel

NativeBridge.Incremental.SSRBoolLogic.equivalence_rel_agrees

目标：∀ x y z, r z z = true ∧ (r x y = true → r x z = r y z)；范围：A : Type u; native Bool-valued predicates

```lean
∀ (A : Type u) (r : Rocq.Corelib.ssr.ssrbool.rel A),
  Rocq.Corelib.ssr.ssrbool.equivalence_rel A r ↔
    ∀ (x y z : A),
      NativeBridge.boolTo (r z z) = true ∧
        (NativeBridge.boolTo (r x y) = true → NativeBridge.boolTo (r x z) = NativeBridge.boolTo (r y z))
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.manifest_simpl_pred

NativeBridge.Incremental.SSRBoolPackaging.manifestSimplIso

目标：Unit；范围：source Type and independent metadata universe parameters preserved; both inverse laws; fixed external predicate/key/index parameters retained

```lean
(A : Type u) →
  (p : Rocq.Corelib.ssr.ssrbool.pred A) → NativeBridge.Iso (Rocq.Corelib.ssr.ssrbool.manifest_simpl_pred A p) Unit
```

公理闭包：空

## Corelib.ssr.ssrbool.registered_applicative_pred

NativeBridge.Incremental.SSRBoolPackaging.registeredIso

目标：Unit；范围：source Type and independent metadata universe parameters preserved; both inverse laws; fixed external predicate/key/index parameters retained

```lean
(A : Type u) →
  (p : Rocq.Corelib.ssr.ssrbool.pred A) →
    NativeBridge.Iso (Rocq.Corelib.ssr.ssrbool.registered_applicative_pred A p) Unit
```

公理闭包：空

## Corelib.ssr.ssrbool.manifest_mem_pred

NativeBridge.Incremental.SSRBoolPackaging.manifestMemIso

目标：Unit；范围：source Type and independent metadata universe parameters preserved; both inverse laws; fixed external predicate/key/index parameters retained

```lean
(A : Type u) →
  (p : Rocq.Corelib.ssr.ssrbool.pred A) → NativeBridge.Iso (Rocq.Corelib.ssr.ssrbool.manifest_mem_pred A p) Unit
```

公理闭包：空

## Corelib.ssr.ssrbool.applicative_mem_pred

NativeBridge.Incremental.SSRBoolPackaging.applicativeMemIso

目标：Unit；范围：source Type and independent metadata universe parameters preserved; both inverse laws; fixed external predicate/key/index parameters retained

```lean
(A : Type u) →
  (p : Rocq.Corelib.ssr.ssrbool.pred A) → NativeBridge.Iso (Rocq.Corelib.ssr.ssrbool.applicative_mem_pred A p) Unit
```

公理闭包：空

## Corelib.ssr.ssrbool.qualifier

NativeBridge.Incremental.SSRBoolPackaging.qualifierIso

目标：A → Bool；范围：source Type and independent metadata universe parameters preserved; both inverse laws; fixed external predicate/key/index parameters retained

```lean
(n : Rocq.Corelib.Init.Datatypes.nat) →
  (A : Type u) → NativeBridge.Iso (Rocq.Corelib.ssr.ssrbool.qualifier n A) (A → Bool)
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.pred_key

NativeBridge.Incremental.SSRBoolPackaging.predKeyIso

目标：True；范围：source Type and independent metadata universe parameters preserved; both inverse laws; fixed external predicate/key/index parameters retained

```lean
(A : Type u) → (p : Rocq.Corelib.ssr.ssrbool.pred A) → NativeBridge.Iso (Rocq.Corelib.ssr.ssrbool.pred_key A p) True
```

公理闭包：空

## Corelib.ssr.ssrbool.keyed_pred

NativeBridge.Incremental.SSRBoolPackaging.keyedPredIso

目标：Unit；范围：source Type and independent metadata universe parameters preserved; both inverse laws; fixed external predicate/key/index parameters retained

```lean
(A : Type u) →
  (p : Rocq.Corelib.ssr.ssrbool.pred A) →
    (k : Rocq.Corelib.ssr.ssrbool.pred_key A p) → NativeBridge.Iso (Rocq.Corelib.ssr.ssrbool.keyed_pred A p k) Unit
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.keyed_qualifier

NativeBridge.Incremental.SSRBoolPackaging.keyedQualifierIso

目标：Unit；范围：source Type and independent metadata universe parameters preserved; both inverse laws; fixed external predicate/key/index parameters retained

```lean
(A : Type u) →
  (n : Rocq.Corelib.Init.Datatypes.nat) →
    (q : Rocq.Corelib.ssr.ssrbool.qualifier n A) →
      (k : Rocq.Corelib.ssr.ssrbool.pred_key A (Rocq.Corelib.ssr.ssrbool.has_quality n A q)) →
        NativeBridge.Iso (Rocq.Corelib.ssr.ssrbool.keyed_qualifier A n q k) Unit
```

公理闭包：空

## Corelib.ssr.ssrbool.collective_pred_of_simpl

NativeBridge.Incremental.SSRBoolPackaging.collective_pred_of_simpl_agrees

目标：id on A → Bool；范围：source Type and independent metadata universe parameters preserved; fixed external predicate/key/index parameters retained

```lean
∀ (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.simpl_pred A),
  NativeBridge.Incremental.SSRBoolData.predTo (Rocq.Corelib.ssr.ssrbool.collective_pred_of_simpl A p) =
    (NativeBridge.Incremental.SSRBoolData.simplPredIso A).to p
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.applicative_pred_of_simpl

NativeBridge.Incremental.SSRBoolPackaging.applicative_pred_of_simpl_agrees

目标：id on A → Bool；范围：source Type and independent metadata universe parameters preserved; fixed external predicate/key/index parameters retained

```lean
∀ (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.simpl_pred A),
  NativeBridge.Incremental.SSRBoolData.predTo (Rocq.Corelib.ssr.ssrbool.applicative_pred_of_simpl A p) =
    (NativeBridge.Incremental.SSRBoolData.simplPredIso A).to p
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.rel_of_simpl

NativeBridge.Incremental.SSRBoolPackaging.rel_of_simpl_agrees

目标：id on A → A → Bool；范围：source Type and independent metadata universe parameters preserved; fixed external predicate/key/index parameters retained

```lean
∀ (A : Type u) (r : Rocq.Corelib.ssr.ssrbool.simpl_rel A),
  (fun x y => NativeBridge.boolTo (Rocq.Corelib.ssr.ssrbool.rel_of_simpl A r x y)) =
    (NativeBridge.Incremental.SSRBoolData.simplRelIso A).to r
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.simpl_pred_value

NativeBridge.Incremental.SSRBoolPackaging.simpl_pred_value_agrees

目标：constant native predicate specified by the parameter；范围：source Type and independent metadata universe parameters preserved; fixed external predicate/key/index parameters retained

```lean
∀ (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.pred A) (x : Rocq.Corelib.ssr.ssrbool.manifest_simpl_pred A p),
  (NativeBridge.Incremental.SSRBoolData.simplPredIso A).to (Rocq.Corelib.ssr.ssrbool.simpl_pred_value A p x) =
    NativeBridge.Incremental.SSRBoolData.predTo p
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.applicative_pred_value

NativeBridge.Incremental.SSRBoolPackaging.applicative_pred_value_agrees

目标：constant native predicate specified by the parameter；范围：source Type and independent metadata universe parameters preserved; fixed external predicate/key/index parameters retained

```lean
∀ (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.pred A) (x : Rocq.Corelib.ssr.ssrbool.registered_applicative_pred A p),
  NativeBridge.Incremental.SSRBoolData.predTo (Rocq.Corelib.ssr.ssrbool.applicative_pred_value A p x) =
    NativeBridge.Incremental.SSRBoolData.predTo p
```

公理闭包：空

## Corelib.ssr.ssrbool.mem_pred_value

NativeBridge.Incremental.SSRBoolPackaging.mem_pred_value_agrees

目标：constant native predicate specified by the parameter；范围：source Type and independent metadata universe parameters preserved; fixed external predicate/key/index parameters retained

```lean
∀ (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.pred A) (x : Rocq.Corelib.ssr.ssrbool.manifest_mem_pred A p),
  (NativeBridge.Incremental.SSRBoolData.memIso A).to (Rocq.Corelib.ssr.ssrbool.mem_pred_value A p x) =
    NativeBridge.Incremental.SSRBoolData.predTo p
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.applicative_mem_pred_value

NativeBridge.Incremental.SSRBoolPackaging.applicative_mem_pred_value_agrees

目标：id on Unit；范围：source Type and independent metadata universe parameters preserved; fixed external predicate/key/index parameters retained

```lean
∀ (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.pred A) (x : Rocq.Corelib.ssr.ssrbool.applicative_mem_pred A p),
  (NativeBridge.Incremental.SSRBoolPackaging.manifestMemIso A p).to
      (Rocq.Corelib.ssr.ssrbool.applicative_mem_pred_value A p x) =
    id ((NativeBridge.Incremental.SSRBoolPackaging.applicativeMemIso A p).to x)
```

公理闭包：空

## Corelib.ssr.ssrbool.has_quality

NativeBridge.Incremental.SSRBoolPackaging.has_quality_agrees

目标：native predicate projection；范围：source Type and independent metadata universe parameters preserved; fixed external predicate/key/index parameters retained

```lean
∀ (n : Rocq.Corelib.Init.Datatypes.nat) (A : Type u) (x : Rocq.Corelib.ssr.ssrbool.qualifier n A),
  NativeBridge.Incremental.SSRBoolData.predTo (Rocq.Corelib.ssr.ssrbool.has_quality n A x) =
    (NativeBridge.Incremental.SSRBoolPackaging.qualifierIso n A).to x
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.unkey_pred

NativeBridge.Incremental.SSRBoolPackaging.unkey_pred_agrees

目标：constant native predicate specified by the parameter；范围：source Type and independent metadata universe parameters preserved; fixed external predicate/key/index parameters retained

```lean
∀ (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.pred A) (k : Rocq.Corelib.ssr.ssrbool.pred_key A p)
  (x : Rocq.Corelib.ssr.ssrbool.keyed_pred A p k),
  NativeBridge.Incremental.SSRBoolData.predTo (Rocq.Corelib.ssr.ssrbool.unkey_pred A p k x) =
    NativeBridge.Incremental.SSRBoolData.predTo p
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.unkey_qualifier

NativeBridge.Incremental.SSRBoolPackaging.unkey_qualifier_agrees

目标：constant native predicate specified by the qualifier parameter；范围：source Type and independent metadata universe parameters preserved; fixed external predicate/key/index parameters retained

```lean
∀ (A : Type u) (n : Rocq.Corelib.Init.Datatypes.nat) (q : Rocq.Corelib.ssr.ssrbool.qualifier n A)
  (k : Rocq.Corelib.ssr.ssrbool.pred_key A (Rocq.Corelib.ssr.ssrbool.has_quality n A q))
  (x : Rocq.Corelib.ssr.ssrbool.keyed_qualifier A n q k),
  (NativeBridge.Incremental.SSRBoolPackaging.qualifierIso n A).to (Rocq.Corelib.ssr.ssrbool.unkey_qualifier A n q k x) =
    (NativeBridge.Incremental.SSRBoolPackaging.qualifierIso n A).to q
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.eq_mem

NativeBridge.Incremental.SSRBoolPackaging.eq_mem_agrees

目标：native function equality；范围：source Type and independent metadata universe parameters preserved; fixed external predicate/key/index parameters retained

```lean
∀ (A : Type u) (p q : Rocq.Corelib.ssr.ssrbool.mem_pred A),
  Rocq.Corelib.ssr.ssrbool.eq_mem A p q ↔
    (NativeBridge.Incremental.SSRBoolData.memIso A).to p = (NativeBridge.Incremental.SSRBoolData.memIso A).to q
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.sub_mem

NativeBridge.Incremental.SSRBoolPackaging.sub_mem_agrees

目标：∀ x, p x = true → q x = true；范围：source Type and independent metadata universe parameters preserved; fixed external predicate/key/index parameters retained

```lean
∀ (A : Type u) (p q : Rocq.Corelib.ssr.ssrbool.mem_pred A),
  Rocq.Corelib.ssr.ssrbool.sub_mem A p q ↔
    ∀ (x : A),
      (NativeBridge.Incremental.SSRBoolData.memIso A).to p x = true →
        (NativeBridge.Incremental.SSRBoolData.memIso A).to q x = true
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.mem

NativeBridge.Incremental.SSRBoolPackaging.mem_agrees

目标：native Sigma interpretation function applied to its carrier element；范围：source Type and independent metadata universe parameters preserved; fixed external predicate/key/index parameters retained

```lean
∀ (A : Type v) (pT : NativeBridge.Incremental.SSRBoolData.nativePredType A) (p : pT.fst),
  (NativeBridge.Incremental.SSRBoolData.memIso A).to
      (Rocq.Corelib.ssr.ssrbool.mem A (NativeBridge.Incremental.SSRBoolData.predTypeOf A pT) p) =
    pT.snd p
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.if_arg

NativeBridge.Incremental.SSRBoolRemainingStatements.ifArgCorrespondence

目标：native Bool conditional applied to an argument；范围：full independent Sort parameters; separate original-statement proof

```lean
Rocq.Corelib.ssr.ssrbool.if_arg.statement ↔ NativeBridge.Incremental.SSRBoolRemainingStatements.nativeIfArg
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.locked

NativeBridge.Incremental.SSRBoolPackaging.locked_agrees

目标：id；范围：full Sort result parameter for locked; master_key remains opaque; proof uses the single-constructor unit type

```lean
∀ (A : Sort u) (x : A), Rocq.Corelib.ssr.ssreflect_rw.locked A x = id x
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.master_key

NativeBridge.Incremental.SSRBoolPackaging.master_key_agrees

目标：Unit.unit；范围：full Sort result parameter for locked; master_key remains opaque; proof uses the single-constructor unit type

```lean
NativeBridge.Incremental.SSRBoolPackaging.unitTo Rocq.Corelib.ssr.ssreflect_rw.master_key = ()
```

公理闭包：空

## Corelib.ssr.ssrbool.ApplicativePred

NativeBridge.Incremental.SSRBoolClosedOperations.ApplicativePred_agrees

目标：Unit constructor after singleton packaging Iso; native Bool/Nat inputs；范围：all prerequisites discharged; source universe parameters preserved; both source packaging carrier and native input conversions explicit

```lean
∀ (A : Type u) (p : A → Bool),
  (NativeBridge.Incremental.SSRBoolPackaging.registeredIso A (NativeBridge.Incremental.SSRBoolData.predOf p)).to
      (RocqPending.Corelib.ssr.ssrbool.ApplicativePred A (NativeBridge.Incremental.SSRBoolData.predOf p)) =
    ()
```

公理闭包：空

## Corelib.ssr.ssrbool.KeyedPred

NativeBridge.Incremental.SSRBoolClosedOperations.KeyedPred_agrees

目标：Unit constructor after singleton packaging Iso; native Bool/Nat inputs；范围：all prerequisites discharged; source universe parameters preserved; both source packaging carrier and native input conversions explicit

```lean
∀ (A : Type u) (p : A → Bool) (k : True),
  (NativeBridge.Incremental.SSRBoolPackaging.keyedPredIso A (NativeBridge.Incremental.SSRBoolData.predOf p) ⋯).to
      (RocqPending.Corelib.ssr.ssrbool.KeyedPred A (NativeBridge.Incremental.SSRBoolData.predOf p) ⋯) =
    ()
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.KeyedQualifier

NativeBridge.Incremental.SSRBoolClosedOperations.KeyedQualifier_agrees

目标：Unit constructor after singleton packaging Iso; native Bool/Nat inputs；范围：all prerequisites discharged; source universe parameters preserved; both source packaging carrier and native input conversions explicit

```lean
∀ (A : Type u) (n : Nat) (p : A → Bool) (k : True),
  (NativeBridge.Incremental.SSRBoolPackaging.keyedQualifierIso A (NativeBridge.natOf n)
          ((NativeBridge.Incremental.SSRBoolPackaging.qualifierIso (NativeBridge.natOf n) A).of p) ⋯).to
      (RocqPending.Corelib.ssr.ssrbool.KeyedQualifier A (NativeBridge.natOf n)
        ((NativeBridge.Incremental.SSRBoolPackaging.qualifierIso (NativeBridge.natOf n) A).of p) ⋯) =
    ()
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.DefaultKeying.default_keyed_pred

NativeBridge.Incremental.SSRBoolClosedOperations.default_keyed_pred_agrees

目标：Unit constructor after singleton packaging Iso; native Bool/Nat inputs；范围：all prerequisites discharged; source universe parameters preserved; both source packaging carrier and native input conversions explicit

```lean
∀ (A : Type u) (p : A → Bool),
  (NativeBridge.Incremental.SSRBoolPackaging.keyedPredIso A (NativeBridge.Incremental.SSRBoolData.predOf p) ⋯).to
      (RocqPending.Corelib.ssr.ssrbool.DefaultKeying.default_keyed_pred A
        (NativeBridge.Incremental.SSRBoolData.predOf p)) =
    ()
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.DefaultKeying.default_keyed_qualifier

NativeBridge.Incremental.SSRBoolClosedOperations.default_keyed_qualifier_agrees

目标：Unit constructor after singleton packaging Iso; native Bool/Nat inputs；范围：all prerequisites discharged; source universe parameters preserved; both source packaging carrier and native input conversions explicit

```lean
∀ (A : Type u) (n : Nat) (p : A → Bool),
  (NativeBridge.Incremental.SSRBoolPackaging.keyedQualifierIso A (NativeBridge.natOf n)
          ((NativeBridge.Incremental.SSRBoolPackaging.qualifierIso (NativeBridge.natOf n) A).of p) ⋯).to
      (RocqPending.Corelib.ssr.ssrbool.DefaultKeying.default_keyed_qualifier A (NativeBridge.natOf n)
        ((NativeBridge.Incremental.SSRBoolPackaging.qualifierIso (NativeBridge.natOf n) A).of p)) =
    ()
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.applicative_pred_applicative

NativeBridge.Incremental.SSRBoolClosedOperations.applicative_pred_applicative_agrees

目标：Unit constructor after singleton packaging Iso; native Bool/Nat inputs；范围：all prerequisites discharged; source universe parameters preserved; both source packaging carrier and native input conversions explicit

```lean
∀ (A : Type u) (p : A → Bool),
  (NativeBridge.Incremental.SSRBoolPackaging.registeredIso A
          (Rocq.Corelib.ssr.ssrbool.applicative_pred_of_simpl A
            ((NativeBridge.Incremental.SSRBoolData.simplPredIso A).of p))).to
      (RocqPending.Corelib.ssr.ssrbool.applicative_pred_applicative A
        ((NativeBridge.Incremental.SSRBoolData.simplPredIso A).of p)) =
    ()
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.expose_mem_pred

NativeBridge.Incremental.SSRBoolClosedOperations.expose_mem_pred_agrees

目标：Unit constructor after singleton packaging Iso; native Bool/Nat inputs；范围：all prerequisites discharged; source universe parameters preserved; both source packaging carrier and native input conversions explicit

```lean
∀ (A : Type u) (p : A → Bool),
  (NativeBridge.Incremental.SSRBoolPackaging.manifestMemIso A (NativeBridge.Incremental.SSRBoolData.predOf p)).to
      (RocqPending.Corelib.ssr.ssrbool.expose_mem_pred A (NativeBridge.Incremental.SSRBoolData.predOf p)) =
    ()
```

公理闭包：空

## Corelib.ssr.ssrbool.expose_simpl_pred

NativeBridge.Incremental.SSRBoolClosedOperations.expose_simpl_pred_agrees

目标：Unit constructor after singleton packaging Iso; native Bool/Nat inputs；范围：all prerequisites discharged; source universe parameters preserved; both source packaging carrier and native input conversions explicit

```lean
∀ (A : Type u) (p : A → Bool),
  (NativeBridge.Incremental.SSRBoolPackaging.manifestSimplIso A (NativeBridge.Incremental.SSRBoolData.predOf p)).to
      (RocqPending.Corelib.ssr.ssrbool.expose_simpl_pred A (NativeBridge.Incremental.SSRBoolData.predOf p)) =
    ()
```

公理闭包：空

## Corelib.ssr.ssrbool.bijective_in

NativeBridge.Incremental.SSRBoolClosedOperations.bijective_in_agrees

目标：native restricted inverse predicate (Exists/And/Eq)；范围：all prerequisites discharged; source universe parameters preserved; both source packaging carrier and native input conversions explicit

```lean
∀ (A : Type u) (B : Type v) (d : A → Bool) (f : A → B),
  RocqPending.Corelib.ssr.ssrbool.bijective_in A B ((NativeBridge.Incremental.SSRBoolData.memIso A).of d) f ↔
    ∃ g, (∀ (x : A), d x = true → g (f x) = x) ∧ ∀ (y : B), d (g y) = true → f (g y) = y
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.bijective_on

NativeBridge.Incremental.SSRBoolClosedOperations.bijective_on_agrees

目标：native restricted inverse predicate (Exists/And/Eq)；范围：all prerequisites discharged; source universe parameters preserved; both source packaging carrier and native input conversions explicit

```lean
∀ (A : Type u) (B : Type v) (d : B → Bool) (f : A → B),
  RocqPending.Corelib.ssr.ssrbool.bijective_on A B ((NativeBridge.Incremental.SSRBoolData.memIso B).of d) f ↔
    ∃ g, (∀ (x : A), d (f x) = true → g (f x) = x) ∧ ∀ (y : B), d y = true → f (g y) = y
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.addbP

NativeBridge.Incremental.SSRBoolReflection.addbP.correspondence

目标：native Boolean reflection proof；范围：native Bool/Prop inputs; reflect Iso and proof irrelevance; opaque source remains opaque

```lean
∀ (a b : Bool), ⋯ = ⋯
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.ssr.ssrbool.andP

NativeBridge.Incremental.SSRBoolReflection.andP.correspondence

目标：native Boolean reflection proof；范围：native Bool/Prop inputs; reflect Iso and proof irrelevance; opaque source remains opaque

```lean
∀ (a b : Bool), ⋯ = ⋯
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.ssr.ssrbool.and3P

NativeBridge.Incremental.SSRBoolReflection.and3P.correspondence

目标：native Boolean reflection proof；范围：native Bool/Prop inputs; reflect Iso and proof irrelevance; opaque source remains opaque

```lean
∀ (a b c : Bool), ⋯ = ⋯
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.ssr.ssrbool.and4P

NativeBridge.Incremental.SSRBoolReflection.and4P.correspondence

目标：native Boolean reflection proof；范围：native Bool/Prop inputs; reflect Iso and proof irrelevance; opaque source remains opaque

```lean
∀ (a b c d : Bool), ⋯ = ⋯
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.ssr.ssrbool.and5P

NativeBridge.Incremental.SSRBoolReflection.and5P.correspondence

目标：native Boolean reflection proof；范围：native Bool/Prop inputs; reflect Iso and proof irrelevance; opaque source remains opaque

```lean
∀ (a b c d e : Bool), ⋯ = ⋯
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.ssr.ssrbool.idP

NativeBridge.Incremental.SSRBoolReflection.idP.correspondence

目标：native Boolean reflection proof；范围：native Bool/Prop inputs; reflect Iso and proof irrelevance; opaque source remains opaque

```lean
∀ (a : Bool), ⋯ = ⋯
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.ssr.ssrbool.idPn

NativeBridge.Incremental.SSRBoolReflection.idPn.correspondence

目标：native Boolean reflection proof；范围：native Bool/Prop inputs; reflect Iso and proof irrelevance; opaque source remains opaque

```lean
∀ (a : Bool), ⋯ = ⋯
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.ssr.ssrbool.implyP

NativeBridge.Incremental.SSRBoolReflection.implyP.correspondence

目标：native Boolean reflection proof；范围：native Bool/Prop inputs; reflect Iso and proof irrelevance; opaque source remains opaque

```lean
∀ (a b : Bool), ⋯ = ⋯
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.ssr.ssrbool.nandP

NativeBridge.Incremental.SSRBoolReflection.nandP.correspondence

目标：native Boolean reflection proof；范围：native Bool/Prop inputs; reflect Iso and proof irrelevance; opaque source remains opaque

```lean
∀ (a b : Bool), ⋯ = ⋯
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.ssr.ssrbool.negP

NativeBridge.Incremental.SSRBoolReflection.negP.correspondence

目标：native Boolean reflection proof；范围：native Bool/Prop inputs; reflect Iso and proof irrelevance; opaque source remains opaque

```lean
∀ (a : Bool), ⋯ = ⋯
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.ssr.ssrbool.negPf

NativeBridge.Incremental.SSRBoolReflection.negPf.correspondence

目标：native Boolean reflection proof；范围：native Bool/Prop inputs; reflect Iso and proof irrelevance; opaque source remains opaque

```lean
∀ (a : Bool), ⋯ = ⋯
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.ssr.ssrbool.negPn

NativeBridge.Incremental.SSRBoolReflection.negPn.correspondence

目标：native Boolean reflection proof；范围：native Bool/Prop inputs; reflect Iso and proof irrelevance; opaque source remains opaque

```lean
∀ (a : Bool), ⋯ = ⋯
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.ssr.ssrbool.norP

NativeBridge.Incremental.SSRBoolReflection.norP.correspondence

目标：native Boolean reflection proof；范围：native Bool/Prop inputs; reflect Iso and proof irrelevance; opaque source remains opaque

```lean
∀ (a b : Bool), ⋯ = ⋯
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.ssr.ssrbool.orP

NativeBridge.Incremental.SSRBoolReflection.orP.correspondence

目标：native Boolean reflection proof；范围：native Bool/Prop inputs; reflect Iso and proof irrelevance; opaque source remains opaque

```lean
∀ (a b : Bool), ⋯ = ⋯
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.ssr.ssrbool.or3P

NativeBridge.Incremental.SSRBoolReflection.or3P.correspondence

目标：native Boolean reflection proof；范围：native Bool/Prop inputs; reflect Iso and proof irrelevance; opaque source remains opaque

```lean
∀ (a b c : Bool), ⋯ = ⋯
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.ssr.ssrbool.or4P

NativeBridge.Incremental.SSRBoolReflection.or4P.correspondence

目标：native Boolean reflection proof；范围：native Bool/Prop inputs; reflect Iso and proof irrelevance; opaque source remains opaque

```lean
∀ (a b c d : Bool), ⋯ = ⋯
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.ssr.ssrbool.andPP

NativeBridge.Incremental.SSRBoolReflection.andPP.correspondence

目标：native Boolean reflection proof；范围：native Bool/Prop inputs; reflect Iso and proof irrelevance; opaque source remains opaque

```lean
∀ (P Q : Prop) (p q : Bool) (hp : P ↔ p = true) (hq : Q ↔ q = true), ⋯ = ⋯
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.ssr.ssrbool.orPP

NativeBridge.Incremental.SSRBoolReflection.orPP.correspondence

目标：native Boolean reflection proof；范围：native Bool/Prop inputs; reflect Iso and proof irrelevance; opaque source remains opaque

```lean
∀ (P Q : Prop) (p q : Bool) (hp : P ↔ p = true) (hq : Q ↔ q = true), ⋯ = ⋯
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.ssr.ssrbool.implyPP

NativeBridge.Incremental.SSRBoolReflection.implyPP.correspondence

目标：native Boolean reflection proof；范围：native Bool/Prop inputs; reflect Iso and proof irrelevance; opaque source remains opaque

```lean
∀ (P Q : Prop) (p q : Bool) (hp : P ↔ p = true) (hq : Q ↔ q = true), ⋯ = ⋯
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.ssr.ssrbool.negPP

NativeBridge.Incremental.SSRBoolReflection.negPP.correspondence

目标：native Boolean reflection proof；范围：native Bool/Prop inputs; reflect Iso and proof irrelevance; opaque source remains opaque

```lean
∀ (P : Prop) (p : Bool) (hp : P ↔ p = true), ⋯ = ⋯
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.ssr.ssrbool.iffP

NativeBridge.Incremental.SSRBoolReflection.iffP.correspondence

目标：native Boolean reflection proof；范围：native Bool/Prop inputs; reflect Iso and proof irrelevance; opaque source remains opaque

```lean
∀ (P Q : Prop) (b : Bool) (hp : P ↔ b = true) (f : P → Q) (g : Q → P), ⋯ = ⋯
```

公理闭包：空

## Corelib.ssr.ssrbool.equivP

NativeBridge.Incremental.SSRBoolReflection.equivP.correspondence

目标：native Boolean reflection proof；范围：native Bool/Prop inputs; reflect Iso and proof irrelevance; opaque source remains opaque

```lean
∀ (P Q : Prop) (b : Bool) (hp : P ↔ b = true) (h : P ↔ Q), ⋯ = ⋯
```

公理闭包：propext

## Corelib.ssr.ssrbool.introP

NativeBridge.Incremental.SSRBoolReflection.introP.correspondence

目标：native Boolean reflection proof；范围：native Bool/Prop inputs; reflect Iso and proof irrelevance; opaque source remains opaque

```lean
∀ (Q : Prop) (b : Bool) (ht : b = true → Q) (hf : (!b) = true → ¬Q), ⋯ = ⋯
```

公理闭包：propext

## Corelib.ssr.ssrbool.all_and2

NativeBridge.Incremental.SSRBoolProofFunctions.all_and2_agrees

目标：native logical function / Decidable / singleton Unit identity；范围：source universe parameters preserved; native logical inputs and output conversions; keyed output carrier uses original diagonal universe

```lean
∀ (T : Sort u) (P1 P2 : T → Prop) (h : ∀ (x : T), P1 x ∧ P2 x), ⋯ = ⋯
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.ssr.ssrbool.all_and3

NativeBridge.Incremental.SSRBoolProofFunctions.all_and3_agrees

目标：native logical function / Decidable / singleton Unit identity；范围：source universe parameters preserved; native logical inputs and output conversions; keyed output carrier uses original diagonal universe

```lean
∀ (T : Sort u) (P1 P2 P3 : T → Prop) (h : ∀ (x : T), P1 x ∧ P2 x ∧ P3 x), ⋯ = ⋯
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.ssr.ssrbool.all_and4

NativeBridge.Incremental.SSRBoolProofFunctions.all_and4_agrees

目标：native logical function / Decidable / singleton Unit identity；范围：source universe parameters preserved; native logical inputs and output conversions; keyed output carrier uses original diagonal universe

```lean
∀ (T : Sort u) (P1 P2 P3 P4 : T → Prop) (h : ∀ (x : T), P1 x ∧ P2 x ∧ P3 x ∧ P4 x), ⋯ = ⋯
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.ssr.ssrbool.all_and5

NativeBridge.Incremental.SSRBoolProofFunctions.all_and5_agrees

目标：native logical function / Decidable / singleton Unit identity；范围：source universe parameters preserved; native logical inputs and output conversions; keyed output carrier uses original diagonal universe

```lean
∀ (T : Sort u) (P1 P2 P3 P4 P5 : T → Prop) (h : ∀ (x : T), P1 x ∧ P2 x ∧ P3 x ∧ P4 x ∧ P5 x), ⋯ = ⋯
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.ssr.ssrbool.unlessL

NativeBridge.Incremental.SSRBoolProofFunctions.unlessL_agrees

目标：native logical function / Decidable / singleton Unit identity；范围：source universe parameters preserved; native logical inputs and output conversions; keyed output carrier uses original diagonal universe

```lean
∀ (C : Sort u) (P : Sort v) (c : C), ⋯ = ⋯
```

公理闭包：空

## Corelib.ssr.ssrbool.unlessR

NativeBridge.Incremental.SSRBoolProofFunctions.unlessR_agrees

目标：native logical function / Decidable / singleton Unit identity；范围：source universe parameters preserved; native logical inputs and output conversions; keyed output carrier uses original diagonal universe

```lean
∀ (C : Sort u) (P : Sort v) (p : P), ⋯ = ⋯
```

公理闭包：空

## Corelib.ssr.ssrbool.unless_sym

NativeBridge.Incremental.SSRBoolProofFunctions.unless_sym_agrees

目标：native logical function / Decidable / singleton Unit identity；范围：source universe parameters preserved; native logical inputs and output conversions; keyed output carrier uses original diagonal universe

```lean
∀ (C : Sort u) (P : Sort v) (h : Nonempty C ∨ Nonempty P), ⋯ = ⋯
```

公理闭包：空

## Corelib.ssr.ssrbool.bind_unless

NativeBridge.Incremental.SSRBoolProofFunctions.bind_unless_agrees

目标：native logical function / Decidable / singleton Unit identity；范围：source universe parameters preserved; native logical inputs and output conversions; keyed output carrier uses original diagonal universe

```lean
∀ (C : Sort u) (P : Sort v) (Q : Sort w) (h : Nonempty C ∨ Nonempty P), ⋯ = ⋯
```

公理闭包：空

## Corelib.ssr.ssrbool.keyed_mem

NativeBridge.Incremental.SSRBoolProofFunctions.keyed_mem_agrees

目标：native logical function / Decidable / singleton Unit identity；范围：source universe parameters preserved; native logical inputs and output conversions; keyed output carrier uses original diagonal universe

```lean
∀ (A : Type u) (p : A → Bool) (k : True) (x : Unit),
  (NativeBridge.Incremental.SSRBoolPackaging.keyedPredIso A (NativeBridge.Incremental.SSRBoolData.predOf p) ⋯).to
      (RocqPending.Corelib.ssr.ssrbool.keyed_mem A (NativeBridge.Incremental.SSRBoolData.predOf p) ⋯
        ((NativeBridge.Incremental.SSRBoolPackaging.keyedPredIso A (NativeBridge.Incremental.SSRBoolData.predOf p) ⋯).of
          x)) =
    id x
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.keyed_mem_simpl

NativeBridge.Incremental.SSRBoolProofFunctions.keyed_mem_simpl_agrees

目标：native logical function / Decidable / singleton Unit identity；范围：source universe parameters preserved; native logical inputs and output conversions; keyed output carrier uses original diagonal universe

```lean
∀ (A : Type u) (p : A → Bool) (k : True) (x : Unit),
  (NativeBridge.Incremental.SSRBoolPackaging.keyedPredIso A (NativeBridge.Incremental.SSRBoolData.predOf p) ⋯).to
      (RocqPending.Corelib.ssr.ssrbool.keyed_mem_simpl A (NativeBridge.Incremental.SSRBoolData.predOf p) ⋯
        ((NativeBridge.Incremental.SSRBoolPackaging.keyedPredIso A (NativeBridge.Incremental.SSRBoolData.predOf p) ⋯).of
          x)) =
    id x
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.keyed_qualifier_keyed

NativeBridge.Incremental.SSRBoolProofFunctions.keyed_qualifier_keyed_agrees

目标：native logical function / Decidable / singleton Unit identity；范围：source universe parameters preserved; native logical inputs and output conversions; keyed output carrier uses original diagonal universe

```lean
∀ (A : Type u) (n : Nat) (p : A → Bool) (k : True) (x : Unit),
  (NativeBridge.Incremental.SSRBoolPackaging.keyedPredIso A (NativeBridge.Incremental.SSRBoolData.predOf p) ⋯).to
      (RocqPending.Corelib.ssr.ssrbool.keyed_qualifier_keyed A (NativeBridge.natOf n)
        ((NativeBridge.Incremental.SSRBoolPackaging.qualifierIso (NativeBridge.natOf n) A).of p) ⋯
        ((NativeBridge.Incremental.SSRBoolPackaging.keyedQualifierIso A (NativeBridge.natOf n)
              ((NativeBridge.Incremental.SSRBoolPackaging.qualifierIso (NativeBridge.natOf n) A).of p) ⋯).of
          x)) =
    id x
```

公理闭包：Quot.sound

## Corelib.ssr.ssrbool.decP

NativeBridge.Incremental.SSRBoolProofFunctions.decP_agrees

目标：native logical function / Decidable / singleton Unit identity；范围：source universe parameters preserved; native logical inputs and output conversions; keyed output carrier uses original diagonal universe

```lean
∀ (P : Prop) (b : Bool) (hp : P ↔ b = true),
  NativeBridge.Incremental.SSRBoolData.decidableTo P
      (RocqPending.Corelib.ssr.ssrbool.decP P (NativeBridge.boolOf b)
        (NativeBridge.Incremental.SSRBoolProofFunctions.reflectNativeOf P b hp)) =
    NativeBridge.Incremental.SSRBoolProofFunctions.decP_native P b hp
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.ssr.ssrbool.unless_contra

NativeBridge.Incremental.SSRBoolProofFunctions.unless_contra_agrees

目标：native logical function / Decidable / singleton Unit identity；范围：source universe parameters preserved; native logical inputs and output conversions; keyed output carrier uses original diagonal universe

```lean
∀ (b : Bool) (C : Sort u) (f : (!b) = true → C), ⋯ = ⋯
```

公理闭包：空

## Corelib.ssr.ssrbool.alt_spec

NativeBridge.Incremental.SSRBoolIndexed.altIso

目标：PLift of indexed native branch predicate altNative；范围：all Bool indices; if_spec preserves arbitrary Type u carrier and value index; both inverse laws checked

```lean
(P : Prop) →
  (b c : NativeBridge.RBool) →
    NativeBridge.Iso (Rocq.Corelib.ssr.ssrbool.alt_spec P b c)
      (PLift (NativeBridge.Incremental.SSRBoolIndexed.altNative P (NativeBridge.boolTo b) (NativeBridge.boolTo c)))
```

公理闭包：propext

## Corelib.ssr.ssrbool.if_spec

NativeBridge.Incremental.SSRBoolIndexed.ifIso

目标：PLift of indexed native branch predicate ifNative；范围：all Bool indices; if_spec preserves arbitrary Type u carrier and value index; both inverse laws checked

```lean
(A : Type u) →
  (b : NativeBridge.RBool) →
    (vT vF : A) →
      (notB : Prop) →
        (c : NativeBridge.RBool) →
          (x : A) →
            NativeBridge.Iso (Rocq.Corelib.ssr.ssrbool.if_spec A b vT vF notB c x)
              (PLift
                (NativeBridge.Incremental.SSRBoolIndexed.ifNative A (NativeBridge.boolTo b) vT vF notB
                  (NativeBridge.boolTo c) x))
```

公理闭包：空

## Corelib.ssr.ssrbool.altP

NativeBridge.Incremental.SSRBoolIndexed.altP_agrees

目标：independently constructed native indexed branch evidence altP_native；范围：all Bool inputs; arbitrary Type u carrier for ifP/ifPn; original opacity preserved, all source prerequisites discharged

```lean
∀ (P : Prop) (b : Bool) (h : P ↔ b = true),
  (NativeBridge.Incremental.SSRBoolIndexed.altIso P (NativeBridge.boolOf b) (NativeBridge.boolOf b)).to
      (RocqPending.Corelib.ssr.ssrbool.altP P (NativeBridge.boolOf b)
        (NativeBridge.Incremental.SSRBoolProofFunctions.reflectNativeOf P b h)) =
    have this := ⋯.mpr (NativeBridge.Incremental.SSRBoolIndexed.altP_native P b h);
    this
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.ssr.ssrbool.boolP

NativeBridge.Incremental.SSRBoolIndexed.boolP_agrees

目标：independently constructed native indexed branch evidence boolP_native；范围：all Bool inputs; arbitrary Type u carrier for ifP/ifPn; original opacity preserved, all source prerequisites discharged

```lean
∀ (b : Bool),
  NativeBridge.Incremental.SSRBoolIndexed.boolPTo b (RocqPending.Corelib.ssr.ssrbool.boolP (NativeBridge.boolOf b)) =
    NativeBridge.Incremental.SSRBoolIndexed.boolP_native b
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.ssr.ssrbool.ifP

NativeBridge.Incremental.SSRBoolIndexed.ifP_agrees

目标：independently constructed native indexed branch evidence ifP_native；范围：all Bool inputs; arbitrary Type u carrier for ifP/ifPn; original opacity preserved, all source prerequisites discharged

```lean
∀ (A : Type u) (b : Bool) (vT vF : A),
  NativeBridge.Incremental.SSRBoolIndexed.ifPTo A b vT vF
      (RocqPending.Corelib.ssr.ssrbool.ifP A (NativeBridge.boolOf b) vT vF) =
    NativeBridge.Incremental.SSRBoolIndexed.ifP_native A b vT vF
```

公理闭包：propext

## Corelib.ssr.ssrbool.ifPn

NativeBridge.Incremental.SSRBoolIndexed.ifPn_agrees

目标：independently constructed native indexed branch evidence ifPn_native；范围：all Bool inputs; arbitrary Type u carrier for ifP/ifPn; original opacity preserved, all source prerequisites discharged

```lean
∀ (A : Type u) (b : Bool) (vT vF : A),
  NativeBridge.Incremental.SSRBoolIndexed.ifPnTo A b vT vF
      (RocqPending.Corelib.ssr.ssrbool.ifPn A (NativeBridge.boolOf b) vT vF) =
    NativeBridge.Incremental.SSRBoolIndexed.ifPn_native A b vT vF
```

公理闭包：propext

## Corelib.ssr.ssrbool.is_left

NativeBridge.Incremental.SSRBoolRestrictions.is_left_agrees

目标：sumIsLeft；范围：source universes preserved; all phantom proof arguments allowed and erased by native expression; membership inputs converted through memIso; is_inleft covers Sort u; sumboolP preserves opacity

```lean
∀ (P Q : Prop) (x : P ⊕' Q),
  NativeBridge.boolTo (Rocq.Corelib.ssr.ssrbool.is_left P Q (NativeBridge.sumboolOf x)) =
    NativeBridge.Incremental.SSRBoolRestrictions.sumIsLeft P Q x
```

公理闭包：空

## Corelib.ssr.ssrbool.is_inleft

NativeBridge.Incremental.SSRBoolRestrictions.is_inleft_agrees

目标：sumIsLeft；范围：source universes preserved; all phantom proof arguments allowed and erased by native expression; membership inputs converted through memIso; is_inleft covers Sort u; sumboolP preserves opacity

```lean
∀ (A : Sort u) (P : Prop) (x : A ⊕' P),
  NativeBridge.boolTo
      (Rocq.Corelib.ssr.ssrbool.is_inleft A P (NativeBridge.Incremental.SSRBoolRestrictions.sumorSortOf x)) =
    NativeBridge.Incremental.SSRBoolRestrictions.sumIsLeft A P x
```

公理闭包：空

## Corelib.ssr.ssrbool.prop_for

NativeBridge.Incremental.SSRBoolRestrictions.prop_for_agrees

目标：prop_for_native；范围：source universes preserved; all phantom proof arguments allowed and erased by native expression; membership inputs converted through memIso; is_inleft covers Sort u; sumboolP preserves opacity

```lean
∀ (A : Sort u) (x : A) (P : A → Prop) (ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (a : A), P a)),
  Rocq.Corelib.ssr.ssrbool.prop_for A x P ph ↔ NativeBridge.Incremental.SSRBoolRestrictions.prop_for_native A x P
```

公理闭包：空

## Corelib.ssr.ssrbool.prop_in1

NativeBridge.Incremental.SSRBoolRestrictions.prop_in1_agrees

目标：prop_in1_native；范围：source universes preserved; all phantom proof arguments allowed and erased by native expression; membership inputs converted through memIso; is_inleft covers Sort u; sumboolP preserves opacity

```lean
∀ (T1 : Type u) (d1 : T1 → Bool) (P : T1 → Prop) (ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x : T1), P x)),
  Rocq.Corelib.ssr.ssrbool.prop_in1 T1 ((NativeBridge.Incremental.SSRBoolData.memIso T1).of d1) P ph ↔
    NativeBridge.Incremental.SSRBoolRestrictions.prop_in1_native T1 d1 P
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.prop_in11

NativeBridge.Incremental.SSRBoolRestrictions.prop_in11_agrees

目标：prop_in11_native；范围：source universes preserved; all phantom proof arguments allowed and erased by native expression; membership inputs converted through memIso; is_inleft covers Sort u; sumboolP preserves opacity

```lean
∀ (T1 : Type u) (T2 : Type v) (d1 : T1 → Bool) (d2 : T2 → Bool) (P : T1 → T2 → Prop)
  (ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x : T1) (y : T2), P x y)),
  Rocq.Corelib.ssr.ssrbool.prop_in11 T1 T2 ((NativeBridge.Incremental.SSRBoolData.memIso T1).of d1)
      ((NativeBridge.Incremental.SSRBoolData.memIso T2).of d2) P ph ↔
    NativeBridge.Incremental.SSRBoolRestrictions.prop_in11_native T1 T2 d1 d2 P
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.prop_in111

NativeBridge.Incremental.SSRBoolRestrictions.prop_in111_agrees

目标：prop_in111_native；范围：source universes preserved; all phantom proof arguments allowed and erased by native expression; membership inputs converted through memIso; is_inleft covers Sort u; sumboolP preserves opacity

```lean
∀ (T1 : Type u) (T2 : Type v) (T3 : Type w) (d1 : T1 → Bool) (d2 : T2 → Bool) (d3 : T3 → Bool) (P : T1 → T2 → T3 → Prop)
  (ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x : T1) (y : T2) (z : T3), P x y z)),
  Rocq.Corelib.ssr.ssrbool.prop_in111 T1 T2 T3 ((NativeBridge.Incremental.SSRBoolData.memIso T1).of d1)
      ((NativeBridge.Incremental.SSRBoolData.memIso T2).of d2) ((NativeBridge.Incremental.SSRBoolData.memIso T3).of d3)
      P ph ↔
    NativeBridge.Incremental.SSRBoolRestrictions.prop_in111_native T1 T2 T3 d1 d2 d3 P
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.prop_in12

NativeBridge.Incremental.SSRBoolRestrictions.prop_in12_agrees

目标：prop_in12_native；范围：source universes preserved; all phantom proof arguments allowed and erased by native expression; membership inputs converted through memIso; is_inleft covers Sort u; sumboolP preserves opacity

```lean
∀ (T1 : Type u) (T2 : Type v) (d1 : T1 → Bool) (d2 : T2 → Bool) (P : T1 → T2 → T2 → Prop)
  (ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x : T1) (y z : T2), P x y z)),
  Rocq.Corelib.ssr.ssrbool.prop_in12 T1 T2 ((NativeBridge.Incremental.SSRBoolData.memIso T1).of d1)
      ((NativeBridge.Incremental.SSRBoolData.memIso T2).of d2) P ph ↔
    NativeBridge.Incremental.SSRBoolRestrictions.prop_in12_native T1 T2 d1 d2 P
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.prop_in2

NativeBridge.Incremental.SSRBoolRestrictions.prop_in2_agrees

目标：prop_in2_native；范围：source universes preserved; all phantom proof arguments allowed and erased by native expression; membership inputs converted through memIso; is_inleft covers Sort u; sumboolP preserves opacity

```lean
∀ (T1 : Type u) (d1 : T1 → Bool) (P : T1 → T1 → Prop)
  (ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x y : T1), P x y)),
  Rocq.Corelib.ssr.ssrbool.prop_in2 T1 ((NativeBridge.Incremental.SSRBoolData.memIso T1).of d1) P ph ↔
    NativeBridge.Incremental.SSRBoolRestrictions.prop_in2_native T1 d1 P
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.prop_in21

NativeBridge.Incremental.SSRBoolRestrictions.prop_in21_agrees

目标：prop_in21_native；范围：source universes preserved; all phantom proof arguments allowed and erased by native expression; membership inputs converted through memIso; is_inleft covers Sort u; sumboolP preserves opacity

```lean
∀ (T1 : Type u) (T2 : Type v) (d1 : T1 → Bool) (d2 : T2 → Bool) (P : T1 → T1 → T2 → Prop)
  (ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x y : T1) (z : T2), P x y z)),
  Rocq.Corelib.ssr.ssrbool.prop_in21 T1 T2 ((NativeBridge.Incremental.SSRBoolData.memIso T1).of d1)
      ((NativeBridge.Incremental.SSRBoolData.memIso T2).of d2) P ph ↔
    NativeBridge.Incremental.SSRBoolRestrictions.prop_in21_native T1 T2 d1 d2 P
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.prop_in3

NativeBridge.Incremental.SSRBoolRestrictions.prop_in3_agrees

目标：prop_in3_native；范围：source universes preserved; all phantom proof arguments allowed and erased by native expression; membership inputs converted through memIso; is_inleft covers Sort u; sumboolP preserves opacity

```lean
∀ (T1 : Type u) (d1 : T1 → Bool) (P : T1 → T1 → T1 → Prop)
  (ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x y z : T1), P x y z)),
  Rocq.Corelib.ssr.ssrbool.prop_in3 T1 ((NativeBridge.Incremental.SSRBoolData.memIso T1).of d1) P ph ↔
    NativeBridge.Incremental.SSRBoolRestrictions.prop_in3_native T1 d1 P
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.prop_on1

NativeBridge.Incremental.SSRBoolRestrictions.prop_on1_agrees

目标：prop_on1_native；范围：source universes preserved; all phantom proof arguments allowed and erased by native expression; membership inputs converted through memIso; is_inleft covers Sort u; sumboolP preserves opacity

```lean
∀ (A : Type u) (B : Type v) (C : Type w) (d : B → Bool) (f : A → B) (Pf : (A → B) → C) (P : A → Prop)
  (phf : Rocq.Corelib.ssr.ssreflect_rw.phantom C (Pf f))
  (ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x : A), P x)),
  Rocq.Corelib.ssr.ssrbool.prop_on1 A B C ((NativeBridge.Incremental.SSRBoolData.memIso B).of d) f Pf P phf ph ↔
    NativeBridge.Incremental.SSRBoolRestrictions.prop_on1_native A B d f P
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.prop_on2

NativeBridge.Incremental.SSRBoolRestrictions.prop_on2_agrees

目标：prop_on2_native；范围：source universes preserved; all phantom proof arguments allowed and erased by native expression; membership inputs converted through memIso; is_inleft covers Sort u; sumboolP preserves opacity

```lean
∀ (A : Type u) (B : Type v) (C : Type w) (d : B → Bool) (f : A → B) (Pf : (A → B) → C) (P : A → A → Prop)
  (phf : Rocq.Corelib.ssr.ssreflect_rw.phantom C (Pf f))
  (ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x y : A), P x y)),
  Rocq.Corelib.ssr.ssrbool.prop_on2 A B C ((NativeBridge.Incremental.SSRBoolData.memIso B).of d) f Pf P phf ph ↔
    NativeBridge.Incremental.SSRBoolRestrictions.prop_on2_native A B d f P
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.sumboolP

NativeBridge.Incremental.SSRBoolRestrictions.sumboolP_agrees

目标：sumboolP_native；范围：source universes preserved; all phantom proof arguments allowed and erased by native expression; membership inputs converted through memIso; is_inleft covers Sort u; sumboolP preserves opacity

```lean
∀ (P : Prop) (d : Decidable P), ⋯ = ⋯
```

公理闭包：propext

## Corelib.ssr.ssrbool.check_applicative_mem_pred

NativeBridge.Incremental.SSRBoolRestrictions.check_applicative_mem_pred_agrees

目标：unitIdentity；范围：source universes preserved; all phantom proof arguments allowed and erased by native expression; membership inputs converted through memIso; is_inleft covers Sort u; sumboolP preserves opacity

```lean
∀ (A : Type u) (p : A → Bool) (a x : Unit),
  (NativeBridge.Incremental.SSRBoolPackaging.applicativeMemIso A (NativeBridge.Incremental.SSRBoolData.predOf p)).to
      (Rocq.Corelib.ssr.ssrbool.check_applicative_mem_pred A (NativeBridge.Incremental.SSRBoolData.predOf p)
        ((NativeBridge.Incremental.SSRBoolPackaging.registeredIso A (NativeBridge.Incremental.SSRBoolData.predOf p)).of
          a)
        ((NativeBridge.Incremental.SSRBoolPackaging.manifestMemIso A (NativeBridge.Incremental.SSRBoolData.predOf p)).of
          x)) =
    NativeBridge.Incremental.SSRBoolRestrictions.unitIdentity x
```

公理闭包：空

## Corelib.BinNums.PosDef.Pos.iter

NativeBridge.Incremental.BinaryPower.positive_iter_agrees

目标：repeatNative；范围：arbitrary Sort carriers; transport version explicitly assumes step-function correspondence

```lean
∀ {A : Sort u} (f : A → A) (x : A) (p : NativeBridge.RPositive),
  Rocq.Corelib.BinNums.PosDef.Pos.iter A f x p =
    NativeBridge.Incremental.BinaryPower.repeatNative f (NativeBridge.positiveTo p) x
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.PosDef.Pos.iter

NativeBridge.Incremental.BinaryPower.positive_iter_transport

目标：repeatNative；范围：arbitrary Sort carriers; transport version explicitly assumes step-function correspondence

```lean
∀ {A : Sort u} {B : Sort v} (toB : A → B) (f : A → A) (g : B → B),
  (∀ (x : A), toB (f x) = g (toB x)) →
    ∀ (p : NativeBridge.RPositive) (x : A),
      toB (Rocq.Corelib.BinNums.PosDef.Pos.iter A f x p) =
        NativeBridge.Incremental.BinaryPower.repeatNative g (NativeBridge.positiveTo p) (toB x)
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.IntDef.Z.pow_pos

NativeBridge.Incremental.BinaryPower.z_pow_pos_agrees

目标：powPosNative；范围：all integer inputs; negative powers return zero; signed shifts preserve floor division and negative shift counts

```lean
∀ (z : NativeBridge.RIntBinary) (p : NativeBridge.RPositive),
  NativeBridge.binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.pow_pos z p) =
    NativeBridge.Incremental.BinaryPower.powPosNative (NativeBridge.binaryIntTo z) (NativeBridge.positiveTo p)
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.IntDef.Z.pow

NativeBridge.Incremental.BinaryPower.z_pow_agrees

目标：zPowNative；范围：all integer inputs; negative powers return zero; signed shifts preserve floor division and negative shift counts

```lean
∀ (x y : NativeBridge.RIntBinary),
  NativeBridge.binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.pow x y) =
    NativeBridge.Incremental.BinaryPower.zPowNative (NativeBridge.binaryIntTo x) (NativeBridge.binaryIntTo y)
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.IntDef.Z.even

NativeBridge.Incremental.BinaryPower.z_even_agrees

目标：evenNative；范围：all integer inputs; negative powers return zero; signed shifts preserve floor division and negative shift counts

```lean
∀ (z : NativeBridge.RIntBinary),
  NativeBridge.boolTo (Rocq.Corelib.BinNums.IntDef.Z.even z) =
    NativeBridge.Incremental.BinaryPower.evenNative (NativeBridge.binaryIntTo z)
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.IntDef.Z.shiftl

NativeBridge.Incremental.BinaryPower.z_shiftl_agrees

目标：shiftLeftNative；范围：all integer inputs; negative powers return zero; signed shifts preserve floor division and negative shift counts

```lean
∀ (x n : NativeBridge.RIntBinary),
  NativeBridge.binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.shiftl x n) =
    NativeBridge.Incremental.BinaryPower.shiftLeftNative (NativeBridge.binaryIntTo x) (NativeBridge.binaryIntTo n)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.IntDef.Z.shiftr

NativeBridge.Incremental.BinaryPower.z_shiftr_agrees

目标：shiftRightNative；范围：all integer inputs; negative powers return zero; signed shifts preserve floor division and negative shift counts

```lean
∀ (x n : NativeBridge.RIntBinary),
  NativeBridge.binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.shiftr x n) =
    NativeBridge.Incremental.BinaryPower.shiftRightNative (NativeBridge.binaryIntTo x) (NativeBridge.binaryIntTo n)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Init.Sumbool.bool_eq_ind

NativeBridge.Incremental.SumboolBridge.bool_eq_ind_agrees

目标：nativeBoolInd；范围：all source parameters; bool_eq_rec uses the exported Type-valued motive; sumbool_and/or allow arbitrary A B C D, not only complementary propositions

```lean
Rocq.Corelib.Init.Sumbool.bool_eq_ind.statement ↔ NativeBridge.Incremental.SumboolBridge.nativeBoolInd
```

公理闭包：空

## Corelib.Init.Sumbool.bool_eq_rec

NativeBridge.Incremental.SumboolBridge.bool_eq_rec_agrees

目标：nativeBoolRec；范围：all source parameters; bool_eq_rec uses the exported Type-valued motive; sumbool_and/or allow arbitrary A B C D, not only complementary propositions

```lean
∀ (b : Bool) (P : Bool → Type) (ht : b = true → P true) (hf : b = false → P false),
  (RocqPending.Corelib.Init.Sumbool.bool_eq_rec (NativeBridge.boolOf b) (fun r => P (NativeBridge.boolTo r))
      (fun h => ht ⋯) fun h => hf ⋯) =
    have this := ⋯.mpr (NativeBridge.Incremental.SumboolBridge.nativeBoolRec b P ht hf);
    this
```

公理闭包：空

## Corelib.Init.Sumbool.bool_of_sumbool

NativeBridge.Incremental.SumboolBridge.bool_of_sumbool_agrees

目标：nativeToBool；范围：all source parameters; bool_eq_rec uses the exported Type-valued motive; sumbool_and/or allow arbitrary A B C D, not only complementary propositions

```lean
∀ (A B : Prop) (x : A ⊕' B),
  NativeBridge.Incremental.SumboolBridge.boolSubtypeTo A B
      (Rocq.Corelib.Init.Sumbool.bool_of_sumbool A B (NativeBridge.sumboolOf x)) =
    NativeBridge.Incremental.SumboolBridge.nativeToBool A B x
```

公理闭包：空

## Corelib.Init.Sumbool.sumbool_and

NativeBridge.Incremental.SumboolBridge.sumbool_and_agrees

目标：nativeAnd；范围：all source parameters; bool_eq_rec uses the exported Type-valued motive; sumbool_and/or allow arbitrary A B C D, not only complementary propositions

```lean
∀ (A B C D : Prop) (x : A ⊕' B) (y : C ⊕' D),
  NativeBridge.Incremental.SumboolBridge.sumAndTo
      (RocqPending.Corelib.Init.Sumbool.sumbool_and A B C D (NativeBridge.sumboolOf x) (NativeBridge.sumboolOf y)) =
    NativeBridge.Incremental.SumboolBridge.nativeAnd A B C D x y
```

公理闭包：空

## Corelib.Init.Sumbool.sumbool_not

NativeBridge.Incremental.SumboolBridge.sumbool_not_agrees

目标：nativeNot；范围：all source parameters; bool_eq_rec uses the exported Type-valued motive; sumbool_and/or allow arbitrary A B C D, not only complementary propositions

```lean
∀ (A B : Prop) (x : A ⊕' B),
  NativeBridge.sumboolTo (Rocq.Corelib.Init.Sumbool.sumbool_not A B (NativeBridge.sumboolOf x)) =
    NativeBridge.Incremental.SumboolBridge.nativeNot A B x
```

公理闭包：空

## Corelib.Init.Sumbool.sumbool_of_bool

NativeBridge.Incremental.SumboolBridge.sumbool_of_bool_agrees

目标：nativeOfBool；范围：all source parameters; bool_eq_rec uses the exported Type-valued motive; sumbool_and/or allow arbitrary A B C D, not only complementary propositions

```lean
∀ (b : Bool),
  NativeBridge.Incremental.SumboolBridge.ofBoolTo b
      (RocqPending.Corelib.Init.Sumbool.sumbool_of_bool (NativeBridge.boolOf b)) =
    NativeBridge.Incremental.SumboolBridge.nativeOfBool b
```

公理闭包：空

## Corelib.Init.Sumbool.sumbool_or

NativeBridge.Incremental.SumboolBridge.sumbool_or_agrees

目标：nativeOr；范围：all source parameters; bool_eq_rec uses the exported Type-valued motive; sumbool_and/or allow arbitrary A B C D, not only complementary propositions

```lean
∀ (A B C D : Prop) (x : A ⊕' B) (y : C ⊕' D),
  NativeBridge.Incremental.SumboolBridge.sumOrTo
      (RocqPending.Corelib.Init.Sumbool.sumbool_or A B C D (NativeBridge.sumboolOf x) (NativeBridge.sumboolOf y)) =
    NativeBridge.Incremental.SumboolBridge.nativeOr A B C D x y
```

公理闭包：空

## Corelib.Classes.CRelationClasses.crelation

NativeBridge.Incremental.CRelationData.crelationIso

目标：relationNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
(A : Type u) →
  NativeBridge.Iso (Rocq.Corelib.Classes.CRelationClasses.crelation A)
    (NativeBridge.Incremental.CRelationData.relationNative A)
```

公理闭包：空

## Corelib.Classes.CRelationClasses.Reflexive

NativeBridge.Incremental.CRelationData.ReflexiveIso

目标：reflexiveNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
(A : Type u) →
  (R : A → A → Type v) →
    NativeBridge.Iso (Rocq.Corelib.Classes.CRelationClasses.Reflexive A R)
      (NativeBridge.Incremental.CRelationData.reflexiveNative A R)
```

公理闭包：空

## Corelib.Classes.CRelationClasses.Symmetric

NativeBridge.Incremental.CRelationData.SymmetricIso

目标：symmetricNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
(A : Type u) →
  (R : A → A → Type v) →
    NativeBridge.Iso (Rocq.Corelib.Classes.CRelationClasses.Symmetric A R)
      (NativeBridge.Incremental.CRelationData.symmetricNative A R)
```

公理闭包：空

## Corelib.Classes.CRelationClasses.Transitive

NativeBridge.Incremental.CRelationData.TransitiveIso

目标：transitiveNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
(A : Type u) →
  (R : A → A → Type v) →
    NativeBridge.Iso (Rocq.Corelib.Classes.CRelationClasses.Transitive A R)
      (NativeBridge.Incremental.CRelationData.transitiveNative A R)
```

公理闭包：空

## Corelib.Classes.CRelationClasses.subrelation

NativeBridge.Incremental.CRelationData.subrelationIso

目标：subrelationNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
(A : Type u) →
  (R : A → A → Type v) →
    (S : A → A → Type w) →
      NativeBridge.Iso (Rocq.Corelib.Classes.CRelationClasses.subrelation A R S)
        (NativeBridge.Incremental.CRelationData.subrelationNative A R S)
```

公理闭包：空

## Corelib.Classes.CRelationClasses.arrow

NativeBridge.Incremental.CRelationData.arrowIso

目标：arrowNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
(A : Type u) →
  (B : Type v) →
    NativeBridge.Iso (Rocq.Corelib.Classes.CRelationClasses.arrow A B)
      (NativeBridge.Incremental.CRelationData.arrowNative A B)
```

公理闭包：空

## Corelib.Classes.CRelationClasses.PreOrder

NativeBridge.Incremental.CRelationData.PreOrderIso

目标：preorderNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
(A : Type u) →
  (R : A → A → Type v) →
    NativeBridge.Iso (Rocq.Corelib.Classes.CRelationClasses.PreOrder A R)
      (NativeBridge.Incremental.CRelationData.preorderNative A R)
```

公理闭包：空

## Corelib.Classes.CRelationClasses.PER

NativeBridge.Incremental.CRelationData.PERIso

目标：perNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
(A : Type u) →
  (R : A → A → Type v) →
    NativeBridge.Iso (Rocq.Corelib.Classes.CRelationClasses.PER A R)
      (NativeBridge.Incremental.CRelationData.perNative A R)
```

公理闭包：空

## Corelib.Classes.CRelationClasses.Equivalence

NativeBridge.Incremental.CRelationData.EquivalenceIso

目标：equivalenceNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
(A : Type u) →
  (R : A → A → Type v) →
    NativeBridge.Iso (Rocq.Corelib.Classes.CRelationClasses.Equivalence A R)
      (NativeBridge.Incremental.CRelationData.equivalenceNative A R)
```

公理闭包：空

## Corelib.Classes.CRelationClasses.iffT

NativeBridge.Incremental.CRelationData.iffTIso

目标：iffNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
(A : Type u) →
  (B : Type v) →
    NativeBridge.Iso (Rocq.Corelib.Classes.CRelationClasses.iffT A B)
      (NativeBridge.Incremental.CRelationData.iffNative A B)
```

公理闭包：空

## Corelib.Classes.CRelationClasses.relation_conjunction

NativeBridge.Incremental.CRelationData.conjunctionIso

目标：conjunctionNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
(A : Type u) →
  (R : A → A → Type v) →
    (S : A → A → Type w) →
      (x y : A) →
        NativeBridge.Iso (Rocq.Corelib.Classes.CRelationClasses.relation_conjunction A R S x y)
          (NativeBridge.Incremental.CRelationData.conjunctionNative A R S x y)
```

公理闭包：空

## Corelib.Classes.CRelationClasses.relation_disjunction

NativeBridge.Incremental.CRelationData.disjunctionIso

目标：disjunctionNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
(A : Type u) →
  (R : A → A → Type v) →
    (S : A → A → Type w) →
      (x y : A) →
        NativeBridge.Iso (Rocq.Corelib.Classes.CRelationClasses.relation_disjunction A R S x y)
          (NativeBridge.Incremental.CRelationData.disjunctionNative A R S x y)
```

公理闭包：空

## Corelib.Classes.CRelationClasses.Antisymmetric

NativeBridge.Incremental.CRelationData.antisymmetricIso

目标：antisymmetricNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
(A : Type u) →
  (E : A → A → Type v) →
    (equ : NativeBridge.Incremental.CRelationData.equivalenceNative A E) →
      (R : A → A → Type w) →
        NativeBridge.Iso
          (Rocq.Corelib.Classes.CRelationClasses.Antisymmetric A E
            ((NativeBridge.Incremental.CRelationData.EquivalenceIso A E).of equ) R)
          (NativeBridge.Incremental.CRelationData.antisymmetricNative A E R)
```

公理闭包：空

## Corelib.Classes.CRelationClasses.relation_equivalence

NativeBridge.Incremental.CRelationData.relationEquivalenceIso

目标：relationEquivalenceNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
(A : Type u) →
  (R S : A → A → Type v) →
    NativeBridge.Iso (Rocq.Corelib.Classes.CRelationClasses.relation_equivalence A R S)
      (NativeBridge.Incremental.CRelationData.relationEquivalenceNative A R S)
```

公理闭包：Quot.sound

## Corelib.Classes.CRelationClasses.RewriteRelation

NativeBridge.Incremental.CRelationData.rewriteIso

目标：rewriteNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
(A : Type u) →
  (R : A → A → Type v) →
    NativeBridge.Iso (Rocq.Corelib.Classes.CRelationClasses.RewriteRelation A R)
      (NativeBridge.Incremental.CRelationData.rewriteNative A R)
```

公理闭包：空

## Corelib.Classes.CRelationClasses.complement

NativeBridge.Incremental.CRelationData.complementIso

目标：complementNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
(A : Type u) →
  (R : A → A → Type v) →
    (x y : A) →
      NativeBridge.Iso (Rocq.Corelib.Classes.CRelationClasses.complement A R x y)
        (NativeBridge.Incremental.CRelationData.complementNative A R x y)
```

公理闭包：空

## Corelib.Classes.CRelationClasses.Irreflexive

NativeBridge.Incremental.CRelationData.irreflexiveIso

目标：irreflexiveNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
(A : Type u) →
  (R : A → A → Type v) →
    NativeBridge.Iso (Rocq.Corelib.Classes.CRelationClasses.Irreflexive A R)
      (NativeBridge.Incremental.CRelationData.irreflexiveNative A R)
```

公理闭包：Quot.sound

## Corelib.Classes.CRelationClasses.Asymmetric

NativeBridge.Incremental.CRelationData.asymmetricIso

目标：asymmetricNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
(A : Type u) →
  (R : A → A → Type v) →
    NativeBridge.Iso (Rocq.Corelib.Classes.CRelationClasses.Asymmetric A R)
      (NativeBridge.Incremental.CRelationData.asymmetricNative A R)
```

公理闭包：Quot.sound

## Corelib.Classes.CRelationClasses.PreOrder_Reflexive

NativeBridge.Incremental.CRelationData.PreOrder_Reflexive_agrees

目标：PreOrder_Reflexive_native；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
∀ (A : Type u) (R : A → A → Type v) (h : NativeBridge.Incremental.CRelationData.preorderNative A R),
  Rocq.Corelib.Classes.CRelationClasses.PreOrder_Reflexive A R
      ((NativeBridge.Incremental.CRelationData.PreOrderIso A R).of h) =
    NativeBridge.Incremental.CRelationData.PreOrder_Reflexive_native A R h
```

公理闭包：空

## Corelib.Classes.CRelationClasses.PreOrder_Transitive

NativeBridge.Incremental.CRelationData.PreOrder_Transitive_agrees

目标：PreOrder_Transitive_native；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
∀ (A : Type u) (R : A → A → Type v) (h : NativeBridge.Incremental.CRelationData.preorderNative A R),
  Rocq.Corelib.Classes.CRelationClasses.PreOrder_Transitive A R
      ((NativeBridge.Incremental.CRelationData.PreOrderIso A R).of h) =
    NativeBridge.Incremental.CRelationData.PreOrder_Transitive_native A R h
```

公理闭包：空

## Corelib.Classes.CRelationClasses.PER_Symmetric

NativeBridge.Incremental.CRelationData.PER_Symmetric_agrees

目标：PER_Symmetric_native；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
∀ (A : Type u) (R : A → A → Type v) (h : NativeBridge.Incremental.CRelationData.perNative A R),
  Rocq.Corelib.Classes.CRelationClasses.PER_Symmetric A R ((NativeBridge.Incremental.CRelationData.PERIso A R).of h) =
    NativeBridge.Incremental.CRelationData.PER_Symmetric_native A R h
```

公理闭包：空

## Corelib.Classes.CRelationClasses.PER_Transitive

NativeBridge.Incremental.CRelationData.PER_Transitive_agrees

目标：PER_Transitive_native；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
∀ (A : Type u) (R : A → A → Type v) (h : NativeBridge.Incremental.CRelationData.perNative A R),
  Rocq.Corelib.Classes.CRelationClasses.PER_Transitive A R ((NativeBridge.Incremental.CRelationData.PERIso A R).of h) =
    NativeBridge.Incremental.CRelationData.PER_Transitive_native A R h
```

公理闭包：空

## Corelib.Classes.CRelationClasses.Equivalence_Reflexive

NativeBridge.Incremental.CRelationData.Equivalence_Reflexive_agrees

目标：Equivalence_Reflexive_native；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
∀ (A : Type u) (R : A → A → Type v) (h : NativeBridge.Incremental.CRelationData.equivalenceNative A R),
  Rocq.Corelib.Classes.CRelationClasses.Equivalence_Reflexive A R
      ((NativeBridge.Incremental.CRelationData.EquivalenceIso A R).of h) =
    NativeBridge.Incremental.CRelationData.Equivalence_Reflexive_native A R h
```

公理闭包：空

## Corelib.Classes.CRelationClasses.Equivalence_Symmetric

NativeBridge.Incremental.CRelationData.Equivalence_Symmetric_agrees

目标：Equivalence_Symmetric_native；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
∀ (A : Type u) (R : A → A → Type v) (h : NativeBridge.Incremental.CRelationData.equivalenceNative A R),
  Rocq.Corelib.Classes.CRelationClasses.Equivalence_Symmetric A R
      ((NativeBridge.Incremental.CRelationData.EquivalenceIso A R).of h) =
    NativeBridge.Incremental.CRelationData.Equivalence_Symmetric_native A R h
```

公理闭包：空

## Corelib.Classes.CRelationClasses.Equivalence_Transitive

NativeBridge.Incremental.CRelationData.Equivalence_Transitive_agrees

目标：Equivalence_Transitive_native；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
∀ (A : Type u) (R : A → A → Type v) (h : NativeBridge.Incremental.CRelationData.equivalenceNative A R),
  Rocq.Corelib.Classes.CRelationClasses.Equivalence_Transitive A R
      ((NativeBridge.Incremental.CRelationData.EquivalenceIso A R).of h) =
    NativeBridge.Incremental.CRelationData.Equivalence_Transitive_native A R h
```

公理闭包：空

## Corelib.Classes.CRelationClasses.Equivalence_PER

NativeBridge.Incremental.CRelationData.equivalence_PER_agrees

目标：equivalencePERNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
∀ (A : Type u) (R : A → A → Type v) (h : NativeBridge.Incremental.CRelationData.equivalenceNative A R),
  (NativeBridge.Incremental.CRelationData.PERIso A R).to
      (Rocq.Corelib.Classes.CRelationClasses.Equivalence_PER A R
        ((NativeBridge.Incremental.CRelationData.EquivalenceIso A R).of h)) =
    NativeBridge.Incremental.CRelationData.equivalencePERNative A R h
```

公理闭包：空

## Corelib.Classes.CRelationClasses.reflexivity

NativeBridge.Incremental.CRelationData.reflexivity_agrees

目标：reflexivityNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
∀ (A : Type u) (R : A → A → Type v) (h : NativeBridge.Incremental.CRelationData.reflexiveNative A R),
  Rocq.Corelib.Classes.CRelationClasses.reflexivity A R h =
    NativeBridge.Incremental.CRelationData.reflexivityNative A R h
```

公理闭包：空

## Corelib.Classes.CRelationClasses.symmetry

NativeBridge.Incremental.CRelationData.symmetry_agrees

目标：symmetryNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
∀ (A : Type u) (R : A → A → Type v) (h : NativeBridge.Incremental.CRelationData.symmetricNative A R),
  Rocq.Corelib.Classes.CRelationClasses.symmetry A R h = NativeBridge.Incremental.CRelationData.symmetryNative A R h
```

公理闭包：空

## Corelib.Classes.CRelationClasses.transitivity

NativeBridge.Incremental.CRelationData.transitivity_agrees

目标：transitivityNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
∀ (A : Type u) (R : A → A → Type v) (h : NativeBridge.Incremental.CRelationData.transitiveNative A R),
  Rocq.Corelib.Classes.CRelationClasses.transitivity A R h =
    NativeBridge.Incremental.CRelationData.transitivityNative A R h
```

公理闭包：空

## Corelib.Classes.CRelationClasses.is_subrelation

NativeBridge.Incremental.CRelationData.is_subrelation_agrees

目标：isSubrelationNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
∀ (A : Type u) (R : A → A → Type v) (S : A → A → Type w)
  (h : NativeBridge.Incremental.CRelationData.subrelationNative A R S),
  Rocq.Corelib.Classes.CRelationClasses.is_subrelation A R S h =
    NativeBridge.Incremental.CRelationData.isSubrelationNative A R S h
```

公理闭包：空

## Corelib.Classes.CRelationClasses.flip

NativeBridge.Incremental.CRelationData.flip_agrees

目标：flipNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
∀ (A : Type u) (B : Type v) (C : Type w) (f : A → B → C),
  Rocq.Corelib.Classes.CRelationClasses.flip A B C f = NativeBridge.Incremental.CRelationData.flipNative A B C f
```

公理闭包：空

## Corelib.Classes.CRelationClasses.iffT_Reflexive

NativeBridge.Incremental.CRelationData.iffT_Reflexive_agrees

目标：iffReflexiveNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
∀ (A : Type u),
  (NativeBridge.Incremental.CRelationData.iffTIso A A).to (Rocq.Corelib.Classes.CRelationClasses.iffT_Reflexive A) =
    NativeBridge.Incremental.CRelationData.iffReflexiveNative A
```

公理闭包：空

## Corelib.Classes.CRelationClasses.iffT_Symmetric

NativeBridge.Incremental.CRelationData.iffT_Symmetric_agrees

目标：iffSymmetricNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
∀ (A B : Type u) (h : NativeBridge.Incremental.CRelationData.iffNative A B),
  (NativeBridge.Incremental.CRelationData.iffTIso B A).to
      (Rocq.Corelib.Classes.CRelationClasses.iffT_Symmetric A B
        ((NativeBridge.Incremental.CRelationData.iffTIso A B).of h)) =
    NativeBridge.Incremental.CRelationData.iffSymmetricNative A B h
```

公理闭包：空

## Corelib.Classes.CRelationClasses.iffT_Transitive

NativeBridge.Incremental.CRelationData.iffT_Transitive_agrees

目标：iffTransitiveNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
∀ (A B C : Type u) (h : NativeBridge.Incremental.CRelationData.iffNative A B)
  (k : NativeBridge.Incremental.CRelationData.iffNative B C),
  (NativeBridge.Incremental.CRelationData.iffTIso A C).to
      (Rocq.Corelib.Classes.CRelationClasses.iffT_Transitive A B C
        ((NativeBridge.Incremental.CRelationData.iffTIso A B).of h)
        ((NativeBridge.Incremental.CRelationData.iffTIso B C).of k)) =
    NativeBridge.Incremental.CRelationData.iffTransitiveNative A B C h k
```

公理闭包：空

## Corelib.Classes.CRelationClasses.arrow_Reflexive

NativeBridge.Incremental.CRelationData.arrow_Reflexive_agrees

目标：arrowReflexiveNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
∀ (A : Type u),
  Rocq.Corelib.Classes.CRelationClasses.arrow_Reflexive A =
    NativeBridge.Incremental.CRelationData.arrowReflexiveNative A
```

公理闭包：空

## Corelib.Classes.CRelationClasses.arrow_Transitive

NativeBridge.Incremental.CRelationData.arrow_Transitive_agrees

目标：arrowTransitiveNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
∀ (A B C : Type u) (f : A → B) (g : B → C),
  Rocq.Corelib.Classes.CRelationClasses.arrow_Transitive A B C f g =
    NativeBridge.Incremental.CRelationData.arrowTransitiveNative A B C f g
```

公理闭包：空

## Corelib.Classes.CRelationClasses.arrow_Reflexive_obligation_1

NativeBridge.Incremental.CRelationData.arrow_Reflexive_obligation_1_agrees

目标：arrowReflexiveNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
∀ (A : Type u),
  Rocq.Corelib.Classes.CRelationClasses.arrow_Reflexive_obligation_1 A =
    NativeBridge.Incremental.CRelationData.arrowReflexiveNative A
```

公理闭包：空

## Corelib.Classes.CRelationClasses.arrow_Transitive_obligation_1

NativeBridge.Incremental.CRelationData.arrow_Transitive_obligation_1_agrees

目标：arrowTransitiveNative；范围：Type-valued relations preserve witness data; source lift and phantom universes explicitly retained where present; iffT is two functions without inverse laws, not Equiv

```lean
∀ (A B C : Type u) (f : A → B) (g : B → C),
  Rocq.Corelib.Classes.CRelationClasses.arrow_Transitive_obligation_1 A B C f g =
    NativeBridge.Incremental.CRelationData.arrowTransitiveNative A B C f g
```

公理闭包：空

## Corelib.Classes.CRelationClasses.StrictOrder

NativeBridge.Incremental.CRelationStatements.strictOrderIso

目标：PLift of irreflexivity paired with a transitivity function；范围：all carrier/relation universes; transitivity witness data preserved

```lean
(A : Type u) →
  (R : A → A → Type v) →
    NativeBridge.Iso (Rocq.Corelib.Classes.CRelationClasses.StrictOrder A R)
      (NativeBridge.Incremental.CRelationStatements.strictOrderNative A R)
```

公理闭包：Quot.sound

## Corelib.Classes.CRelationClasses.StrictOrder_Transitive

NativeBridge.Incremental.CRelationStatements.strictTransitive_agrees

目标：second projection from native strict order representation；范围：all carrier/relation universes; arbitrary native strict-order witnesses

```lean
∀ (A : Type u) (R : A → A → Type v) (h : NativeBridge.Incremental.CRelationStatements.strictOrderNative A R),
  Rocq.Corelib.Classes.CRelationClasses.StrictOrder_Transitive A R
      ((NativeBridge.Incremental.CRelationStatements.strictOrderIso A R).of h) =
    NativeBridge.Incremental.CRelationStatements.strictTransitiveNative A R h
```

公理闭包：Quot.sound

## Corelib.Classes.CRelationClasses.RewriteRelation_instance_0

NativeBridge.Incremental.CRelationStatements.RewriteRelation_instance_0_agrees

目标：True；范围：original carrier and relation universe levels preserved explicitly; independently checked native and original statement proofs

```lean
Rocq.Corelib.Classes.CRelationClasses.RewriteRelation_instance_0.statement ↔
  NativeBridge.Incremental.CRelationStatements.markerNative
```

公理闭包：空

## Corelib.Classes.CRelationClasses.RewriteRelation_instance_1

NativeBridge.Incremental.CRelationStatements.RewriteRelation_instance_1_agrees

目标：True；范围：original carrier and relation universe levels preserved explicitly; independently checked native and original statement proofs

```lean
Rocq.Corelib.Classes.CRelationClasses.RewriteRelation_instance_1.statement ↔
  NativeBridge.Incremental.CRelationStatements.markerNative
```

公理闭包：空

## Corelib.Classes.CRelationClasses.RewriteRelation_instance_2

NativeBridge.Incremental.CRelationStatements.RewriteRelation_instance_2_agrees

目标：∀ (A : Type u), True；范围：original carrier and relation universe levels preserved explicitly; independently checked native and original statement proofs

```lean
Rocq.Corelib.Classes.CRelationClasses.RewriteRelation_instance_2.statement ↔
  NativeBridge.Incremental.CRelationStatements.rewriteRelationsNative
```

公理闭包：空

## Corelib.Classes.CRelationClasses.StrictOrder_Asymmetric

NativeBridge.Incremental.CRelationStatements.StrictOrder_Asymmetric_agrees

目标：∀ (A : Type u) (R : A → A → Type w) (h : strictOrderNative A R), asymmetricNative A R；范围：original carrier and relation universe levels preserved explicitly; independently checked native and original statement proofs

```lean
Rocq.Corelib.Classes.CRelationClasses.StrictOrder_Asymmetric.statement ↔
  NativeBridge.Incremental.CRelationStatements.strictAsymmetricNative
```

公理闭包：空

## Corelib.Classes.CRelationClasses.StrictOrder_Irreflexive

NativeBridge.Incremental.CRelationStatements.StrictOrder_Irreflexive_agrees

目标：∀ (A : Type u) (R : A → A → Type v) (h : strictOrderNative A R), irreflexiveNative A R；范围：original carrier and relation universe levels preserved explicitly; independently checked native and original statement proofs

```lean
Rocq.Corelib.Classes.CRelationClasses.StrictOrder_Irreflexive.statement ↔
  NativeBridge.Incremental.CRelationStatements.strictIrreflexiveNative
```

公理闭包：空

## Corelib.Classes.CRelationClasses.asymmetry

NativeBridge.Incremental.CRelationStatements.asymmetry_agrees

目标：∀ (A : Type u) (R : A → A → Type w) (h : asymmetricNative A R), asymmetricNative A R；范围：original carrier and relation universe levels preserved explicitly; independently checked native and original statement proofs

```lean
Rocq.Corelib.Classes.CRelationClasses.asymmetry.statement ↔ NativeBridge.Incremental.CRelationStatements.asymmetryNative
```

公理闭包：空

## Corelib.Classes.CRelationClasses.complement_Irreflexive

NativeBridge.Incremental.CRelationStatements.complement_Irreflexive_agrees

目标：∀ (A : Type u) (R : A → A → Type v) (h : reflexiveNative A R) (x : A), (R x x → False) → False；范围：original carrier and relation universe levels preserved explicitly; independently checked native and original statement proofs

```lean
Rocq.Corelib.Classes.CRelationClasses.complement_Irreflexive.statement ↔
  NativeBridge.Incremental.CRelationStatements.complementIrreflexiveNative
```

公理闭包：空

## Corelib.Classes.CRelationClasses.complement_Symmetric

NativeBridge.Incremental.CRelationStatements.complement_Symmetric_agrees

目标：∀ (A : Type u) (R : A → A → Type v) (h : symmetricNative A R) (x y : A), (R x y → False) → R y x → False；范围：original carrier and relation universe levels preserved explicitly; independently checked native and original statement proofs

```lean
Rocq.Corelib.Classes.CRelationClasses.complement_Symmetric.statement ↔
  NativeBridge.Incremental.CRelationStatements.complementSymmetricNative
```

公理闭包：空

## Corelib.Classes.CRelationClasses.equivalence_rewrite_crelation

NativeBridge.Incremental.CRelationStatements.equivalence_rewrite_crelation_agrees

目标：∀ (A : Type u) (R : A → A → Type v) (h : equivalenceNative A R), True；范围：original carrier and relation universe levels preserved explicitly; independently checked native and original statement proofs

```lean
Rocq.Corelib.Classes.CRelationClasses.equivalence_rewrite_crelation.statement ↔
  NativeBridge.Incremental.CRelationStatements.equivalenceRewriteNative
```

公理闭包：空

## Corelib.Classes.CRelationClasses.flip_Asymmetric

NativeBridge.Incremental.CRelationStatements.flip_Asymmetric_agrees

目标：∀ (A : Type u) (R : A → A → Type z), asymmetricNative A R → asymmetricNative A (fun x y => R y x)；范围：original carrier and relation universe levels preserved explicitly; independently checked native and original statement proofs

```lean
Rocq.Corelib.Classes.CRelationClasses.flip_Asymmetric.statement ↔
  NativeBridge.Incremental.CRelationStatements.flipAsymmetricNative
```

公理闭包：空

## Corelib.Classes.CRelationClasses.impl_Reflexive

NativeBridge.Incremental.CRelationStatements.impl_Reflexive_agrees

目标：∀ P : Prop, P → P；范围：original carrier and relation universe levels preserved explicitly; independently checked native and original statement proofs

```lean
Rocq.Corelib.Classes.CRelationClasses.impl_Reflexive.statement ↔
  NativeBridge.Incremental.CRelationStatements.implReflexiveNative
```

公理闭包：空

## Corelib.Classes.CRelationClasses.impl_Reflexive_obligation_1

NativeBridge.Incremental.CRelationStatements.impl_Reflexive_obligation_1_agrees

目标：∀ P : Prop, P → P；范围：original carrier and relation universe levels preserved explicitly; independently checked native and original statement proofs

```lean
Rocq.Corelib.Classes.CRelationClasses.impl_Reflexive_obligation_1.statement ↔
  NativeBridge.Incremental.CRelationStatements.implReflexiveNative
```

公理闭包：空

## Corelib.Classes.CRelationClasses.impl_Transitive

NativeBridge.Incremental.CRelationStatements.impl_Transitive_agrees

目标：∀ P Q R : Prop, (P → Q) → (Q → R) → P → R；范围：original carrier and relation universe levels preserved explicitly; independently checked native and original statement proofs

```lean
Rocq.Corelib.Classes.CRelationClasses.impl_Transitive.statement ↔
  NativeBridge.Incremental.CRelationStatements.implTransitiveNative
```

公理闭包：空

## Corelib.Classes.CRelationClasses.impl_Transitive_obligation_1

NativeBridge.Incremental.CRelationStatements.impl_Transitive_obligation_1_agrees

目标：∀ P Q R : Prop, (P → Q) → (Q → R) → P → R；范围：original carrier and relation universe levels preserved explicitly; independently checked native and original statement proofs

```lean
Rocq.Corelib.Classes.CRelationClasses.impl_Transitive_obligation_1.statement ↔
  NativeBridge.Incremental.CRelationStatements.implTransitiveNative
```

公理闭包：空

## Corelib.Classes.CRelationClasses.irreflexivity

NativeBridge.Incremental.CRelationStatements.irreflexivity_agrees

目标：∀ (A : Type u) (R : A → A → Type v) (h : irreflexiveNative A R), irreflexiveNative A R；范围：original carrier and relation universe levels preserved explicitly; independently checked native and original statement proofs

```lean
Rocq.Corelib.Classes.CRelationClasses.irreflexivity.statement ↔
  NativeBridge.Incremental.CRelationStatements.irreflexivityNative
```

公理闭包：空

## Corelib.Classes.CRelationClasses.PartialOrder

NativeBridge.Incremental.CRelationOrder.partialOrderIso

目标：partialOrderNative；范围：All five exported universe parameters; arbitrary native equivalence/preorder witnesses; both evidence conversion functions preserved, not Lean PartialOrder.

```lean
(A : Type u) →
  (E R : A → A → Type v) →
    (equ : NativeBridge.Incremental.CRelationData.equivalenceNative A E) →
      (pre : NativeBridge.Incremental.CRelationData.preorderNative A R) →
        NativeBridge.Iso
          (Rocq.Corelib.Classes.CRelationClasses.PartialOrder A E
            ((NativeBridge.Incremental.CRelationData.EquivalenceIso A E).of equ) R
            ((NativeBridge.Incremental.CRelationData.PreOrderIso A R).of pre))
          (NativeBridge.Incremental.CRelationOrder.partialOrderNative A E R)
```

公理闭包：Quot.sound

## Corelib.Classes.CRelationClasses.antisymmetry

NativeBridge.Incremental.CRelationOrder.antisymmetry_agrees

目标：antisymmetryNative；范围：All carrier and two relation universes; arbitrary Type-valued result relation.

```lean
∀ (A : Type u) (E : A → A → Type v) (equ : NativeBridge.Incremental.CRelationData.equivalenceNative A E)
  (R : A → A → Type w) (h : NativeBridge.Incremental.CRelationData.antisymmetricNative A E R),
  Rocq.Corelib.Classes.CRelationClasses.antisymmetry A E
      ((NativeBridge.Incremental.CRelationData.EquivalenceIso A E).of equ) R h =
    NativeBridge.Incremental.CRelationOrder.antisymmetryNative A E R h
```

公理闭包：空

## Corelib.Classes.CRelationClasses.flip_Symmetric

NativeBridge.Incremental.CRelationOrder.flip_Symmetric_agrees

目标：flipSymmetricNative；范围：All exported universes; swap the two arguments of the supplied symmetry function.

```lean
∀ (A : Type u) (R : A → A → Type v) (h : NativeBridge.Incremental.CRelationData.symmetricNative A R),
  Rocq.Corelib.Classes.CRelationClasses.flip_Symmetric A R h =
    NativeBridge.Incremental.CRelationOrder.flipSymmetricNative A R h
```

公理闭包：空

## Corelib.Classes.CRelationClasses.flip_Transitive

NativeBridge.Incremental.CRelationOrder.flip_Transitive_agrees

目标：flipTransitiveNative；范围：All exported universes; reverse the three endpoints and swap the relation evidence arguments.

```lean
∀ (A : Type u) (R : A → A → Type v) (h : NativeBridge.Incremental.CRelationData.transitiveNative A R),
  Rocq.Corelib.Classes.CRelationClasses.flip_Transitive A R h =
    NativeBridge.Incremental.CRelationOrder.flipTransitiveNative A R h
```

公理闭包：空

## Corelib.Classes.CRelationClasses.partial_order_equivalence

NativeBridge.Incremental.CRelationOrder.partial_order_equivalence_agrees

目标：partialOrderEquivalenceNative；范围：All five exported universes; transport both function-valued fields in the source pointwise pair.

```lean
∀ (A : Type u) (E R : A → A → Type v) (equ : NativeBridge.Incremental.CRelationData.equivalenceNative A E)
  (pre : NativeBridge.Incremental.CRelationData.preorderNative A R)
  (h : NativeBridge.Incremental.CRelationOrder.partialOrderNative A E R),
  NativeBridge.Incremental.CRelationOrder.partialTo A E R
      (Rocq.Corelib.Classes.CRelationClasses.partial_order_equivalence A E
        ((NativeBridge.Incremental.CRelationData.EquivalenceIso A E).of equ) R
        ((NativeBridge.Incremental.CRelationData.PreOrderIso A R).of pre)
        (NativeBridge.Incremental.CRelationOrder.partialOf A E R h)) =
    NativeBridge.Incremental.CRelationOrder.partialOrderEquivalenceNative A E R h
```

公理闭包：空

## Corelib.Classes.CRelationClasses.eq_equivalence

NativeBridge.Incremental.CRelationOrder.eq_equivalence_agrees

目标：equalityEquivalenceNative；范围：All exported carrier universes; three prerequisites proved; inverse laws for conversion to Lean Equivalence Eq, mechanical eq remains unchanged.

```lean
∀ (A : Type u), ⋯ = ⋯
```

公理闭包：空

## Corelib.Classes.CRelationClasses.iff_equivalence

NativeBridge.Incremental.CRelationOrder.iff_equivalence_agrees

目标：iffEquivalenceNative；范围：All exported universes; source PULift Prop carrier transported to Prop; three prerequisites proved; inverse laws for conversion to Lean Equivalence Iff.

```lean
⋯ = NativeBridge.Incremental.CRelationOrder.iffEquivalenceNative
```

公理闭包：空

## Corelib.Classes.CMorphisms.Normalizes

NativeBridge.Incremental.CMorphismData.normalizesIso

目标：normalizesNative；范围：All exported universe parameters; Type-valued relation evidence and functions preserved.

```lean
(A : Type u) →
  (R S : A → A → Type v) →
    NativeBridge.Iso (Rocq.Corelib.Classes.CMorphisms.Normalizes A R S)
      (NativeBridge.Incremental.CMorphismData.normalizesNative A R S)
```

公理闭包：Quot.sound

## Corelib.Classes.CMorphisms.Params

NativeBridge.Incremental.CMorphismData.paramsIso

目标：paramsNative；范围：All exported universe parameters; Type-valued relation evidence and functions preserved. Native arity encoded using natOf; nat Iso covers every source arity.

```lean
(A : Type u) →
  (x : A) →
    (arity : Nat) →
      NativeBridge.Iso (Rocq.Corelib.Classes.CMorphisms.Params A x (NativeBridge.natOf arity))
        (NativeBridge.Incremental.CMorphismData.paramsNative A x arity)
```

公理闭包：空

## Corelib.Classes.CMorphisms.PartialApplication

NativeBridge.Incremental.CMorphismData.partialApplicationIso

目标：markerNative；范围：Propositional marker with a constructor and no computational fields; Iso to True.

```lean
NativeBridge.Iso Rocq.Corelib.Classes.CMorphisms.PartialApplication NativeBridge.Incremental.CMorphismData.markerNative
```

公理闭包：空

## Corelib.Classes.CMorphisms.Proper

NativeBridge.Incremental.CMorphismData.properIso

目标：properNative；范围：All exported universe parameters; Type-valued relation evidence and functions preserved.

```lean
(A : Type u) →
  (R : A → A → Type v) →
    (x : A) →
      NativeBridge.Iso (Rocq.Corelib.Classes.CMorphisms.Proper A R x)
        (NativeBridge.Incremental.CMorphismData.properNative A R x)
```

公理闭包：空

## Corelib.Classes.CMorphisms.ProperProxy

NativeBridge.Incremental.CMorphismData.properProxyIso

目标：properNative；范围：All exported universe parameters; Type-valued relation evidence and functions preserved.

```lean
(A : Type u) →
  (R : A → A → Type v) →
    (x : A) →
      NativeBridge.Iso (Rocq.Corelib.Classes.CMorphisms.ProperProxy A R x)
        (NativeBridge.Incremental.CMorphismData.properNative A R x)
```

公理闭包：空

## Corelib.Classes.CMorphisms.apply_subrelation

NativeBridge.Incremental.CMorphismData.applySubrelationIso

目标：markerNative；范围：Propositional marker with a constructor and no computational fields; Iso to True.

```lean
NativeBridge.Iso Rocq.Corelib.Classes.CMorphisms.apply_subrelation NativeBridge.Incremental.CMorphismData.markerNative
```

公理闭包：空

## Corelib.Classes.CMorphisms.forall_def

NativeBridge.Incremental.CMorphismData.forallIso

目标：forallNative；范围：All exported universe parameters; Type-valued relation evidence and functions preserved.

```lean
(A : Type u) →
  (P : A → Type v) →
    NativeBridge.Iso (Rocq.Corelib.Classes.CMorphisms.forall_def A P)
      (NativeBridge.Incremental.CMorphismData.forallNative A P)
```

公理闭包：空

## Corelib.Classes.CMorphisms.forall_relation

NativeBridge.Incremental.CMorphismData.forallRelationIso

目标：forallRelationNative；范围：All exported universe parameters; Type-valued relation evidence and functions preserved.

```lean
(A : Type u) →
  (P : A → Type v) →
    (R : (a : A) → P a → P a → Type w) →
      (f g : (a : A) → P a) →
        NativeBridge.Iso (Rocq.Corelib.Classes.CMorphisms.forall_relation A P R f g)
          (NativeBridge.Incremental.CMorphismData.forallRelationNative A P R f g)
```

公理闭包：空

## Corelib.Classes.CMorphisms.normalization_done

NativeBridge.Incremental.CMorphismData.normalizationDoneIso

目标：markerNative；范围：Propositional marker with a constructor and no computational fields; Iso to True.

```lean
NativeBridge.Iso Rocq.Corelib.Classes.CMorphisms.normalization_done NativeBridge.Incremental.CMorphismData.markerNative
```

公理闭包：空

## Corelib.Classes.CMorphisms.pointwise_relation

NativeBridge.Incremental.CMorphismData.pointwiseIso

目标：pointwiseNative；范围：All exported universe parameters; Type-valued relation evidence and functions preserved.

```lean
(A : Type u) →
  (B : Type v) →
    (R : B → B → Type w) →
      (f g : A → B) →
        NativeBridge.Iso (Rocq.Corelib.Classes.CMorphisms.pointwise_relation A B R f g)
          (NativeBridge.Incremental.CMorphismData.pointwiseNative A B R f g)
```

公理闭包：空

## Corelib.Classes.CMorphisms.respectful

NativeBridge.Incremental.CMorphismData.respectfulIso

目标：respectfulNative；范围：All exported universe parameters; Type-valued relation evidence and functions preserved.

```lean
(A : Type u) →
  (B : Type v) →
    (R : A → A → Type w) →
      (S : B → B → Type t) →
        (f g : A → B) →
          NativeBridge.Iso (Rocq.Corelib.Classes.CMorphisms.respectful A B R S f g)
            (NativeBridge.Incremental.CMorphismData.respectfulNative A B R S f g)
```

公理闭包：空

## Corelib.Classes.CMorphisms.respectful_hetero

NativeBridge.Incremental.CMorphismData.respectfulHeteroIso

目标：respectfulHeteroNative；范围：All exported universe parameters; Type-valued relation evidence and functions preserved.

```lean
(A : Type u) →
  (B : Type v) →
    (C : A → Type w) →
      (D : B → Type t) →
        (R : A → B → Type z) →
          (S : (x : A) → (y : B) → C x → D y → Type a) →
            (f : (x : A) → C x) →
              (g : (y : B) → D y) →
                NativeBridge.Iso (Rocq.Corelib.Classes.CMorphisms.respectful_hetero A B C D R S f g)
                  (NativeBridge.Incremental.CMorphismData.respectfulHeteroNative A B C D R S f g)
```

公理闭包：空

## Corelib.Classes.CMorphisms.normalizes

NativeBridge.Incremental.CMorphismData.normalizes_agrees

目标：normalizesNativeOp；范围：All exported universe parameters; Type-valued relation evidence and functions preserved.

```lean
∀ (A : Type u) (R S : A → A → Type v) (h : NativeBridge.Incremental.CMorphismData.normalizesNative A R S),
  (NativeBridge.Incremental.CMorphismData.normalizesIso A R S).to
      (Rocq.Corelib.Classes.CMorphisms.normalizes A R S
        ((NativeBridge.Incremental.CMorphismData.normalizesIso A R S).of h)) =
    NativeBridge.Incremental.CMorphismData.normalizesNativeOp A R S h
```

公理闭包：Quot.sound

## Corelib.Classes.CMorphisms.proper_prf

NativeBridge.Incremental.CMorphismData.proper_prf_agrees

目标：properPrfNative；范围：All exported universe parameters; Type-valued relation evidence and functions preserved.

```lean
∀ (A : Type u) (R : A → A → Type v) (x : A) (h : NativeBridge.Incremental.CMorphismData.properNative A R x),
  Rocq.Corelib.Classes.CMorphisms.proper_prf A R x h = NativeBridge.Incremental.CMorphismData.properPrfNative A R x h
```

公理闭包：空

## Corelib.Classes.CMorphisms.proper_proxy

NativeBridge.Incremental.CMorphismData.proper_proxy_agrees

目标：properPrfNative；范围：All exported universe parameters; Type-valued relation evidence and functions preserved.

```lean
∀ (A : Type u) (R : A → A → Type v) (x : A) (h : NativeBridge.Incremental.CMorphismData.properNative A R x),
  Rocq.Corelib.Classes.CMorphisms.proper_proxy A R x h = NativeBridge.Incremental.CMorphismData.properPrfNative A R x h
```

公理闭包：空

## Corelib.Classes.CMorphisms.proper_flip_proper

NativeBridge.Incremental.CMorphismData.proper_flip_proper_agrees

目标：properPrfNative；范围：All exported universe parameters; Type-valued relation evidence and functions preserved.

```lean
∀ (A : Type u) (R : A → A → Type v) (x : A) (h : NativeBridge.Incremental.CMorphismData.properNative A R x),
  Rocq.Corelib.Classes.CMorphisms.proper_flip_proper A R x h =
    NativeBridge.Incremental.CMorphismData.properPrfNative A R x h
```

公理闭包：空

## Corelib.Classes.CMorphisms.respectful_per_obligation_1

NativeBridge.Incremental.CMorphismData.respectful_per_obligation_1_agrees

目标：respectfulSymmetryNative；范围：All exported universe parameters; Type-valued relation evidence and functions preserved.

```lean
∀ (A : Type u) (B : Type v) (R : A → A → Type w) (S : B → B → Type t)
  (h : NativeBridge.Incremental.CMorphismData.perNative A R) (k : NativeBridge.Incremental.CMorphismData.perNative B S)
  (f g : A → B) (rel : NativeBridge.Incremental.CMorphismData.respectfulNative A B R S f g),
  Rocq.Corelib.Classes.CMorphisms.respectful_per_obligation_1 A R
      ((NativeBridge.Incremental.CMorphismData.perIso A R).of h) B S
      ((NativeBridge.Incremental.CMorphismData.perIso B S).of k) f g rel =
    NativeBridge.Incremental.CMorphismData.respectfulSymmetryNative A B R S h k f g rel
```

公理闭包：空

## Corelib.Classes.CMorphisms.iff_impl_subrelation

NativeBridge.Incremental.CMorphismData.iff_impl_subrelation_agrees

目标：iffImplNative；范围：All exported universe parameters; Type-valued relation evidence and functions preserved.

```lean
Rocq.Corelib.Classes.CMorphisms.iff_impl_subrelation.statement ↔ NativeBridge.Incremental.CMorphismData.iffImplNative
```

公理闭包：空

## Corelib.Classes.CMorphisms.flip_arrow

NativeBridge.Incremental.CMorphismData.flipArrowIso

目标：flipArrowNative；范围：All 15 exported universe parameters; Iso of the exported Type-valued statement. A separate source inhabitant is constructed, without claiming equality to the original unavailable opaque value.

```lean
NativeBridge.Iso Rocq.Corelib.Classes.CMorphisms.flip_arrow.type NativeBridge.Incremental.CMorphismData.flipArrowNative
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.PosDef.Pos.land

NativeBridge.Incremental.BinaryBitwise.positive_land_agrees

目标：Nat.land；范围：All positive or binary-natural inputs; full mathematical Nat bit operations, no finite-width truncation.

```lean
∀ (p q : NativeBridge.RPositive),
  NativeBridge.binaryNatTo (Rocq.Corelib.BinNums.PosDef.Pos.land p q) =
    (NativeBridge.positiveTo p).land (NativeBridge.positiveTo q)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.PosDef.Pos.lor

NativeBridge.Incremental.BinaryBitwise.positive_lor_agrees

目标：Nat.lor；范围：All positive or binary-natural inputs; full mathematical Nat bit operations, no finite-width truncation.

```lean
∀ (p q : NativeBridge.RPositive),
  NativeBridge.positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.lor p q) =
    (NativeBridge.positiveTo p).lor (NativeBridge.positiveTo q)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.PosDef.Pos.lxor

NativeBridge.Incremental.BinaryBitwise.positive_lxor_agrees

目标：Nat.xor；范围：All positive or binary-natural inputs; full mathematical Nat bit operations, no finite-width truncation.

```lean
∀ (p q : NativeBridge.RPositive),
  NativeBridge.binaryNatTo (Rocq.Corelib.BinNums.PosDef.Pos.lxor p q) =
    (NativeBridge.positiveTo p).xor (NativeBridge.positiveTo q)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.PosDef.Pos.ldiff

NativeBridge.Incremental.BinaryBitwise.positive_ldiff_agrees

目标：NativeBridge.Incremental.BinaryBitwise.diffNative；范围：All positive or binary-natural inputs; full mathematical Nat bit operations, no finite-width truncation.

```lean
∀ (p q : NativeBridge.RPositive),
  NativeBridge.binaryNatTo (Rocq.Corelib.BinNums.PosDef.Pos.ldiff p q) =
    NativeBridge.Incremental.BinaryBitwise.diffNative (NativeBridge.positiveTo p) (NativeBridge.positiveTo q)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.NatDef.N.land

NativeBridge.Incremental.BinaryBitwise.binaryNat_land_agrees

目标：Nat.land；范围：All positive or binary-natural inputs; full mathematical Nat bit operations, no finite-width truncation.

```lean
∀ (m n : NativeBridge.RNatBinary),
  NativeBridge.binaryNatTo (Rocq.Corelib.BinNums.NatDef.N.land m n) =
    (NativeBridge.binaryNatTo m).land (NativeBridge.binaryNatTo n)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.NatDef.N.lor

NativeBridge.Incremental.BinaryBitwise.binaryNat_lor_agrees

目标：Nat.lor；范围：All positive or binary-natural inputs; full mathematical Nat bit operations, no finite-width truncation.

```lean
∀ (m n : NativeBridge.RNatBinary),
  NativeBridge.binaryNatTo (Rocq.Corelib.BinNums.NatDef.N.lor m n) =
    (NativeBridge.binaryNatTo m).lor (NativeBridge.binaryNatTo n)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.NatDef.N.lxor

NativeBridge.Incremental.BinaryBitwise.binaryNat_lxor_agrees

目标：Nat.xor；范围：All positive or binary-natural inputs; full mathematical Nat bit operations, no finite-width truncation.

```lean
∀ (m n : NativeBridge.RNatBinary),
  NativeBridge.binaryNatTo (Rocq.Corelib.BinNums.NatDef.N.lxor m n) =
    (NativeBridge.binaryNatTo m).xor (NativeBridge.binaryNatTo n)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.NatDef.N.ldiff

NativeBridge.Incremental.BinaryBitwise.binaryNat_ldiff_agrees

目标：NativeBridge.Incremental.BinaryBitwise.diffNative；范围：All positive or binary-natural inputs; full mathematical Nat bit operations, no finite-width truncation.

```lean
∀ (m n : NativeBridge.RNatBinary),
  NativeBridge.binaryNatTo (Rocq.Corelib.BinNums.NatDef.N.ldiff m n) =
    NativeBridge.Incremental.BinaryBitwise.diffNative (NativeBridge.binaryNatTo m) (NativeBridge.binaryNatTo n)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.PosDef.Pos.ldiff

NativeBridge.Incremental.BinaryIntBitwise.positive_ldiff_mathlib_agrees

目标：Nat.ldiff；范围：All source inputs; Mathlib bitwise operations on unbounded Nat/Int, including negative integers. No fixed bit width.

```lean
∀ (p q : NativeBridge.RPositive),
  NativeBridge.binaryNatTo (Rocq.Corelib.BinNums.PosDef.Pos.ldiff p q) =
    (NativeBridge.positiveTo p).ldiff (NativeBridge.positiveTo q)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.NatDef.N.ldiff

NativeBridge.Incremental.BinaryIntBitwise.binaryNat_ldiff_mathlib_agrees

目标：Nat.ldiff；范围：All source inputs; Mathlib bitwise operations on unbounded Nat/Int, including negative integers. No fixed bit width.

```lean
∀ (m n : NativeBridge.RNatBinary),
  NativeBridge.binaryNatTo (Rocq.Corelib.BinNums.NatDef.N.ldiff m n) =
    (NativeBridge.binaryNatTo m).ldiff (NativeBridge.binaryNatTo n)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.IntDef.Z.land

NativeBridge.Incremental.BinaryIntBitwise.z_land_agrees

目标：Int.land；范围：All source inputs; Mathlib bitwise operations on unbounded Nat/Int, including negative integers. No fixed bit width.

```lean
∀ (x y : NativeBridge.RIntBinary),
  NativeBridge.binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.land x y) =
    (NativeBridge.binaryIntTo x).land (NativeBridge.binaryIntTo y)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.IntDef.Z.lor

NativeBridge.Incremental.BinaryIntBitwise.z_lor_agrees

目标：Int.lor；范围：All source inputs; Mathlib bitwise operations on unbounded Nat/Int, including negative integers. No fixed bit width.

```lean
∀ (x y : NativeBridge.RIntBinary),
  NativeBridge.binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.lor x y) =
    (NativeBridge.binaryIntTo x).lor (NativeBridge.binaryIntTo y)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.IntDef.Z.lxor

NativeBridge.Incremental.BinaryIntBitwise.z_lxor_agrees

目标：Int.xor；范围：All source inputs; Mathlib bitwise operations on unbounded Nat/Int, including negative integers. No fixed bit width.

```lean
∀ (x y : NativeBridge.RIntBinary),
  NativeBridge.binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.lxor x y) =
    (NativeBridge.binaryIntTo x).xor (NativeBridge.binaryIntTo y)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.NatDef.N.pos_div_eucl

NativeBridge.Incremental.BinaryDivision.n_pos_div_eucl_agrees

目标：NativeBridge.Incremental.BinaryDivision.nPosDivNative；范围：All positive dividends and N divisors; divisor zero explicitly returns (2^log2(p)-1,p), not Nat.div/mod at zero.

```lean
∀ (p : NativeBridge.RPositive) (b : NativeBridge.RNatBinary),
  NativeBridge.Incremental.BinaryDivision.nPairTo (Rocq.Corelib.BinNums.NatDef.N.pos_div_eucl p b) =
    NativeBridge.Incremental.BinaryDivision.nPosDivNative (NativeBridge.positiveTo p) (NativeBridge.binaryNatTo b)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.IntDef.Z.pos_div_eucl

NativeBridge.Incremental.BinaryDivision.z_pos_div_eucl_agrees

目标：NativeBridge.Incremental.BinaryDivision.zPosDivNative；范围：All positive dividends and arbitrary signed divisors; positive divisor gives Int ediv/emod, nonpositive divisor has an explicit log2/power expression, not standard division.

```lean
∀ (p : NativeBridge.RPositive) (b : NativeBridge.RIntBinary),
  NativeBridge.Incremental.BinaryDivision.zPairTo (Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl p b) =
    NativeBridge.Incremental.BinaryDivision.zPosDivNative (NativeBridge.positiveTo p) (NativeBridge.binaryIntTo b)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.IntDef.Z.quotrem

NativeBridge.Incremental.BinaryDivision.z_quotrem_agrees

目标：NativeBridge.Incremental.BinaryDivision.quotremNative；范围：All signed inputs including zero divisor; native Int.tdiv and Int.tmod pair.

```lean
∀ (x y : NativeBridge.RIntBinary),
  NativeBridge.Incremental.BinaryDivision.zPairTo (Rocq.Corelib.BinNums.IntDef.Z.quotrem x y) =
    NativeBridge.Incremental.BinaryDivision.quotremNative (NativeBridge.binaryIntTo x) (NativeBridge.binaryIntTo y)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.IntDef.Z.quot

NativeBridge.Incremental.BinaryDivision.z_quot_agrees

目标：Int.tdiv；范围：All signed inputs including zero divisor; truncation toward zero.

```lean
∀ (x y : NativeBridge.RIntBinary),
  NativeBridge.binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.quot x y) =
    (NativeBridge.binaryIntTo x).tdiv (NativeBridge.binaryIntTo y)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.IntDef.Z.rem

NativeBridge.Incremental.BinaryDivision.z_rem_agrees

目标：Int.tmod；范围：All signed inputs including zero divisor; remainder has dividend sign when nonzero.

```lean
∀ (x y : NativeBridge.RIntBinary),
  NativeBridge.binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.rem x y) =
    (NativeBridge.binaryIntTo x).tmod (NativeBridge.binaryIntTo y)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.IntDef.Z.div_eucl

NativeBridge.Incremental.BinaryDivision.z_div_eucl_agrees

目标：NativeBridge.Incremental.BinaryDivision.floorPairNative；范围：All signed inputs including zero divisor; native Int.fdiv and Int.fmod pair, distinct from Lean ediv/emod with a negative divisor.

```lean
∀ (x y : NativeBridge.RIntBinary),
  NativeBridge.Incremental.BinaryDivision.zPairTo (Rocq.Corelib.BinNums.IntDef.Z.div_eucl x y) =
    NativeBridge.Incremental.BinaryDivision.floorPairNative (NativeBridge.binaryIntTo x) (NativeBridge.binaryIntTo y)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.IntDef.Z.div

NativeBridge.Incremental.BinaryDivision.z_div_agrees

目标：Int.fdiv；范围：All signed inputs including zero divisor; floor division.

```lean
∀ (x y : NativeBridge.RIntBinary),
  NativeBridge.binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.div x y) =
    (NativeBridge.binaryIntTo x).fdiv (NativeBridge.binaryIntTo y)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.IntDef.Z.modulo

NativeBridge.Incremental.BinaryDivision.z_modulo_agrees

目标：Int.fmod；范围：All signed inputs including zero divisor; remainder follows divisor sign when nonzero.

```lean
∀ (x y : NativeBridge.RIntBinary),
  NativeBridge.binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.modulo x y) =
    (NativeBridge.binaryIntTo x).fmod (NativeBridge.binaryIntTo y)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.PosDef.Pos.sqrtrem_step

NativeBridge.Incremental.BinarySqrtRem.sqrtrem_step_agrees

目标：NativeBridge.Incremental.BinarySqrtRem.sqrtStepNative；范围：All source pair/mask values, including IsNeg. Arbitrary higher-order f/g with explicit operation correspondence hypotheses; no associativity or bit-constructor restriction.

```lean
∀ (f g : NativeBridge.RPositive → NativeBridge.RPositive) (F G : Nat → Nat),
  (∀ (p : NativeBridge.RPositive), NativeBridge.positiveTo (f p) = F (NativeBridge.positiveTo p)) →
    (∀ (p : NativeBridge.RPositive), NativeBridge.positiveTo (g p) = G (NativeBridge.positiveTo p)) →
      ∀ (x : NativeBridge.Incremental.BinarySqrtRem.SqrtPair),
        NativeBridge.Incremental.BinarySqrtRem.sqrtPairTo (Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem_step f g x) =
          NativeBridge.Incremental.BinarySqrtRem.sqrtStepNative F G
            (NativeBridge.Incremental.BinarySqrtRem.sqrtPairTo x)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.PosDef.Pos.sqrtrem

NativeBridge.Incremental.BinarySqrtRem.sqrtrem_agrees

目标：NativeBridge.Incremental.BinarySqrtRem.sqrtRemNative；范围：All positive inputs; exact Nat.sqrt and nonnegative remainder n-sqrt(n)^2, with mask result proved to be some.

```lean
∀ (p : NativeBridge.RPositive),
  NativeBridge.Incremental.BinarySqrtRem.sqrtPairTo (Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem p) =
    NativeBridge.Incremental.BinarySqrtRem.sqrtRemNative (NativeBridge.positiveTo p)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.IntDef.Z.sqrtrem

NativeBridge.Incremental.BinarySqrtRem.z_sqrtrem_agrees

目标：NativeBridge.Incremental.BinarySqrtRem.zSqrtRemNative；范围：All signed inputs; Nat.sqrt on Int.toNat, negative input returns (0,0), not a negative remainder.

```lean
∀ (z : NativeBridge.RIntBinary),
  NativeBridge.Incremental.BinaryDivision.zPairTo (Rocq.Corelib.BinNums.IntDef.Z.sqrtrem z) =
    NativeBridge.Incremental.BinarySqrtRem.zSqrtRemNative (NativeBridge.binaryIntTo z)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.PosDef.Pos.sqrt

NativeBridge.Incremental.BinaryPositiveSqrt.positive_sqrt_agrees

目标：Nat.sqrt；范围：All positive inputs; independently checked against the actual PosDef source closure, which exports the sqrt root omitted by IntDef.

```lean
∀ (p : NativeBridge.RPositive),
  NativeBridge.positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.sqrt p) = (NativeBridge.positiveTo p).sqrt
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.PosDef.Pos.iter_op

NativeBridge.Incremental.BinaryIterOp.iter_op_agrees

目标：NativeBridge.Incremental.BinaryIterOp.iterOpNative；范围：All Sort-valued carriers and arbitrary binary operations; exact binary parenthesization, no associativity assumed.

```lean
∀ {A : Sort u} (op : A → A → A) (p : NativeBridge.RPositive) (a : A),
  Rocq.Corelib.BinNums.PosDef.Pos.iter_op A op p a =
    NativeBridge.Incremental.BinaryIterOp.iterOpNative op (NativeBridge.positiveTo p) a
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.PosDef.Pos.iter_op

NativeBridge.Incremental.BinaryIterOp.iter_op_nat_add

目标：Nat.mul；范围：Specialization to Nat.add: iter_op p a = positiveTo(p)*a. General arbitrary-operation certificate is registered separately; not another root.

```lean
∀ (p : NativeBridge.RPositive) (a : Nat),
  Rocq.Corelib.BinNums.PosDef.Pos.iter_op Nat Nat.add p a = NativeBridge.positiveTo p * a
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.PosDef.Pos.iter_op

NativeBridge.Incremental.BinaryIterOp.iter_op_nat_mul

目标：Nat.pow；范围：Specialization to Nat.mul: iter_op p a = a^positiveTo(p). Not another root.

```lean
∀ (p : NativeBridge.RPositive) (a : Nat),
  Rocq.Corelib.BinNums.PosDef.Pos.iter_op Nat Nat.mul p a = a ^ NativeBridge.positiveTo p
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.PosDef.Pos.iter_op

NativeBridge.Incremental.BinaryIterOp.iter_op_foldr

目标：List.foldr；范围：Any Type-valued carrier and associative operation: native foldr over replicate(p-1,a). Associativity is an explicit hypothesis, essential for this linear-fold target. Not another root.

```lean
∀ {A : Type u} (op : A → A → A),
  (∀ (x y z : A), op (op x y) z = op x (op y z)) →
    ∀ (p : NativeBridge.RPositive) (a : A),
      Rocq.Corelib.BinNums.PosDef.Pos.iter_op A op p a =
        List.foldr op a (List.replicate (NativeBridge.positiveTo p - 1) a)
```

公理闭包：propext, Quot.sound

## Corelib.Numbers.BinNums.positive_rec

NativeBridge.Incremental.BinaryElimination.positive_rec_agrees

目标：NativeBridge.Incremental.BinaryElimination.positiveRec；范围：Native dependent motive pulled back along the proven type Iso; rec preserves Type result, rect preserves arbitrary Sort result, including Prop. Native cases/recursion contains no source symbols.

```lean
∀ (P : NativeBridge.Incremental.BinaryElimination.PositiveNat → Type)
  (odd :
    (p : NativeBridge.Incremental.BinaryElimination.PositiveNat) →
      P p → P (NativeBridge.Incremental.BinaryElimination.positiveOdd p))
  (even :
    (p : NativeBridge.Incremental.BinaryElimination.PositiveNat) →
      P p → P (NativeBridge.Incremental.BinaryElimination.positiveEven p))
  (one : P NativeBridge.Incremental.BinaryElimination.positiveOne) (p : NativeBridge.RPositive),
  Rocq.Corelib.Numbers.BinNums.positive_rec (fun p => P (NativeBridge.positiveIso.to p))
      (fun p ih => odd (NativeBridge.positiveIso.to p) ih) (fun p ih => even (NativeBridge.positiveIso.to p) ih) one p =
    NativeBridge.Incremental.BinaryElimination.positiveRec P odd even one (NativeBridge.positiveIso.to p)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.BinNums.positive_rect

NativeBridge.Incremental.BinaryElimination.positive_rect_agrees

目标：NativeBridge.Incremental.BinaryElimination.positiveRec；范围：Native dependent motive pulled back along the proven type Iso; rec preserves Type result, rect preserves arbitrary Sort result, including Prop. Native cases/recursion contains no source symbols.

```lean
∀ (P : NativeBridge.Incremental.BinaryElimination.PositiveNat → Sort u)
  (odd :
    (p : NativeBridge.Incremental.BinaryElimination.PositiveNat) →
      P p → P (NativeBridge.Incremental.BinaryElimination.positiveOdd p))
  (even :
    (p : NativeBridge.Incremental.BinaryElimination.PositiveNat) →
      P p → P (NativeBridge.Incremental.BinaryElimination.positiveEven p))
  (one : P NativeBridge.Incremental.BinaryElimination.positiveOne) (p : NativeBridge.RPositive),
  Rocq.Corelib.Numbers.BinNums.positive_rect (fun p => P (NativeBridge.positiveIso.to p))
      (fun p ih => odd (NativeBridge.positiveIso.to p) ih) (fun p ih => even (NativeBridge.positiveIso.to p) ih) one p =
    NativeBridge.Incremental.BinaryElimination.positiveRec P odd even one (NativeBridge.positiveIso.to p)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.BinNums.positive_ind

NativeBridge.Incremental.BinaryElimination.positive_ind_correspondence

目标：NativeBridge.Incremental.BinaryElimination.positiveInduction；范围：Full induction/case statement on the native carrier: positive subtype, Nat or Int. Both the original statement and the native statement are independently proved; iff does not assume the source theorem.

```lean
Rocq.Corelib.Numbers.BinNums.positive_ind.statement ↔ NativeBridge.Incremental.BinaryElimination.positiveInduction
```

公理闭包：propext, Quot.sound

## Corelib.Numbers.BinNums.positive_sind

NativeBridge.Incremental.BinaryElimination.positive_sind_correspondence

目标：NativeBridge.Incremental.BinaryElimination.positiveInduction；范围：Full induction/case statement on the native carrier: positive subtype, Nat or Int. Both the original statement and the native statement are independently proved; iff does not assume the source theorem.

```lean
Rocq.Corelib.Numbers.BinNums.positive_sind.statement ↔ NativeBridge.Incremental.BinaryElimination.positiveInduction
```

公理闭包：propext, Quot.sound

## Corelib.Numbers.BinNums.N_rec

NativeBridge.Incremental.BinaryElimination.n_rec_agrees

目标：NativeBridge.Incremental.BinaryElimination.natCases；范围：Native dependent motive pulled back along the proven type Iso; rec preserves Type result, rect preserves arbitrary Sort result, including Prop. Native cases/recursion contains no source symbols.

```lean
∀ (P : Nat → Type) (zero : P 0) (pos : (p : NativeBridge.Incremental.BinaryElimination.PositiveNat) → P p.val)
  (n : NativeBridge.RNatBinary),
  Rocq.Corelib.Numbers.BinNums.N_rec (fun n => P (NativeBridge.binaryNatTo n)) zero
      (fun p => pos (NativeBridge.positiveIso.to p)) n =
    NativeBridge.Incremental.BinaryElimination.natCases P zero pos (NativeBridge.binaryNatTo n)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.BinNums.N_rect

NativeBridge.Incremental.BinaryElimination.n_rect_agrees

目标：NativeBridge.Incremental.BinaryElimination.natCases；范围：Native dependent motive pulled back along the proven type Iso; rec preserves Type result, rect preserves arbitrary Sort result, including Prop. Native cases/recursion contains no source symbols.

```lean
∀ (P : Nat → Sort u) (zero : P 0) (pos : (p : NativeBridge.Incremental.BinaryElimination.PositiveNat) → P p.val)
  (n : NativeBridge.RNatBinary),
  Rocq.Corelib.Numbers.BinNums.N_rect (fun n => P (NativeBridge.binaryNatTo n)) zero
      (fun p => pos (NativeBridge.positiveIso.to p)) n =
    NativeBridge.Incremental.BinaryElimination.natCases P zero pos (NativeBridge.binaryNatTo n)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.BinNums.N_ind

NativeBridge.Incremental.BinaryElimination.n_ind_correspondence

目标：NativeBridge.Incremental.BinaryElimination.natInduction；范围：Full induction/case statement on the native carrier: positive subtype, Nat or Int. Both the original statement and the native statement are independently proved; iff does not assume the source theorem.

```lean
Rocq.Corelib.Numbers.BinNums.N_ind.statement ↔ NativeBridge.Incremental.BinaryElimination.natInduction
```

公理闭包：propext, Quot.sound

## Corelib.Numbers.BinNums.N_sind

NativeBridge.Incremental.BinaryElimination.n_sind_correspondence

目标：NativeBridge.Incremental.BinaryElimination.natInduction；范围：Full induction/case statement on the native carrier: positive subtype, Nat or Int. Both the original statement and the native statement are independently proved; iff does not assume the source theorem.

```lean
Rocq.Corelib.Numbers.BinNums.N_sind.statement ↔ NativeBridge.Incremental.BinaryElimination.natInduction
```

公理闭包：propext, Quot.sound

## Corelib.Numbers.BinNums.Z_rec

NativeBridge.Incremental.BinaryElimination.z_rec_agrees

目标：NativeBridge.Incremental.BinaryElimination.intCases；范围：Native dependent motive pulled back along the proven type Iso; rec preserves Type result, rect preserves arbitrary Sort result, including Prop. Native cases/recursion contains no source symbols.

```lean
∀ (P : Int → Type) (zero : P 0)
  (pos : (p : NativeBridge.Incremental.BinaryElimination.PositiveNat) → P (Int.ofNat p.val))
  (neg : (p : NativeBridge.Incremental.BinaryElimination.PositiveNat) → P (-Int.ofNat p.val))
  (z : NativeBridge.RIntBinary),
  Rocq.Corelib.Numbers.BinNums.Z_rec (fun z => P (NativeBridge.binaryIntTo z)) zero
      (fun p => pos (NativeBridge.positiveIso.to p)) (fun p => neg (NativeBridge.positiveIso.to p)) z =
    NativeBridge.Incremental.BinaryElimination.intCases P zero pos neg (NativeBridge.binaryIntTo z)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.BinNums.Z_rect

NativeBridge.Incremental.BinaryElimination.z_rect_agrees

目标：NativeBridge.Incremental.BinaryElimination.intCases；范围：Native dependent motive pulled back along the proven type Iso; rec preserves Type result, rect preserves arbitrary Sort result, including Prop. Native cases/recursion contains no source symbols.

```lean
∀ (P : Int → Sort u) (zero : P 0)
  (pos : (p : NativeBridge.Incremental.BinaryElimination.PositiveNat) → P (Int.ofNat p.val))
  (neg : (p : NativeBridge.Incremental.BinaryElimination.PositiveNat) → P (-Int.ofNat p.val))
  (z : NativeBridge.RIntBinary),
  Rocq.Corelib.Numbers.BinNums.Z_rect (fun z => P (NativeBridge.binaryIntTo z)) zero
      (fun p => pos (NativeBridge.positiveIso.to p)) (fun p => neg (NativeBridge.positiveIso.to p)) z =
    NativeBridge.Incremental.BinaryElimination.intCases P zero pos neg (NativeBridge.binaryIntTo z)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.BinNums.Z_ind

NativeBridge.Incremental.BinaryElimination.z_ind_correspondence

目标：NativeBridge.Incremental.BinaryElimination.intInduction；范围：Full induction/case statement on the native carrier: positive subtype, Nat or Int. Both the original statement and the native statement are independently proved; iff does not assume the source theorem.

```lean
Rocq.Corelib.Numbers.BinNums.Z_ind.statement ↔ NativeBridge.Incremental.BinaryElimination.intInduction
```

公理闭包：propext, Quot.sound

## Corelib.Numbers.BinNums.Z_sind

NativeBridge.Incremental.BinaryElimination.z_sind_correspondence

目标：NativeBridge.Incremental.BinaryElimination.intInduction；范围：Full induction/case statement on the native carrier: positive subtype, Nat or Int. Both the original statement and the native statement are independently proved; iff does not assume the source theorem.

```lean
Rocq.Corelib.Numbers.BinNums.Z_sind.statement ↔ NativeBridge.Incremental.BinaryElimination.intInduction
```

公理闭包：propext, Quot.sound

## Corelib.Init.Decimal.decimal

NativeBridge.Incremental.DecimalRepresentation.decimalIso

目标：NativeBridge.Incremental.DecimalRepresentation.DecimalNative；范围：Sign/digit tuple with optional signed exponent; preserves leading zeros, negative zero, empty digits and exponent presence. Both inverse laws.

```lean
NativeBridge.Iso Rocq.Corelib.Init.Decimal.decimal NativeBridge.Incremental.DecimalRepresentation.DecimalNative
```

公理闭包：propext

## Corelib.Init.Decimal.decimal_beq

NativeBridge.Incremental.DecimalRepresentation.decimal_beq_agrees

目标：NativeBridge.Incremental.DecimalRepresentation.decimalEqual；范围：All source values; exact native digit representation, not numeric-value equality. Empty digits and leading/trailing zeros preserved according to the source operation.

```lean
∀ (x y : NativeBridge.Incremental.DecimalRepresentation.D),
  NativeBridge.Incremental.Decimal.digitBoolTo (Rocq.Corelib.Init.Decimal.decimal_beq x y) =
    NativeBridge.Incremental.DecimalRepresentation.decimalEqual
      (NativeBridge.Incremental.DecimalRepresentation.decimalTo x)
      (NativeBridge.Incremental.DecimalRepresentation.decimalTo y)
```

公理闭包：propext

## Corelib.Init.Decimal.del_head

NativeBridge.Incremental.DecimalRepresentation.del_head_agrees

目标：NativeBridge.Incremental.DecimalRepresentation.dropHead；范围：All source values; exact native digit representation, not numeric-value equality. Empty digits and leading/trailing zeros preserved according to the source operation.

```lean
∀ (n : NativeBridge.MN) (d : NativeBridge.Incremental.DecimalRepresentation.U),
  NativeBridge.decimalDigitsTo (Rocq.Corelib.Init.Decimal.del_head n d) =
    NativeBridge.Incremental.DecimalRepresentation.dropHead (NativeBridge.natTo n) (NativeBridge.decimalDigitsTo d)
```

公理闭包：propext

## Corelib.Init.Decimal.del_tail

NativeBridge.Incremental.DecimalRepresentation.del_tail_agrees

目标：NativeBridge.Incremental.DecimalRepresentation.dropTail；范围：All source values; exact native digit representation, not numeric-value equality. Empty digits and leading/trailing zeros preserved according to the source operation.

```lean
∀ (n : NativeBridge.MN) (d : NativeBridge.Incremental.DecimalRepresentation.U),
  NativeBridge.decimalDigitsTo (Rocq.Corelib.Init.Decimal.del_tail n d) =
    NativeBridge.Incremental.DecimalRepresentation.dropTail (NativeBridge.natTo n) (NativeBridge.decimalDigitsTo d)
```

公理闭包：propext

## Corelib.Init.Decimal.del_head_int

NativeBridge.Incremental.DecimalRepresentation.del_head_int_agrees

目标：NativeBridge.Incremental.DecimalRepresentation.dropHeadInt；范围：All source values; exact native digit representation, not numeric-value equality. Empty digits and leading/trailing zeros preserved according to the source operation.

```lean
∀ (n : NativeBridge.MN) (d : NativeBridge.Incremental.DecimalRepresentation.S),
  NativeBridge.decimalDigitsTo (Rocq.Corelib.Init.Decimal.del_head_int n d) =
    NativeBridge.Incremental.DecimalRepresentation.dropHeadInt (NativeBridge.natTo n)
      (NativeBridge.Incremental.Decimal.signedTo d)
```

公理闭包：propext

## Corelib.Init.Decimal.del_tail_int

NativeBridge.Incremental.DecimalRepresentation.del_tail_int_agrees

目标：NativeBridge.Incremental.DecimalRepresentation.dropTailInt；范围：All source values; exact native digit representation, not numeric-value equality. Empty digits and leading/trailing zeros preserved according to the source operation.

```lean
∀ (n : NativeBridge.MN) (d : NativeBridge.Incremental.DecimalRepresentation.S),
  NativeBridge.Incremental.Decimal.signedTo (Rocq.Corelib.Init.Decimal.del_tail_int n d) =
    NativeBridge.Incremental.DecimalRepresentation.dropTailInt (NativeBridge.natTo n)
      (NativeBridge.Incremental.Decimal.signedTo d)
```

公理闭包：propext

## Corelib.Init.Decimal.nztail

NativeBridge.Incremental.DecimalRepresentation.nztail_agrees

目标：NativeBridge.Incremental.DecimalRepresentation.trimTail；范围：All source values; exact native digit representation, not numeric-value equality. Empty digits and leading/trailing zeros preserved according to the source operation.

```lean
∀ (d : NativeBridge.Incremental.DecimalRepresentation.U),
  NativeBridge.Incremental.DecimalRepresentation.digitCountTo (Rocq.Corelib.Init.Decimal.nztail d) =
    NativeBridge.Incremental.DecimalRepresentation.trimTail (NativeBridge.decimalDigitsTo d)
```

公理闭包：propext

## Corelib.Init.Decimal.nztail_int

NativeBridge.Incremental.DecimalRepresentation.nztail_int_agrees

目标：NativeBridge.Incremental.DecimalRepresentation.trimTailInt；范围：All source values; exact native digit representation, not numeric-value equality. Empty digits and leading/trailing zeros preserved according to the source operation.

```lean
∀ (d : NativeBridge.Incremental.DecimalRepresentation.S),
  NativeBridge.Incremental.DecimalRepresentation.signedCountTo (Rocq.Corelib.Init.Decimal.nztail_int d) =
    NativeBridge.Incremental.DecimalRepresentation.trimTailInt (NativeBridge.Incremental.Decimal.signedTo d)
```

公理闭包：propext

## Corelib.Init.Decimal.Little.double

NativeBridge.Incremental.DecimalRepresentation.little_double_agrees

目标：NativeBridge.Incremental.DecimalRepresentation.littleDouble；范围：All little-endian digit lists, including empty and noncanonical zeros; double or double+1 with explicit carry. Represents the resulting digit sequence, not just its numeric value.

```lean
∀ (d : NativeBridge.Incremental.DecimalRepresentation.U),
  NativeBridge.decimalDigitsTo (Rocq.Corelib.Init.Decimal.Little.double d) =
    NativeBridge.Incremental.DecimalRepresentation.littleDouble false (NativeBridge.decimalDigitsTo d)
```

公理闭包：propext

## Corelib.Init.Decimal.Little.succ_double

NativeBridge.Incremental.DecimalRepresentation.little_succ_double_agrees

目标：NativeBridge.Incremental.DecimalRepresentation.littleDouble；范围：All little-endian digit lists, including empty and noncanonical zeros; double or double+1 with explicit carry. Represents the resulting digit sequence, not just its numeric value.

```lean
∀ (d : NativeBridge.Incremental.DecimalRepresentation.U),
  NativeBridge.decimalDigitsTo (Rocq.Corelib.Init.Decimal.Little.succ_double d) =
    NativeBridge.Incremental.DecimalRepresentation.littleDouble true (NativeBridge.decimalDigitsTo d)
```

公理闭包：propext

## Corelib.Init.Decimal.uint_rect

NativeBridge.Incremental.DecimalRepresentation.uint_rect_agrees

目标：NativeBridge.Incremental.DecimalRepresentation.digitsRec；范围：Full native dependent motive over List (Fin 10); source branch family indexed by the ten digits, corresponding to List.rec. rect is Sort-polymorphic; rec returns Type.

```lean
∀ (P : List (Fin 10) → Sort u) (nil : P []) (cons : (d : Fin 10) → (ds : List (Fin 10)) → P ds → P (d :: ds))
  (d : NativeBridge.Incremental.DecimalRepresentation.U),
  Rocq.Corelib.Init.Decimal.uint_rect (fun d => P (NativeBridge.decimalDigitsTo d)) nil
      (fun d ih => cons 0 (NativeBridge.decimalDigitsTo d) ih) (fun d ih => cons 1 (NativeBridge.decimalDigitsTo d) ih)
      (fun d ih => cons 2 (NativeBridge.decimalDigitsTo d) ih) (fun d ih => cons 3 (NativeBridge.decimalDigitsTo d) ih)
      (fun d ih => cons 4 (NativeBridge.decimalDigitsTo d) ih) (fun d ih => cons 5 (NativeBridge.decimalDigitsTo d) ih)
      (fun d ih => cons 6 (NativeBridge.decimalDigitsTo d) ih) (fun d ih => cons 7 (NativeBridge.decimalDigitsTo d) ih)
      (fun d ih => cons 8 (NativeBridge.decimalDigitsTo d) ih) (fun d ih => cons 9 (NativeBridge.decimalDigitsTo d) ih)
      d =
    NativeBridge.Incremental.DecimalRepresentation.digitsRec P nil cons (NativeBridge.decimalDigitsTo d)
```

公理闭包：propext

## Corelib.Init.Decimal.uint_rec

NativeBridge.Incremental.DecimalRepresentation.uint_rec_agrees

目标：NativeBridge.Incremental.DecimalRepresentation.digitsRec；范围：Full native dependent motive over List (Fin 10); source branch family indexed by the ten digits, corresponding to List.rec. rect is Sort-polymorphic; rec returns Type.

```lean
∀ (P : List (Fin 10) → Type) (nil : P []) (cons : (d : Fin 10) → (ds : List (Fin 10)) → P ds → P (d :: ds))
  (d : NativeBridge.Incremental.DecimalRepresentation.U),
  Rocq.Corelib.Init.Decimal.uint_rec (fun d => P (NativeBridge.decimalDigitsTo d)) nil
      (fun d ih => cons 0 (NativeBridge.decimalDigitsTo d) ih) (fun d ih => cons 1 (NativeBridge.decimalDigitsTo d) ih)
      (fun d ih => cons 2 (NativeBridge.decimalDigitsTo d) ih) (fun d ih => cons 3 (NativeBridge.decimalDigitsTo d) ih)
      (fun d ih => cons 4 (NativeBridge.decimalDigitsTo d) ih) (fun d ih => cons 5 (NativeBridge.decimalDigitsTo d) ih)
      (fun d ih => cons 6 (NativeBridge.decimalDigitsTo d) ih) (fun d ih => cons 7 (NativeBridge.decimalDigitsTo d) ih)
      (fun d ih => cons 8 (NativeBridge.decimalDigitsTo d) ih) (fun d ih => cons 9 (NativeBridge.decimalDigitsTo d) ih)
      d =
    NativeBridge.Incremental.DecimalRepresentation.digitsRec P nil cons (NativeBridge.decimalDigitsTo d)
```

公理闭包：propext

## Corelib.Init.Decimal.uint_of_uint

NativeBridge.Incremental.DecimalRepresentation.uint_of_uint_agrees

目标：id；范围：Identity on the lossless native digit or signed-digit representation.

```lean
∀ (d : NativeBridge.Incremental.DecimalRepresentation.U),
  NativeBridge.decimalDigitsTo (Rocq.Corelib.Init.Decimal.uint_of_uint d) = id (NativeBridge.decimalDigitsTo d)
```

公理闭包：空

## Corelib.Init.Decimal.int_of_int

NativeBridge.Incremental.DecimalRepresentation.int_of_int_agrees

目标：id；范围：Identity on the lossless native digit or signed-digit representation.

```lean
∀ (d : NativeBridge.Incremental.DecimalRepresentation.S),
  NativeBridge.Incremental.Decimal.signedTo (Rocq.Corelib.Init.Decimal.int_of_int d) =
    id (NativeBridge.Incremental.Decimal.signedTo d)
```

公理闭包：空

## Corelib.Init.Decimal.uint_ind

NativeBridge.Incremental.DecimalRepresentation.uint_ind_correspondence

目标：NativeBridge.Incremental.DecimalRepresentation.digitInduction；范围：Full native statement; original statement and native statement separately proved.

```lean
Rocq.Corelib.Init.Decimal.uint_ind.statement ↔ NativeBridge.Incremental.DecimalRepresentation.digitInduction
```

公理闭包：空

## Corelib.Init.Decimal.uint_sind

NativeBridge.Incremental.DecimalRepresentation.uint_sind_correspondence

目标：NativeBridge.Incremental.DecimalRepresentation.digitInduction；范围：Full native statement; original statement and native statement separately proved.

```lean
Rocq.Corelib.Init.Decimal.uint_sind.statement ↔ NativeBridge.Incremental.DecimalRepresentation.digitInduction
```

公理闭包：空

## Corelib.Init.Decimal.internal_decimal_dec_bl

NativeBridge.Incremental.DecimalRepresentation.decimal_dec_bl_correspondence

目标：NativeBridge.Incremental.DecimalRepresentation.equalitySound；范围：Full native statement; original statement and native statement separately proved.

```lean
Rocq.Corelib.Init.Decimal.internal_decimal_dec_bl.statement ↔
  NativeBridge.Incremental.DecimalRepresentation.equalitySound
```

公理闭包：propext

## Corelib.Init.Decimal.internal_decimal_dec_lb

NativeBridge.Incremental.DecimalRepresentation.decimal_dec_lb_correspondence

目标：NativeBridge.Incremental.DecimalRepresentation.equalityComplete；范围：Full native statement; original statement and native statement separately proved.

```lean
Rocq.Corelib.Init.Decimal.internal_decimal_dec_lb.statement ↔
  NativeBridge.Incremental.DecimalRepresentation.equalityComplete
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Init.Decimal.uint_eq_dec

NativeBridge.Incremental.DecimalRepresentation.uint_eq_dec_agrees

目标：NativeBridge.Incremental.DecimalRepresentation.nativeDecision；范围：All inputs; complete Decidable equality on lossless native representation. Four extracted proof prerequisites closed explicitly; source sumbool maps to the unique native decision.

```lean
∀ (x y : NativeBridge.Incremental.DecimalRepresentation.U),
  NativeBridge.Incremental.DecimalRepresentation.eqDecisionTo NativeBridge.decimalDigitsIso x y
      (RocqPending.Corelib.Init.Decimal.uint_eq_dec x y) =
    NativeBridge.Incremental.DecimalRepresentation.nativeDecision (NativeBridge.decimalDigitsTo x)
      (NativeBridge.decimalDigitsTo y)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Init.Decimal.signed_int_eq_dec

NativeBridge.Incremental.DecimalRepresentation.signed_int_eq_dec_agrees

目标：NativeBridge.Incremental.DecimalRepresentation.nativeDecision；范围：All inputs; complete Decidable equality on lossless native representation. Four extracted proof prerequisites closed explicitly; source sumbool maps to the unique native decision.

```lean
∀ (x y : NativeBridge.Incremental.DecimalRepresentation.S),
  NativeBridge.Incremental.DecimalRepresentation.eqDecisionTo NativeBridge.Incremental.Decimal.signedIso x y
      (RocqPending.Corelib.Init.Decimal.signed_int_eq_dec x y) =
    NativeBridge.Incremental.DecimalRepresentation.nativeDecision (NativeBridge.Incremental.Decimal.signedTo x)
      (NativeBridge.Incremental.Decimal.signedTo y)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Init.Decimal.decimal_eq_dec

NativeBridge.Incremental.DecimalRepresentation.decimal_eq_dec_agrees

目标：NativeBridge.Incremental.DecimalRepresentation.nativeDecision；范围：All inputs; complete Decidable equality on lossless native representation. Four extracted proof prerequisites closed explicitly; source sumbool maps to the unique native decision.

```lean
∀ (x y : NativeBridge.Incremental.DecimalRepresentation.D),
  NativeBridge.Incremental.DecimalRepresentation.eqDecisionTo NativeBridge.Incremental.DecimalRepresentation.decimalIso
      x y (RocqPending.Corelib.Init.Decimal.decimal_eq_dec x y) =
    NativeBridge.Incremental.DecimalRepresentation.nativeDecision
      (NativeBridge.Incremental.DecimalRepresentation.decimalTo x)
      (NativeBridge.Incremental.DecimalRepresentation.decimalTo y)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Init.Hexadecimal.hexadecimal

NativeBridge.Incremental.HexadecimalRepresentation.hexadecimalIso

目标：NativeBridge.Incremental.HexadecimalRepresentation.HexadecimalNative；范围：Hexadecimal signed integer and fractional digit lists, with an optional DECIMAL signed exponent; preserves negative zero, all zeros and exponent presence. Both inverse laws.

```lean
NativeBridge.Iso Rocq.Corelib.Init.Hexadecimal.hexadecimal
  NativeBridge.Incremental.HexadecimalRepresentation.HexadecimalNative
```

公理闭包：propext

## Corelib.Init.Hexadecimal.hexadecimal_beq

NativeBridge.Incremental.HexadecimalRepresentation.hexadecimal_beq_agrees

目标：NativeBridge.Incremental.HexadecimalRepresentation.hexadecimalEqual；范围：All source values; exact native digit representation, not numeric-value equality. Empty digits and leading/trailing zeros preserved according to the source operation.

```lean
∀ (x y : NativeBridge.Incremental.HexadecimalRepresentation.D),
  NativeBridge.Incremental.Hexadecimal.digitBoolTo (Rocq.Corelib.Init.Hexadecimal.hexadecimal_beq x y) =
    NativeBridge.Incremental.HexadecimalRepresentation.hexadecimalEqual
      (NativeBridge.Incremental.HexadecimalRepresentation.hexadecimalTo x)
      (NativeBridge.Incremental.HexadecimalRepresentation.hexadecimalTo y)
```

公理闭包：propext

## Corelib.Init.Hexadecimal.del_head

NativeBridge.Incremental.HexadecimalRepresentation.del_head_agrees

目标：NativeBridge.Incremental.HexadecimalRepresentation.dropHead；范围：All source values; exact native digit representation, not numeric-value equality. Empty digits and leading/trailing zeros preserved according to the source operation.

```lean
∀ (n : NativeBridge.MN) (d : NativeBridge.Incremental.HexadecimalRepresentation.U),
  NativeBridge.hexadecimalDigitsTo (Rocq.Corelib.Init.Hexadecimal.del_head n d) =
    NativeBridge.Incremental.HexadecimalRepresentation.dropHead (NativeBridge.natTo n)
      (NativeBridge.hexadecimalDigitsTo d)
```

公理闭包：propext

## Corelib.Init.Hexadecimal.del_tail

NativeBridge.Incremental.HexadecimalRepresentation.del_tail_agrees

目标：NativeBridge.Incremental.HexadecimalRepresentation.dropTail；范围：All source values; exact native digit representation, not numeric-value equality. Empty digits and leading/trailing zeros preserved according to the source operation.

```lean
∀ (n : NativeBridge.MN) (d : NativeBridge.Incremental.HexadecimalRepresentation.U),
  NativeBridge.hexadecimalDigitsTo (Rocq.Corelib.Init.Hexadecimal.del_tail n d) =
    NativeBridge.Incremental.HexadecimalRepresentation.dropTail (NativeBridge.natTo n)
      (NativeBridge.hexadecimalDigitsTo d)
```

公理闭包：propext

## Corelib.Init.Hexadecimal.del_head_int

NativeBridge.Incremental.HexadecimalRepresentation.del_head_int_agrees

目标：NativeBridge.Incremental.HexadecimalRepresentation.dropHeadInt；范围：All source values; exact native digit representation, not numeric-value equality. Empty digits and leading/trailing zeros preserved according to the source operation.

```lean
∀ (n : NativeBridge.MN) (d : NativeBridge.Incremental.HexadecimalRepresentation.S),
  NativeBridge.hexadecimalDigitsTo (Rocq.Corelib.Init.Hexadecimal.del_head_int n d) =
    NativeBridge.Incremental.HexadecimalRepresentation.dropHeadInt (NativeBridge.natTo n)
      (NativeBridge.Incremental.Hexadecimal.signedTo d)
```

公理闭包：propext

## Corelib.Init.Hexadecimal.del_tail_int

NativeBridge.Incremental.HexadecimalRepresentation.del_tail_int_agrees

目标：NativeBridge.Incremental.HexadecimalRepresentation.dropTailInt；范围：All source values; exact native digit representation, not numeric-value equality. Empty digits and leading/trailing zeros preserved according to the source operation.

```lean
∀ (n : NativeBridge.MN) (d : NativeBridge.Incremental.HexadecimalRepresentation.S),
  NativeBridge.Incremental.Hexadecimal.signedTo (Rocq.Corelib.Init.Hexadecimal.del_tail_int n d) =
    NativeBridge.Incremental.HexadecimalRepresentation.dropTailInt (NativeBridge.natTo n)
      (NativeBridge.Incremental.Hexadecimal.signedTo d)
```

公理闭包：propext

## Corelib.Init.Hexadecimal.nztail

NativeBridge.Incremental.HexadecimalRepresentation.nztail_agrees

目标：NativeBridge.Incremental.HexadecimalRepresentation.trimTail；范围：All source values; exact native digit representation, not numeric-value equality. Empty digits and leading/trailing zeros preserved according to the source operation.

```lean
∀ (d : NativeBridge.Incremental.HexadecimalRepresentation.U),
  NativeBridge.Incremental.HexadecimalRepresentation.digitCountTo (Rocq.Corelib.Init.Hexadecimal.nztail d) =
    NativeBridge.Incremental.HexadecimalRepresentation.trimTail (NativeBridge.hexadecimalDigitsTo d)
```

公理闭包：propext

## Corelib.Init.Hexadecimal.nztail_int

NativeBridge.Incremental.HexadecimalRepresentation.nztail_int_agrees

目标：NativeBridge.Incremental.HexadecimalRepresentation.trimTailInt；范围：All source values; exact native digit representation, not numeric-value equality. Empty digits and leading/trailing zeros preserved according to the source operation.

```lean
∀ (d : NativeBridge.Incremental.HexadecimalRepresentation.S),
  NativeBridge.Incremental.HexadecimalRepresentation.signedCountTo (Rocq.Corelib.Init.Hexadecimal.nztail_int d) =
    NativeBridge.Incremental.HexadecimalRepresentation.trimTailInt (NativeBridge.Incremental.Hexadecimal.signedTo d)
```

公理闭包：propext

## Corelib.Init.Hexadecimal.Little.double

NativeBridge.Incremental.HexadecimalRepresentation.little_double_agrees

目标：NativeBridge.Incremental.HexadecimalRepresentation.littleDouble；范围：All little-endian digit lists, including empty and noncanonical zeros; double or double+1 with explicit carry. Represents the resulting digit sequence, not just its numeric value.

```lean
∀ (d : NativeBridge.Incremental.HexadecimalRepresentation.U),
  NativeBridge.hexadecimalDigitsTo (Rocq.Corelib.Init.Hexadecimal.Little.double d) =
    NativeBridge.Incremental.HexadecimalRepresentation.littleDouble false (NativeBridge.hexadecimalDigitsTo d)
```

公理闭包：propext

## Corelib.Init.Hexadecimal.Little.succ_double

NativeBridge.Incremental.HexadecimalRepresentation.little_succ_double_agrees

目标：NativeBridge.Incremental.HexadecimalRepresentation.littleDouble；范围：All little-endian digit lists, including empty and noncanonical zeros; double or double+1 with explicit carry. Represents the resulting digit sequence, not just its numeric value.

```lean
∀ (d : NativeBridge.Incremental.HexadecimalRepresentation.U),
  NativeBridge.hexadecimalDigitsTo (Rocq.Corelib.Init.Hexadecimal.Little.succ_double d) =
    NativeBridge.Incremental.HexadecimalRepresentation.littleDouble true (NativeBridge.hexadecimalDigitsTo d)
```

公理闭包：propext

## Corelib.Init.Hexadecimal.uint_rect

NativeBridge.Incremental.HexadecimalRepresentation.uint_rect_agrees

目标：NativeBridge.Incremental.HexadecimalRepresentation.digitsRec；范围：Full native dependent motive over List (Fin 16); source branch family indexed by the sixteen digits, corresponding to List.rec. rect is Sort-polymorphic; rec returns Type.

```lean
∀ (P : List (Fin 16) → Sort u) (nil : P []) (cons : (d : Fin 16) → (ds : List (Fin 16)) → P ds → P (d :: ds))
  (d : NativeBridge.Incremental.HexadecimalRepresentation.U),
  Rocq.Corelib.Init.Hexadecimal.uint_rect (fun d => P (NativeBridge.hexadecimalDigitsTo d)) nil
      (fun d ih => cons 0 (NativeBridge.hexadecimalDigitsTo d) ih)
      (fun d ih => cons 1 (NativeBridge.hexadecimalDigitsTo d) ih)
      (fun d ih => cons 2 (NativeBridge.hexadecimalDigitsTo d) ih)
      (fun d ih => cons 3 (NativeBridge.hexadecimalDigitsTo d) ih)
      (fun d ih => cons 4 (NativeBridge.hexadecimalDigitsTo d) ih)
      (fun d ih => cons 5 (NativeBridge.hexadecimalDigitsTo d) ih)
      (fun d ih => cons 6 (NativeBridge.hexadecimalDigitsTo d) ih)
      (fun d ih => cons 7 (NativeBridge.hexadecimalDigitsTo d) ih)
      (fun d ih => cons 8 (NativeBridge.hexadecimalDigitsTo d) ih)
      (fun d ih => cons 9 (NativeBridge.hexadecimalDigitsTo d) ih)
      (fun d ih => cons 10 (NativeBridge.hexadecimalDigitsTo d) ih)
      (fun d ih => cons 11 (NativeBridge.hexadecimalDigitsTo d) ih)
      (fun d ih => cons 12 (NativeBridge.hexadecimalDigitsTo d) ih)
      (fun d ih => cons 13 (NativeBridge.hexadecimalDigitsTo d) ih)
      (fun d ih => cons 14 (NativeBridge.hexadecimalDigitsTo d) ih)
      (fun d ih => cons 15 (NativeBridge.hexadecimalDigitsTo d) ih) d =
    NativeBridge.Incremental.HexadecimalRepresentation.digitsRec P nil cons (NativeBridge.hexadecimalDigitsTo d)
```

公理闭包：propext

## Corelib.Init.Hexadecimal.uint_rec

NativeBridge.Incremental.HexadecimalRepresentation.uint_rec_agrees

目标：NativeBridge.Incremental.HexadecimalRepresentation.digitsRec；范围：Full native dependent motive over List (Fin 16); source branch family indexed by the sixteen digits, corresponding to List.rec. rect is Sort-polymorphic; rec returns Type.

```lean
∀ (P : List (Fin 16) → Type) (nil : P []) (cons : (d : Fin 16) → (ds : List (Fin 16)) → P ds → P (d :: ds))
  (d : NativeBridge.Incremental.HexadecimalRepresentation.U),
  Rocq.Corelib.Init.Hexadecimal.uint_rec (fun d => P (NativeBridge.hexadecimalDigitsTo d)) nil
      (fun d ih => cons 0 (NativeBridge.hexadecimalDigitsTo d) ih)
      (fun d ih => cons 1 (NativeBridge.hexadecimalDigitsTo d) ih)
      (fun d ih => cons 2 (NativeBridge.hexadecimalDigitsTo d) ih)
      (fun d ih => cons 3 (NativeBridge.hexadecimalDigitsTo d) ih)
      (fun d ih => cons 4 (NativeBridge.hexadecimalDigitsTo d) ih)
      (fun d ih => cons 5 (NativeBridge.hexadecimalDigitsTo d) ih)
      (fun d ih => cons 6 (NativeBridge.hexadecimalDigitsTo d) ih)
      (fun d ih => cons 7 (NativeBridge.hexadecimalDigitsTo d) ih)
      (fun d ih => cons 8 (NativeBridge.hexadecimalDigitsTo d) ih)
      (fun d ih => cons 9 (NativeBridge.hexadecimalDigitsTo d) ih)
      (fun d ih => cons 10 (NativeBridge.hexadecimalDigitsTo d) ih)
      (fun d ih => cons 11 (NativeBridge.hexadecimalDigitsTo d) ih)
      (fun d ih => cons 12 (NativeBridge.hexadecimalDigitsTo d) ih)
      (fun d ih => cons 13 (NativeBridge.hexadecimalDigitsTo d) ih)
      (fun d ih => cons 14 (NativeBridge.hexadecimalDigitsTo d) ih)
      (fun d ih => cons 15 (NativeBridge.hexadecimalDigitsTo d) ih) d =
    NativeBridge.Incremental.HexadecimalRepresentation.digitsRec P nil cons (NativeBridge.hexadecimalDigitsTo d)
```

公理闭包：propext

## Corelib.Init.Hexadecimal.uint_ind

NativeBridge.Incremental.HexadecimalRepresentation.uint_ind_correspondence

目标：NativeBridge.Incremental.HexadecimalRepresentation.digitInduction；范围：Full native statement; original statement and native statement separately proved.

```lean
Rocq.Corelib.Init.Hexadecimal.uint_ind.statement ↔ NativeBridge.Incremental.HexadecimalRepresentation.digitInduction
```

公理闭包：空

## Corelib.Init.Hexadecimal.uint_sind

NativeBridge.Incremental.HexadecimalRepresentation.uint_sind_correspondence

目标：NativeBridge.Incremental.HexadecimalRepresentation.digitInduction；范围：Full native statement; original statement and native statement separately proved.

```lean
Rocq.Corelib.Init.Hexadecimal.uint_sind.statement ↔ NativeBridge.Incremental.HexadecimalRepresentation.digitInduction
```

公理闭包：空

## Corelib.Init.Hexadecimal.internal_hexadecimal_dec_bl

NativeBridge.Incremental.HexadecimalRepresentation.hexadecimal_dec_bl_correspondence

目标：NativeBridge.Incremental.HexadecimalRepresentation.equalitySound；范围：Full native statement; original statement and native statement separately proved.

```lean
Rocq.Corelib.Init.Hexadecimal.internal_hexadecimal_dec_bl.statement ↔
  NativeBridge.Incremental.HexadecimalRepresentation.equalitySound
```

公理闭包：propext

## Corelib.Init.Hexadecimal.internal_hexadecimal_dec_lb

NativeBridge.Incremental.HexadecimalRepresentation.hexadecimal_dec_lb_correspondence

目标：NativeBridge.Incremental.HexadecimalRepresentation.equalityComplete；范围：Full native statement; original statement and native statement separately proved.

```lean
Rocq.Corelib.Init.Hexadecimal.internal_hexadecimal_dec_lb.statement ↔
  NativeBridge.Incremental.HexadecimalRepresentation.equalityComplete
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Init.Hexadecimal.uint_eq_dec

NativeBridge.Incremental.HexadecimalRepresentation.uint_eq_dec_agrees

目标：NativeBridge.Incremental.HexadecimalRepresentation.nativeDecision；范围：All inputs; complete Decidable equality on lossless native representation. Four extracted proof prerequisites closed explicitly; source sumbool maps to the unique native decision.

```lean
∀ (x y : NativeBridge.Incremental.HexadecimalRepresentation.U),
  NativeBridge.Incremental.HexadecimalRepresentation.eqDecisionTo NativeBridge.hexadecimalDigitsIso x y
      (RocqPending.Corelib.Init.Hexadecimal.uint_eq_dec x y) =
    NativeBridge.Incremental.HexadecimalRepresentation.nativeDecision (NativeBridge.hexadecimalDigitsTo x)
      (NativeBridge.hexadecimalDigitsTo y)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Init.Hexadecimal.signed_int_eq_dec

NativeBridge.Incremental.HexadecimalRepresentation.signed_int_eq_dec_agrees

目标：NativeBridge.Incremental.HexadecimalRepresentation.nativeDecision；范围：All inputs; complete Decidable equality on lossless native representation. Four extracted proof prerequisites closed explicitly; source sumbool maps to the unique native decision.

```lean
∀ (x y : NativeBridge.Incremental.HexadecimalRepresentation.S),
  NativeBridge.Incremental.HexadecimalRepresentation.eqDecisionTo NativeBridge.Incremental.Hexadecimal.signedIso x y
      (RocqPending.Corelib.Init.Hexadecimal.signed_int_eq_dec x y) =
    NativeBridge.Incremental.HexadecimalRepresentation.nativeDecision (NativeBridge.Incremental.Hexadecimal.signedTo x)
      (NativeBridge.Incremental.Hexadecimal.signedTo y)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Init.Hexadecimal.hexadecimal_eq_dec

NativeBridge.Incremental.HexadecimalRepresentation.hexadecimal_eq_dec_agrees

目标：NativeBridge.Incremental.HexadecimalRepresentation.nativeDecision；范围：All inputs; complete Decidable equality on lossless native representation. Four extracted proof prerequisites closed explicitly; source sumbool maps to the unique native decision.

```lean
∀ (x y : NativeBridge.Incremental.HexadecimalRepresentation.D),
  NativeBridge.Incremental.HexadecimalRepresentation.eqDecisionTo
      NativeBridge.Incremental.HexadecimalRepresentation.hexadecimalIso x y
      (RocqPending.Corelib.Init.Hexadecimal.hexadecimal_eq_dec x y) =
    NativeBridge.Incremental.HexadecimalRepresentation.nativeDecision
      (NativeBridge.Incremental.HexadecimalRepresentation.hexadecimalTo x)
      (NativeBridge.Incremental.HexadecimalRepresentation.hexadecimalTo y)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Init.Number.number

NativeBridge.Incremental.NumberRepresentation.numberIso

目标：NativeBridge.Incremental.NumberRepresentation.NumberNative；范围：Sum of lossless decimal/hexadecimal numeral records; retains format tag, leading zeros, signs and optional decimal exponent.

```lean
NativeBridge.Iso Rocq.Corelib.Init.Number.number NativeBridge.Incremental.NumberRepresentation.NumberNative
```

公理闭包：propext

## Corelib.Init.Number.uint_beq

NativeBridge.Incremental.NumberRepresentation.uint_beq_agrees

目标：NativeBridge.Incremental.NumberRepresentation.nativeEqual；范围：All inputs; native structural equality of the tagged representation, not equality of evaluated numeric values.

```lean
∀ (x y : Rocq.Corelib.Init.Number.uint),
  NativeBridge.Incremental.NumberRepresentation.digitBoolTo (Rocq.Corelib.Init.Number.uint_beq x y) =
    NativeBridge.Incremental.NumberRepresentation.nativeEqual (NativeBridge.Incremental.NumberRepresentation.toUInt x)
      (NativeBridge.Incremental.NumberRepresentation.toUInt y)
```

公理闭包：propext

## Corelib.Init.Number.signed_int_beq

NativeBridge.Incremental.NumberRepresentation.signed_int_beq_agrees

目标：NativeBridge.Incremental.NumberRepresentation.nativeEqual；范围：All inputs; native structural equality of the tagged representation, not equality of evaluated numeric values.

```lean
∀ (x y : Rocq.Corelib.Init.Number.signed_int),
  NativeBridge.Incremental.NumberRepresentation.digitBoolTo (Rocq.Corelib.Init.Number.signed_int_beq x y) =
    NativeBridge.Incremental.NumberRepresentation.nativeEqual (NativeBridge.Incremental.NumberRepresentation.toSigned x)
      (NativeBridge.Incremental.NumberRepresentation.toSigned y)
```

公理闭包：propext

## Corelib.Init.Number.number_beq

NativeBridge.Incremental.NumberRepresentation.number_beq_agrees

目标：NativeBridge.Incremental.NumberRepresentation.nativeEqual；范围：All inputs; native structural equality of the tagged representation, not equality of evaluated numeric values.

```lean
∀ (x y : Rocq.Corelib.Init.Number.number),
  NativeBridge.Incremental.NumberRepresentation.digitBoolTo (Rocq.Corelib.Init.Number.number_beq x y) =
    NativeBridge.Incremental.NumberRepresentation.nativeEqual (NativeBridge.Incremental.NumberRepresentation.toNumber x)
      (NativeBridge.Incremental.NumberRepresentation.toNumber y)
```

公理闭包：propext

## Corelib.Init.Number.uint_of_uint

NativeBridge.Incremental.NumberRepresentation.uint_of_uint_agrees

目标：id；范围：All tagged unsigned/signed digit representations; identity operation.

```lean
∀ (x : Rocq.Corelib.Init.Number.uint),
  NativeBridge.Incremental.NumberRepresentation.toUInt (Rocq.Corelib.Init.Number.uint_of_uint x) =
    id (NativeBridge.Incremental.NumberRepresentation.toUInt x)
```

公理闭包：空

## Corelib.Init.Number.int_of_int

NativeBridge.Incremental.NumberRepresentation.int_of_int_agrees

目标：id；范围：All tagged unsigned/signed digit representations; identity operation.

```lean
∀ (x : Rocq.Corelib.Init.Number.signed_int),
  NativeBridge.Incremental.NumberRepresentation.toSigned (Rocq.Corelib.Init.Number.int_of_int x) =
    id (NativeBridge.Incremental.NumberRepresentation.toSigned x)
```

公理闭包：空

## Corelib.Init.Number.internal_uint_dec_bl1

NativeBridge.Incremental.NumberRepresentation.uint_dec_bl_correspondence

目标：NativeBridge.Incremental.NumberRepresentation.equalitySound；范围：Full native reflection statement for tagged structural equality; original statement independently proved.

```lean
Rocq.Corelib.Init.Number.internal_uint_dec_bl1.statement ↔
  NativeBridge.Incremental.NumberRepresentation.equalitySound NativeBridge.Incremental.NumberRepresentation.UIntNative
```

公理闭包：propext

## Corelib.Init.Number.internal_uint_dec_lb1

NativeBridge.Incremental.NumberRepresentation.uint_dec_lb_correspondence

目标：NativeBridge.Incremental.NumberRepresentation.equalityComplete；范围：Full native reflection statement for tagged structural equality; original statement independently proved.

```lean
Rocq.Corelib.Init.Number.internal_uint_dec_lb1.statement ↔
  NativeBridge.Incremental.NumberRepresentation.equalityComplete
    NativeBridge.Incremental.NumberRepresentation.UIntNative
```

公理闭包：propext

## Corelib.Init.Number.internal_signed_int_dec_bl1

NativeBridge.Incremental.NumberRepresentation.signed_int_dec_bl_correspondence

目标：NativeBridge.Incremental.NumberRepresentation.equalitySound；范围：Full native reflection statement for tagged structural equality; original statement independently proved.

```lean
Rocq.Corelib.Init.Number.internal_signed_int_dec_bl1.statement ↔
  NativeBridge.Incremental.NumberRepresentation.equalitySound NativeBridge.Incremental.NumberRepresentation.SignedNative
```

公理闭包：propext

## Corelib.Init.Number.internal_signed_int_dec_lb1

NativeBridge.Incremental.NumberRepresentation.signed_int_dec_lb_correspondence

目标：NativeBridge.Incremental.NumberRepresentation.equalityComplete；范围：Full native reflection statement for tagged structural equality; original statement independently proved.

```lean
Rocq.Corelib.Init.Number.internal_signed_int_dec_lb1.statement ↔
  NativeBridge.Incremental.NumberRepresentation.equalityComplete
    NativeBridge.Incremental.NumberRepresentation.SignedNative
```

公理闭包：propext

## Corelib.Init.Number.internal_number_dec_bl

NativeBridge.Incremental.NumberRepresentation.number_dec_bl_correspondence

目标：NativeBridge.Incremental.NumberRepresentation.equalitySound；范围：Full native reflection statement for tagged structural equality; original statement independently proved.

```lean
Rocq.Corelib.Init.Number.internal_number_dec_bl.statement ↔
  NativeBridge.Incremental.NumberRepresentation.equalitySound NativeBridge.Incremental.NumberRepresentation.NumberNative
```

公理闭包：propext

## Corelib.Init.Number.internal_number_dec_lb

NativeBridge.Incremental.NumberRepresentation.number_dec_lb_correspondence

目标：NativeBridge.Incremental.NumberRepresentation.equalityComplete；范围：Full native reflection statement for tagged structural equality; original statement independently proved.

```lean
Rocq.Corelib.Init.Number.internal_number_dec_lb.statement ↔
  NativeBridge.Incremental.NumberRepresentation.equalityComplete
    NativeBridge.Incremental.NumberRepresentation.NumberNative
```

公理闭包：propext

## Corelib.Init.Number.uint_eq_dec

NativeBridge.Incremental.NumberRepresentation.uint_eq_dec_agrees

目标：NativeBridge.Incremental.NumberRepresentation.nativeDecision；范围：All inputs; complete native Decidable equality derived from the proved lawful structural BEq. Four source proof prerequisites closed explicitly.

```lean
∀ (x y : Rocq.Corelib.Init.Number.uint),
  NativeBridge.Incremental.NumberRepresentation.eqDecisionTo NativeBridge.Incremental.NumberRepresentation.uintIso x y
      (RocqPending.Corelib.Init.Number.uint_eq_dec x y) =
    NativeBridge.Incremental.NumberRepresentation.nativeDecision
      (NativeBridge.Incremental.NumberRepresentation.toUInt x) (NativeBridge.Incremental.NumberRepresentation.toUInt y)
```

公理闭包：propext

## Corelib.Init.Number.signed_int_eq_dec

NativeBridge.Incremental.NumberRepresentation.signed_int_eq_dec_agrees

目标：NativeBridge.Incremental.NumberRepresentation.nativeDecision；范围：All inputs; complete native Decidable equality derived from the proved lawful structural BEq. Four source proof prerequisites closed explicitly.

```lean
∀ (x y : Rocq.Corelib.Init.Number.signed_int),
  NativeBridge.Incremental.NumberRepresentation.eqDecisionTo NativeBridge.Incremental.NumberRepresentation.signed_intIso
      x y (RocqPending.Corelib.Init.Number.signed_int_eq_dec x y) =
    NativeBridge.Incremental.NumberRepresentation.nativeDecision
      (NativeBridge.Incremental.NumberRepresentation.toSigned x)
      (NativeBridge.Incremental.NumberRepresentation.toSigned y)
```

公理闭包：propext

## Corelib.Init.Number.number_eq_dec

NativeBridge.Incremental.NumberRepresentation.number_eq_dec_agrees

目标：NativeBridge.Incremental.NumberRepresentation.nativeDecision；范围：All inputs; complete native Decidable equality derived from the proved lawful structural BEq. Four source proof prerequisites closed explicitly.

```lean
∀ (x y : Rocq.Corelib.Init.Number.number),
  NativeBridge.Incremental.NumberRepresentation.eqDecisionTo NativeBridge.Incremental.NumberRepresentation.numberIso x y
      (RocqPending.Corelib.Init.Number.number_eq_dec x y) =
    NativeBridge.Incremental.NumberRepresentation.nativeDecision
      (NativeBridge.Incremental.NumberRepresentation.toNumber x)
      (NativeBridge.Incremental.NumberRepresentation.toNumber y)
```

公理闭包：propext

## Corelib.Init.Byte.to_bits

NativeBridge.Incremental.ByteOperations.to_bits_agrees

目标：NativeBridge.Incremental.ByteOperations.byteBits；范围：All 256 bytes; eight native Bool fields from BitVec.getLsbD, least significant bit first.

```lean
∀ (b : Rocq.Corelib.Init.Byte.byte),
  NativeBridge.Incremental.ByteOperations.bitsTo (Rocq.Corelib.Init.Byte.to_bits b) =
    NativeBridge.Incremental.ByteOperations.byteBits (NativeBridge.byteTo b)
```

公理闭包：propext

## Corelib.Init.Byte.of_bits

NativeBridge.Incremental.ByteOperations.of_bits_agrees

目标：NativeBridge.Incremental.ByteOperations.bitsByte；范围：All 256 combinations of eight bits; native weighted sum through BitVec.ofNat 8, result Fin 256.

```lean
∀ (x : NativeBridge.Incremental.ByteOperations.RBits),
  NativeBridge.byteTo (Rocq.Corelib.Init.Byte.of_bits x) =
    NativeBridge.Incremental.ByteOperations.bitsByte (NativeBridge.Incremental.ByteOperations.bitsTo x)
```

公理闭包：空

## Corelib.Init.Byte.byte_of_byte

NativeBridge.Incremental.ByteOperations.byte_of_byte_agrees

目标：id；范围：Identity on Fin 256.

```lean
∀ (b : Rocq.Corelib.Init.Byte.byte),
  NativeBridge.byteTo (Rocq.Corelib.Init.Byte.byte_of_byte b) = id (NativeBridge.byteTo b)
```

公理闭包：空

## Corelib.Init.Byte.of_bits_to_bits

NativeBridge.Incremental.ByteOperations.of_bits_to_bits_correspondence

目标：NativeBridge.Incremental.ByteOperations.byteRoundtrip；范围：Full byte roundtrip; original statement independently proved by all constructor cases.

```lean
Rocq.Corelib.Init.Byte.of_bits_to_bits.statement ↔ NativeBridge.Incremental.ByteOperations.byteRoundtrip
```

公理闭包：propext

## Corelib.Init.Byte.to_bits_of_bits

NativeBridge.Incremental.ByteOperations.to_bits_of_bits_correspondence

目标：NativeBridge.Incremental.ByteOperations.bitsRoundtrip；范围：Full eight-bit tuple roundtrip; all boolean combinations checked in the original statement proof.

```lean
Rocq.Corelib.Init.Byte.to_bits_of_bits.statement ↔ NativeBridge.Incremental.ByteOperations.bitsRoundtrip
```

公理闭包：propext

## Corelib.Init.Byte.byte_rec

NativeBridge.Incremental.ByteElimination.byte_rec_agrees

目标：NativeBridge.Incremental.ByteElimination.finByteRec；范围：All 256 branch values and dependent native motives; Type-valued source recursor, native nested Fin.cases.

```lean
∀ (P : Fin 256 → Type) (h0 : P 0) (h1 : P 1) (h2 : P 2) (h3 : P 3) (h4 : P 4) (h5 : P 5) (h6 : P 6) (h7 : P 7)
  (h8 : P 8) (h9 : P 9) (h10 : P 10) (h11 : P 11) (h12 : P 12) (h13 : P 13) (h14 : P 14) (h15 : P 15) (h16 : P 16)
  (h17 : P 17) (h18 : P 18) (h19 : P 19) (h20 : P 20) (h21 : P 21) (h22 : P 22) (h23 : P 23) (h24 : P 24) (h25 : P 25)
  (h26 : P 26) (h27 : P 27) (h28 : P 28) (h29 : P 29) (h30 : P 30) (h31 : P 31) (h32 : P 32) (h33 : P 33) (h34 : P 34)
  (h35 : P 35) (h36 : P 36) (h37 : P 37) (h38 : P 38) (h39 : P 39) (h40 : P 40) (h41 : P 41) (h42 : P 42) (h43 : P 43)
  (h44 : P 44) (h45 : P 45) (h46 : P 46) (h47 : P 47) (h48 : P 48) (h49 : P 49), ⋯
```

公理闭包：propext

## Corelib.Init.Byte.byte_rect

NativeBridge.Incremental.ByteElimination.byte_rect_agrees

目标：NativeBridge.Incremental.ByteElimination.finByteRec；范围：All 256 branch values and dependent native motives over any Sort, including Prop; native nested Fin.cases.

```lean
∀ (P : Fin 256 → Sort u) (h0 : P 0) (h1 : P 1) (h2 : P 2) (h3 : P 3) (h4 : P 4) (h5 : P 5) (h6 : P 6) (h7 : P 7)
  (h8 : P 8) (h9 : P 9) (h10 : P 10) (h11 : P 11) (h12 : P 12) (h13 : P 13) (h14 : P 14) (h15 : P 15) (h16 : P 16)
  (h17 : P 17) (h18 : P 18) (h19 : P 19) (h20 : P 20) (h21 : P 21) (h22 : P 22) (h23 : P 23) (h24 : P 24) (h25 : P 25)
  (h26 : P 26) (h27 : P 27) (h28 : P 28) (h29 : P 29) (h30 : P 30) (h31 : P 31) (h32 : P 32) (h33 : P 33) (h34 : P 34)
  (h35 : P 35) (h36 : P 36) (h37 : P 37) (h38 : P 38) (h39 : P 39) (h40 : P 40) (h41 : P 41) (h42 : P 42) (h43 : P 43)
  (h44 : P 44) (h45 : P 45) (h46 : P 46) (h47 : P 47) (h48 : P 48) (h49 : P 49), ⋯
```

公理闭包：propext

## Corelib.Init.Byte.byte_ind

NativeBridge.Incremental.ByteElimination.byte_ind_correspondence

目标：NativeBridge.Incremental.ByteElimination.byteInduction；范围：Complete 256-premise induction statement over Fin 256; original statement independently proved.

```lean
Rocq.Corelib.Init.Byte.byte_ind.statement ↔ NativeBridge.Incremental.ByteElimination.byteInduction
```

公理闭包：propext

## Corelib.Init.Byte.byte_sind

NativeBridge.Incremental.ByteElimination.byte_sind_correspondence

目标：NativeBridge.Incremental.ByteElimination.byteInduction；范围：Complete 256-premise induction statement over Fin 256; original statement independently proved.

```lean
Rocq.Corelib.Init.Byte.byte_sind.statement ↔ NativeBridge.Incremental.ByteElimination.byteInduction
```

公理闭包：propext

## Corelib.Numbers.Cyclic.Int63.CarryType.carry

NativeBridge.Incremental.WordOperations.carryIso

目标：NativeBridge.Incremental.WordOperations.CarryNative；范围：Every Sort-valued payload; PProd Bool A with C0=false and C1=true; both inverse laws.

```lean
(A : Sort u) → NativeBridge.Iso (Rocq.Corelib.Numbers.Cyclic.Int63.CarryType.carry A) (Bool ×' A)
```

公理闭包：空

## Corelib.Numbers.Cyclic.Int63.PrimInt63.pos_neg_int63

NativeBridge.Incremental.WordOperations.signedWordIso

目标：NativeBridge.Incremental.WordOperations.SignedWordNative；范围：Sign flag and all 63-bit words; preserves negative zero and format sign independently of two-complement interpretation.

```lean
NativeBridge.Iso Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.pos_neg_int63
  NativeBridge.Incremental.WordOperations.SignedWordNative
```

公理闭包：空

## Corelib.Numbers.Cyclic.Int63.PrimInt63.addc

NativeBridge.Incremental.WordOperations.addc_agrees

目标：NativeBridge.Incremental.WordOperations.addCarry；范围：All words; modulo-2^63 sum and overflow flag.

```lean
∀ (x y : NativeBridge.Incremental.WordOperations.Word),
  NativeBridge.Incremental.WordOperations.wordCarryTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.addc x y) =
    NativeBridge.Incremental.WordOperations.addCarry x y
```

公理闭包：空

## Corelib.Numbers.Cyclic.Int63.PrimInt63.addcarryc

NativeBridge.Incremental.WordOperations.addcarryc_agrees

目标：NativeBridge.Incremental.WordOperations.addCarryOne；范围：All words; sum plus one and overflow flag.

```lean
∀ (x y : NativeBridge.Incremental.WordOperations.Word),
  NativeBridge.Incremental.WordOperations.wordCarryTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.addcarryc x y) =
    NativeBridge.Incremental.WordOperations.addCarryOne x y
```

公理闭包：空

## Corelib.Numbers.Cyclic.Int63.PrimInt63.subc

NativeBridge.Incremental.WordOperations.subc_agrees

目标：NativeBridge.Incremental.WordOperations.subCarry；范围：All words; modular difference and borrow flag.

```lean
∀ (x y : NativeBridge.Incremental.WordOperations.Word),
  NativeBridge.Incremental.WordOperations.wordCarryTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.subc x y) =
    NativeBridge.Incremental.WordOperations.subCarry x y
```

公理闭包：空

## Corelib.Numbers.Cyclic.Int63.PrimInt63.subcarryc

NativeBridge.Incremental.WordOperations.subcarryc_agrees

目标：NativeBridge.Incremental.WordOperations.subCarryOne；范围：All words; modular difference minus one and borrow flag.

```lean
∀ (x y : NativeBridge.Incremental.WordOperations.Word),
  NativeBridge.Incremental.WordOperations.wordCarryTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.subcarryc x y) =
    NativeBridge.Incremental.WordOperations.subCarryOne x y
```

公理闭包：空

## Corelib.Numbers.Cyclic.Int63.PrimInt63.mulc

NativeBridge.Incremental.WordOperations.mulc_agrees

目标：NativeBridge.Incremental.WordOperations.mulWide；范围：All words; high and low halves of the 126-bit product.

```lean
∀ (x y : NativeBridge.Incremental.WordOperations.Word),
  NativeBridge.Incremental.WordOperations.wordPairTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mulc x y) =
    NativeBridge.Incremental.WordOperations.mulWide x y
```

公理闭包：空

## Corelib.Numbers.Cyclic.Int63.PrimInt63.diveucl

NativeBridge.Incremental.WordOperations.diveucl_agrees

目标：NativeBridge.Incremental.WordOperations.divRem；范围：All words including zero divisor; native BitVec unsigned division and remainder pair.

```lean
∀ (x y : NativeBridge.Incremental.WordOperations.Word),
  NativeBridge.Incremental.WordOperations.wordPairTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.diveucl x y) =
    NativeBridge.Incremental.WordOperations.divRem x y
```

公理闭包：propext

## Corelib.Numbers.Cyclic.Int63.PrimInt63.diveucl_21

NativeBridge.Incremental.WordOperations.diveucl_21_agrees

目标：NativeBridge.Incremental.WordOperations.divDouble；范围：All words; two-word dividend division only when high half < divisor, otherwise (0,0), preserving the source guard.

```lean
∀ (hi lo y : NativeBridge.Incremental.WordOperations.Word),
  NativeBridge.Incremental.WordOperations.wordPairTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.diveucl_21 hi lo y) =
    NativeBridge.Incremental.WordOperations.divDouble hi lo y
```

公理闭包：空

## Corelib.Numbers.Cyclic.Int63.PrimInt63.divs

NativeBridge.Incremental.WordOperations.divs_agrees

目标：NativeBridge.Incremental.WordOperations.signedDiv；范围：All words; Int.tdiv on signed values then BitVec.ofInt 63 reduction, including zero divisor and overflow.

```lean
∀ (x y : NativeBridge.Incremental.WordOperations.Word),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.divs x y = NativeBridge.Incremental.WordOperations.signedDiv x y
```

公理闭包：propext, Quot.sound

## Corelib.Numbers.Cyclic.Int63.PrimInt63.mods

NativeBridge.Incremental.WordOperations.mods_agrees

目标：NativeBridge.Incremental.WordOperations.signedRem；范围：All words; Int.tmod on signed values then BitVec.ofInt 63 reduction.

```lean
∀ (x y : NativeBridge.Incremental.WordOperations.Word),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mods x y = NativeBridge.Incremental.WordOperations.signedRem x y
```

公理闭包：propext, Quot.sound

## Corelib.Numbers.Cyclic.Int63.PrimInt63.asr

NativeBridge.Incremental.WordOperations.asr_agrees

目标：NativeBridge.Incremental.WordOperations.arithmeticShift；范围：All words; signed-negative shift amount yields zero, otherwise signed shift by min(amount,63).

```lean
∀ (x y : NativeBridge.Incremental.WordOperations.Word),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.asr x y = NativeBridge.Incremental.WordOperations.arithmeticShift x y
```

公理闭包：propext, Quot.sound

## Corelib.Numbers.Cyclic.Int63.PrimInt63.addmuldiv

NativeBridge.Incremental.WordOperations.addmuldiv_agrees

目标：NativeBridge.Incremental.WordOperations.funnelShift；范围：All words; native BitVec logical shifts and OR. The complementary shift count is modular 63-p, not unbounded Nat subtraction.

```lean
∀ (p x y : NativeBridge.Incremental.WordOperations.Word),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.addmuldiv p x y =
    NativeBridge.Incremental.WordOperations.funnelShift p x y
```

公理闭包：propext, Quot.sound

## Corelib.Numbers.Cyclic.Int63.PrimInt63.parser

NativeBridge.Incremental.WordOperations.parser_agrees

目标：NativeBridge.Incremental.WordOperations.parseWord；范围：All sign/word inputs; negative sign always rejected, including negative zero.

```lean
∀ (x : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.pos_neg_int63),
  NativeBridge.Incremental.WordOperations.wordOptionTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.parser x) =
    NativeBridge.Incremental.WordOperations.parseWord (NativeBridge.Incremental.WordOperations.signedWordTo x)
```

公理闭包：空

## Corelib.Numbers.Cyclic.Int63.PrimInt63.printer

NativeBridge.Incremental.WordOperations.printer_agrees

目标：NativeBridge.Incremental.WordOperations.printWord；范围：Every source wrapper; preserves word and emits positive sign.

```lean
∀ (x : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int_wrapper),
  NativeBridge.Incremental.WordOperations.signedWordTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.printer x) =
    NativeBridge.Incremental.WordOperations.printWord (NativeBridge.int63WrapperIso.to x)
```

公理闭包：空

## Corelib.Numbers.Cyclic.Int63.PrimInt63.int_wrap

NativeBridge.Incremental.WordOperations.int_wrap_agrees

目标：id；范围：Every source wrapper; native identity after the established wrapper Iso.

```lean
∀ (x : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int_wrapper),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int_wrap x = id (NativeBridge.int63WrapperIso.to x)
```

公理闭包：空

## Corelib.Numbers.Cyclic.Int63.PrimInt63.head0

NativeBridge.Incremental.WordOperations.head0_agrees

目标：BitVec.clz；范围：All words; proved against native BitVec.clz using the logarithmic characterization of the source count, with zero returning 63.

```lean
∀ (x : NativeBridge.Incremental.WordOperations.Word), Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.head0 x = BitVec.clz x
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.PrimInt63.tail0

NativeBridge.Incremental.WordOperations.tail0_agrees

目标：BitVec.ctz；范围：All words; proved against native BitVec.ctz using the first set bit and all preceding zero bits; zero returns 63.

```lean
∀ (x : NativeBridge.Incremental.WordOperations.Word), Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.tail0 x = BitVec.ctz x
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Strings.PrimString.char63

NativeBridge.Incremental.PrimitiveStrings.charIso

目标：NativeBridge.Incremental.PrimitiveStrings.Word；范围：All values; explicit two-sided inverse. Byte strings preserve arbitrary bytes and embedded NUL, with bounded length; char63 retains the full 63-bit domain.

```lean
NativeBridge.Iso Rocq.Corelib.Strings.PrimString.char63 NativeBridge.Incremental.PrimitiveStrings.Word
```

公理闭包：空

## Corelib.Strings.PrimString.char63_wrapper

NativeBridge.Incremental.PrimitiveStrings.charWrapperIso

目标：NativeBridge.Incremental.PrimitiveStrings.Word；范围：All values; explicit two-sided inverse. Byte strings preserve arbitrary bytes and embedded NUL, with bounded length; char63 retains the full 63-bit domain.

```lean
NativeBridge.Iso Rocq.Corelib.Strings.PrimString.char63_wrapper NativeBridge.Incremental.PrimitiveStrings.Word
```

公理闭包：空

## Corelib.Strings.PrimString.PStringNotations.string_wrapper

NativeBridge.Incremental.PrimitiveStrings.stringWrapperIso

目标：NativeBridge.Incremental.PrimitiveStrings.Bytes；范围：All values; explicit two-sided inverse. Byte strings preserve arbitrary bytes and embedded NUL, with bounded length; char63 retains the full 63-bit domain.

```lean
NativeBridge.Iso Rocq.Corelib.Strings.PrimString.PStringNotations.string_wrapper
  NativeBridge.Incremental.PrimitiveStrings.Bytes
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Strings.PrimString.make

NativeBridge.Incremental.PrimitiveStrings.make_agrees

目标：NativeBridge.Incremental.PrimitiveStrings.repeatByte；范围：All 63-bit sizes and characters; native Vector.replicate, length clipped at 16777211 and character reduced modulo 256.

```lean
∀ (n c : NativeBridge.Incremental.PrimitiveStrings.Word),
  NativeBridge.byteStringTo (Rocq.Corelib.Strings.PrimString.make n c) =
    NativeBridge.Incremental.PrimitiveStrings.repeatByte n c
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Strings.PrimString.sub

NativeBridge.Incremental.PrimitiveStrings.sub_agrees

目标：NativeBridge.Incremental.PrimitiveStrings.sliceBytes；范围：All byte strings and offsets/lengths; clipped native vector slice, including out-of-range empty results.

```lean
∀ (s : Rocq.Corelib.Strings.PrimString.string) (off len : NativeBridge.Incremental.PrimitiveStrings.Word),
  NativeBridge.byteStringTo (Rocq.Corelib.Strings.PrimString.sub s off len) =
    NativeBridge.Incremental.PrimitiveStrings.sliceBytes (NativeBridge.byteStringTo s) off len
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Strings.PrimString.cat

NativeBridge.Incremental.PrimitiveStrings.cat_agrees

目标：NativeBridge.Incremental.PrimitiveStrings.appendBytes；范围：All byte strings; native vector concatenation with total length clipped at 16777211.

```lean
∀ (a b : Rocq.Corelib.Strings.PrimString.string),
  NativeBridge.byteStringTo (Rocq.Corelib.Strings.PrimString.cat a b) =
    NativeBridge.Incremental.PrimitiveStrings.appendBytes (NativeBridge.byteStringTo a) (NativeBridge.byteStringTo b)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Strings.PrimString.compare

NativeBridge.Incremental.PrimitiveStrings.compare_agrees

目标：NativeBridge.Incremental.PrimitiveStrings.compareBytes；范围：All byte strings; source-free bytewise lexicographic comparison expressed using native vectors and Nat order. Not yet identified with the existing List.compareLex API.

```lean
∀ (a b : Rocq.Corelib.Strings.PrimString.string),
  NativeBridge.comparisonTo (Rocq.Corelib.Strings.PrimString.compare a b) =
    NativeBridge.Incremental.PrimitiveStrings.compareBytes (NativeBridge.byteStringTo a) (NativeBridge.byteStringTo b)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Strings.PrimString.eqb

NativeBridge.Incremental.PrimitiveStrings.eqb_agrees

目标：NativeBridge.Incremental.PrimitiveStrings.equalBytes；范围：All byte strings; equality branch of the proved source-free native lexicographic comparison.

```lean
∀ (a b : Rocq.Corelib.Strings.PrimString.string),
  NativeBridge.boolTo (Rocq.Corelib.Strings.PrimString.eqb a b) =
    NativeBridge.Incremental.PrimitiveStrings.equalBytes (NativeBridge.byteStringTo a) (NativeBridge.byteStringTo b)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Strings.PrimString.max_length

NativeBridge.Incremental.PrimitiveStrings.max_length_agrees

目标：NativeBridge.Incremental.PrimitiveStrings.capacity；范围：Exact primitive capacity 16777211 as BitVec 63.

```lean
Rocq.Corelib.Strings.PrimString.max_length = NativeBridge.Incremental.PrimitiveStrings.capacity
```

公理闭包：空

## Corelib.Strings.PrimString.Char63Notations.parse

NativeBridge.Incremental.PrimitiveStrings.parse_agrees

目标：NativeBridge.Incremental.PrimitiveStrings.parseChar；范围：All byte strings; accepts exactly one byte, including NUL, and widens it to BitVec 63.

```lean
∀ (s : Rocq.Corelib.Strings.PrimString.string),
  Option.map NativeBridge.Incremental.PrimitiveStrings.charTo
      (NativeBridge.optionTo (Rocq.Corelib.Strings.PrimString.Char63Notations.parse s)) =
    NativeBridge.Incremental.PrimitiveStrings.parseChar (NativeBridge.byteStringTo s)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Strings.PrimString.Char63Notations.print

NativeBridge.Incremental.PrimitiveStrings.print_agrees

目标：NativeBridge.Incremental.PrimitiveStrings.printChar；范围：All 63-bit character wrappers; accepts values below 256, rejects larger values rather than silently truncating.

```lean
∀ (c : Rocq.Corelib.Strings.PrimString.char63_wrapper),
  Option.map NativeBridge.byteStringTo
      (NativeBridge.optionTo (Rocq.Corelib.Strings.PrimString.Char63Notations.print c)) =
    NativeBridge.Incremental.PrimitiveStrings.printChar (NativeBridge.Incremental.PrimitiveStrings.charTo c)
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Strings.PrimString.char63_wrap

NativeBridge.Incremental.PrimitiveStrings.char_wrap_agrees

目标：id；范围：Every source input; identity after the explicit representation or wrapper Iso.

```lean
∀ (c : Rocq.Corelib.Strings.PrimString.char63_wrapper),
  Rocq.Corelib.Strings.PrimString.char63_wrap c = id (NativeBridge.Incremental.PrimitiveStrings.charTo c)
```

公理闭包：空

## Corelib.Strings.PrimString.PStringNotations.string_wrap

NativeBridge.Incremental.PrimitiveStrings.string_wrap_agrees

目标：id；范围：Every source input; identity after the explicit representation or wrapper Iso.

```lean
∀ (s : Rocq.Corelib.Strings.PrimString.PStringNotations.string_wrapper),
  NativeBridge.byteStringTo (Rocq.Corelib.Strings.PrimString.PStringNotations.string_wrap s) =
    id (NativeBridge.Incremental.PrimitiveStrings.stringTo s)
```

公理闭包：propext

## Corelib.Strings.PrimString.PStringNotations.id_string

NativeBridge.Incremental.PrimitiveStrings.id_string_agrees

目标：id；范围：Every source input; identity after the explicit representation or wrapper Iso.

```lean
∀ (s : Rocq.Corelib.Strings.PrimString.string),
  NativeBridge.byteStringTo (Rocq.Corelib.Strings.PrimString.PStringNotations.id_string s) =
    id (NativeBridge.byteStringTo s)
```

公理闭包：propext

## Corelib.Init.Equality.Has_refl

NativeBridge.Incremental.GenericEquality.reflIso

目标：NativeBridge.Incremental.GenericEquality.Refl；范围：All universe parameters of the mechanically translated Type-valued generic relation; two-sided identity Iso to a source-free dependent function type. Does not assert that an arbitrary relation is Lean Eq.

```lean
(R : NativeBridge.Incremental.GenericEquality.RelationFamily) →
  NativeBridge.Iso (Rocq.Corelib.Init.Equality.Has_refl R) (NativeBridge.Incremental.GenericEquality.Refl R)
```

公理闭包：空

## Corelib.Init.Equality.Has_J

NativeBridge.Incremental.GenericEquality.jIso

目标：NativeBridge.Incremental.GenericEquality.J；范围：All universe parameters of the mechanically translated Type-valued generic relation; two-sided identity Iso to a source-free dependent function type. Does not assert that an arbitrary relation is Lean Eq.

```lean
(R : NativeBridge.Incremental.GenericEquality.RelationFamily) →
  (r : NativeBridge.Incremental.GenericEquality.Refl R) →
    NativeBridge.Iso (Rocq.Corelib.Init.Equality.Has_J R r) (NativeBridge.Incremental.GenericEquality.J R r)
```

公理闭包：空

## Corelib.Init.Equality.Has_J_forward

NativeBridge.Incremental.GenericEquality.jBackwardIso

目标：NativeBridge.Incremental.GenericEquality.JBackward；范围：All universe parameters of the mechanically translated Type-valued generic relation; two-sided identity Iso to a source-free dependent function type. Does not assert that an arbitrary relation is Lean Eq.

```lean
(R : NativeBridge.Incremental.GenericEquality.RelationFamily) →
  (r : NativeBridge.Incremental.GenericEquality.Refl R) →
    NativeBridge.Iso (Rocq.Corelib.Init.Equality.Has_J_forward R r)
      (NativeBridge.Incremental.GenericEquality.JBackward R r)
```

公理闭包：空

## Corelib.Init.Equality.Has_J_r

NativeBridge.Incremental.GenericEquality.jRightIso

目标：NativeBridge.Incremental.GenericEquality.JRight；范围：All universe parameters of the mechanically translated Type-valued generic relation; two-sided identity Iso to a source-free dependent function type. Does not assert that an arbitrary relation is Lean Eq.

```lean
(R : NativeBridge.Incremental.GenericEquality.RelationFamily) →
  (r : NativeBridge.Incremental.GenericEquality.Refl R) →
    NativeBridge.Iso (Rocq.Corelib.Init.Equality.Has_J_r R r) (NativeBridge.Incremental.GenericEquality.JRight R r)
```

公理闭包：空

## Corelib.Init.Equality.Has_J_r_forward

NativeBridge.Incremental.GenericEquality.jRightBackwardIso

目标：NativeBridge.Incremental.GenericEquality.JRightBackward；范围：All universe parameters of the mechanically translated Type-valued generic relation; two-sided identity Iso to a source-free dependent function type. Does not assert that an arbitrary relation is Lean Eq.

```lean
(R : NativeBridge.Incremental.GenericEquality.RelationFamily) →
  (r : NativeBridge.Incremental.GenericEquality.Refl R) →
    NativeBridge.Iso (Rocq.Corelib.Init.Equality.Has_J_r_forward R r)
      (NativeBridge.Incremental.GenericEquality.JRightBackward R r)
```

公理闭包：空

## Corelib.Init.Equality.Has_Leibniz

NativeBridge.Incremental.GenericEquality.leibnizIso

目标：NativeBridge.Incremental.GenericEquality.Leibniz；范围：All universe parameters of the mechanically translated Type-valued generic relation; two-sided identity Iso to a source-free dependent function type. Does not assert that an arbitrary relation is Lean Eq.

```lean
(R : NativeBridge.Incremental.GenericEquality.RelationFamily) →
  NativeBridge.Iso (Rocq.Corelib.Init.Equality.Has_Leibniz R) (NativeBridge.Incremental.GenericEquality.Leibniz R)
```

公理闭包：空

## Corelib.Init.Equality.Has_Leibniz_r

NativeBridge.Incremental.GenericEquality.leibnizRightIso

目标：NativeBridge.Incremental.GenericEquality.LeibnizRight；范围：All universe parameters of the mechanically translated Type-valued generic relation; two-sided identity Iso to a source-free dependent function type. Does not assert that an arbitrary relation is Lean Eq.

```lean
(R : NativeBridge.Incremental.GenericEquality.RelationFamily) →
  NativeBridge.Iso (Rocq.Corelib.Init.Equality.Has_Leibniz_r R)
    (NativeBridge.Incremental.GenericEquality.LeibnizRight R)
```

公理闭包：空

## Corelib.Init.Equality.Has_J_Has_J_forward

NativeBridge.Incremental.GenericEquality.jToBackward_agrees

目标：NativeBridge.Incremental.GenericEquality.jToBackward；范围：All generic relations and explicitly supplied reflexivity/elimination functions, with original universes retained. Native function composition is proved definitionally equal. ap/sym additionally have checked PLift Eq client instances using congrArg/Eq.symm.

```lean
∀ (R : NativeBridge.Incremental.GenericEquality.RelationFamily) (r : NativeBridge.Incremental.GenericEquality.Refl R),
  Rocq.Corelib.Init.Equality.Has_J_Has_J_forward R r = NativeBridge.Incremental.GenericEquality.jToBackward R r
```

公理闭包：空

## Corelib.Init.Equality._Has_J_Has_J_forward

NativeBridge.Incremental.GenericEquality.jToBackward_internal_agrees

目标：NativeBridge.Incremental.GenericEquality.jToBackward；范围：All generic relations and explicitly supplied reflexivity/elimination functions, with original universes retained. Native function composition is proved definitionally equal. ap/sym additionally have checked PLift Eq client instances using congrArg/Eq.symm.

```lean
∀ (R : NativeBridge.Incremental.GenericEquality.RelationFamily) (r : NativeBridge.Incremental.GenericEquality.Refl R),
  Rocq.Corelib.Init.Equality._Has_J_Has_J_forward R r = NativeBridge.Incremental.GenericEquality.jToBackward R r
```

公理闭包：空

## Corelib.Init.Equality.Has_J_r_Has_J_r_forward

NativeBridge.Incremental.GenericEquality.jRightToBackward_agrees

目标：NativeBridge.Incremental.GenericEquality.jRightToBackward；范围：All generic relations and explicitly supplied reflexivity/elimination functions, with original universes retained. Native function composition is proved definitionally equal. ap/sym additionally have checked PLift Eq client instances using congrArg/Eq.symm.

```lean
∀ (R : NativeBridge.Incremental.GenericEquality.RelationFamily) (r : NativeBridge.Incremental.GenericEquality.Refl R),
  Rocq.Corelib.Init.Equality.Has_J_r_Has_J_r_forward R r = NativeBridge.Incremental.GenericEquality.jRightToBackward R r
```

公理闭包：空

## Corelib.Init.Equality._Has_J_r_Has_J_r_forward

NativeBridge.Incremental.GenericEquality.jRightToBackward_internal_agrees

目标：NativeBridge.Incremental.GenericEquality.jRightToBackward；范围：All generic relations and explicitly supplied reflexivity/elimination functions, with original universes retained. Native function composition is proved definitionally equal. ap/sym additionally have checked PLift Eq client instances using congrArg/Eq.symm.

```lean
∀ (R : NativeBridge.Incremental.GenericEquality.RelationFamily) (r : NativeBridge.Incremental.GenericEquality.Refl R),
  Rocq.Corelib.Init.Equality._Has_J_r_Has_J_r_forward R r =
    NativeBridge.Incremental.GenericEquality.jRightToBackward R r
```

公理闭包：空

## Corelib.Init.Equality.Has_J_Has_Leibniz

NativeBridge.Incremental.GenericEquality.jToLeibniz_agrees

目标：NativeBridge.Incremental.GenericEquality.jToLeibniz；范围：All generic relations and explicitly supplied reflexivity/elimination functions, with original universes retained. Native function composition is proved definitionally equal. ap/sym additionally have checked PLift Eq client instances using congrArg/Eq.symm.

```lean
∀ (R : NativeBridge.Incremental.GenericEquality.RelationFamily) (r : NativeBridge.Incremental.GenericEquality.Refl R),
  Rocq.Corelib.Init.Equality.Has_J_Has_Leibniz R r = NativeBridge.Incremental.GenericEquality.jToLeibniz R r
```

公理闭包：空

## Corelib.Init.Equality.J_no_dep

NativeBridge.Incremental.GenericEquality.jNoDep_agrees

目标：NativeBridge.Incremental.GenericEquality.jToLeibniz；范围：All generic relations and explicitly supplied reflexivity/elimination functions, with original universes retained. Native function composition is proved definitionally equal. ap/sym additionally have checked PLift Eq client instances using congrArg/Eq.symm.

```lean
∀ (R : NativeBridge.Incremental.GenericEquality.RelationFamily) (r : NativeBridge.Incremental.GenericEquality.Refl R),
  Rocq.Corelib.Init.Equality.J_no_dep R r = NativeBridge.Incremental.GenericEquality.jToLeibniz R r
```

公理闭包：空

## Corelib.Init.Equality.ap

NativeBridge.Incremental.GenericEquality.ap_agrees

目标：NativeBridge.Incremental.GenericEquality.ap；范围：All generic relations and explicitly supplied reflexivity/elimination functions, with original universes retained. Native function composition is proved definitionally equal. ap/sym additionally have checked PLift Eq client instances using congrArg/Eq.symm.

```lean
∀ (R : NativeBridge.Incremental.GenericEquality.RelationFamily)
  (S : NativeBridge.Incremental.GenericEquality.RelationFamily),
  Rocq.Corelib.Init.Equality.ap R S = NativeBridge.Incremental.GenericEquality.ap R S
```

公理闭包：空

## Corelib.Init.Equality.sym

NativeBridge.Incremental.GenericEquality.sym_agrees

目标：NativeBridge.Incremental.GenericEquality.sym；范围：All generic relations and explicitly supplied reflexivity/elimination functions, with original universes retained. Native function composition is proved definitionally equal. ap/sym additionally have checked PLift Eq client instances using congrArg/Eq.symm.

```lean
∀ (R : NativeBridge.Incremental.GenericEquality.RelationFamily),
  Rocq.Corelib.Init.Equality.sym R = NativeBridge.Incremental.GenericEquality.sym R
```

公理闭包：空

## Corelib.Init.Equality.refl

NativeBridge.Incremental.GenericEquality.refl_agrees

目标：id；范围：All supplied generic eliminators; the source operation is native identity on the corresponding dependent function space.

```lean
∀ (R : NativeBridge.Incremental.GenericEquality.RelationFamily), Rocq.Corelib.Init.Equality.refl R = id
```

公理闭包：空

## Corelib.Init.Equality.J_eliminator

NativeBridge.Incremental.GenericEquality.jEliminator_agrees

目标：id；范围：All supplied generic eliminators; the source operation is native identity on the corresponding dependent function space.

```lean
∀ (R : NativeBridge.Incremental.GenericEquality.RelationFamily) (r : NativeBridge.Incremental.GenericEquality.Refl R),
  Rocq.Corelib.Init.Equality.J_eliminator R r = id
```

公理闭包：空

## Corelib.Init.Equality.J_forward

NativeBridge.Incremental.GenericEquality.jForward_agrees

目标：id；范围：All supplied generic eliminators; the source operation is native identity on the corresponding dependent function space.

```lean
∀ (R : NativeBridge.Incremental.GenericEquality.RelationFamily) (r : NativeBridge.Incremental.GenericEquality.Refl R),
  Rocq.Corelib.Init.Equality.J_forward R r = id
```

公理闭包：空

## Corelib.Init.Equality.J_r_eliminator

NativeBridge.Incremental.GenericEquality.jRightEliminator_agrees

目标：id；范围：All supplied generic eliminators; the source operation is native identity on the corresponding dependent function space.

```lean
∀ (R : NativeBridge.Incremental.GenericEquality.RelationFamily) (r : NativeBridge.Incremental.GenericEquality.Refl R),
  Rocq.Corelib.Init.Equality.J_r_eliminator R r = id
```

公理闭包：空

## Corelib.Init.Equality.J_r_forward

NativeBridge.Incremental.GenericEquality.jRightForward_agrees

目标：id；范围：All supplied generic eliminators; the source operation is native identity on the corresponding dependent function space.

```lean
∀ (R : NativeBridge.Incremental.GenericEquality.RelationFamily) (r : NativeBridge.Incremental.GenericEquality.Refl R),
  Rocq.Corelib.Init.Equality.J_r_forward R r = id
```

公理闭包：空

## Corelib.Init.Equality.leibniz

NativeBridge.Incremental.GenericEquality.leibniz_agrees

目标：id；范围：All supplied generic eliminators; the source operation is native identity on the corresponding dependent function space.

```lean
∀ (R : NativeBridge.Incremental.GenericEquality.RelationFamily), Rocq.Corelib.Init.Equality.leibniz R = id
```

公理闭包：空

## Corelib.Init.Equality.leibniz_r

NativeBridge.Incremental.GenericEquality.leibnizRight_agrees

目标：id；范围：All supplied generic eliminators; the source operation is native identity on the corresponding dependent function space.

```lean
∀ (R : NativeBridge.Incremental.GenericEquality.RelationFamily), Rocq.Corelib.Init.Equality.leibniz_r R = id
```

公理闭包：空

## Corelib.Array.PrimArray.max_length

NativeBridge.Incremental.ArrayCapacity.max_length_agrees

目标：NativeBridge.Incremental.ArrayCapacity.capacity；范围：Exact primitive array maximum length as native BitVec 63; no array allocation required.

```lean
Rocq.Corelib.Array.PrimArray.max_length = NativeBridge.Incremental.ArrayCapacity.capacity
```

公理闭包：空

## Corelib.Init.Wf.Acc_ind

NativeBridge.Incremental.WellFoundedStatements.acc_ind_correspondence

目标：NativeBridge.Incremental.WellFoundedStatements.accInduction；范围：Full mechanically translated universe parameters and explicit extensionality hypotheses retained. Source and matching native universal statements independently proved; iff follows from those proofs. Native uses Acc and WellFounded.fix/fixF, with no remaining source symbols.

```lean
Rocq.Corelib.Init.Wf.Acc_ind.statement ↔ NativeBridge.Incremental.WellFoundedStatements.accInduction
```

公理闭包：空

## Corelib.Init.Wf.Acc_sind

NativeBridge.Incremental.WellFoundedStatements.acc_sind_correspondence

目标：NativeBridge.Incremental.WellFoundedStatements.accInduction；范围：Full mechanically translated universe parameters and explicit extensionality hypotheses retained. Source and matching native universal statements independently proved; iff follows from those proofs. Native uses Acc and WellFounded.fix/fixF, with no remaining source symbols.

```lean
Rocq.Corelib.Init.Wf.Acc_sind.statement ↔ NativeBridge.Incremental.WellFoundedStatements.accInduction
```

公理闭包：空

## Corelib.Init.Wf.Acc_intro_generator

NativeBridge.Incremental.WellFoundedStatements.acc_intro_generator_correspondence

目标：NativeBridge.Incremental.WellFoundedStatements.accGenerator；范围：Full mechanically translated universe parameters and explicit extensionality hypotheses retained. Source and matching native universal statements independently proved; iff follows from those proofs. Native uses Acc and WellFounded.fix/fixF, with no remaining source symbols.

```lean
Rocq.Corelib.Init.Wf.Acc_intro_generator.statement ↔ NativeBridge.Incremental.WellFoundedStatements.accGenerator
```

公理闭包：空

## Corelib.Init.Wf.Acc_inv

NativeBridge.Incremental.WellFoundedStatements.acc_inv_correspondence

目标：NativeBridge.Incremental.WellFoundedStatements.accInverse；范围：Full mechanically translated universe parameters and explicit extensionality hypotheses retained. Source and matching native universal statements independently proved; iff follows from those proofs. Native uses Acc and WellFounded.fix/fixF, with no remaining source symbols.

```lean
Rocq.Corelib.Init.Wf.Acc_inv.statement ↔ NativeBridge.Incremental.WellFoundedStatements.accInverse
```

公理闭包：空

## Corelib.Init.Wf.well_founded_ind

NativeBridge.Incremental.WellFoundedStatements.well_founded_ind_correspondence

目标：NativeBridge.Incremental.WellFoundedStatements.wellFoundedInduction；范围：Full mechanically translated universe parameters and explicit extensionality hypotheses retained. Source and matching native universal statements independently proved; iff follows from those proofs. Native uses Acc and WellFounded.fix/fixF, with no remaining source symbols.

```lean
Rocq.Corelib.Init.Wf.well_founded_ind.statement ↔ NativeBridge.Incremental.WellFoundedStatements.wellFoundedInduction
```

公理闭包：空

## Corelib.Init.Wf.Fix_F_eq

NativeBridge.Incremental.WellFoundedStatements.fix_f_eq_correspondence

目标：NativeBridge.Incremental.WellFoundedStatements.fixFEquation；范围：Full mechanically translated universe parameters and explicit extensionality hypotheses retained. Source and matching native universal statements independently proved; iff follows from those proofs. Native uses Acc and WellFounded.fix/fixF, with no remaining source symbols.

```lean
Rocq.Corelib.Init.Wf.Fix_F_eq.statement ↔ NativeBridge.Incremental.WellFoundedStatements.fixFEquation
```

公理闭包：空

## Corelib.Init.Wf.Fix_F_inv

NativeBridge.Incremental.WellFoundedStatements.fix_f_inv_correspondence

目标：NativeBridge.Incremental.WellFoundedStatements.fixFIndependent；范围：Full mechanically translated universe parameters and explicit extensionality hypotheses retained. Source and matching native universal statements independently proved; iff follows from those proofs. Native uses Acc and WellFounded.fix/fixF, with no remaining source symbols.

```lean
Rocq.Corelib.Init.Wf.Fix_F_inv.statement ↔ NativeBridge.Incremental.WellFoundedStatements.fixFIndependent
```

公理闭包：空

## Corelib.Init.Wf.Fix_F_inv_gen

NativeBridge.Incremental.WellFoundedStatements.fix_f_inv_gen_correspondence

目标：NativeBridge.Incremental.WellFoundedStatements.fixFIndependentGeneral；范围：Full mechanically translated universe parameters and explicit extensionality hypotheses retained. Source and matching native universal statements independently proved; iff follows from those proofs. Native uses Acc and WellFounded.fix/fixF, with no remaining source symbols.

```lean
Rocq.Corelib.Init.Wf.Fix_F_inv_gen.statement ↔ NativeBridge.Incremental.WellFoundedStatements.fixFIndependentGeneral
```

公理闭包：空

## Corelib.Init.Wf.Fix_eq

NativeBridge.Incremental.WellFoundedStatements.fix_eq_correspondence

目标：NativeBridge.Incremental.WellFoundedStatements.fixEquation；范围：Full mechanically translated universe parameters and explicit extensionality hypotheses retained. Source and matching native universal statements independently proved; iff follows from those proofs. Native uses Acc and WellFounded.fix/fixF, with no remaining source symbols.

```lean
Rocq.Corelib.Init.Wf.Fix_eq.statement ↔ NativeBridge.Incremental.WellFoundedStatements.fixEquation
```

公理闭包：Quot.sound

## Corelib.Init.Wf.Fix_eq_gen

NativeBridge.Incremental.WellFoundedStatements.fix_eq_gen_correspondence

目标：NativeBridge.Incremental.WellFoundedStatements.fixEquationGeneral；范围：Full mechanically translated universe parameters and explicit extensionality hypotheses retained. Source and matching native universal statements independently proved; iff follows from those proofs. Native uses Acc and WellFounded.fix/fixF, with no remaining source symbols.

```lean
Rocq.Corelib.Init.Wf.Fix_eq_gen.statement ↔ NativeBridge.Incremental.WellFoundedStatements.fixEquationGeneral
```

公理闭包：Quot.sound

## Corelib.Init.Wf.Acc_inv_dep

NativeBridge.Incremental.WellFoundedStatements.acc_inv_dep_correspondence

目标：NativeBridge.Incremental.WellFoundedStatements.accDependentInduction；范围：Full mechanically translated universe parameters and explicit extensionality hypotheses retained. Source and matching native universal statements independently proved; iff follows from those proofs. Native uses Acc and WellFounded.fix/fixF, with no remaining source symbols.

```lean
RocqPending.Corelib.Init.Wf.Acc_inv_dep.statement ↔ NativeBridge.Incremental.WellFoundedStatements.accDependentInduction
```

公理闭包：空

## Corelib.Program.Wf.MR

NativeBridge.Incremental.ProgramWellFounded.mr_agrees

目标：InvImage；范围：Source universes preserved. Subtype callbacks correspond by explicitly proved inverse adapters. Native recursion uses WellFounded.fix/fixF; all extracted proof conditions are supplied by closed checked witnesses. Matching universal statements retain extensionality hypotheses and are independently proved on both sides.

```lean
∀ (T : Sort u) (M : Sort v) (R : M → M → Prop) (m : T → M), Rocq.Corelib.Program.Wf.MR T M R m = InvImage R m
```

公理闭包：空

## Corelib.Program.Wf.measure_wf

NativeBridge.Incremental.ProgramWellFounded.measure_wf_correspondence

目标：NativeBridge.Incremental.ProgramWellFounded.measureStatement；范围：Source universes preserved. Subtype callbacks correspond by explicitly proved inverse adapters. Native recursion uses WellFounded.fix/fixF; all extracted proof conditions are supplied by closed checked witnesses. Matching universal statements retain extensionality hypotheses and are independently proved on both sides.

```lean
Rocq.Corelib.Program.Wf.measure_wf.statement ↔ NativeBridge.Incremental.ProgramWellFounded.measureStatement
```

公理闭包：空

## Corelib.Program.Wf.Fix_F_sub

NativeBridge.Incremental.ProgramWellFounded.fixF_agrees

目标：NativeBridge.Incremental.ProgramWellFounded.fixFSubtype；范围：Source universes preserved. Subtype callbacks correspond by explicitly proved inverse adapters. Native recursion uses WellFounded.fix/fixF; all extracted proof conditions are supplied by closed checked witnesses. Matching universal statements retain extensionality hypotheses and are independently proved on both sides.

```lean
∀ {A : Type u} (R : A → A → Prop) (P : A → Type v) (G : NativeBridge.Incremental.ProgramWellFounded.NativeStep R P)
  (x : A) (a : Rocq.Corelib.Init.Wf.Acc A R x),
  RocqPending.Corelib.Program.Wf.Fix_F_sub A R P (NativeBridge.Incremental.ProgramWellFounded.sourceStep R P G) x a =
    NativeBridge.Incremental.ProgramWellFounded.fixFSubtype R P G x ⋯
```

公理闭包：Quot.sound

## Corelib.Program.Wf.Fix_sub

NativeBridge.Incremental.ProgramWellFounded.fix_agrees

目标：NativeBridge.Incremental.ProgramWellFounded.fixSubtype；范围：Source universes preserved. Subtype callbacks correspond by explicitly proved inverse adapters. Native recursion uses WellFounded.fix/fixF; all extracted proof conditions are supplied by closed checked witnesses. Matching universal statements retain extensionality hypotheses and are independently proved on both sides.

```lean
∀ {A : Type u} (R : A → A → Prop) (wf : Rocq.Corelib.Init.Wf.well_founded A R) (P : A → Type v)
  (G : NativeBridge.Incremental.ProgramWellFounded.NativeStep R P) (x : A),
  RocqPending.Corelib.Program.Wf.Fix_sub A R wf P (NativeBridge.Incremental.ProgramWellFounded.sourceStep R P G) x =
    NativeBridge.Incremental.ProgramWellFounded.fixSubtype R ⋯ P G x
```

公理闭包：Quot.sound

## Corelib.Program.Wf.F_unfold

NativeBridge.Incremental.ProgramWellFounded.f_unfold_correspondence

目标：NativeBridge.Incremental.ProgramWellFounded.unfoldStatement；范围：Source universes preserved. Subtype callbacks correspond by explicitly proved inverse adapters. Native recursion uses WellFounded.fix/fixF; all extracted proof conditions are supplied by closed checked witnesses. Matching universal statements retain extensionality hypotheses and are independently proved on both sides.

```lean
RocqPending.Corelib.Program.Wf.F_unfold.statement ↔ NativeBridge.Incremental.ProgramWellFounded.unfoldStatement
```

公理闭包：空

## Corelib.Program.Wf.Fix_F_eq

NativeBridge.Incremental.ProgramWellFounded.fix_f_eq_correspondence

目标：NativeBridge.Incremental.ProgramWellFounded.fixFEquation；范围：Source universes preserved. Subtype callbacks correspond by explicitly proved inverse adapters. Native recursion uses WellFounded.fix/fixF; all extracted proof conditions are supplied by closed checked witnesses. Matching universal statements retain extensionality hypotheses and are independently proved on both sides.

```lean
RocqPending.Corelib.Program.Wf.Fix_F_eq.statement ↔ NativeBridge.Incremental.ProgramWellFounded.fixFEquation
```

公理闭包：空

## Corelib.Program.Wf.Fix_F_inv

NativeBridge.Incremental.ProgramWellFounded.fix_f_inv_correspondence

目标：NativeBridge.Incremental.ProgramWellFounded.fixFIndependent；范围：Source universes preserved. Subtype callbacks correspond by explicitly proved inverse adapters. Native recursion uses WellFounded.fix/fixF; all extracted proof conditions are supplied by closed checked witnesses. Matching universal statements retain extensionality hypotheses and are independently proved on both sides.

```lean
RocqPending.Corelib.Program.Wf.Fix_F_inv.statement ↔ NativeBridge.Incremental.ProgramWellFounded.fixFIndependent
```

公理闭包：空

## Corelib.Program.Wf.eq_Fix_F_sub

NativeBridge.Incremental.ProgramWellFounded.eq_fix_f_sub_correspondence

目标：NativeBridge.Incremental.ProgramWellFounded.fixFIndependentGeneral；范围：Source universes preserved. Subtype callbacks correspond by explicitly proved inverse adapters. Native recursion uses WellFounded.fix/fixF; all extracted proof conditions are supplied by closed checked witnesses. Matching universal statements retain extensionality hypotheses and are independently proved on both sides.

```lean
RocqPending.Corelib.Program.Wf.eq_Fix_F_sub.statement ↔
  NativeBridge.Incremental.ProgramWellFounded.fixFIndependentGeneral
```

公理闭包：空

## Corelib.Program.Wf.Fix_eq

NativeBridge.Incremental.ProgramWellFounded.fix_eq_correspondence

目标：NativeBridge.Incremental.ProgramWellFounded.fixEquation；范围：Source universes preserved. Subtype callbacks correspond by explicitly proved inverse adapters. Native recursion uses WellFounded.fix/fixF; all extracted proof conditions are supplied by closed checked witnesses. Matching universal statements retain extensionality hypotheses and are independently proved on both sides.

```lean
RocqPending.Corelib.Program.Wf.Fix_eq.statement ↔ NativeBridge.Incremental.ProgramWellFounded.fixEquation
```

公理闭包：空

## Corelib.Program.Wf.fix_sub_eq

NativeBridge.Incremental.ProgramWellFounded.fix_sub_eq_correspondence

目标：NativeBridge.Incremental.ProgramWellFounded.fixEquation；范围：Source universes preserved. Subtype callbacks correspond by explicitly proved inverse adapters. Native recursion uses WellFounded.fix/fixF; all extracted proof conditions are supplied by closed checked witnesses. Matching universal statements retain extensionality hypotheses and are independently proved on both sides.

```lean
RocqPending.Corelib.Program.Wf.fix_sub_eq.statement ↔ NativeBridge.Incremental.ProgramWellFounded.fixEquation
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.NonPropType.call_of

NativeBridge.Incremental.SSRRewriteData.callIso

目标：NativeBridge.Incremental.SSRRewriteData.typeUniverse；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
(c : Rocq.Corelib.Init.Datatypes.unit) →
  (b : NativeBridge.RBool) → NativeBridge.Iso (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.call_of c b) (Type u)
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.NonPropType.test_of

NativeBridge.Incremental.SSRRewriteData.testIso

目标：NativeBridge.Incremental.SSRRewriteData.unitType；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
(b : NativeBridge.RBool) → NativeBridge.Iso (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test_of b) Unit
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.TheCanonical.put

NativeBridge.Incremental.SSRRewriteData.canonicalIso

目标：NativeBridge.Incremental.SSRRewriteData.trueType；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
(V : Sort u) →
  (S : Sort v) → (x y : V) → (s : S) → NativeBridge.Iso (Rocq.Corelib.ssr.ssreflect_rw.TheCanonical.put V S x y s) True
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.external_view

NativeBridge.Incremental.SSRRewriteData.viewIso

目标：NativeBridge.Incremental.SSRRewriteData.typeUniverse；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
NativeBridge.Iso Rocq.Corelib.ssr.ssreflect_rw.external_view (Type u)
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.phantom

NativeBridge.Incremental.SSRRewriteData.phantomIso

目标：NativeBridge.Incremental.SSRRewriteData.trueType；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
(T : Sort u) → (x : T) → NativeBridge.Iso (Rocq.Corelib.ssr.ssreflect_rw.phantom T x) True
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.phant

NativeBridge.Incremental.SSRRewriteData.phantIso

目标：NativeBridge.Incremental.SSRRewriteData.trueType；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
(T : Sort u) → NativeBridge.Iso (Rocq.Corelib.ssr.ssreflect_rw.phant T) True
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.abstract_lock

NativeBridge.Incremental.SSRRewriteData.lockIso

目标：NativeBridge.Incremental.SSRRewriteData.unitType；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
NativeBridge.Iso Rocq.Corelib.ssr.ssreflect_rw.abstract_lock Unit
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.abstract

NativeBridge.Incremental.SSRRewriteData.abstractIso

目标：NativeBridge.Incremental.SSRRewriteData.identityType；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
(T : Type u) →
  (n : NativeBridge.MN) →
    (k : Rocq.Corelib.ssr.ssreflect_rw.abstract_lock) →
      NativeBridge.Iso (Rocq.Corelib.ssr.ssreflect_rw.abstract T n k) T
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.argumentType

NativeBridge.Incremental.SSRRewriteData.argumentTypeIso

目标：NativeBridge.Incremental.SSRRewriteData.identityType；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
(T : Type u) →
  (P : T → Sort v) → (f : (x : T) → P x) → NativeBridge.Iso (Rocq.Corelib.ssr.ssreflect_rw.argumentType T P f) T
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.dependentReturnType

NativeBridge.Incremental.SSRRewriteData.dependentReturnTypeIso

目标：NativeBridge.Incremental.SSRRewriteData.identityType；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
(T : Sort u) →
  (P : T → Type v) →
    (f : (x : T) → P x) → (x : T) → NativeBridge.Iso (Rocq.Corelib.ssr.ssreflect_rw.dependentReturnType T P f x) (P x)
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.returnType

NativeBridge.Incremental.SSRRewriteData.returnTypeIso

目标：NativeBridge.Incremental.SSRRewriteData.identityType；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
(A : Sort u) → (B : Type v) → (f : A → B) → NativeBridge.Iso (Rocq.Corelib.ssr.ssreflect_rw.returnType A B f) B
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.unlockable

NativeBridge.Incremental.SSRRewriteData.unlockableIso

目标：NativeBridge.Incremental.SSRRewriteData.unitType；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
(T : Sort u) → (x : T) → NativeBridge.Iso (Rocq.Corelib.ssr.ssreflect_rw.unlockable T x) Unit
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.NonPropType.call

NativeBridge.Incremental.SSRRewriteData.call_agrees

目标：id；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
∀ (T : Type u),
  NativeBridge.Incremental.SSRRewriteData.callTo (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.maybeProp T)
      Rocq.Corelib.Init.Datatypes.bool.false (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.call T) =
    id T
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.NonPropType.callee

NativeBridge.Incremental.SSRRewriteData.callee_agrees

目标：id；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
∀ (c : Rocq.Corelib.Init.Datatypes.unit) (b : NativeBridge.RBool)
  (x : Rocq.Corelib.ssr.ssreflect_rw.NonPropType.call_of c b),
  Rocq.Corelib.ssr.ssreflect_rw.NonPropType.callee c b x = id (NativeBridge.Incremental.SSRRewriteData.callTo c b x)
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.NonPropType.condition

NativeBridge.Incremental.SSRRewriteData.condition_agrees

目标：id；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
∀ (b : NativeBridge.RBool) (t : Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test_of b),
  NativeBridge.Incremental.SSRRewriteData.unitTo (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.condition b t) =
    id (NativeBridge.Incremental.SSRRewriteData.testTo b t)
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.NonPropType.frame

NativeBridge.Incremental.SSRRewriteData.frame_agrees

目标：Prod.snd；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
∀ (t : Rocq.Corelib.ssr.ssreflect_rw.NonPropType.type),
  NativeBridge.Incremental.SSRRewriteData.callTo
      (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.condition (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result t)
        (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test t))
      (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result t) (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.frame t) =
    (NativeBridge.Incremental.SSRRewriteData.nonPropTo t).snd
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.NonPropType.result

NativeBridge.Incremental.SSRRewriteData.result_agrees

目标：Prod.fst；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
∀ (t : Rocq.Corelib.ssr.ssreflect_rw.NonPropType.type),
  NativeBridge.boolTo (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result t) =
    (NativeBridge.Incremental.SSRRewriteData.nonPropTo t).fst
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.TheCanonical.get

NativeBridge.Incremental.SSRRewriteData.get_agrees

目标：id；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
∀ (V : Sort u) (S : Sort v) (x : V) (s : S) (p : Rocq.Corelib.ssr.ssreflect_rw.TheCanonical.put V S x x s),
  Rocq.Corelib.ssr.ssreflect_rw.TheCanonical.get V S x s p = id s
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.TheCanonical.get_by

NativeBridge.Incremental.SSRRewriteData.getBy_agrees

目标：id；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
∀ (V : Sort u) (S : Sort v) (f : S → V) (x : V) (s : S) (p : Rocq.Corelib.ssr.ssreflect_rw.TheCanonical.put V S x x s),
  Rocq.Corelib.ssr.ssreflect_rw.TheCanonical.get_by V S f x s p = id s
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.protect_term

NativeBridge.Incremental.SSRRewriteData.protect_agrees

目标：id；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
∀ (T : Sort u) (x : T), Rocq.Corelib.ssr.ssreflect_rw.protect_term T x = id x
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.locked_with

NativeBridge.Incremental.SSRRewriteData.lockedWith_agrees

目标：id；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
∀ (k : Rocq.Corelib.Init.Datatypes.unit) (T : Sort u) (x : T), Rocq.Corelib.ssr.ssreflect_rw.locked_with k T x = id x
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.NonPropType.check

NativeBridge.Incremental.SSRRewriteData.check_agrees

目标：NativeBridge.Incremental.SSRRewriteData.makeNonProp；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
∀ (b : NativeBridge.RBool) (t : Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test_of b)
  (f : Rocq.Corelib.ssr.ssreflect_rw.NonPropType.call_of (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.condition b t) b),
  NativeBridge.Incremental.SSRRewriteData.nonPropTo (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.check b t f) =
    NativeBridge.Incremental.SSRRewriteData.makeNonProp (NativeBridge.boolTo b)
      (NativeBridge.Incremental.SSRRewriteData.testTo b t)
      (NativeBridge.Incremental.SSRRewriteData.callTo (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.condition b t) b f)
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.NonPropType.test

NativeBridge.Incremental.SSRRewriteData.test_agrees

目标：NativeBridge.Incremental.SSRRewriteData.constUnit；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
∀ (t : Rocq.Corelib.ssr.ssreflect_rw.NonPropType.type),
  NativeBridge.Incremental.SSRRewriteData.testTo (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result t)
      (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test t) =
    NativeBridge.Incremental.SSRRewriteData.constUnit (NativeBridge.Incremental.SSRRewriteData.nonPropTo t)
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.NonPropType.maybeProp

NativeBridge.Incremental.SSRRewriteData.maybeProp_agrees

目标：NativeBridge.Incremental.SSRRewriteData.constUnit；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
∀ (T : Sort u),
  NativeBridge.Incremental.SSRRewriteData.unitTo (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.maybeProp T) =
    NativeBridge.Incremental.SSRRewriteData.constUnit T
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.NonPropType.test_Prop

NativeBridge.Incremental.SSRRewriteData.testProp_agrees

目标：NativeBridge.Incremental.SSRRewriteData.constUnit；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
∀ (P : Prop),
  NativeBridge.Incremental.SSRRewriteData.testTo Rocq.Corelib.Init.Datatypes.bool.true
      (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test_Prop P) =
    NativeBridge.Incremental.SSRRewriteData.constUnit P
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.NonPropType.test_negative

NativeBridge.Incremental.SSRRewriteData.testNegative_agrees

目标：NativeBridge.Incremental.SSRRewriteData.unitValue；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
NativeBridge.Incremental.SSRRewriteData.testTo Rocq.Corelib.Init.Datatypes.bool.false
    Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test_negative =
  ()
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.external_view_rect

NativeBridge.Incremental.SSRRewriteData.viewRect_agrees

目标：NativeBridge.Incremental.SSRRewriteData.viewRec；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
∀ (P : Type u → Type v) (f : (T : Type u) → P T) (e : Rocq.Corelib.ssr.ssreflect_rw.external_view),
  Rocq.Corelib.ssr.ssreflect_rw.external_view_rect (fun e => P (NativeBridge.Incremental.SSRRewriteData.viewTo e)) f e =
    NativeBridge.Incremental.SSRRewriteData.viewRec P f (NativeBridge.Incremental.SSRRewriteData.viewTo e)
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.external_view_rec

NativeBridge.Incremental.SSRRewriteData.viewRec_agrees

目标：NativeBridge.Incremental.SSRRewriteData.viewRec；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
∀ (P : Type u → Type) (f : (T : Type u) → P T) (e : Rocq.Corelib.ssr.ssreflect_rw.external_view),
  Rocq.Corelib.ssr.ssreflect_rw.external_view_rec (fun e => P (NativeBridge.Incremental.SSRRewriteData.viewTo e)) f e =
    NativeBridge.Incremental.SSRRewriteData.viewRec P f (NativeBridge.Incremental.SSRRewriteData.viewTo e)
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.abstract_key

NativeBridge.Incremental.SSRRewriteData.key_agrees

目标：NativeBridge.Incremental.SSRRewriteData.unitValue；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
NativeBridge.Incremental.SSRRewriteData.unitTo Rocq.Corelib.ssr.ssreflect_rw.abstract_key = ()
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.unlocked

NativeBridge.Incremental.SSRRewriteData.unlocked_agrees

目标：NativeBridge.Incremental.SSRRewriteData.unlockValue；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
∀ (T : Sort u) (x : T) (c : Rocq.Corelib.ssr.ssreflect_rw.unlockable T x),
  Rocq.Corelib.ssr.ssreflect_rw.unlocked T x c =
    NativeBridge.Incremental.SSRRewriteData.unlockValue T x
      ((NativeBridge.Incremental.SSRRewriteData.unlockableIso T x).to c)
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.vm_compute_eq

NativeBridge.Incremental.SSRRewriteData.vmComputeEq_agrees

目标：NativeBridge.Incremental.SSRRewriteData.nativeEquality；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
∀ (T : Sort u) (x y : T), Rocq.Corelib.ssr.ssreflect_rw.vm_compute_eq T x y ↔ x = y
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.nary_congruence_statement

NativeBridge.Incremental.SSRRewriteData.naryStatement_agrees

目标：NativeBridge.Incremental.SSRRewriteData.naryCongruence；范围：All mechanically translated universe parameters and dependent arguments retained. Explicit inverses for representations; operation theorem names the source root directly. Native target recursively checked for source symbols.

```lean
∀ (n : NativeBridge.MN) (k : (B : Type u) → (B → B → Prop) → Prop),
  Rocq.Corelib.ssr.ssreflect_rw.nary_congruence_statement n k ↔
    NativeBridge.Incremental.SSRRewriteData.naryCongruence (NativeBridge.natTo n) k
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssreflect_rw.external_view_ind

NativeBridge.Incremental.SSRRewriteStatements.view_ind_correspondence

目标：NativeBridge.Incremental.SSRRewriteStatements.viewInduction；范围：Full mechanically translated universes. Both source and matching native universal statements are proved, then related by iff. N-ary congruence proved for arbitrary arity via induction and full relation-parametric predicate correspondence; locks use source-free identity/Unit representations.

```lean
Rocq.Corelib.ssr.ssreflect_rw.external_view_ind.statement ↔ NativeBridge.Incremental.SSRRewriteStatements.viewInduction
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.external_view_sind

NativeBridge.Incremental.SSRRewriteStatements.view_sind_correspondence

目标：NativeBridge.Incremental.SSRRewriteStatements.viewInduction；范围：Full mechanically translated universes. Both source and matching native universal statements are proved, then related by iff. N-ary congruence proved for arbitrary arity via induction and full relation-parametric predicate correspondence; locks use source-free identity/Unit representations.

```lean
Rocq.Corelib.ssr.ssreflect_rw.external_view_sind.statement ↔ NativeBridge.Incremental.SSRRewriteStatements.viewInduction
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.UnderE

NativeBridge.Incremental.SSRRewriteStatements.under_correspondence

目标：NativeBridge.Incremental.SSRRewriteStatements.underStatement；范围：Full mechanically translated universes. Both source and matching native universal statements are proved, then related by iff. N-ary congruence proved for arbitrary arity via induction and full relation-parametric predicate correspondence; locks use source-free identity/Unit representations.

```lean
Rocq.Corelib.ssr.ssreflect_rw.UnderE.statement ↔ NativeBridge.Incremental.SSRRewriteStatements.underStatement
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.over

NativeBridge.Incremental.SSRRewriteStatements.over_correspondence

目标：NativeBridge.Incremental.SSRRewriteStatements.overStatement；范围：Full mechanically translated universes. Both source and matching native universal statements are proved, then related by iff. N-ary congruence proved for arbitrary arity via induction and full relation-parametric predicate correspondence; locks use source-free identity/Unit representations.

```lean
Rocq.Corelib.ssr.ssreflect_rw.over.statement ↔ NativeBridge.Incremental.SSRRewriteStatements.overStatement
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.lock

NativeBridge.Incremental.SSRRewriteStatements.lock_correspondence

目标：NativeBridge.Incremental.SSRRewriteStatements.lockStatement；范围：Full mechanically translated universes. Both source and matching native universal statements are proved, then related by iff. N-ary congruence proved for arbitrary arity via induction and full relation-parametric predicate correspondence; locks use source-free identity/Unit representations.

```lean
Rocq.Corelib.ssr.ssreflect_rw.lock.statement ↔ NativeBridge.Incremental.SSRRewriteStatements.lockStatement
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.locked_withE

NativeBridge.Incremental.SSRRewriteStatements.lockedWith_correspondence

目标：NativeBridge.Incremental.SSRRewriteStatements.lockedWithStatement；范围：Full mechanically translated universes. Both source and matching native universal statements are proved, then related by iff. N-ary congruence proved for arbitrary arity via induction and full relation-parametric predicate correspondence; locks use source-free identity/Unit representations.

```lean
Rocq.Corelib.ssr.ssreflect_rw.locked_withE.statement ↔ NativeBridge.Incremental.SSRRewriteStatements.lockedWithStatement
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.unlock

NativeBridge.Incremental.SSRRewriteStatements.unlock_correspondence

目标：NativeBridge.Incremental.SSRRewriteStatements.unlockStatement；范围：Full mechanically translated universes. Both source and matching native universal statements are proved, then related by iff. N-ary congruence proved for arbitrary arity via induction and full relation-parametric predicate correspondence; locks use source-free identity/Unit representations.

```lean
Rocq.Corelib.ssr.ssreflect_rw.unlock.statement ↔ NativeBridge.Incremental.SSRRewriteStatements.unlockStatement
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.nary_congruence

NativeBridge.Incremental.SSRRewriteStatements.nary_correspondence

目标：NativeBridge.Incremental.SSRRewriteStatements.naryStatement；范围：Full mechanically translated universes. Both source and matching native universal statements are proved, then related by iff. N-ary congruence proved for arbitrary arity via induction and full relation-parametric predicate correspondence; locks use source-free identity/Unit representations.

```lean
Rocq.Corelib.ssr.ssreflect_rw.nary_congruence.statement ↔ NativeBridge.Incremental.SSRRewriteStatements.naryStatement
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssreflect_rw.vm_compute

NativeBridge.Incremental.SSRRewriteStatements.vm_compute_correspondence

目标：NativeBridge.Incremental.SSRRewriteStatements.vmComputeStatement；范围：Full mechanically translated universes. Both source and matching native universal statements are proved, then related by iff. N-ary congruence proved for arbitrary arity via induction and full relation-parametric predicate correspondence; locks use source-free identity/Unit representations.

```lean
Rocq.Corelib.ssr.ssreflect_rw.vm_compute.statement ↔ NativeBridge.Incremental.SSRRewriteStatements.vmComputeStatement
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.unlock_with

NativeBridge.Incremental.SSRRewriteStatements.unlock_with_correspondence

目标：NativeBridge.Incremental.SSRRewriteStatements.lockedWithStatement；范围：Full mechanically translated universes. Both source and matching native universal statements are proved, then related by iff. N-ary congruence proved for arbitrary arity via induction and full relation-parametric predicate correspondence; locks use source-free identity/Unit representations.

```lean
RocqPending.Corelib.ssr.ssreflect_rw.unlock_with.statement ↔
  NativeBridge.Incremental.SSRRewriteStatements.lockedWithStatement
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.locked_with_unlockable

NativeBridge.Incremental.SSRRewriteStatements.lockedWithUnlockable_agrees

目标：NativeBridge.Incremental.SSRRewriteData.unitValue；范围：Full Sort carrier; result uses the proved two-sided unlockable-to-Unit Iso. The lock equation prerequisite is proved for every source key.

```lean
∀ (T : Sort u) (k : Rocq.Corelib.Init.Datatypes.unit) (x : T),
  (NativeBridge.Incremental.SSRRewriteData.unlockableIso T x).to
      (RocqPending.Corelib.ssr.ssreflect_rw.locked_with_unlockable T k x) =
    NativeBridge.Incremental.SSRRewriteData.unitValue
```

公理闭包：空

## Corelib.ssr.ssreflect_rw.ssr_converse

NativeBridge.Incremental.SSRRewriteStatements.converse_agrees

目标：NativeBridge.Incremental.SSRRewriteStatements.nativeConverse；范围：Full Sort payload; source product of mechanical True and payload corresponds to PProd True payload, with explicit inverse maps and a closed True prerequisite.

```lean
∀ (R : Sort u) (r : R),
  NativeBridge.Incremental.SSRRewriteStatements.converseTo (RocqPending.Corelib.ssr.ssreflect_rw.ssr_converse R r) =
    NativeBridge.Incremental.SSRRewriteStatements.nativeConverse R r
```

公理闭包：空

## Corelib.ssr.ssrclasses.Reflexive

NativeBridge.Incremental.SSRClasses.reflexive_agrees

目标：NativeBridge.Incremental.SSRClasses.nativeReflexive；范围：Full source universe range. Under/Over are the supplied native relation; reflexivity is Lean Std.Refl. Original statements independently proved and related to matching source-free universal propositions.

```lean
∀ (A : Sort u) (R : A → A → Prop),
  Rocq.Corelib.ssr.ssrclasses.Reflexive A R ↔ NativeBridge.Incremental.SSRClasses.nativeReflexive R
```

公理闭包：空

## Corelib.ssr.ssrclasses.eq_Reflexive

NativeBridge.Incremental.SSRClasses.eq_correspondence

目标：NativeBridge.Incremental.SSRClasses.eqReflexive；范围：Full source universe range. Under/Over are the supplied native relation; reflexivity is Lean Std.Refl. Original statements independently proved and related to matching source-free universal propositions.

```lean
Rocq.Corelib.ssr.ssrclasses.eq_Reflexive.statement ↔ NativeBridge.Incremental.SSRClasses.eqReflexive
```

公理闭包：空

## Corelib.ssr.ssrclasses.iff_Reflexive

NativeBridge.Incremental.SSRClasses.iff_correspondence

目标：NativeBridge.Incremental.SSRClasses.iffReflexive；范围：Full source universe range. Under/Over are the supplied native relation; reflexivity is Lean Std.Refl. Original statements independently proved and related to matching source-free universal propositions.

```lean
Rocq.Corelib.ssr.ssrclasses.iff_Reflexive.statement ↔ NativeBridge.Incremental.SSRClasses.iffReflexive
```

公理闭包：空

## Corelib.ssr.ssrclasses.reflexivity

NativeBridge.Incremental.SSRClasses.reflexivity_correspondence

目标：NativeBridge.Incremental.SSRClasses.reflexivityStatement；范围：Full source universe range. Under/Over are the supplied native relation; reflexivity is Lean Std.Refl. Original statements independently proved and related to matching source-free universal propositions.

```lean
Rocq.Corelib.ssr.ssrclasses.reflexivity.statement ↔ NativeBridge.Incremental.SSRClasses.reflexivityStatement
```

公理闭包：空

## Corelib.ssr.ssrunder.Under_rel.Under_rel

NativeBridge.Incremental.SSRUnder.under_agrees

目标：id；范围：Full source universe range. Under/Over are the supplied native relation; reflexivity is Lean Std.Refl. Original statements independently proved and related to matching source-free universal propositions.

```lean
∀ (A : Type u) (R : A → A → Prop), Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel A R = id R
```

公理闭包：空

## Corelib.ssr.ssrunder.Under_rel.Over_rel

NativeBridge.Incremental.SSRUnder.over_agrees

目标：id；范围：Full source universe range. Under/Over are the supplied native relation; reflexivity is Lean Std.Refl. Original statements independently proved and related to matching source-free universal propositions.

```lean
∀ (A : Type u) (R : A → A → Prop), Rocq.Corelib.ssr.ssrunder.Under_rel.Over_rel A R = id R
```

公理闭包：空

## Corelib.ssr.ssrunder.Under_rel.Under_relE

NativeBridge.Incremental.SSRUnder.under_eq_correspondence

目标：NativeBridge.Incremental.SSRUnder.underEquation；范围：Full source universe range. Under/Over are the supplied native relation; reflexivity is Lean Std.Refl. Original statements independently proved and related to matching source-free universal propositions.

```lean
Rocq.Corelib.ssr.ssrunder.Under_rel.Under_relE.statement ↔ NativeBridge.Incremental.SSRUnder.underEquation
```

公理闭包：空

## Corelib.ssr.ssrunder.Under_rel.Under_rel_from_rel

NativeBridge.Incremental.SSRUnder.under_from_correspondence

目标：NativeBridge.Incremental.SSRUnder.underFromRelation；范围：Full source universe range. Under/Over are the supplied native relation; reflexivity is Lean Std.Refl. Original statements independently proved and related to matching source-free universal propositions.

```lean
Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel_from_rel.statement ↔ NativeBridge.Incremental.SSRUnder.underFromRelation
```

公理闭包：空

## Corelib.ssr.ssrunder.Under_rel.over_rel

NativeBridge.Incremental.SSRUnder.over_eq_correspondence

目标：NativeBridge.Incremental.SSRUnder.overEquation；范围：Full source universe range. Under/Over are the supplied native relation; reflexivity is Lean Std.Refl. Original statements independently proved and related to matching source-free universal propositions.

```lean
Rocq.Corelib.ssr.ssrunder.Under_rel.over_rel.statement ↔ NativeBridge.Incremental.SSRUnder.overEquation
```

公理闭包：空

## Corelib.ssr.ssrunder.Under_rel.over_rel_done

NativeBridge.Incremental.SSRUnder.over_done_correspondence

目标：NativeBridge.Incremental.SSRUnder.reflexiveDone；范围：Full source universe range. Under/Over are the supplied native relation; reflexivity is Lean Std.Refl. Original statements independently proved and related to matching source-free universal propositions.

```lean
Rocq.Corelib.ssr.ssrunder.Under_rel.over_rel_done.statement ↔ NativeBridge.Incremental.SSRUnder.reflexiveDone
```

公理闭包：空

## Corelib.ssr.ssrunder.Under_rel.under_rel_done

NativeBridge.Incremental.SSRUnder.under_done_correspondence

目标：NativeBridge.Incremental.SSRUnder.reflexiveDone；范围：Full source universe range. Under/Over are the supplied native relation; reflexivity is Lean Std.Refl. Original statements independently proved and related to matching source-free universal propositions.

```lean
Rocq.Corelib.ssr.ssrunder.Under_rel.under_rel_done.statement ↔ NativeBridge.Incremental.SSRUnder.reflexiveDone
```

公理闭包：空

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.digits

NativeBridge.Incremental.Uint63Operations.digits_agrees

目标：NativeBridge.Incremental.Uint63Operations.width；范围：All inputs. Native BitVec/Nat operations with explicit index conversion. Carry/borrow flags use uaddOverflow/usubOverflow or the stated extra-one inequality; get_digit/bit equal getLsbD even out of range. set_digit preserves x for indices >=63.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.digits = NativeBridge.Incremental.Uint63Operations.width
```

公理闭包：空

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.size

NativeBridge.Incremental.Uint63Operations.size_agrees

目标：NativeBridge.Incremental.Uint63Operations.bitCount；范围：All inputs. Native BitVec/Nat operations with explicit index conversion. Carry/borrow flags use uaddOverflow/usubOverflow or the stated extra-one inequality; get_digit/bit equal getLsbD even out of range. set_digit preserves x for indices >=63.

```lean
NativeBridge.natTo Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.size =
  NativeBridge.Incremental.Uint63Operations.bitCount
```

公理闭包：空

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.max_int

NativeBridge.Incremental.Uint63Operations.maxInt_agrees

目标：NativeBridge.Incremental.Uint63Operations.largest；范围：All inputs. Native BitVec/Nat operations with explicit index conversion. Carry/borrow flags use uaddOverflow/usubOverflow or the stated extra-one inequality; get_digit/bit equal getLsbD even out of range. set_digit preserves x for indices >=63.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.max_int = NativeBridge.Incremental.Uint63Operations.largest
```

公理闭包：空

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarry

NativeBridge.Incremental.Uint63Operations.addcarry_agrees

目标：NativeBridge.Incremental.Uint63Operations.addOne；范围：All inputs. Native BitVec/Nat operations with explicit index conversion. Carry/borrow flags use uaddOverflow/usubOverflow or the stated extra-one inequality; get_digit/bit equal getLsbD even out of range. set_digit preserves x for indices >=63.

```lean
∀ (x y : NativeBridge.Incremental.Uint63Operations.Word),
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarry x y = NativeBridge.Incremental.Uint63Operations.addOne x y
```

公理闭包：空

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addc_def

NativeBridge.Incremental.Uint63Operations.addc_agrees

目标：NativeBridge.Incremental.Uint63Operations.addWithCarry；范围：All inputs. Native BitVec/Nat operations with explicit index conversion. Carry/borrow flags use uaddOverflow/usubOverflow or the stated extra-one inequality; get_digit/bit equal getLsbD even out of range. set_digit preserves x for indices >=63.

```lean
∀ (x y : NativeBridge.Incremental.Uint63Operations.Word),
  NativeBridge.Incremental.Uint63Operations.carryTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addc_def x y) =
    NativeBridge.Incremental.Uint63Operations.addWithCarry x y
```

公理闭包：propext, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarryc_def

NativeBridge.Incremental.Uint63Operations.addcarryc_agrees

目标：NativeBridge.Incremental.Uint63Operations.addOneWithCarry；范围：All inputs. Native BitVec/Nat operations with explicit index conversion. Carry/borrow flags use uaddOverflow/usubOverflow or the stated extra-one inequality; get_digit/bit equal getLsbD even out of range. set_digit preserves x for indices >=63.

```lean
∀ (x y : NativeBridge.Incremental.Uint63Operations.Word),
  NativeBridge.Incremental.Uint63Operations.carryTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarryc_def x y) =
    NativeBridge.Incremental.Uint63Operations.addOneWithCarry x y
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subc_def

NativeBridge.Incremental.Uint63Operations.subc_agrees

目标：NativeBridge.Incremental.Uint63Operations.subWithBorrow；范围：All inputs. Native BitVec/Nat operations with explicit index conversion. Carry/borrow flags use uaddOverflow/usubOverflow or the stated extra-one inequality; get_digit/bit equal getLsbD even out of range. set_digit preserves x for indices >=63.

```lean
∀ (x y : NativeBridge.Incremental.Uint63Operations.Word),
  NativeBridge.Incremental.Uint63Operations.carryTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subc_def x y) =
    NativeBridge.Incremental.Uint63Operations.subWithBorrow x y
```

公理闭包：propext, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subcarryc_def

NativeBridge.Incremental.Uint63Operations.subcarryc_agrees

目标：NativeBridge.Incremental.Uint63Operations.subOneWithBorrow；范围：All inputs. Native BitVec/Nat operations with explicit index conversion. Carry/borrow flags use uaddOverflow/usubOverflow or the stated extra-one inequality; get_digit/bit equal getLsbD even out of range. set_digit preserves x for indices >=63.

```lean
∀ (x y : NativeBridge.Incremental.Uint63Operations.Word),
  NativeBridge.Incremental.Uint63Operations.carryTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subcarryc_def x y) =
    NativeBridge.Incremental.Uint63Operations.subOneWithBorrow x y
```

公理闭包：propext, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_def

NativeBridge.Incremental.Uint63Operations.divPair_agrees

目标：NativeBridge.Incremental.Uint63Operations.divisionPair；范围：All inputs. Native BitVec/Nat operations with explicit index conversion. Carry/borrow flags use uaddOverflow/usubOverflow or the stated extra-one inequality; get_digit/bit equal getLsbD even out of range. set_digit preserves x for indices >=63.

```lean
∀ (x y : NativeBridge.Incremental.Uint63Operations.Word),
  NativeBridge.prodTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_def x y) =
    NativeBridge.Incremental.Uint63Operations.divisionPair x y
```

公理闭包：propext

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.compare_def

NativeBridge.Incremental.Uint63Operations.compare_agrees

目标：NativeBridge.Incremental.Uint63Operations.compareWords；范围：All inputs. Native BitVec/Nat operations with explicit index conversion. Carry/borrow flags use uaddOverflow/usubOverflow or the stated extra-one inequality; get_digit/bit equal getLsbD even out of range. set_digit preserves x for indices >=63.

```lean
∀ (x y : NativeBridge.Incremental.Uint63Operations.Word),
  NativeBridge.comparisonTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.compare_def x y) =
    NativeBridge.Incremental.Uint63Operations.compareWords x y
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.is_zero

NativeBridge.Incremental.Uint63Operations.isZero_agrees

目标：NativeBridge.Incremental.Uint63Operations.isZero；范围：All inputs. Native BitVec/Nat operations with explicit index conversion. Carry/borrow flags use uaddOverflow/usubOverflow or the stated extra-one inequality; get_digit/bit equal getLsbD even out of range. set_digit preserves x for indices >=63.

```lean
∀ (x : NativeBridge.Incremental.Uint63Operations.Word),
  NativeBridge.boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.is_zero x) =
    NativeBridge.Incremental.Uint63Operations.isZero x
```

公理闭包：propext, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addmuldiv_def

NativeBridge.Incremental.Uint63Operations.funnel_agrees

目标：NativeBridge.Incremental.Uint63Operations.funnelShift；范围：All inputs. Native BitVec/Nat operations with explicit index conversion. Carry/borrow flags use uaddOverflow/usubOverflow or the stated extra-one inequality; get_digit/bit equal getLsbD even out of range. set_digit preserves x for indices >=63.

```lean
∀ (p x y : NativeBridge.Incremental.Uint63Operations.Word),
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addmuldiv_def p x y =
    NativeBridge.Incremental.Uint63Operations.funnelShift p x y
```

公理闭包：propext, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.is_even

NativeBridge.Incremental.Uint63Operations.isEven_agrees

目标：NativeBridge.Incremental.Uint63Operations.isEven；范围：All inputs. Native BitVec/Nat operations with explicit index conversion. Carry/borrow flags use uaddOverflow/usubOverflow or the stated extra-one inequality; get_digit/bit equal getLsbD even out of range. set_digit preserves x for indices >=63.

```lean
∀ (x : NativeBridge.Incremental.Uint63Operations.Word),
  NativeBridge.boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.is_even x) =
    NativeBridge.Incremental.Uint63Operations.isEven x
```

公理闭包：propext, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.get_digit

NativeBridge.Incremental.Uint63Operations.getDigit_agrees

目标：NativeBridge.Incremental.Uint63Operations.readBit；范围：All inputs. Native BitVec/Nat operations with explicit index conversion. Carry/borrow flags use uaddOverflow/usubOverflow or the stated extra-one inequality; get_digit/bit equal getLsbD even out of range. set_digit preserves x for indices >=63.

```lean
∀ (x p : NativeBridge.Incremental.Uint63Operations.Word),
  NativeBridge.boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.get_digit x p) =
    NativeBridge.Incremental.Uint63Operations.readBit x p
```

公理闭包：propext, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit

NativeBridge.Incremental.Uint63Operations.bit_agrees

目标：NativeBridge.Incremental.Uint63Operations.readBit；范围：All inputs. Native BitVec/Nat operations with explicit index conversion. Carry/borrow flags use uaddOverflow/usubOverflow or the stated extra-one inequality; get_digit/bit equal getLsbD even out of range. set_digit preserves x for indices >=63.

```lean
∀ (x p : NativeBridge.Incremental.Uint63Operations.Word),
  NativeBridge.boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit x p) =
    NativeBridge.Incremental.Uint63Operations.readBit x p
```

公理闭包：propext, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.set_digit

NativeBridge.Incremental.Uint63Operations.setDigit_agrees

目标：NativeBridge.Incremental.Uint63Operations.writeBit；范围：All inputs. Native BitVec/Nat operations with explicit index conversion. Carry/borrow flags use uaddOverflow/usubOverflow or the stated extra-one inequality; get_digit/bit equal getLsbD even out of range. set_digit preserves x for indices >=63.

```lean
∀ (x p : NativeBridge.Incremental.Uint63Operations.Word) (b : NativeBridge.RBool),
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.set_digit x p b =
    NativeBridge.Incremental.Uint63Operations.writeBit x p (NativeBridge.boolTo b)
```

公理闭包：propext, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_pos_rec

NativeBridge.Incremental.Uint63Conversions.ofPosRec_agrees

目标：NativeBridge.Incremental.Uint63Conversions.positiveFuel；范围：All inputs, including arbitrary recursion fuel and negative integers. of_pos_rec keeps low n bits then constructs BitVec 63; of_Z equals BitVec.ofInt 63; to_Z_rec equals the unsigned value modulo 2^n; to_Z equals unsigned toNat cast to Int.

```lean
∀ (n : NativeBridge.MN) (p : NativeBridge.RPositive),
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_pos_rec n p =
    NativeBridge.Incremental.Uint63Conversions.positiveFuel (NativeBridge.natTo n) (NativeBridge.positiveTo p)
```

公理闭包：propext, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_pos

NativeBridge.Incremental.Uint63Conversions.ofPos_agrees

目标：NativeBridge.Incremental.Uint63Conversions.ofPositive；范围：All inputs, including arbitrary recursion fuel and negative integers. of_pos_rec keeps low n bits then constructs BitVec 63; of_Z equals BitVec.ofInt 63; to_Z_rec equals the unsigned value modulo 2^n; to_Z equals unsigned toNat cast to Int.

```lean
∀ (p : NativeBridge.RPositive),
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_pos p =
    NativeBridge.Incremental.Uint63Conversions.ofPositive (NativeBridge.positiveTo p)
```

公理闭包：propext, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_Z

NativeBridge.Incremental.Uint63Conversions.ofZ_agrees

目标：NativeBridge.Incremental.Uint63Conversions.ofInteger；范围：All inputs, including arbitrary recursion fuel and negative integers. of_pos_rec keeps low n bits then constructs BitVec 63; of_Z equals BitVec.ofInt 63; to_Z_rec equals the unsigned value modulo 2^n; to_Z equals unsigned toNat cast to Int.

```lean
∀ (z : NativeBridge.Incremental.Uint63Conversions.RZ),
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_Z z =
    NativeBridge.Incremental.Uint63Conversions.ofInteger (NativeBridge.Incremental.Uint63Conversions.zTo z)
```

公理闭包：propext, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB

NativeBridge.Incremental.Uint63Conversions.wordBase_agrees

目标：NativeBridge.Incremental.Uint63Conversions.wordBase；范围：All inputs, including arbitrary recursion fuel and negative integers. of_pos_rec keeps low n bits then constructs BitVec 63; of_Z equals BitVec.ofInt 63; to_Z_rec equals the unsigned value modulo 2^n; to_Z equals unsigned toNat cast to Int.

```lean
NativeBridge.Incremental.Uint63Conversions.zTo Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB =
  NativeBridge.Incremental.Uint63Conversions.wordBase
```

公理闭包：空

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z_rec

NativeBridge.Incremental.Uint63Conversions.toZRec_agrees

目标：NativeBridge.Incremental.Uint63Conversions.unsignedFuel；范围：All inputs, including arbitrary recursion fuel and negative integers. of_pos_rec keeps low n bits then constructs BitVec 63; of_Z equals BitVec.ofInt 63; to_Z_rec equals the unsigned value modulo 2^n; to_Z equals unsigned toNat cast to Int.

```lean
∀ (n : NativeBridge.MN) (x : NativeBridge.Incremental.Uint63Operations.Word),
  NativeBridge.Incremental.Uint63Conversions.zTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z_rec n x) =
    NativeBridge.Incremental.Uint63Conversions.unsignedFuel (NativeBridge.natTo n) x
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z

NativeBridge.Incremental.Uint63Conversions.toZ_agrees

目标：NativeBridge.Incremental.Uint63Conversions.unsignedInteger；范围：All inputs, including arbitrary recursion fuel and negative integers. of_pos_rec keeps low n bits then constructs BitVec 63; of_Z equals BitVec.ofInt 63; to_Z_rec equals the unsigned value modulo 2^n; to_Z equals unsigned toNat cast to Int.

```lean
∀ (x : NativeBridge.Incremental.Uint63Operations.Word),
  NativeBridge.Incremental.Uint63Conversions.zTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x) =
    NativeBridge.Incremental.Uint63Conversions.unsignedInteger x
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.eqb_correct

NativeBridge.Incremental.Uint63Statements.eqbCorrect_correspondence

目标：NativeBridge.Incremental.Uint63Statements.eqbCorrect；范围：All 63-bit inputs and all word-valued bit indices, including out-of-range indices. Original mechanical statements independently proved; native statements use BitVec equality, getLsbD and unsigned integer roundtrip.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.eqb_correct.statement ↔
  NativeBridge.Incremental.Uint63Statements.eqbCorrect
```

公理闭包：propext, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.eqb_refl

NativeBridge.Incremental.Uint63Statements.eqbRefl_correspondence

目标：NativeBridge.Incremental.Uint63Statements.eqbRefl；范围：All 63-bit inputs and all word-valued bit indices, including out-of-range indices. Original mechanical statements independently proved; native statements use BitVec equality, getLsbD and unsigned integer roundtrip.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.eqb_refl.statement ↔ NativeBridge.Incremental.Uint63Statements.eqbRefl
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.land_spec

NativeBridge.Incremental.Uint63Statements.andBits_correspondence

目标：NativeBridge.Incremental.Uint63Statements.andBits；范围：All 63-bit inputs and all word-valued bit indices, including out-of-range indices. Original mechanical statements independently proved; native statements use BitVec equality, getLsbD and unsigned integer roundtrip.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.land_spec.statement ↔ NativeBridge.Incremental.Uint63Statements.andBits
```

公理闭包：propext, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lor_spec

NativeBridge.Incremental.Uint63Statements.orBits_correspondence

目标：NativeBridge.Incremental.Uint63Statements.orBits；范围：All 63-bit inputs and all word-valued bit indices, including out-of-range indices. Original mechanical statements independently proved; native statements use BitVec equality, getLsbD and unsigned integer roundtrip.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lor_spec.statement ↔ NativeBridge.Incremental.Uint63Statements.orBits
```

公理闭包：propext, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lxor_spec

NativeBridge.Incremental.Uint63Statements.xorBits_correspondence

目标：NativeBridge.Incremental.Uint63Statements.xorBits；范围：All 63-bit inputs and all word-valued bit indices, including out-of-range indices. Original mechanical statements independently proved; native statements use BitVec equality, getLsbD and unsigned integer roundtrip.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lxor_spec.statement ↔ NativeBridge.Incremental.Uint63Statements.xorBits
```

公理闭包：propext, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_to_Z

NativeBridge.Incremental.Uint63Statements.unsignedRoundtrip_correspondence

目标：NativeBridge.Incremental.Uint63Statements.unsignedRoundtrip；范围：All 63-bit inputs and all word-valued bit indices, including out-of-range indices. Original mechanical statements independently proved; native statements use BitVec equality, getLsbD and unsigned integer roundtrip.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_to_Z.statement ↔
  NativeBridge.Incremental.Uint63Statements.unsignedRoundtrip
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addc_def_spec

NativeBridge.Incremental.Uint63DefinitionSpecs.addAgreement_correspondence

目标：NativeBridge.Incremental.Uint63DefinitionSpecs.addAgreement；范围：All 63-bit inputs. Independently proved equality of source primitive and source definitional implementations. Native carry/borrow specifications retain overflow inequalities; division-pair and funnel specifications normalize to equality of the same native expression.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addc_def_spec.statement ↔
  NativeBridge.Incremental.Uint63DefinitionSpecs.addAgreement
```

公理闭包：propext, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarryc_def_spec

NativeBridge.Incremental.Uint63DefinitionSpecs.addOneAgreement_correspondence

目标：NativeBridge.Incremental.Uint63DefinitionSpecs.addOneAgreement；范围：All 63-bit inputs. Independently proved equality of source primitive and source definitional implementations. Native carry/borrow specifications retain overflow inequalities; division-pair and funnel specifications normalize to equality of the same native expression.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarryc_def_spec.statement ↔
  NativeBridge.Incremental.Uint63DefinitionSpecs.addOneAgreement
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subc_def_spec

NativeBridge.Incremental.Uint63DefinitionSpecs.subAgreement_correspondence

目标：NativeBridge.Incremental.Uint63DefinitionSpecs.subAgreement；范围：All 63-bit inputs. Independently proved equality of source primitive and source definitional implementations. Native carry/borrow specifications retain overflow inequalities; division-pair and funnel specifications normalize to equality of the same native expression.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subc_def_spec.statement ↔
  NativeBridge.Incremental.Uint63DefinitionSpecs.subAgreement
```

公理闭包：propext, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subcarryc_def_spec

NativeBridge.Incremental.Uint63DefinitionSpecs.subOneAgreement_correspondence

目标：NativeBridge.Incremental.Uint63DefinitionSpecs.subOneAgreement；范围：All 63-bit inputs. Independently proved equality of source primitive and source definitional implementations. Native carry/borrow specifications retain overflow inequalities; division-pair and funnel specifications normalize to equality of the same native expression.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subcarryc_def_spec.statement ↔
  NativeBridge.Incremental.Uint63DefinitionSpecs.subOneAgreement
```

公理闭包：propext, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.compare_def_spec

NativeBridge.Incremental.Uint63DefinitionSpecs.compareAgreement_correspondence

目标：NativeBridge.Incremental.Uint63DefinitionSpecs.compareAgreement；范围：All 63-bit inputs. Independently proved equality of source primitive and source definitional implementations. Native carry/borrow specifications retain overflow inequalities; division-pair and funnel specifications normalize to equality of the same native expression.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.compare_def_spec.statement ↔
  NativeBridge.Incremental.Uint63DefinitionSpecs.compareAgreement
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_def_spec

NativeBridge.Incremental.Uint63DefinitionSpecs.divPairAgreement_correspondence

目标：NativeBridge.Incremental.Uint63DefinitionSpecs.divPairAgreement；范围：All 63-bit inputs. Independently proved equality of source primitive and source definitional implementations. Native carry/borrow specifications retain overflow inequalities; division-pair and funnel specifications normalize to equality of the same native expression.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_def_spec.statement ↔
  NativeBridge.Incremental.Uint63DefinitionSpecs.divPairAgreement
```

公理闭包：propext

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addmuldiv_def_spec

NativeBridge.Incremental.Uint63DefinitionSpecs.funnelAgreement_correspondence

目标：NativeBridge.Incremental.Uint63DefinitionSpecs.funnelAgreement；范围：All 63-bit inputs. Independently proved equality of source primitive and source definitional implementations. Native carry/borrow specifications retain overflow inequalities; division-pair and funnel specifications normalize to equality of the same native expression.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addmuldiv_def_spec.statement ↔
  NativeBridge.Incremental.Uint63DefinitionSpecs.funnelAgreement
```

公理闭包：propext, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.ltb_spec

NativeBridge.Incremental.Uint63OrderSpecs.unsignedLtSpec_correspondence

目标：NativeBridge.Incremental.Uint63OrderSpecs.unsignedLtSpec；范围：All 63-bit inputs. Boolean unsigned comparison iff the corresponding order on unsigned native integers. Source Z comparison is independently rechecked in this module closure; original statement independently proved.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.ltb_spec.statement ↔
  NativeBridge.Incremental.Uint63OrderSpecs.unsignedLtSpec
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.leb_spec

NativeBridge.Incremental.Uint63OrderSpecs.unsignedLeSpec_correspondence

目标：NativeBridge.Incremental.Uint63OrderSpecs.unsignedLeSpec；范围：All 63-bit inputs. Boolean unsigned comparison iff the corresponding order on unsigned native integers. Source Z comparison is independently rechecked in this module closure; original statement independently proved.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.leb_spec.statement ↔
  NativeBridge.Incremental.Uint63OrderSpecs.unsignedLeSpec
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.add_spec

NativeBridge.Incremental.Uint63ArithmeticSpecs.addSpec_correspondence

目标：NativeBridge.Incremental.Uint63ArithmeticSpecs.addSpec；范围：All 63-bit inputs including division by zero and subtraction underflow. Native Int.fdiv/fmod retain source floor-division semantics; addition, subtraction and multiplication are reduced modulo 2^63. Original source statement independently proved.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.add_spec.statement ↔
  NativeBridge.Incremental.Uint63ArithmeticSpecs.addSpec
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.sub_spec

NativeBridge.Incremental.Uint63ArithmeticSpecs.subSpec_correspondence

目标：NativeBridge.Incremental.Uint63ArithmeticSpecs.subSpec；范围：All 63-bit inputs including division by zero and subtraction underflow. Native Int.fdiv/fmod retain source floor-division semantics; addition, subtraction and multiplication are reduced modulo 2^63. Original source statement independently proved.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.sub_spec.statement ↔
  NativeBridge.Incremental.Uint63ArithmeticSpecs.subSpec
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.mul_spec

NativeBridge.Incremental.Uint63ArithmeticSpecs.mulSpec_correspondence

目标：NativeBridge.Incremental.Uint63ArithmeticSpecs.mulSpec；范围：All 63-bit inputs including division by zero and subtraction underflow. Native Int.fdiv/fmod retain source floor-division semantics; addition, subtraction and multiplication are reduced modulo 2^63. Original source statement independently proved.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.mul_spec.statement ↔
  NativeBridge.Incremental.Uint63ArithmeticSpecs.mulSpec
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.div_spec

NativeBridge.Incremental.Uint63ArithmeticSpecs.divSpec_correspondence

目标：NativeBridge.Incremental.Uint63ArithmeticSpecs.divSpec；范围：All 63-bit inputs including division by zero and subtraction underflow. Native Int.fdiv/fmod retain source floor-division semantics; addition, subtraction and multiplication are reduced modulo 2^63. Original source statement independently proved.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.div_spec.statement ↔
  NativeBridge.Incremental.Uint63ArithmeticSpecs.divSpec
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.mod_spec

NativeBridge.Incremental.Uint63ArithmeticSpecs.modSpec_correspondence

目标：NativeBridge.Incremental.Uint63ArithmeticSpecs.modSpec；范围：All 63-bit inputs including division by zero and subtraction underflow. Native Int.fdiv/fmod retain source floor-division semantics; addition, subtraction and multiplication are reduced modulo 2^63. Original source statement independently proved.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.mod_spec.statement ↔
  NativeBridge.Incremental.Uint63ArithmeticSpecs.modSpec
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lsl_spec

NativeBridge.Incremental.Uint63ShiftSpecs.leftShiftSpec_correspondence

目标：NativeBridge.Incremental.Uint63ShiftSpecs.leftShiftSpec；范围：All word-valued shift counts, including counts >=63. Left shift is multiplication by 2^p modulo 2^63; right shift is unsigned floor division by 2^p. Original source statements independently proved.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lsl_spec.statement ↔
  NativeBridge.Incremental.Uint63ShiftSpecs.leftShiftSpec
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lsr_spec

NativeBridge.Incremental.Uint63ShiftSpecs.rightShiftSpec_correspondence

目标：NativeBridge.Incremental.Uint63ShiftSpecs.rightShiftSpec；范围：All word-valued shift counts, including counts >=63. Left shift is multiplication by 2^p modulo 2^63; right shift is unsigned floor division by 2^p. Original source statements independently proved.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lsr_spec.statement ↔
  NativeBridge.Incremental.Uint63ShiftSpecs.rightShiftSpec
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.head0_spec

NativeBridge.Incremental.Uint63CountSpecs.leadingZeroSpec_correspondence

目标：NativeBridge.Incremental.Uint63CountSpecs.leadingZeroSpec；范围：All nonzero word inputs, preserving the original premise. clz gives the normalization bounds; ctz gives an odd-factor decomposition with a nonnegative witness. Source existential witnesses are explicitly built using the Z isomorphism. Original source statements independently proved.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.head0_spec.statement ↔
  NativeBridge.Incremental.Uint63CountSpecs.leadingZeroSpec
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.tail0_spec

NativeBridge.Incremental.Uint63CountSpecs.trailingZeroSpec_correspondence

目标：NativeBridge.Incremental.Uint63CountSpecs.trailingZeroSpec；范围：All nonzero word inputs, preserving the original premise. clz gives the normalization bounds; ctz gives an odd-factor decomposition with a nonnegative witness. Source existential witnesses are explicitly built using the Z isomorphism. Original source statements independently proved.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.tail0_spec.statement ↔
  NativeBridge.Incremental.Uint63CountSpecs.trailingZeroSpec
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.mulc_spec

NativeBridge.Incremental.Uint63WideSpecs.wideProductSpec_correspondence

目标：NativeBridge.Incremental.Uint63WideSpecs.wideProductSpec；范围：Full-width multiplication reconstructs the exact product from high and low words. Double-word division preserves the source hi<divisor premise and proves quotient/remainder fit 63 bits, hence word truncation leaves the exact quotient/remainder unchanged. Source statements independently proved.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.mulc_spec.statement ↔
  NativeBridge.Incremental.Uint63WideSpecs.wideProductSpec
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_21_spec

NativeBridge.Incremental.Uint63WideSpecs.doubleDivisionSpec_correspondence

目标：NativeBridge.Incremental.Uint63WideSpecs.doubleDivisionSpec；范围：Full-width multiplication reconstructs the exact product from high and low words. Double-word division preserves the source hi<divisor premise and proves quotient/remainder fit 63 bits, hence word truncation leaves the exact quotient/remainder unchanged. Source statements independently proved.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_21_spec.statement ↔
  NativeBridge.Incremental.Uint63WideSpecs.doubleDivisionSpec
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Sint63Axioms.min_int

NativeBridge.Incremental.Sint63Operations.minimum_agrees

目标：NativeBridge.Incremental.Sint63Operations.minimum；范围：All 63-bit inputs. Minimum is the high-bit word; source signed to_Z equals BitVec.toInt. Signed comparison/order statements are fully native and independently proved, including the negative half of the word range.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.min_int = NativeBridge.Incremental.Sint63Operations.minimum
```

公理闭包：空

## Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z

NativeBridge.Incremental.Sint63Operations.signedInteger_agrees

目标：NativeBridge.Incremental.Sint63Operations.signedInteger；范围：All 63-bit inputs. Minimum is the high-bit word; source signed to_Z equals BitVec.toInt. Signed comparison/order statements are fully native and independently proved, including the negative half of the word range.

```lean
∀ (x : NativeBridge.Incremental.Sint63UnsignedSupport.Word),
  NativeBridge.binaryIntTo (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z x) =
    NativeBridge.Incremental.Sint63Operations.signedInteger x
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Sint63Axioms.compare_spec

NativeBridge.Incremental.Sint63Operations.comparisonSpec_correspondence

目标：NativeBridge.Incremental.Sint63Operations.comparisonSpec；范围：All 63-bit inputs. Minimum is the high-bit word; source signed to_Z equals BitVec.toInt. Signed comparison/order statements are fully native and independently proved, including the negative half of the word range.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.compare_spec.statement ↔
  NativeBridge.Incremental.Sint63Operations.comparisonSpec
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Sint63Axioms.ltb_spec

NativeBridge.Incremental.Sint63Operations.lessSpec_correspondence

目标：NativeBridge.Incremental.Sint63Operations.lessSpec；范围：All 63-bit inputs. Minimum is the high-bit word; source signed to_Z equals BitVec.toInt. Signed comparison/order statements are fully native and independently proved, including the negative half of the word range.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.ltb_spec.statement ↔ NativeBridge.Incremental.Sint63Operations.lessSpec
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Sint63Axioms.leb_spec

NativeBridge.Incremental.Sint63Operations.lessEqualSpec_correspondence

目标：NativeBridge.Incremental.Sint63Operations.lessEqualSpec；范围：All 63-bit inputs. Minimum is the high-bit word; source signed to_Z equals BitVec.toInt. Signed comparison/order statements are fully native and independently proved, including the negative half of the word range.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.leb_spec.statement ↔
  NativeBridge.Incremental.Sint63Operations.lessEqualSpec
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Sint63Axioms.div_spec

NativeBridge.Incremental.Sint63Specs.signedDivisionSpec_correspondence

目标：NativeBridge.Incremental.Sint63Specs.signedDivisionSpec；范围：All inputs within original premises: division excludes min_int/-1 overflow; remainder is unconditional; arithmetic right shift preserves negative signed-count behavior. Original source statements independently proved using signed Z arithmetic and native BitVec APIs.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.div_spec.statement ↔
  NativeBridge.Incremental.Sint63Specs.signedDivisionSpec
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Sint63Axioms.mod_spec

NativeBridge.Incremental.Sint63Specs.signedRemainderSpec_correspondence

目标：NativeBridge.Incremental.Sint63Specs.signedRemainderSpec；范围：All inputs within original premises: division excludes min_int/-1 overflow; remainder is unconditional; arithmetic right shift preserves negative signed-count behavior. Original source statements independently proved using signed Z arithmetic and native BitVec APIs.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.mod_spec.statement ↔
  NativeBridge.Incremental.Sint63Specs.signedRemainderSpec
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.Sint63Axioms.asr_spec

NativeBridge.Incremental.Sint63Specs.arithmeticShiftSpec_correspondence

目标：NativeBridge.Incremental.Sint63Specs.arithmeticShiftSpec；范围：All inputs within original premises: division excludes min_int/-1 overflow; remainder is unconditional; arithmetic right shift preserves negative signed-count behavior. Original source statements independently proved using signed Z arithmetic and native BitVec APIs.

```lean
Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.asr_spec.statement ↔
  NativeBridge.Incremental.Sint63Specs.arithmeticShiftSpec
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.PrimInt63.divs

NativeBridge.Incremental.Sint63Specs.primitiveDiv_agrees

目标：BitVec.sdiv；范围：Additional certificate for an already covered root. All 63-bit inputs; divs/mods equal existing BitVec.sdiv/srem APIs, including overflow word wrapping and zero divisor. asr returns zero for negative signed count, otherwise native sshiftRight.

```lean
∀ (x y : NativeBridge.Incremental.Sint63UnsignedSupport.Word),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.divs x y = BitVec.sdiv x y
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.PrimInt63.mods

NativeBridge.Incremental.Sint63Specs.primitiveMod_agrees

目标：BitVec.srem；范围：Additional certificate for an already covered root. All 63-bit inputs; divs/mods equal existing BitVec.sdiv/srem APIs, including overflow word wrapping and zero divisor. asr returns zero for negative signed count, otherwise native sshiftRight.

```lean
∀ (x y : NativeBridge.Incremental.Sint63UnsignedSupport.Word),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mods x y = BitVec.srem x y
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Numbers.Cyclic.Int63.PrimInt63.asr

NativeBridge.Incremental.Sint63Specs.primitiveShift_agrees

目标：NativeBridge.Incremental.Sint63Specs.arithmeticShift；范围：Additional certificate for an already covered root. All 63-bit inputs; divs/mods equal existing BitVec.sdiv/srem APIs, including overflow word wrapping and zero divisor. asr returns zero for negative signed count, otherwise native sshiftRight.

```lean
∀ (x p : NativeBridge.Incremental.Sint63UnsignedSupport.Word),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.asr x p = NativeBridge.Incremental.Sint63Specs.arithmeticShift x p
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.ssr.ssrbool.canLR_in

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.canLR_in.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (f : T1 → Bool) (f_1 : T1 → T2)
  (g : T2 → T1) (x : T2) (y : T1), (∀ (x : T1), f x = true → g (f_1 x) = x) → f y = true → x = f_1 y → g x = y；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.canLR_in.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.canLR_in.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.canLR_on

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.canLR_on.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (f : T2 → Bool) (f_1 : T1 → T2)
  (g : T2 → T1) (x : T2) (y : T1),
  (∀ (x : T1), f (f_1 x) = true → g (f_1 x) = x) → f (f_1 y) = true → x = f_1 y → g x = y；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.canLR_on.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.canLR_on.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.canRL_in

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.canRL_in.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (f : T1 → Bool) (f_1 : T1 → T2)
  (g : T2 → T1) (x : T1) (y : T2), (∀ (x : T1), f x = true → g (f_1 x) = x) → f x = true → f_1 x = y → x = g y；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.canRL_in.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.canRL_in.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.canRL_on

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.canRL_on.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (f : T2 → Bool) (f_1 : T1 → T2)
  (g : T2 → T1) (x : T1) (y : T2),
  (∀ (x : T1), f (f_1 x) = true → g (f_1 x) = x) → f (f_1 x) = true → f_1 x = y → x = g y；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.canRL_on.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.canRL_on.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.can_in_comp

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.can_in_comp.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_ssr_ssrbool_2038) (B : Type u_Corelib_ssr_ssrbool_2039) (C : Type u_Corelib_ssr_ssrbool_2040)
  (f : B → Bool) (f_1 : C → Bool) (f_2 : B → A) (h : C → B) (f' : A → B) (h' : B → C),
  (∀ (x : C), f_1 x = true → f (h x) = true) →
    (∀ (x : B), f x = true → f' (f_2 x) = x) →
      (∀ (x : C), f_1 x = true → h' (h x) = x) → ∀ (x : C), f_1 x = true → h' (f' (f_2 (h x))) = x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.can_in_comp.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.can_in_comp.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.can_in_inj

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.can_in_inj.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (f : T1 → Bool) (f_1 : T1 → T2)
  (g : T2 → T1),
  (∀ (x : T1), f x = true → g (f_1 x) = x) → ∀ (x y : T1), f x = true → f y = true → f_1 x = f_1 y → x = y；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.can_in_inj.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.can_in_inj.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.can_in_pcan

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.can_in_pcan.statement.correspondence

目标：native statement: ∀ (rT : Type u_Corelib_ssr_ssrbool_2005) (aT : Type u_Corelib_ssr_ssrbool_2006) (f : aT → Bool) (f_1 : aT → rT)
  (g : rT → aT),
  (∀ (x : aT), f x = true → g (f_1 x) = x) → ∀ (x : aT), f x = true → some { down := g (f_1 x) } = some { down := x }；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.can_in_pcan.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.can_in_pcan.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.can_mono_in

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.can_mono_in.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_1169__c0) (rT : Type u_Corelib_ssr_ssrbool_1169__c1) (f : aT → rT) (g : rT → aT)
  (f_1 : aT → Bool) (f_2 : rT → Bool) (f_3 : aT → aT → Bool) (f_4 : rT → rT → Bool),
  (∀ (x : rT), f_2 x = true → f_1 (g x) = true → f (g x) = x) →
    (∀ (x : rT), f_2 x = true → f_1 (g x) = true) →
      (∀ (x y : aT), f_1 x = true → f_1 y = true → f_4 (f x) (f y) = f_3 x y) →
        ∀ (x y : rT), f_2 x = true → f_2 y = true → f_3 (g x) (g y) = f_4 x y；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.can_mono_in.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.can_mono_in.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.equivalence_relP_in

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.equivalence_relP_in.statement.correspondence

目标：native statement: ∀ (T : Type u_Corelib_ssr_ssrbool_2161) (f : T → T → Bool) (f_1 : T → Bool),
  (∀ (x y z : T), f_1 x = true → f_1 y = true → f_1 z = true → f z z = true ∧ (f x y = true → f x z = f y z)) ↔
    (∀ (x : T), f_1 x = true → f x x = true) ∧
      ∀ (x y : T), f_1 x = true → f_1 y = true → f x y = true → ∀ (x_1 : T), f_1 x_1 = true → f x x_1 = f y x_1；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.equivalence_relP_in.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.equivalence_relP_in.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.homoLR_in

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.homoLR_in.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_1169__c0) (rT : Type u_Corelib_ssr_ssrbool_1169__c1) (f : aT → rT) (g : rT → aT)
  (f_1 : aT → Bool) (f_2 : rT → Bool) (f_3 : aT → aT → Bool) (f_4 : rT → rT → Bool),
  (∀ (x : rT), f_2 x = true → f_1 (g x) = true → f (g x) = x) →
    (∀ (x : rT), f_2 x = true → f_1 (g x) = true) →
      (∀ (x y : aT), f_1 x = true → f_1 y = true → f_3 x y = true → f_4 (f x) (f y) = true) →
        ∀ (x : aT) (y : rT), f_1 x = true → f_2 y = true → f_3 x (g y) = true → f_4 (f x) y = true；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.homoLR_in.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.homoLR_in.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.homoRL_in

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.homoRL_in.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_1169__c0) (rT : Type u_Corelib_ssr_ssrbool_1169__c1) (f : aT → rT) (g : rT → aT)
  (f_1 : aT → Bool) (f_2 : rT → Bool) (f_3 : aT → aT → Bool) (f_4 : rT → rT → Bool),
  (∀ (x : rT), f_2 x = true → f_1 (g x) = true → f (g x) = x) →
    (∀ (x : rT), f_2 x = true → f_1 (g x) = true) →
      (∀ (x y : aT), f_1 x = true → f_1 y = true → f_3 x y = true → f_4 (f x) (f y) = true) →
        ∀ (x : rT) (y : aT), f_2 x = true → f_1 y = true → f_3 (g x) y = true → f_4 x (f y) = true；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.homoRL_in.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.homoRL_in.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.homo_mono_in

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.homo_mono_in.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_1169__c0) (rT : Type u_Corelib_ssr_ssrbool_1169__c1) (f : aT → rT) (g : rT → aT)
  (f_1 : aT → Bool) (f_2 : rT → Bool) (f_3 : aT → aT → Bool) (f_4 : rT → rT → Bool),
  (∀ (x : rT), f_2 x = true → f_1 (g x) = true → f (g x) = x) →
    (∀ (x : rT), f_2 x = true → f_1 (g x) = true) →
      (∀ (x y : aT), f_1 x = true → f_1 y = true → f_3 x y = true → f_4 (f x) (f y) = true) →
        (∀ (x y : rT), f_2 x = true → f_2 y = true → f_4 x y = true → f_3 (g x) (g y) = true) →
          ∀ (x y : rT), f_2 x = true → f_2 y = true → f_3 (g x) (g y) = f_4 x y；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.homo_mono_in.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.homo_mono_in.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.homo_sym_in

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.homo_sym_in.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_2262) (rT : Type u_Corelib_ssr_ssrbool_2263) (f : aT → aT → Bool)
  (f_1 : rT → rT → Bool) (f_2 : aT → rT) (f_3 : aT → Bool),
  (∀ (x y : aT), f_3 x = true → f_3 y = true → f x y = true → f_1 (f_2 x) (f_2 y) = true) →
    ∀ (x y : aT), f_3 x = true → f_3 y = true → f y x = true → f_1 (f_2 y) (f_2 x) = true；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.homo_sym_in.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.homo_sym_in.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.homo_sym_in11

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.homo_sym_in11.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_2262) (rT : Type u_Corelib_ssr_ssrbool_2263) (f : aT → aT → Bool)
  (f_1 : rT → rT → Bool) (f_2 : aT → rT) (f_3 f_4 : aT → Bool),
  (∀ (x y : aT), f_3 x = true → f_4 y = true → f x y = true → f_1 (f_2 x) (f_2 y) = true) →
    ∀ (x y : aT), f_4 x = true → f_3 y = true → f y x = true → f_1 (f_2 y) (f_2 x) = true；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.homo_sym_in11.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.homo_sym_in11.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.in1T

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in1T.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169) (P1 : T1 → Prop), (∀ (x : T1), true = true → P1 x) → ∀ (x : T1), P1 x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.in1T.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in1T.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.in1W

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in1W.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169) (f : T1 → Bool) (P1 : T1 → Prop),
  (∀ (x : T1), P1 x) → ∀ (x : T1), f x = true → P1 x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.in1W.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in1W.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.in1_sig

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in1_sig.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_2085) (f : T1 → Bool) (P1 : T1 → Prop),
  (∀ (x : T1), f x = true → P1 x) → ∀ (x : { a // f a = true }), P1 x.val；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.in1_sig.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in1_sig.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.in2T

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in2T.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (P2 : T1 → T2 → Prop),
  (∀ (x : T1) (y : T2), true = true → true = true → P2 x y) → ∀ (x : T1) (y : T2), P2 x y；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.in2T.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in2T.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.in2W

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in2W.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (f : T1 → Bool)
  (f_1 : T2 → Bool) (P2 : T1 → T2 → Prop),
  (∀ (x : T1) (y : T2), P2 x y) → ∀ (x : T1) (y : T2), f x = true → f_1 y = true → P2 x y；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.in2W.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in2W.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.in2_sig

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in2_sig.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_2085) (T2 : Type u_Corelib_ssr_ssrbool_2086) (f : T1 → Bool) (f_1 : T2 → Bool)
  (P2 : T1 → T2 → Prop),
  (∀ (x : T1) (y : T2), f x = true → f_1 y = true → P2 x y) →
    ∀ (x : { a // f a = true }) (x_1 : { a // f_1 a = true }), P2 x.val x_1.val；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.in2_sig.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in2_sig.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.in3T

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in3T.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1)
  (T3 : Type u_Corelib_ssr_ssrbool_1169__c2) (P3 : T1 → T2 → T3 → Prop),
  (∀ (x : T1) (y : T2) (z : T3), true = true → true = true → true = true → P3 x y z) →
    ∀ (x : T1) (y : T2) (z : T3), P3 x y z；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.in3T.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in3T.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.in3W

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in3W.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1)
  (T3 : Type u_Corelib_ssr_ssrbool_1169__c2) (f : T1 → Bool) (f_1 : T2 → Bool) (f_2 : T3 → Bool)
  (P3 : T1 → T2 → T3 → Prop),
  (∀ (x : T1) (y : T2) (z : T3), P3 x y z) →
    ∀ (x : T1) (y : T2) (z : T3), f x = true → f_1 y = true → f_2 z = true → P3 x y z；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.in3W.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in3W.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.in3_sig

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in3_sig.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_2085) (T2 : Type u_Corelib_ssr_ssrbool_2086) (T3 : Type u_Corelib_ssr_ssrbool_2087)
  (f : T1 → Bool) (f_1 : T2 → Bool) (f_2 : T3 → Bool) (P3 : T1 → T2 → T3 → Prop),
  (∀ (x : T1) (y : T2) (z : T3), f x = true → f_1 y = true → f_2 z = true → P3 x y z) →
    ∀ (x : { a // f a = true }) (x_1 : { a // f_1 a = true }) (x_2 : { a // f_2 a = true }), P3 x.val x_1.val x_2.val；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.in3_sig.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in3_sig.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.inT_bij

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.inT_bij.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (f : T1 → T2),
  (∃ x, (∀ (x_1 : T1), true = true → x (f x_1) = x_1) ∧ ∀ (x_1 : T2), true = true → f (x x_1) = x_1) →
    ∃ g, (∀ (x : T1), g (f x) = x) ∧ ∀ (y : T2), f (g y) = y；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.inT_bij.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.inT_bij.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.inW_bij

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.inW_bij.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (f : T1 → Bool) (f_1 : T1 → T2),
  (∃ g, (∀ (x : T1), g (f_1 x) = x) ∧ ∀ (y : T2), f_1 (g y) = y) →
    ∃ x, (∀ (x_1 : T1), f x_1 = true → x (f_1 x_1) = x_1) ∧ ∀ (x_1 : T2), f (x x_1) = true → f_1 (x x_1) = x_1；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.inW_bij.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.inW_bij.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.in_inj_comp

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in_inj_comp.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_ssr_ssrbool_2023) (B : Type u_Corelib_ssr_ssrbool_2022) (C : Type u_Corelib_ssr_ssrbool_2024)
  (f : B → A) (h : C → B) (f_1 : B → Bool) (f_2 : C → Bool),
  (∀ (x y : B), f_1 x = true → f_1 y = true → f x = f y → x = y) →
    (∀ (x y : C), f_2 x = true → f_2 y = true → h x = h y → x = y) →
      (∀ (x : C), f_2 x = true → f_1 (h x) = true) →
        ∀ (x y : C), f_2 x = true → f_2 y = true → f (h x) = f (h y) → x = y；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.in_inj_comp.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in_inj_comp.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.in_on1P

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in_on1P.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (f : T1 → Bool)
  (f_1 : T2 → Bool) (f_2 : T1 → T2) (Q1 : (T1 → T2) → T1 → Prop),
  (∀ (x : T1), f x = true → f_1 (f_2 x) = true → Q1 f_2 x) ↔ ∀ (x : T1), (f x && f_1 (f_2 x)) = true → Q1 f_2 x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.in_on1P.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in_on1P.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.in_on1S

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in_on1S.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (f : T2 → Bool) (f_1 : T1 → T2)
  (Q1 : (T1 → T2) → T1 → Prop),
  (∀ (x : T1), f (f_1 x) = true) → (∀ (x : T1), true = true → f (f_1 x) = true → Q1 f_1 x) → ∀ (x : T1), Q1 f_1 x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.in_on1S.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in_on1S.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.in_on1W

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in_on1W.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (f : T1 → Bool)
  (f_1 : T2 → Bool) (f_2 : T1 → T2) (Q1 : (T1 → T2) → T1 → Prop),
  (∀ (x : T1), Q1 f_2 x) → ∀ (x : T1), f x = true → f_1 (f_2 x) = true → Q1 f_2 x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.in_on1W.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in_on1W.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.in_on1lP

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in_on1lP.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1)
  (T3 : Type u_Corelib_ssr_ssrbool_1169__c2) (f : T1 → Bool) (f_1 : T2 → Bool) (f_2 : T1 → T2) (h : T3)
  (Q1l : (T1 → T2) → T3 → T1 → Prop),
  (∀ (x : T1), f x = true → f_1 (f_2 x) = true → Q1l f_2 h x) ↔ ∀ (x : T1), (f x && f_1 (f_2 x)) = true → Q1l f_2 h x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.in_on1lP.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in_on1lP.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.in_on1lS

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in_on1lS.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1)
  (T3 : Type u_Corelib_ssr_ssrbool_1169__c2) (f : T2 → Bool) (f_1 : T1 → T2) (h : T3)
  (Q1l : (T1 → T2) → T3 → T1 → Prop),
  (∀ (x : T1), f (f_1 x) = true) → (∀ (x : T1), true = true → f (f_1 x) = true → Q1l f_1 h x) → ∀ (x : T1), Q1l f_1 h x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.in_on1lS.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in_on1lS.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.in_on1lW

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in_on1lW.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1)
  (T3 : Type u_Corelib_ssr_ssrbool_1169__c2) (f : T1 → Bool) (f_1 : T2 → Bool) (f_2 : T1 → T2) (h : T3)
  (Q1l : (T1 → T2) → T3 → T1 → Prop),
  (∀ (x : T1), Q1l f_2 h x) → ∀ (x : T1), f x = true → f_1 (f_2 x) = true → Q1l f_2 h x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.in_on1lW.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in_on1lW.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.in_on2P

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in_on2P.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (f : T1 → Bool)
  (f_1 : T2 → Bool) (f_2 : T1 → T2) (Q2 : (T1 → T2) → T1 → T1 → Prop),
  (∀ (x y : T1), f x = true → f y = true → f_1 (f_2 x) = true → f_1 (f_2 y) = true → Q2 f_2 x y) ↔
    ∀ (x y : T1), (f x && f_1 (f_2 x)) = true → (f y && f_1 (f_2 y)) = true → Q2 f_2 x y；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.in_on2P.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in_on2P.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.in_on2S

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in_on2S.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (f : T2 → Bool) (f_1 : T1 → T2)
  (Q2 : (T1 → T2) → T1 → T1 → Prop),
  (∀ (x : T1), f (f_1 x) = true) →
    (∀ (x y : T1), true = true → true = true → f (f_1 x) = true → f (f_1 y) = true → Q2 f_1 x y) →
      ∀ (x y : T1), Q2 f_1 x y；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.in_on2S.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in_on2S.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.in_on2W

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in_on2W.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (f : T1 → Bool)
  (f_1 : T2 → Bool) (f_2 : T1 → T2) (Q2 : (T1 → T2) → T1 → T1 → Prop),
  (∀ (x y : T1), Q2 f_2 x y) →
    ∀ (x y : T1), f x = true → f y = true → f_1 (f_2 x) = true → f_1 (f_2 y) = true → Q2 f_2 x y；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.in_on2W.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in_on2W.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.in_onS_can

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in_onS_can.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_1169__c0) (rT : Type u_Corelib_ssr_ssrbool_1169__c1) (f : aT → Bool) (f_1 : aT → rT)
  (g : rT → aT),
  (∀ (x : rT), f (g x) = true) → (∀ (x : rT), true = true → f (g x) = true → f_1 (g x) = x) → ∀ (x : rT), f_1 (g x) = x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.in_onS_can.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in_onS_can.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.in_onW_can

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in_onW_can.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_1169__c0) (rT : Type u_Corelib_ssr_ssrbool_1169__c1) (f : aT → Bool)
  (f_1 : rT → Bool) (f_2 : aT → rT) (g : rT → aT),
  (∀ (x : rT), f_2 (g x) = x) → ∀ (x : rT), f_1 x = true → f (g x) = true → f_2 (g x) = x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.in_onW_can.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.in_onW_can.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.inj_can_sym_in

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.inj_can_sym_in.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_1169__c0) (rT : Type u_Corelib_ssr_ssrbool_1169__c1) (f : rT → Bool) (f_1 : aT → rT)
  (g : rT → aT),
  (∀ (x : rT), f x = true → f (f_1 (g x)) = true) →
    (∀ (x : aT), f (f_1 x) = true → g (f_1 x) = x) →
      (∀ (x y : rT), f x = true → f y = true → g x = g y → x = y) → ∀ (x : rT), f x = true → f_1 (g x) = x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.inj_can_sym_in.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.inj_can_sym_in.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.inj_can_sym_in_on

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.inj_can_sym_in_on.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_1169__c0) (rT : Type u_Corelib_ssr_ssrbool_1169__c1) (f : aT → Bool)
  (f_1 : rT → Bool) (f_2 : aT → rT) (g : rT → aT),
  (∀ (x : aT), f x = true → f_1 (f_2 x) = true) →
    (∀ (x : aT), f x = true → f_1 (f_2 x) = true → g (f_2 x) = x) →
      (∀ (x y : rT), f_1 x = true → f_1 y = true → f (g x) = true → f (g y) = true → g x = g y → x = y) →
        ∀ (x : rT), f_1 x = true → f (g x) = true → f_2 (g x) = x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.inj_can_sym_in_on.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.inj_can_sym_in_on.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.inj_can_sym_on

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.inj_can_sym_on.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_1169__c0) (rT : Type u_Corelib_ssr_ssrbool_1169__c1) (f : aT → Bool) (f_1 : aT → rT)
  (g : rT → aT),
  (∀ (x : aT), f x = true → g (f_1 x) = x) →
    (∀ (x y : rT), f (g x) = true → f (g y) = true → g x = g y → x = y) → ∀ (x : rT), f (g x) = true → f_1 (g x) = x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.inj_can_sym_on.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.inj_can_sym_on.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.mono1W_in

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.mono1W_in.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_1169__c0) (rT : Type u_Corelib_ssr_ssrbool_1169__c1) (f : aT → rT)
  (f_1 f_2 : aT → Bool) (f_3 : rT → Bool),
  (∀ (x : aT), f_1 x = true → f_3 (f x) = f_2 x) → ∀ (x : aT), f_1 x = true → f_2 x = true → f_3 (f x) = true；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.mono1W_in.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.mono1W_in.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.monoLR_in

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.monoLR_in.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_1169__c0) (rT : Type u_Corelib_ssr_ssrbool_1169__c1) (f : aT → rT) (g : rT → aT)
  (f_1 : aT → Bool) (f_2 : rT → Bool) (f_3 : aT → aT → Bool) (f_4 : rT → rT → Bool),
  (∀ (x : rT), f_2 x = true → f_1 (g x) = true → f (g x) = x) →
    (∀ (x : rT), f_2 x = true → f_1 (g x) = true) →
      (∀ (x y : aT), f_1 x = true → f_1 y = true → f_4 (f x) (f y) = f_3 x y) →
        ∀ (x : aT) (y : rT), f_1 x = true → f_2 y = true → f_4 (f x) y = f_3 x (g y)；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.monoLR_in.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.monoLR_in.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.monoRL_in

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.monoRL_in.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_1169__c0) (rT : Type u_Corelib_ssr_ssrbool_1169__c1) (f : aT → rT) (g : rT → aT)
  (f_1 : aT → Bool) (f_2 : rT → Bool) (f_3 : aT → aT → Bool) (f_4 : rT → rT → Bool),
  (∀ (x : rT), f_2 x = true → f_1 (g x) = true → f (g x) = x) →
    (∀ (x : rT), f_2 x = true → f_1 (g x) = true) →
      (∀ (x y : aT), f_1 x = true → f_1 y = true → f_4 (f x) (f y) = f_3 x y) →
        ∀ (x : rT) (y : aT), f_2 x = true → f_1 y = true → f_4 x (f y) = f_3 (g x) y；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.monoRL_in.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.monoRL_in.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.monoW_in

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.monoW_in.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_1169__c0) (rT : Type u_Corelib_ssr_ssrbool_1169__c1) (f : aT → rT) (f_1 : aT → Bool)
  (f_2 : aT → aT → Bool) (f_3 : rT → rT → Bool),
  (∀ (x y : aT), f_1 x = true → f_1 y = true → f_3 (f x) (f y) = f_2 x y) →
    ∀ (x y : aT), f_1 x = true → f_1 y = true → f_2 x y = true → f_3 (f x) (f y) = true；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.monoW_in.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.monoW_in.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.mono_sym_in

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.mono_sym_in.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_2262) (rT : Type u_Corelib_ssr_ssrbool_2263) (f : aT → aT → Bool)
  (f_1 : rT → rT → Bool) (f_2 : aT → rT) (f_3 : aT → Bool),
  (∀ (x y : aT), f_3 x = true → f_3 y = true → f_1 (f_2 x) (f_2 y) = f x y) →
    ∀ (x y : aT), f_3 x = true → f_3 y = true → f_1 (f_2 y) (f_2 x) = f y x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.mono_sym_in.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.mono_sym_in.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.mono_sym_in11

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.mono_sym_in11.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_2262) (rT : Type u_Corelib_ssr_ssrbool_2263) (f : aT → aT → Bool)
  (f_1 : rT → rT → Bool) (f_2 : aT → rT) (f_3 f_4 : aT → Bool),
  (∀ (x y : aT), f_3 x = true → f_4 y = true → f_1 (f_2 x) (f_2 y) = f x y) →
    ∀ (x y : aT), f_4 x = true → f_3 y = true → f_1 (f_2 y) (f_2 x) = f y x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.mono_sym_in11.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.mono_sym_in11.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.ocan_in_comp

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.ocan_in_comp.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_ssr_ssrbool_2051) (B : Type u_Corelib_ssr_ssrbool_2052) (C : Type u_Corelib_ssr_ssrbool_2053)
  (f : B → Bool) (f_1 : C → Bool) (f_2 : B → Option (PLift A)) (f_3 : C → Option (PLift B)) (f' : A → B) (h' : B → C),
  (∀ (x : C), f_1 x = true → Option.any (fun a => f a.down) (f_3 x) = true) →
    (∀ (x : B), f x = true → ((f_2 x).elim x fun a => f' a.down) = x) →
      (∀ (x : C), f_1 x = true → ((f_3 x).elim x fun a => h' a.down) = x) →
        ∀ (x : C), f_1 x = true → (((f_3 x).bind fun a => f_2 a.down).elim x fun a => h' (f' a.down)) = x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.ocan_in_comp.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.ocan_in_comp.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.on1S

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on1S.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (f : T2 → Bool) (f_1 : T1 → T2)
  (Q1 : (T1 → T2) → T1 → Prop),
  (∀ (x : T1), f (f_1 x) = true) → (∀ (x : T1), f (f_1 x) = true → Q1 f_1 x) → ∀ (x : T1), Q1 f_1 x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.on1S.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on1S.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.on1S_in

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on1S_in.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (f : T1 → Bool)
  (f_1 : T2 → Bool) (f_2 : T1 → T2) (Q1 : (T1 → T2) → T1 → Prop),
  (∀ (x : T1), f x = true → f_1 (f_2 x) = true) →
    (∀ (x : T1), f x = true → f_1 (f_2 x) = true → Q1 f_2 x) → ∀ (x : T1), f x = true → Q1 f_2 x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.on1S_in.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on1S_in.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.on1T

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on1T.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (f : T1 → T2)
  (Q1 : (T1 → T2) → T1 → Prop), (∀ (x : T1), true = true → Q1 f x) → ∀ (x : T1), Q1 f x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.on1T.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on1T.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.on1W

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on1W.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (f : T2 → Bool) (f_1 : T1 → T2)
  (Q1 : (T1 → T2) → T1 → Prop), (∀ (x : T1), Q1 f_1 x) → ∀ (x : T1), f (f_1 x) = true → Q1 f_1 x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.on1W.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on1W.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.on1W_in

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on1W_in.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (f : T1 → Bool)
  (f_1 : T2 → Bool) (f_2 : T1 → T2) (Q1 : (T1 → T2) → T1 → Prop),
  (∀ (x : T1), f x = true → Q1 f_2 x) → ∀ (x : T1), f x = true → f_1 (f_2 x) = true → Q1 f_2 x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.on1W_in.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on1W_in.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.on1lS

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on1lS.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1)
  (T3 : Type u_Corelib_ssr_ssrbool_1169__c2) (f : T2 → Bool) (f_1 : T1 → T2) (h : T3)
  (Q1l : (T1 → T2) → T3 → T1 → Prop),
  (∀ (x : T1), f (f_1 x) = true) → (∀ (x : T1), f (f_1 x) = true → Q1l f_1 h x) → ∀ (x : T1), Q1l f_1 h x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.on1lS.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on1lS.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.on1lS_in

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on1lS_in.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1)
  (T3 : Type u_Corelib_ssr_ssrbool_1169__c2) (f : T1 → Bool) (f_1 : T2 → Bool) (f_2 : T1 → T2) (h : T3)
  (Q1l : (T1 → T2) → T3 → T1 → Prop),
  (∀ (x : T1), f x = true → f_1 (f_2 x) = true) →
    (∀ (x : T1), f x = true → f_1 (f_2 x) = true → Q1l f_2 h x) → ∀ (x : T1), f x = true → Q1l f_2 h x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.on1lS_in.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on1lS_in.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.on1lT

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on1lT.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1)
  (T3 : Type u_Corelib_ssr_ssrbool_1169__c2) (f : T1 → T2) (h : T3) (Q1l : (T1 → T2) → T3 → T1 → Prop),
  (∀ (x : T1), true = true → Q1l f h x) → ∀ (x : T1), Q1l f h x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.on1lT.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on1lT.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.on1lW

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on1lW.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1)
  (T3 : Type u_Corelib_ssr_ssrbool_1169__c2) (f : T2 → Bool) (f_1 : T1 → T2) (h : T3)
  (Q1l : (T1 → T2) → T3 → T1 → Prop), (∀ (x : T1), Q1l f_1 h x) → ∀ (x : T1), f (f_1 x) = true → Q1l f_1 h x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.on1lW.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on1lW.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.on1lW_in

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on1lW_in.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1)
  (T3 : Type u_Corelib_ssr_ssrbool_1169__c2) (f : T1 → Bool) (f_1 : T2 → Bool) (f_2 : T1 → T2) (h : T3)
  (Q1l : (T1 → T2) → T3 → T1 → Prop),
  (∀ (x : T1), f x = true → Q1l f_2 h x) → ∀ (x : T1), f x = true → f_1 (f_2 x) = true → Q1l f_2 h x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.on1lW_in.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on1lW_in.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.on2S

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on2S.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (f : T2 → Bool) (f_1 : T1 → T2)
  (Q2 : (T1 → T2) → T1 → T1 → Prop),
  (∀ (x : T1), f (f_1 x) = true) →
    (∀ (x y : T1), f (f_1 x) = true → f (f_1 y) = true → Q2 f_1 x y) → ∀ (x y : T1), Q2 f_1 x y；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.on2S.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on2S.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.on2S_in

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on2S_in.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (f : T1 → Bool)
  (f_1 : T2 → Bool) (f_2 : T1 → T2) (Q2 : (T1 → T2) → T1 → T1 → Prop),
  (∀ (x : T1), f x = true → f_1 (f_2 x) = true) →
    (∀ (x y : T1), f x = true → f y = true → f_1 (f_2 x) = true → f_1 (f_2 y) = true → Q2 f_2 x y) →
      ∀ (x y : T1), f x = true → f y = true → Q2 f_2 x y；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.on2S_in.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on2S_in.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.on2T

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on2T.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (f : T1 → T2)
  (Q2 : (T1 → T2) → T1 → T1 → Prop), (∀ (x y : T1), true = true → true = true → Q2 f x y) → ∀ (x y : T1), Q2 f x y；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.on2T.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on2T.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.on2W

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on2W.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (f : T2 → Bool) (f_1 : T1 → T2)
  (Q2 : (T1 → T2) → T1 → T1 → Prop),
  (∀ (x y : T1), Q2 f_1 x y) → ∀ (x y : T1), f (f_1 x) = true → f (f_1 y) = true → Q2 f_1 x y；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.on2W.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on2W.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.on2W_in

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on2W_in.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (f : T1 → Bool)
  (f_1 : T2 → Bool) (f_2 : T1 → T2) (Q2 : (T1 → T2) → T1 → T1 → Prop),
  (∀ (x y : T1), f x = true → f y = true → Q2 f_2 x y) →
    ∀ (x y : T1), f x = true → f y = true → f_1 (f_2 x) = true → f_1 (f_2 y) = true → Q2 f_2 x y；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.on2W_in.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on2W_in.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.onS_can

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.onS_can.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_1169__c0) (rT : Type u_Corelib_ssr_ssrbool_1169__c1) (f : aT → Bool) (f_1 : aT → rT)
  (g : rT → aT), (∀ (x : rT), f (g x) = true) → (∀ (x : rT), f (g x) = true → f_1 (g x) = x) → ∀ (x : rT), f_1 (g x) = x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.onS_can.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.onS_can.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.onS_can_in

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.onS_can_in.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_1169__c0) (rT : Type u_Corelib_ssr_ssrbool_1169__c1) (f : aT → Bool)
  (f_1 : rT → Bool) (f_2 : aT → rT) (g : rT → aT),
  (∀ (x : rT), f_1 x = true → f (g x) = true) →
    (∀ (x : rT), f_1 x = true → f (g x) = true → f_2 (g x) = x) → ∀ (x : rT), f_1 x = true → f_2 (g x) = x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.onS_can_in.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.onS_can_in.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.onT_bij

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.onT_bij.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (f : T1 → T2),
  (∃ x, (∀ (x_1 : T1), true = true → x (f x_1) = x_1) ∧ ∀ (x_1 : T2), true = true → f (x x_1) = x_1) →
    ∃ g, (∀ (x : T1), g (f x) = x) ∧ ∀ (y : T2), f (g y) = y；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.onT_bij.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.onT_bij.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.onW_bij

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.onW_bij.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (f : T2 → Bool) (f_1 : T1 → T2),
  (∃ g, (∀ (x : T1), g (f_1 x) = x) ∧ ∀ (y : T2), f_1 (g y) = y) →
    ∃ x, (∀ (x_1 : T1), f (f_1 x_1) = true → x (f_1 x_1) = x_1) ∧ ∀ (x_1 : T2), f x_1 = true → f_1 (x x_1) = x_1；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.onW_bij.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.onW_bij.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.onW_can

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.onW_can.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_1169__c0) (rT : Type u_Corelib_ssr_ssrbool_1169__c1) (f : aT → Bool) (f_1 : aT → rT)
  (g : rT → aT), (∀ (x : rT), f_1 (g x) = x) → ∀ (x : rT), f (g x) = true → f_1 (g x) = x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.onW_can.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.onW_can.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.onW_can_in

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.onW_can_in.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_1169__c0) (rT : Type u_Corelib_ssr_ssrbool_1169__c1) (f : aT → Bool)
  (f_1 : rT → Bool) (f_2 : aT → rT) (g : rT → aT),
  (∀ (x : rT), f_1 x = true → f_2 (g x) = x) → ∀ (x : rT), f_1 x = true → f (g x) = true → f_2 (g x) = x；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.onW_can_in.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.onW_can_in.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.on_can_inj

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on_can_inj.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (f : T2 → Bool) (f_1 : T1 → T2)
  (g : T2 → T1),
  (∀ (x : T1), f (f_1 x) = true → g (f_1 x) = x) →
    ∀ (x y : T1), f (f_1 x) = true → f (f_1 y) = true → f_1 x = f_1 y → x = y；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.on_can_inj.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.on_can_inj.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.pcan_in_comp

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.pcan_in_comp.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_ssr_ssrbool_2042) (B : Type u_Corelib_ssr_ssrbool_2043) (C : Type u_Corelib_ssr_ssrbool_2044)
  (f : B → Bool) (f_1 : C → Bool) (f_2 : B → A) (h : C → B) (f_3 : A → Option (PLift B)) (f_4 : B → Option (PLift C)),
  (∀ (x : C), f_1 x = true → f (h x) = true) →
    (∀ (x : B), f x = true → f_3 (f_2 x) = some { down := x }) →
      (∀ (x : C), f_1 x = true → f_4 (h x) = some { down := x }) →
        ∀ (x : C), f_1 x = true → ((f_3 (f_2 (h x))).bind fun a => f_4 a.down) = some { down := x }；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.pcan_in_comp.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.pcan_in_comp.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.pcan_in_inj

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.pcan_in_inj.statement.correspondence

目标：native statement: ∀ (rT : Type u_Corelib_ssr_ssrbool_2009) (aT : Type u_Corelib_ssr_ssrbool_2010) (f : aT → Bool) (f_1 : aT → rT)
  (f_2 : rT → Option (PLift aT)),
  (∀ (x : aT), f x = true → f_2 (f_1 x) = some { down := x }) →
    ∀ (x y : aT), f x = true → f y = true → f_1 x = f_1 y → x = y；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.pcan_in_inj.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.pcan_in_inj.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.sub_in_bij

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.sub_in_bij.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (f : T1 → Bool) (f_1 : T1 → T2)
  (f_2 : T1 → Bool),
  (∀ (x : T1), f x = true → f_2 x = true) →
    (∃ x, (∀ (x_1 : T1), f_2 x_1 = true → x (f_1 x_1) = x_1) ∧ ∀ (x_1 : T2), f_2 (x x_1) = true → f_1 (x x_1) = x_1) →
      ∃ x, (∀ (x_1 : T1), f x_1 = true → x (f_1 x_1) = x_1) ∧ ∀ (x_1 : T2), f (x x_1) = true → f_1 (x x_1) = x_1；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.sub_in_bij.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.sub_in_bij.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.subon_bij

NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.subon_bij.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (f : T2 → Bool) (f_1 : T1 → T2)
  (f_2 : T2 → Bool),
  (∀ (x : T2), f x = true → f_2 x = true) →
    (∃ x, (∀ (x_1 : T1), f_2 (f_1 x_1) = true → x (f_1 x_1) = x_1) ∧ ∀ (x_1 : T2), f_2 x_1 = true → f_1 (x x_1) = x_1) →
      ∃ x, (∀ (x_1 : T1), f (f_1 x_1) = true → x (f_1 x_1) = x_1) ∧ ∀ (x_1 : T2), f x_1 = true → f_1 (x x_1) = x_1；范围：all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved

```lean
RocqPending.Corelib.ssr.ssrbool.subon_bij.statement ↔
  NativeBridge.Incremental.SSRBoolClosedStatements.RocqPending.Corelib.ssr.ssrbool.subon_bij.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.app_predE

NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.app_predE.statement.correspondence

目标：native statement: ∀ (T : Type u_Corelib_ssr_ssrbool_1253) (x : T) (f : T → Bool) (x_1 : Unit), f x = f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.app_predE.statement ↔
  NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.app_predE.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.classic_EM

NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.classic_EM.statement.correspondence

目标：native statement: ∀ (P : Prop), ¬¬Nonempty (Decidable P)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.classic_EM.statement ↔
  NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.classic_EM.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.classic_pick

NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.classic_pick.statement.correspondence

目标：native statement: ∀ (T : Sort u_Corelib_ssr_ssrbool_458) (P : T → Prop), ¬¬((∃ x, P x) ∨ Nonempty (∀ (x : T), ¬P x))；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.classic_pick.statement ↔
  NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.classic_pick.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.classic_sigW

NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.classic_sigW.statement.correspondence

目标：native statement: ∀ (T : Sort u_Corelib_ssr_ssrbool_498) (P : T → Prop), ¬¬Nonempty (∃ x, P x) ↔ ¬¬∃ x, P x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.classic_sigW.statement ↔
  NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.classic_sigW.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.inE

NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.inE.statement.correspondence

目标：native statement: ∀ (T : Type u_Corelib_ssr_ssrbool_1253),
  ((∀ (x : T) (f : T → Bool) (x_1 : Unit), f x = f x) ∧ ∀ (x : T) (f : T → Bool) (x_1 : Unit), f x = f x) ∧
    ∀ (f : T → Bool) (x : T), f x = f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.inE.statement ↔
  NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.inE.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.in_applicative

NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.in_applicative.statement.correspondence

目标：native statement: ∀ (T : Type u_Corelib_ssr_ssrbool_1253) (x : T) (f : T → Bool) (x_1 : Unit), f x = f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.in_applicative.statement ↔
  NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.in_applicative.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.in_collective

NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.in_collective.statement.correspondence

目标：native statement: ∀ (T : Type u_Corelib_ssr_ssrbool_1253) (x : T) (f : T → Bool) (x_1 : Unit), f x = f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.in_collective.statement ↔
  NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.in_collective.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.in_simpl

NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.in_simpl.statement.correspondence

目标：native statement: ∀ (T : Type u_Corelib_ssr_ssrbool_1253) (x : T) (f : T → Bool) (x_1 : Unit), f x = f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.in_simpl.statement ↔
  NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.in_simpl.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.is_true_locked_true

NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.is_true_locked_true.statement.correspondence

目标：native statement: true = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.is_true_locked_true.statement ↔
  NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.is_true_locked_true.statement.native
```

公理闭包：propext

## Corelib.ssr.ssrbool.keyed_predE

NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.keyed_predE.statement.correspondence

目标：native statement: ∀ (T : Type u_Corelib_ssr_ssrbool_1345) (f : T → Bool), True → ∀ (x : Unit) (x : T), f x = f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.keyed_predE.statement ↔
  NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.keyed_predE.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.keyed_qualifier_suproof

NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.keyed_qualifier_suproof.statement.correspondence

目标：native statement: ∀ (T : Type u_Corelib_ssr_ssrbool_1348) (x : Nat) (x : T → Bool), True → ∀ (x_2 : Unit) (x_3 : T), x x_3 = x x_3；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.keyed_qualifier_suproof.statement ↔
  NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.keyed_qualifier_suproof.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.memE

NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.memE.statement.correspondence

目标：native statement: ∀ (T : Type u_Corelib_ssr_ssrbool_1253) (x : T → Bool) (x_1 : T), x x_1 = x x_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.memE.statement ↔
  NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.memE.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.mem_mem

NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.mem_mem.statement.correspondence

目标：native statement: ∀ (T : Type u_Corelib_ssr_ssrbool_1253) (x : T → Bool), (x = x ∧ x = x) ∧ x = x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.mem_mem.statement ↔
  NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.mem_mem.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.mem_simpl

NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.mem_simpl.statement.correspondence

目标：native statement: ∀ (T : Type u_Corelib_ssr_ssrbool_1253) (x : T → Bool) (x_1 : T), x x_1 = x x_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.mem_simpl.statement ↔
  NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.mem_simpl.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.mem_topred

NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.mem_topred.statement.correspondence

目标：native statement: ∀ (T : Type u_Corelib_ssr_ssrbool_1253) (x : NativeBridge.Incremental.SSRBoolData.nativePredType T) (pp : x.fst),
  x.snd pp = x.snd pp；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.mem_topred.statement ↔
  NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.mem_topred.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.qualifE

NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.qualifE.statement.correspondence

目标：native statement: ∀ (x : Nat) (T : Type u_Corelib_ssr_ssrbool_1343) (f : T → Bool) (x : T), f x = f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.qualifE.statement ↔
  NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.qualifE.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.sub_in1

NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.sub_in1.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169) (x x_1 : T1 → Bool) (P1 : T1 → Prop),
  (∀ (x_2 : T1), x x_2 = true → x_1 x_2 = true) →
    True → (∀ (x : T1), x_1 x = true → P1 x) → ∀ (x_2 : T1), x x_2 = true → P1 x_2；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.sub_in1.statement ↔
  NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.sub_in1.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.sub_in11

NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.sub_in11.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (x x_1 : T1 → Bool)
  (x_2 x_3 : T2 → Bool) (P2 : T1 → T2 → Prop),
  (∀ (x_4 : T1), x x_4 = true → x_1 x_4 = true) →
    (∀ (x : T2), x_2 x = true → x_3 x = true) →
      True →
        (∀ (x : T1) (y : T2), x_1 x = true → x_3 y = true → P2 x y) →
          ∀ (x_4 : T1) (y : T2), x x_4 = true → x_2 y = true → P2 x_4 y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.sub_in11.statement ↔
  NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.sub_in11.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.sub_in111

NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.sub_in111.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1)
  (T3 : Type u_Corelib_ssr_ssrbool_1169__c2) (x x_1 : T1 → Bool) (x_2 x_3 : T2 → Bool) (x_4 x_5 : T3 → Bool)
  (P3 : T1 → T2 → T3 → Prop),
  (∀ (x_6 : T1), x x_6 = true → x_1 x_6 = true) →
    (∀ (x : T2), x_2 x = true → x_3 x = true) →
      (∀ (x : T3), x_4 x = true → x_5 x = true) →
        True →
          (∀ (x : T1) (y : T2) (z : T3), x_1 x = true → x_3 y = true → x_5 z = true → P3 x y z) →
            ∀ (x_6 : T1) (y : T2) (z : T3), x x_6 = true → x_2 y = true → x_4 z = true → P3 x_6 y z；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.sub_in111.statement ↔
  NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.sub_in111.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.sub_in12

NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.sub_in12.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_2134) (T : Type u_Corelib_ssr_ssrbool_2135) (x x_1 : T1 → Bool) (x_2 x_3 : T → Bool)
  (P : T1 → T → T → Prop),
  (∀ (x_4 : T1), x x_4 = true → x_1 x_4 = true) →
    (∀ (x : T), x_2 x = true → x_3 x = true) →
      True →
        (∀ (x : T1) (y z : T), x_1 x = true → x_3 y = true → x_3 z = true → P x y z) →
          ∀ (x_4 : T1) (y z : T), x x_4 = true → x_2 y = true → x_2 z = true → P x_4 y z；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.sub_in12.statement ↔
  NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.sub_in12.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.sub_in2

NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.sub_in2.statement.correspondence

目标：native statement: ∀ (T : Type u_Corelib_ssr_ssrbool_2112) (x x_1 : T → Bool) (P : T → T → Prop),
  (∀ (x_2 : T), x x_2 = true → x_1 x_2 = true) →
    True → (∀ (x y : T), x_1 x = true → x_1 y = true → P x y) → ∀ (x_2 y : T), x x_2 = true → x y = true → P x_2 y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.sub_in2.statement ↔
  NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.sub_in2.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.sub_in21

NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.sub_in21.statement.correspondence

目标：native statement: ∀ (T : Type u_Corelib_ssr_ssrbool_2150) (T3 : Type u_Corelib_ssr_ssrbool_2151) (x x_1 : T → Bool) (x_2 x_3 : T3 → Bool)
  (P : T → T → T3 → Prop),
  (∀ (x_4 : T), x x_4 = true → x_1 x_4 = true) →
    (∀ (x : T3), x_2 x = true → x_3 x = true) →
      True →
        (∀ (x y : T) (z : T3), x_1 x = true → x_1 y = true → x_3 z = true → P x y z) →
          ∀ (x_4 y : T) (z : T3), x x_4 = true → x y = true → x_2 z = true → P x_4 y z；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.sub_in21.statement ↔
  NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.sub_in21.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.sub_in3

NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.sub_in3.statement.correspondence

目标：native statement: ∀ (T : Type u_Corelib_ssr_ssrbool_2121) (x x_1 : T → Bool) (P : T → T → T → Prop),
  (∀ (x_2 : T), x x_2 = true → x_1 x_2 = true) →
    True →
      (∀ (x y z : T), x_1 x = true → x_1 y = true → x_1 z = true → P x y z) →
        ∀ (x_2 y z : T), x x_2 = true → x y = true → x z = true → P x_2 y z；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.sub_in3.statement ↔
  NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.sub_in3.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.sub_refl

NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.sub_refl.statement.correspondence

目标：native statement: ∀ (T : Type u_Corelib_ssr_ssrbool_1226) (x : T → Bool) (x_1 : T), x x_1 = true → x x_1 = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.sub_refl.statement ↔
  NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.sub_refl.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.subon1

NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.subon1.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (x x_1 : T2 → Bool)
  (f : T1 → T2) (Q1 : (T1 → T2) → T1 → Prop),
  (∀ (x_2 : T2), x x_2 = true → x_1 x_2 = true) →
    True → True → (∀ (x : T1), x_1 (f x) = true → Q1 f x) → ∀ (x_2 : T1), x (f x_2) = true → Q1 f x_2；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.subon1.statement ↔
  NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.subon1.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.subon1l

NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.subon1l.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1)
  (T3 : Type u_Corelib_ssr_ssrbool_1169__c2) (x x_1 : T2 → Bool) (f : T1 → T2) (h : T3)
  (Q1l : (T1 → T2) → T3 → T1 → Prop),
  (∀ (x_2 : T2), x x_2 = true → x_1 x_2 = true) →
    True → True → (∀ (x : T1), x_1 (f x) = true → Q1l f h x) → ∀ (x_2 : T1), x (f x_2) = true → Q1l f h x_2；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.subon1l.statement ↔
  NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.subon1l.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.subon2

NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.subon2.statement.correspondence

目标：native statement: ∀ (T1 : Type u_Corelib_ssr_ssrbool_1169__c0) (T2 : Type u_Corelib_ssr_ssrbool_1169__c1) (x x_1 : T2 → Bool)
  (f : T1 → T2) (Q2 : (T1 → T2) → T1 → T1 → Prop),
  (∀ (x_2 : T2), x x_2 = true → x_1 x_2 = true) →
    True →
      True →
        (∀ (x y : T1), x_1 (f x) = true → x_1 (f y) = true → Q2 f x y) →
          ∀ (x_2 y : T1), x (f x_2) = true → x (f y) = true → Q2 f x_2 y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.subon2.statement ↔
  NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.subon2.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.topredE

NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.topredE.statement.correspondence

目标：native statement: ∀ (T : Type u_Corelib_ssr_ssrbool_1253) (x : NativeBridge.Incremental.SSRBoolData.nativePredType T) (x_1 : T)
  (pp : x.fst), x.snd pp x_1 = x.snd pp x_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.topredE.statement ↔
  NativeBridge.Incremental.SSRBoolRemainingStatements.Rocq.Corelib.ssr.ssrbool.topredE.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.addIb

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.addIb.statement.correspondence

目标：native statement: ∀ (b b_1 b_2 : Bool), (b_1 ^^ b) = (b_2 ^^ b) → b_1 = b_2；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.addIb.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.addIb.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.and3_ind

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.and3_ind.statement.correspondence

目标：native statement: ∀ (P1 P2 P3 P : Prop), (P1 → P2 → P3 → P) → P1 ∧ P2 ∧ P3 → P；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.and3_ind.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.and3_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.and3_sind

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.and3_sind.statement.correspondence

目标：native statement: ∀ (P1 P2 P3 P : Prop), (P1 → P2 → P3 → P) → P1 ∧ P2 ∧ P3 → P；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.and3_sind.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.and3_sind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.and4_ind

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.and4_ind.statement.correspondence

目标：native statement: ∀ (P1 P2 P3 P4 P : Prop), (P1 → P2 → P3 → P4 → P) → P1 ∧ P2 ∧ P3 ∧ P4 → P；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.and4_ind.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.and4_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.and4_sind

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.and4_sind.statement.correspondence

目标：native statement: ∀ (P1 P2 P3 P4 P : Prop), (P1 → P2 → P3 → P4 → P) → P1 ∧ P2 ∧ P3 ∧ P4 → P；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.and4_sind.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.and4_sind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.and5_ind

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.and5_ind.statement.correspondence

目标：native statement: ∀ (P1 P2 P3 P4 P5 P : Prop), (P1 → P2 → P3 → P4 → P5 → P) → P1 ∧ P2 ∧ P3 ∧ P4 ∧ P5 → P；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.and5_ind.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.and5_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.and5_sind

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.and5_sind.statement.correspondence

目标：native statement: ∀ (P1 P2 P3 P4 P5 P : Prop), (P1 → P2 → P3 → P4 → P5 → P) → P1 ∧ P2 ∧ P3 ∧ P4 ∧ P5 → P；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.and5_sind.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.and5_sind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.andb_addl

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.andb_addl.statement.correspondence

目标：native statement: ∀ (b b_1 b_2 : Bool), ((b ^^ b_1) && b_2) = (b && b_2 ^^ b_1 && b_2)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.andb_addl.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.andb_addl.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.andb_addr

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.andb_addr.statement.correspondence

目标：native statement: ∀ (b b_1 b_2 : Bool), (b && (b_1 ^^ b_2)) = (b && b_1 ^^ b && b_2)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.andb_addr.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.andb_addr.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.andb_orl

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.andb_orl.statement.correspondence

目标：native statement: ∀ (b b_1 b_2 : Bool), ((b || b_1) && b_2) = (b && b_2 || b_1 && b_2)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.andb_orl.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.andb_orl.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.andb_orr

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.andb_orr.statement.correspondence

目标：native statement: ∀ (b b_1 b_2 : Bool), (b && (b_1 || b_2)) = (b && b_1 || b && b_2)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.andb_orr.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.andb_orr.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.can_mono

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.can_mono.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_2175) (rT : Type u_Corelib_ssr_ssrbool_2176) (f : aT → rT) (g : rT → aT)
  (f_1 : aT → aT → Bool) (f_2 : rT → rT → Bool),
  (∀ (x : rT), f (g x) = x) → (∀ (x y : aT), f_2 (f x) (f y) = f_1 x y) → ∀ (x y : rT), f_1 (g x) (g y) = f_2 x y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.can_mono.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.can_mono.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.classicP

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.classicP.statement.correspondence

目标：native statement: ∀ (P : Prop), ¬¬Nonempty P ↔ ¬¬P；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.classicP.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.classicP.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.classicW

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.classicW.statement.correspondence

目标：native statement: ∀ (P : Sort u_Corelib_ssr_ssrbool_432) (a : P), ¬¬Nonempty P；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.classicW.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.classicW.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.classic_bind

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.classic_bind.statement.correspondence

目标：native statement: ∀ (P : Sort u_Corelib_ssr_ssrbool_435) (Q : Sort u_Corelib_ssr_ssrbool_436),
  (∀ (a : P), ¬¬Nonempty Q) → ¬¬Nonempty P → ¬¬Nonempty Q；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.classic_bind.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.classic_bind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.classic_ex

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.classic_ex.statement.correspondence

目标：native statement: ∀ (T : Sort u_Corelib_ssr_ssrbool_512) (P : T → Prop), (¬∀ (x : T), ¬P x) → ¬¬Nonempty (∃ x, P x)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.classic_ex.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.classic_ex.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.classic_imply

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.classic_imply.statement.correspondence

目标：native statement: ∀ (P : Type u_Corelib_ssr_ssrbool_481) (Q : Type u_Corelib_ssr_ssrbool_482),
  (∀ (a : P), ¬¬Nonempty Q) → ¬¬Nonempty (P → Q)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.classic_imply.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.classic_imply.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.equivalence_relP

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.equivalence_relP.statement.correspondence

目标：native statement: ∀ (T : Type u_Corelib_ssr_ssrbool_1473) (f : T → T → Bool),
  (∀ (x y z : T), f z z = true ∧ (f x y = true → f x z = f y z)) ↔
    (∀ (x : T), f x x = true) ∧ ∀ (x y : T), f x y = true → ∀ (x_1 : T), f x x_1 = f y x_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.equivalence_relP.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.equivalence_relP.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.forE

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.forE.statement.correspondence

目标：native statement: ∀ (T1 : Sort u_Corelib_ssr_ssrbool_1531) (x : T1) (P : T1 → Prop), True → P x = P x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.forE.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.forE.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.homoLR

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.homoLR.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_2175) (rT : Type u_Corelib_ssr_ssrbool_2176) (f : aT → rT) (g : rT → aT)
  (f_1 : aT → aT → Bool) (f_2 : rT → rT → Bool),
  (∀ (x : rT), f (g x) = x) →
    (∀ (x y : aT), f_1 x y = true → f_2 (f x) (f y) = true) →
      ∀ (x : aT) (y : rT), f_1 x (g y) = true → f_2 (f x) y = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.homoLR.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.homoLR.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.homoRL

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.homoRL.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_2175) (rT : Type u_Corelib_ssr_ssrbool_2176) (f : aT → rT) (g : rT → aT)
  (f_1 : aT → aT → Bool) (f_2 : rT → rT → Bool),
  (∀ (x : rT), f (g x) = x) →
    (∀ (x y : aT), f_1 x y = true → f_2 (f x) (f y) = true) →
      ∀ (x : rT) (y : aT), f_1 (g x) y = true → f_2 x (f y) = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.homoRL.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.homoRL.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.homo_mono

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.homo_mono.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_2175) (rT : Type u_Corelib_ssr_ssrbool_2176) (f : aT → rT) (g : rT → aT)
  (f_1 : aT → aT → Bool) (f_2 : rT → rT → Bool),
  (∀ (x : rT), f (g x) = x) →
    (∀ (x y : aT), f_1 x y = true → f_2 (f x) (f y) = true) →
      (∀ (x y : rT), f_2 x y = true → f_1 (g x) (g y) = true) → ∀ (x y : rT), f_1 (g x) (g y) = f_2 x y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.homo_mono.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.homo_mono.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.homo_sym

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.homo_sym.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_2262) (rT : Type u_Corelib_ssr_ssrbool_2263) (f : aT → aT → Bool)
  (f_1 : rT → rT → Bool) (f_2 : aT → rT),
  (∀ (x y : aT), f x y = true → f_1 (f_2 x) (f_2 y) = true) → ∀ (x y : aT), f y x = true → f_1 (f_2 y) (f_2 x) = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.homo_sym.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.homo_sym.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.impliesPn

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.impliesPn.statement.correspondence

目标：native statement: ∀ (P Q : Prop), (P → Q) → ¬Q → ¬P；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.impliesPn.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.impliesPn.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.inPhantom

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.inPhantom.statement.correspondence

目标：native statement: ∀ (p : Prop), True；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.inPhantom.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.inPhantom.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.mono2W

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.mono2W.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_2175) (rT : Type u_Corelib_ssr_ssrbool_2176) (f : aT → rT) (f_1 : aT → aT → Bool)
  (f_2 : rT → rT → Bool),
  (∀ (x y : aT), f_2 (f x) (f y) = f_1 x y) → ∀ (x y : aT), f_1 x y = true → f_2 (f x) (f y) = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.mono2W.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.mono2W.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.monoLR

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.monoLR.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_2175) (rT : Type u_Corelib_ssr_ssrbool_2176) (f : aT → rT) (g : rT → aT)
  (f_1 : aT → aT → Bool) (f_2 : rT → rT → Bool),
  (∀ (x : rT), f (g x) = x) → (∀ (x y : aT), f_2 (f x) (f y) = f_1 x y) → ∀ (x : aT) (y : rT), f_2 (f x) y = f_1 x (g y)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.monoLR.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.monoLR.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.monoRL

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.monoRL.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_2175) (rT : Type u_Corelib_ssr_ssrbool_2176) (f : aT → rT) (g : rT → aT)
  (f_1 : aT → aT → Bool) (f_2 : rT → rT → Bool),
  (∀ (x : rT), f (g x) = x) → (∀ (x y : aT), f_2 (f x) (f y) = f_1 x y) → ∀ (x : rT) (y : aT), f_2 x (f y) = f_1 (g x) y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.monoRL.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.monoRL.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.monoW

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.monoW.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_2175) (rT : Type u_Corelib_ssr_ssrbool_2176) (f : aT → rT) (f_1 : aT → Bool)
  (f_2 : rT → Bool), (∀ (x : aT), f_2 (f x) = f_1 x) → ∀ (x : aT), f_1 x = true → f_2 (f x) = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.monoW.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.monoW.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.mono_sym

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.mono_sym.statement.correspondence

目标：native statement: ∀ (aT : Type u_Corelib_ssr_ssrbool_2262) (rT : Type u_Corelib_ssr_ssrbool_2263) (f : aT → aT → Bool)
  (f_1 : rT → rT → Bool) (f_2 : aT → rT),
  (∀ (x y : aT), f_1 (f_2 x) (f_2 y) = f x y) → ∀ (x y : aT), f_1 (f_2 y) (f_2 x) = f y x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.mono_sym.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.mono_sym.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.onPhantom

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.onPhantom.statement.correspondence

目标：native statement: ∀ (T : Sort u_Corelib_ssr_ssrbool_1694) (P : T → Prop) (x : T), True；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.onPhantom.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.onPhantom.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.or3_ind

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.or3_ind.statement.correspondence

目标：native statement: ∀ (P1 P2 P3 P : Prop), (P1 → P) → (P2 → P) → (P3 → P) → P1 ∨ P2 ∨ P3 → P；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.or3_ind.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.or3_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.or3_sind

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.or3_sind.statement.correspondence

目标：native statement: ∀ (P1 P2 P3 P : Prop), (P1 → P) → (P2 → P) → (P3 → P) → P1 ∨ P2 ∨ P3 → P；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.or3_sind.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.or3_sind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.or4_ind

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.or4_ind.statement.correspondence

目标：native statement: ∀ (P1 P2 P3 P4 P : Prop), (P1 → P) → (P2 → P) → (P3 → P) → (P4 → P) → P1 ∨ P2 ∨ P3 ∨ P4 → P；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.or4_ind.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.or4_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.or4_sind

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.or4_sind.statement.correspondence

目标：native statement: ∀ (P1 P2 P3 P4 P : Prop), (P1 → P) → (P2 → P) → (P3 → P) → (P4 → P) → P1 ∨ P2 ∨ P3 ∨ P4 → P；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.or4_sind.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.or4_sind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.orb_andl

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.orb_andl.statement.correspondence

目标：native statement: ∀ (b b_1 b_2 : Bool), (b && b_1 || b_2) = ((b || b_2) && (b_1 || b_2))；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.orb_andl.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.orb_andl.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.orb_andr

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.orb_andr.statement.correspondence

目标：native statement: ∀ (b b_1 b_2 : Bool), (b || b_1 && b_2) = ((b || b_1) && (b || b_2))；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.orb_andr.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.orb_andr.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.pair_andP

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.pair_andP.statement.correspondence

目标：native statement: ∀ (P Q : Prop), P ∧ Q ↔ P ∧ Q；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.pair_andP.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.pair_andP.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.simpl_predE

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.simpl_predE.statement.correspondence

目标：native statement: ∀ (T : Type u_Corelib_ssr_ssrbool_1253) (f : T → Bool) (x : T), f x = f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.simpl_predE.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.simpl_predE.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.subrelUl

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.subrelUl.statement.correspondence

目标：native statement: ∀ (T : Type u_Corelib_ssr_ssrbool_1199) (f f_1 : T → T → Bool) (x y : T), f x y = true → (f x y || f_1 x y) = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.subrelUl.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.subrelUl.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.subrelUr

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.subrelUr.statement.correspondence

目标：native statement: ∀ (T : Type u_Corelib_ssr_ssrbool_1201) (f f_1 : T → T → Bool) (x y : T), f_1 x y = true → (f x y || f_1 x y) = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.subrelUr.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.subrelUr.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.sym_left_transitive

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.sym_left_transitive.statement.correspondence

目标：native statement: ∀ (T : Type u_Corelib_ssr_ssrbool_1473) (f : T → T → Bool),
  (∀ (x y : T), f x y = f y x) →
    (∀ (y x z : T), f x y = true → f y z = true → f x z = true) →
      ∀ (x y : T), f x y = true → ∀ (x_1 : T), f x x_1 = f y x_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.sym_left_transitive.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.sym_left_transitive.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.sym_right_transitive

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.sym_right_transitive.statement.correspondence

目标：native statement: ∀ (T : Type u_Corelib_ssr_ssrbool_1473) (f : T → T → Bool),
  (∀ (x y : T), f x y = f y x) →
    (∀ (y x z : T), f x y = true → f y z = true → f x z = true) →
      ∀ (x y : T), f x y = true → ∀ (x_1 : T), f x_1 x = f x_1 y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.sym_right_transitive.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.sym_right_transitive.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.symmetric_from_pre

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.symmetric_from_pre.statement.correspondence

目标：native statement: ∀ (T : Type u_Corelib_ssr_ssrbool_1105) (f : T → T → Bool),
  (∀ (x y : T), f x y = true → f y x = true) → ∀ (x y : T), f x y = f y x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.symmetric_from_pre.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.symmetric_from_pre.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.unfold_in

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.unfold_in.statement.correspondence

目标：native statement: ∀ (T : Type u_Corelib_ssr_ssrbool_1253) (x : T) (f : T → Bool), f x = f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.unfold_in.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.unfold_in.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.unlessP

NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.unlessP.statement.correspondence

目标：native statement: ∀ (C P : Prop), Nonempty C ∨ Nonempty P ↔ C ∨ P；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.unlessP.statement ↔
  NativeBridge.Incremental.SSRBoolExtendedStatements.Rocq.Corelib.ssr.ssrbool.unlessP.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.Some_inj

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.Some_inj.statement.correspondence

目标：native statement: ∀ (x : Bool × Type u_Corelib_ssr_ssreflect_rw_178) (x1 x2 : x.snd), some { down := x1 } = some { down := x2 } → x1 = x2；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.Some_inj.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.Some_inj.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.bij_can_bij

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.bij_can_bij.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_ssr_ssrfun_582) (B : Type u_Corelib_ssr_ssrfun_583) (f : B → A),
  (∃ g, (∀ (x : B), g (f x) = x) ∧ ∀ (y : A), f (g y) = y) →
    ∀ (f' : A → B), (∀ (x : B), f' (f x) = x) → ∃ g, (∀ (x : A), g (f' x) = x) ∧ ∀ (y : B), f' (g y) = y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.bij_can_bij.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.bij_can_bij.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.bij_can_eq

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.bij_can_eq.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_ssr_ssrfun_571) (B : Type u_Corelib_ssr_ssrfun_572) (f : B → A),
  (∃ g, (∀ (x : B), g (f x) = x) ∧ ∀ (y : A), f (g y) = y) →
    ∀ (f' f'' : A → B), (∀ (x : B), f' (f x) = x) → (∀ (x : B), f'' (f x) = x) → ∀ (x : A), f' x = f'' x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.bij_can_eq.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.bij_can_eq.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.bij_can_sym

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.bij_can_sym.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_ssr_ssrfun_571) (B : Type u_Corelib_ssr_ssrfun_572) (f : B → A),
  (∃ g, (∀ (x : B), g (f x) = x) ∧ ∀ (y : A), f (g y) = y) →
    ∀ (f' : A → B), (∀ (x : A), f (f' x) = x) ↔ ∀ (x : B), f' (f x) = x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.bij_can_sym.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.bij_can_sym.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.bij_comp

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.bij_comp.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_ssr_ssrfun_582) (B : Type u_Corelib_ssr_ssrfun_583) (C : Type u_Corelib_ssr_ssrfun_584)
  (f : B → A) (h : C → B),
  (∃ g, (∀ (x : B), g (f x) = x) ∧ ∀ (y : A), f (g y) = y) →
    (∃ g, (∀ (x : C), g (h x) = x) ∧ ∀ (y : B), h (g y) = y) →
      ∃ g, (∀ (x : C), g (f (h x)) = x) ∧ ∀ (y : A), f (h (g y)) = y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.bij_comp.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.bij_comp.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.bij_inj

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.bij_inj.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_ssr_ssrfun_571) (B : Type u_Corelib_ssr_ssrfun_572) (f : B → A),
  (∃ g, (∀ (x : B), g (f x) = x) ∧ ∀ (y : A), f (g y) = y) → ∀ (x1 x2 : B), f x1 = f x2 → x1 = x2；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.bij_inj.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.bij_inj.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.canLR

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.canLR.statement.correspondence

目标：native statement: ∀ (rT : Sort u_Corelib_ssr_ssrfun_398) (aT : Sort u_Corelib_ssr_ssrfun_399) (f : aT → rT) (g : rT → aT) (x : rT)
  (y : aT), (∀ (x : aT), g (f x) = x) → x = f y → g x = y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.canLR.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.canLR.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.canRL

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.canRL.statement.correspondence

目标：native statement: ∀ (rT : Sort u_Corelib_ssr_ssrfun_398) (aT : Sort u_Corelib_ssr_ssrfun_399) (f : aT → rT) (g : rT → aT) (x : aT)
  (y : rT), (∀ (x : aT), g (f x) = x) → f x = y → x = g y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.canRL.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.canRL.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.can_comp

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.can_comp.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_ssr_ssrfun_512) (B : Sort u_Corelib_ssr_ssrfun_513) (C : Sort u_Corelib_ssr_ssrfun_514)
  (f : B → A) (h : C → B) (f' : A → B) (h' : B → C),
  (∀ (x : B), f' (f x) = x) → (∀ (x : C), h' (h x) = x) → ∀ (x : C), h' (f' (f (h x))) = x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.can_comp.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.can_comp.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.can_inj

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.can_inj.statement.correspondence

目标：native statement: ∀ (rT : Sort u_Corelib_ssr_ssrfun_398) (aT : Sort u_Corelib_ssr_ssrfun_399) (f : aT → rT) (g : rT → aT),
  (∀ (x : aT), g (f x) = x) → ∀ (x1 x2 : aT), f x1 = f x2 → x1 = x2；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.can_inj.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.can_inj.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.can_pcan

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.can_pcan.statement.correspondence

目标：native statement: ∀ (rT : Sort u_Corelib_ssr_ssrfun_398) (aT : Sort u_Corelib_ssr_ssrfun_399) (f : aT → rT) (g : rT → aT),
  (∀ (x : aT), g (f x) = x) → ∀ (x : aT), some { down := g (f x) } = some { down := x }；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.can_pcan.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.can_pcan.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.compA

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.compA.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_ssr_ssrfun_128) (B : Sort u_Corelib_ssr_ssrfun_129) (C : Sort u_Corelib_ssr_ssrfun_130)
  (D : Sort u_Corelib_ssr_ssrfun_131) (f : B → A) (g : C → B) (h : D → C), (fun x => f (g (h x))) = fun x => f (g (h x))；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.compA.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.compA.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.eq_bij

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.eq_bij.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_ssr_ssrfun_582) (B : Type u_Corelib_ssr_ssrfun_583) (f : B → A),
  (∃ g, (∀ (x : B), g (f x) = x) ∧ ∀ (y : A), f (g y) = y) →
    ∀ (g : B → A), (∀ (x : B), f x = g x) → ∃ g_1, (∀ (x : B), g_1 (g x) = x) ∧ ∀ (y : A), g (g_1 y) = y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.eq_bij.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.eq_bij.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.eq_can

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.eq_can.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_ssr_ssrfun_512) (B : Sort u_Corelib_ssr_ssrfun_513) (f g : B → A) (f' g' : A → B),
  (∀ (x : B), f' (f x) = x) → (∀ (x : B), f x = g x) → (∀ (x : A), f' x = g' x) → ∀ (x : B), g' (g x) = x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.eq_can.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.eq_can.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.eq_comp

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.eq_comp.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_ssr_ssrfun_114) (B : Sort u_Corelib_ssr_ssrfun_115) (C : Sort u_Corelib_ssr_ssrfun_116)
  (f f' : B → A) (g g' : C → B), (∀ (x : B), f x = f' x) → (∀ (x : C), g x = g' x) → ∀ (x : C), f (g x) = f' (g' x)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.eq_comp.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.eq_comp.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.eq_inj

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.eq_inj.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_ssr_ssrfun_512) (B : Sort u_Corelib_ssr_ssrfun_513) (f g : B → A),
  (∀ (x1 x2 : B), f x1 = f x2 → x1 = x2) → (∀ (x : B), f x = g x) → ∀ (x1 x2 : B), g x1 = g x2 → x1 = x2；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.eq_inj.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.eq_inj.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.eq_omap

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.eq_omap.statement.correspondence

目标：native statement: ∀ (aT : Sort u_Corelib_ssr_ssrfun_143) (rT : Sort u_Corelib_ssr_ssrfun_144) (f h : aT → rT),
  (∀ (x : aT), f x = h x) →
    ∀ (x : Option (PLift aT)),
      Option.map (fun a => { down := f a.down }) x = Option.map (fun a => { down := h a.down }) x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.eq_omap.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.eq_omap.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.frefl

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.frefl.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_ssr_ssrfun_95) (B : Sort u_Corelib_ssr_ssrfun_96) (f : B → A) (x : B), f x = f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.frefl.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.frefl.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.fsym

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.fsym.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_ssr_ssrfun_95) (B : Sort u_Corelib_ssr_ssrfun_96) (f g : B → A),
  (∀ (x : B), f x = g x) → ∀ (x : B), g x = f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.fsym.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.fsym.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.ftrans

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.ftrans.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_ssr_ssrfun_95) (B : Sort u_Corelib_ssr_ssrfun_96) (f g h : B → A),
  (∀ (x : B), f x = g x) → (∀ (x : B), g x = h x) → ∀ (x : B), f x = h x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.ftrans.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.ftrans.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.inj_can_eq

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.inj_can_eq.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_ssr_ssrfun_512) (B : Sort u_Corelib_ssr_ssrfun_513) (f g : B → A) (f' : A → B),
  (∀ (x : B), f' (f x) = x) →
    (∀ (x1 x2 : A), f' x1 = f' x2 → x1 = x2) → (∀ (x : B), f' (g x) = x) → ∀ (x : B), f x = g x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.inj_can_eq.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.inj_can_eq.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.inj_can_sym

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.inj_can_sym.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_ssr_ssrfun_512) (B : Sort u_Corelib_ssr_ssrfun_513) (f : B → A) (f' : A → B),
  (∀ (x : B), f' (f x) = x) → (∀ (x1 x2 : A), f' x1 = f' x2 → x1 = x2) → ∀ (x : A), f (f' x) = x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.inj_can_sym.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.inj_can_sym.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.inj_comp

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.inj_comp.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_ssr_ssrfun_512) (B : Sort u_Corelib_ssr_ssrfun_513) (C : Sort u_Corelib_ssr_ssrfun_514)
  (f : B → A) (h : C → B),
  (∀ (x1 x2 : B), f x1 = f x2 → x1 = x2) →
    (∀ (x1 x2 : C), h x1 = h x2 → x1 = x2) → ∀ (x1 x2 : C), f (h x1) = f (h x2) → x1 = x2；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.inj_comp.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.inj_comp.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.inj_compr

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.inj_compr.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_ssr_ssrfun_512) (B : Sort u_Corelib_ssr_ssrfun_513) (C : Sort u_Corelib_ssr_ssrfun_514)
  (f : B → A) (h : C → B), (∀ (x1 x2 : C), f (h x1) = f (h x2) → x1 = x2) → ∀ (x1 x2 : C), h x1 = h x2 → x1 = x2；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.inj_compr.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.inj_compr.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.inj_id

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.inj_id.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_ssr_ssrfun_512) (x1 x2 : A), x1 = x2 → x1 = x2；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.inj_id.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.inj_id.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.inj_omap

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.inj_omap.statement.correspondence

目标：native statement: ∀ (aT : Sort u_Corelib_ssr_ssrfun_463) (rT : Sort u_Corelib_ssr_ssrfun_464) (f : aT → rT),
  (∀ (x1 x2 : aT), f x1 = f x2 → x1 = x2) →
    ∀ (x x_1 : Option (PLift aT)),
      Option.map (fun a => { down := f a.down }) x = Option.map (fun a => { down := f a.down }) x_1 → x = x_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.inj_omap.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.inj_omap.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.inl_inj

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.inl_inj.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_ssr_ssrfun_690) (B : Sort u_Corelib_ssr_ssrfun_691) (x1 x2 : A),
  PSum.inl x1 = PSum.inl x2 → x1 = x2；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.inl_inj.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.inl_inj.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.inr_inj

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.inr_inj.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_ssr_ssrfun_686) (B : Sort u_Corelib_ssr_ssrfun_687) (x1 x2 : B),
  PSum.inr x1 = PSum.inr x2 → x1 = x2；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.inr_inj.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.inr_inj.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.inv_bij

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.inv_bij.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_ssr_ssrfun_587) (f : A → A),
  (∀ (x : A), f (f x) = x) → ∃ g, (∀ (x : A), g (f x) = x) ∧ ∀ (y : A), f (g y) = y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.inv_bij.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.inv_bij.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.inv_inj

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.inv_inj.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_ssr_ssrfun_587) (f : A → A), (∀ (x : A), f (f x) = x) → ∀ (x1 x2 : A), f x1 = f x2 → x1 = x2；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.inv_inj.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.inv_inj.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.oappEmap

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.oappEmap.statement.correspondence

目标：native statement: ∀ (aT : Sort u_Corelib_ssr_ssrfun_143) (rT : Sort u_Corelib_ssr_ssrfun_144) (f : aT → rT) (y0 : rT)
  (x : Option (PLift aT)),
  (x.elim y0 fun a => f a.down) = ((Option.map (fun a => { down := f a.down }) x).getD { down := y0 }).down；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.oappEmap.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.oappEmap.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.oapp_comp

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.oapp_comp.statement.correspondence

目标：native statement: ∀ (aT : Sort u_Corelib_ssr_ssrfun_143) (rT : Sort u_Corelib_ssr_ssrfun_144) (sT : Sort u_Corelib_ssr_ssrfun_145)
  (f : aT → rT) (g : rT → sT) (x : sT) (x_1 : Option (PLift aT)),
  (x_1.elim x fun a => g (f a.down)) = (Option.map (fun a => { down := f a.down }) x_1).elim x fun a => g a.down；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.oapp_comp.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.oapp_comp.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.oapp_comp_f

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.oapp_comp_f.statement.correspondence

目标：native statement: ∀ (aT : Sort u_Corelib_ssr_ssrfun_143) (rT : Sort u_Corelib_ssr_ssrfun_144) (sT : Sort u_Corelib_ssr_ssrfun_145)
  (f : aT → rT) (g : rT → sT) (x : rT) (x_1 : Option (PLift aT)),
  (x_1.elim (g x) fun a => g (f a.down)) = g (x_1.elim x fun a => f a.down)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.oapp_comp_f.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.oapp_comp_f.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.obindEapp

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.obindEapp.statement.correspondence

目标：native statement: ∀ (aT : Sort u_Corelib_ssr_ssrfun_143) (rT : Sort u_Corelib_ssr_ssrfun_144) (f : aT → Option (PLift rT))
  (x : Option (PLift aT)), (x.bind fun a => f a.down) = x.elim none fun a => f a.down；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.obindEapp.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.obindEapp.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.ocan_comp

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.ocan_comp.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_ssr_ssrfun_512) (B : Sort u_Corelib_ssr_ssrfun_513) (C : Sort u_Corelib_ssr_ssrfun_514)
  (f : B → Option (PLift A)) (f_1 : C → Option (PLift B)) (f' : A → B) (h' : B → C),
  (∀ (x : B), ((f x).elim x fun a => f' a.down) = x) →
    (∀ (x : C), ((f_1 x).elim x fun a => h' a.down) = x) →
      ∀ (x : C), (((f_1 x).bind fun a => f a.down).elim x fun a => h' (f' a.down)) = x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.ocan_comp.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.ocan_comp.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.of_voidK

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.of_voidK.statement.correspondence

目标：native statement: ∀ (T : Sort u_Corelib_ssr_ssrfun_493), True；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.of_voidK.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.of_voidK.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.olift_comp

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.olift_comp.statement.correspondence

目标：native statement: ∀ (aT : Sort u_Corelib_ssr_ssrfun_143) (rT : Sort u_Corelib_ssr_ssrfun_144) (sT : Sort u_Corelib_ssr_ssrfun_145)
  (f : aT → rT) (g : rT → sT) (x : aT), some { down := g (f x) } = some { down := g (f x) }；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.olift_comp.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.olift_comp.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.omapEapp

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.omapEapp.statement.correspondence

目标：native statement: ∀ (aT : Sort u_Corelib_ssr_ssrfun_143) (rT : Sort u_Corelib_ssr_ssrfun_144) (f : aT → rT) (x : Option (PLift aT)),
  Option.map (fun a => { down := f a.down }) x = x.elim none fun a => some { down := f a.down }；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.omapEapp.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.omapEapp.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.omapEbind

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.omapEbind.statement.correspondence

目标：native statement: ∀ (aT : Sort u_Corelib_ssr_ssrfun_143) (rT : Sort u_Corelib_ssr_ssrfun_144) (f : aT → rT) (x : Option (PLift aT)),
  Option.map (fun a => { down := f a.down }) x = x.bind fun a => some { down := f a.down }；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.omapEbind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.omapEbind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.omapK

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.omapK.statement.correspondence

目标：native statement: ∀ (aT : Sort u_Corelib_ssr_ssrfun_483) (rT : Sort u_Corelib_ssr_ssrfun_484) (f : aT → rT) (g : rT → aT),
  (∀ (x : aT), g (f x) = x) →
    ∀ (x : Option (PLift aT)),
      Option.map (fun a => { down := g a.down }) (Option.map (fun a => { down := f a.down }) x) = x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.omapK.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.omapK.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.omap_comp

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.omap_comp.statement.correspondence

目标：native statement: ∀ (aT : Sort u_Corelib_ssr_ssrfun_143) (rT : Sort u_Corelib_ssr_ssrfun_144) (sT : Sort u_Corelib_ssr_ssrfun_145)
  (f : aT → rT) (g : rT → sT) (x : Option (PLift aT)),
  Option.map (fun a => { down := g (f a.down) }) x =
    Option.map (fun a => { down := g a.down }) (Option.map (fun a => { down := f a.down }) x)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.omap_comp.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.omap_comp.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.omap_id

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.omap_id.statement.correspondence

目标：native statement: ∀ (rT : Sort u_Corelib_ssr_ssrfun_144) (x : Option (PLift rT)), Option.map (fun a => { down := a.down }) x = x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.omap_id.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.omap_id.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.pair_of_and

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.pair_of_and.statement.correspondence

目标：native statement: ∀ (P Q : Prop), P ∧ Q → P ∧ Q；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.pair_of_and.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.pair_of_and.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.pcan_inj

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.pcan_inj.statement.correspondence

目标：native statement: ∀ (rT : Sort u_Corelib_ssr_ssrfun_398) (aT : Sort u_Corelib_ssr_ssrfun_399) (f : aT → rT)
  (f_1 : rT → Option (PLift aT)), (∀ (x : aT), f_1 (f x) = some { down := x }) → ∀ (x1 x2 : aT), f x1 = f x2 → x1 = x2；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.pcan_inj.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.pcan_inj.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.pcan_pcomp

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.pcan_pcomp.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_ssr_ssrfun_512) (B : Sort u_Corelib_ssr_ssrfun_513) (C : Sort u_Corelib_ssr_ssrfun_514)
  (f : B → A) (h : C → B) (f_1 : A → Option (PLift B)) (f_2 : B → Option (PLift C)),
  (∀ (x : B), f_1 (f x) = some { down := x }) →
    (∀ (x : C), f_2 (h x) = some { down := x }) →
      ∀ (x : C), ((f_1 (f (h x))).bind fun a => f_2 a.down) = some { down := x }；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.pcan_pcomp.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.pcan_pcomp.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.rrefl

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.rrefl.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_ssr_ssrfun_95) (B : Sort u_Corelib_ssr_ssrfun_96) (C : Sort u_Corelib_ssr_ssrfun_97)
  (r : C → B → A) (x : C) (y : B), r x y = r x y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.rrefl.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.rrefl.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.s2valP

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.s2valP.statement.correspondence

目标：native statement: ∀ (T : Sort u_Corelib_ssr_ssrfun_280) (P Q : T → Prop) (x : { a // P a ∧ Q a }), P x.val；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.s2valP.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.s2valP.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.s2valP'

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.s2valP'.statement.correspondence

目标：native statement: ∀ (T : Sort u_Corelib_ssr_ssrfun_280) (P Q : T → Prop) (x : { a // P a ∧ Q a }), Q x.val；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.s2valP'.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.s2valP'.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.svalP

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.svalP.statement.correspondence

目标：native statement: ∀ (T : Sort u_Corelib_ssr_ssrfun_280) (P : T → Prop) (x : Subtype P), P x.val；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.svalP.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.svalP.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrfun.unitE

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.unitE.statement.correspondence

目标：native statement: ∀ (x : Unit), x = ()；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrfun.unitE.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrfun.unitE.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_exist2_curried

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_exist2_curried.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_1177) (P Q : A → Prop) (u1 v1 : A) (u2 : P u1) (v2 : P v1) (u3 : Q u1) (v3 : Q v1),
  u1 = v1 → True → True → ⟨u1, ⋯⟩ = ⟨v1, ⋯⟩；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.eq_exist2_curried.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_exist2_curried.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_exist2_l

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_exist2_l.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_1196) (P Q : A → Prop) (u1 : A) (u2 : P u1) (u3 : Q u1) (s : { x // P x ∧ Q x }),
  u1 = s.val → True → True → ⟨u1, ⋯⟩ = s；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.eq_exist2_l.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_exist2_l.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_exist2_r

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_exist2_r.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_1206) (P Q : A → Prop) (s : { x // P x ∧ Q x }) (v1 : A) (v2 : P v1) (v3 : Q v1),
  s.val = v1 → True → True → s = ⟨v1, ⋯⟩；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.eq_exist2_r.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_exist2_r.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_exist2_uncurried

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_exist2_uncurried.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_1157) (P Q : A → Prop) (u1 v1 : A) (u2 : P u1) (v2 : P v1) (u3 : Q u1) (v3 : Q v1),
  (∃ h, True ∧ True) → ⟨u1, ⋯⟩ = ⟨v1, ⋯⟩；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.eq_exist2_uncurried.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_exist2_uncurried.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_existT_curried_congr

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_existT_curried_congr.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_309) (P : A → Sort u_Corelib_Init_Specif_312) (u1 v1 : A) (u2 : P u1) (v2 : P v1)
  (p p' : u1 = v1), p ▸ u2 = v2 → p' ▸ u2 = v2 → True → True → True；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.eq_existT_curried_congr.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_existT_curried_congr.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_existT_curried_map

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_existT_curried_map.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_274) (A' : Sort u_Corelib_Init_Specif_275) (P : A → Sort u_Corelib_Init_Specif_278)
  (P' : A' → Sort u_Corelib_Init_Specif_281) (f : A → A') (g : (u : A) → P u → P' (f u)) (u1 v1 : A) (u2 : P u1)
  (v2 : P v1) (p : u1 = v1), p ▸ u2 = v2 → True；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.eq_existT_curried_map.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_existT_curried_map.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_existT_curried_trans

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_existT_curried_trans.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_295) (P : A → Sort u_Corelib_Init_Specif_298) (u1 v1 w1 : A) (u2 : P u1) (v2 : P v1)
  (w2 : P w1) (p : u1 = v1), p ▸ u2 = v2 → ∀ (p' : v1 = w1), p' ▸ v2 = w2 → True；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.eq_existT_curried_trans.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_existT_curried_trans.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_exist_curried

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_exist_curried.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_564) (P : A → Prop) (u1 v1 : A) (u2 : P u1) (v2 : P v1),
  u1 = v1 → True → ⟨u1, u2⟩ = ⟨v1, v2⟩；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.eq_exist_curried.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_exist_curried.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_exist_l

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_exist_l.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_579) (P : A → Prop) (u1 : A) (u2 : P u1) (x : { a // P a }),
  u1 = x.val → True → ⟨u1, u2⟩ = x；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.eq_exist_l.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_exist_l.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_exist_r

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_exist_r.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_587) (P : A → Prop) (x : { a // P a }) (v1 : A) (v2 : P v1),
  x.val = v1 → True → x = ⟨v1, v2⟩；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.eq_exist_r.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_exist_r.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_exist_uncurried

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_exist_uncurried.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_548) (P : A → Prop) (u1 v1 : A) (u2 : P u1) (v2 : P v1),
  (∃ h, True) → ⟨u1, u2⟩ = ⟨v1, v2⟩；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.eq_exist_uncurried.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_exist_uncurried.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sig

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_sig.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_572) (P : A → Prop) (x x_1 : { a // P a }), x.val = x_1.val → True → x = x_1；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.eq_sig.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_sig.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sig2

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_sig2.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_1188) (P Q : A → Prop) (s s_1 : { x // P x ∧ Q x }),
  s.val = s_1.val → True → True → s = s_1；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.eq_sig2.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_sig2.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sig2_ind

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_sig2_ind.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_1272) (P Q : A → Prop) (s s_1 : { x // P x ∧ Q x }) (R : s = s_1 → Prop),
  (∀ (p : s.val = s_1.val), True → True → R ⋯) → ∀ (p : s = s_1), R p；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.eq_sig2_ind.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_sig2_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sig2_ind_uncurried

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_sig2_ind_uncurried.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_1355) (P Q : A → Prop) (s s_1 : { x // P x ∧ Q x }) (R : s = s_1 → Prop),
  (∀ (pqr : ∃ h, True ∧ True), R ⋯) → ∀ (p : s = s_1), R p；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.eq_sig2_ind_uncurried.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_sig2_ind_uncurried.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sig2_nondep

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_sig2_nondep.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_1371) (B C : Prop) (s s_1 : { x // B ∧ C }), s.val = s_1.val → True → True → s = s_1；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.eq_sig2_nondep.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_sig2_nondep.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sig2_uncurried

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_sig2_uncurried.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_1169) (P Q : A → Prop) (s s_1 : { x // P x ∧ Q x }), (∃ h, True ∧ True) → s = s_1；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.eq_sig2_uncurried.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_sig2_uncurried.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sig2_uncurried_iff

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_sig2_uncurried_iff.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_1225) (P Q : A → Prop) (s s_1 : { x // P x ∧ Q x }), s = s_1 ↔ ∃ h, True ∧ True；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.eq_sig2_uncurried_iff.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_sig2_uncurried_iff.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sigT2_ind

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_sigT2_ind.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_965) (P : A → Sort u_Corelib_Init_Specif_966) (Q : A → Sort u_Corelib_Init_Specif_969)
  (x x_1 : (x : A) ×' P x ×' Q x) (R : x = x_1 → Prop),
  (∀ (p : x.fst = x_1.fst) (q : p ▸ x.snd.1 = x_1.snd.1) (r : p ▸ x.snd.snd = x_1.snd.snd), R ⋯) → ∀ (p : x = x_1), R p；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.eq_sigT2_ind.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_sigT2_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sigT2_ind_uncurried

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_sigT2_ind_uncurried.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_1062) (P : A → Sort u_Corelib_Init_Specif_1063)
  (Q : A → Sort u_Corelib_Init_Specif_1066) (x x_1 : (x : A) ×' P x ×' Q x) (R : x = x_1 → Prop),
  (∀ (pqr : ∃ h, h ▸ x.snd.1 = x_1.snd.1 ∧ h ▸ x.snd.snd = x_1.snd.snd), R ⋯) → ∀ (p : x = x_1), R p；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.eq_sigT2_ind_uncurried.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_sigT2_ind_uncurried.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sigT_ind

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_sigT_ind.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_417) (P : A → Sort u_Corelib_Init_Specif_418) (x x_1 : (a : A) ×' P a)
  (R : x = x_1 → Prop), (∀ (p : x.fst = x_1.fst) (q : p ▸ x.snd = x_1.snd), R ⋯) → ∀ (p : x = x_1), R p；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.eq_sigT_ind.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_sigT_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sigT_ind_uncurried

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_sigT_ind_uncurried.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_486) (P : A → Sort u_Corelib_Init_Specif_487) (x x_1 : (a : A) ×' P a)
  (R : x = x_1 → Prop), (∀ (pq : ∃ h, h ▸ x.snd = x_1.snd), R ⋯) → ∀ (p : x = x_1), R p；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.eq_sigT_ind_uncurried.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_sigT_ind_uncurried.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sig_ind

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_sig_ind.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_618) (P : A → Prop) (x x_1 : { a // P a }) (R : x = x_1 → Prop),
  (∀ (p : x.val = x_1.val), True → R ⋯) → ∀ (p : x = x_1), R p；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.eq_sig_ind.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_sig_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sig_ind_uncurried

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_sig_ind_uncurried.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_680) (P : A → Prop) (x x_1 : { a // P a }) (R : x = x_1 → Prop),
  (∀ (pq : ∃ h, True), R ⋯) → ∀ (p : x = x_1), R p；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.eq_sig_ind_uncurried.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_sig_ind_uncurried.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sig_uncurried

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_sig_uncurried.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_557) (P : A → Prop) (x x_1 : { a // P a }), (∃ h, True) → x = x_1；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.eq_sig_uncurried.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_sig_uncurried.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sig_uncurried_iff

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_sig_uncurried_iff.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_691) (P : A → Prop) (x x_1 : { a // P a }), x = x_1 ↔ ∃ h, True；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.eq_sig_uncurried_iff.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.eq_sig_uncurried_iff.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.proj2_sig_eq

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.proj2_sig_eq.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_542) (P : A → Prop) (x x_1 : { a // P a }), x = x_1 → True；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.proj2_sig_eq.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.proj2_sig_eq.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.proj2_sig_of_sig2_eq

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.proj2_sig_of_sig2_eq.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_1143) (P Q : A → Prop) (s s_1 : { x // P x ∧ Q x }), s = s_1 → True；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.proj2_sig_of_sig2_eq.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.proj2_sig_of_sig2_eq.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.proj3_sig_eq

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.proj3_sig_eq.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_1150) (P Q : A → Prop) (s s_1 : { x // P x ∧ Q x }), s = s_1 → True；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.proj3_sig_eq.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.proj3_sig_eq.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.projT2_eq

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.projT2_eq.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_223) (P : A → Sort u_Corelib_Init_Specif_224) (x x_1 : (a : A) ×' P a) (p : x = x_1),
  ⋯ ▸ x.snd = x_1.snd；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.projT2_eq.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.projT2_eq.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.projT2_of_sigT2_eq

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.projT2_of_sigT2_eq.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_751) (P : A → Sort u_Corelib_Init_Specif_752) (Q : A → Sort u_Corelib_Init_Specif_753)
  (x x_1 : (x : A) ×' P x ×' Q x) (p : x = x_1), ⋯ ▸ x.snd.1 = x_1.snd.1；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.projT2_of_sigT2_eq.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.projT2_of_sigT2_eq.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.projT3_eq

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.projT3_eq.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_764) (P : A → Sort u_Corelib_Init_Specif_765) (Q : A → Sort u_Corelib_Init_Specif_766)
  (x x_1 : (x : A) ×' P x ×' Q x) (p : x = x_1), ⋯ ▸ x.snd.snd = x_1.snd.snd；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.projT3_eq.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.projT3_eq.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.rew_sig

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.rew_sig.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_713) (x : A) (P : A → Sort u_Corelib_Init_Specif_714) (Q : (a : A) → P a → Prop)
  (x_1 : { p // Q x p }) (y : A) (H : x = y), H ▸ x_1 = ⟨H ▸ x_1.val, ⋯⟩；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.rew_sig.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.rew_sig.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.rew_sig2

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.rew_sig2.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_1381) (x : A) (P : A → Sort u_Corelib_Init_Specif_1382) (Q R : (a : A) → P a → Prop)
  (s : { x_1 // Q x x_1 ∧ R x x_1 }) (y : A) (H : x = y), H ▸ s = ⟨H ▸ s.val, ⋯⟩；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.rew_sig2.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.rew_sig2.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.rew_sigT

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.rew_sigT.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_519) (x : A) (P : A → Sort u_Corelib_Init_Specif_520) (Q : (a : A) → P a → Prop)
  (x_1 : (p : P x) ×' Q x p) (y : A) (H : x = y), H ▸ x_1 = ⟨H ▸ x_1.fst, ⋯⟩；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.rew_sigT.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.rew_sigT.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.rew_sigT2

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.rew_sigT2.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_1110) (x : A) (P : A → Sort u_Corelib_Init_Specif_1111) (Q R : (a : A) → P a → Prop)
  (x_1 : (x_1 : P x) ×' Q x x_1 ×' R x x_1) (y : A) (H : x = y), H ▸ x_1 = ⟨H ▸ x_1.1, ⟨⋯, ⋯⟩⟩；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.rew_sigT2.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.rew_sigT2.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.sig2_eta

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.sig2_eta.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_168) (P Q : A → Prop) (s : { x // P x ∧ Q x }), s = ⟨s.val, ⋯⟩；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.sig2_eta.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.sig2_eta.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.sig_eta

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.sig_eta.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_144) (P : A → Prop) (x : { a // P a }), x = ⟨x.val, ⋯⟩；范围：all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Specif.sig_eta.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Specif.sig_eta.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_ex

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex.statement.correspondence

目标：native statement: ∀ (A : Prop) (P : A → Prop), (∃ a, P a) → (∃ a, P a) → True → True → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_ex.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_ex2

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex2.statement.correspondence

目标：native statement: ∀ (A : Prop) (P Q : A → Prop), (∃ x, P x ∧ Q x) → (∃ x, P x ∧ Q x) → True → True → True → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_ex2.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex2.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_ex2_eta

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex2_eta.statement.correspondence

目标：native statement: ∀ (A : Prop) (P Q : A → Prop), (∃ x, P x ∧ Q x) → (∃ x, P x ∧ Q x) → True → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_ex2_eta.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex2_eta.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_ex2_hprop

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex2_hprop.statement.correspondence

目标：native statement: ∀ (A : Prop) (P Q : A → Prop), (∀ (x : A), Q x → Q x → True) → (∃ x, P x ∧ Q x) → (∃ x, P x ∧ Q x) → True → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_ex2_hprop.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex2_hprop.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_ex2_hprop_iff

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex2_hprop_iff.statement.correspondence

目标：native statement: ∀ (A : Prop) (P Q : A → Prop), (∀ (x : A), Q x → Q x → True) → (∃ x, P x ∧ Q x) → (∃ x, P x ∧ Q x) → (True ↔ True)；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_ex2_hprop_iff.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex2_hprop_iff.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_ex2_ind

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex2_ind.statement.correspondence

目标：native statement: ∀ (A : Prop) (P Q : A → Prop),
  (∃ x, P x ∧ Q x) → (∃ x, P x ∧ Q x) → ∀ (R : True → Prop), (True → True → True → R True.intro) → True → R True.intro；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_ex2_ind.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex2_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_ex2_ind_uncurried

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex2_ind_uncurried.statement.correspondence

目标：native statement: ∀ (A : Prop) (P Q : A → Prop) (u : ∃ x, P x ∧ Q x),
  (∃ x, P x ∧ Q x) → ∀ (R : True → Prop), ((∃ e, True ∧ True) → R True.intro) → True → R True.intro；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_ex2_ind_uncurried.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex2_ind_uncurried.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_ex2_nondep

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Logic.eq_ex2_nondep.statement.correspondence

目标：native statement: ∀ (A B C : Prop), (∃ x, B ∧ C) → (∃ x, B ∧ C) → True → True → True → True；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Logic.eq_ex2_nondep.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Logic.eq_ex2_nondep.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_ex2_uncurried

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex2_uncurried.statement.correspondence

目标：native statement: ∀ (A : Prop) (P Q : A → Prop) (u : ∃ x, P x ∧ Q x), (∃ x, P x ∧ Q x) → (∃ e, True ∧ True) → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_ex2_uncurried.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex2_uncurried.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_ex2_uncurried_iff

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex2_uncurried_iff.statement.correspondence

目标：native statement: ∀ (A : Prop) (P Q : A → Prop) (u : ∃ x, P x ∧ Q x), (∃ x, P x ∧ Q x) → (True ↔ ∃ e, True ∧ True)；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_ex2_uncurried_iff.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex2_uncurried_iff.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_ex_eta

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_eta.statement.correspondence

目标：native statement: ∀ (A : Prop) (P : A → Prop), (∃ a, P a) → (∃ a, P a) → True → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_ex_eta.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_eta.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_ex_hprop

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Logic.eq_ex_hprop.statement.correspondence

目标：native statement: ∀ (A : Prop) (P : A → Prop), (∀ (x : A), P x → P x → True) → (∃ a, P a) → (∃ a, P a) → True → True；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Logic.eq_ex_hprop.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Logic.eq_ex_hprop.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_ex_hprop_iff

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Logic.eq_ex_hprop_iff.statement.correspondence

目标：native statement: ∀ (A : Prop) (P : A → Prop), (∀ (x : A), P x → P x → True) → (∃ a, P a) → (∃ a, P a) → (True ↔ True)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Logic.eq_ex_hprop_iff.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Logic.eq_ex_hprop_iff.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_ex_ind

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_ind.statement.correspondence

目标：native statement: ∀ (A : Prop) (P : A → Prop),
  (∃ a, P a) → (∃ a, P a) → ∀ (R : True → Prop), (True → True → R True.intro) → True → R True.intro；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_ex_ind.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_ex_ind_uncurried

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_ind_uncurried.statement.correspondence

目标：native statement: ∀ (A : Prop) (P : A → Prop) (u : ∃ a, P a),
  (∃ a, P a) → ∀ (R : True → Prop), ((∃ e, True) → R True.intro) → True → R True.intro；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_ex_ind_uncurried.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_ind_uncurried.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_ex_intro

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_intro.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_439) (P : A → Prop) (u1 v1 : A), P u1 → P v1 → u1 = v1 → True → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_ex_intro.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_intro.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_ex_intro2

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_intro2.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_626) (P Q : A → Prop) (u1 v1 : A),
  P u1 → P v1 → Q u1 → Q v1 → u1 = v1 → True → True → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_ex_intro2.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_intro2.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_ex_intro2_hprop

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_intro2_hprop.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_690) (P Q : A → Prop),
  (∀ (x : A), P x → P x → True) →
    (∀ (x : A), Q x → Q x → True) → ∀ (u1 v1 : A), P u1 → P v1 → Q u1 → Q v1 → u1 = v1 → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_ex_intro2_hprop.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_intro2_hprop.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_ex_intro2_hprop_nondep

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_intro2_hprop_nondep.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_667) (P : A → Prop) (Q : Prop),
  (Q → Q → True) → ∀ (u1 v1 : A), P u1 → P v1 → Q → Q → True → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_ex_intro2_hprop_nondep.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_intro2_hprop_nondep.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_ex_intro2_l

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_intro2_l.statement.correspondence

目标：native statement: ∀ (A : Prop) (P Q : A → Prop) (u1 : A), P u1 → Q u1 → (∃ x, P x ∧ Q x) → True → True → True → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_ex_intro2_l.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_intro2_l.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_ex_intro2_r

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_intro2_r.statement.correspondence

目标：native statement: ∀ (A : Prop) (P Q : A → Prop), (∃ x, P x ∧ Q x) → ∀ (v1 : A), P v1 → Q v1 → True → True → True → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_ex_intro2_r.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_intro2_r.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_ex_intro2_uncurried

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_intro2_uncurried.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_601) (P Q : A → Prop) (u1 v1 : A),
  P u1 → P v1 → Q u1 → Q v1 → (∃ e, True ∧ True) → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_ex_intro2_uncurried.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_intro2_uncurried.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_ex_intro_hprop

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_intro_hprop.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_537) (P : A → Prop),
  (∀ (x : A), P x → P x → True) → ∀ (u1 v1 : A), P u1 → P v1 → u1 = v1 → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_ex_intro_hprop.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_intro_hprop.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_ex_intro_l

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_intro_l.statement.correspondence

目标：native statement: ∀ (A : Prop) (P : A → Prop) (u1 : A), P u1 → (∃ a, P a) → True → True → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_ex_intro_l.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_intro_l.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_ex_intro_r

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_intro_r.statement.correspondence

目标：native statement: ∀ (A : Prop) (P : A → Prop), (∃ a, P a) → ∀ (v1 : A), P v1 → True → True → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_ex_intro_r.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_intro_r.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_ex_intro_uncurried

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_intro_uncurried.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_424) (P : A → Prop) (u1 v1 : A), P u1 → P v1 → (∃ e, True) → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_ex_intro_uncurried.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_intro_uncurried.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_ex_uncurried

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_uncurried.statement.correspondence

目标：native statement: ∀ (A : Prop) (P : A → Prop) (u : ∃ a, P a), (∃ a, P a) → (∃ e, True) → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_ex_uncurried.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_uncurried.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_ex_uncurried_iff

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_uncurried_iff.statement.correspondence

目标：native statement: ∀ (A : Prop) (P : A → Prop) (u : ∃ a, P a), (∃ a, P a) → (True ↔ ∃ e, True)；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_ex_uncurried_iff.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_ex_uncurried_iff.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_id_comm_l

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_id_comm_l.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_269) (f : A → A), (∀ (a : A), a = f a) → ∀ (a : A), True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_id_comm_l.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_id_comm_l.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_id_comm_r

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_id_comm_r.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_277) (f : A → A), (∀ (a : A), f a = a) → ∀ (a : A), True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_id_comm_r.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_id_comm_r.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_refl_map_distr

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_refl_map_distr.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_287) (B : Sort u_Corelib_Init_Logic_288) (x : A) (f : A → B), True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_refl_map_distr.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_refl_map_distr.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_sym_map_distr

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_sym_map_distr.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_312) (B : Sort u_Corelib_Init_Logic_313) (x y : A) (f : A → B), x = y → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_sym_map_distr.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_sym_map_distr.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_trans_assoc

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_trans_assoc.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_182) (x y z t : A), x = y → y = z → z = t → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_trans_assoc.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_trans_assoc.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_trans_map

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_trans_map.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_202) (B : A → Sort u_Corelib_Init_Logic_205) (x1 x2 x3 : A) (y1 : B x1) (y2 : B x2)
  (y3 : B x3) (H1 : x1 = x2) (H2 : x2 = x3), H1 ▸ y1 = y2 → H2 ▸ y2 = y3 → ⋯ ▸ y1 = y3；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_trans_map.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_trans_map.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_trans_map_distr

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_trans_map_distr.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_299) (B : Sort u_Corelib_Init_Logic_300) (x y z : A) (f : A → B), x = y → y = z → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_trans_map_distr.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_trans_map_distr.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_trans_refl_l

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_trans_refl_l.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_157) (x y : A), x = y → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_trans_refl_l.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_trans_refl_l.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_trans_refl_r

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_trans_refl_r.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_164) (x y : A), x = y → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_trans_refl_r.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_trans_refl_r.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_trans_rew_distr

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_trans_rew_distr.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_324) (P : A → Sort u_Corelib_Init_Logic_325) (x y z : A) (e : x = y) (e' : y = z)
  (k : P x), ⋯ ▸ k = e' ▸ e ▸ k；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_trans_rew_distr.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_trans_rew_distr.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_trans_sym_distr

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_trans_sym_distr.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_318) (x y z : A), x = y → y = z → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_trans_sym_distr.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_trans_sym_distr.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_trans_sym_inv_l

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_trans_sym_inv_l.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_170) (x y : A), x = y → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_trans_sym_inv_l.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_trans_sym_inv_l.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.eq_trans_sym_inv_r

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_trans_sym_inv_r.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_176) (x y : A), x = y → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.eq_trans_sym_inv_r.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.eq_trans_sym_inv_r.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.ex2_eta

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.ex2_eta.statement.correspondence

目标：native statement: ∀ (A : Prop) (P Q : A → Prop), (∃ x, P x ∧ Q x) → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.ex2_eta.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.ex2_eta.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.ex_eta

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.ex_eta.statement.correspondence

目标：native statement: ∀ (A : Prop) (P : A → Prop), (∃ a, P a) → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.ex_eta.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.ex_eta.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.ex_of_ex2_eq

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.ex_of_ex2_eq.statement.correspondence

目标：native statement: ∀ (A : Prop) (P Q : A → Prop), (∃ x, P x ∧ Q x) → (∃ x, P x ∧ Q x) → True → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.ex_of_ex2_eq.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.ex_of_ex2_eq.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.ex_proj1_eq

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Logic.ex_proj1_eq.statement.correspondence

目标：native statement: ∀ (A : Prop) (P : A → Prop), (∃ a, P a) → (∃ a, P a) → True → True；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Logic.ex_proj1_eq.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Logic.ex_proj1_eq.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.ex_proj1_of_ex2_eq

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Logic.ex_proj1_of_ex2_eq.statement.correspondence

目标：native statement: ∀ (A : Prop) (P Q : A → Prop), (∃ x, P x ∧ Q x) → (∃ x, P x ∧ Q x) → True → True；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Logic.ex_proj1_of_ex2_eq.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Logic.ex_proj1_of_ex2_eq.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.ex_proj2

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Logic.ex_proj2.statement.correspondence

目标：native statement: ∀ (A : Prop) (P : A → Prop) (x : ∃ x, P x), P ⋯；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Logic.ex_proj2.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Logic.ex_proj2.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.ex_proj2_eq

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.ex_proj2_eq.statement.correspondence

目标：native statement: ∀ (A : Prop) (P : A → Prop), (∃ a, P a) → (∃ a, P a) → True → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.ex_proj2_eq.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.ex_proj2_eq.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.ex_proj2_of_ex2_eq

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.ex_proj2_of_ex2_eq.statement.correspondence

目标：native statement: ∀ (A : Prop) (P Q : A → Prop), (∃ x, P x ∧ Q x) → (∃ x, P x ∧ Q x) → True → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.ex_proj2_of_ex2_eq.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.ex_proj2_of_ex2_eq.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.ex_proj3

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Logic.ex_proj3.statement.correspondence

目标：native statement: ∀ (A : Prop) (P Q : A → Prop) (x : ∃ x, P x ∧ Q x), Q ⋯；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Logic.ex_proj3.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Logic.ex_proj3.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.ex_proj3_eq

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.ex_proj3_eq.statement.correspondence

目标：native statement: ∀ (A : Prop) (P Q : A → Prop), (∃ x, P x ∧ Q x) → (∃ x, P x ∧ Q x) → True → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.ex_proj3_eq.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.ex_proj3_eq.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.f_equal_compose

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.f_equal_compose.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_150) (B : Sort u_Corelib_Init_Logic_151) (C : Sort u_Corelib_Init_Logic_152) (a b : A)
  (f : A → B) (g : B → C), a = b → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.f_equal_compose.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.f_equal_compose.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.f_equal_dep

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Logic.f_equal_dep.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_68) (B : A → Sort u_Corelib_Init_Logic_69) (f : (x : A) → B x) (x y : A) (H : x = y),
  H ▸ f x = f y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Logic.f_equal_dep.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Logic.f_equal_dep.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.f_equal_dep2

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.f_equal_dep2.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_79) (A' : Sort u_Corelib_Init_Logic_80) (B : A → Sort u_Corelib_Init_Logic_83)
  (B' : A' → Sort u_Corelib_Init_Logic_86) (f : A → A') (g : (a : A) → B a → B' (f a)) (x1 x2 : A) (y1 : B x1)
  (y2 : B x2) (H : x1 = x2), H ▸ y1 = y2 → ⋯ ▸ g x1 y1 = g x2 y2；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.f_equal_dep2.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.f_equal_dep2.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.forall_exists_coincide_unique_domain

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Logic.forall_exists_coincide_unique_domain.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_361) (P : A → Prop),
  (∀ (Q : A → Prop), (∀ (x : A), P x → Q x) ↔ ∃ x, P x ∧ Q x) → ∃ x, P x ∧ ∀ (y : A), P y → x = y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Logic.forall_exists_coincide_unique_domain.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Logic.forall_exists_coincide_unique_domain.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.forall_exists_unique_domain_coincide

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Logic.forall_exists_unique_domain_coincide.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_354) (P : A → Prop),
  (∃ x, P x ∧ ∀ (y : A), P y → x = y) → ∀ (Q : A → Prop), (∀ (x : A), P x → Q x) ↔ ∃ x, P x ∧ Q x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Logic.forall_exists_unique_domain_coincide.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Logic.forall_exists_unique_domain_coincide.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.map_subst

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Logic.map_subst.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_215) (P : A → Sort u_Corelib_Init_Logic_216) (Q : A → Sort u_Corelib_Init_Logic_217)
  (f : (x : A) → P x → Q x) (x y : A) (H : x = y) (z : P x), H ▸ f x z = f y (H ▸ z)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Logic.map_subst.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Logic.map_subst.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.map_subst_map

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.map_subst_map.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_229) (B : Sort u_Corelib_Init_Logic_231) (P : A → Sort u_Corelib_Init_Logic_230)
  (Q : B → Sort u_Corelib_Init_Logic_232) (f : A → B) (g : (x : A) → P x → Q (f x)) (x y : A) (H : x = y) (z : P x),
  ⋯ ▸ g x z = g y (H ▸ z)；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.map_subst_map.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.map_subst_map.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.rew_compose

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.rew_compose.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_254) (P : A → Sort u_Corelib_Init_Logic_255) (x1 x2 x3 : A) (H1 : x1 = x2)
  (H2 : x2 = x3) (y : P x1), H2 ▸ H1 ▸ y = ⋯ ▸ y；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.rew_compose.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.rew_compose.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.rew_const

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Logic.rew_const.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_333) (P : Sort u_Corelib_Init_Logic_335) (x y : A) (e : x = y) (k : P), e ▸ k = k；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Logic.rew_const.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Logic.rew_const.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.rew_ex

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.rew_ex.statement.correspondence

目标：native statement: ∀ (A' : Sort u_Corelib_Init_Logic_558) (x : A') (P : A' → Prop) (Q : (a : A') → P a → Prop),
  (∃ p, Q x p) → ∀ (y : A'), x = y → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.rew_ex.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.rew_ex.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.rew_ex2

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.rew_ex2.statement.correspondence

目标：native statement: ∀ (A' : Sort u_Corelib_Init_Logic_796) (x : A') (P : A' → Prop) (Q R : (a : A') → P a → Prop),
  (∃ x_1, Q x x_1 ∧ R x x_1) → ∀ (y : A'), x = y → True；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.rew_ex2.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.rew_ex2.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.rew_map

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.rew_map.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_192) (B : Sort u_Corelib_Init_Logic_190) (P : B → Sort u_Corelib_Init_Logic_191)
  (f : A → B) (x1 x2 : A) (H : x1 = x2) (y : P (f x1)), H ▸ y = ⋯ ▸ y；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.rew_map.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.rew_map.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.rew_opp_l

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.rew_opp_l.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_101) (P : A → Sort u_Corelib_Init_Logic_102) (x y : A) (H : x = y) (a : P x),
  ⋯ ▸ H ▸ a = a；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.rew_opp_l.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.rew_opp_l.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.rew_opp_r

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.rew_opp_r.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_94) (P : A → Sort u_Corelib_Init_Logic_95) (x y : A) (H : x = y) (a : P y),
  H ▸ ⋯ ▸ a = a；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.rew_opp_r.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.rew_opp_r.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.rew_swap

NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.rew_swap.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_243) (P : A → Sort u_Corelib_Init_Logic_244) (x1 x2 : A) (H : x1 = x2) (y1 : P x1)
  (y2 : P x2), H ▸ y1 = y2 → y1 = ⋯ ▸ y2；范围：all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved

```lean
RocqPending.Corelib.Init.Logic.rew_swap.statement ↔
  NativeBridge.Incremental.Statements.RocqPending.Corelib.Init.Logic.rew_swap.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Logic.unique_existence

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Logic.unique_existence.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Logic_348) (P : A → Prop),
  ((∃ x, P x) ∧ ∀ (x y : A), P x → P y → x = y) ↔ ∃ x, P x ∧ ∀ (y : A), P y → x = y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Logic.unique_existence.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Logic.unique_existence.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.BoolSpec_ind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.BoolSpec_ind.statement.correspondence

目标：native statement: ∀ (P Q : Prop) (f : Bool → Prop),
  (P → f true) → (Q → f false) → ∀ (x : Bool), NativeBridge.Incremental.DatatypeNormalization.boolSpec P Q x → f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.BoolSpec_ind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.BoolSpec_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.BoolSpec_sind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.BoolSpec_sind.statement.correspondence

目标：native statement: ∀ (P Q : Prop) (f : Bool → Prop),
  (P → f true) → (Q → f false) → ∀ (x : Bool), NativeBridge.Incremental.DatatypeNormalization.boolSpec P Q x → f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.BoolSpec_sind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.BoolSpec_sind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.CompOpp_iff

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.CompOpp_iff.statement.correspondence

目标：native statement: ∀ (x x_1 : Ordering), x.swap = x_1 ↔ x = x_1.swap；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.CompOpp_iff.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.CompOpp_iff.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.CompOpp_inj

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.CompOpp_inj.statement.correspondence

目标：native statement: ∀ (x x_1 : Ordering), x.swap = x_1.swap → x = x_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.CompOpp_inj.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.CompOpp_inj.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.CompOpp_involutive

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.CompOpp_involutive.statement.correspondence

目标：native statement: ∀ (x : Ordering), x.swap.swap = x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.CompOpp_involutive.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.CompOpp_involutive.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.CompareSpecT_ind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.CompareSpecT_ind.statement.correspondence

目标：native statement: ∀ (Peq Plt Pgt : Prop)
  (f : (c : Ordering) → PLift (NativeBridge.Incremental.DatatypeNormalization.compareSpec Peq Plt Pgt c) → Prop),
  (∀ (p : Peq), f Ordering.eq { down := p }) →
    (∀ (p : Plt), f Ordering.lt { down := p }) →
      (∀ (p : Pgt), f Ordering.gt { down := p }) →
        ∀ (x : Ordering) (h : PLift (NativeBridge.Incremental.DatatypeNormalization.compareSpec Peq Plt Pgt x)), f x h；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.CompareSpecT_ind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.CompareSpecT_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.CompareSpecT_sind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.CompareSpecT_sind.statement.correspondence

目标：native statement: ∀ (Peq Plt Pgt : Prop)
  (f : (c : Ordering) → PLift (NativeBridge.Incremental.DatatypeNormalization.compareSpec Peq Plt Pgt c) → Prop),
  (∀ (p : Peq), f Ordering.eq { down := p }) →
    (∀ (p : Plt), f Ordering.lt { down := p }) →
      (∀ (p : Pgt), f Ordering.gt { down := p }) →
        ∀ (x : Ordering) (h : PLift (NativeBridge.Incremental.DatatypeNormalization.compareSpec Peq Plt Pgt x)), f x h；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.CompareSpecT_sind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.CompareSpecT_sind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.CompareSpec_ind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.CompareSpec_ind.statement.correspondence

目标：native statement: ∀ (Peq Plt Pgt : Prop) (f : Ordering → Prop),
  (Peq → f Ordering.eq) →
    (Plt → f Ordering.lt) →
      (Pgt → f Ordering.gt) →
        ∀ (x : Ordering), NativeBridge.Incremental.DatatypeNormalization.compareSpec Peq Plt Pgt x → f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.CompareSpec_ind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.CompareSpec_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.CompareSpec_sind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.CompareSpec_sind.statement.correspondence

目标：native statement: ∀ (Peq Plt Pgt : Prop) (f : Ordering → Prop),
  (Peq → f Ordering.eq) →
    (Plt → f Ordering.lt) →
      (Pgt → f Ordering.gt) →
        ∀ (x : Ordering), NativeBridge.Incremental.DatatypeNormalization.compareSpec Peq Plt Pgt x → f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.CompareSpec_sind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.CompareSpec_sind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.Empty_set_ind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.Empty_set_ind.statement.correspondence

目标：native statement: ∀ (f : Empty → Prop) (x : Empty), f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.Empty_set_ind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.Empty_set_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.Empty_set_sind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.Empty_set_sind.statement.correspondence

目标：native statement: ∀ (f : Empty → Prop) (x : Empty), f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.Empty_set_sind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.Empty_set_sind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.andb_prop

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.andb_prop.statement.correspondence

目标：native statement: ∀ (x x_1 : Bool), (x && x_1) = true → x = true ∧ x_1 = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.andb_prop.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.andb_prop.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.andb_true_intro

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.andb_true_intro.statement.correspondence

目标：native statement: ∀ (x x_1 : Bool), x = true ∧ x_1 = true → (x && x_1) = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.andb_true_intro.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.andb_true_intro.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.bool_ind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.bool_ind.statement.correspondence

目标：native statement: ∀ (f : Bool → Prop), f true → f false → ∀ (x : Bool), f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.bool_ind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.bool_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.bool_sind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.bool_sind.statement.correspondence

目标：native statement: ∀ (f : Bool → Prop), f true → f false → ∀ (x : Bool), f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.bool_sind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.bool_sind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.comparison_eq_stable

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.comparison_eq_stable.statement.correspondence

目标：native statement: ∀ (x x_1 : Ordering), ¬¬x = x_1 → x = x_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.comparison_eq_stable.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.comparison_eq_stable.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.comparison_ind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.comparison_ind.statement.correspondence

目标：native statement: ∀ (f : Ordering → Prop), f Ordering.eq → f Ordering.lt → f Ordering.gt → ∀ (x : Ordering), f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.comparison_ind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.comparison_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.comparison_sind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.comparison_sind.statement.correspondence

目标：native statement: ∀ (f : Ordering → Prop), f Ordering.eq → f Ordering.lt → f Ordering.gt → ∀ (x : Ordering), f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.comparison_sind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.comparison_sind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.idProp

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.idProp.statement.correspondence

目标：native statement: ∀ (A : Prop), A → A；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.idProp.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.idProp.statement.native
```

公理闭包：propext

## Corelib.Init.Datatypes.injective_projections

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.injective_projections.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Datatypes_116) (B : Sort u_Corelib_Init_Datatypes_117) (x x_1 : A ×' B),
  x.fst = x_1.fst → x.snd = x_1.snd → x = x_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.injective_projections.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.injective_projections.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.list_ind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.list_ind.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Datatypes_194) (f : List (PLift A) → Prop),
  f [] → (∀ (a : A) (x : List (PLift A)), f x → f ({ down := a } :: x)) → ∀ (x : List (PLift A)), f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.list_ind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.list_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.list_sind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.list_sind.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Datatypes_196) (f : List (PLift A) → Prop),
  f [] → (∀ (a : A) (x : List (PLift A)), f x → f ({ down := a } :: x)) → ∀ (x : List (PLift A)), f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.list_sind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.list_sind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.option_ind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.option_ind.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Datatypes_38) (f : Option (PLift A) → Prop),
  (∀ (a : A), f (some { down := a })) → f none → ∀ (x : Option (PLift A)), f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.option_ind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.option_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.option_sind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.option_sind.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Datatypes_40) (f : Option (PLift A) → Prop),
  (∀ (a : A), f (some { down := a })) → f none → ∀ (x : Option (PLift A)), f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.option_sind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.option_sind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.pair_equal_spec

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.pair_equal_spec.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Datatypes_126) (B : Sort u_Corelib_Init_Datatypes_127) (a1 a2 : A) (b1 b2 : B),
  ⟨a1, b1⟩ = ⟨a2, b2⟩ ↔ a1 = a2 ∧ b1 = b2；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.pair_equal_spec.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.pair_equal_spec.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.prod_ind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.prod_ind.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Datatypes_80) (B : Sort u_Corelib_Init_Datatypes_81) (f : A ×' B → Prop),
  (∀ (a : A) (b : B), f ⟨a, b⟩) → ∀ (x : A ×' B), f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.prod_ind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.prod_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.prod_sind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.prod_sind.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Datatypes_84) (B : Sort u_Corelib_Init_Datatypes_85) (f : A ×' B → Prop),
  (∀ (a : A) (b : B), f ⟨a, b⟩) → ∀ (x : A ×' B), f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.prod_sind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.prod_sind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.reflect_ind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.reflect_ind.statement.correspondence

目标：native statement: ∀ (P : Prop) (f : (b : Bool) → PLift (NativeBridge.Incremental.DatatypeNormalization.boolSpec P (¬P) b) → Prop),
  (∀ (p : P), f true { down := p }) →
    (∀ (n : ¬P), f false { down := n }) →
      ∀ (x : Bool) (h : PLift (NativeBridge.Incremental.DatatypeNormalization.boolSpec P (¬P) x)), f x h；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.reflect_ind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.reflect_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.reflect_sind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.reflect_sind.statement.correspondence

目标：native statement: ∀ (P : Prop) (f : (b : Bool) → PLift (NativeBridge.Incremental.DatatypeNormalization.boolSpec P (¬P) b) → Prop),
  (∀ (p : P), f true { down := p }) →
    (∀ (n : ¬P), f false { down := n }) →
      ∀ (x : Bool) (h : PLift (NativeBridge.Incremental.DatatypeNormalization.boolSpec P (¬P) x)), f x h；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.reflect_sind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.reflect_sind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.result_ind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.result_ind.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Datatypes_68) (E : Sort u_Corelib_Init_Datatypes_69) (f : Except (PLift E) (PLift A) → Prop),
  (∀ (a : A), f (Except.ok { down := a })) →
    (∀ (e : E), f (Except.error { down := e })) → ∀ (x : Except (PLift E) (PLift A)), f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.result_ind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.result_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.result_sind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.result_sind.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Datatypes_72) (E : Sort u_Corelib_Init_Datatypes_73) (f : Except (PLift E) (PLift A) → Prop),
  (∀ (a : A), f (Except.ok { down := a })) →
    (∀ (e : E), f (Except.error { down := e })) → ∀ (x : Except (PLift E) (PLift A)), f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.result_sind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.result_sind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.rew_pair

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.rew_pair.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Datatypes_174) (P : A → Sort u_Corelib_Init_Datatypes_175)
  (Q : A → Sort u_Corelib_Init_Datatypes_176) (x1 x2 : A) (y1 : P x1) (y2 : Q x1) (H : x1 = x2),
  ⟨H ▸ y1, H ▸ y2⟩ = H ▸ ⟨y1, y2⟩；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.rew_pair.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.rew_pair.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.sum_ind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.sum_ind.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Datatypes_54) (B : Sort u_Corelib_Init_Datatypes_55) (f : A ⊕' B → Prop),
  (∀ (a : A), f (PSum.inl a)) → (∀ (b : B), f (PSum.inr b)) → ∀ (x : A ⊕' B), f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.sum_ind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.sum_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.sum_sind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.sum_sind.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Datatypes_58) (B : Sort u_Corelib_Init_Datatypes_59) (f : A ⊕' B → Prop),
  (∀ (a : A), f (PSum.inl a)) → (∀ (b : B), f (PSum.inr b)) → ∀ (x : A ⊕' B), f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.sum_sind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.sum_sind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.surjective_pairing

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.surjective_pairing.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Datatypes_108) (B : Sort u_Corelib_Init_Datatypes_109) (x : A ×' B), x = ⟨x.fst, x.snd⟩；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.surjective_pairing.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.surjective_pairing.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.unit_ind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.unit_ind.statement.correspondence

目标：native statement: ∀ (f : Unit → Prop), f () → ∀ (x : Unit), f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.unit_ind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.unit_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Datatypes.unit_sind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.unit_sind.statement.correspondence

目标：native statement: ∀ (f : Unit → Prop), f () → ∀ (x : Unit), f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Datatypes.unit_sind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Datatypes.unit_sind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.BinNums.PosDef.Pos.mask_ind

NativeBridge.Incremental.Statements.Rocq.Corelib.BinNums.PosDef.Pos.mask_ind.statement.correspondence

目标：native statement: ∀ (f : Option Nat → Prop), f (some 0) → (∀ (n : { n // 0 < n }), f (some n.val)) → f none → ∀ (m : Option Nat), f m；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.BinNums.PosDef.Pos.mask_ind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.BinNums.PosDef.Pos.mask_ind.statement.native
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.BinNums.PosDef.Pos.mask_sind

NativeBridge.Incremental.Statements.Rocq.Corelib.BinNums.PosDef.Pos.mask_sind.statement.correspondence

目标：native statement: ∀ (f : Option Nat → Prop), f (some 0) → (∀ (n : { n // 0 < n }), f (some n.val)) → f none → ∀ (m : Option Nat), f m；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.BinNums.PosDef.Pos.mask_sind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.BinNums.PosDef.Pos.mask_sind.statement.native
```

公理闭包：propext, Classical.choice, Quot.sound

## Corelib.Lists.ListDef.Forall_ind

NativeBridge.Incremental.Statements.Rocq.Corelib.Lists.ListDef.Forall_ind.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Lists_ListDef_53) (P : A → Prop) (f : List A → Prop),
  f [] →
    (∀ (x : A) (xs : List A), P x → (∀ (x : A), x ∈ xs → P x) → f xs → f (x :: xs)) →
      ∀ (xs : List A), (∀ (x : A), x ∈ xs → P x) → f xs；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Lists.ListDef.Forall_ind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Lists.ListDef.Forall_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Lists.ListDef.Forall_sind

NativeBridge.Incremental.Statements.Rocq.Corelib.Lists.ListDef.Forall_sind.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Lists_ListDef_53) (P : A → Prop) (f : List A → Prop),
  f [] →
    (∀ (x : A) (xs : List A), P x → (∀ (x : A), x ∈ xs → P x) → f xs → f (x :: xs)) →
      ∀ (xs : List A), (∀ (x : A), x ∈ xs → P x) → f xs；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Lists.ListDef.Forall_sind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Lists.ListDef.Forall_sind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Peano.f_equal_pred

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Peano.f_equal_pred.statement.correspondence

目标：native statement: ∀ (n n_1 : Nat), n = n_1 → n - 1 = n_1 - 1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Peano.f_equal_pred.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Peano.f_equal_pred.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Peano.le_pred

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Peano.le_pred.statement.correspondence

目标：native statement: ∀ (n n_1 : Nat), n ≤ n_1 → n - 1 ≤ n_1 - 1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Peano.le_pred.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Peano.le_pred.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Peano.nat_rect_plus

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Peano.nat_rect_plus.statement.correspondence

目标：native statement: ∀ (n n_1 : Nat) (A : Sort u_Corelib_Init_Peano_98) (f : A → A) (x : A),
  Nat.rec x (fun x => f) (n + n_1) = Nat.rec (Nat.rec x (fun x => f) n_1) (fun x => f) n；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Peano.nat_rect_plus.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Peano.nat_rect_plus.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Peano.nat_rect_succ_r

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Peano.nat_rect_succ_r.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Peano_92) (f : A → A) (x : A) (n : Nat),
  f (Nat.rec x (fun x => f) n) = Nat.rec (f x) (fun x => f) n；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Peano.nat_rect_succ_r.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Peano.nat_rect_succ_r.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Peano.pred_Sn

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Peano.pred_Sn.statement.correspondence

目标：native statement: ∀ (n : Nat), n = n.succ - 1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Peano.pred_Sn.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Peano.pred_Sn.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_existT2_curried

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_existT2_curried.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_813) (P : A → Sort u_Corelib_Init_Specif_814) (Q : A → Sort u_Corelib_Init_Specif_815)
  (u1 v1 : A) (u2 : P u1) (v2 : P v1) (u3 : Q u1) (v3 : Q v1) (p : u1 = v1),
  p ▸ u2 = v2 → p ▸ u3 = v3 → ⟨u1, ⟨u2, u3⟩⟩ = ⟨v1, ⟨v2, v3⟩⟩；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.eq_existT2_curried.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_existT2_curried.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_existT2_l

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_existT2_l.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_847) (P : A → Sort u_Corelib_Init_Specif_848) (Q : A → Sort u_Corelib_Init_Specif_849)
  (u1 : A) (u2 : P u1) (u3 : Q u1) (x : (x : A) ×' P x ×' Q x) (p : u1 = x.fst),
  p ▸ u2 = x.snd.fst → p ▸ u3 = x.snd.snd → ⟨u1, ⟨u2, u3⟩⟩ = x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.eq_existT2_l.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_existT2_l.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_existT2_r

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_existT2_r.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_865) (P : A → Sort u_Corelib_Init_Specif_866) (Q : A → Sort u_Corelib_Init_Specif_867)
  (x : (x : A) ×' P x ×' Q x) (v1 : A) (v2 : P v1) (v3 : Q v1) (p : x.fst = v1),
  p ▸ x.snd.fst = v2 → p ▸ x.snd.snd = v3 → x = ⟨v1, ⟨v2, v3⟩⟩；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.eq_existT2_r.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_existT2_r.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_existT2_uncurried

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_existT2_uncurried.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_776) (P : A → Sort u_Corelib_Init_Specif_777) (Q : A → Sort u_Corelib_Init_Specif_778)
  (u1 v1 : A) (u2 : P u1) (v2 : P v1) (u3 : Q u1) (v3 : Q v1),
  (∃ h, h ▸ u2 = v2 ∧ h ▸ u3 = v3) → ⟨u1, ⟨u2, u3⟩⟩ = ⟨v1, ⟨v2, v3⟩⟩；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.eq_existT2_uncurried.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_existT2_uncurried.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_existT_curried

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_existT_curried.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_257) (P : A → Sort u_Corelib_Init_Specif_258) (u1 v1 : A) (u2 : P u1) (v2 : P v1)
  (p : u1 = v1), p ▸ u2 = v2 → ⟨u1, u2⟩ = ⟨v1, v2⟩；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.eq_existT_curried.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_existT_curried.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_existT_l

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_existT_l.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_337) (P : A → Sort u_Corelib_Init_Specif_338) (u1 : A) (u2 : P u1)
  (x : (a : A) ×' P a) (p : u1 = x.fst), p ▸ u2 = x.snd → ⟨u1, u2⟩ = x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.eq_existT_l.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_existT_l.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_existT_r

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_existT_r.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_349) (P : A → Sort u_Corelib_Init_Specif_350) (x : (a : A) ×' P a) (v1 : A)
  (v2 : P v1) (p : x.fst = v1), p ▸ x.snd = v2 → x = ⟨v1, v2⟩；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.eq_existT_r.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_existT_r.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_existT_uncurried

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_existT_uncurried.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_232) (P : A → Sort u_Corelib_Init_Specif_233) (u1 v1 : A) (u2 : P u1) (v2 : P v1),
  (∃ h, h ▸ u2 = v2) → ⟨u1, u2⟩ = ⟨v1, v2⟩；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.eq_existT_uncurried.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_existT_uncurried.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sigT

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_sigT.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_326) (P : A → Sort u_Corelib_Init_Specif_327) (x x_1 : (a : A) ×' P a)
  (p : x.fst = x_1.fst), p ▸ x.snd = x_1.snd → x = x_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.eq_sigT.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_sigT.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sigT2

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_sigT2.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_831) (P : A → Sort u_Corelib_Init_Specif_832) (Q : A → Sort u_Corelib_Init_Specif_833)
  (x x_1 : (x : A) ×' P x ×' Q x) (p : x.fst = x_1.fst),
  p ▸ x.snd.fst = x_1.snd.fst → p ▸ x.snd.snd = x_1.snd.snd → x = x_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.eq_sigT2.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_sigT2.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sigT2_hprop

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_sigT2_hprop.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_884) (P : A → Sort u_Corelib_Init_Specif_890)
  (Q : A → Sort u_Corelib_Init_Specif_887),
  (∀ (x : A) (p q : Q x), p = q) →
    ∀ (x x_1 : (x : A) ×' P x ×' Q x), ⟨x.fst, x.snd.fst⟩ = ⟨x_1.fst, x_1.snd.fst⟩ → x = x_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.eq_sigT2_hprop.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_sigT2_hprop.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sigT2_hprop_iff

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_sigT2_hprop_iff.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_1072) (P : A → Sort u_Corelib_Init_Specif_1078)
  (Q : A → Sort u_Corelib_Init_Specif_1075),
  (∀ (x : A) (p q : Q x), p = q) →
    ∀ (x x_1 : (x : A) ×' P x ×' Q x), x = x_1 ↔ ⟨x.fst, x.snd.fst⟩ = ⟨x_1.fst, x_1.snd.fst⟩；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.eq_sigT2_hprop_iff.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_sigT2_hprop_iff.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sigT2_nondep

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_sigT2_nondep.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_1093) (B : Sort u_Corelib_Init_Specif_1094) (C : Sort u_Corelib_Init_Specif_1095)
  (x x_1 : (_ : A) ×' B ×' C), x.fst = x_1.fst → x.snd.fst = x_1.snd.fst → x.snd.snd = x_1.snd.snd → x = x_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.eq_sigT2_nondep.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_sigT2_nondep.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sigT2_uncurried

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_sigT2_uncurried.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_797) (P : A → Sort u_Corelib_Init_Specif_798) (Q : A → Sort u_Corelib_Init_Specif_799)
  (x x_1 : (x : A) ×' P x ×' Q x), (∃ h, h ▸ x.snd.fst = x_1.snd.fst ∧ h ▸ x.snd.snd = x_1.snd.snd) → x = x_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.eq_sigT2_uncurried.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_sigT2_uncurried.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sigT2_uncurried_iff

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_sigT2_uncurried_iff.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_904) (P : A → Sort u_Corelib_Init_Specif_905) (Q : A → Sort u_Corelib_Init_Specif_908)
  (x x_1 : (x : A) ×' P x ×' Q x), x = x_1 ↔ ∃ h, h ▸ x.snd.fst = x_1.snd.fst ∧ h ▸ x.snd.snd = x_1.snd.snd；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.eq_sigT2_uncurried_iff.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_sigT2_uncurried_iff.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sigT_hprop

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_sigT_hprop.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_362) (P : A → Sort u_Corelib_Init_Specif_365),
  (∀ (x : A) (p q : P x), p = q) → ∀ (x x_1 : (a : A) ×' P a), x.fst = x_1.fst → x = x_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.eq_sigT_hprop.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_sigT_hprop.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sigT_hprop_iff

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_sigT_hprop_iff.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_492) (P : A → Sort u_Corelib_Init_Specif_495),
  (∀ (x : A) (p q : P x), p = q) → ∀ (x x_1 : (a : A) ×' P a), x = x_1 ↔ x.fst = x_1.fst；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.eq_sigT_hprop_iff.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_sigT_hprop_iff.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sigT_nondep

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_sigT_nondep.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_507) (B : Sort u_Corelib_Init_Specif_508) (x x_1 : (_ : A) ×' B),
  x.fst = x_1.fst → x.snd = x_1.snd → x = x_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.eq_sigT_nondep.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_sigT_nondep.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sigT_uncurried

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_sigT_uncurried.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_246) (P : A → Sort u_Corelib_Init_Specif_247) (x x_1 : (a : A) ×' P a),
  (∃ h, h ▸ x.snd = x_1.snd) → x = x_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.eq_sigT_uncurried.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_sigT_uncurried.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sigT_uncurried_iff

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_sigT_uncurried_iff.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_375) (P : A → Sort u_Corelib_Init_Specif_376) (x x_1 : (a : A) ×' P a),
  x = x_1 ↔ ∃ h, h ▸ x.snd = x_1.snd；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.eq_sigT_uncurried_iff.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_sigT_uncurried_iff.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sig_hprop

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_sig_hprop.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_684) (P : A → Prop),
  (∀ (x : A) (p q : P x), p = q) → ∀ (x x_1 : { a // P a }), x.val = x_1.val → x = x_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.eq_sig_hprop.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_sig_hprop.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.eq_sig_hprop_iff

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_sig_hprop_iff.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_702) (P : A → Prop),
  (∀ (x : A) (p q : P x), p = q) → ∀ (x x_1 : { a // P a }), x = x_1 ↔ x.val = x_1.val；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.eq_sig_hprop_iff.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.eq_sig_hprop_iff.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.ex2_of_sig2

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.ex2_of_sig2.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_123) (P Q : A → Prop) (s : { x // P x ∧ Q x }), ∃ x, P x ∧ Q x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.ex2_of_sig2.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.ex2_of_sig2.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.ex2_of_sigT2

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.ex2_of_sigT2.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_127) (P Q : A → Prop) (x : (x : A) ×' P x ×' Q x), ∃ x, P x ∧ Q x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.ex2_of_sigT2.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.ex2_of_sigT2.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.ex_of_sig

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.ex_of_sig.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_115) (P : A → Prop) (x : Subtype P), ∃ x, P x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.ex_of_sig.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.ex_of_sig.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.ex_of_sigT

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.ex_of_sigT.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_119) (P : A → Prop) (x : PSigma P), ∃ x, P x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.ex_of_sigT.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.ex_of_sigT.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.exists_to_inhabited_sig

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.exists_to_inhabited_sig.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_179) (P : A → Prop), (∃ x, P x) → Nonempty { x // P x }；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.exists_to_inhabited_sig.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.exists_to_inhabited_sig.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.inhabited_sig_to_exists

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.inhabited_sig_to_exists.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_189) (P : A → Prop), Nonempty { x // P x } → ∃ x, P x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.inhabited_sig_to_exists.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.inhabited_sig_to_exists.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.prod_sigT_prod

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.prod_sigT_prod.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_194) (B : Sort u_Corelib_Init_Specif_195) (x : A ×' B), ⟨x.fst, x.snd⟩ = x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.prod_sigT_prod.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.prod_sigT_prod.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.proj1_sig_eq

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.proj1_sig_eq.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_534) (P : A → Prop) (x x_1 : { a // P a }), x = x_1 → x.val = x_1.val；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.proj1_sig_eq.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.proj1_sig_eq.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.proj2_sig

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.proj2_sig.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_54) (P : A → Prop) (x : Subtype P), P x.val；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.proj2_sig.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.proj2_sig.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.projT1_eq

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.projT1_eq.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_211) (P : A → Sort u_Corelib_Init_Specif_212) (x x_1 : (a : A) ×' P a),
  x = x_1 → x.fst = x_1.fst；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.projT1_eq.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.projT1_eq.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.projT1_of_sigT2_eq

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.projT1_of_sigT2_eq.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_739) (P : A → Sort u_Corelib_Init_Specif_740) (Q : A → Sort u_Corelib_Init_Specif_741)
  (x x_1 : (x : A) ×' P x ×' Q x), x = x_1 → x.fst = x_1.fst；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.projT1_of_sigT2_eq.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.projT1_of_sigT2_eq.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.sig2_ind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sig2_ind.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_22) (P Q : A → Prop) (f : { x // P x ∧ Q x } → Prop),
  (∀ (x : A) (p : P x) (q : Q x), f ⟨x, ⋯⟩) → ∀ (s : { x // P x ∧ Q x }), f s；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.sig2_ind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sig2_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.sig2_sind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sig2_sind.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_24) (P Q : A → Prop) (f : { x // P x ∧ Q x } → Prop),
  (∀ (x : A) (p : P x) (q : Q x), f ⟨x, ⋯⟩) → ∀ (s : { x // P x ∧ Q x }), f s；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.sig2_sind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sig2_sind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.sigT2_eta

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sigT2_eta.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_153) (P : A → Sort u_Corelib_Init_Specif_154) (Q : A → Sort u_Corelib_Init_Specif_157)
  (x : (x : A) ×' P x ×' Q x), x = ⟨x.fst, ⟨x.snd.fst, x.snd.snd⟩⟩；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.sigT2_eta.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sigT2_eta.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.sigT2_ind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sigT2_ind.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_45) (P : A → Sort u_Corelib_Init_Specif_46) (Q : A → Sort u_Corelib_Init_Specif_47)
  (f : (x : A) ×' P x ×' Q x → Prop),
  (∀ (x : A) (p : P x) (q : Q x), f ⟨x, ⟨p, q⟩⟩) → ∀ (x : (x : A) ×' P x ×' Q x), f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.sigT2_ind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sigT2_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.sigT2_sind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sigT2_sind.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_51) (P : A → Sort u_Corelib_Init_Specif_52) (Q : A → Sort u_Corelib_Init_Specif_53)
  (f : (x : A) ×' P x ×' Q x → Prop),
  (∀ (x : A) (p : P x) (q : Q x), f ⟨x, ⟨p, q⟩⟩) → ∀ (x : (x : A) ×' P x ×' Q x), f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.sigT2_sind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sigT2_sind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.sigT_eta

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sigT_eta.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_134) (P : A → Sort u_Corelib_Init_Specif_135) (x : (a : A) ×' P a), x = ⟨x.fst, x.snd⟩；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.sigT_eta.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sigT_eta.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.sigT_ind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sigT_ind.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_31) (P : A → Sort u_Corelib_Init_Specif_32) (f : PSigma P → Prop),
  (∀ (x : A) (p : P x), f ⟨x, p⟩) → ∀ (x : PSigma P), f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.sigT_ind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sigT_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.sigT_of_sigT2_eq

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sigT_of_sigT2_eq.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_725) (P : A → Sort u_Corelib_Init_Specif_726) (Q : A → Sort u_Corelib_Init_Specif_727)
  (x x_1 : (x : A) ×' P x ×' Q x), x = x_1 → ⟨x.fst, x.snd.fst⟩ = ⟨x_1.fst, x_1.snd.fst⟩；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.sigT_of_sigT2_eq.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sigT_of_sigT2_eq.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.sigT_prod_sigT

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sigT_prod_sigT.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_194) (B : Sort u_Corelib_Init_Specif_195) (x : (_ : A) ×' B), ⟨x.fst, x.snd⟩ = x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.sigT_prod_sigT.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sigT_prod_sigT.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.sigT_sind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sigT_sind.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_35) (P : A → Sort u_Corelib_Init_Specif_36) (f : PSigma P → Prop),
  (∀ (x : A) (p : P x), f ⟨x, p⟩) → ∀ (x : PSigma P), f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.sigT_sind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sigT_sind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.sig_ind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sig_ind.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_15) (P : A → Prop) (f : Subtype P → Prop),
  (∀ (x : A) (p : P x), f ⟨x, p⟩) → ∀ (x : Subtype P), f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.sig_ind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sig_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.sig_sind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sig_sind.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_17) (P : A → Prop) (f : Subtype P → Prop),
  (∀ (x : A) (p : P x), f ⟨x, p⟩) → ∀ (x : Subtype P), f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.sig_sind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sig_sind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.sumbool_ind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sumbool_ind.statement.correspondence

目标：native statement: ∀ (A B : Prop) (f : A ⊕' B → Prop), (∀ (a : A), f (PSum.inl a)) → (∀ (b : B), f (PSum.inr b)) → ∀ (x : A ⊕' B), f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.sumbool_ind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sumbool_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.sumbool_sind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sumbool_sind.statement.correspondence

目标：native statement: ∀ (A B : Prop) (f : A ⊕' B → Prop), (∀ (a : A), f (PSum.inl a)) → (∀ (b : B), f (PSum.inr b)) → ∀ (x : A ⊕' B), f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.sumbool_sind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sumbool_sind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.sumor_ind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sumor_ind.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_1399) (B : Prop) (f : A ⊕' B → Prop),
  (∀ (a : A), f (PSum.inl a)) → (∀ (b : B), f (PSum.inr b)) → ∀ (x : A ⊕' B), f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.sumor_ind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sumor_ind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Init.Specif.sumor_sind

NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sumor_sind.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_Init_Specif_1401) (B : Prop) (f : A ⊕' B → Prop),
  (∀ (a : A), f (PSum.inl a)) → (∀ (b : B), f (PSum.inr b)) → ∀ (x : A ⊕' B), f x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Init.Specif.sumor_sind.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Init.Specif.sumor_sind.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.addFb

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.addFb.statement.correspondence

目标：native statement: ∀ (b : Bool), (false ^^ b) = b；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.addFb.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.addFb.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.addKb

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.addKb.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (b ^^ (b ^^ b_1)) = b_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.addKb.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.addKb.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.addNb

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.addNb.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (!b ^^ b_1) = !(b ^^ b_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.addNb.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.addNb.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.addTb

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.addTb.statement.correspondence

目标：native statement: ∀ (b : Bool), (true ^^ b) = !b；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.addTb.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.addTb.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.addbA

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.addbA.statement.correspondence

目标：native statement: ∀ (b b_1 b_2 : Bool), (b ^^ (b_1 ^^ b_2)) = (b ^^ b_1 ^^ b_2)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.addbA.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.addbA.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.addbAC

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.addbAC.statement.correspondence

目标：native statement: ∀ (b b_1 b_2 : Bool), (b ^^ b_1 ^^ b_2) = (b ^^ b_2 ^^ b_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.addbAC.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.addbAC.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.addbACA

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.addbACA.statement.correspondence

目标：native statement: ∀ (b b_1 b_2 b_3 : Bool), (b ^^ b_1 ^^ (b_2 ^^ b_3)) = (b ^^ b_2 ^^ (b_1 ^^ b_3))；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.addbACA.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.addbACA.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.addbC

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.addbC.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (b ^^ b_1) = (b_1 ^^ b)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.addbC.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.addbC.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.addbCA

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.addbCA.statement.correspondence

目标：native statement: ∀ (b b_1 b_2 : Bool), (b ^^ (b_1 ^^ b_2)) = (b_1 ^^ (b ^^ b_2))；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.addbCA.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.addbCA.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.addbF

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.addbF.statement.correspondence

目标：native statement: ∀ (b : Bool), (b ^^ false) = b；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.addbF.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.addbF.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.addbI

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.addbI.statement.correspondence

目标：native statement: ∀ (b b_1 b_2 : Bool), (b ^^ b_1) = (b ^^ b_2) → b_1 = b_2；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.addbI.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.addbI.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.addbK

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.addbK.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (b_1 ^^ b ^^ b) = b_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.addbK.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.addbK.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.addbN

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.addbN.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (b ^^ !b_1) = !(b ^^ b_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.addbN.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.addbN.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.addbT

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.addbT.statement.correspondence

目标：native statement: ∀ (b : Bool), (b ^^ true) = !b；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.addbT.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.addbT.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.addbb

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.addbb.statement.correspondence

目标：native statement: ∀ (b : Bool), (b ^^ b) = false；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.addbb.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.addbb.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.andFb

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andFb.statement.correspondence

目标：native statement: ∀ (b : Bool), (false && b) = false；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.andFb.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andFb.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.andKb

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andKb.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (b || b_1 && b) = b；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.andKb.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andKb.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.andNb

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andNb.statement.correspondence

目标：native statement: ∀ (b : Bool), (!b && b) = false；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.andNb.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andNb.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.andTb

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andTb.statement.correspondence

目标：native statement: ∀ (b : Bool), (true && b) = b；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.andTb.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andTb.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.andbA

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andbA.statement.correspondence

目标：native statement: ∀ (b b_1 b_2 : Bool), (b && (b_1 && b_2)) = (b && b_1 && b_2)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.andbA.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andbA.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.andbAC

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andbAC.statement.correspondence

目标：native statement: ∀ (b b_1 b_2 : Bool), (b && b_1 && b_2) = (b && b_2 && b_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.andbAC.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andbAC.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.andbACA

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andbACA.statement.correspondence

目标：native statement: ∀ (b b_1 b_2 b_3 : Bool), (b && b_1 && (b_2 && b_3)) = (b && b_2 && (b_1 && b_3))；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.andbACA.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andbACA.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.andbC

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andbC.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (b && b_1) = (b_1 && b)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.andbC.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andbC.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.andbCA

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andbCA.statement.correspondence

目标：native statement: ∀ (b b_1 b_2 : Bool), (b && (b_1 && b_2)) = (b_1 && (b && b_2))；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.andbCA.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andbCA.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.andbF

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andbF.statement.correspondence

目标：native statement: ∀ (b : Bool), (b && false) = false；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.andbF.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andbF.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.andbK

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andbK.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (b && b_1 || b) = b；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.andbK.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andbK.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.andbN

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andbN.statement.correspondence

目标：native statement: ∀ (b : Bool), (b && !b) = false；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.andbN.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andbN.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.andbT

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andbT.statement.correspondence

目标：native statement: ∀ (b : Bool), (b && true) = b；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.andbT.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andbT.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.andb_id2l

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andb_id2l.statement.correspondence

目标：native statement: ∀ (b b_1 b_2 : Bool), (b = true → b_1 = b_2) → (b && b_1) = (b && b_2)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.andb_id2l.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andb_id2l.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.andb_id2r

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andb_id2r.statement.correspondence

目标：native statement: ∀ (b b_1 b_2 : Bool), (b_1 = true → b = b_2) → (b && b_1) = (b_2 && b_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.andb_id2r.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andb_id2r.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.andb_idl

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andb_idl.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (b_1 = true → b = true) → (b && b_1) = b_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.andb_idl.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andb_idl.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.andb_idr

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andb_idr.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (b = true → b_1 = true) → (b && b_1) = b；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.andb_idr.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andb_idr.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.andbb

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andbb.statement.correspondence

目标：native statement: ∀ (b : Bool), (b && b) = b；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.andbb.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.andbb.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.appP

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.appP.statement.correspondence

目标：native statement: ∀ (P Q : Prop) (b : Bool), (P ↔ b = true) → (Q ↔ b = true) → P → Q；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.appP.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.appP.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.contra

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contra.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (b = true → b_1 = true) → (!b_1) = true → (!b) = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.contra.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contra.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.contraFF

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraFF.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (b = true → b_1 = true) → b_1 = false → b = false；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.contraFF.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraFF.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.contraFN

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraFN.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (b = true → b_1 = true) → b_1 = false → (!b) = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.contraFN.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraFN.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.contraFT

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraFT.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), ((!b) = true → b_1 = true) → b_1 = false → b = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.contraFT.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraFT.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.contraFnot

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraFnot.statement.correspondence

目标：native statement: ∀ (P : Prop) (b : Bool), (P → b = true) → b = false → ¬P；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.contraFnot.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraFnot.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.contraL

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraL.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (b = true → (!b_1) = true) → b_1 = true → (!b) = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.contraL.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraL.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.contraLR

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraLR.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), ((!b) = true → (!b_1) = true) → b_1 = true → b = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.contraLR.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraLR.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.contraNF

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraNF.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (b = true → b_1 = true) → (!b_1) = true → b = false；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.contraNF.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraNF.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.contraNN

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraNN.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (b = true → b_1 = true) → (!b_1) = true → (!b) = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.contraNN.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraNN.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.contraNT

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraNT.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), ((!b) = true → b_1 = true) → (!b_1) = true → b = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.contraNT.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraNT.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.contraNnot

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraNnot.statement.correspondence

目标：native statement: ∀ (P : Prop) (b : Bool), (P → b = true) → (!b) = true → ¬P；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.contraNnot.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraNnot.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.contraPF

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraPF.statement.correspondence

目标：native statement: ∀ (P : Prop) (b : Bool), (b = true → ¬P) → P → b = false；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.contraPF.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraPF.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.contraPN

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraPN.statement.correspondence

目标：native statement: ∀ (P : Prop) (b : Bool), (b = true → ¬P) → P → (!b) = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.contraPN.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraPN.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.contraPT

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraPT.statement.correspondence

目标：native statement: ∀ (P : Prop) (b : Bool), ((!b) = true → ¬P) → P → b = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.contraPT.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraPT.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.contraR

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraR.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), ((!b) = true → b_1 = true) → (!b_1) = true → b = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.contraR.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraR.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.contraT

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraT.statement.correspondence

目标：native statement: ∀ (b : Bool), ((!b) = true → false = true) → b = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.contraT.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraT.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.contraTF

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraTF.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (b = true → (!b_1) = true) → b_1 = true → b = false；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.contraTF.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraTF.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.contraTN

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraTN.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (b = true → (!b_1) = true) → b_1 = true → (!b) = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.contraTN.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraTN.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.contraTT

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraTT.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), ((!b) = true → (!b_1) = true) → b_1 = true → b = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.contraTT.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraTT.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.contraTnot

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraTnot.statement.correspondence

目标：native statement: ∀ (b : Bool) (P : Prop), (P → (!b) = true) → b = true → ¬P；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.contraTnot.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contraTnot.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.contra_notF

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contra_notF.statement.correspondence

目标：native statement: ∀ (P : Prop) (b : Bool), (b = true → P) → ¬P → b = false；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.contra_notF.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contra_notF.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.contra_notN

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contra_notN.statement.correspondence

目标：native statement: ∀ (P : Prop) (b : Bool), (b = true → P) → ¬P → (!b) = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.contra_notN.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contra_notN.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.contra_notT

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contra_notT.statement.correspondence

目标：native statement: ∀ (P : Prop) (b : Bool), ((!b) = true → P) → ¬P → b = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.contra_notT.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.contra_notT.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.decPcases

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.decPcases.statement.correspondence

目标：native statement: ∀ (P : Prop) (b : Bool), (P ↔ b = true) → if b = true then P else ¬P；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.decPcases.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.decPcases.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.elimF

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.elimF.statement.correspondence

目标：native statement: ∀ (P : Prop) (b : Bool), (P ↔ b = true) → b = false → ¬P；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.elimF.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.elimF.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.elimFn

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.elimFn.statement.correspondence

目标：native statement: ∀ (P : Prop) (b : Bool), (P ↔ (!b) = true) → b = false → P；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.elimFn.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.elimFn.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.elimN

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.elimN.statement.correspondence

目标：native statement: ∀ (P : Prop) (b : Bool), (P ↔ b = true) → (!b) = true → ¬P；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.elimN.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.elimN.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.elimNTF

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.elimNTF.statement.correspondence

目标：native statement: ∀ (P : Prop) (b b_1 : Bool), (P ↔ b = true) → (!b) = b_1 → if b_1 = true then ¬P else P；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.elimNTF.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.elimNTF.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.elimNf

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.elimNf.statement.correspondence

目标：native statement: ∀ (P : Prop) (b : Bool), (P ↔ b = true) → (!b) = false → P；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.elimNf.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.elimNf.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.elimT

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.elimT.statement.correspondence

目标：native statement: ∀ (P : Prop) (b : Bool), (P ↔ b = true) → b = true → P；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.elimT.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.elimT.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.elimTF

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.elimTF.statement.correspondence

目标：native statement: ∀ (P : Prop) (b b_1 : Bool), (P ↔ b = true) → b = b_1 → if b_1 = true then P else ¬P；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.elimTF.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.elimTF.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.elimTFn

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.elimTFn.statement.correspondence

目标：native statement: ∀ (P : Prop) (b b_1 : Bool), (P ↔ (!b) = true) → b = b_1 → if b_1 = true then ¬P else P；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.elimTFn.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.elimTFn.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.elimTn

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.elimTn.statement.correspondence

目标：native statement: ∀ (P : Prop) (b : Bool), (P ↔ (!b) = true) → b = true → ¬P；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.elimTn.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.elimTn.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.eqbLR

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.eqbLR.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), b = b_1 → b = true → b_1 = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.eqbLR.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.eqbLR.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.eqbRL

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.eqbRL.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), b = b_1 → b_1 = true → b = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.eqbRL.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.eqbRL.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.equivPif

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.equivPif.statement.correspondence

目标：native statement: ∀ (P Q : Prop) (b : Bool), (P ↔ b = true) → (Q → P) → (P → Q) → if b = true then Q else ¬Q；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.equivPif.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.equivPif.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.equivPifn

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.equivPifn.statement.correspondence

目标：native statement: ∀ (P Q : Prop) (b : Bool), (P ↔ (!b) = true) → (Q → P) → (P → Q) → if b = true then ¬Q else Q；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.equivPifn.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.equivPifn.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.fun_if

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.fun_if.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_ssr_ssrbool_178) (B : Sort u_Corelib_ssr_ssrbool_179) (f : A → B) (b : Bool) (vT vF : A),
  f (if b = true then vT else vF) = if b = true then f vT else f vF；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.fun_if.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.fun_if.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.ifE

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.ifE.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_ssr_ssrbool_178) (b : Bool) (vT vF : A),
  (if b = true then vT else vF) = if b = true then vT else vF；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.ifE.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.ifE.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.ifF

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.ifF.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_ssr_ssrbool_178) (b : Bool) (vT vF : A), b = false → (if b = true then vT else vF) = vF；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.ifF.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.ifF.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.ifN

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.ifN.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_ssr_ssrbool_178) (b : Bool) (vT vF : A), (!b) = true → (if b = true then vT else vF) = vF；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.ifN.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.ifN.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.ifT

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.ifT.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_ssr_ssrbool_178) (b : Bool) (vT vF : A), b = true → (if b = true then vT else vF) = vT；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.ifT.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.ifT.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.if_neg

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.if_neg.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_ssr_ssrbool_178) (b : Bool) (vT vF : A),
  (if (!b) = true then vT else vF) = if b = true then vF else vT；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.if_neg.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.if_neg.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.if_same

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.if_same.statement.correspondence

目标：native statement: ∀ (A : Sort u_Corelib_ssr_ssrbool_178) (b : Bool) (vT : A), (if b = true then vT else vT) = vT；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.if_same.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.if_same.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.implyFb

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.implyFb.statement.correspondence

目标：native statement: ∀ (b : Bool), (!false || b) = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.implyFb.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.implyFb.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.implyNb

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.implyNb.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (!!b || b_1) = (b || b_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.implyNb.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.implyNb.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.implyTb

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.implyTb.statement.correspondence

目标：native statement: ∀ (b : Bool), (!true || b) = b；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.implyTb.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.implyTb.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.implybE

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.implybE.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (!b || b_1) = (!b || b_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.implybE.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.implybE.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.implybF

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.implybF.statement.correspondence

目标：native statement: ∀ (b : Bool), (!b || false) = !b；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.implybF.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.implybF.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.implybN

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.implybN.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (!b || !b_1) = (!b_1 || !b)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.implybN.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.implybN.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.implybNN

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.implybNN.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (!!b || !b_1) = (!b_1 || b)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.implybNN.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.implybNN.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.implybT

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.implybT.statement.correspondence

目标：native statement: ∀ (b : Bool), (!b || true) = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.implybT.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.implybT.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.implyb_id2l

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.implyb_id2l.statement.correspondence

目标：native statement: ∀ (b b_1 b_2 : Bool), (b = true → b_1 = b_2) → (!b || b_1) = (!b || b_2)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.implyb_id2l.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.implyb_id2l.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.implyb_idl

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.implyb_idl.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), ((!b) = true → b_1 = true) → (!b || b_1) = b_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.implyb_idl.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.implyb_idl.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.implyb_idr

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.implyb_idr.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (b_1 = true → (!b) = true) → (!b || b_1) = !b；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.implyb_idr.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.implyb_idr.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.implybb

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.implybb.statement.correspondence

目标：native statement: ∀ (b : Bool), (!b || b) = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.implybb.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.implybb.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.introF

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.introF.statement.correspondence

目标：native statement: ∀ (P : Prop) (b : Bool), (P ↔ b = true) → ¬P → b = false；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.introF.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.introF.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.introFn

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.introFn.statement.correspondence

目标：native statement: ∀ (P : Prop) (b : Bool), (P ↔ (!b) = true) → P → b = false；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.introFn.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.introFn.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.introN

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.introN.statement.correspondence

目标：native statement: ∀ (P : Prop) (b : Bool), (P ↔ b = true) → ¬P → (!b) = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.introN.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.introN.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.introNTF

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.introNTF.statement.correspondence

目标：native statement: ∀ (P : Prop) (b b_1 : Bool), (P ↔ b = true) → (if b_1 = true then ¬P else P) → (!b) = b_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.introNTF.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.introNTF.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.introNf

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.introNf.statement.correspondence

目标：native statement: ∀ (P : Prop) (b : Bool), (P ↔ b = true) → P → (!b) = false；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.introNf.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.introNf.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.introT

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.introT.statement.correspondence

目标：native statement: ∀ (P : Prop) (b : Bool), (P ↔ b = true) → P → b = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.introT.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.introT.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.introTF

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.introTF.statement.correspondence

目标：native statement: ∀ (P : Prop) (b b_1 : Bool), (P ↔ b = true) → (if b_1 = true then P else ¬P) → b = b_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.introTF.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.introTF.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.introTFn

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.introTFn.statement.correspondence

目标：native statement: ∀ (P : Prop) (b b_1 : Bool), (P ↔ (!b) = true) → (if b_1 = true then ¬P else P) → b = b_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.introTFn.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.introTFn.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.introTn

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.introTn.statement.correspondence

目标：native statement: ∀ (P : Prop) (b : Bool), (P ↔ (!b) = true) → ¬P → b = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.introTn.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.introTn.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.isT

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.isT.statement.correspondence

目标：native statement: true = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.isT.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.isT.statement.native
```

公理闭包：propext

## Corelib.ssr.ssrbool.is_true_true

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.is_true_true.statement.correspondence

目标：native statement: true = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.is_true_true.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.is_true_true.statement.native
```

公理闭包：propext

## Corelib.ssr.ssrbool.negbF

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.negbF.statement.correspondence

目标：native statement: ∀ (b : Bool), b = true → (!b) = false；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.negbF.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.negbF.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.negbFE

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.negbFE.statement.correspondence

目标：native statement: ∀ (b : Bool), (!b) = false → b = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.negbFE.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.negbFE.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.negbK

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.negbK.statement.correspondence

目标：native statement: ∀ (b : Bool), (!!b) = b；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.negbK.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.negbK.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.negbLR

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.negbLR.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), b = !b_1 → (!b) = b_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.negbLR.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.negbLR.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.negbNE

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.negbNE.statement.correspondence

目标：native statement: ∀ (b : Bool), (!!b) = true → b = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.negbNE.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.negbNE.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.negbRL

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.negbRL.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (!b) = b_1 → b = !b_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.negbRL.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.negbRL.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.negbT

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.negbT.statement.correspondence

目标：native statement: ∀ (b : Bool), b = false → (!b) = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.negbT.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.negbT.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.negbTE

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.negbTE.statement.correspondence

目标：native statement: ∀ (b : Bool), (!b) = true → b = false；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.negbTE.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.negbTE.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.negb_and

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.negb_and.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (!(b && b_1)) = (!b || !b_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.negb_and.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.negb_and.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.negb_imply

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.negb_imply.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (!(!b || b_1)) = (b && !b_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.negb_imply.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.negb_imply.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.negb_inj

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.negb_inj.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (!b) = !b_1 → b = b_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.negb_inj.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.negb_inj.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.negb_or

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.negb_or.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (!(b || b_1)) = (!b && !b_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.negb_or.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.negb_or.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.notF

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.notF.statement.correspondence

目标：native statement: ¬false = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.notF.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.notF.statement.native
```

公理闭包：propext

## Corelib.ssr.ssrbool.not_false_is_true

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.not_false_is_true.statement.correspondence

目标：native statement: ¬false = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.not_false_is_true.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.not_false_is_true.statement.native
```

公理闭包：propext

## Corelib.ssr.ssrbool.orFb

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orFb.statement.correspondence

目标：native statement: ∀ (b : Bool), (false || b) = b；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.orFb.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orFb.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.orKb

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orKb.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (b && (b_1 || b)) = b；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.orKb.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orKb.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.orNb

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orNb.statement.correspondence

目标：native statement: ∀ (b : Bool), (!b || b) = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.orNb.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orNb.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.orTb

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orTb.statement.correspondence

目标：native statement: ∀ (b : Bool), (true || b) = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.orTb.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orTb.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.orbA

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orbA.statement.correspondence

目标：native statement: ∀ (b b_1 b_2 : Bool), (b || (b_1 || b_2)) = (b || b_1 || b_2)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.orbA.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orbA.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.orbAC

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orbAC.statement.correspondence

目标：native statement: ∀ (b b_1 b_2 : Bool), (b || b_1 || b_2) = (b || b_2 || b_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.orbAC.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orbAC.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.orbACA

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orbACA.statement.correspondence

目标：native statement: ∀ (b b_1 b_2 b_3 : Bool), (b || b_1 || (b_2 || b_3)) = (b || b_2 || (b_1 || b_3))；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.orbACA.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orbACA.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.orbC

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orbC.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (b || b_1) = (b_1 || b)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.orbC.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orbC.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.orbCA

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orbCA.statement.correspondence

目标：native statement: ∀ (b b_1 b_2 : Bool), (b || (b_1 || b_2)) = (b_1 || (b || b_2))；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.orbCA.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orbCA.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.orbF

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orbF.statement.correspondence

目标：native statement: ∀ (b : Bool), (b || false) = b；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.orbF.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orbF.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.orbK

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orbK.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), ((b || b_1) && b) = b；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.orbK.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orbK.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.orbN

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orbN.statement.correspondence

目标：native statement: ∀ (b : Bool), (b || !b) = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.orbN.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orbN.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.orbT

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orbT.statement.correspondence

目标：native statement: ∀ (b : Bool), (b || true) = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.orbT.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orbT.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.orb_id2l

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orb_id2l.statement.correspondence

目标：native statement: ∀ (b b_1 b_2 : Bool), ((!b) = true → b_1 = b_2) → (b || b_1) = (b || b_2)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.orb_id2l.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orb_id2l.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.orb_id2r

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orb_id2r.statement.correspondence

目标：native statement: ∀ (b b_1 b_2 : Bool), ((!b_1) = true → b = b_2) → (b || b_1) = (b_2 || b_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.orb_id2r.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orb_id2r.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.orb_idl

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orb_idl.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (b = true → b_1 = true) → (b || b_1) = b_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.orb_idl.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orb_idl.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.orb_idr

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orb_idr.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), (b_1 = true → b = true) → (b || b_1) = b；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.orb_idr.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orb_idr.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.orbb

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orbb.statement.correspondence

目标：native statement: ∀ (b : Bool), (b || b) = b；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.orbb.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.orbb.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.prop_congr

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.prop_congr.statement.correspondence

目标：native statement: ∀ (b b_1 : Bool), b = b_1 → (b = true) = (b_1 = true)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.prop_congr.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.prop_congr.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.rev_trans

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.rev_trans.statement.correspondence

目标：native statement: ∀ (T : Type u_Corelib_ssr_ssrbool_1105) (f : T → T → Bool),
  (∀ (y x z : T), f x y = true → f y z = true → f x z = true) →
    ∀ (y x z : T), f y x = true → f z y = true → f z x = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.rev_trans.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.rev_trans.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.rwP

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.rwP.statement.correspondence

目标：native statement: ∀ (P : Prop) (b : Bool), (P ↔ b = true) → (P ↔ b = true)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.rwP.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.rwP.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.rwP2

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.rwP2.statement.correspondence

目标：native statement: ∀ (P Q : Prop) (b : Bool), (P ↔ b = true) → (Q ↔ b = true) → (P ↔ Q)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.rwP2.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.rwP2.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.sameP

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.sameP.statement.correspondence

目标：native statement: ∀ (P : Prop) (b b_1 : Bool), (P ↔ b = true) → (P ↔ b_1 = true) → b = b_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.sameP.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.sameP.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.wlog_neg

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.wlog_neg.statement.correspondence

目标：native statement: ∀ (b : Bool), ((!b) = true → b = true) → b = true；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.wlog_neg.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.wlog_neg.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.xorPif

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.xorPif.statement.correspondence

目标：native statement: ∀ (P Q : Prop) (b : Bool), (P ↔ b = true) → Q ∨ P → ¬(Q ∧ P) → if b = true then ¬Q else Q；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.xorPif.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.xorPif.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.ssr.ssrbool.xorPifn

NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.xorPifn.statement.correspondence

目标：native statement: ∀ (P Q : Prop) (b : Bool), (P ↔ (!b) = true) → Q ∨ P → ¬(Q ∧ P) → if b = true then Q else ¬Q；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.ssr.ssrbool.xorPifn.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.ssr.ssrbool.xorPifn.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.Equivalence_PER

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.Equivalence_PER.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : A → A → Prop),
  Equivalence R → (∀ (x y : A), R x y → R y x) ∧ ∀ (x y z : A), R x y → R y z → R x z；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.Equivalence_PER.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.Equivalence_PER.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.Equivalence_PreOrder

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.Equivalence_PreOrder.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : A → A → Prop),
  Equivalence R → (∀ (x : A), R x x) ∧ ∀ (x y z : A), R x y → R y z → R x z；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.Equivalence_PreOrder.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.Equivalence_PreOrder.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.Equivalence_Reflexive

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.Equivalence_Reflexive.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : A → A → Prop), Equivalence R → ∀ (x : A), R x x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.Equivalence_Reflexive.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.Equivalence_Reflexive.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.Equivalence_Symmetric

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.Equivalence_Symmetric.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : A → A → Prop), Equivalence R → ∀ (x y : A), R x y → R y x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.Equivalence_Symmetric.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.Equivalence_Symmetric.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.Equivalence_Transitive

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.Equivalence_Transitive.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : A → A → Prop),
  Equivalence R → ∀ (x y z : A), R x y → R y z → R x z；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.Equivalence_Transitive.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.Equivalence_Transitive.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.PER_Symmetric

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.PER_Symmetric.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : A → A → Prop),
  ((∀ (x y : A), R x y → R y x) ∧ ∀ (x y z : A), R x y → R y z → R x z) → ∀ (x y : A), R x y → R y x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.PER_Symmetric.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.PER_Symmetric.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.PER_Transitive

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.PER_Transitive.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : A → A → Prop),
  ((∀ (x y : A), R x y → R y x) ∧ ∀ (x y z : A), R x y → R y z → R x z) → ∀ (x y z : A), R x y → R y z → R x z；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.PER_Transitive.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.PER_Transitive.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.PreOrder_Reflexive

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.PreOrder_Reflexive.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : A → A → Prop),
  ((∀ (x : A), R x x) ∧ ∀ (x y z : A), R x y → R y z → R x z) → ∀ (x : A), R x x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.PreOrder_Reflexive.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.PreOrder_Reflexive.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.PreOrder_Transitive

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.PreOrder_Transitive.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : A → A → Prop),
  ((∀ (x : A), R x x) ∧ ∀ (x y z : A), R x y → R y z → R x z) → ∀ (x y z : A), R x y → R y z → R x z；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.PreOrder_Transitive.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.PreOrder_Transitive.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.StrictOrder_Asymmetric

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.StrictOrder_Asymmetric.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : A → A → Prop),
  ((∀ (x : A), ¬R x x) ∧ ∀ (x y z : A), R x y → R y z → R x z) → ∀ (x y : A), R x y → ¬R y x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.StrictOrder_Asymmetric.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.StrictOrder_Asymmetric.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.StrictOrder_Irreflexive

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.StrictOrder_Irreflexive.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : A → A → Prop),
  ((∀ (x : A), ¬R x x) ∧ ∀ (x y z : A), R x y → R y z → R x z) → ∀ (x : A), ¬R x x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.StrictOrder_Irreflexive.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.StrictOrder_Irreflexive.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.StrictOrder_Transitive

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.StrictOrder_Transitive.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : A → A → Prop),
  ((∀ (x : A), ¬R x x) ∧ ∀ (x y z : A), R x y → R y z → R x z) → ∀ (x y z : A), R x y → R y z → R x z；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.StrictOrder_Transitive.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.StrictOrder_Transitive.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.antisymmetry

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.antisymmetry.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_RelationClasses_21) (eqA : A → A → Prop),
  Equivalence eqA → ∀ (R : A → A → Prop), (∀ (x y : A), R x y → R y x → eqA x y) → ∀ (x y : A), R x y → R y x → eqA x y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.antisymmetry.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.antisymmetry.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.asymmetry

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.asymmetry.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop),
  (∀ (x y : A), R x y → ¬R y x) → ∀ (x y : A), R x y → R y x → False；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.asymmetry.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.asymmetry.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.complement_Irreflexive

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.complement_Irreflexive.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop), (∀ (x : A), R x x) → ∀ (x : A), ¬¬R x x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.complement_Irreflexive.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.complement_Irreflexive.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.complement_Symmetric

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.complement_Symmetric.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop),
  (∀ (x y : A), R x y → R y x) → ∀ (x y : A), ¬R x y → ¬R y x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.complement_Symmetric.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.complement_Symmetric.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.complement_inverse

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.complement_inverse.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop), (fun x y => ¬R y x) = fun x y => ¬R y x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.complement_inverse.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.complement_inverse.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.eq_Reflexive

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.eq_Reflexive.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (x : A), x = x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.eq_Reflexive.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.eq_Reflexive.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.eq_Symmetric

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.eq_Symmetric.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (x y : A), x = y → y = x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.eq_Symmetric.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.eq_Symmetric.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.eq_Transitive

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.eq_Transitive.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (x y z : A), x = y → y = z → x = z；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.eq_Transitive.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.eq_Transitive.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.eq_equivalence

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.eq_equivalence.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_RelationClasses_21), Equivalence fun x y => x = y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.eq_equivalence.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.eq_equivalence.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.equivalence_rewrite_relation

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.equivalence_rewrite_relation.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (eqA : A → A → Prop), Equivalence eqA → True；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.equivalence_rewrite_relation.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.equivalence_rewrite_relation.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.flip_Antisymmetric

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.flip_Antisymmetric.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_RelationClasses_21) (eqA : A → A → Prop),
  Equivalence eqA → ∀ (R : A → A → Prop), (∀ (x y : A), R x y → R y x → eqA x y) → ∀ (x y : A), R y x → R x y → eqA x y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.flip_Antisymmetric.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.flip_Antisymmetric.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.flip_Asymmetric

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.flip_Asymmetric.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop),
  (∀ (x y : A), R x y → ¬R y x) → ∀ (x y : A), R y x → ¬R x y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.flip_Asymmetric.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.flip_Asymmetric.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.flip_Equivalence

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.flip_Equivalence.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : A → A → Prop), Equivalence R → Equivalence fun b a => R a b；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.flip_Equivalence.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.flip_Equivalence.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.flip_Irreflexive

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.flip_Irreflexive.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop), (∀ (x : A), ¬R x x) → ∀ (x : A), ¬R x x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.flip_Irreflexive.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.flip_Irreflexive.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.flip_PER

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.flip_PER.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : A → A → Prop),
  ((∀ (x y : A), R x y → R y x) ∧ ∀ (x y z : A), R x y → R y z → R x z) →
    (∀ (x y : A), R y x → R x y) ∧ ∀ (x y z : A), R y x → R z y → R z x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.flip_PER.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.flip_PER.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.flip_PreOrder

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.flip_PreOrder.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : A → A → Prop),
  ((∀ (x : A), R x x) ∧ ∀ (x y z : A), R x y → R y z → R x z) →
    (∀ (x : A), R x x) ∧ ∀ (x y z : A), R y x → R z y → R z x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.flip_PreOrder.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.flip_PreOrder.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.flip_Reflexive

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.flip_Reflexive.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop), (∀ (x : A), R x x) → ∀ (x : A), R x x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.flip_Reflexive.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.flip_Reflexive.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.flip_StrictOrder

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.flip_StrictOrder.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : A → A → Prop),
  ((∀ (x : A), ¬R x x) ∧ ∀ (x y z : A), R x y → R y z → R x z) →
    (∀ (x : A), ¬R x x) ∧ ∀ (x y z : A), R y x → R z y → R z x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.flip_StrictOrder.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.flip_StrictOrder.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.flip_Symmetric

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.flip_Symmetric.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop),
  (∀ (x y : A), R x y → R y x) → ∀ (x y : A), R y x → R x y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.flip_Symmetric.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.flip_Symmetric.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.flip_Transitive

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.flip_Transitive.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop),
  (∀ (x y z : A), R x y → R y z → R x z) → ∀ (x y z : A), R y x → R z y → R z x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.flip_Transitive.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.flip_Transitive.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.iff_Reflexive

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.iff_Reflexive.statement.correspondence

目标：native statement: ∀ (x : Prop), x ↔ x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.iff_Reflexive.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.iff_Reflexive.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.iff_Symmetric

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.iff_Symmetric.statement.correspondence

目标：native statement: ∀ (x y : Prop), (x ↔ y) → (y ↔ x)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.iff_Symmetric.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.iff_Symmetric.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.iff_Transitive

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.iff_Transitive.statement.correspondence

目标：native statement: ∀ (x y z : Prop), (x ↔ y) → (y ↔ z) → (x ↔ z)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.iff_Transitive.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.iff_Transitive.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.iff_equivalence

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.iff_equivalence.statement.correspondence

目标：native statement: Equivalence fun P Q => P ↔ Q；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.iff_equivalence.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.iff_equivalence.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.iff_rewrite_relation

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.iff_rewrite_relation.statement.correspondence

目标：native statement: True；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.iff_rewrite_relation.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.iff_rewrite_relation.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.impl_Reflexive

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.impl_Reflexive.statement.correspondence

目标：native statement: ∀ (x : Prop), x → x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.impl_Reflexive.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.impl_Reflexive.statement.native
```

公理闭包：propext

## Corelib.Classes.RelationClasses.impl_Reflexive_obligation_1

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.impl_Reflexive_obligation_1.statement.correspondence

目标：native statement: ∀ (x : Prop), x → x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.impl_Reflexive_obligation_1.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.impl_Reflexive_obligation_1.statement.native
```

公理闭包：空

## Corelib.Classes.RelationClasses.impl_Transitive

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.impl_Transitive.statement.correspondence

目标：native statement: ∀ (x y z : Prop), (x → y) → (y → z) → x → z；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.impl_Transitive.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.impl_Transitive.statement.native
```

公理闭包：propext

## Corelib.Classes.RelationClasses.impl_Transitive_obligation_1

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.impl_Transitive_obligation_1.statement.correspondence

目标：native statement: ∀ (x y z : Prop), (x → y) → (y → z) → x → z；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.impl_Transitive_obligation_1.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.impl_Transitive_obligation_1.statement.native
```

公理闭包：空

## Corelib.Classes.RelationClasses.impl_rewrite_relation

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.impl_rewrite_relation.statement.correspondence

目标：native statement: True；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.impl_rewrite_relation.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.impl_rewrite_relation.statement.native
```

公理闭包：propext

## Corelib.Classes.RelationClasses.inverse_impl_rewrite_relation

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.inverse_impl_rewrite_relation.statement.correspondence

目标：native statement: True；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.inverse_impl_rewrite_relation.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.inverse_impl_rewrite_relation.statement.native
```

公理闭包：propext

## Corelib.Classes.RelationClasses.irreflexivity

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.irreflexivity.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop), (∀ (x : A), ¬R x x) → ∀ (x : A), ¬R x x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.irreflexivity.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.irreflexivity.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.is_subrelation

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.is_subrelation.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R R' : A → A → Prop),
  Subrelation R R' → ∀ (x y : A), R x y → R' x y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.is_subrelation.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.is_subrelation.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.neq_Symmetric

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.neq_Symmetric.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (x y : A), (x = y → False) → y = x → False；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.neq_Symmetric.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.neq_Symmetric.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.partial_order_antisym

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.partial_order_antisym.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_RelationClasses_98) (eqA : A → A → Prop),
  Equivalence eqA →
    ∀ (R : A → A → Prop),
      ((∀ (x : A), R x x) ∧ ∀ (x y z : A), R x y → R y z → R x z) →
        (∀ (x y : A), eqA x y ↔ R x y ∧ R y x) → ∀ (x y : A), R x y → R y x → eqA x y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.partial_order_antisym.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.partial_order_antisym.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.partial_order_equivalence

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.partial_order_equivalence.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_RelationClasses_98) (eqA : A → A → Prop),
  Equivalence eqA →
    ∀ (R : A → A → Prop),
      ((∀ (x : A), R x x) ∧ ∀ (x y z : A), R x y → R y z → R x z) →
        (∀ (x y : A), eqA x y ↔ R x y ∧ R y x) → ∀ (x y : A), eqA x y ↔ R x y ∧ R y x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.partial_order_equivalence.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.partial_order_equivalence.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.reflexivity

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.reflexivity.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop), (∀ (x : A), R x x) → ∀ (x : A), R x x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.reflexivity.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.reflexivity.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.relation_equivalence_equivalence

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.relation_equivalence_equivalence.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_RelationClasses_98), Equivalence fun R S => ∀ (x y : A), R x y ↔ S x y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.relation_equivalence_equivalence.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.relation_equivalence_equivalence.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.relation_equivalence_rewrite_relation

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.relation_equivalence_rewrite_relation.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_RelationClasses_98), True；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.relation_equivalence_rewrite_relation.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.relation_equivalence_rewrite_relation.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.relation_implication_preorder

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.relation_implication_preorder.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_RelationClasses_21),
  (∀ (x : A → A → Prop), Subrelation x x) ∧
    ∀ (x y z : A → A → Prop), Subrelation x y → Subrelation y z → Subrelation x z；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.relation_implication_preorder.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.relation_implication_preorder.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.subrelation_partial_order_obligation_1

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.subrelation_partial_order_obligation_1.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_RelationClasses_98) (x y : A → A → Prop),
  (∀ (x_1 y_1 : A), x x_1 y_1 ↔ y x_1 y_1) ↔ Subrelation x y ∧ Subrelation y x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.subrelation_partial_order_obligation_1.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.subrelation_partial_order_obligation_1.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.subrelation_symmetric

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.subrelation_symmetric.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop),
  (∀ (x y : A), R x y → R y x) → Subrelation (fun b a => R a b) R；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.subrelation_symmetric.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.subrelation_symmetric.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.symmetry

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.symmetry.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop),
  (∀ (x y : A), R x y → R y x) → ∀ (x y : A), R x y → R y x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.symmetry.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.symmetry.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.RelationClasses.transitivity

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.transitivity.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop),
  (∀ (x y z : A), R x y → R y z → R x z) → ∀ (x y z : A), R x y → R y z → R x z；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.RelationClasses.transitivity.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.RelationClasses.transitivity.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.PER_morphism

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.PER_morphism.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_Morphisms_77) (R : A → A → Prop),
  ((∀ (x y : A), R x y → R y x) ∧ ∀ (x y z : A), R x y → R y z → R x z) →
    ∀ (x y : A), R x y → ∀ (x_1 y_1 : A), R x_1 y_1 → (R x x_1 → R y y_1) ∧ (R y y_1 → R x x_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.PER_morphism.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.PER_morphism.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.PER_morphism_obligation_1

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.PER_morphism_obligation_1.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_Morphisms_77) (R : A → A → Prop),
  ((∀ (x y : A), R x y → R y x) ∧ ∀ (x y z : A), R x y → R y z → R x z) →
    ∀ (x y : A), R x y → ∀ (x_1 y_1 : A), R x_1 y_1 → (R x x_1 → R y y_1) ∧ (R y y_1 → R x x_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.PER_morphism_obligation_1.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.PER_morphism_obligation_1.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.PartialOrder_StrictOrder

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.PartialOrder_StrictOrder.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (eqA : A → A → Prop),
  Equivalence eqA →
    ∀ (R : A → A → Prop),
      ((∀ (x : A), R x x) ∧ ∀ (x y z : A), R x y → R y z → R x z) →
        (∀ (x y : A), eqA x y ↔ R x y ∧ R y x) →
          (∀ (x : A), ¬(R x x ∧ ¬eqA x x)) ∧ ∀ (x y z : A), R x y ∧ ¬eqA x y → R y z ∧ ¬eqA y z → R x z ∧ ¬eqA x z；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.PartialOrder_StrictOrder.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.PartialOrder_StrictOrder.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.PartialOrder_proper

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.PartialOrder_proper.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_Morphisms_183) (eqA : A → A → Prop),
  Equivalence eqA →
    ∀ (R : A → A → Prop),
      ((∀ (x : A), R x x) ∧ ∀ (x y z : A), R x y → R y z → R x z) →
        (∀ (x x_1 : A), eqA x x_1 ↔ R x x_1 ∧ R x_1 x) →
          ∀ (x y : A), eqA x y → ∀ (x_1 y_1 : A), eqA x_1 y_1 → (R x x_1 → R y y_1) ∧ (R y y_1 → R x x_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.PartialOrder_proper.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.PartialOrder_proper.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.Reflexive_partial_app_morphism

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.Reflexive_partial_app_morphism.statement.correspondence

目标：native statement: ∀ (A B : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop) (R' : B → B → Prop) (m : A → B),
  (∀ (x y : A), R x y → R' (m x) (m y)) → ∀ (x : A), R x x → R' (m x) (m x)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.Reflexive_partial_app_morphism.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.Reflexive_partial_app_morphism.statement.native
```

公理闭包：空

## Corelib.Classes.Morphisms.StrictOrder_PartialOrder

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.StrictOrder_PartialOrder.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_Morphisms_196) (eqA : A → A → Prop),
  Equivalence eqA →
    ∀ (R : A → A → Prop),
      ((∀ (x : A), ¬R x x) ∧ ∀ (x y z : A), R x y → R y z → R x z) →
        (∀ (x y : A), eqA x y → ∀ (x_1 y_1 : A), eqA x_1 y_1 → (R x x_1 → R y y_1) ∧ (R y y_1 → R x x_1)) →
          ∀ (x x_1 : A), eqA x x_1 ↔ (R x x_1 ∨ eqA x x_1) ∧ (R x_1 x ∨ eqA x_1 x)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.StrictOrder_PartialOrder.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.StrictOrder_PartialOrder.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.StrictOrder_PreOrder

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.StrictOrder_PreOrder.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_Morphisms_192) (eqA : A → A → Prop),
  Equivalence eqA →
    ∀ (R : A → A → Prop),
      ((∀ (x : A), ¬R x x) ∧ ∀ (x y z : A), R x y → R y z → R x z) →
        (∀ (x y : A), eqA x y → ∀ (x_1 y_1 : A), eqA x_1 y_1 → (R x x_1 → R y y_1) ∧ (R y y_1 → R x x_1)) →
          (∀ (x : A), R x x ∨ eqA x x) ∧ ∀ (x y z : A), R x y ∨ eqA x y → R y z ∨ eqA y z → R x z ∨ eqA x z；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.StrictOrder_PreOrder.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.StrictOrder_PreOrder.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.compose_proper

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.compose_proper.statement.correspondence

目标：native statement: ∀ (A B C : Type u_Corelib_Classes_Morphisms_77) (RA : A → A → Prop) (RB : B → B → Prop) (RC : C → C → Prop)
  (x y : B → C),
  (∀ (x_1 y_1 : B), RB x_1 y_1 → RC (x x_1) (y y_1)) →
    ∀ (x_1 y_1 : A → B),
      (∀ (x y : A), RA x y → RB (x_1 x) (y_1 y)) → ∀ (x_2 y_2 : A), RA x_2 y_2 → RC (x (x_1 x_2)) (y (y_1 y_2))；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.compose_proper.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.compose_proper.statement.native
```

公理闭包：空

## Corelib.Classes.Morphisms.compose_proper_obligation_1

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.compose_proper_obligation_1.statement.correspondence

目标：native statement: ∀ (A B C : Type u_Corelib_Classes_Morphisms_77) (RA : A → A → Prop) (RB : B → B → Prop) (RC : C → C → Prop)
  (x y : B → C),
  (∀ (x_1 y_1 : B), RB x_1 y_1 → RC (x x_1) (y y_1)) →
    ∀ (x_1 y_1 : A → B),
      (∀ (x y : A), RA x y → RB (x_1 x) (y_1 y)) → ∀ (x_2 y_2 : A), RA x_2 y_2 → RC (x (x_1 x_2)) (y (y_1 y_2))；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.compose_proper_obligation_1.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.compose_proper_obligation_1.statement.native
```

公理闭包：空

## Corelib.Classes.Morphisms.eq_pars

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.eq_pars.statement.correspondence

目标：native statement: True；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.eq_pars.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.eq_pars.statement.native
```

公理闭包：propext

## Corelib.Classes.Morphisms.eq_proper_proxy

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.eq_proper_proxy.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (x : A), x = x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.eq_proper_proxy.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.eq_proper_proxy.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.eq_rewrite_relation

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.eq_rewrite_relation.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_RelationClasses_21), True；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.eq_rewrite_relation.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.eq_rewrite_relation.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.eq_subrelation

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.eq_subrelation.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop),
  (∀ (x : A), R x x) → Subrelation (fun x y => x = y) R；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.eq_subrelation.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.eq_subrelation.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.flip1

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.flip1.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R' R : A → A → Prop),
  Subrelation R' R → Subrelation (fun b a => R' b a) R；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.flip1.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.flip1.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.flip2

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.flip2.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R R' : A → A → Prop),
  Subrelation R R' → Subrelation R fun b a => R' b a；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.flip2.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.flip2.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.flip_atom

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.flip_atom.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop) (x y : A), R x y ↔ R x y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.flip_atom.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.flip_atom.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.flip_pars

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.flip_pars.statement.correspondence

目标：native statement: True；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.flip_pars.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.flip_pars.statement.native
```

公理闭包：propext

## Corelib.Classes.Morphisms.flip_proper

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.flip_proper.statement.correspondence

目标：native statement: ∀ (A B C : Type u_Corelib_Classes_Morphisms_77) (RA : A → A → Prop) (RB : B → B → Prop) (RC : C → C → Prop)
  (f : A → B → C),
  (∀ (x y : A), RA x y → ∀ (x_1 y_1 : B), RB x_1 y_1 → RC (f x x_1) (f y y_1)) →
    ∀ (x y : B), RB x y → ∀ (x_1 y_1 : A), RA x_1 y_1 → RC (f x_1 x) (f y_1 y)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.flip_proper.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.flip_proper.statement.native
```

公理闭包：空

## Corelib.Classes.Morphisms.flip_proper_obligation_1

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.flip_proper_obligation_1.statement.correspondence

目标：native statement: ∀ (A B C : Type u_Corelib_Classes_Morphisms_77) (RA : A → A → Prop) (RB : B → B → Prop) (RC : C → C → Prop)
  (f : A → B → C),
  (∀ (x y : A), RA x y → ∀ (x_1 y_1 : B), RB x_1 y_1 → RC (f x x_1) (f y y_1)) →
    ∀ (x y : B), RB x y → ∀ (x_1 y_1 : A), RA x_1 y_1 → RC (f x_1 x) (f y_1 y)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.flip_proper_obligation_1.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.flip_proper_obligation_1.statement.native
```

公理闭包：空

## Corelib.Classes.Morphisms.flip_respectful

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.flip_respectful.statement.correspondence

目标：native statement: ∀ (A B : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop) (R' : B → B → Prop) (x y : A → B),
  (∀ (x_1 y_1 : A), R x_1 y_1 → R' (y x_1) (x y_1)) ↔ ∀ (x_1 y_1 : A), R y_1 x_1 → R' (y y_1) (x x_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.flip_respectful.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.flip_respectful.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.forall_subrelation

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.forall_subrelation.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (P : A → Type u_Corelib_Relations_Relation_Definitions_21)
  (R S : (x : A) → P x → P x → Prop),
  (∀ (a : A), Subrelation (R a) (S a)) →
    Subrelation (fun f g => ∀ (a : A), R a (f a) (g a)) fun f g => ∀ (a : A), S a (f a) (g a)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.forall_subrelation.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.forall_subrelation.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.iff_flip_impl_subrelation

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.iff_flip_impl_subrelation.statement.correspondence

目标：native statement: Subrelation (fun P Q => P ↔ Q) fun b a => a → b；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.iff_flip_impl_subrelation.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.iff_flip_impl_subrelation.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.iff_impl_subrelation

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.iff_impl_subrelation.statement.correspondence

目标：native statement: Subrelation (fun P Q => P ↔ Q) fun P Q => P → Q；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.iff_impl_subrelation.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.iff_impl_subrelation.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.iff_pars

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.iff_pars.statement.correspondence

目标：native statement: True；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.iff_pars.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.iff_pars.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.impl_pars

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.impl_pars.statement.correspondence

目标：native statement: True；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.impl_pars.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.impl_pars.statement.native
```

公理闭包：propext

## Corelib.Classes.Morphisms.normalizes

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.normalizes.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (m m' : A → A → Prop),
  (∀ (x y : A), m x y ↔ m' x y) → ∀ (x y : A), m x y ↔ m' x y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.normalizes.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.normalizes.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.per_partial_app_morphism

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.per_partial_app_morphism.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_Morphisms_77) (R : A → A → Prop),
  ((∀ (x y : A), R x y → R y x) ∧ ∀ (x y z : A), R x y → R y z → R x z) →
    ∀ (x x_1 y : A), R x_1 y → (R x x_1 → R x y) ∧ (R x y → R x x_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.per_partial_app_morphism.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.per_partial_app_morphism.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.per_partial_app_morphism_obligation_1

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.per_partial_app_morphism_obligation_1.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_Morphisms_77) (R : A → A → Prop),
  ((∀ (x y : A), R x y → R y x) ∧ ∀ (x y z : A), R x y → R y z → R x z) →
    ∀ (x x_1 y : A), R x_1 y → (R x x_1 → R x y) ∧ (R x y → R x x_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.per_partial_app_morphism_obligation_1.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.per_partial_app_morphism_obligation_1.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.pointwise_pointwise

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.pointwise_pointwise.statement.correspondence

目标：native statement: ∀ (A B : Type u_Corelib_Classes_Morphisms_57) (R : B → B → Prop) (x y : A → B),
  (∀ (x_1 : A), R (x x_1) (y x_1)) ↔ ∀ (x_1 y_1 : A), x_1 = y_1 → R (x x_1) (y y_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.pointwise_pointwise.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.pointwise_pointwise.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.pointwise_subrelation

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.pointwise_subrelation.statement.correspondence

目标：native statement: ∀ (A B : Type u_Corelib_Classes_Morphisms_57) (R R' : B → B → Prop),
  Subrelation R R' → Subrelation (fun f g => ∀ (x : A), R (f x) (g x)) fun f g => ∀ (x : A), R' (f x) (g x)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.pointwise_subrelation.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.pointwise_subrelation.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.proper_eq

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.proper_eq.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (x : A), x = x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.proper_eq.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.proper_eq.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.proper_flip_proper

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.proper_flip_proper.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop) (m : A), R m m → R m m；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.proper_flip_proper.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.proper_flip_proper.statement.native
```

公理闭包：空

## Corelib.Classes.Morphisms.proper_normalizes_proper

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.proper_normalizes_proper.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R0 R1 : A → A → Prop),
  (∀ (x y : A), R0 x y ↔ R1 x y) → ∀ (m : A), R1 m m → R0 m m；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.proper_normalizes_proper.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.proper_normalizes_proper.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.proper_prf

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.proper_prf.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop) (m : A), R m m → R m m；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.proper_prf.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.proper_prf.statement.native
```

公理闭包：空

## Corelib.Classes.Morphisms.proper_proper_proxy

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.proper_proper_proxy.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (x : A) (R : A → A → Prop), R x x → R x x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.proper_proper_proxy.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.proper_proper_proxy.statement.native
```

公理闭包：空

## Corelib.Classes.Morphisms.proper_proxy

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.proper_proxy.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop) (m : A), R m m → R m m；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.proper_proxy.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.proper_proxy.statement.native
```

公理闭包：空

## Corelib.Classes.Morphisms.reflexive_eq_dom_reflexive

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.reflexive_eq_dom_reflexive.statement.correspondence

目标：native statement: ∀ (A B : Type u_Corelib_Relations_Relation_Definitions_21) (R' : B → B → Prop),
  (∀ (x : B), R' x x) → ∀ (x : A → B) (x_1 y : A), x_1 = y → R' (x x_1) (x y)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.reflexive_eq_dom_reflexive.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.reflexive_eq_dom_reflexive.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.reflexive_proper

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.reflexive_proper.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop), (∀ (x : A), R x x) → ∀ (x : A), R x x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.reflexive_proper.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.reflexive_proper.statement.native
```

公理闭包：空

## Corelib.Classes.Morphisms.reflexive_proper_proxy

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.reflexive_proper_proxy.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop), (∀ (x : A), R x x) → ∀ (x : A), R x x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.reflexive_proper_proxy.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.reflexive_proper_proxy.statement.native
```

公理闭包：空

## Corelib.Classes.Morphisms.reflexive_proxy

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.reflexive_proxy.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop), (∀ (x : A), R x x) → ∀ (x : A), R x x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.reflexive_proxy.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.reflexive_proxy.statement.native
```

公理闭包：空

## Corelib.Classes.Morphisms.reflexive_reflexive_proxy

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.reflexive_reflexive_proxy.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop), (∀ (x : A), R x x) → ∀ (x : A), R x x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.reflexive_reflexive_proxy.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.reflexive_reflexive_proxy.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.respectful_morphism

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.respectful_morphism.statement.correspondence

目标：native statement: ∀ (A B : Type u_Corelib_Relations_Relation_Definitions_21) (x y : A → A → Prop),
  (∀ (x_1 y_1 : A), x x_1 y_1 ↔ y x_1 y_1) →
    ∀ (x_1 y_1 : B → B → Prop),
      (∀ (x y : B), x_1 x y ↔ y_1 x y) →
        ∀ (x_2 y_2 : A → B),
          (∀ (x_3 y : A), x x_3 y → x_1 (x_2 x_3) (y_2 y)) ↔ ∀ (x y_3 : A), y x y_3 → y_1 (x_2 x) (y_2 y_3)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.respectful_morphism.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.respectful_morphism.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.respectful_per

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.respectful_per.statement.correspondence

目标：native statement: ∀ (A B : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop),
  ((∀ (x y : A), R x y → R y x) ∧ ∀ (x y z : A), R x y → R y z → R x z) →
    ∀ (R' : B → B → Prop),
      ((∀ (x y : B), R' x y → R' y x) ∧ ∀ (x y z : B), R' x y → R' y z → R' x z) →
        (∀ (x y : A → B),
            (∀ (x_1 y_1 : A), R x_1 y_1 → R' (x x_1) (y y_1)) → ∀ (x_1 y_1 : A), R x_1 y_1 → R' (y x_1) (x y_1)) ∧
          ∀ (x y z : A → B),
            (∀ (x_1 y_1 : A), R x_1 y_1 → R' (x x_1) (y y_1)) →
              (∀ (x y_1 : A), R x y_1 → R' (y x) (z y_1)) → ∀ (x_1 y : A), R x_1 y → R' (x x_1) (z y)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.respectful_per.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.respectful_per.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.respectful_per_obligation_1

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.respectful_per_obligation_1.statement.correspondence

目标：native statement: ∀ (A B : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop),
  ((∀ (x y : A), R x y → R y x) ∧ ∀ (x y z : A), R x y → R y z → R x z) →
    ∀ (R' : B → B → Prop),
      ((∀ (x y : B), R' x y → R' y x) ∧ ∀ (x y z : B), R' x y → R' y z → R' x z) →
        ∀ (x y : A → B),
          (∀ (x_1 y_1 : A), R x_1 y_1 → R' (x x_1) (y y_1)) → ∀ (x_1 y_1 : A), R x_1 y_1 → R' (y x_1) (x y_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.respectful_per_obligation_1.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.respectful_per_obligation_1.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.respectful_per_obligation_2

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.respectful_per_obligation_2.statement.correspondence

目标：native statement: ∀ (A B : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop),
  ((∀ (x y : A), R x y → R y x) ∧ ∀ (x y z : A), R x y → R y z → R x z) →
    ∀ (R' : B → B → Prop),
      ((∀ (x y : B), R' x y → R' y x) ∧ ∀ (x y z : B), R' x y → R' y z → R' x z) →
        ∀ (x y z : A → B),
          (∀ (x_1 y_1 : A), R x_1 y_1 → R' (x x_1) (y y_1)) →
            (∀ (x y_1 : A), R x y_1 → R' (y x) (z y_1)) → ∀ (x_1 y : A), R x_1 y → R' (x x_1) (z y)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.respectful_per_obligation_2.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.respectful_per_obligation_2.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.rewrite_relation_eq_dom

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.rewrite_relation_eq_dom.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_Morphisms_50) (B : Type u_Corelib_Classes_Morphisms_49) (R : B → B → Prop), True → True；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.rewrite_relation_eq_dom.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.rewrite_relation_eq_dom.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.rewrite_relation_pointwise

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.rewrite_relation_pointwise.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_Morphisms_39) (B : Type u_Corelib_Classes_Morphisms_38) (R : B → B → Prop), True → True；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.rewrite_relation_pointwise.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.rewrite_relation_pointwise.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.subrelation_proper

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.subrelation_proper.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_Morphisms_57) (R' : A → A → Prop) (m : A),
  R' m m → ∀ (R : A → A → Prop), (∀ (x y : A), R' x y → R x y) → R m m；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.subrelation_proper.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.subrelation_proper.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.subrelation_refl

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.subrelation_refl.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop), Subrelation R R；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.subrelation_refl.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.subrelation_refl.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.subrelation_respectful

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.subrelation_respectful.statement.correspondence

目标：native statement: ∀ (A B : Type u_Corelib_Relations_Relation_Definitions_21) (RA' RA : A → A → Prop),
  Subrelation RA' RA →
    ∀ (RB RB' : B → B → Prop),
      Subrelation RB RB' →
        Subrelation (fun f g => ∀ (x y : A), RA x y → RB (f x) (g y)) fun f g => ∀ (x y : A), RA' x y → RB' (f x) (g y)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.subrelation_respectful.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.subrelation_respectful.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.symmetric_equiv_flip

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.symmetric_equiv_flip.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop),
  (∀ (x y : A), R x y → R y x) → ∀ (x y : A), R x y ↔ R y x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.symmetric_equiv_flip.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.symmetric_equiv_flip.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.trans_sym_co_inv_impl_morphism

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.trans_sym_co_inv_impl_morphism.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_Morphisms_77) (R : A → A → Prop),
  ((∀ (x y : A), R x y → R y x) ∧ ∀ (x y z : A), R x y → R y z → R x z) → ∀ (x x_1 y : A), R x_1 y → R x y → R x x_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.trans_sym_co_inv_impl_morphism.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.trans_sym_co_inv_impl_morphism.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.trans_sym_co_inv_impl_morphism_obligation_1

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.trans_sym_co_inv_impl_morphism_obligation_1.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_Morphisms_77) (R : A → A → Prop),
  ((∀ (x y : A), R x y → R y x) ∧ ∀ (x y z : A), R x y → R y z → R x z) → ∀ (x x_1 y : A), R x_1 y → R x y → R x x_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.trans_sym_co_inv_impl_morphism_obligation_1.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.trans_sym_co_inv_impl_morphism_obligation_1.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.trans_sym_contra_impl_morphism

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.trans_sym_contra_impl_morphism.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_Morphisms_77) (R : A → A → Prop),
  ((∀ (x y : A), R x y → R y x) ∧ ∀ (x y z : A), R x y → R y z → R x z) → ∀ (x x_1 y : A), R y x_1 → R x x_1 → R x y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.trans_sym_contra_impl_morphism.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.trans_sym_contra_impl_morphism.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms.trans_sym_contra_impl_morphism_obligation_1

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.trans_sym_contra_impl_morphism_obligation_1.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_Morphisms_77) (R : A → A → Prop),
  ((∀ (x y : A), R x y → R y x) ∧ ∀ (x y z : A), R x y → R y z → R x z) → ∀ (x x_1 y : A), R y x_1 → R x x_1 → R x y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms.trans_sym_contra_impl_morphism_obligation_1.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms.trans_sym_contra_impl_morphism_obligation_1.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Equivalence.equiv_reflexive

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Equivalence.equiv_reflexive.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop),
  ((∀ (x : A), R x x) ∧ (∀ (x y : A), R x y → R y x) ∧ ∀ (x y z : A), R x y → R y z → R x z) → ∀ (x : A), R x x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Equivalence.equiv_reflexive.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Equivalence.equiv_reflexive.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Equivalence.equiv_reflexive_obligation_1

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Equivalence.equiv_reflexive_obligation_1.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop),
  ((∀ (x : A), R x x) ∧ (∀ (x y : A), R x y → R y x) ∧ ∀ (x y z : A), R x y → R y z → R x z) → ∀ (x : A), R x x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Equivalence.equiv_reflexive_obligation_1.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Equivalence.equiv_reflexive_obligation_1.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Equivalence.equiv_symmetric

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Equivalence.equiv_symmetric.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop),
  ((∀ (x : A), R x x) ∧ (∀ (x y : A), R x y → R y x) ∧ ∀ (x y z : A), R x y → R y z → R x z) →
    ∀ (x y : A), R x y → R y x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Equivalence.equiv_symmetric.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Equivalence.equiv_symmetric.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Equivalence.equiv_symmetric_obligation_1

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Equivalence.equiv_symmetric_obligation_1.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop),
  ((∀ (x : A), R x x) ∧ (∀ (x y : A), R x y → R y x) ∧ ∀ (x y z : A), R x y → R y z → R x z) →
    ∀ (x y : A), R x y → R y x；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Equivalence.equiv_symmetric_obligation_1.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Equivalence.equiv_symmetric_obligation_1.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Equivalence.equiv_transitive

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Equivalence.equiv_transitive.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop),
  ((∀ (x : A), R x x) ∧ (∀ (x y : A), R x y → R y x) ∧ ∀ (x y z : A), R x y → R y z → R x z) →
    ∀ (x y z : A), R x y → R y z → R x z；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Equivalence.equiv_transitive.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Equivalence.equiv_transitive.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Equivalence.equiv_transitive_obligation_1

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Equivalence.equiv_transitive_obligation_1.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop),
  ((∀ (x : A), R x x) ∧ (∀ (x y : A), R x y → R y x) ∧ ∀ (x y z : A), R x y → R y z → R x z) →
    ∀ (x y z : A), R x y → R y z → R x z；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Equivalence.equiv_transitive_obligation_1.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Equivalence.equiv_transitive_obligation_1.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Equivalence.pointwise_equivalence

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Equivalence.pointwise_equivalence.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_Morphisms_39) (B : Type u_Corelib_Classes_Morphisms_38) (eqB : B → B → Prop),
  ((∀ (x : B), eqB x x) ∧ (∀ (x y : B), eqB x y → eqB y x) ∧ ∀ (x y z : B), eqB x y → eqB y z → eqB x z) →
    (∀ (x : A → B) (x_1 : A), eqB (x x_1) (x x_1)) ∧
      (∀ (x y : A → B), (∀ (x_1 : A), eqB (x x_1) (y x_1)) → ∀ (x_1 : A), eqB (y x_1) (x x_1)) ∧
        ∀ (x y z : A → B),
          (∀ (x_1 : A), eqB (x x_1) (y x_1)) → (∀ (x : A), eqB (y x) (z x)) → ∀ (x_1 : A), eqB (x x_1) (z x_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Equivalence.pointwise_equivalence.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Equivalence.pointwise_equivalence.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Equivalence.pointwise_reflexive

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Equivalence.pointwise_reflexive.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_Morphisms_39) (B : Type u_Corelib_Classes_Morphisms_38) (eqB : B → B → Prop),
  (∀ (x : B), eqB x x) → ∀ (x : A → B) (x_1 : A), eqB (x x_1) (x x_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Equivalence.pointwise_reflexive.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Equivalence.pointwise_reflexive.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Equivalence.pointwise_symmetric

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Equivalence.pointwise_symmetric.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_Morphisms_39) (B : Type u_Corelib_Classes_Morphisms_38) (eqB : B → B → Prop),
  (∀ (x y : B), eqB x y → eqB y x) →
    ∀ (x y : A → B), (∀ (x_1 : A), eqB (x x_1) (y x_1)) → ∀ (x_1 : A), eqB (y x_1) (x x_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Equivalence.pointwise_symmetric.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Equivalence.pointwise_symmetric.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Equivalence.pointwise_transitive

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Equivalence.pointwise_transitive.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_Morphisms_39) (B : Type u_Corelib_Classes_Morphisms_38) (eqB : B → B → Prop),
  (∀ (x y z : B), eqB x y → eqB y z → eqB x z) →
    ∀ (x y z : A → B),
      (∀ (x_1 : A), eqB (x x_1) (y x_1)) → (∀ (x : A), eqB (y x) (z x)) → ∀ (x_1 : A), eqB (x x_1) (z x_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Equivalence.pointwise_transitive.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Equivalence.pointwise_transitive.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Equivalence.respecting_equiv

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Equivalence.respecting_equiv.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_Equivalence_46) (R : A → A → Prop),
  ((∀ (x : A), R x x) ∧ (∀ (x y : A), R x y → R y x) ∧ ∀ (x y z : A), R x y → R y z → R x z) →
    ∀ (B : Type u_Corelib_Classes_Equivalence_49) (R' : B → B → Prop),
      ((∀ (x : B), R' x x) ∧ (∀ (x y : B), R' x y → R' y x) ∧ ∀ (x y z : B), R' x y → R' y z → R' x z) →
        (∀ (s : { morph // ∀ (x y : A), R x y → R' (morph x) (morph y) }) (x y : A), R x y → R' (s.val x) (s.val y)) ∧
          (∀ (s s_1 : { morph // ∀ (x y : A), R x y → R' (morph x) (morph y) }),
              (∀ (x y : A), R x y → R' (s.val x) (s_1.val y)) → ∀ (x y : A), R x y → R' (s_1.val x) (s.val y)) ∧
            ∀ (s s_1 s_2 : { morph // ∀ (x y : A), R x y → R' (morph x) (morph y) }),
              (∀ (x y : A), R x y → R' (s.val x) (s_1.val y)) →
                (∀ (x y : A), R x y → R' (s_1.val x) (s_2.val y)) → ∀ (x y : A), R x y → R' (s.val x) (s_2.val y)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Equivalence.respecting_equiv.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Equivalence.respecting_equiv.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Equivalence.respecting_equiv_obligation_1

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Equivalence.respecting_equiv_obligation_1.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_Equivalence_46) (R : A → A → Prop),
  ((∀ (x : A), R x x) ∧ (∀ (x y : A), R x y → R y x) ∧ ∀ (x y z : A), R x y → R y z → R x z) →
    ∀ (B : Type u_Corelib_Classes_Equivalence_49) (R' : B → B → Prop),
      ((∀ (x : B), R' x x) ∧ (∀ (x y : B), R' x y → R' y x) ∧ ∀ (x y z : B), R' x y → R' y z → R' x z) →
        ∀ (s : { morph // ∀ (x y : A), R x y → R' (morph x) (morph y) }) (x y : A), R x y → R' (s.val x) (s.val y)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Equivalence.respecting_equiv_obligation_1.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Equivalence.respecting_equiv_obligation_1.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Equivalence.respecting_equiv_obligation_2

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Equivalence.respecting_equiv_obligation_2.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_Equivalence_46) (R : A → A → Prop),
  ((∀ (x : A), R x x) ∧ (∀ (x y : A), R x y → R y x) ∧ ∀ (x y z : A), R x y → R y z → R x z) →
    ∀ (B : Type u_Corelib_Classes_Equivalence_49) (R' : B → B → Prop),
      ((∀ (x : B), R' x x) ∧ (∀ (x y : B), R' x y → R' y x) ∧ ∀ (x y z : B), R' x y → R' y z → R' x z) →
        ∀ (s s_1 : { morph // ∀ (x y : A), R x y → R' (morph x) (morph y) }),
          (∀ (x y : A), R x y → R' (s.val x) (s_1.val y)) → ∀ (x y : A), R x y → R' (s_1.val x) (s.val y)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Equivalence.respecting_equiv_obligation_2.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Equivalence.respecting_equiv_obligation_2.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Equivalence.respecting_equiv_obligation_3

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Equivalence.respecting_equiv_obligation_3.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_Equivalence_46) (R : A → A → Prop),
  ((∀ (x : A), R x x) ∧ (∀ (x y : A), R x y → R y x) ∧ ∀ (x y z : A), R x y → R y z → R x z) →
    ∀ (B : Type u_Corelib_Classes_Equivalence_49) (R' : B → B → Prop),
      ((∀ (x : B), R' x x) ∧ (∀ (x y : B), R' x y → R' y x) ∧ ∀ (x y z : B), R' x y → R' y z → R' x z) →
        ∀ (s s_1 s_2 : { morph // ∀ (x y : A), R x y → R' (morph x) (morph y) }),
          (∀ (x y : A), R x y → R' (s.val x) (s_1.val y)) →
            (∀ (x y : A), R x y → R' (s_1.val x) (s_2.val y)) → ∀ (x y : A), R x y → R' (s.val x) (s_2.val y)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Equivalence.respecting_equiv_obligation_3.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Equivalence.respecting_equiv_obligation_3.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms_Prop.Acc_pt_morphism

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.Acc_pt_morphism.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_Morphisms_Prop_34) (E R : A → A → Prop),
  Equivalence E →
    (∀ (x y : A), E x y → ∀ (x_1 y_1 : A), E x_1 y_1 → (R x x_1 → R y y_1) ∧ (R y y_1 → R x x_1)) →
      ∀ (x y : A), E x y → (Acc R x → Acc R y) ∧ (Acc R y → Acc R x)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms_Prop.Acc_pt_morphism.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.Acc_pt_morphism.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms_Prop.Acc_rel_morphism

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.Acc_rel_morphism.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_Morphisms_Prop_36) (x y : A → A → Prop),
  (∀ (x_1 x_2 : A), x x_1 x_2 ↔ y x_1 x_2) →
    ∀ (x_1 y_1 : A), x_1 = y_1 → (Acc x x_1 → Acc y y_1) ∧ (Acc y y_1 → Acc x x_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms_Prop.Acc_rel_morphism.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.Acc_rel_morphism.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms_Prop.and_iff_morphism

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.and_iff_morphism.statement.correspondence

目标：native statement: ∀ (x y : Prop), (x ↔ y) → ∀ (x_1 y_1 : Prop), (x_1 ↔ y_1) → (x ∧ x_1 ↔ y ∧ y_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms_Prop.and_iff_morphism.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.and_iff_morphism.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms_Prop.and_iff_morphism_obligation_1

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.and_iff_morphism_obligation_1.statement.correspondence

目标：native statement: ∀ (x y : Prop), (x ↔ y) → ∀ (x_1 y_1 : Prop), (x_1 ↔ y_1) → (x ∧ x_1 ↔ y ∧ y_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms_Prop.and_iff_morphism_obligation_1.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.and_iff_morphism_obligation_1.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms_Prop.and_impl_morphism

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.and_impl_morphism.statement.correspondence

目标：native statement: ∀ (x y : Prop), (x → y) → ∀ (x_1 y_1 : Prop), (x_1 → y_1) → x ∧ x_1 → y ∧ y_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms_Prop.and_impl_morphism.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.and_impl_morphism.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms_Prop.and_impl_morphism_obligation_1

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.and_impl_morphism_obligation_1.statement.correspondence

目标：native statement: ∀ (x y : Prop), (x → y) → ∀ (x_1 y_1 : Prop), (x_1 → y_1) → x ∧ x_1 → y ∧ y_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms_Prop.and_impl_morphism_obligation_1.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.and_impl_morphism_obligation_1.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms_Prop.iff_iff_iff_impl_morphism

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.iff_iff_iff_impl_morphism.statement.correspondence

目标：native statement: ∀ (x y : Prop), (x ↔ y) → ∀ (x_1 y_1 : Prop), (x_1 ↔ y_1) → (x → x_1 ↔ y → y_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms_Prop.iff_iff_iff_impl_morphism.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.iff_iff_iff_impl_morphism.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms_Prop.iff_iff_iff_impl_morphism_obligation_1

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.iff_iff_iff_impl_morphism_obligation_1.statement.correspondence

目标：native statement: ∀ (x y : Prop), (x ↔ y) → ∀ (x_1 y_1 : Prop), (x_1 ↔ y_1) → (x → x_1 ↔ y → y_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms_Prop.iff_iff_iff_impl_morphism_obligation_1.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.iff_iff_iff_impl_morphism_obligation_1.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms_Prop.not_iff_morphism

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.not_iff_morphism.statement.correspondence

目标：native statement: ∀ (x y : Prop), (x ↔ y) → (¬x ↔ ¬y)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms_Prop.not_iff_morphism.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.not_iff_morphism.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms_Prop.not_iff_morphism_obligation_1

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.not_iff_morphism_obligation_1.statement.correspondence

目标：native statement: ∀ (x y : Prop), (x ↔ y) → (¬x ↔ ¬y)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms_Prop.not_iff_morphism_obligation_1.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.not_iff_morphism_obligation_1.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms_Prop.not_impl_morphism

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.not_impl_morphism.statement.correspondence

目标：native statement: ∀ (x y : Prop), (y → x) → ¬x → ¬y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms_Prop.not_impl_morphism.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.not_impl_morphism.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms_Prop.not_impl_morphism_obligation_1

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.not_impl_morphism_obligation_1.statement.correspondence

目标：native statement: ∀ (x y : Prop), (y → x) → ¬x → ¬y；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms_Prop.not_impl_morphism_obligation_1.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.not_impl_morphism_obligation_1.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms_Prop.or_iff_morphism

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.or_iff_morphism.statement.correspondence

目标：native statement: ∀ (x y : Prop), (x ↔ y) → ∀ (x_1 y_1 : Prop), (x_1 ↔ y_1) → (x ∨ x_1 ↔ y ∨ y_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms_Prop.or_iff_morphism.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.or_iff_morphism.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms_Prop.or_iff_morphism_obligation_1

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.or_iff_morphism_obligation_1.statement.correspondence

目标：native statement: ∀ (x y : Prop), (x ↔ y) → ∀ (x_1 y_1 : Prop), (x_1 ↔ y_1) → (x ∨ x_1 ↔ y ∨ y_1)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms_Prop.or_iff_morphism_obligation_1.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.or_iff_morphism_obligation_1.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms_Prop.or_impl_morphism

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.or_impl_morphism.statement.correspondence

目标：native statement: ∀ (x y : Prop), (x → y) → ∀ (x_1 y_1 : Prop), (x_1 → y_1) → x ∨ x_1 → y ∨ y_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms_Prop.or_impl_morphism.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.or_impl_morphism.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms_Prop.or_impl_morphism_obligation_1

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.or_impl_morphism_obligation_1.statement.correspondence

目标：native statement: ∀ (x y : Prop), (x → y) → ∀ (x_1 y_1 : Prop), (x_1 → y_1) → x ∨ x_1 → y ∨ y_1；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms_Prop.or_impl_morphism_obligation_1.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.or_impl_morphism_obligation_1.statement.native
```

公理闭包：propext, Quot.sound

## Corelib.Classes.Morphisms_Prop.well_founded_morphism

NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.well_founded_morphism.statement.correspondence

目标：native statement: ∀ (A : Type u_Corelib_Classes_Morphisms_Prop_39) (x y : A → A → Prop),
  (∀ (x_1 x_2 : A), x x_1 x_2 ↔ y x_1 x_2) →
    ((∀ (a : A), Acc x a) → ∀ (a : A), Acc y a) ∧ ((∀ (a : A), Acc y a) → ∀ (a : A), Acc x a)；范围：unconditional original statement; source-free body including NativeBridge alias expansion

```lean
Rocq.Corelib.Classes.Morphisms_Prop.well_founded_morphism.statement ↔
  NativeBridge.Incremental.Statements.Rocq.Corelib.Classes.Morphisms_Prop.well_founded_morphism.statement.native
```

公理闭包：propext, Quot.sound

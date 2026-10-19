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

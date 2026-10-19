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

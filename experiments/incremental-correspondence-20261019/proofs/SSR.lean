import Interface_ssr_ssrfun
set_option autoImplicit false
noncomputable section
namespace NativeBridge.Incremental
universe u v w u' v' w'
variable {A : Type u} {B : Type v} {C : Type w}
theorem ssr_option_apply_agrees (f : A → B) (d : B)
 (x : Rocq.Corelib.Init.Datatypes.option A) :
 Rocq.Corelib.ssr.ssrfun.Option.apply A B f d x =
 (optionTo x).elim d f := by cases x <;> rfl
theorem ssr_option_default_agrees (d : A) (x : Rocq.Corelib.Init.Datatypes.option A) :
 Rocq.Corelib.ssr.ssrfun.Option.default A d x = (optionTo x).getD d := by cases x <;> rfl
theorem ssr_option_lift_agrees (f : A → B) (x : A) :
 optionTo (Rocq.Corelib.ssr.ssrfun.Option.lift A B f x) = some (f x) := rfl
theorem ssr_option_map_agrees (f : A → B) (x : Rocq.Corelib.Init.Datatypes.option A) :
 optionTo (Rocq.Corelib.ssr.ssrfun.Option.map A B f x) = (optionTo x).map f := by
 cases x <;> rfl
theorem ssr_option_bind_agrees (f : A → Rocq.Corelib.Init.Datatypes.option B)
 (x : Rocq.Corelib.Init.Datatypes.option A) :
 optionTo (Rocq.Corelib.ssr.ssrfun.Option.bind A B f x) =
 (optionTo x).bind (fun a => optionTo (f a)) := by cases x <;> rfl
theorem ssr_comp_agrees {A : Sort u} {B : Sort v} {C : Sort w} (f : B → A) (g : C → B) :
 Rocq.Corelib.ssr.ssrfun.comp A B C f g = f ∘ g := rfl
theorem ssr_catcomp_agrees {A : Sort u} {B : Sort v} {C : Sort w} (g : C → B) (f : B → A) :
 Rocq.Corelib.ssr.ssrfun.catcomp A B C g f = f ∘ g := rfl
theorem ssr_idfun_agrees {A : Sort u} :
 Rocq.Corelib.ssr.ssrfun.idfun A = @id A := rfl

def simplFunIso (A : Sort u) (B : Sort v) :
 Iso (Rocq.Corelib.ssr.ssrfun.simpl_fun A B) (A → B) where
 to := Rocq.Corelib.ssr.ssrfun.fun_of_simpl A B
 of := Rocq.Corelib.ssr.ssrfun.simpl_fun.SimplFun A B
 of_to f := by cases f <;> rfl
 to_of f := rfl

theorem ssr_fun_of_simpl_agrees {A : Sort u} {B : Sort v}
 (f : Rocq.Corelib.ssr.ssrfun.simpl_fun A B) :
 Rocq.Corelib.ssr.ssrfun.fun_of_simpl A B f = (simplFunIso A B).to f := rfl

-- A useful native interface for a function packaged in SSR's simpl_fun.
def exportSimplFun {A : Sort u} {B : Sort v} {A' : Sort u'} {B' : Sort v'}
 (a : Iso A A') (b : Iso B B') (f : Rocq.Corelib.ssr.ssrfun.simpl_fun A B) : A' → B' :=
 ((simplFunIso A B).trans (Iso.functions a b)).to f

theorem exportSimplFun_roundtrip {A : Sort u} {B : Sort v} {A' : Sort u'} {B' : Sort v'}
 (a : Iso A A') (b : Iso B B') (f : Rocq.Corelib.ssr.ssrfun.simpl_fun A B) :
 ((simplFunIso A B).trans (Iso.functions a b)).of (exportSimplFun a b f) = f :=
 ((simplFunIso A B).trans (Iso.functions a b)).of_to f

-- Higher-order correspondence composition; explicit hypotheses are retained.
theorem transport_comp {A : Sort u} {B : Sort v} {C : Sort w}
 {A' : Sort u'} {B' : Sort v'} {C' : Sort w'}
 (a : Iso A A') (b : Iso B B') (c : Iso C C')
 (f : A → B) (g : B → C) (f' : A' → B') (g' : B' → C')
 (hf : ∀ x, b.to (f x) = f' (a.to x))
 (hg : ∀ y, c.to (g y) = g' (b.to y)) (x : A) :
 c.to (Rocq.Corelib.ssr.ssrfun.comp C B A g f x) = (g' ∘ f') (a.to x) := by
 change c.to (g (f x)) = _
 rw [hg, hf]
 rfl

-- Element-type conversion is composed with the container correspondence.
theorem ssr_option_map_transport {A' : Type u'} {B' : Type v'}
 (a : Iso A A') (b : Iso B B') (f : A → B) (g : A' → B')
 (h : ∀ x, b.to (f x) = g (a.to x)) (x : Rocq.Corelib.Init.Datatypes.option A) :
 (optionTo (Rocq.Corelib.ssr.ssrfun.Option.map A B f x)).map b.to =
 ((optionTo x).map a.to).map g := by
 cases x with
 | Some x => change some (b.to (f x)) = some (g (a.to x)); rw [h]
 | None => rfl

-- Registered rewrite rules: this first version checks a supplied native target.
syntax "native_correspondence" : tactic
macro_rules
 | `(tactic| native_correspondence) =>
   `(tactic| simp only [ssr_option_apply_agrees, ssr_option_default_agrees,
     ssr_option_lift_agrees, ssr_option_map_agrees, ssr_option_bind_agrees,
     ssr_comp_agrees, ssr_catcomp_agrees, ssr_idfun_agrees])

def compositeNative (f : A → B) (g : B → C) (x : Option A) : Option C :=
 x.map (g ∘ f)
theorem composite_agrees (f : A → B) (g : B → C) (x : Rocq.Corelib.Init.Datatypes.option A) :
 optionTo (Rocq.Corelib.ssr.ssrfun.Option.map A C
  (Rocq.Corelib.ssr.ssrfun.comp C B A g f) x) = compositeNative f g (optionTo x) := by
 unfold compositeNative
 native_correspondence

theorem bind_composite_agrees (f : A → Rocq.Corelib.Init.Datatypes.option B) (g : B → C)
 (x : Rocq.Corelib.Init.Datatypes.option A) :
 optionTo (Rocq.Corelib.ssr.ssrfun.Option.bind A C
  (fun y => Rocq.Corelib.ssr.ssrfun.Option.map B C g (f y)) x) =
 (optionTo x).bind (fun y => (optionTo (f y)).map g) := by
 native_correspondence

-- Wrong primitive identification must fail; no unknown operation is assumed.
example : True := by
 fail_if_success
  have bad : ∀ x : Rocq.Corelib.Init.Datatypes.option Nat,
    optionTo (Rocq.Corelib.ssr.ssrfun.Option.map Nat Nat (fun n => n+1) x) =
    (optionTo x).map (fun n => n+2) := by
     intro x
     native_correspondence
 trivial
end NativeBridge.Incremental

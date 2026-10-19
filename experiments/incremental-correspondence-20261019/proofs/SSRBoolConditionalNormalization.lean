import SSRBoolWitnesses
noncomputable section
namespace NativeBridge.Incremental.SSRBoolConditionalNormalization
open NativeBridge
universe u v w
theorem bijective_agrees (A : Type u) (B : Type v) (f : B → A) :
    Rocq.Corelib.ssr.ssrfun.bijective A B f ↔
      ∃ g : A → B, (∀ x, g (f x) = x) ∧ (∀ y, f (g y) = y) := by
  constructor
  · intro h
    cases h with
    | Bijective g h₁ h₂ => exact ⟨g,fun x => eqTo (h₁ x),fun y => eqTo (h₂ y)⟩
  · rintro ⟨g,h₁,h₂⟩
    exact .Bijective A B f g (fun x => eqOf (h₁ x)) (fun y => eqOf (h₂ y))

def sigTo {A : Sort u} {P : A → Prop} : Rocq.Corelib.Init.Specif.sig A P → Subtype P
  | .exist _ _ a h => ⟨a,h⟩
def sigOf {A : Sort u} {P : A → Prop} (x : Subtype P) : Rocq.Corelib.Init.Specif.sig A P :=
  .exist A P x.val x.property
theorem sig_of_to {A : Sort u} {P : A → Prop} (x : Rocq.Corelib.Init.Specif.sig A P) :
    sigOf (sigTo x) = x := by cases x; rfl
theorem sig_forall {A : Sort u} {P : A → Prop} (F : Rocq.Corelib.Init.Specif.sig A P → Prop) :
    (∀ x, F x) ↔ ∀ x : Subtype P, F (sigOf x) := by
  constructor
  · intro h x; exact h _
  · intro h x; simpa only [sig_of_to] using h (sigTo x)
theorem sig_projection {A : Sort u} {P : A → Prop} (x : Subtype P) :
    Rocq.Corelib.Init.Specif.proj1_sig A P (sigOf x) = x.val := rfl


end NativeBridge.Incremental.SSRBoolConditionalNormalization
noncomputable section
namespace NativeBridge.Incremental.SSRBoolConditionalOption
open NativeBridge
universe u v w
def to {A : Sort u} : Rocq.Corelib.Init.Datatypes.option A → Option (PLift A)
  | .None _ => none
  | .Some _ a => some (.up a)
def of {A : Sort u} : Option (PLift A) → Rocq.Corelib.Init.Datatypes.option A
  | none => .None A
  | some a => .Some A a.down
theorem of_to {A : Sort u} (x : Rocq.Corelib.Init.Datatypes.option A) : of (to x) = x := by cases x <;> rfl
theorem to_of {A : Sort u} (x : Option (PLift A)) : to (of x) = x := by cases x <;> rfl
theorem equality {A : Sort u} (x y : Rocq.Corelib.Init.Datatypes.option A) :
    (x = y) ↔ to x = to y := by
  constructor
  · exact congrArg to
  · intro h; simpa only [of_to] using congrArg of h
theorem forall_native {A : Sort u} (F : Rocq.Corelib.Init.Datatypes.option A → Prop) :
    (∀ x, F x) ↔ ∀ x : Option (PLift A), F (of x) := by
  constructor
  · intro h x; exact h _
  · intro h x; simpa only [of_to] using h (to x)
theorem function_forall {A : Sort u} {B : Sort v} (F : (A → Rocq.Corelib.Init.Datatypes.option B) → Prop) :
    (∀ f, F f) ↔ ∀ f : A → Option (PLift B), F (fun x => of (f x)) := by
  constructor
  · intro h f; exact h _
  · intro h f
    have hf : (fun x => of (to (f x))) = f := by funext x; exact of_to _
    simpa only [hf] using h (fun x => to (f x))
theorem to_some {A : Sort u} (a : A) : to (Rocq.Corelib.Init.Datatypes.option.Some A a) = some (.up a) := rfl
theorem to_none {A : Sort u} : to (Rocq.Corelib.Init.Datatypes.option.None A) = (none : Option (PLift A)) := rfl
theorem apply_agrees {A : Sort u} {B : Sort v} (f : A → B) (d : B)
    (x : Rocq.Corelib.Init.Datatypes.option A) :
    Rocq.Corelib.ssr.ssrfun.Option.apply A B f d x =
      (to x).elim d (fun a => f a.down) := by cases x <;> rfl
theorem bind_agrees {A : Sort u} {B : Sort v} (f : A → Rocq.Corelib.Init.Datatypes.option B)
    (x : Rocq.Corelib.Init.Datatypes.option A) :
    to (Rocq.Corelib.ssr.ssrfun.Option.bind A B f x) = (to x).bind (fun a => to (f a.down)) := by cases x <;> rfl
theorem function_equality {A : Sort u} {B : Sort v}
    (f g : A → Rocq.Corelib.Init.Datatypes.option B) :
    (f = g) ↔ ∀ x, to (f x) = to (g x) := by
  constructor
  · intro h x; exact congrArg (fun k => to (k x)) h
  · intro h; funext x; exact (equality _ _).mpr (h x)


theorem to_elim {A : Type u} {B : Sort v} (x : Option A)
    (d : Rocq.Corelib.Init.Datatypes.option B) (f : A → Rocq.Corelib.Init.Datatypes.option B) :
    to (x.elim d f) = x.elim (to d) (fun a => to (f a)) := by cases x <;> rfl

end NativeBridge.Incremental.SSRBoolConditionalOption

namespace NativeBridge.Incremental.SSRBoolConditionalOption
open NativeBridge
universe u
theorem pred_oapp_agrees (A : Type u) (p : A → RBool) (x : Rocq.Corelib.Init.Datatypes.option A) :
    boolTo (Rocq.Corelib.ssr.ssrbool.pred_oapp A p x) = (to x).any (fun a => boolTo (p a.down)) := by
  cases x <;> rfl
end NativeBridge.Incremental.SSRBoolConditionalOption

namespace NativeBridge.Incremental.SSRBoolConditionalNormalization
open NativeBridge
universe u
def sigNativeBoolOf {A : Type u} (p : A → Bool) (x : {a // p a = true}) :
    Rocq.Corelib.Init.Specif.sig A (fun a => Rocq.Corelib.Init.Datatypes.is_true (boolOf (p a))) :=
  .exist A _ x.val ((is_true_agrees _).mpr (by simpa only [bool_to_of] using x.property))
def sigNativeBoolTo {A : Type u} (p : A → Bool)
    (x : Rocq.Corelib.Init.Specif.sig A (fun a => Rocq.Corelib.Init.Datatypes.is_true (boolOf (p a)))) :
    {a // p a = true} :=
  match x with | .exist _ _ a ha => ⟨a,by simpa only [bool_to_of] using (is_true_agrees _).mp ha⟩
theorem sigNativeBool_of_to {A : Type u} (p : A → Bool)
    (x : Rocq.Corelib.Init.Specif.sig A (fun a => Rocq.Corelib.Init.Datatypes.is_true (boolOf (p a)))) :
    sigNativeBoolOf p (sigNativeBoolTo p x) = x := by cases x; rfl
theorem sigNativeBool_forall (A : Type u) (p : A → Bool)
    (F : Rocq.Corelib.Init.Specif.sig A (fun a => Rocq.Corelib.Init.Datatypes.is_true (boolOf (p a))) → Prop) :
    (∀ x, F x) ↔ ∀ x : {a // p a = true}, F (sigNativeBoolOf p x) := by
  constructor
  · intro h x; exact h _
  · intro h x; simpa only [sigNativeBool_of_to] using h (sigNativeBoolTo p x)
theorem sigNativeBool_projection {A : Type u} (p : A → Bool) (x : {a // p a = true}) :
    Rocq.Corelib.Init.Specif.proj1_sig A _ (sigNativeBoolOf p x) = x.val := rfl
end NativeBridge.Incremental.SSRBoolConditionalNormalization

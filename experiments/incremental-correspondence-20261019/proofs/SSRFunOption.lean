import SSRFunNormalization
noncomputable section
namespace NativeBridge.Incremental.SSRFunOption
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
theorem default_agrees {A : Sort u} (d : A) (x : Rocq.Corelib.Init.Datatypes.option A) :
    Rocq.Corelib.ssr.ssrfun.Option.default A d x = ((to x).getD (.up d)).down := by cases x <;> rfl
theorem map_agrees {A : Sort u} {B : Sort v} (f : A → B) (x : Rocq.Corelib.Init.Datatypes.option A) :
    to (Rocq.Corelib.ssr.ssrfun.Option.map A B f x) = (to x).map (fun a => PLift.up (f a.down)) := by
  cases x <;> rfl
theorem bind_agrees {A : Sort u} {B : Sort v} (f : A → Rocq.Corelib.Init.Datatypes.option B)
    (x : Rocq.Corelib.Init.Datatypes.option A) :
    to (Rocq.Corelib.ssr.ssrfun.Option.bind A B f x) = (to x).bind (fun a => to (f a.down)) := by cases x <;> rfl
theorem lift_agrees {A : Sort u} {B : Sort v} (f : A → B) (x : A) :
    to (Rocq.Corelib.ssr.ssrfun.Option.lift A B f x) = some (PLift.up (f x)) := rfl
theorem empty_forall (F : Rocq.Corelib.Init.Datatypes.Empty_set → Prop) :
    (∀ x, F x) ↔ True := by constructor; intro _; trivial; intro _ x; cases x

theorem function_equality {A : Sort u} {B : Sort v}
    (f g : A → Rocq.Corelib.Init.Datatypes.option B) :
    (f = g) ↔ ∀ x, to (f x) = to (g x) := by
  constructor
  · intro h x; exact congrArg (fun k => to (k x)) h
  · intro h; funext x; exact (equality _ _).mpr (h x)


theorem to_elim {A : Type u} {B : Sort v} (x : Option A)
    (d : Rocq.Corelib.Init.Datatypes.option B) (f : A → Rocq.Corelib.Init.Datatypes.option B) :
    to (x.elim d f) = x.elim (to d) (fun a => to (f a)) := by cases x <;> rfl

end NativeBridge.Incremental.SSRFunOption

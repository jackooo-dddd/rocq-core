import Lists
noncomputable section
namespace NativeBridge.Incremental.ListBridge
open NativeBridge
universe u v
def comparisonTo : Rocq.Corelib.Init.Datatypes.comparison → Ordering :=
  Rocq.Corelib.Init.Datatypes.comparison.rec .eq .lt .gt
theorem list_compare_agrees {A : Type u}
    (cmp : A → A → Rocq.Corelib.Init.Datatypes.comparison) (xs ys : RList A) :
    comparisonTo (Rocq.Corelib.Lists.ListDef.list_compare A cmp xs ys) =
      List.compareLex (fun x y => comparisonTo (cmp x y)) (listTo xs) (listTo ys) := by
  induction xs generalizing ys with
  | nil => cases ys <;> rfl
  | cons x xs ih =>
    cases ys with
    | nil => rfl
    | cons y ys =>
      simp only [Rocq.Corelib.Lists.ListDef.list_compare, listTo, List.compareLex]
      cases h : cmp x y <;> simp only [h, comparisonTo] <;> try rfl
      exact ih ys
theorem list_forall {A : Type u} (P : RList A → Prop) :
    (∀ xs, P xs) ↔ ∀ xs : List A, P (listOf xs) :=
  by
    constructor
    · intro h xs; exact h _
    · intro h xs; simpa only [list_of_to] using h (listTo xs)
theorem list_family_forall {A : Type u} {B : Sort v} (F : (RList A → B) → Prop) :
    (∀ f, F f) ↔ ∀ f : List A → B, F (fun xs => f (listTo xs)) := by
  constructor
  · intro h f; exact h _
  · intro h f; simpa only [list_of_to] using h (fun xs => f (listOf xs))
@[simp] theorem listTo_nil {A : Type u} :
    listTo (Rocq.Corelib.Init.Datatypes.list.nil A) = [] := rfl
@[simp] theorem listTo_cons {A : Type u} (x : A) (xs : RList A) :
    listTo (Rocq.Corelib.Init.Datatypes.list.cons A x xs) = x :: listTo xs := rfl
end NativeBridge.Incremental.ListBridge

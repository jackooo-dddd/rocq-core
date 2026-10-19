import DatatypeNormalization
noncomputable section
namespace NativeBridge.Incremental.DatatypeQuantifiers
open NativeBridge NativeBridge.Incremental NativeBridge.Incremental.DatatypeNormalization
universe u v w

theorem bool_of_to  (x : RBool) : boolOf (boolTo x) = x := (boolIso).of_to x
theorem bool_to_of  (x : Bool) : boolTo (boolOf x) = x := (boolIso).to_of x
theorem bool_forall  (P : RBool → Prop) :
    (∀ x, P x) ↔ ∀ x : Bool, P (boolOf x) := by
  constructor
  · intro h x; exact h _
  · intro h x; simpa only [bool_of_to] using h (boolTo x)
theorem bool_family_forall  {C : Sort w} (F : (RBool → C) → Prop) :
    (∀ f, F f) ↔ ∀ f : Bool → C, F (fun x => f (boolTo x)) := by
  constructor
  · intro h f; exact h _
  · intro h f; simpa only [bool_of_to] using h (fun x => f (boolOf x))
theorem bool_eq  (x y : RBool) :
    (x=y) ↔ boolTo x = boolTo y := ((boolIso).eq_iff x y).symm

theorem comparison_of_to  (x : RComparison) : comparisonOf (comparisonTo x) = x := (comparisonIso).of_to x
theorem comparison_to_of  (x : Ordering) : comparisonTo (comparisonOf x) = x := (comparisonIso).to_of x
theorem comparison_forall  (P : RComparison → Prop) :
    (∀ x, P x) ↔ ∀ x : Ordering, P (comparisonOf x) := by
  constructor
  · intro h x; exact h _
  · intro h x; simpa only [comparison_of_to] using h (comparisonTo x)
theorem comparison_family_forall  {C : Sort w} (F : (RComparison → C) → Prop) :
    (∀ f, F f) ↔ ∀ f : Ordering → C, F (fun x => f (comparisonTo x)) := by
  constructor
  · intro h f; exact h _
  · intro h f; simpa only [comparison_of_to] using h (fun x => f (comparisonOf x))
theorem comparison_eq  (x y : RComparison) :
    (x=y) ↔ comparisonTo x = comparisonTo y := ((comparisonIso).eq_iff x y).symm

theorem unit_of_to  (x : Rocq.Corelib.Init.Datatypes.unit) : unitIso.of (unitIso.to x) = x := (unitIso).of_to x
theorem unit_to_of  (x : Unit) : unitIso.to (unitIso.of x) = x := (unitIso).to_of x
theorem unit_forall  (P : Rocq.Corelib.Init.Datatypes.unit → Prop) :
    (∀ x, P x) ↔ ∀ x : Unit, P (unitIso.of x) := by
  constructor
  · intro h x; exact h _
  · intro h x; simpa only [unit_of_to] using h (unitIso.to x)
theorem unit_family_forall  {C : Sort w} (F : (Rocq.Corelib.Init.Datatypes.unit → C) → Prop) :
    (∀ f, F f) ↔ ∀ f : Unit → C, F (fun x => f (unitIso.to x)) := by
  constructor
  · intro h f; exact h _
  · intro h f; simpa only [unit_of_to] using h (fun x => f (unitIso.of x))
theorem unit_eq  (x y : Rocq.Corelib.Init.Datatypes.unit) :
    (x=y) ↔ unitIso.to x = unitIso.to y := ((unitIso).eq_iff x y).symm

theorem empty_of_to  (x : Rocq.Corelib.Init.Datatypes.Empty_set) : emptyIso.of (emptyIso.to x) = x := (emptyIso).of_to x
theorem empty_to_of  (x : Empty) : emptyIso.to (emptyIso.of x) = x := (emptyIso).to_of x
theorem empty_forall  (P : Rocq.Corelib.Init.Datatypes.Empty_set → Prop) :
    (∀ x, P x) ↔ ∀ x : Empty, P (emptyIso.of x) := by
  constructor
  · intro h x; exact h _
  · intro h x; simpa only [empty_of_to] using h (emptyIso.to x)
theorem empty_family_forall  {C : Sort w} (F : (Rocq.Corelib.Init.Datatypes.Empty_set → C) → Prop) :
    (∀ f, F f) ↔ ∀ f : Empty → C, F (fun x => f (emptyIso.to x)) := by
  constructor
  · intro h f; exact h _
  · intro h f; simpa only [empty_of_to] using h (fun x => f (emptyIso.of x))
theorem empty_eq  (x y : Rocq.Corelib.Init.Datatypes.Empty_set) :
    (x=y) ↔ emptyIso.to x = emptyIso.to y := ((emptyIso).eq_iff x y).symm

theorem list_of_to {A : Sort u} (x : Rocq.Corelib.Init.Datatypes.list A) : fullListOf (fullListTo x) = x := (fullListIso A).of_to x
theorem list_to_of {A : Sort u} (x : List (PLift A)) : fullListTo (fullListOf x) = x := (fullListIso A).to_of x
theorem list_forall {A : Sort u} (P : Rocq.Corelib.Init.Datatypes.list A → Prop) :
    (∀ x, P x) ↔ ∀ x : List (PLift A), P (fullListOf x) := by
  constructor
  · intro h x; exact h _
  · intro h x; simpa only [list_of_to] using h (fullListTo x)
theorem list_family_forall {A : Sort u} {C : Sort w} (F : (Rocq.Corelib.Init.Datatypes.list A → C) → Prop) :
    (∀ f, F f) ↔ ∀ f : List (PLift A) → C, F (fun x => f (fullListTo x)) := by
  constructor
  · intro h f; exact h _
  · intro h f; simpa only [list_of_to] using h (fun x => f (fullListOf x))
theorem list_eq {A : Sort u} (x y : Rocq.Corelib.Init.Datatypes.list A) :
    (x=y) ↔ fullListTo x = fullListTo y := ((fullListIso A).eq_iff x y).symm

theorem option_of_to {A : Sort u} (x : Rocq.Corelib.Init.Datatypes.option A) : fullOptionOf (fullOptionTo x) = x := (fullOptionIso A).of_to x
theorem option_to_of {A : Sort u} (x : Option (PLift A)) : fullOptionTo (fullOptionOf x) = x := (fullOptionIso A).to_of x
theorem option_forall {A : Sort u} (P : Rocq.Corelib.Init.Datatypes.option A → Prop) :
    (∀ x, P x) ↔ ∀ x : Option (PLift A), P (fullOptionOf x) := by
  constructor
  · intro h x; exact h _
  · intro h x; simpa only [option_of_to] using h (fullOptionTo x)
theorem option_family_forall {A : Sort u} {C : Sort w} (F : (Rocq.Corelib.Init.Datatypes.option A → C) → Prop) :
    (∀ f, F f) ↔ ∀ f : Option (PLift A) → C, F (fun x => f (fullOptionTo x)) := by
  constructor
  · intro h f; exact h _
  · intro h f; simpa only [option_of_to] using h (fun x => f (fullOptionOf x))
theorem option_eq {A : Sort u} (x y : Rocq.Corelib.Init.Datatypes.option A) :
    (x=y) ↔ fullOptionTo x = fullOptionTo y := ((fullOptionIso A).eq_iff x y).symm

theorem result_of_to {A : Sort u} {E : Sort v} (x : Rocq.Corelib.Init.Datatypes.result A E) : fullResultOf (fullResultTo x) = x := (fullResultIso A E).of_to x
theorem result_to_of {A : Sort u} {E : Sort v} (x : Except (PLift E) (PLift A)) : fullResultTo (fullResultOf x) = x := (fullResultIso A E).to_of x
theorem result_forall {A : Sort u} {E : Sort v} (P : Rocq.Corelib.Init.Datatypes.result A E → Prop) :
    (∀ x, P x) ↔ ∀ x : Except (PLift E) (PLift A), P (fullResultOf x) := by
  constructor
  · intro h x; exact h _
  · intro h x; simpa only [result_of_to] using h (fullResultTo x)
theorem result_family_forall {A : Sort u} {E : Sort v} {C : Sort w} (F : (Rocq.Corelib.Init.Datatypes.result A E → C) → Prop) :
    (∀ f, F f) ↔ ∀ f : Except (PLift E) (PLift A) → C, F (fun x => f (fullResultTo x)) := by
  constructor
  · intro h f; exact h _
  · intro h f; simpa only [result_of_to] using h (fun x => f (fullResultOf x))
theorem result_eq {A : Sort u} {E : Sort v} (x y : Rocq.Corelib.Init.Datatypes.result A E) :
    (x=y) ↔ fullResultTo x = fullResultTo y := ((fullResultIso A E).eq_iff x y).symm

theorem prod_of_to {A : Sort u} {B : Sort v} (x : Rocq.Corelib.Init.Datatypes.prod A B) : pprodOf (pprodTo x) = x := (pprodIso A B).of_to x
theorem prod_to_of {A : Sort u} {B : Sort v} (x : PProd A B) : pprodTo (pprodOf x) = x := (pprodIso A B).to_of x
theorem prod_forall {A : Sort u} {B : Sort v} (P : Rocq.Corelib.Init.Datatypes.prod A B → Prop) :
    (∀ x, P x) ↔ ∀ x : PProd A B, P (pprodOf x) := by
  constructor
  · intro h x; exact h _
  · intro h x; simpa only [prod_of_to] using h (pprodTo x)
theorem prod_family_forall {A : Sort u} {B : Sort v} {C : Sort w} (F : (Rocq.Corelib.Init.Datatypes.prod A B → C) → Prop) :
    (∀ f, F f) ↔ ∀ f : PProd A B → C, F (fun x => f (pprodTo x)) := by
  constructor
  · intro h f; exact h _
  · intro h f; simpa only [prod_of_to] using h (fun x => f (pprodOf x))
theorem prod_eq {A : Sort u} {B : Sort v} (x y : Rocq.Corelib.Init.Datatypes.prod A B) :
    (x=y) ↔ pprodTo x = pprodTo y := ((pprodIso A B).eq_iff x y).symm

theorem sum_of_to {A : Sort u} {B : Sort v} (x : Rocq.Corelib.Init.Datatypes.sum A B) : psumOf (psumTo x) = x := (psumIso A B).of_to x
theorem sum_to_of {A : Sort u} {B : Sort v} (x : PSum A B) : psumTo (psumOf x) = x := (psumIso A B).to_of x
theorem sum_forall {A : Sort u} {B : Sort v} (P : Rocq.Corelib.Init.Datatypes.sum A B → Prop) :
    (∀ x, P x) ↔ ∀ x : PSum A B, P (psumOf x) := by
  constructor
  · intro h x; exact h _
  · intro h x; simpa only [sum_of_to] using h (psumTo x)
theorem sum_family_forall {A : Sort u} {B : Sort v} {C : Sort w} (F : (Rocq.Corelib.Init.Datatypes.sum A B → C) → Prop) :
    (∀ f, F f) ↔ ∀ f : PSum A B → C, F (fun x => f (psumTo x)) := by
  constructor
  · intro h f; exact h _
  · intro h f; simpa only [sum_of_to] using h (fun x => f (psumOf x))
theorem sum_eq {A : Sort u} {B : Sort v} (x y : Rocq.Corelib.Init.Datatypes.sum A B) :
    (x=y) ↔ psumTo x = psumTo y := ((psumIso A B).eq_iff x y).symm

end NativeBridge.Incremental.DatatypeQuantifiers

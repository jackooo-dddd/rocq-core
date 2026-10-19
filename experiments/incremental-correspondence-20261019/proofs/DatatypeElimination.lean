import Datatypes
noncomputable section
namespace NativeBridge.Incremental
open NativeBridge
universe u v w z
def pprodTo {A : Sort u} {B : Sort v} :
    Rocq.Corelib.Init.Datatypes.prod A B → PProd A B :=
  Rocq.Corelib.Init.Datatypes.prod.rec (fun a b => ⟨a, b⟩)
def pprodOf {A : Sort u} {B : Sort v} (s : PProd A B) :
    Rocq.Corelib.Init.Datatypes.prod A B := .pair A B s.1 s.2
def pprodIso (A : Sort u) (B : Sort v) :
    Iso (Rocq.Corelib.Init.Datatypes.prod A B) (PProd A B) where
  to := pprodTo
  of := pprodOf
  of_to s := by cases s <;> rfl
  to_of s := by cases s <;> rfl


def psumTo {A : Sort u} {B : Sort v} :
    Rocq.Corelib.Init.Datatypes.sum A B → PSum A B :=
  Rocq.Corelib.Init.Datatypes.sum.rec PSum.inl PSum.inr
def psumOf {A : Sort u} {B : Sort v} : PSum A B → Rocq.Corelib.Init.Datatypes.sum A B
  | .inl a => .inl A B a
  | .inr b => .inr A B b
def psumIso (A : Sort u) (B : Sort v) :
    Iso (Rocq.Corelib.Init.Datatypes.sum A B) (PSum A B) where
  to := psumTo
  of := psumOf
  of_to s := by cases s <;> rfl
  to_of s := by cases s <;> rfl

theorem datatypes_bool_rec_agrees (P : Bool → Type) (t : P true) (f : P false) (b : RBool) :
    Rocq.Corelib.Init.Datatypes.bool_rec (fun b => P (boolTo b)) t f b =
      Bool.rec f t (boolTo b) := by
  cases b <;> rfl

theorem datatypes_bool_rect_agrees (P : Bool → Sort z) (t : P true) (f : P false) (b : RBool) :
    Rocq.Corelib.Init.Datatypes.bool_rect (fun b => P (boolTo b)) t f b =
      Bool.rec f t (boolTo b) := by
  cases b <;> rfl

theorem datatypes_comparison_rec_agrees (P : Ordering → Type) (e : P .eq) (l : P .lt) (g : P .gt) (c : RComparison) :
    Rocq.Corelib.Init.Datatypes.comparison_rec (fun c => P (comparisonTo c)) e l g c =
      Ordering.rec l e g (comparisonTo c) := by
  cases c <;> rfl

theorem datatypes_comparison_rect_agrees (P : Ordering → Sort z) (e : P .eq) (l : P .lt) (g : P .gt) (c : RComparison) :
    Rocq.Corelib.Init.Datatypes.comparison_rect (fun c => P (comparisonTo c)) e l g c =
      Ordering.rec l e g (comparisonTo c) := by
  cases c <;> rfl

theorem datatypes_unit_rec_agrees (P : Unit → Type) (h : P ()) (s : Rocq.Corelib.Init.Datatypes.unit) :
    Rocq.Corelib.Init.Datatypes.unit_rec (fun s => P (unitIso.to s)) h s =
      PUnit.rec h (unitIso.to s) := by
  cases s <;> rfl

theorem datatypes_unit_rect_agrees (P : Unit → Sort z) (h : P ()) (s : Rocq.Corelib.Init.Datatypes.unit) :
    Rocq.Corelib.Init.Datatypes.unit_rect (fun s => P (unitIso.to s)) h s =
      PUnit.rec h (unitIso.to s) := by
  cases s <;> rfl

theorem datatypes_Empty_set_rec_agrees (P : Empty → Type) (s : Rocq.Corelib.Init.Datatypes.Empty_set) :
    Rocq.Corelib.Init.Datatypes.Empty_set_rec (fun s => P (emptyIso.to s)) s =
      Empty.rec P (emptyIso.to s) := by
  cases s

theorem datatypes_Empty_set_rect_agrees (P : Empty → Sort z) (s : Rocq.Corelib.Init.Datatypes.Empty_set) :
    Rocq.Corelib.Init.Datatypes.Empty_set_rect (fun s => P (emptyIso.to s)) s =
      Empty.rec P (emptyIso.to s) := by
  cases s

theorem datatypes_option_rec_agrees {A : Type u} (P : Option A → Type) (f : (a : A) → P (some a)) (n : P none) (s : Rocq.Corelib.Init.Datatypes.option A) :
    Rocq.Corelib.Init.Datatypes.option_rec A (fun s => P (optionTo s)) f n s =
      Option.rec n f (optionTo s) := by
  cases s <;> rfl

theorem datatypes_option_rect_agrees {A : Type u} (P : Option A → Sort z) (f : (a : A) → P (some a)) (n : P none) (s : Rocq.Corelib.Init.Datatypes.option A) :
    Rocq.Corelib.Init.Datatypes.option_rect A (fun s => P (optionTo s)) f n s =
      Option.rec n f (optionTo s) := by
  cases s <;> rfl

theorem datatypes_list_rec_agrees {A : Type u} (P : List A → Type) (n : P []) (c : (a : A) → (as : List A) → P as → P (a :: as)) (s : RList A) :
    Rocq.Corelib.Init.Datatypes.list_rec A (fun s => P (listTo s)) n (fun a as ih => c a (listTo as) ih) s =
      List.rec n c (listTo s) := by
  induction s with
  | nil => rfl
  | cons a as ih => exact congrArg (c a (listTo as)) ih

theorem datatypes_list_rect_agrees {A : Type u} (P : List A → Sort z) (n : P []) (c : (a : A) → (as : List A) → P as → P (a :: as)) (s : RList A) :
    Rocq.Corelib.Init.Datatypes.list_rect A (fun s => P (listTo s)) n (fun a as ih => c a (listTo as) ih) s =
      List.rec n c (listTo s) := by
  induction s with
  | nil => rfl
  | cons a as ih => exact congrArg (c a (listTo as)) ih

theorem datatypes_prod_rec_agrees {A : Sort u} {B : Sort v} (P : PProd A B → Type) (f : (a : A) → (b : B) → P ⟨a,b⟩) (s : Rocq.Corelib.Init.Datatypes.prod A B) :
    Rocq.Corelib.Init.Datatypes.prod_rec A B (fun s => P (pprodTo s)) f s =
      PProd.rec f (pprodTo s) := by
  cases s <;> rfl

theorem datatypes_prod_rect_agrees {A : Sort u} {B : Sort v} (P : PProd A B → Sort z) (f : (a : A) → (b : B) → P ⟨a,b⟩) (s : Rocq.Corelib.Init.Datatypes.prod A B) :
    Rocq.Corelib.Init.Datatypes.prod_rect A B (fun s => P (pprodTo s)) f s =
      PProd.rec f (pprodTo s) := by
  cases s <;> rfl

theorem datatypes_sum_rec_agrees {A : Sort u} {B : Sort v} (P : PSum A B → Type) (l : (a : A) → P (.inl a)) (r : (b : B) → P (.inr b)) (s : Rocq.Corelib.Init.Datatypes.sum A B) :
    Rocq.Corelib.Init.Datatypes.sum_rec A B (fun s => P (psumTo s)) l r s =
      PSum.rec l r (psumTo s) := by
  cases s <;> rfl

theorem datatypes_sum_rect_agrees {A : Sort u} {B : Sort v} (P : PSum A B → Sort z) (l : (a : A) → P (.inl a)) (r : (b : B) → P (.inr b)) (s : Rocq.Corelib.Init.Datatypes.sum A B) :
    Rocq.Corelib.Init.Datatypes.sum_rect A B (fun s => P (psumTo s)) l r s =
      PSum.rec l r (psumTo s) := by
  cases s <;> rfl

theorem datatypes_result_rec_agrees {A : Type u} {E : Type v} (P : Except E A → Type) (ok : (a : A) → P (.ok a)) (error : (e : E) → P (.error e)) (s : Rocq.Corelib.Init.Datatypes.result A E) :
    Rocq.Corelib.Init.Datatypes.result_rec A E (fun s => P (resultTo s)) ok error s =
      Except.rec error ok (resultTo s) := by
  cases s <;> rfl

theorem datatypes_result_rect_agrees {A : Type u} {E : Type v} (P : Except E A → Sort z) (ok : (a : A) → P (.ok a)) (error : (e : E) → P (.error e)) (s : Rocq.Corelib.Init.Datatypes.result A E) :
    Rocq.Corelib.Init.Datatypes.result_rect A E (fun s => P (resultTo s)) ok error s =
      Except.rec error ok (resultTo s) := by
  cases s <;> rfl

theorem datatypes_curry_agrees {A : Sort u} {B : Sort v} {C : Sort w}
    (f : PProd A B → C) (a : A) (b : B) :
    Rocq.Corelib.Init.Datatypes.curry A B C (fun p => f (pprodTo p)) a b = f ⟨a,b⟩ := rfl
theorem datatypes_uncurry_agrees {A : Sort u} {B : Sort v} {C : Sort w}
    (f : A → B → C) (p : Rocq.Corelib.Init.Datatypes.prod A B) :
    Rocq.Corelib.Init.Datatypes.uncurry A B C f p = f (pprodTo p).1 (pprodTo p).2 := by
  cases p <;> rfl
theorem datatypes_id_agrees (A : Type u) (x : A) :
    Rocq.Corelib.Init.Datatypes.id A x = id x := rfl
theorem datatypes_ID_agrees :
    Rocq.Corelib.Init.Datatypes.ID.{u} = ((A : Type u) → A → A) := rfl
theorem datatypes_IDProp_agrees :
    Rocq.Corelib.Init.Datatypes.IDProp ↔ (∀ A : Prop, A → A) := Iff.rfl

end NativeBridge.Incremental

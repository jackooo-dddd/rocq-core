import SSRBoolData
set_option autoImplicit false
noncomputable section
namespace NativeBridge.Incremental.SSRBoolLogic
open NativeBridge
universe u v
theorem and3_agrees (P1 P2 P3 : Prop) : Rocq.Corelib.ssr.ssrbool.and3 P1 P2 P3 ↔ (P1 ∧ P2 ∧ P3) := by
  constructor
  · intro h; cases h with | And3 h1 h2 h3 => exact ⟨h1,h2,h3⟩
  · rintro ⟨h1,h2,h3⟩; exact .And3 P1 P2 P3 h1 h2 h3
def and3Iso (P1 P2 P3 : Prop) : Iso (Rocq.Corelib.ssr.ssrbool.and3 P1 P2 P3) (P1 ∧ P2 ∧ P3) where
  to := (and3_agrees P1 P2 P3).mp
  of := (and3_agrees P1 P2 P3).mpr
  of_to _ := rfl
  to_of _ := rfl
theorem and3_rec_agrees (P1 P2 P3 : Prop) (C : Type)
    (f : P1 → P2 → P3 → C) (h : P1 ∧ P2 ∧ P3) :
    Rocq.Corelib.ssr.ssrbool.and3_rec P1 P2 P3 C f ((and3Iso P1 P2 P3).of h) =
      f (h.1) (h.2.1) (h.2.2) := by cases (and3Iso P1 P2 P3).of h; rfl
theorem and3_rect_agrees (P1 P2 P3 : Prop) (C : Sort u)
    (f : P1 → P2 → P3 → C) (h : P1 ∧ P2 ∧ P3) :
    Rocq.Corelib.ssr.ssrbool.and3_rect P1 P2 P3 C f ((and3Iso P1 P2 P3).of h) =
      f (h.1) (h.2.1) (h.2.2) := by cases (and3Iso P1 P2 P3).of h; rfl
theorem and4_agrees (P1 P2 P3 P4 : Prop) : Rocq.Corelib.ssr.ssrbool.and4 P1 P2 P3 P4 ↔ (P1 ∧ P2 ∧ P3 ∧ P4) := by
  constructor
  · intro h; cases h with | And4 h1 h2 h3 h4 => exact ⟨h1,h2,h3,h4⟩
  · rintro ⟨h1,h2,h3,h4⟩; exact .And4 P1 P2 P3 P4 h1 h2 h3 h4
def and4Iso (P1 P2 P3 P4 : Prop) : Iso (Rocq.Corelib.ssr.ssrbool.and4 P1 P2 P3 P4) (P1 ∧ P2 ∧ P3 ∧ P4) where
  to := (and4_agrees P1 P2 P3 P4).mp
  of := (and4_agrees P1 P2 P3 P4).mpr
  of_to _ := rfl
  to_of _ := rfl
theorem and4_rec_agrees (P1 P2 P3 P4 : Prop) (C : Type)
    (f : P1 → P2 → P3 → P4 → C) (h : P1 ∧ P2 ∧ P3 ∧ P4) :
    Rocq.Corelib.ssr.ssrbool.and4_rec P1 P2 P3 P4 C f ((and4Iso P1 P2 P3 P4).of h) =
      f (h.1) (h.2.1) (h.2.2.1) (h.2.2.2) := by cases (and4Iso P1 P2 P3 P4).of h; rfl
theorem and4_rect_agrees (P1 P2 P3 P4 : Prop) (C : Sort u)
    (f : P1 → P2 → P3 → P4 → C) (h : P1 ∧ P2 ∧ P3 ∧ P4) :
    Rocq.Corelib.ssr.ssrbool.and4_rect P1 P2 P3 P4 C f ((and4Iso P1 P2 P3 P4).of h) =
      f (h.1) (h.2.1) (h.2.2.1) (h.2.2.2) := by cases (and4Iso P1 P2 P3 P4).of h; rfl
theorem and5_agrees (P1 P2 P3 P4 P5 : Prop) : Rocq.Corelib.ssr.ssrbool.and5 P1 P2 P3 P4 P5 ↔ (P1 ∧ P2 ∧ P3 ∧ P4 ∧ P5) := by
  constructor
  · intro h; cases h with | And5 h1 h2 h3 h4 h5 => exact ⟨h1,h2,h3,h4,h5⟩
  · rintro ⟨h1,h2,h3,h4,h5⟩; exact .And5 P1 P2 P3 P4 P5 h1 h2 h3 h4 h5
def and5Iso (P1 P2 P3 P4 P5 : Prop) : Iso (Rocq.Corelib.ssr.ssrbool.and5 P1 P2 P3 P4 P5) (P1 ∧ P2 ∧ P3 ∧ P4 ∧ P5) where
  to := (and5_agrees P1 P2 P3 P4 P5).mp
  of := (and5_agrees P1 P2 P3 P4 P5).mpr
  of_to _ := rfl
  to_of _ := rfl
theorem and5_rec_agrees (P1 P2 P3 P4 P5 : Prop) (C : Type)
    (f : P1 → P2 → P3 → P4 → P5 → C) (h : P1 ∧ P2 ∧ P3 ∧ P4 ∧ P5) :
    Rocq.Corelib.ssr.ssrbool.and5_rec P1 P2 P3 P4 P5 C f ((and5Iso P1 P2 P3 P4 P5).of h) =
      f (h.1) (h.2.1) (h.2.2.1) (h.2.2.2.1) (h.2.2.2.2) := by cases (and5Iso P1 P2 P3 P4 P5).of h; rfl
theorem and5_rect_agrees (P1 P2 P3 P4 P5 : Prop) (C : Sort u)
    (f : P1 → P2 → P3 → P4 → P5 → C) (h : P1 ∧ P2 ∧ P3 ∧ P4 ∧ P5) :
    Rocq.Corelib.ssr.ssrbool.and5_rect P1 P2 P3 P4 P5 C f ((and5Iso P1 P2 P3 P4 P5).of h) =
      f (h.1) (h.2.1) (h.2.2.1) (h.2.2.2.1) (h.2.2.2.2) := by cases (and5Iso P1 P2 P3 P4 P5).of h; rfl
theorem or3_agrees (P1 P2 P3 : Prop) : Rocq.Corelib.ssr.ssrbool.or3 P1 P2 P3 ↔ (P1 ∨ P2 ∨ P3) := by
  constructor
  · intro h
    cases h with
    | Or31 h => exact Or.inl h
    | Or32 h => exact Or.inr (Or.inl h)
    | Or33 h => exact Or.inr (Or.inr (h))
  · intro h
    cases h with
    | inl h => exact .Or31 P1 P2 P3 h
    | inr h =>
      cases h with
      | inl h => exact .Or32 P1 P2 P3 h
      | inr h =>
        exact .Or33 P1 P2 P3 h
def or3Iso (P1 P2 P3 : Prop) : Iso (Rocq.Corelib.ssr.ssrbool.or3 P1 P2 P3) (P1 ∨ P2 ∨ P3) where
  to := (or3_agrees P1 P2 P3).mp
  of := (or3_agrees P1 P2 P3).mpr
  of_to _ := rfl
  to_of _ := rfl
theorem or4_agrees (P1 P2 P3 P4 : Prop) : Rocq.Corelib.ssr.ssrbool.or4 P1 P2 P3 P4 ↔ (P1 ∨ P2 ∨ P3 ∨ P4) := by
  constructor
  · intro h
    cases h with
    | Or41 h => exact Or.inl h
    | Or42 h => exact Or.inr (Or.inl h)
    | Or43 h => exact Or.inr (Or.inr (Or.inl h))
    | Or44 h => exact Or.inr (Or.inr (Or.inr (h)))
  · intro h
    cases h with
    | inl h => exact .Or41 P1 P2 P3 P4 h
    | inr h =>
      cases h with
      | inl h => exact .Or42 P1 P2 P3 P4 h
      | inr h =>
        cases h with
        | inl h => exact .Or43 P1 P2 P3 P4 h
        | inr h =>
          exact .Or44 P1 P2 P3 P4 h
def or4Iso (P1 P2 P3 P4 : Prop) : Iso (Rocq.Corelib.ssr.ssrbool.or4 P1 P2 P3 P4) (P1 ∨ P2 ∨ P3 ∨ P4) where
  to := (or4_agrees P1 P2 P3 P4).mp
  of := (or4_agrees P1 P2 P3 P4).mpr
  of_to _ := rfl
  to_of _ := rfl

def collectiveIso (A : Type u) : Iso (Rocq.Corelib.ssr.ssrbool.collective_pred A) (A → Bool) :=
  { to := SSRBoolData.predTo, of := SSRBoolData.predOf, of_to := SSRBoolData.pred_of_to, to_of := SSRBoolData.pred_to_of }
def applicativeIso (A : Type u) : Iso (Rocq.Corelib.ssr.ssrbool.applicative_pred A) (A → Bool) :=
  { to := SSRBoolData.predTo, of := SSRBoolData.predOf, of_to := SSRBoolData.pred_of_to, to_of := SSRBoolData.pred_to_of }
theorem coerce_agrees (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.simpl_pred A) :
    SSRBoolData.predTo (Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce A p) =
      (SSRBoolData.simplPredIso A).to p := rfl
theorem pre_symmetric_agrees (A : Type u) (r : Rocq.Corelib.ssr.ssrbool.rel A) :
    Rocq.Corelib.ssr.ssrbool.pre_symmetric A r ↔
      ∀ x y, boolTo (r x y) = true → boolTo (r y x) = true := by
  simp only [Rocq.Corelib.ssr.ssrbool.pre_symmetric, is_true_agrees]
theorem left_transitive_agrees (A : Type u) (r : Rocq.Corelib.ssr.ssrbool.rel A) :
    Rocq.Corelib.ssr.ssrbool.left_transitive A r ↔
      ∀ x y, boolTo (r x y) = true → ∀ z, boolTo (r x z) = boolTo (r y z) := by
  simp only [Rocq.Corelib.ssr.ssrbool.left_transitive, Rocq.Corelib.ssr.ssrfun.eqfun, is_true_agrees, bool_eq_native]
theorem right_transitive_agrees (A : Type u) (r : Rocq.Corelib.ssr.ssrbool.rel A) :
    Rocq.Corelib.ssr.ssrbool.right_transitive A r ↔
      ∀ x y, boolTo (r x y) = true → ∀ z, boolTo (r z x) = boolTo (r z y) := by
  simp only [Rocq.Corelib.ssr.ssrbool.right_transitive, Rocq.Corelib.ssr.ssrfun.eqfun, is_true_agrees, bool_eq_native]
theorem quality_prod_agrees (P Q : Prop) :
    Rocq.Corelib.Init.Datatypes.prod.qualityProp P Q ↔ P ∧ Q := by
  constructor
  · intro h; cases h with | pair p q => exact ⟨p,q⟩
  · rintro ⟨p,q⟩; exact .pair P Q p q
theorem equivalence_rel_agrees (A : Type u) (r : Rocq.Corelib.ssr.ssrbool.rel A) :
    Rocq.Corelib.ssr.ssrbool.equivalence_rel A r ↔
      ∀ x y z, (boolTo (r z z) = true) ∧
        (boolTo (r x y) = true → boolTo (r x z) = boolTo (r y z)) := by
  simp only [Rocq.Corelib.ssr.ssrbool.equivalence_rel, quality_prod_agrees, is_true_agrees, bool_eq_native]
end NativeBridge.Incremental.SSRBoolLogic

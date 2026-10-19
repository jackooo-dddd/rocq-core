import LogicWitnesses
noncomputable section
namespace NativeBridge.Incremental.LogicNormalization
open NativeBridge
universe u v
theorem eq_forall (A : Sort u) (x y : A) (P : ME A x y → Prop) :
    (∀ e, P e) ↔ ∀ e : x = y, P (eqOf e) := by
  constructor
  · intro h e; exact h _
  · intro h e; exact h (eqTo e)
theorem ex_forall (A : Sort u) (P : A → Prop) (F : Rocq.Corelib.Init.Logic.ex A P → Prop) :
    (∀ e, F e) ↔ ∀ e : Exists P, F (ex_agrees P |>.mpr e) := by
  constructor
  · intro h e; exact h _
  · intro h e; exact h (ex_agrees P |>.mp e)
theorem ex2_forall (A : Sort u) (P Q : A → Prop)
    (F : Rocq.Corelib.Init.Logic.ex2 A P Q → Prop) :
    (∀ e, F e) ↔ ∀ e : ∃ x, P x ∧ Q x, F (ex2_agrees P Q |>.mpr e) := by
  constructor
  · intro h e; exact h _
  · intro h e; exact h (ex2_agrees P Q |>.mp e)
theorem and_forall (P Q : Prop) (F : Rocq.Corelib.Init.Logic.and P Q → Prop) :
    (∀ e, F e) ↔ ∀ e : P ∧ Q, F (and_agrees P Q |>.mpr e) := by
  constructor
  · intro h e; exact h _
  · intro h e; exact h (and_agrees P Q |>.mp e)
theorem unique_agrees (A : Sort u) (P : A → Prop) (x : A) :
    Rocq.Corelib.Init.Logic.unique A P x ↔ P x ∧ ∀ y, P y → x = y := by
  simp only [Rocq.Corelib.Init.Logic.unique, and_agrees, eq_correspondence]
theorem uniqueness_agrees (A : Sort u) (P : A → Prop) :
    Rocq.Corelib.Init.Logic.uniqueness A P ↔ ∀ x y, P x → P y → x = y := by
  simp only [Rocq.Corelib.Init.Logic.uniqueness, eq_correspondence]
theorem subrelation_agrees (A : Sort u) (B : Sort v) (R S : A → B → Prop) :
    Rocq.Corelib.Init.Logic.subrelation A B R S ↔ ∀ x y, R x y → S x y := Iff.rfl
theorem eq_rect_agrees (A : Sort u) (x : A) (P : A → Sort v)
    (h : P x) (y : A) (e : ME A x y) :
    Rocq.Corelib.Init.Logic.eq_rect A x P h y e = Eq.ndrec h (eqTo e) := by
  cases e; rfl
theorem eq_rect_r_agrees
    (H : Rocq.Corelib.Init.Logic.eq_rect_r__rocq2lean_obligation_1.statement.{u,v})
    (A : Sort u) (x : A) (P : A → Sort v) (h : P x) (y : A) (e : ME A y x) :
    @RocqPending.Corelib.Init.Logic.eq_rect_r H A x P h y e =
      Eq.ndrec h (eqTo e).symm := by
  cases e; rfl
def exProof {A : Prop} {P : A → Prop} (h : Exists P) : A := h.elim (fun x _ => x)
def ex2Proof {A : Prop} {P Q : A → Prop} (h : ∃ x, P x ∧ Q x) : A := h.elim (fun x _ => x)
theorem ex_proj1_agrees (A : Prop) (P : A → Prop) (h : Exists P) :
    Rocq.Corelib.Init.Logic.ex.rec (motive := fun _ => A) (fun x _ => x) (ex_agrees P |>.mpr h) = exProof h := rfl
theorem ex_proj1_of_ex2_agrees (A : Prop) (P Q : A → Prop) (h : ∃ x, P x ∧ Q x) :
    Rocq.Corelib.Init.Logic.ex2.rec (motive := fun _ => A) (fun x _ _ => x) (ex2_agrees P Q |>.mpr h) = ex2Proof h := rfl
theorem proof_equality (P : Prop) (x y : P) : (x = y) ↔ True := by
  constructor
  · intro _; trivial
  · intro _; rfl

theorem eq_exists (A : Sort u) (x y : A) (P : ME A x y → Prop) :
    (∃ e, P e) ↔ ∃ e : x = y, P (eqOf e) := by
  constructor
  · rintro ⟨e, he⟩; exact ⟨eqTo e, he⟩
  · rintro ⟨e, he⟩; exact ⟨eqOf e, he⟩
theorem proof_eq_family_forall (P : Prop) (x y : P) (F : (ME P x y → Prop) → Prop) :
    (∀ R, F R) ↔ ∀ R : True → Prop, F (fun _ => R True.intro) := by
  constructor
  · intro h R; exact h _
  · intro h R
    have hf : (fun _ : ME P x y => R (.eq_refl P x)) = R := by funext e; rfl
    have hh := h (fun _ => R (.eq_refl P x))
    rw [hf] at hh
    exact hh
end NativeBridge.Incremental.LogicNormalization

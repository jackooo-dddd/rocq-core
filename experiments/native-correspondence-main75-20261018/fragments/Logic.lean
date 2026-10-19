@[simp] theorem true_agrees : Rocq.Corelib.Init.Logic.True ↔ True := by
  constructor
  · intro _; trivial
  · intro _; exact .I
@[simp] theorem false_agrees : Rocq.Corelib.Init.Logic.False ↔ False := by
  constructor <;> intro h <;> cases h
@[simp] theorem and_agrees (P Q : Prop) : Rocq.Corelib.Init.Logic.and P Q ↔ (P ∧ Q) := by
  constructor
  · intro h; cases h with | conj p q => exact ⟨p,q⟩
  · rintro ⟨p,q⟩; exact .conj P Q p q
@[simp] theorem or_agrees (P Q : Prop) : Rocq.Corelib.Init.Logic.or P Q ↔ (P ∨ Q) := by
  constructor
  · intro h; cases h with
    | or_introl p => exact Or.inl p
    | or_intror q => exact Or.inr q
  · intro h; cases h with
    | inl p => exact .or_introl P Q p
    | inr q => exact .or_intror P Q q
@[simp] theorem not_agrees (P : Prop) : Rocq.Corelib.Init.Logic.not P ↔ ¬ P := by
  change (P → Rocq.Corelib.Init.Logic.False) ↔ (P → False)
  simp only [false_agrees]
@[simp] theorem notT_agrees (A : Sort u) : Rocq.Corelib.Init.Logic.notT A ↔ (A → False) := by
  change (A → Rocq.Corelib.Init.Logic.False) ↔ (A → False)
  simp only [false_agrees]
@[simp] theorem iff_agrees (P Q : Prop) : Rocq.Corelib.Init.Logic.iff P Q ↔ (P ↔ Q) := by
  change Rocq.Corelib.Init.Logic.and (P → Q) (Q → P) ↔ (P ↔ Q)
  rw [and_agrees]
  exact ⟨fun h => ⟨h.1,h.2⟩, fun h => ⟨h.mp,h.mpr⟩⟩
@[simp] theorem ex_agrees {A : Sort u} (P : A → Prop) : Rocq.Corelib.Init.Logic.ex A P ↔ ∃ x, P x := by
  constructor
  · intro h; cases h with | ex_intro x hx => exact ⟨x,hx⟩
  · rintro ⟨x,hx⟩; exact .ex_intro A P x hx
@[simp] theorem ex2_agrees {A : Sort u} (P Q : A → Prop) : Rocq.Corelib.Init.Logic.ex2 A P Q ↔ ∃ x, P x ∧ Q x := by
  constructor
  · intro h; cases h with | ex_intro2 x hp hq => exact ⟨x,hp,hq⟩
  · rintro ⟨x,hp,hq⟩; exact .ex_intro2 A P Q x hp hq
@[simp] theorem inhabited_agrees (A : Sort u) : Rocq.Corelib.Init.Logic.inhabited A ↔ Nonempty A := by
  constructor
  · intro h; cases h with | inhabits x => exact ⟨x⟩
  · rintro ⟨x⟩; exact .inhabits A x
@[simp] theorem all_agrees {A : Sort u} (P : A → Prop) : Rocq.Corelib.Init.Logic.all A P ↔ ∀ x, P x := Iff.rfl

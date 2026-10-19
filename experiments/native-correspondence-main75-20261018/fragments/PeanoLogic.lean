
@[simp] theorem true_agrees : Rocq.Corelib.Init.Logic.True ↔ True := by
  constructor
  · intro _; trivial
  · intro _; exact .I

@[simp] theorem false_agrees : Rocq.Corelib.Init.Logic.False ↔ False := by
  constructor <;> intro h <;> cases h

@[simp] theorem not_agrees (P : Prop) : Rocq.Corelib.Init.Logic.not P ↔ ¬ P := by
  change (P → Rocq.Corelib.Init.Logic.False) ↔ (P → False)
  simp only [false_agrees]

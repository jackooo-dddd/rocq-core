
theorem acc_native (A : Type u) (R : A → A → Prop) (x : A) :
    Rocq.Corelib.Init.Wf.Acc A R x ↔ Acc R x := ⟨accTo,accOf⟩
theorem acc_function_native (A : Type u) (R : A → A → Prop) :
    Rocq.Corelib.Init.Wf.Acc A R = (fun x => Acc R x) := by
  funext x
  exact propext (acc_native A R x)
theorem and_function_native :
    Rocq.Corelib.Init.Logic.and = (fun P Q : Prop => P ∧ Q) := by
  funext P Q
  exact propext (sourceAnd P Q)
theorem or_function_native :
    Rocq.Corelib.Init.Logic.or = (fun P Q : Prop => P ∨ Q) := by
  funext P Q
  exact propext (sourceOr P Q)
theorem not_function_native :
    Rocq.Corelib.Init.Logic.not = (fun P : Prop => ¬ P) := by
  funext P
  change (P → Rocq.Corelib.Init.Logic.False) = (P → False)
  exact congrArg (fun Q : Prop => P → Q) (propext sourceFalse)

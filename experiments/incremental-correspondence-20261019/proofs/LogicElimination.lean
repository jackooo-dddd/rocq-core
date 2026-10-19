import LogicNormalization
noncomputable section
namespace NativeBridge.Incremental.LogicElimination
open NativeBridge
universe u
theorem false_rec_agrees (P : Type) (h : Rocq.Corelib.Init.Logic.False) :
    Rocq.Corelib.Init.Logic.False_rec P h = False.elim (false_agrees.mp h) := by cases h
theorem false_rect_agrees (P : Sort u) (h : Rocq.Corelib.Init.Logic.False) :
    Rocq.Corelib.Init.Logic.False_rect P h = False.elim (false_agrees.mp h) := by cases h
theorem true_rec_agrees (P : Type) (p : P) (h : Rocq.Corelib.Init.Logic.True) :
    Rocq.Corelib.Init.Logic.True_rec P p h = p := by cases h; rfl
theorem true_rect_agrees (P : Sort u) (p : P) (h : Rocq.Corelib.Init.Logic.True) :
    Rocq.Corelib.Init.Logic.True_rect P p h = p := by cases h; rfl
theorem and_rec_agrees (A B : Prop) (P : Type) (f : A → B → P) (h : Rocq.Corelib.Init.Logic.and A B) :
    Rocq.Corelib.Init.Logic.and_rec A B P f h = f (and_agrees A B |>.mp h).1 (and_agrees A B |>.mp h).2 := by
  cases h; rfl
theorem and_rect_agrees (A B : Prop) (P : Sort u) (f : A → B → P) (h : Rocq.Corelib.Init.Logic.and A B) :
    Rocq.Corelib.Init.Logic.and_rect A B P f h = f (and_agrees A B |>.mp h).1 (and_agrees A B |>.mp h).2 := by
  cases h; rfl
end NativeBridge.Incremental.LogicElimination

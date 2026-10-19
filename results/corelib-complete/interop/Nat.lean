import Rocq2LeanOut
theorem translated_add_agrees (n m : Nat) :
    Rocq.Corelib.Init.Nat.add n m = n + m := by
  induction n with
  | zero => exact (Nat.zero_add m).symm
  | succ n ih =>
    change Nat.succ (Rocq.Corelib.Init.Nat.add n m) = Nat.succ n + m
    rw [ih, Nat.succ_add]

example : Rocq.Corelib.Init.Nat.add 20 22 = 42 := rfl
example : Nat.succ (Rocq.Corelib.Init.Nat.add 20 22) = 43 := rfl
#print axioms translated_add_agrees

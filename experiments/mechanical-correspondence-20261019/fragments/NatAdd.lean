@[simp] theorem nat_add_agrees (n m : MN) :
  natTo (Rocq.Corelib.Init.Nat.add n m) = natTo n + natTo m := by
  induction n with
  | O => exact (Nat.zero_add _).symm
  | S n ih =>
    change Nat.succ (natTo (Rocq.Corelib.Init.Nat.add n m)) = Nat.succ (natTo n) + natTo m
    rw [ih, Nat.succ_add]

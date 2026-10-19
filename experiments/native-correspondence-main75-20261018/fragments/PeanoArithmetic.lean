@[simp] theorem nat_pred_agrees (n : Nat) : Rocq.Corelib.Init.Nat.pred n = n-1 := by cases n <;> rfl

@[simp] theorem nat_add_agrees (n m : Nat) : Rocq.Corelib.Init.Nat.add n m = n + m := by
  induction n with
  | zero => exact (Nat.zero_add m).symm
  | succ n ih =>
    change Nat.succ (Rocq.Corelib.Init.Nat.add n m) = Nat.succ n + m
    rw [ih, Nat.succ_add]

@[simp] theorem nat_mul_agrees (n m : Nat) : Rocq.Corelib.Init.Nat.mul n m = n * m := by
  induction n with
  | zero => exact (Nat.zero_mul m).symm
  | succ n ih =>
    change Rocq.Corelib.Init.Nat.add m (Rocq.Corelib.Init.Nat.mul n m) = (n+1)*m
    rw [nat_add_agrees, ih, Nat.succ_mul, Nat.add_comm]

@[simp] theorem nat_min_agrees (n m : Nat) : Rocq.Corelib.Init.Nat.min n m = min n m := by
  induction n generalizing m with
  | zero => cases m <;> rfl
  | succ n ih => cases m with
    | zero => rfl
    | succ m =>
      change (Rocq.Corelib.Init.Nat.min n m)+1 = min (n+1) (m+1)
      rw [ih]; omega

@[simp] theorem nat_max_agrees (n m : Nat) : Rocq.Corelib.Init.Nat.max n m = max n m := by
  induction n generalizing m with
  | zero => cases m <;> rfl
  | succ n ih => cases m with
    | zero => rfl
    | succ m =>
      change (Rocq.Corelib.Init.Nat.max n m)+1 = max (n+1) (m+1)
      rw [ih]; omega

abbrev RN := Rocq.Corelib.Init.Nat.t
theorem nat_type_agrees : RN = Nat := rfl
@[simp] theorem nat_zero_agrees : Rocq.Corelib.Init.Nat.zero = 0 := rfl
@[simp] theorem nat_one_agrees : Rocq.Corelib.Init.Nat.one = 1 := rfl
@[simp] theorem nat_two_agrees : Rocq.Corelib.Init.Nat.two = 2 := rfl
@[simp] theorem nat_succ_agrees (n : Nat) : Rocq.Corelib.Init.Nat.succ n = n+1 := rfl
@[simp] theorem nat_pred_agrees (n : Nat) : Rocq.Corelib.Init.Nat.pred n = n-1 := by cases n <;> rfl
@[simp] theorem nat_add_agrees (n m : Nat) : Rocq.Corelib.Init.Nat.add n m = n + m := by
  induction n with
  | zero => exact (Nat.zero_add m).symm
  | succ n ih =>
    change Nat.succ (Rocq.Corelib.Init.Nat.add n m) = Nat.succ n + m
    rw [ih, Nat.succ_add]
@[simp] theorem nat_sub_agrees (n m : Nat) : Rocq.Corelib.Init.Nat.sub n m = n - m := by
  induction n generalizing m with
  | zero => change 0 = 0 - m; simp
  | succ n ih => cases m with
    | zero => rfl
    | succ m =>
      change Rocq.Corelib.Init.Nat.sub n m = (n+1)-(m+1)
      rw [Nat.succ_sub_succ]; exact ih m
@[simp] theorem nat_mul_agrees (n m : Nat) : Rocq.Corelib.Init.Nat.mul n m = n * m := by
  induction n with
  | zero => exact (Nat.zero_mul m).symm
  | succ n ih =>
    change Rocq.Corelib.Init.Nat.add m (Rocq.Corelib.Init.Nat.mul n m) = (n+1)*m
    rw [nat_add_agrees, ih, Nat.succ_mul, Nat.add_comm]
@[simp] theorem nat_pow_agrees (n m : Nat) : Rocq.Corelib.Init.Nat.pow n m = n ^ m := by
  induction m with
  | zero => rfl
  | succ m ih =>
    change Rocq.Corelib.Init.Nat.mul n (Rocq.Corelib.Init.Nat.pow n m) = n ^ (m+1)
    rw [nat_mul_agrees, ih, Nat.pow_succ, Nat.mul_comm]
@[simp] theorem nat_double_agrees (n : Nat) : Rocq.Corelib.Init.Nat.double n = 2*n := by
  change Rocq.Corelib.Init.Nat.add n n = 2*n
  rw [nat_add_agrees]; omega
@[simp] theorem nat_square_agrees (n : Nat) : Rocq.Corelib.Init.Nat.square n = n*n := nat_mul_agrees n n
@[simp] theorem nat_eqb_agrees (n m : Nat) : boolTo (Rocq.Corelib.Init.Nat.eqb n m) = (n == m) := by
  induction n generalizing m with
  | zero => cases m <;> rfl
  | succ n ih => cases m with
    | zero => rfl
    | succ m =>
      change boolTo (Rocq.Corelib.Init.Nat.eqb n m) = (n+1 == m+1)
      simpa using ih m
@[simp] theorem nat_leb_agrees (n m : Nat) : boolTo (Rocq.Corelib.Init.Nat.leb n m) = decide (n ≤ m) := by
  induction n generalizing m with
  | zero => cases m <;> rfl
  | succ n ih => cases m with
    | zero => rfl
    | succ m =>
      change boolTo (Rocq.Corelib.Init.Nat.leb n m) = decide (n+1 ≤ m+1)
      simpa using ih m
@[simp] theorem nat_ltb_agrees (n m : Nat) : boolTo (Rocq.Corelib.Init.Nat.ltb n m) = decide (n < m) :=
  nat_leb_agrees (n+1) m
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
@[simp] theorem nat_tail_add_agrees (n m : Nat) : Rocq.Corelib.Init.Nat.tail_add n m = n+m := by
  induction n generalizing m with
  | zero => exact (Nat.zero_add m).symm
  | succ n ih =>
    change Rocq.Corelib.Init.Nat.tail_add n (m+1) = n+1+m
    rw [ih]; omega
@[simp] theorem nat_tail_addmul_agrees (r n m : Nat) : Rocq.Corelib.Init.Nat.tail_addmul r n m = r+n*m := by
  induction n generalizing r with
  | zero => change r = r+0*m; simp
  | succ n ih =>
    change Rocq.Corelib.Init.Nat.tail_addmul (Rocq.Corelib.Init.Nat.tail_add m r) n m = r+(n+1)*m
    rw [ih, nat_tail_add_agrees, Nat.succ_mul]; omega
@[simp] theorem nat_tail_mul_agrees (n m : Nat) : Rocq.Corelib.Init.Nat.tail_mul n m = n*m := by
  change Rocq.Corelib.Init.Nat.tail_addmul 0 n m = n*m
  rw [nat_tail_addmul_agrees, Nat.zero_add]

-- Direct reuse of native Lean laws with the mechanically translated operation.
theorem translated_add_comm (n m : Nat) : Rocq.Corelib.Init.Nat.add n m = Rocq.Corelib.Init.Nat.add m n := by
  simp only [nat_add_agrees, Nat.add_comm]
theorem translated_mul_comm (n m : Nat) : Rocq.Corelib.Init.Nat.mul n m = Rocq.Corelib.Init.Nat.mul m n := by
  simp only [nat_mul_agrees, Nat.mul_comm]
theorem translated_add_assoc (n m k : Nat) :
  Rocq.Corelib.Init.Nat.add (Rocq.Corelib.Init.Nat.add n m) k =
  Rocq.Corelib.Init.Nat.add n (Rocq.Corelib.Init.Nat.add m k) := by simp only [nat_add_agrees, Nat.add_assoc]
theorem translated_sub_add (n m : Nat) (h : m ≤ n) : Rocq.Corelib.Init.Nat.add (Rocq.Corelib.Init.Nat.sub n m) m = n := by
  simp only [nat_add_agrees, nat_sub_agrees]; exact Nat.sub_add_cancel h

theorem two_step {P : Nat → Prop} (hz : P 0) (ho : P 1) (hs : ∀ n, P n → P (n+1) → P (n+2)) : ∀ n, P n := by
  intro n
  have h : P n ∧ P (n+1) := by
    induction n with
    | zero => exact ⟨hz,ho⟩
    | succ n ih => exact ⟨ih.2, hs n ih.1 ih.2⟩
  exact h.1
@[simp] theorem nat_compare_agrees (n m : Nat) :
  comparisonTo (Rocq.Corelib.Init.Nat.compare n m) = compare n m := by
  induction n generalizing m with
  | zero =>
    cases m with
    | zero => rfl
    | succ m =>
      change Ordering.lt = compare 0 (m+1)
      exact (Nat.compare_eq_lt.mpr (by omega)).symm
  | succ n ih =>
    cases m with
    | zero =>
      change Ordering.gt = compare (n+1) 0
      exact (Nat.compare_eq_gt.mpr (by omega)).symm
    | succ m =>
      change comparisonTo (Rocq.Corelib.Init.Nat.compare n m) = compare (n+1) (m+1)
      rw [ih, Nat.compare_eq_ite_lt, Nat.compare_eq_ite_lt]
      simp
theorem nat_even_step (n : Nat) : Rocq.Corelib.Init.Nat.even (n+2) = Rocq.Corelib.Init.Nat.even n := rfl
@[simp] theorem nat_even_agrees (n : Nat) :
  boolTo (Rocq.Corelib.Init.Nat.even n) = decide (n % 2 = 0) := by
  induction n using two_step with
  | hz => rfl
  | ho => rfl
  | hs n ih ih1 =>
    rw [nat_even_step, ih]
    rw [show (n+2)%2 = n%2 by omega]
@[simp] theorem nat_odd_agrees (n : Nat) :
  boolTo (Rocq.Corelib.Init.Nat.odd n) = decide (n % 2 = 1) := by
  change boolTo (Rocq.Corelib.Init.Datatypes.negb (Rocq.Corelib.Init.Nat.even n)) = _
  have h : ∀ b : RBool, boolTo (Rocq.Corelib.Init.Datatypes.negb b) = !boolTo b := by intro b; cases b <;> rfl
  rw [h, nat_even_agrees]
  by_cases h0 : n % 2 = 0
  · have h1 : n % 2 ≠ 1 := by omega
    simp [h0, h1]
  · have h1 : n % 2 = 1 := by omega
    simp [h0, h1]
theorem nat_div2_step (n : Nat) : Rocq.Corelib.Init.Nat.div2 (n+2) = Rocq.Corelib.Init.Nat.div2 n+1 := rfl
@[simp] theorem nat_div2_agrees (n : Nat) : Rocq.Corelib.Init.Nat.div2 n = n/2 := by
  induction n using two_step with
  | hz => rfl
  | ho => rfl
  | hs n ih ih1 => rw [nat_div2_step, ih]; omega
@[simp] theorem nat_shiftl_agrees (n k : Nat) : Rocq.Corelib.Init.Nat.shiftl n k = n <<< k := by
  rw [Nat.shiftLeft_eq]
  induction k with
  | zero => exact (Nat.mul_one n).symm
  | succ k ih =>
    change Rocq.Corelib.Init.Nat.double (Rocq.Corelib.Init.Nat.shiftl n k) = _
    rw [nat_double_agrees, ih, Nat.pow_succ]
    simp only [Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm]
@[simp] theorem nat_shiftr_agrees (n k : Nat) : Rocq.Corelib.Init.Nat.shiftr n k = n >>> k := by
  rw [Nat.shiftRight_eq_div_pow]
  induction k with
  | zero => exact (Nat.div_one n).symm
  | succ k ih =>
    change Rocq.Corelib.Init.Nat.div2 (Rocq.Corelib.Init.Nat.shiftr n k) = _
    rw [nat_div2_agrees, ih, Nat.div_div_eq_div_mul, Nat.pow_succ]

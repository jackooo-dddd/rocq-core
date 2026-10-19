
theorem two_step {P : MN → Prop} (hz : P .O) (ho : P (.S .O))
    (hs : ∀ n, P n → P (.S n) → P (.S (.S n))) : ∀ n, P n := by
  intro n
  have h : P n ∧ P (.S n) := by
    induction n with
    | O => exact ⟨hz,ho⟩
    | S n ih => exact ⟨ih.2, hs n ih.1 ih.2⟩
  exact h.1
@[simp] theorem nat_compare_agrees (n m : MN) :
  comparisonTo (Rocq.Corelib.Init.Nat.compare n m) = compare (natTo n) (natTo m) := by
  induction n generalizing m with
  | O => cases m with
    | O => rfl
    | S m =>
      change Ordering.lt = compare 0 (natTo m+1)
      exact (Nat.compare_eq_lt.mpr (by omega)).symm
  | S n ih => cases m with
    | O =>
      change Ordering.gt = compare (natTo n+1) 0
      exact (Nat.compare_eq_gt.mpr (by omega)).symm
    | S m =>
      change comparisonTo (Rocq.Corelib.Init.Nat.compare n m) = compare (natTo n+1) (natTo m+1)
      rw [ih, Nat.compare_eq_ite_lt, Nat.compare_eq_ite_lt]
      simp
theorem nat_even_step (n : MN) : Rocq.Corelib.Init.Nat.even (.S (.S n)) = Rocq.Corelib.Init.Nat.even n := rfl
@[simp] theorem nat_even_agrees (n : MN) :
  boolTo (Rocq.Corelib.Init.Nat.even n) = decide (natTo n % 2 = 0) := by
  induction n using two_step with
  | hz => rfl
  | ho => rfl
  | hs n ih ih1 =>
    rw [nat_even_step, ih]
    change decide (natTo n%2=0) = decide ((natTo n+2)%2=0)
    rw [show (natTo n+2)%2 = natTo n%2 by omega]
@[simp] theorem nat_odd_agrees (n : MN) :
  boolTo (Rocq.Corelib.Init.Nat.odd n) = decide (natTo n % 2 = 1) := by
  change boolTo (Rocq.Corelib.Init.Datatypes.negb (Rocq.Corelib.Init.Nat.even n)) = _
  have h : ∀ b : RBool, boolTo (Rocq.Corelib.Init.Datatypes.negb b) = !boolTo b := by intro b; cases b <;> rfl
  rw [h, nat_even_agrees]
  by_cases h0 : natTo n % 2 = 0
  · have h1 : natTo n % 2 ≠ 1 := by omega
    simp [h0,h1]
  · have h1 : natTo n % 2 = 1 := by omega
    simp [h0,h1]
@[simp] theorem nat_div2_agrees (n : MN) : natTo (Rocq.Corelib.Init.Nat.div2 n) = natTo n/2 := by
  induction n using two_step with
  | hz => rfl
  | ho => rfl
  | hs n ih ih1 =>
    change natTo (Rocq.Corelib.Init.Nat.div2 n)+1 = (natTo n+2)/2
    rw [ih]; omega
@[simp] theorem nat_shiftl_agrees (n k : MN) :
  natTo (Rocq.Corelib.Init.Nat.shiftl n k) = natTo n <<< natTo k := by
  rw [Nat.shiftLeft_eq]
  induction k with
  | O => exact (Nat.mul_one _).symm
  | S k ih =>
    change natTo (Rocq.Corelib.Init.Nat.double (Rocq.Corelib.Init.Nat.shiftl n k)) = natTo n * 2^(natTo k+1)
    rw [nat_double_agrees, ih, Nat.pow_succ]
    simp only [Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm]
@[simp] theorem nat_shiftr_agrees (n k : MN) :
  natTo (Rocq.Corelib.Init.Nat.shiftr n k) = natTo n >>> natTo k := by
  rw [Nat.shiftRight_eq_div_pow]
  induction k with
  | O => exact (Nat.div_one _).symm
  | S k ih =>
    change natTo (Rocq.Corelib.Init.Nat.div2 (Rocq.Corelib.Init.Nat.shiftr n k)) = natTo n / 2^(natTo k+1)
    rw [nat_div2_agrees, ih, Nat.div_div_eq_div_mul, Nat.pow_succ]
@[simp] theorem nat_tail_add_agrees (n m : MN) :
  natTo (Rocq.Corelib.Init.Nat.tail_add n m) = natTo n+natTo m := by
  induction n generalizing m with
  | O => exact (Nat.zero_add _).symm
  | S n ih =>
    change natTo (Rocq.Corelib.Init.Nat.tail_add n (.S m)) = natTo n+1+natTo m
    rw [ih]; simp only [natTo_succ]; omega
@[simp] theorem nat_tail_addmul_agrees (r n m : MN) :
  natTo (Rocq.Corelib.Init.Nat.tail_addmul r n m) = natTo r+natTo n*natTo m := by
  induction n generalizing r with
  | O => change natTo r = natTo r+0*natTo m; simp
  | S n ih =>
    change natTo (Rocq.Corelib.Init.Nat.tail_addmul (Rocq.Corelib.Init.Nat.tail_add m r) n m) = natTo r+(natTo n+1)*natTo m
    rw [ih, nat_tail_add_agrees, Nat.succ_mul]; omega
@[simp] theorem nat_tail_mul_agrees (n m : MN) :
  natTo (Rocq.Corelib.Init.Nat.tail_mul n m) = natTo n*natTo m := by
  change natTo (Rocq.Corelib.Init.Nat.tail_addmul .O n m) = _
  rw [nat_tail_addmul_agrees]; exact Nat.zero_add _

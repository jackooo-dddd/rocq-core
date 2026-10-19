def divmodTo (x y q u : Nat) : Nat × Nat :=
  Rocq.Corelib.Init.Datatypes.prod.rec (fun q r => (natTo q,natTo r)) (Rocq.Corelib.Init.Nat.divmod (natOf x) (natOf y) (natOf q) (natOf u))
theorem divmod_zero (y q u : Nat) : divmodTo 0 y q u = (q,u) := by change (natTo (natOf q),natTo (natOf u)) = (q,u); simp
theorem divmod_succ_zero (x y q : Nat) : divmodTo (x+1) y q 0 = divmodTo x y (q+1) y := rfl
theorem divmod_succ_succ (x y q u : Nat) : divmodTo (x+1) y q (u+1) = divmodTo x y q u := rfl
theorem divmod_invariant (x y q u : Nat) (hu : u ≤ y) :
  (divmodTo x y q u).2 ≤ y ∧
  x + q*(y+1) + (y-u) = (divmodTo x y q u).1*(y+1) + (y-(divmodTo x y q u).2) := by
  induction x generalizing q u with
  | zero => rw [divmod_zero]; exact ⟨hu, by simp⟩
  | succ x ih =>
    cases u with
    | zero =>
      rw [divmod_succ_zero]
      have h := ih (q+1) y (Nat.le_refl y)
      refine ⟨h.1, ?_⟩
      simp only [Nat.sub_self, Nat.add_zero, Nat.succ_mul] at h
      omega
    | succ u =>
      rw [divmod_succ_succ]
      have h := ih q u (by omega)
      refine ⟨h.1, ?_⟩
      omega
@[simp] theorem nat_div_native_agrees (x y : Nat) : natTo (Rocq.Corelib.Init.Nat.div (natOf x) (natOf y)) = x/y := by
  cases y with
  | zero => exact (Nat.div_zero x).symm
  | succ y =>
    have h := divmod_invariant x y 0 y (Nat.le_refl y)
    have hq : x / (y+1) = (divmodTo x y 0 y).1 := by
      apply Nat.div_eq_of_lt_le
      · simp only [Nat.zero_mul, Nat.add_zero, Nat.sub_self] at h
        omega
      · simp only [Nat.zero_mul, Nat.add_zero, Nat.sub_self] at h
        rw [Nat.succ_mul]
        omega
    exact hq.symm
@[simp] theorem nat_modulo_native_agrees (x y : Nat) : natTo (Rocq.Corelib.Init.Nat.modulo (natOf x) (natOf y)) = x%y := by
  cases y with
  | zero => change natTo (natOf x) = x%0; simp
  | succ y =>
    change natTo (Rocq.Corelib.Init.Nat.sub (natOf y) (Rocq.Corelib.Init.Datatypes.snd MN MN (Rocq.Corelib.Init.Nat.divmod (natOf x) (natOf y) .O (natOf y)))) = x%(y+1)
    rw [nat_sub_agrees, natTo_of]
    have h := divmod_invariant x y 0 y (Nat.le_refl y)
    have hq : (divmodTo x y 0 y).1 = x/(y+1) := nat_div_native_agrees x (y+1)
    rw [Nat.mod_eq_sub_div_mul, ← hq]
    change y - (divmodTo x y 0 y).2 = x - (divmodTo x y 0 y).1 * (y+1)
    simp only [Nat.zero_mul, Nat.add_zero, Nat.sub_self] at h
    omega

@[simp] theorem nat_div_agrees (x y : MN) :
 natTo (Rocq.Corelib.Init.Nat.div x y) = natTo x / natTo y := by
 simpa only [natOf_to] using nat_div_native_agrees (natTo x) (natTo y)
@[simp] theorem nat_modulo_agrees (x y : MN) :
 natTo (Rocq.Corelib.Init.Nat.modulo x y) = natTo x % natTo y := by
 simpa only [natOf_to] using nat_modulo_native_agrees (natTo x) (natTo y)


@[simp] theorem nat_zero_agrees : natTo Rocq.Corelib.Init.Nat.zero = 0 := rfl
@[simp] theorem nat_one_agrees : natTo Rocq.Corelib.Init.Nat.one = 1 := rfl
@[simp] theorem nat_two_agrees : natTo Rocq.Corelib.Init.Nat.two = 2 := rfl
@[simp] theorem nat_succ_agrees (n : MN) : natTo (Rocq.Corelib.Init.Nat.succ n) = natTo n + 1 := rfl
@[simp] theorem nat_pred_agrees (n : MN) : natTo (Rocq.Corelib.Init.Nat.pred n) = natTo n - 1 := by
  cases n <;> rfl
@[simp] theorem nat_add_agrees (n m : MN) :
  natTo (Rocq.Corelib.Init.Nat.add n m) = natTo n + natTo m := by
  induction n with
  | O => exact (Nat.zero_add _).symm
  | S n ih =>
    change Nat.succ (natTo (Rocq.Corelib.Init.Nat.add n m)) = Nat.succ (natTo n) + natTo m
    rw [ih, Nat.succ_add]
@[simp] theorem nat_sub_agrees (n m : MN) :
  natTo (Rocq.Corelib.Init.Nat.sub n m) = natTo n - natTo m := by
  induction n generalizing m with
  | O => change 0 = 0 - natTo m; simp
  | S n ih => cases m with
    | O => rfl
    | S m =>
      change natTo (Rocq.Corelib.Init.Nat.sub n m) = (natTo n+1)-(natTo m+1)
      rw [Nat.succ_sub_succ]; exact ih m
@[simp] theorem nat_mul_agrees (n m : MN) :
  natTo (Rocq.Corelib.Init.Nat.mul n m) = natTo n * natTo m := by
  induction n with
  | O => exact (Nat.zero_mul _).symm
  | S n ih =>
    change natTo (Rocq.Corelib.Init.Nat.add m (Rocq.Corelib.Init.Nat.mul n m)) = (natTo n+1)*natTo m
    rw [nat_add_agrees, ih, Nat.succ_mul, Nat.add_comm]
@[simp] theorem nat_pow_agrees (n m : MN) :
  natTo (Rocq.Corelib.Init.Nat.pow n m) = natTo n ^ natTo m := by
  induction m with
  | O => rfl
  | S m ih =>
    change natTo (Rocq.Corelib.Init.Nat.mul n (Rocq.Corelib.Init.Nat.pow n m)) = natTo n ^ (natTo m+1)
    rw [nat_mul_agrees, ih, Nat.pow_succ, Nat.mul_comm]
@[simp] theorem nat_double_agrees (n : MN) : natTo (Rocq.Corelib.Init.Nat.double n) = 2*natTo n := by
  change natTo (Rocq.Corelib.Init.Nat.add n n) = 2*natTo n
  rw [nat_add_agrees]; omega
@[simp] theorem nat_square_agrees (n : MN) : natTo (Rocq.Corelib.Init.Nat.square n) = natTo n*natTo n := nat_mul_agrees n n
@[simp] theorem nat_eqb_agrees (n m : MN) :
  boolTo (Rocq.Corelib.Init.Nat.eqb n m) = (natTo n == natTo m) := by
  induction n generalizing m with
  | O => cases m <;> rfl
  | S n ih => cases m with
    | O => rfl
    | S m =>
      change boolTo (Rocq.Corelib.Init.Nat.eqb n m) = (natTo n+1 == natTo m+1)
      simpa using ih m
@[simp] theorem nat_leb_agrees (n m : MN) :
  boolTo (Rocq.Corelib.Init.Nat.leb n m) = decide (natTo n ≤ natTo m) := by
  induction n generalizing m with
  | O => cases m <;> rfl
  | S n ih => cases m with
    | O => rfl
    | S m =>
      change boolTo (Rocq.Corelib.Init.Nat.leb n m) = decide (natTo n+1 ≤ natTo m+1)
      simpa using ih m
@[simp] theorem nat_ltb_agrees (n m : MN) :
  boolTo (Rocq.Corelib.Init.Nat.ltb n m) = decide (natTo n < natTo m) :=
  nat_leb_agrees (.S n) m
@[simp] theorem nat_min_agrees (n m : MN) :
  natTo (Rocq.Corelib.Init.Nat.min n m) = min (natTo n) (natTo m) := by
  induction n generalizing m with
  | O => cases m <;> rfl
  | S n ih => cases m with
    | O => rfl
    | S m =>
      change natTo (Rocq.Corelib.Init.Nat.min n m)+1 = min (natTo n+1) (natTo m+1)
      rw [ih]; omega
@[simp] theorem nat_max_agrees (n m : MN) :
  natTo (Rocq.Corelib.Init.Nat.max n m) = max (natTo n) (natTo m) := by
  induction n generalizing m with
  | O => cases m <;> rfl
  | S n ih => cases m with
    | O => rfl
    | S m =>
      change natTo (Rocq.Corelib.Init.Nat.max n m)+1 = max (natTo n+1) (natTo m+1)
      rw [ih]; omega
theorem translated_add_comm (n m : MN) :
  Rocq.Corelib.Init.Nat.add n m = Rocq.Corelib.Init.Nat.add m n := by
  apply natIso.injective
  change natTo _ = natTo _
  rw [nat_add_agrees,nat_add_agrees,Nat.add_comm]

def nat_type_agrees : Iso Rocq.Corelib.Init.Nat.t Nat := natIso
theorem translated_mul_comm (n m : MN) :
 Rocq.Corelib.Init.Nat.mul n m = Rocq.Corelib.Init.Nat.mul m n := by
 apply natIso.injective
 change natTo _ = natTo _
 rw [nat_mul_agrees,nat_mul_agrees,Nat.mul_comm]
theorem translated_add_assoc (n m k : MN) :
 Rocq.Corelib.Init.Nat.add (Rocq.Corelib.Init.Nat.add n m) k =
 Rocq.Corelib.Init.Nat.add n (Rocq.Corelib.Init.Nat.add m k) := by
 apply natIso.injective
 change natTo _ = natTo _
 simp only [nat_add_agrees,Nat.add_assoc]
theorem translated_sub_add (n m : MN) (h : natTo m ≤ natTo n) :
 Rocq.Corelib.Init.Nat.add (Rocq.Corelib.Init.Nat.sub n m) m = n := by
 apply natIso.injective
 change natTo _ = natTo _
 rw [nat_add_agrees,nat_sub_agrees]
 exact Nat.sub_add_cancel h

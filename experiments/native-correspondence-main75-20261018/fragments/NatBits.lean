
@[simp] theorem nat_testbit_agrees (a n : Nat) :
 boolTo (Rocq.Corelib.Init.Nat.testbit a n) = a.testBit n := by
 induction n generalizing a with
 | zero => change boolTo (Rocq.Corelib.Init.Nat.odd a) = _; rw [nat_odd_agrees, Nat.testBit_zero]
 | succ n ih =>
   change boolTo (Rocq.Corelib.Init.Nat.testbit (Rocq.Corelib.Init.Nat.div2 a) n) = _
   rw [ih, nat_div2_agrees, Nat.testBit_succ]
theorem nat_bitwise_step (op : RBool → RBool → RBool) (n a b : Nat) :
 Rocq.Corelib.Init.Nat.bitwise op (n+1) a b =
 (boolTo (op (Rocq.Corelib.Init.Nat.odd a) (Rocq.Corelib.Init.Nat.odd b))).toNat +
 2 * Rocq.Corelib.Init.Nat.bitwise op n (Rocq.Corelib.Init.Nat.div2 a) (Rocq.Corelib.Init.Nat.div2 b) := by
 change Rocq.Corelib.Init.Nat.add _ (Rocq.Corelib.Init.Nat.mul 2 _) = _
 rw [nat_add_agrees, nat_mul_agrees]
 cases op (Rocq.Corelib.Init.Nat.odd a) (Rocq.Corelib.Init.Nat.odd b) <;> rfl
theorem nat_bitwise_bits (op : RBool → RBool → RBool) (f : Bool → Bool → Bool)
 (hf : ∀ x y, boolTo (op x y) = f (boolTo x) (boolTo y)) (n a b i : Nat) :
 (Rocq.Corelib.Init.Nat.bitwise op n a b).testBit i =
 (decide (i < n) && f (a.testBit i) (b.testBit i)) := by
 induction n generalizing a b i with
 | zero => change (0 : Nat).testBit i = _; simp
 | succ n ih =>
   rw [nat_bitwise_step, hf, nat_odd_agrees, nat_odd_agrees,
     ← Nat.testBit_zero, ← Nat.testBit_zero, nat_div2_agrees, nat_div2_agrees]
   cases i with
   | zero =>
     rw [Nat.testBit_zero]
     cases h : f (a.testBit 0) (b.testBit 0) <;> simp [Bool.toNat, Nat.add_mod, Nat.mul_mod]
   | succ i =>
     rw [Nat.testBit_succ]
     have low : (f (a.testBit 0) (b.testBit 0)).toNat < 2 := by cases f (a.testBit 0) (b.testBit 0) <;> decide
     have half : ((f (a.testBit 0) (b.testBit 0)).toNat +
       2 * Rocq.Corelib.Init.Nat.bitwise op n (a/2) (b/2)) / 2 =
       Rocq.Corelib.Init.Nat.bitwise op n (a/2) (b/2) := by omega
     rw [half, ih, Nat.testBit_succ, Nat.testBit_succ]
     simp
theorem nat_bitwise_agrees (op : RBool → RBool → RBool) (f : Bool → Bool → Bool)
 (hf : ∀ x y, boolTo (op x y) = f (boolTo x) (boolTo y))
 (hff : f false false = false) (n a b : Nat) :
 Rocq.Corelib.Init.Nat.bitwise op n a b = Nat.bitwise f a b % 2^n := by
 apply Nat.eq_of_testBit_eq
 intro i
 rw [nat_bitwise_bits op f hf, Nat.testBit_mod_two_pow, Nat.testBit_bitwise hff]
@[simp] theorem nat_land_agrees (a b : Nat) :
 Rocq.Corelib.Init.Nat.land a b = a &&& b := by
 change Rocq.Corelib.Init.Nat.bitwise _ a a b = _
 rw [nat_bitwise_agrees _ Bool.and (by intro x y; cases x <;> cases y <;> rfl) rfl]
 exact Nat.mod_eq_of_lt (Nat.lt_of_le_of_lt Nat.and_le_left (Nat.lt_two_pow_self))
@[simp] theorem nat_lor_agrees (a b : Nat) :
 Rocq.Corelib.Init.Nat.lor a b = a ||| b := by
 change Rocq.Corelib.Init.Nat.bitwise _ (Rocq.Corelib.Init.Nat.max a b) a b = _
 rw [nat_max_agrees, nat_bitwise_agrees _ Bool.or (by intro x y; cases x <;> cases y <;> rfl) rfl]
 exact Nat.mod_eq_of_lt (Nat.or_lt_two_pow
   (Nat.lt_of_le_of_lt (Nat.le_max_left a b) Nat.lt_two_pow_self)
   (Nat.lt_of_le_of_lt (Nat.le_max_right a b) Nat.lt_two_pow_self))
@[simp] theorem nat_lxor_agrees (a b : Nat) :
 Rocq.Corelib.Init.Nat.lxor a b = a ^^^ b := by
 change Rocq.Corelib.Init.Nat.bitwise _ (Rocq.Corelib.Init.Nat.max a b) a b = _
 rw [nat_max_agrees, nat_bitwise_agrees _ Bool.xor (by intro x y; cases x <;> cases y <;> rfl) rfl]
 exact Nat.mod_eq_of_lt (Nat.xor_lt_two_pow
   (Nat.lt_of_le_of_lt (Nat.le_max_left a b) Nat.lt_two_pow_self)
   (Nat.lt_of_le_of_lt (Nat.le_max_right a b) Nat.lt_two_pow_self))
@[simp] theorem nat_ldiff_agrees (a b : Nat) :
 Rocq.Corelib.Init.Nat.ldiff a b = Nat.bitwise (fun x y => x && !y) a b := by
 apply Nat.eq_of_testBit_eq
 intro i
 change (Rocq.Corelib.Init.Nat.bitwise _ a a b).testBit i = _
 rw [nat_bitwise_bits _ (fun x y => x && !y) (by intro x y; cases x <;> cases y <;> rfl),
   Nat.testBit_bitwise (by rfl)]
 by_cases h : i < a
 · simp [h]
 · have ha : a < 2^i := Nat.lt_of_lt_of_le Nat.lt_two_pow_self (Nat.pow_le_pow_right (by decide) (by omega))
   simp [h, Nat.testBit_lt_two_pow ha]

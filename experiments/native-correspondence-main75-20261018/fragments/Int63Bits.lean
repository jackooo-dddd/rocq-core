
theorem word_bitwise_bits (f : Bool → Bool → Bool) (n a b i : Nat) :
 (Rocq2Lean.PrimInt63.bitwise f n a b).testBit i =
 (decide (i < n) && f (a.testBit i) (b.testBit i)) := by
 induction n generalizing a b i with
 | zero => change (0 : Nat).testBit i = _; simp
 | succ n ih =>
   rw [Rocq2Lean.PrimInt63.bitwise]
   have ha : (a % 2 == 1) = a.testBit 0 := by simp [Bool.beq_eq_decide_eq]
   have hb : (b % 2 == 1) = b.testBit 0 := by simp [Bool.beq_eq_decide_eq]
   rw [ha,hb]
   cases i with
   | zero =>
     rw [Nat.testBit_zero]
     cases h : f (a.testBit 0) (b.testBit 0) <;> simp [Nat.add_mod]
   | succ i =>
     rw [Nat.testBit_succ]
     have low : (if f (a.testBit 0) (b.testBit 0) then 1 else 0) < 2 := by
       cases f (a.testBit 0) (b.testBit 0) <;> decide
     have half : ((if f (a.testBit 0) (b.testBit 0) then 1 else 0) +
       2 * Rocq2Lean.PrimInt63.bitwise f n (a/2) (b/2)) / 2 =
       Rocq2Lean.PrimInt63.bitwise f n (a/2) (b/2) := by omega
     rw [half, ih, Nat.testBit_succ, Nat.testBit_succ]
     simp
theorem word_bitwise_agrees (f : Bool → Bool → Bool) (hff : f false false = false) (n a b : Nat) :
 Rocq2Lean.PrimInt63.bitwise f n a b = Nat.bitwise f a b % 2^n := by
 apply Nat.eq_of_testBit_eq
 intro i
 rw [word_bitwise_bits, Nat.testBit_mod_two_pow, Nat.testBit_bitwise hff]
@[simp] theorem int63_land_agrees (x y : BitVec 63) :
 Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.land x y = x &&& y := by
 apply BitVec.eq_of_toNat_eq
 simp only [Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.land, Rocq2Lean.PrimInt63.land,
  BitVec.toNat_ofNat, word_bitwise_agrees Bool.and rfl, Nat.mod_mod, BitVec.toNat_and]
 exact Nat.mod_eq_of_lt (Nat.lt_of_le_of_lt Nat.and_le_left x.isLt)
@[simp] theorem int63_lor_agrees (x y : BitVec 63) :
 Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lor x y = x ||| y := by
 apply BitVec.eq_of_toNat_eq
 simp only [Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lor, Rocq2Lean.PrimInt63.lor,
  BitVec.toNat_ofNat, word_bitwise_agrees Bool.or rfl, Nat.mod_mod, BitVec.toNat_or]
 exact Nat.mod_eq_of_lt (Nat.or_lt_two_pow x.isLt y.isLt)
@[simp] theorem int63_lxor_agrees (x y : BitVec 63) :
 Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lxor x y = x ^^^ y := by
 apply BitVec.eq_of_toNat_eq
 simp only [Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lxor, Rocq2Lean.PrimInt63.lxor,
  BitVec.toNat_ofNat, word_bitwise_agrees Bool.xor rfl, Nat.mod_mod, BitVec.toNat_xor]
 exact Nat.mod_eq_of_lt (Nat.xor_lt_two_pow x.isLt y.isLt)
@[simp] theorem int63_lsl_agrees (x y : BitVec 63) :
 Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsl x y = x <<< y.toNat := by
 change (if y.toNat < 63 then BitVec.ofNat 63 (x.toNat <<< y.toNat) else BitVec.ofNat 63 0) = _
 by_cases h : y.toNat < 63
 · simp only [h, if_true]
   apply BitVec.eq_of_toNat_eq
   simp
 · simp [h, BitVec.shiftLeft_eq_zero (by omega : 63 ≤ y.toNat)]
@[simp] theorem int63_lsr_agrees (x y : BitVec 63) :
 Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr x y = x >>> y.toNat := by
 change (if y.toNat < 63 then BitVec.ofNat 63 (x.toNat >>> y.toNat) else BitVec.ofNat 63 0) = _
 by_cases h : y.toNat < 63
 · simp only [h, if_true]
   apply BitVec.eq_of_toNat_eq
   simp only [BitVec.toNat_ofNat, BitVec.toNat_ushiftRight]
   exact Nat.mod_eq_of_lt (Nat.lt_of_le_of_lt (Nat.shiftRight_le _ _) x.isLt)
 · simp [h, BitVec.ushiftRight_eq_zero (by omega : 63 ≤ y.toNat)]

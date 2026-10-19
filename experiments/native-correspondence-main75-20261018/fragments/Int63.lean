def int63Iso : Iso Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int (BitVec 63) := ⟨id,id,fun _ => rfl,fun _ => rfl⟩
def int63WrapperIso : Iso Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int_wrapper (BitVec 63) where
  to := Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int_wrap
  of := Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int_wrapper.wrap_int
  of_to x := by cases x <;> rfl
  to_of _ := rfl
@[simp] theorem int63_id_agrees (x : BitVec 63) : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.id_int x = x := rfl
@[simp] theorem int63_add_agrees (x y : BitVec 63) : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.add x y = x + y := rfl
@[simp] theorem int63_sub_agrees (x y : BitVec 63) : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.sub x y = x-y := rfl
@[simp] theorem int63_mul_agrees (x y : BitVec 63) : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mul x y = x*y := rfl
@[simp] theorem int63_div_agrees (x y : BitVec 63) : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.div x y = x / y := by
  apply BitVec.eq_of_toNat_eq
  change (x.toNat / y.toNat) % 2^63 = x.toNat / y.toNat
  exact Nat.mod_eq_of_lt (Nat.lt_of_le_of_lt (Nat.div_le_self x.toNat y.toNat) x.isLt)
@[simp] theorem int63_mod_agrees (x y : BitVec 63) : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mod x y = x % y := by
  apply BitVec.eq_of_toNat_eq
  change (x.toNat % y.toNat) % 2^63 = x.toNat % y.toNat
  exact Nat.mod_eq_of_lt (Nat.lt_of_le_of_lt (Nat.mod_le x.toNat y.toNat) x.isLt)
@[simp] theorem int63_eqb_agrees (x y : BitVec 63) : boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.eqb x y) = (x.toNat == y.toNat) := by
  change boolTo (Bool.rec .false .true (x.toNat == y.toNat)) = _
  cases (x.toNat == y.toNat) <;> rfl
@[simp] theorem int63_ltb_agrees (x y : BitVec 63) : boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb x y) = decide (x.toNat < y.toNat) := by
  change boolTo (Bool.rec .false .true (decide (x.toNat < y.toNat))) = _
  cases (decide (x.toNat < y.toNat)) <;> rfl
@[simp] theorem int63_leb_agrees (x y : BitVec 63) : boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.leb x y) = decide (x.toNat ≤ y.toNat) := by
  change boolTo (Bool.rec .false .true (decide (x.toNat ≤ y.toNat))) = _
  cases (decide (x.toNat ≤ y.toNat)) <;> rfl
@[simp] theorem int63_ltsb_agrees (x y : BitVec 63) : boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltsb x y) = decide (x.toInt < y.toInt) := by
  change boolTo (Bool.rec .false .true (decide (x.toInt < y.toInt))) = _
  cases (decide (x.toInt < y.toInt)) <;> rfl
@[simp] theorem int63_lesb_agrees (x y : BitVec 63) : boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lesb x y) = decide (x.toInt ≤ y.toInt) := by
  change boolTo (Bool.rec .false .true (decide (x.toInt ≤ y.toInt))) = _
  cases (decide (x.toInt ≤ y.toInt)) <;> rfl
@[simp] theorem int63_compare_agrees (x y : BitVec 63) :
  comparisonTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.compare x y) = (if x.toNat < y.toNat then Ordering.lt else if y.toNat < x.toNat then Ordering.gt else Ordering.eq) := by
  unfold Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.compare Rocq2Lean.PrimInt63.compare
  split
  · rfl
  · split <;> rfl
@[simp] theorem int63_compares_agrees (x y : BitVec 63) :
  comparisonTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.compares x y) = (if x.toInt < y.toInt then Ordering.lt else if y.toInt < x.toInt then Ordering.gt else Ordering.eq) := by
  unfold Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.compares Rocq2Lean.PrimInt63.compares
  split
  · rfl
  · split <;> rfl
@[simp] theorem int63_add_nat (x y : BitVec 63) : (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.add x y).toNat = (x.toNat+y.toNat) % 2^63 := rfl
@[simp] theorem int63_mul_nat (x y : BitVec 63) : (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mul x y).toNat = (x.toNat*y.toNat) % 2^63 := rfl

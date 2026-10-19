@[simp] theorem binaryIntTo_pos (p : RPositive) : binaryIntTo (.Zpos p) = (positiveTo p : Int) := rfl
@[simp] theorem binaryIntTo_neg (p : RPositive) : binaryIntTo (.Zneg p) = -(positiveTo p : Int) := rfl
@[simp] theorem binaryIntTo_zero : binaryIntTo .Z0 = 0 := rfl
@[simp] theorem int_opp_agrees (x : RIntBinary) : binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.opp x) = -binaryIntTo x := by
  cases x <;> simp [Rocq.Corelib.BinNums.IntDef.Z.opp, binaryIntTo]
@[simp] theorem int_mul_agrees (x y : RIntBinary) :
  binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.mul x y) = binaryIntTo x * binaryIntTo y := by
  cases x <;> cases y <;>
    simp only [Rocq.Corelib.BinNums.IntDef.Z.mul, Rocq.Corelib.Numbers.BinNums.Z.rec, binaryIntTo_pos, binaryIntTo_neg, binaryIntTo_zero, positive_mul_agrees, Int.natCast_mul, Int.zero_mul, Int.mul_zero, Int.neg_mul, Int.mul_neg, Int.neg_neg, Int.neg_zero]
@[simp] theorem int_of_nat_agrees (n : Nat) :
  binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.of_nat n) = (n : Int) := by
  cases n with
  | zero => rfl
  | succ n =>
    change (positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.of_succ_nat n) : Int) = (n+1 : Nat)
    rw [positive_of_succ_nat_agrees]
@[simp] theorem int_of_binary_nat_agrees (n : RNatBinary) :
  binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.of_N n) = (binaryNatTo n : Int) := by cases n <;> rfl
@[simp] theorem int_to_nat_agrees (z : RIntBinary) :
  Rocq.Corelib.BinNums.IntDef.Z.to_nat z = (binaryIntTo z).toNat := by
  cases z with
  | Z0 => rfl
  | Zpos p => exact positive_to_nat_agrees p
  | Zneg p =>
    change 0 = (-(positiveTo p : Int)).toNat
    omega

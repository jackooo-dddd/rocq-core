theorem positive_iter_add (p : RPositive) (n : MN) :
  natTo (Rocq.Corelib.BinNums.PosDef.Pos.iter_op MN Rocq.Corelib.Init.Nat.add p n) = positiveTo p * natTo n := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec generalizing n with
  | xI p ih =>
    change natTo (Rocq.Corelib.Init.Nat.add n (Rocq.Corelib.BinNums.PosDef.Pos.iter_op MN Rocq.Corelib.Init.Nat.add p (Rocq.Corelib.Init.Nat.add n n))) = _
    rw [nat_add_agrees, ih, nat_add_agrees, positiveTo_xI, Nat.add_mul, Nat.one_mul, Nat.mul_add]
    try simp only [Nat.mul_assoc]
    omega
  | xO p ih =>
    change natTo (Rocq.Corelib.BinNums.PosDef.Pos.iter_op MN Rocq.Corelib.Init.Nat.add p (Rocq.Corelib.Init.Nat.add n n)) = _
    rw [ih, nat_add_agrees, positiveTo_xO, Nat.mul_add, Nat.mul_assoc]
    try simp only [Nat.mul_assoc]
    omega
  | xH => exact (Nat.one_mul (natTo n)).symm
@[simp] theorem positive_to_nat_agrees (p : RPositive) : natTo (Rocq.Corelib.BinNums.PosDef.Pos.to_nat p) = positiveTo p := by
  change natTo (Rocq.Corelib.BinNums.PosDef.Pos.iter_op MN Rocq.Corelib.Init.Nat.add p (.S .O)) = _
  rw [positive_iter_add]; exact Nat.mul_one _
@[simp] theorem positive_of_succ_nat_agrees (n : MN) :
  positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.of_succ_nat n) = natTo n+1 := by
  induction n with
  | O => rfl
  | S n ih =>
    change positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.succ (Rocq.Corelib.BinNums.PosDef.Pos.of_succ_nat n)) = natTo n+1+1
    rw [positive_succ_agrees, ih]

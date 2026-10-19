theorem positive_iter_add (p : RPositive) (n : Nat) :
  Rocq.Corelib.BinNums.PosDef.Pos.iter_op Nat Rocq.Corelib.Init.Nat.add p n = positiveTo p * n := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec generalizing n with
  | xI p ih =>
    change Rocq.Corelib.Init.Nat.add n (Rocq.Corelib.BinNums.PosDef.Pos.iter_op Nat Rocq.Corelib.Init.Nat.add p (Rocq.Corelib.Init.Nat.add n n)) = _
    rw [nat_add_agrees, ih, nat_add_agrees, positiveTo_xI, Nat.add_mul, Nat.one_mul, Nat.mul_add]
    try simp only [Nat.mul_assoc]
    omega
  | xO p ih =>
    change Rocq.Corelib.BinNums.PosDef.Pos.iter_op Nat Rocq.Corelib.Init.Nat.add p (Rocq.Corelib.Init.Nat.add n n) = _
    rw [ih, nat_add_agrees, positiveTo_xO, Nat.mul_add, Nat.mul_assoc]
    try simp only [Nat.mul_assoc]
    omega
  | xH => exact (Nat.one_mul n).symm
@[simp] theorem positive_to_nat_agrees (p : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.to_nat p = positiveTo p := by
  change Rocq.Corelib.BinNums.PosDef.Pos.iter_op Nat Rocq.Corelib.Init.Nat.add p 1 = _
  rw [positive_iter_add, Nat.mul_one]
@[simp] theorem positive_of_succ_nat_agrees (n : Nat) :
  positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.of_succ_nat n) = n+1 := by
  induction n with
  | zero => rfl
  | succ n ih =>
    change positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.succ (Rocq.Corelib.BinNums.PosDef.Pos.of_succ_nat n)) = n+1+1
    rw [positive_succ_agrees, ih]

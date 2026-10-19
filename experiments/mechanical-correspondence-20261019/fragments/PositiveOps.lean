@[simp] theorem positive_succ_agrees (p : RPositive) : positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.succ p) = positiveTo p + 1 := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec with
  | xI p ih =>
    change 2 * positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.succ p) = 2*positiveTo p+1+1
    rw [ih]; omega
  | xO p ih => rfl
  | xH => rfl
@[simp] theorem pos_add_xI_xI (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add (.xI p) (.xI q) = .xO (Rocq.Corelib.BinNums.PosDef.Pos.add_carry p q) := rfl
@[simp] theorem pos_add_xI_xO (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add (.xI p) (.xO q) = .xI (Rocq.Corelib.BinNums.PosDef.Pos.add p q) := rfl
@[simp] theorem pos_add_xI_xH (p : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add (.xI p) .xH = .xO (Rocq.Corelib.BinNums.PosDef.Pos.succ p) := rfl
@[simp] theorem pos_add_xO_xI (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add (.xO p) (.xI q) = .xI (Rocq.Corelib.BinNums.PosDef.Pos.add p q) := rfl
@[simp] theorem pos_add_xO_xO (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add (.xO p) (.xO q) = .xO (Rocq.Corelib.BinNums.PosDef.Pos.add p q) := rfl
@[simp] theorem pos_add_xO_xH (p : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add (.xO p) .xH = .xI p := rfl
@[simp] theorem pos_add_xH_xI (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add .xH (.xI q) = .xO (Rocq.Corelib.BinNums.PosDef.Pos.succ q) := rfl
@[simp] theorem pos_add_xH_xO (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add .xH (.xO q) = .xI q := rfl
@[simp] theorem pos_add_xH_xH : Rocq.Corelib.BinNums.PosDef.Pos.add .xH .xH = .xO .xH := rfl
@[simp] theorem pos_add_carry_xI_xI (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add_carry (.xI p) (.xI q) = .xI (Rocq.Corelib.BinNums.PosDef.Pos.add_carry p q) := rfl
@[simp] theorem pos_add_carry_xI_xO (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add_carry (.xI p) (.xO q) = .xO (Rocq.Corelib.BinNums.PosDef.Pos.add_carry p q) := rfl
@[simp] theorem pos_add_carry_xI_xH (p : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add_carry (.xI p) .xH = .xI (Rocq.Corelib.BinNums.PosDef.Pos.succ p) := rfl
@[simp] theorem pos_add_carry_xO_xI (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add_carry (.xO p) (.xI q) = .xO (Rocq.Corelib.BinNums.PosDef.Pos.add_carry p q) := rfl
@[simp] theorem pos_add_carry_xO_xO (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add_carry (.xO p) (.xO q) = .xI (Rocq.Corelib.BinNums.PosDef.Pos.add p q) := rfl
@[simp] theorem pos_add_carry_xO_xH (p : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add_carry (.xO p) .xH = .xO (Rocq.Corelib.BinNums.PosDef.Pos.succ p) := rfl
@[simp] theorem pos_add_carry_xH_xI (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add_carry .xH (.xI q) = .xI (Rocq.Corelib.BinNums.PosDef.Pos.succ q) := rfl
@[simp] theorem pos_add_carry_xH_xO (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add_carry .xH (.xO q) = .xO (Rocq.Corelib.BinNums.PosDef.Pos.succ q) := rfl
@[simp] theorem pos_add_carry_xH_xH : Rocq.Corelib.BinNums.PosDef.Pos.add_carry .xH .xH = .xI .xH := rfl

theorem positive_add_pair (p q : RPositive) :
  positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.add p q) = positiveTo p + positiveTo q ∧
  positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.add_carry p q) = positiveTo p + positiveTo q + 1 := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec generalizing q with
  | xI p ih =>
    cases q with
    | xI q => have h := ih q; simp only [pos_add_xI_xI, pos_add_carry_xI_xI, positiveTo_xO, positiveTo_xI, h.1, h.2]; constructor <;> first | omega | trivial
    | xO q => have h := ih q; simp only [pos_add_xI_xO, pos_add_carry_xI_xO, positiveTo_xO, positiveTo_xI, h.1, h.2]; constructor <;> first | omega | trivial
    | xH => simp only [pos_add_xI_xH, pos_add_carry_xI_xH, positiveTo_xO, positiveTo_xI, positiveTo_xH, positive_succ_agrees]; constructor <;> first | omega | trivial
  | xO p ih =>
    cases q with
    | xI q => have h := ih q; simp only [pos_add_xO_xI, pos_add_carry_xO_xI, positiveTo_xO, positiveTo_xI, h.1, h.2]; constructor <;> first | omega | trivial
    | xO q => have h := ih q; simp only [pos_add_xO_xO, pos_add_carry_xO_xO, positiveTo_xO, positiveTo_xI, h.1, h.2]; constructor <;> first | omega | trivial
    | xH => simp only [pos_add_xO_xH, pos_add_carry_xO_xH, positiveTo_xO, positiveTo_xI, positiveTo_xH, positive_succ_agrees]; constructor <;> first | omega | trivial
  | xH =>
    cases q <;> simp only [pos_add_xH_xI, pos_add_carry_xH_xI, pos_add_xH_xO, pos_add_carry_xH_xO, pos_add_xH_xH, pos_add_carry_xH_xH, positiveTo_xO, positiveTo_xI, positiveTo_xH, positive_succ_agrees] <;> constructor <;> first | omega | trivial
@[simp] theorem positive_add_agrees (p q : RPositive) :
  positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.add p q) = positiveTo p + positiveTo q := (positive_add_pair p q).1
@[simp] theorem positive_add_carry_agrees (p q : RPositive) :
  positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.add_carry p q) = positiveTo p + positiveTo q + 1 := (positive_add_pair p q).2
@[simp] theorem positive_mul_agrees (p q : RPositive) :
  positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.mul p q) = positiveTo p * positiveTo q := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec with
  | xI p ih =>
    change positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.add q (.xO (Rocq.Corelib.BinNums.PosDef.Pos.mul p q))) = _
    rw [positive_add_agrees, positiveTo_xO, ih, positiveTo_xI, Nat.add_mul, Nat.one_mul, Nat.mul_assoc]
    omega
  | xO p ih =>
    change 2 * positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.mul p q) = _
    rw [ih, positiveTo_xO, Nat.mul_assoc]
  | xH => change positiveTo q = 1 * positiveTo q; exact (Nat.one_mul _).symm
@[simp] theorem positive_pred_double_agrees (p : RPositive) :
  positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p) = 2*positiveTo p-1 := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec with
  | xI p ih => change 2*(2*positiveTo p)+1 = 2*(2*positiveTo p+1)-1; omega
  | xO p ih =>
    change 2*positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p)+1 = 2*(2*positiveTo p)-1
    rw [ih]; have := positiveTo_pos p; omega
  | xH => rfl

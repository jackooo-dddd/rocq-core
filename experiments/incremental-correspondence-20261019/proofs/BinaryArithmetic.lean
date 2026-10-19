import BinaryInt
noncomputable section
namespace NativeBridge.Incremental.BinaryArithmetic
open NativeBridge NativeBridge.Incremental.BinaryInt
-- The exact second component of the mechanical mutual-recursion pair used by Pos.add.
-- It is not exported as a separate dependency in this artifact; all component equations below
-- are proved by definitional equality against the unchanged imported Pos.add recursor.
run_cmd Lean.Elab.Command.liftTermElabM do
  let ci ← Lean.getConstInfo "Rocq.Corelib.BinNums.PosDef.Pos.add".toName
  let .defnInfo di := ci | throwError "Expected a definition"
  let .lam xn xt (.lam yn yt (.app (.proj pn 0 pair) arg) ybi) xbi := di.value
    | throwError "Unexpected source mutual-recursion projection"
  let value := Lean.Expr.lam xn xt (.lam yn yt (.app (.proj pn 1 pair) arg) ybi) xbi
  Lean.addDecl (.defnDecl {di with name := "NativeBridge.Incremental.BinaryArithmetic.positiveCarryAux".toName, value := value})
@[simp] theorem positive_succ_agrees (p : RPositive) : positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.succ p) = positiveTo p + 1 := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec with
  | xI p ih =>
    change 2 * positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.succ p) = 2*positiveTo p+1+1
    rw [ih]; omega
  | xO p ih => rfl
  | xH => rfl
@[simp] theorem pos_add_xI_xI (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add (.xI p) (.xI q) = .xO (NativeBridge.Incremental.BinaryArithmetic.positiveCarryAux p q) := rfl
@[simp] theorem pos_add_xI_xO (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add (.xI p) (.xO q) = .xI (Rocq.Corelib.BinNums.PosDef.Pos.add p q) := rfl
@[simp] theorem pos_add_xI_xH (p : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add (.xI p) .xH = .xO (Rocq.Corelib.BinNums.PosDef.Pos.succ p) := rfl
@[simp] theorem pos_add_xO_xI (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add (.xO p) (.xI q) = .xI (Rocq.Corelib.BinNums.PosDef.Pos.add p q) := rfl
@[simp] theorem pos_add_xO_xO (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add (.xO p) (.xO q) = .xO (Rocq.Corelib.BinNums.PosDef.Pos.add p q) := rfl
@[simp] theorem pos_add_xO_xH (p : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add (.xO p) .xH = .xI p := rfl
@[simp] theorem pos_add_xH_xI (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add .xH (.xI q) = .xO (Rocq.Corelib.BinNums.PosDef.Pos.succ q) := rfl
@[simp] theorem pos_add_xH_xO (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add .xH (.xO q) = .xI q := rfl
@[simp] theorem pos_add_xH_xH : Rocq.Corelib.BinNums.PosDef.Pos.add .xH .xH = .xO .xH := rfl
@[simp] theorem pos_add_carry_xI_xI (p : RPositive) (q : RPositive) : NativeBridge.Incremental.BinaryArithmetic.positiveCarryAux (.xI p) (.xI q) = .xI (NativeBridge.Incremental.BinaryArithmetic.positiveCarryAux p q) := rfl
@[simp] theorem pos_add_carry_xI_xO (p : RPositive) (q : RPositive) : NativeBridge.Incremental.BinaryArithmetic.positiveCarryAux (.xI p) (.xO q) = .xO (NativeBridge.Incremental.BinaryArithmetic.positiveCarryAux p q) := rfl
@[simp] theorem pos_add_carry_xI_xH (p : RPositive) : NativeBridge.Incremental.BinaryArithmetic.positiveCarryAux (.xI p) .xH = .xI (Rocq.Corelib.BinNums.PosDef.Pos.succ p) := rfl
@[simp] theorem pos_add_carry_xO_xI (p : RPositive) (q : RPositive) : NativeBridge.Incremental.BinaryArithmetic.positiveCarryAux (.xO p) (.xI q) = .xO (NativeBridge.Incremental.BinaryArithmetic.positiveCarryAux p q) := rfl
@[simp] theorem pos_add_carry_xO_xO (p : RPositive) (q : RPositive) : NativeBridge.Incremental.BinaryArithmetic.positiveCarryAux (.xO p) (.xO q) = .xI (Rocq.Corelib.BinNums.PosDef.Pos.add p q) := rfl
@[simp] theorem pos_add_carry_xO_xH (p : RPositive) : NativeBridge.Incremental.BinaryArithmetic.positiveCarryAux (.xO p) .xH = .xO (Rocq.Corelib.BinNums.PosDef.Pos.succ p) := rfl
@[simp] theorem pos_add_carry_xH_xI (q : RPositive) : NativeBridge.Incremental.BinaryArithmetic.positiveCarryAux .xH (.xI q) = .xI (Rocq.Corelib.BinNums.PosDef.Pos.succ q) := rfl
@[simp] theorem pos_add_carry_xH_xO (q : RPositive) : NativeBridge.Incremental.BinaryArithmetic.positiveCarryAux .xH (.xO q) = .xO (Rocq.Corelib.BinNums.PosDef.Pos.succ q) := rfl
@[simp] theorem pos_add_carry_xH_xH : NativeBridge.Incremental.BinaryArithmetic.positiveCarryAux .xH .xH = .xI .xH := rfl

theorem positive_add_pair (p q : RPositive) :
  positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.add p q) = positiveTo p + positiveTo q ∧
  positiveTo (NativeBridge.Incremental.BinaryArithmetic.positiveCarryAux p q) = positiveTo p + positiveTo q + 1 := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec generalizing q with
  | xI p ih =>
    cases q with
    | xI q => have h := ih q; simp only [pos_add_xI_xI, pos_add_carry_xI_xI, positiveTo_xO, positiveTo_xI, h.2]; constructor <;> first | omega | trivial
    | xO q => have h := ih q; simp only [pos_add_xI_xO, pos_add_carry_xI_xO, positiveTo_xO, positiveTo_xI, h.1, h.2]; constructor <;> first | omega | trivial
    | xH => simp only [pos_add_xI_xH, pos_add_carry_xI_xH, positiveTo_xO, positiveTo_xI, positiveTo_xH, positive_succ_agrees]; constructor <;> first | omega | trivial
  | xO p ih =>
    cases q with
    | xI q => have h := ih q; simp only [pos_add_xO_xI, pos_add_carry_xO_xI, positiveTo_xO, positiveTo_xI, h.1, h.2]; constructor <;> first | omega | trivial
    | xO q => have h := ih q; simp only [pos_add_xO_xO, pos_add_carry_xO_xO, positiveTo_xO, positiveTo_xI, h.1]; constructor <;> first | omega | trivial
    | xH => simp only [pos_add_xO_xH, pos_add_carry_xO_xH, positiveTo_xO, positiveTo_xI, positiveTo_xH, positive_succ_agrees]; constructor <;> first | omega | trivial
  | xH =>
    cases q <;> simp only [pos_add_xH_xI, pos_add_carry_xH_xI, pos_add_xH_xO, pos_add_carry_xH_xO, pos_add_xH_xH, pos_add_carry_xH_xH, positiveTo_xO, positiveTo_xI, positiveTo_xH, positive_succ_agrees] <;> constructor <;> first | omega | trivial
@[simp] theorem positive_add_agrees (p q : RPositive) :
  positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.add p q) = positiveTo p + positiveTo q := (positive_add_pair p q).1
@[simp] theorem positive_add_carry_agrees (p q : RPositive) :
  positiveTo (NativeBridge.Incremental.BinaryArithmetic.positiveCarryAux p q) = positiveTo p + positiveTo q + 1 := (positive_add_pair p q).2
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

theorem z_pos_sub_agrees (p q : RPositive) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.pos_sub p q) =
      (positiveTo p : Int) - (positiveTo q : Int) := by
  induction q generalizing p with
  | xI q ih =>
    cases p with
    | xI p =>
      change binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.double (Rocq.Corelib.BinNums.IntDef.Z.pos_sub p q)) =
        ((2*positiveTo p+1 : Nat) : Int) - ((2*positiveTo q+1 : Nat) : Int)
      rw [z_double_agrees,ih]; omega
    | xO p =>
      change binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.pred_double (Rocq.Corelib.BinNums.IntDef.Z.pos_sub p q)) =
        ((2*positiveTo p : Nat) : Int) - ((2*positiveTo q+1 : Nat) : Int)
      rw [z_pred_double_agrees,ih]; omega
    | xH => change -((2*positiveTo q : Nat) : Int) = 1 - ((2*positiveTo q+1 : Nat) : Int); omega
  | xO q ih =>
    cases p with
    | xI p =>
      change binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.succ_double (Rocq.Corelib.BinNums.IntDef.Z.pos_sub p q)) =
        ((2*positiveTo p+1 : Nat) : Int) - ((2*positiveTo q : Nat) : Int)
      rw [z_succ_double_agrees,ih]; omega
    | xO p =>
      change binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.double (Rocq.Corelib.BinNums.IntDef.Z.pos_sub p q)) =
        ((2*positiveTo p : Nat) : Int) - ((2*positiveTo q : Nat) : Int)
      rw [z_double_agrees,ih]; omega
    | xH =>
      change -(positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_double q) : Int) = 1 - ((2*positiveTo q : Nat) : Int)
      rw [positive_pred_double_agrees]; have := positiveTo_pos q; omega
  | xH =>
    cases p with
    | xI p => change ((2*positiveTo p : Nat) : Int) = ((2*positiveTo p+1 : Nat) : Int)-1; omega
    | xO p =>
      change (positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p) : Int) = ((2*positiveTo p : Nat) : Int)-1
      rw [positive_pred_double_agrees]; have := positiveTo_pos p; omega
    | xH => rfl

theorem z_add_agrees (x y : RIntBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.add x y) = binaryIntTo x+binaryIntTo y := by
  cases x with
  | Z0 => change binaryIntTo y = 0+binaryIntTo y; omega
  | Zpos p =>
    cases y with
    | Z0 => change (positiveTo p : Int) = (positiveTo p : Int)+0; omega
    | Zpos q =>
      change (positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.add p q) : Int) = (positiveTo p : Int)+(positiveTo q : Int)
      rw [positive_add_agrees]; omega
    | Zneg q =>
      change binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.pos_sub p q) = (positiveTo p : Int) + -(positiveTo q : Int)
      rw [z_pos_sub_agrees]; omega
  | Zneg p =>
    cases y with
    | Z0 => change -(positiveTo p : Int) = -(positiveTo p : Int)+0; omega
    | Zpos q =>
      change binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.pos_sub q p) = -(positiveTo p : Int)+(positiveTo q : Int)
      rw [z_pos_sub_agrees]; omega
    | Zneg q =>
      change -(positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.add p q) : Int) = -(positiveTo p : Int) + -(positiveTo q : Int)
      rw [positive_add_agrees]; omega
theorem z_opp_agrees (x : RIntBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.opp x) = -binaryIntTo x := by
  cases x <;> simp only [Rocq.Corelib.BinNums.IntDef.Z.opp,binaryIntTo,Int.ofNat_eq_natCast] <;> omega
theorem z_sub_agrees (x y : RIntBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.sub x y) = binaryIntTo x-binaryIntTo y := by
  unfold Rocq.Corelib.BinNums.IntDef.Z.sub
  rw [z_add_agrees,z_opp_agrees]; omega

end NativeBridge.Incremental.BinaryArithmetic

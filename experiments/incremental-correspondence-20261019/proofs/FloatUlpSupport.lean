import Interface_Floats_FloatOps
import Init.Data.BitVec.Lemmas
import Init.Data.Nat.Log2
set_option autoImplicit false
noncomputable section
namespace NativeBridge
abbrev RIntBinary := Rocq.Corelib.Numbers.BinNums.Z
def binaryIntTo : RIntBinary → Int
  | .Z0 => 0
  | .Zpos p => positiveTo p
  | .Zneg p => -(positiveTo p : Int)
end NativeBridge
set_option maxHeartbeats 300000
set_option linter.unusedSimpArgs false
set_option maxRecDepth 4096
noncomputable section
-- Selected existing binary proofs, rechecked in the SpecFloat source dependency closure.
namespace NativeBridge.Incremental.BinaryOrder
open NativeBridge
@[simp] theorem positive_succ_agrees (p : RPositive) : positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.succ p) = positiveTo p + 1 := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec with
  | xI p ih =>
    change 2 * positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.succ p) = 2*positiveTo p+1+1
    rw [ih]; omega
  | xO p ih => rfl
  | xH => rfl
@[simp] theorem positive_pred_double_agrees (p : RPositive) :
  positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p) = 2*positiveTo p-1 := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec with
  | xI p ih => change 2*(2*positiveTo p)+1 = 2*(2*positiveTo p+1)-1; omega
  | xO p ih =>
    change 2*positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p)+1 = 2*(2*positiveTo p)-1
    rw [ih]; have := positiveTo_pos p; omega
  | xH => rfl

def compareCont (r : Ordering) (n m : Nat) : Ordering :=
  if n < m then .lt else if m < n then .gt else r

theorem cc_ii (r : Ordering) (n m : Nat) :
    compareCont r n m = compareCont r (2*n+1) (2*m+1) := by
  unfold compareCont
  repeat' first | split | omega | rfl

theorem cc_oo (r : Ordering) (n m : Nat) :
    compareCont r n m = compareCont r (2*n) (2*m) := by
  unfold compareCont
  repeat' first | split | omega | rfl

theorem cc_oi (r : Ordering) (n m : Nat) :
    compareCont .lt n m = compareCont r (2*n) (2*m+1) := by
  unfold compareCont
  repeat' first | split | omega | rfl

theorem cc_io (r : Ordering) (n m : Nat) :
    compareCont .gt n m = compareCont r (2*n+1) (2*m) := by
  unfold compareCont
  repeat' first | split | omega | rfl

theorem compare_cont_agrees (r : RComparison) (p q : RPositive) :
    comparisonTo (Rocq.Corelib.BinNums.PosDef.Pos.compare_cont r p q) =
      compareCont (comparisonTo r) (positiveTo p) (positiveTo q) := by
  induction q generalizing p r with
  | xI q ih =>
    cases p with
    | xI p =>
      change comparisonTo (Rocq.Corelib.BinNums.PosDef.Pos.compare_cont r p q) =
        compareCont (comparisonTo r) (2*positiveTo p+1) (2*positiveTo q+1)
      rw [ih]; exact cc_ii _ _ _
    | xO p =>
      change comparisonTo (Rocq.Corelib.BinNums.PosDef.Pos.compare_cont .Lt p q) =
        compareCont (comparisonTo r) (2*positiveTo p) (2*positiveTo q+1)
      rw [ih]; exact cc_oi _ _ _
    | xH =>
      change Ordering.lt = compareCont (comparisonTo r) 1 (2*positiveTo q+1)
      have h : 1 < 2*positiveTo q+1 := by have := positiveTo_pos q; omega
      simp [compareCont,h]
  | xO q ih =>
    cases p with
    | xI p =>
      change comparisonTo (Rocq.Corelib.BinNums.PosDef.Pos.compare_cont .Gt p q) =
        compareCont (comparisonTo r) (2*positiveTo p+1) (2*positiveTo q)
      rw [ih]; exact cc_io _ _ _
    | xO p =>
      change comparisonTo (Rocq.Corelib.BinNums.PosDef.Pos.compare_cont r p q) =
        compareCont (comparisonTo r) (2*positiveTo p) (2*positiveTo q)
      rw [ih]; exact cc_oo _ _ _
    | xH =>
      change Ordering.lt = compareCont (comparisonTo r) 1 (2*positiveTo q)
      have h : 1 < 2*positiveTo q := by have := positiveTo_pos q; omega
      simp [compareCont,h]
  | xH =>
    cases p with
    | xI p =>
      change Ordering.gt = compareCont (comparisonTo r) (2*positiveTo p+1) 1
      have h : 1 < 2*positiveTo p+1 := by have := positiveTo_pos p; omega
      simp [compareCont,h,Nat.not_lt_of_ge (Nat.le_of_lt h)]
    | xO p =>
      change Ordering.gt = compareCont (comparisonTo r) (2*positiveTo p) 1
      have h : 1 < 2*positiveTo p := by have := positiveTo_pos p; omega
      simp [compareCont,h,Nat.not_lt_of_ge (Nat.le_of_lt h)]
    | xH =>
      change comparisonTo r = compareCont (comparisonTo r) 1 1
      rfl

theorem positive_compare_agrees (p q : RPositive) :
    comparisonTo (Rocq.Corelib.BinNums.PosDef.Pos.compare p q) = compare (positiveTo p) (positiveTo q) := by
  change comparisonTo (Rocq.Corelib.BinNums.PosDef.Pos.compare_cont .Eq p q) = _
  rw [compare_cont_agrees, Nat.compare_eq_ite_lt]; rfl

theorem compare_leb (c : RComparison) :
    boolTo (Rocq.Corelib.Init.Datatypes.comparison.rec
      Rocq.Corelib.Init.Datatypes.bool.true .true .false c) =
      (comparisonTo c != Ordering.gt) := by cases c <;> rfl
theorem native_leb (n m : Nat) :
    (compare n m != Ordering.gt) = decide (n ≤ m) := by
  rw [Nat.compare_eq_ite_lt]
  split
  · rename_i h
    have hh : n ≤ m := by omega
    simp only [hh,decide_true]; rfl
  · split
    · rename_i h h'
      have hh : ¬ n ≤ m := by omega
      simp only [hh,decide_false]; rfl
    · rename_i h h'
      have hh : n ≤ m := by omega
      simp only [hh,decide_true]; rfl


end NativeBridge.Incremental.BinaryOrder

namespace NativeBridge.Incremental.BinaryInt
open NativeBridge BinaryOrder
theorem compare_ofNat (n m : Nat) :
    compare ((n : Int)) ((m : Int)) = compare n m := by
  rw [Int.compare_eq_ite_lt,Nat.compare_eq_ite_lt]; simp
theorem compare_negNat (n m : Nat) :
    (compare n m).swap = compare (-(n : Int)) (-(m : Int)) := by
  rw [Int.compare_eq_ite_lt,Nat.compare_eq_ite_lt]
  repeat' first | split | omega | rfl

theorem z_compare_agrees (x y : RIntBinary) :
    comparisonTo (Rocq.Corelib.BinNums.IntDef.Z.compare x y) =
      compare (binaryIntTo x) (binaryIntTo y) := by
  cases x with
  | Z0 =>
    cases y with
    | Z0 => rfl
    | Zpos p =>
      change Ordering.lt = compare 0 ((positiveTo p : Int))
      have h : 0 < (positiveTo p : Int) := by have := positiveTo_pos p; omega
      rw [Int.compare_eq_ite_lt, if_pos h]
    | Zneg p =>
      change Ordering.gt = compare 0 (-(positiveTo p : Int))
      have h : -(positiveTo p : Int) < 0 := by have := positiveTo_pos p; omega
      rw [Int.compare_eq_ite_lt, if_neg (by omega), if_pos h]
  | Zpos p =>
    cases y with
    | Z0 =>
      change Ordering.gt = compare ((positiveTo p : Int)) 0
      have h : 0 < (positiveTo p : Int) := by have := positiveTo_pos p; omega
      rw [Int.compare_eq_ite_lt, if_neg (by omega), if_pos h]
    | Zpos q =>
      change comparisonTo (Rocq.Corelib.BinNums.PosDef.Pos.compare p q) =
        compare ((positiveTo p : Int)) ((positiveTo q : Int))
      rw [positive_compare_agrees,compare_ofNat]
    | Zneg q =>
      change Ordering.gt = compare ((positiveTo p : Int)) (-(positiveTo q : Int))
      have h : -(positiveTo q : Int) < (positiveTo p : Int) := by have := positiveTo_pos p; omega
      rw [Int.compare_eq_ite_lt, if_neg (by omega), if_pos h]
  | Zneg p =>
    cases y with
    | Z0 =>
      change Ordering.lt = compare (-(positiveTo p : Int)) 0
      have h : -(positiveTo p : Int) < 0 := by have := positiveTo_pos p; omega
      rw [Int.compare_eq_ite_lt, if_pos h]
    | Zpos q =>
      change Ordering.lt = compare (-(positiveTo p : Int)) ((positiveTo q : Int))
      have h : -(positiveTo p : Int) < (positiveTo q : Int) := by have := positiveTo_pos p; omega
      rw [Int.compare_eq_ite_lt, if_pos h]
    | Zneg q =>
      change comparisonTo (Rocq.Corelib.Init.Datatypes.CompOpp (Rocq.Corelib.BinNums.PosDef.Pos.compare p q)) =
        compare (-(positiveTo p : Int)) (-(positiveTo q : Int))
      rw [compOpp_agrees,positive_compare_agrees,compare_negNat]

theorem z_double_agrees (z : RIntBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.double z) = 2*binaryIntTo z := by
  cases z <;> simp only [Rocq.Corelib.BinNums.IntDef.Z.double,binaryIntTo,positiveTo_xO,Int.ofNat_eq_natCast] <;> omega
theorem z_succ_double_agrees (z : RIntBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.succ_double z) = 2*binaryIntTo z+1 := by
  cases z with
  | Z0 => rfl
  | Zpos p => change (2*positiveTo p+1 : Int) = 2*(positiveTo p : Int)+1; omega
  | Zneg p =>
    change -(positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p) : Int) = 2*(-(positiveTo p : Int))+1
    rw [positive_pred_double_agrees]; have := positiveTo_pos p; omega
theorem z_pred_double_agrees (z : RIntBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.pred_double z) = 2*binaryIntTo z-1 := by
  cases z with
  | Z0 => rfl
  | Zpos p =>
    change (positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p) : Int) = 2*(positiveTo p : Int)-1
    rw [positive_pred_double_agrees]; have := positiveTo_pos p; omega
  | Zneg p => change -(2*positiveTo p+1 : Int) = 2*(-(positiveTo p : Int))-1; omega
theorem compare_ltb (c : RComparison) :
    boolTo (Rocq.Corelib.Init.Datatypes.comparison.rec
      Rocq.Corelib.Init.Datatypes.bool.false .true .false c) =
      decide (comparisonTo c = Ordering.lt) := by cases c <;> rfl
end NativeBridge.Incremental.BinaryInt

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

namespace NativeBridge.Incremental.BinaryPower
open NativeBridge BinaryArithmetic
universe u v
def repeatNative {A : Sort u} (f : A → A) (n : Nat) (x : A) : A :=
  Nat.rec x (fun _ a => f a) n

theorem repeat_zero {A : Sort u} (f : A → A) (x : A) : repeatNative f 0 x = x := rfl
theorem repeat_succ {A : Sort u} (f : A → A) (n : Nat) (x : A) :
    repeatNative f (n+1) x = f (repeatNative f n x) := rfl
theorem repeat_add {A : Sort u} (f : A → A) (m n : Nat) (x : A) :
    repeatNative f (m+n) x = repeatNative f m (repeatNative f n x) := by
  induction m with
  | zero => simp only [Nat.zero_add, repeat_zero]
  | succ m ih => simp only [Nat.succ_add, repeat_succ, ih]

theorem repeat_mul (x : Int) (n : Nat) : repeatNative (x * ·) n 1 = x ^ n := by
  induction n with
  | zero => simp only [repeat_zero, Int.pow_zero]
  | succ n ih => simp only [repeat_succ, ih, Int.pow_succ, Int.mul_comm]

def evenNative (z : Int) : Bool := decide (z % 2 = 0)

end NativeBridge.Incremental.BinaryPower

noncomputable section
namespace NativeBridge.Incremental.SpecFloatRounding
open NativeBridge BinaryInt BinaryArithmetic
theorem max_agrees (x y : RIntBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.max x y) = max (binaryIntTo x) (binaryIntTo y) := by
  have h := z_compare_agrees x y
  unfold Rocq.Corelib.BinNums.IntDef.Z.max
  cases hc : Rocq.Corelib.BinNums.IntDef.Z.compare x y <;>
    simp only [hc, comparisonTo] at h ⊢
  all_goals
    have hh := h.symm
    simp only [Int.compare_eq_eq,Int.compare_eq_lt,Int.compare_eq_gt] at hh
    omega

def minimumExponent (prec emax : Int) : Int := 3-emax-prec
theorem minimumExponent_agrees (prec emax : RIntBinary) :
    binaryIntTo (Rocq.Corelib.Floats.SpecFloat.emin prec emax) = minimumExponent (binaryIntTo prec) (binaryIntTo emax) := by
  unfold Rocq.Corelib.Floats.SpecFloat.emin
  rw [z_sub_agrees,z_sub_agrees]
  rfl
def exponent (prec emax e : Int) : Int := max (e-prec) (minimumExponent prec emax)
theorem exponent_agrees (prec emax e : RIntBinary) :
    binaryIntTo (Rocq.Corelib.Floats.SpecFloat.fexp prec emax e) = exponent (binaryIntTo prec) (binaryIntTo emax) (binaryIntTo e) := by
  unfold Rocq.Corelib.Floats.SpecFloat.fexp
  rw [max_agrees,z_sub_agrees,minimumExponent_agrees]
  rfl
end NativeBridge.Incremental.SpecFloatRounding

namespace NativeBridge.Incremental.SpecFloatArithmetic
open NativeBridge BinaryInt BinaryArithmetic
theorem minimum_agrees (x y : RIntBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.min x y) = min (binaryIntTo x) (binaryIntTo y) := by
  have h := z_compare_agrees x y
  unfold Rocq.Corelib.BinNums.IntDef.Z.min
  cases hc : Rocq.Corelib.BinNums.IntDef.Z.compare x y <;>
    simp only [hc,comparisonTo] at h ⊢
  all_goals
    have hh := h.symm
    simp only [Int.compare_eq_eq,Int.compare_eq_lt,Int.compare_eq_gt] at hh
    omega
end NativeBridge.Incremental.SpecFloatArithmetic

set_option autoImplicit false
noncomputable section
namespace NativeBridge.Incremental.PrimFloatRepresentation

abbrev nativeFloat := Option ((Bool × Fin 2047 × BitVec 52) ⊕ Bool)
abbrev nativeComparison := Option Ordering
def floatTo : Rocq2Lean.PrimFloat.Rep → nativeFloat
  | .finite s e f => some (.inl (s,e,f))
  | .infinity s => some (.inr s)
  | .nan => none
def floatOf : nativeFloat → Rocq2Lean.PrimFloat.Rep
  | some (.inl (s,e,f)) => .finite s e f
  | some (.inr s) => .infinity s
  | none => .nan
def floatIso : Iso Rocq.Corelib.Floats.PrimFloat.float nativeFloat where
  to := floatTo
  of := floatOf
  of_to x := by cases x <;> rfl
  to_of x := by
    cases x with
    | none => rfl
    | some x => cases x with
      | inl x => rcases x with ⟨s,e,f⟩; rfl
      | inr s => rfl
def finite (s : Bool) (e f : Nat) : nativeFloat :=
  some (.inl (s,⟨e%2047,Nat.mod_lt e (by decide)⟩,BitVec.ofNat 52 f))
def signedZero (s : Bool) : nativeFloat := finite s 0 0
def fromBits (b : BitVec 64) : nativeFloat :=
  let s := b.toNat / 2^63 != 0
  let e := b.toNat / 2^52 % 2048
  let f := b.toNat % 2^52
  if e == 2047 then if f == 0 then some (.inr s) else none else finite s e f
def toBits : nativeFloat → BitVec 64
  | some (.inl (s,e,f)) => BitVec.ofNat 64 ((if s then 2^63 else 0)+e.val*2^52+f.toNat)
  | some (.inr s) => BitVec.ofNat 64 ((if s then 2^63 else 0)+2047*2^52)
  | none => BitVec.ofNat 64 (2047*2^52+2^51)
def sign : nativeFloat → Bool
  | some (.inl (s,_,_)) | some (.inr s) => s
  | none => false
def isZero : nativeFloat → Bool
  | some (.inl (_,e,f)) => e.val==0 && f.toNat==0
  | _ => false
def isNaN : nativeFloat → Bool | none => true | _ => false
def negate : nativeFloat → nativeFloat
  | some (.inl (s,e,f)) => some (.inl (!s,e,f))
  | some (.inr s) => some (.inr (!s))
  | none => none
def absolute : nativeFloat → nativeFloat
  | some (.inl (_,e,f)) => some (.inl (false,e,f))
  | some (.inr _) => some (.inr false)
  | none => none
def mantissa : nativeFloat → Nat
  | some (.inl (_,e,f)) => if e.val==0 then f.toNat else 2^52+f.toNat
  | _ => 0
def exponent : nativeFloat → Int
  | some (.inl (_,e,_)) => if e.val==0 then -1074 else (e.val:Int)-1075
  | _ => 0

theorem finite_agrees (s : Bool) (e f : Nat) :
    floatTo (Rocq2Lean.PrimFloat.finite s e f) = finite s e f := rfl
theorem signedZero_agrees (s : Bool) :
    floatTo (Rocq2Lean.PrimFloat.zero s) = signedZero s := rfl
theorem fromBits_agrees (b : BitVec 64) :
    floatTo (Rocq2Lean.PrimFloat.fromBits b) = fromBits b := by
  unfold Rocq2Lean.PrimFloat.fromBits fromBits
  dsimp only
  split <;> first | (split <;> rfl) | rfl
theorem toBits_agrees (x : Rocq.Corelib.Floats.PrimFloat.float) :
    Rocq2Lean.PrimFloat.toBits x = toBits (floatTo x) := by cases x <;> rfl
theorem sign_agrees (x : Rocq.Corelib.Floats.PrimFloat.float) :
    Rocq2Lean.PrimFloat.sign x = sign (floatTo x) := by cases x <;> rfl
theorem isZero_helper (x : Rocq.Corelib.Floats.PrimFloat.float) :
    Rocq2Lean.PrimFloat.isZero x = isZero (floatTo x) := by cases x <;> rfl
theorem isNaN_helper (x : Rocq.Corelib.Floats.PrimFloat.float) :
    Rocq2Lean.PrimFloat.isNaN x = isNaN (floatTo x) := by cases x <;> rfl
theorem negate_agrees (x : Rocq.Corelib.Floats.PrimFloat.float) :
    floatTo (Rocq.Corelib.Floats.PrimFloat.opp x) = negate (floatTo x) := by cases x <;> rfl
theorem absolute_agrees (x : Rocq.Corelib.Floats.PrimFloat.float) :
    floatTo (Rocq.Corelib.Floats.PrimFloat.abs x) = absolute (floatTo x) := by cases x <;> rfl
theorem mantissa_agrees (x : Rocq.Corelib.Floats.PrimFloat.float) :
    Rocq2Lean.PrimFloat.mantissa x = mantissa (floatTo x) := by cases x <;> rfl
theorem exponent_agrees (x : Rocq.Corelib.Floats.PrimFloat.float) :
    Rocq2Lean.PrimFloat.exponent x = exponent (floatTo x) := by cases x <;> rfl

def zero : nativeFloat := signedZero false
def negativeZero : nativeFloat := signedZero true
def infinity : nativeFloat := some (.inr false)
def negativeInfinity : nativeFloat := some (.inr true)
def nan : nativeFloat := none
def one : nativeFloat := finite false 1023 0
def two : nativeFloat := finite false 1024 0
theorem zero_agrees : floatTo Rocq.Corelib.Floats.PrimFloat.zero = zero := rfl
theorem negativeZero_agrees : floatTo Rocq.Corelib.Floats.PrimFloat.neg_zero = negativeZero := rfl
theorem infinity_agrees : floatTo Rocq.Corelib.Floats.PrimFloat.infinity = infinity := rfl
theorem negativeInfinity_agrees : floatTo Rocq.Corelib.Floats.PrimFloat.neg_infinity = negativeInfinity := rfl
theorem nan_agrees : floatTo Rocq.Corelib.Floats.PrimFloat.nan = nan := rfl
theorem one_agrees : floatTo Rocq.Corelib.Floats.PrimFloat.one = one := rfl
def identity (x : nativeFloat) : nativeFloat := x
def ieeeEqual (x y : nativeFloat) : Bool :=
  if isNaN x || isNaN y then false else (isZero x && isZero y) || (toBits x).toNat == (toBits y).toNat
def bitsEqual (x y : nativeFloat) : Bool := (toBits x).toNat == (toBits y).toNat
def less (x y : nativeFloat) : Bool :=
  if isNaN x || isNaN y || ieeeEqual x y then false
  else if sign x != sign y then sign x
  else if sign x then (toBits y).toNat < (toBits x).toNat else (toBits x).toNat < (toBits y).toNat
def lessEqual (x y : nativeFloat) : Bool := ieeeEqual x y || less x y
def comparison (x y : nativeFloat) : nativeComparison :=
  if less x y then some .lt else if less y x then some .gt else if ieeeEqual x y then some .eq else none

theorem boolAdapter (b : Bool) :
    boolTo (Bool.rec Rocq.Corelib.Init.Datatypes.bool.false Rocq.Corelib.Init.Datatypes.bool.true b) = b := by cases b <;> rfl
theorem ieeeEqual_helper (x y : Rocq.Corelib.Floats.PrimFloat.float) :
    Rocq2Lean.PrimFloat.eqb x y = ieeeEqual (floatTo x) (floatTo y) := by
  simp only [Rocq2Lean.PrimFloat.eqb,ieeeEqual,isNaN_helper,isZero_helper,toBits_agrees]
theorem ieeeEqual_agrees (x y : Rocq.Corelib.Floats.PrimFloat.float) :
    boolTo (Rocq.Corelib.Floats.PrimFloat.eqb x y) = ieeeEqual (floatTo x) (floatTo y) := by
  unfold Rocq.Corelib.Floats.PrimFloat.eqb
  rw [boolAdapter,ieeeEqual_helper]
theorem less_helper (x y : Rocq.Corelib.Floats.PrimFloat.float) :
    Rocq2Lean.PrimFloat.ltb x y = less (floatTo x) (floatTo y) := by
  simp only [Rocq2Lean.PrimFloat.ltb,less,isNaN_helper,ieeeEqual_helper,sign_agrees,toBits_agrees]
theorem less_agrees (x y : Rocq.Corelib.Floats.PrimFloat.float) :
    boolTo (Rocq.Corelib.Floats.PrimFloat.ltb x y) = less (floatTo x) (floatTo y) := by
  unfold Rocq.Corelib.Floats.PrimFloat.ltb
  rw [boolAdapter,less_helper]
def zeroTest (x : nativeFloat) : Bool := ieeeEqual x zero
def infinityTest (x : nativeFloat) : Bool := ieeeEqual (absolute x) infinity
def finiteTest (x : nativeFloat) : Bool := !(isNaN x || infinityTest x)
theorem isNaN_agrees (x : Rocq.Corelib.Floats.PrimFloat.float) :
    boolTo (Rocq.Corelib.Floats.PrimFloat.is_nan x) = isNaN (floatTo x) := by
  unfold Rocq.Corelib.Floats.PrimFloat.is_nan
  rw [negb_agrees,ieeeEqual_agrees]
  cases x <;> simp [ieeeEqual,isNaN,floatTo]
theorem zeroTest_agrees (x : Rocq.Corelib.Floats.PrimFloat.float) :
    boolTo (Rocq.Corelib.Floats.PrimFloat.is_zero x) = zeroTest (floatTo x) := by
  unfold Rocq.Corelib.Floats.PrimFloat.is_zero
  rw [ieeeEqual_agrees,zero_agrees]
  rfl
theorem infinityTest_agrees (x : Rocq.Corelib.Floats.PrimFloat.float) :
    boolTo (Rocq.Corelib.Floats.PrimFloat.is_infinity x) = infinityTest (floatTo x) := by
  unfold Rocq.Corelib.Floats.PrimFloat.is_infinity
  rw [ieeeEqual_agrees,absolute_agrees,infinity_agrees]
  rfl
def normalMantissa : nativeFloat → BitVec 63
  | some (.inl (_,e,f)) =>
    BitVec.ofNat 63 (if e.val==1022 then mantissa (some (.inl (false,e,f))) else 0)
  | _ => 0
theorem normalMantissa_agrees (x : Rocq.Corelib.Floats.PrimFloat.float) :
    Rocq.Corelib.Floats.PrimFloat.normfr_mantissa x = normalMantissa (floatTo x) := by cases x <;> rfl
def classification : nativeFloat → Fin 9
  | none => 8
  | some (.inr s) => if s then 7 else 6
  | some (.inl (s,e,f)) =>
    if e.val==0 then
      if f.toNat==0 then (if s then 5 else 4) else (if s then 3 else 2)
    else if s then 1 else 0
end NativeBridge.Incremental.PrimFloatRepresentation
set_option autoImplicit false
set_option maxHeartbeats 100000
noncomputable section
namespace NativeBridge.Incremental.PrimFloatArithmetic
open NativeBridge PrimFloatRepresentation
def signed (s : Bool) (n : Nat) : Int := if s then -(n : Int) else n

/-- floor(log2(n/d)), for positive n,d. -/
def ratioLog2 (n d : Nat) : Int :=
  let k := (Nat.log2 n : Int) - (Nat.log2 d : Int)
  if k < 0 then
    if n * 2^(-k).toNat < d then k - 1 else k
  else if n < d * 2^k.toNat then k - 1 else k

def roundQuotient (n d : Nat) : Nat :=
  let q := n / d
  let r := n % d
  if 2*r > d || (2*r == d && q % 2 == 1) then q + 1 else q

/-- Pack an already rounded integer significand and its binary exponent. -/
def pack (s : Bool) (m : Nat) (q : Int) : nativeFloat :=
  if m == 0 then signedZero s else
  let (m,q) := if m >= 2^53 then (m / 2, q + 1) else (m,q)
  if q > 971 then some (.inr s)
  else if q == -1074 && m < 2^52 then finite s 0 m
  else finite s (q + 1075).toNat (m - 2^52)

/-- Round the exact positive magnitude n/d * 2^e, preserving sign on underflow. -/
def round (s : Bool) (n d : Nat) (e : Int) : nativeFloat :=
  if n == 0 then signedZero s else
  let q := max (-1074) (ratioLog2 n d + e - 52)
  let shift := e - q
  let m := if shift < 0 then roundQuotient n (d * 2^(-shift).toNat)
    else roundQuotient (n * 2^shift.toNat) d
  pack s m q


theorem pack_agrees (s : Bool) (m : Nat) (q : Int) :
    floatTo (Rocq2Lean.PrimFloat.pack s m q) = pack s m q := by
  unfold Rocq2Lean.PrimFloat.pack pack
  dsimp only
  split
  · rfl
  · split <;> dsimp only
    all_goals split
    all_goals first | rfl | (split <;> rfl)

theorem round_agrees (s : Bool) (n d : Nat) (e : Int) :
    floatTo (Rocq2Lean.PrimFloat.round s n d e) = round s n d e := by
  unfold Rocq2Lean.PrimFloat.round round
  dsimp only
  split
  · rfl
  · rw [pack_agrees]
    rfl


theorem floatTo_finite (s : Bool) (e : Fin 2047) (f : BitVec 52) :
    floatTo (.finite s e f) = some (.inl (s,e,f)) := rfl
end NativeBridge.Incremental.PrimFloatArithmetic
set_option autoImplicit false
set_option maxHeartbeats 100000
noncomputable section
namespace NativeBridge.Incremental.PrimFloatExponent
open NativeBridge PrimFloatRepresentation PrimFloatArithmetic

def fromWord (x : BitVec 63) : nativeFloat := round false x.toNat 1 0
theorem fromWord_agrees (x : BitVec 63) :
    floatTo (Rocq.Corelib.Floats.PrimFloat.of_uint63 x) = fromWord x := round_agrees _ _ _ _
def scaleShifted (x : nativeFloat) (e : BitVec 63) : nativeFloat :=
  match x with
  | some (.inl (s,_,_)) => round s (mantissa x) 1 (exponent x + (min e.toNat 4202 : Nat) - 2101)
  | _ => x
theorem scaleShifted_agrees (x : Rocq.Corelib.Floats.PrimFloat.float) (e : BitVec 63) :
    floatTo (Rocq.Corelib.Floats.PrimFloat.ldshiftexp x e) = scaleShifted (floatTo x) e := by
  cases x with
  | nan => rfl
  | infinity s => rfl
  | finite s ex f =>
    change floatTo (Rocq2Lean.PrimFloat.round s _ _ _) = _
    rw [round_agrees]
    rfl

abbrev SourceFraction := Rocq.Corelib.Init.Datatypes.prod Rocq2Lean.PrimFloat.Rep (BitVec 63)
def fractionTo (x : SourceFraction) : nativeFloat × BitVec 63 :=
  match x with | .pair _ _ f e => (floatTo f,e)
theorem fractionTo_if (b : Bool) (x y : SourceFraction) (a c : nativeFloat × BitVec 63)
    (hx : fractionTo x=a) (hy : fractionTo y=c) :
    fractionTo (if b then x else y) = if b then a else c := by cases b <;> assumption
def fractionShifted (x : nativeFloat) : nativeFloat × BitVec 63 :=
  match x with
  | some (.inl (s,_,_)) =>
    if isZero x then (x,0) else
      let e := (Nat.log2 (mantissa x) : Int)+exponent x+1
      (round s (mantissa x) 1 (exponent x-e), BitVec.ofNat 63 (e+2101).toNat)
  | _ => (x,0)
theorem fractionShifted_agrees (x : Rocq.Corelib.Floats.PrimFloat.float) :
    fractionTo (Rocq.Corelib.Floats.PrimFloat.frshiftexp x) = fractionShifted (floatTo x) := by
  cases x with
  | nan => rfl
  | infinity s => rfl
  | finite s ex f =>
    unfold Rocq.Corelib.Floats.PrimFloat.frshiftexp Rocq2Lean.PrimFloat.frshiftexp
    simp only [floatTo_finite,fractionShifted]
    apply fractionTo_if
    · rfl
    · change (floatTo (Rocq2Lean.PrimFloat.round s _ _ _),_) = _
      rw [round_agrees]
      rfl


end NativeBridge.Incremental.PrimFloatExponent
set_option maxHeartbeats 100000
set_option maxRecDepth 4096
noncomputable section
namespace NativeBridge.Incremental.FloatWordSupport
abbrev Word := BitVec 63
def bitCount : Nat := 63
def isZero (x : Word) : Bool := x == 0
def isEven (x : Word) : Bool := !x.getLsbD 0
def RZ := Rocq.Corelib.Numbers.BinNums.Z
def zTo : RZ → Int
  | .Z0 => 0
  | .Zpos p => Int.ofNat (positiveTo p)
  | .Zneg p => -Int.ofNat (positiveTo p)
theorem size_agrees : natTo Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.size = bitCount := rfl
-- Rechecked from Uint63Operations and Uint63Conversions in this source closure.
theorem isZero_agrees (x : Word) :
    boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.is_zero x) = isZero x := by
  change boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.eqb x (0 : Word)) = _
  have h := int63_eqb_agrees x (0 : Word)
  apply h.trans
  unfold isZero
  simp only [Bool.beq_eq_decide_eq, ← BitVec.toNat_inj]

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
@[simp] theorem int63_lsr_agrees (x y : BitVec 63) :
 Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr x y = x >>> y.toNat := by
 change (if y.toNat < 63 then BitVec.ofNat 63 (x.toNat >>> y.toNat) else BitVec.ofNat 63 0) = _
 by_cases h : y.toNat < 63
 · simp only [h, if_true]
   apply BitVec.eq_of_toNat_eq
   simp only [BitVec.toNat_ofNat, BitVec.toNat_ushiftRight]
   exact Nat.mod_eq_of_lt (Nat.lt_of_le_of_lt (Nat.shiftRight_le _ _) x.isLt)
 · simp [h, BitVec.ushiftRight_eq_zero (by omega : 63 ≤ y.toNat)]


theorem isEven_agrees (x : Word) :
    boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.is_even x) = isEven x := by
  change boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.is_zero
    (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.land x (1 : Word))) = _
  have h1 := isZero_agrees (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.land x (1 : Word))
  have h2 := congrArg isZero (int63_land_agrees x (1 : Word))
  apply (h1.trans h2).trans
  unfold isZero isEven
  change ((x &&& 1#63) == 0#63) = !x.getLsbD 0
  have hm := BitVec.and_one_eq_setWidth_ofBool_getLsbD (x := x)
  exact (congrArg (fun a : Word => a == 0#63) hm).trans (by cases x.getLsbD 0 <;> rfl)

theorem positive_pred_double (p : RPositive) :
    positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p) = 2*positiveTo p-1 := by
  induction p with
  | xI p ih => change 2*(2*positiveTo p)+1 = 2*(2*positiveTo p+1)-1; omega
  | xO p ih =>
    change 2*positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p)+1 = 2*(2*positiveTo p)-1
    rw [ih]; have := positiveTo_pos p; omega
  | xH => rfl
theorem zDouble_agrees (z : RZ) :
    zTo (Rocq.Corelib.BinNums.IntDef.Z.double z) = 2*zTo z := by
  cases z <;> simp only [Rocq.Corelib.BinNums.IntDef.Z.double,zTo,positiveTo_xO,Int.ofNat_eq_natCast] <;> omega
theorem zSuccDouble_agrees (z : RZ) :
    zTo (Rocq.Corelib.BinNums.IntDef.Z.succ_double z) = 2*zTo z+1 := by
  cases z with
  | Z0 => rfl
  | Zpos p => change (2*positiveTo p+1 : Int) = 2*(positiveTo p : Int)+1; omega
  | Zneg p =>
    change -(positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p) : Int) = 2*(-(positiveTo p : Int))+1
    rw [positive_pred_double]; have := positiveTo_pos p; omega
theorem boolDouble (b : RBool) (z : RZ) :
    zTo (Rocq.Corelib.Init.Datatypes.bool.rec (motive := fun _ => Rocq.Corelib.Numbers.BinNums.Z → Rocq.Corelib.Numbers.BinNums.Z)
      Rocq.Corelib.BinNums.IntDef.Z.double Rocq.Corelib.BinNums.IntDef.Z.succ_double b z) =
      if boolTo b then 2*zTo z else 2*zTo z+1 := by
  cases b with
  | true => exact zDouble_agrees z
  | false => exact zSuccDouble_agrees z
theorem toZRec_succ (n : MN) (x : Word) :
    zTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z_rec (.S n) x) =
      if isEven x then
        2*zTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z_rec n
          (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr x (1#63)))
      else 2*zTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z_rec n
          (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr x (1#63)))+1 := by
  let z : RZ := Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z_rec n
    (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr x (1#63))
  have h₁ := boolDouble (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.is_even x) z
  have h₂ := congrArg (fun b : Bool => if b then 2*zTo z else 2*zTo z+1) (isEven_agrees x)
  have hs : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z_rec (.S n) x =
      Rocq.Corelib.Init.Datatypes.bool.rec (motive := fun _ => Rocq.Corelib.Numbers.BinNums.Z → Rocq.Corelib.Numbers.BinNums.Z)
        Rocq.Corelib.BinNums.IntDef.Z.double Rocq.Corelib.BinNums.IntDef.Z.succ_double
        (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.is_even x) z := by
        dsimp only [z, RZ, Word, Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z_rec]
  rw [hs]
  simpa only [RZ, z] using h₁.trans h₂

def unsignedFuel (n : Nat) (x : Word) : Int := Int.ofNat (x.toNat % 2^n)
theorem toZRec_agrees (n : MN) (x : Word) :
    zTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z_rec n x) = unsignedFuel (natTo n) x := by
  induction n generalizing x with
  | O =>
    change (0 : Int) = Int.ofNat (x.toNat % 1)
    simp
  | S n ih =>
    rw [toZRec_succ]
    have hs := int63_lsr_agrees x (1 : Word)
    have hsN : (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr x (1#63)).toNat = x.toNat/2 := by
      apply (congrArg BitVec.toNat hs).trans
      simp [Nat.shiftRight_eq_div_pow]
    have hi := ih (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr x (1#63))
    unfold unsignedFuel at hi
    rw [hsN] at hi
    rw [hi]
    have hmod : x.toNat % 2 = if isEven x then 0 else 1 := by
      have hm := Nat.mod_lt x.toNat (by decide : 0 < 2)
      unfold isEven BitVec.getLsbD
      rw [Nat.testBit_zero]
      by_cases h : x.toNat % 2 = 1 <;> simp_all <;> omega
    unfold unsignedFuel
    rw [natTo_succ, Nat.pow_succ', Nat.mod_mul, hmod]
    cases isEven x <;> simp <;> omega
def unsignedInteger (x : Word) : Int := Int.ofNat x.toNat
theorem toZ_agrees (x : Word) :
    zTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x) = unsignedInteger x := by
  have h := toZRec_agrees Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.size x
  change zTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z_rec
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.size x) = _
  simpa [unsignedFuel, unsignedInteger, size_agrees, bitCount, Nat.mod_eq_of_lt x.isLt] using h

@[simp] theorem int63_lor_agrees (x y : BitVec 63) :
 Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lor x y = x ||| y := by
 apply BitVec.eq_of_toNat_eq
 simp only [Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lor, Rocq2Lean.PrimInt63.lor,
  BitVec.toNat_ofNat, word_bitwise_agrees Bool.or rfl, Nat.mod_mod, BitVec.toNat_or]
 exact Nat.mod_eq_of_lt (Nat.or_lt_two_pow x.isLt y.isLt)
@[simp] theorem int63_lsl_agrees (x y : BitVec 63) :
 Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsl x y = x <<< y.toNat := by
 change (if y.toNat < 63 then BitVec.ofNat 63 (x.toNat <<< y.toNat) else BitVec.ofNat 63 0) = _
 by_cases h : y.toNat < 63
 · simp only [h, if_true]
   apply BitVec.eq_of_toNat_eq
   simp
 · simp [h, BitVec.shiftLeft_eq_zero (by omega : 63 ≤ y.toNat)]
def positiveFuel (n p : Nat) : Word := BitVec.ofNat 63 (p % 2^n)
def recWord (n : MN) (p : RPositive) : Word :=
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_pos_rec n p
theorem ofPosRec_zero (p : RPositive) :
    recWord .O p = (0 : Word) := by cases p <;> rfl
theorem ofPosRec_xO (n : MN) (p : RPositive) :
    recWord (.S n) (.xO p) =
      BitVec.shiftLeft (recWord n p) 1 :=
  int63_lsl_agrees _ (1 : Word)
theorem ofPosRec_xI (n : MN) (p : RPositive) :
    recWord (.S n) (.xI p) =
      (BitVec.shiftLeft (recWord n p) 1) ||| (1 : Word) := by
  have h1 := int63_lor_agrees
    (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsl
      (recWord n p) (1#63)) (1 : Word)
  have h2 := congrArg (fun x : Word => BitVec.or x (1#63))
    (int63_lsl_agrees (recWord n p) (1#63))
  exact h1.trans h2
theorem ofPosRec_bits (n : MN) (p : RPositive) (i : Nat) (hi : i < 63) :
    (recWord n p).getLsbD i =
      (decide (i < natTo n) && (positiveTo p).testBit i) := by
  induction p generalizing n i with
  | xH =>
    cases n with
    | O => rw [ofPosRec_zero]; simp [natTo]
    | S n =>
      change (1#63).getLsbD i = (decide (i < natTo n + 1) && (1 : Nat).testBit i)
      cases i with
      | zero => simp
      | succ i => simp [Nat.testBit_succ]
  | xO p ih =>
    cases n with
    | O => rw [ofPosRec_zero]; simp [natTo]
    | S n =>
      have h := congrArg (fun x : Word => x.getLsbD i) (ofPosRec_xO n p)
      apply h.trans
      cases i with
      | zero => simp [natTo_succ, positiveTo_xO]
      | succ i =>
        have hi' : i < 63 := by omega
        have hp : (2*positiveTo p)/2 = positiveTo p := by omega
        simp [hi, natTo_succ, positiveTo_xO, Nat.testBit_succ, hp]
        simpa [BitVec.getLsbD_eq_getElem, hi'] using ih n i hi'
  | xI p ih =>
    cases n with
    | O => rw [ofPosRec_zero]; simp [natTo]
    | S n =>
      have h := congrArg (fun x : Word => x.getLsbD i) (ofPosRec_xI n p)
      apply h.trans
      cases i with
      | zero => simp [natTo_succ, positiveTo_xI]
      | succ i =>
        have hi' : i < 63 := by omega
        have hp : (2*positiveTo p+1)/2 = positiveTo p := by omega
        simp [hi, natTo_succ, positiveTo_xI, Nat.testBit_succ, hp]
        simpa [BitVec.getLsbD_eq_getElem, hi'] using ih n i hi'

theorem ofPosRec_agrees (n : MN) (p : RPositive) :
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_pos_rec n p =
      positiveFuel (natTo n) (positiveTo p) := by
  apply BitVec.eq_of_getLsbD_eq
  intro i hi
  change (recWord n p).getLsbD i = _
  rw [ofPosRec_bits n p i hi]
  change _ = (BitVec.ofNat 63 (positiveTo p % 2^natTo n)).getLsbD i
  simp only [BitVec.getLsbD_ofNat, Nat.testBit_mod_two_pow, hi, decide_true, Bool.true_and]
def ofPositive (p : Nat) : Word := BitVec.ofNat 63 p
theorem ofPos_agrees (p : RPositive) :
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_pos p = ofPositive (positiveTo p) := by
  have h := ofPosRec_agrees Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.size p
  change Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_pos_rec Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.size p = _
  rw [h]
  apply BitVec.eq_of_toNat_eq
  simp [positiveFuel, ofPositive, size_agrees, bitCount]

def ofInteger (z : Int) : Word := BitVec.ofInt 63 z
theorem ofZ_agrees (z : RZ) :
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_Z z = ofInteger (zTo z) := by
  cases z with
  | Z0 => rfl
  | Zpos p =>
    change Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_pos p = _
    simpa [ofInteger, zTo, ofPositive] using ofPos_agrees p
  | Zneg p =>
    have h1 := int63_sub_agrees (0 : Word) (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_pos p)
    have h2 := congrArg (fun a : Word => (0 : Word)-a) (ofPos_agrees p)
    apply (h1.trans h2).trans
    simp [ofInteger, zTo, ofPositive, BitVec.ofInt_neg]
    rfl

end NativeBridge.Incremental.FloatWordSupport
set_option autoImplicit false
set_option maxHeartbeats 100000
set_option maxRecDepth 4096
noncomputable section
namespace NativeBridge.Incremental.FloatOperations
open NativeBridge PrimFloatRepresentation PrimFloatArithmetic PrimFloatExponent
open BinaryInt BinaryArithmetic
def precision : Int := 53
def maximumExponent : Int := 1024
def exponentOffset : Int := 2101
theorem precision_agrees : binaryIntTo Rocq.Corelib.Floats.FloatOps.prec = precision := rfl
theorem maximumExponent_agrees : binaryIntTo Rocq.Corelib.Floats.FloatOps.emax = maximumExponent := rfl
theorem exponentOffset_agrees : binaryIntTo Rocq.Corelib.Floats.FloatOps.shift = exponentOffset := rfl
theorem wordIntView (z : RIntBinary) : FloatWordSupport.zTo z = binaryIntTo z := by cases z <;> rfl
theorem wordToInt_agrees (w : BitVec 63) :
    binaryIntTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z w) = (w.toNat : Int) :=
  (wordIntView _).symm.trans (FloatWordSupport.toZ_agrees w)
theorem wordOfInt_agrees (z : RIntBinary) :
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_Z z = BitVec.ofInt 63 (binaryIntTo z) :=
  by
  have h : FloatWordSupport.zTo z = binaryIntTo z := by cases z <;> rfl
  simpa only [FloatWordSupport.ofInteger,h] using FloatWordSupport.ofZ_agrees z

def scale (x : nativeFloat) (e : Int) : nativeFloat :=
  scaleShifted x (BitVec.ofInt 63 (max (min e 2098) (-2099)+exponentOffset))
theorem scale_agrees (x : Rocq.Corelib.Floats.PrimFloat.float) (e : RIntBinary) :
    floatTo (Rocq.Corelib.Floats.FloatOps.Z.ldexp x e) = scale (floatTo x) (binaryIntTo e) := by
  unfold Rocq.Corelib.Floats.FloatOps.Z.ldexp
  dsimp only
  apply Eq.trans (scaleShifted_agrees x _)
  unfold scale
  apply congrArg (scaleShifted (floatTo x))
  rw [wordOfInt_agrees]
  simp only [z_add_agrees,SpecFloatRounding.max_agrees,SpecFloatArithmetic.minimum_agrees,
    z_sub_agrees,SpecFloatRounding.minimumExponent_agrees,precision_agrees,
    maximumExponent_agrees,exponentOffset_agrees]
  rfl

abbrev SourceFractionZ := Rocq.Corelib.Init.Datatypes.prod Rocq2Lean.PrimFloat.Rep RIntBinary
def fractionTo (x : SourceFractionZ) : nativeFloat × Int :=
  match x with | .pair _ _ f e => (floatTo f,binaryIntTo e)
def fraction (x : nativeFloat) : nativeFloat × Int :=
  let p := fractionShifted x
  (p.1,(p.2.toNat : Int)-exponentOffset)
theorem fraction_agrees (x : Rocq.Corelib.Floats.PrimFloat.float) :
    fractionTo (Rocq.Corelib.Floats.FloatOps.Z.frexp x) = fraction (floatTo x) := by
  have h := fractionShifted_agrees x
  cases he : Rocq.Corelib.Floats.PrimFloat.frshiftexp x with
  | pair f e =>
    rw [he] at h
    change (floatTo f,e) = fractionShifted (floatTo x) at h
    unfold Rocq.Corelib.Floats.FloatOps.Z.frexp
    simp only [he,fractionTo,z_sub_agrees,exponentOffset_agrees]
    rw [fraction,←h,wordToInt_agrees e]

def unitInLastPlace (x : nativeFloat) : nativeFloat :=
  scale one (SpecFloatRounding.exponent precision maximumExponent (fraction x).2)

end NativeBridge.Incremental.FloatOperations

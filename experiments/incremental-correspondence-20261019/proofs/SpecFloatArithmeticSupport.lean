import SpecFloatRepresentation
import Init.Data.Nat.Log2
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
theorem z_ltb_agrees (x y : RIntBinary) :
    boolTo (Rocq.Corelib.BinNums.IntDef.Z.ltb x y) = decide (binaryIntTo x < binaryIntTo y) := by
  unfold Rocq.Corelib.BinNums.IntDef.Z.ltb
  rw [compare_ltb,z_compare_agrees]
  apply Bool.eq_iff_iff.mpr
  simp only [decide_eq_true_eq,Int.compare_eq_lt]
theorem z_leb_agrees (x y : RIntBinary) :
    boolTo (Rocq.Corelib.BinNums.IntDef.Z.leb x y) = decide (binaryIntTo x ≤ binaryIntTo y) := by
  unfold Rocq.Corelib.BinNums.IntDef.Z.leb
  rw [compare_leb,z_compare_agrees]
  apply Bool.eq_iff_iff.mpr
  change (compare (binaryIntTo x) (binaryIntTo y) != Ordering.gt) = true ↔ _
  rw [bne_iff_ne,decide_eq_true_eq]
  change (¬compare (binaryIntTo x) (binaryIntTo y) = Ordering.gt) ↔ _
  rw [Int.compare_eq_gt]; omega


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

theorem positive_iter_transport {A : Sort u} {B : Sort v} (toB : A → B)
    (f : A → A) (g : B → B) (step : ∀ x, toB (f x) = g (toB x))
    (p : RPositive) (x : A) :
    toB (Rocq.Corelib.BinNums.PosDef.Pos.iter A f x p) =
      repeatNative g (positiveTo p) (toB x) := by
  induction p generalizing x with
  | xI p ih =>
    change toB (f (Rocq.Corelib.BinNums.PosDef.Pos.iter A f
      (Rocq.Corelib.BinNums.PosDef.Pos.iter A f x p) p)) =
      repeatNative g (2*positiveTo p+1) (toB x)
    rw [step, ih, ih, repeat_succ]
    rw [show 2*positiveTo p = positiveTo p+positiveTo p by omega, repeat_add]
  | xO p ih =>
    change toB (Rocq.Corelib.BinNums.PosDef.Pos.iter A f
      (Rocq.Corelib.BinNums.PosDef.Pos.iter A f x p) p) =
      repeatNative g (2*positiveTo p) (toB x)
    rw [ih, ih, show 2*positiveTo p = positiveTo p+positiveTo p by omega, repeat_add]
  | xH => exact step x

theorem positive_iter_agrees {A : Sort u} (f : A → A) (x : A) (p : RPositive) :
    Rocq.Corelib.BinNums.PosDef.Pos.iter A f x p = repeatNative f (positiveTo p) x :=
  positive_iter_transport id f f (fun _ => rfl) p x

theorem z_mul_agrees (x y : RIntBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.mul x y) = binaryIntTo x * binaryIntTo y := by
  cases x <;> cases y <;>
    simp [Rocq.Corelib.BinNums.IntDef.Z.mul, binaryIntTo, positive_mul_agrees, Int.neg_mul, Int.mul_neg, Int.neg_neg]

theorem repeat_mul (x : Int) (n : Nat) : repeatNative (x * ·) n 1 = x ^ n := by
  induction n with
  | zero => simp only [repeat_zero, Int.pow_zero]
  | succ n ih => simp only [repeat_succ, ih, Int.pow_succ, Int.mul_comm]

def evenNative (z : Int) : Bool := decide (z % 2 = 0)

theorem z_even_agrees (z : RIntBinary) :
    boolTo (Rocq.Corelib.BinNums.IntDef.Z.even z) = evenNative (binaryIntTo z) := by
  cases z with
  | Z0 => rfl
  | Zpos p =>
    cases p <;> apply Bool.eq_iff_iff.mpr <;>
      simp [evenNative, Rocq.Corelib.BinNums.IntDef.Z.even, boolTo, binaryIntTo,
        positiveTo_xI, positiveTo_xO, positiveTo_xH] <;> omega
  | Zneg p =>
    cases p <;> apply Bool.eq_iff_iff.mpr <;>
      simp [evenNative, Rocq.Corelib.BinNums.IntDef.Z.even, boolTo, binaryIntTo,
        positiveTo_xI, positiveTo_xO, positiveTo_xH] <;> omega


end NativeBridge.Incremental.BinaryPower


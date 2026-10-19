import Interface_Floats_FloatAxioms
import Init.Data.Nat.Sqrt.Lemmas
import Init.Data.BitVec.Lemmas
import Init.Data.Nat.Log2

-- Rechecked in the FloatAxioms closure: SpecFloatRepresentation
noncomputable section
namespace NativeBridge.Incremental.SpecFloatRepresentation
universe u
inductive SpecValue where
  | zero : Bool → SpecValue
  | infinity : Bool → SpecValue
  | nan : SpecValue
  | finite : Bool → {n : Nat // 0 < n} → Int → SpecValue
abbrev nativeSpec : Type := SpecValue
abbrev nativeLocation : Type := Option Ordering
abbrev nativeShift : Type := Int × Bool × Bool

def locationTo : Rocq.Corelib.Floats.SpecFloat.location → nativeLocation
  | .loc_Exact => none
  | .loc_Inexact c => some (comparisonTo c)
def locationOf : nativeLocation → Rocq.Corelib.Floats.SpecFloat.location
  | none => .loc_Exact
  | some c => .loc_Inexact (comparisonOf c)
def locationIso : Iso Rocq.Corelib.Floats.SpecFloat.location nativeLocation where
  to := locationTo
  of := locationOf
  of_to x := by cases x <;> simp [locationTo,locationOf]
  to_of x := by cases x <;> simp [locationTo,locationOf] <;> rfl
def shiftTo : Rocq.Corelib.Floats.SpecFloat.shr_record → nativeShift
  | .Build_shr_record m r s => (binaryIntTo m,boolTo r,boolTo s)
def shiftOf : nativeShift → Rocq.Corelib.Floats.SpecFloat.shr_record
  | (m,r,s) => .Build_shr_record (binaryIntOf m) (boolOf r) (boolOf s)
def shiftIso : Iso Rocq.Corelib.Floats.SpecFloat.shr_record nativeShift where
  to := shiftTo
  of := shiftOf
  of_to x := by cases x <;> simp [shiftTo,shiftOf]
  to_of x := by rcases x with ⟨m,r,s⟩; simp [shiftTo,shiftOf]
def specTo : Rocq.Corelib.Floats.SpecFloat.spec_float → nativeSpec
  | .S754_zero s => .zero (boolTo s)
  | .S754_infinity s => .infinity (boolTo s)
  | .S754_nan => .nan
  | .S754_finite s m e => .finite (boolTo s) (positiveIso.to m) (binaryIntTo e)
def specOf : nativeSpec → Rocq.Corelib.Floats.SpecFloat.spec_float
  | .zero s => .S754_zero (boolOf s)
  | .infinity s => .S754_infinity (boolOf s)
  | .nan => .S754_nan
  | .finite s m e => .S754_finite (boolOf s) (positiveIso.of m) (binaryIntOf e)
def specIso : Iso Rocq.Corelib.Floats.SpecFloat.spec_float nativeSpec where
  to := specTo
  of := specOf
  of_to x := by cases x <;> simp [specTo,specOf,positiveIso.of_to]
  to_of x := by cases x <;> simp [specTo,specOf,positiveIso.to_of] <;> rfl

def absolute : nativeSpec → nativeSpec
  | .zero _ => .zero false
  | .infinity _ => .infinity false
  | .nan => .nan
  | .finite _ m e => .finite false m e
def negate : nativeSpec → nativeSpec
  | .zero s => .zero (!s)
  | .infinity s => .infinity (!s)
  | .nan => .nan
  | .finite s m e => .finite (!s) m e
theorem absolute_agrees (x : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    specTo (Rocq.Corelib.Floats.SpecFloat.SFabs x) = absolute (specTo x) := by cases x <;> rfl
theorem negate_agrees (x : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    specTo (Rocq.Corelib.Floats.SpecFloat.SFopp x) = negate (specTo x) := by
  cases x <;> simp [Rocq.Corelib.Floats.SpecFloat.SFopp,specTo,negate,negb_agrees] <;> rfl
def mantissa (s : nativeShift) : Int := s.1
def roundBit (s : nativeShift) : Bool := s.2.1
def stickyBit (s : nativeShift) : Bool := s.2.2
theorem mantissa_agrees (s : Rocq.Corelib.Floats.SpecFloat.shr_record) :
    binaryIntTo (Rocq.Corelib.Floats.SpecFloat.shr_m s) = mantissa (shiftTo s) := by cases s; rfl
def fromShift (s : nativeShift) : nativeLocation :=
  if s.2.1 then some (if s.2.2 then .gt else .eq) else if s.2.2 then some .lt else none
def toShift (m : Int) : nativeLocation → nativeShift
  | none => (m,false,false)
  | some .eq => (m,true,false)
  | some .lt => (m,false,true)
  | some .gt => (m,true,true)
theorem fromShift_agrees (s : Rocq.Corelib.Floats.SpecFloat.shr_record) :
    locationTo (Rocq.Corelib.Floats.SpecFloat.loc_of_shr_record s) = fromShift (shiftTo s) := by
  cases s with
  | Build_shr_record m r s => cases r <;> cases s <;> rfl
theorem toShift_agrees (m : RIntBinary) (l : Rocq.Corelib.Floats.SpecFloat.location) :
    shiftTo (Rocq.Corelib.Floats.SpecFloat.shr_record_of_loc m l) = toShift (binaryIntTo m) (locationTo l) := by
  cases l with
  | loc_Exact => rfl
  | loc_Inexact c => cases c <;> rfl

def locationElim (P : Option Ordering → Sort u) (z : P none) (s : ∀ c, P (some c)) :
    ∀ l, P l
  | none => z
  | some c => s c
def locationInd : Prop := ∀ P : Option Ordering → Prop, P none → (∀ c, P (some c)) → ∀ l, P l
theorem locationInd_native : locationInd := fun P z s l => locationElim P z s l
end NativeBridge.Incremental.SpecFloatRepresentation

-- Rechecked in the FloatAxioms closure: SpecFloatArithmeticSupport
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


-- Rechecked in the FloatAxioms closure: SpecFloatRounding
noncomputable section
namespace NativeBridge.Incremental.SpecFloatRounding
open NativeBridge.Incremental.SpecFloatRepresentation
open NativeBridge.Incremental.BinaryOrder NativeBridge.Incremental.BinaryInt
open NativeBridge.Incremental.BinaryArithmetic NativeBridge.Incremental.BinaryPower

theorem choose_map {A B : Sort _} (f : A → B) (a b : A) (c : RBool) :
    f (Rocq.Corelib.Init.Datatypes.bool.rec a b c) = if boolTo c then f a else f b := by
  cases c <;> rfl
theorem positive_eqb_agrees (p q : RPositive) :
    boolTo (Rocq.Corelib.BinNums.PosDef.Pos.eqb p q) = (positiveTo p == positiveTo q) := by
  induction q generalizing p with
  | xI q ih =>
    cases p with
    | xI p =>
      change boolTo (Rocq.Corelib.BinNums.PosDef.Pos.eqb p q) = (2*positiveTo p+1 == 2*positiveTo q+1)
      rw [ih]; apply Bool.eq_iff_iff.mpr; simp only [beq_iff_eq]; omega
    | xO p =>
      change false = (2*positiveTo p == 2*positiveTo q+1)
      apply Bool.eq_iff_iff.mpr; simp <;> omega
    | xH =>
      have := positiveTo_pos q
      change false = (1 == 2*positiveTo q+1)
      apply Bool.eq_iff_iff.mpr; simp <;> omega
  | xO q ih =>
    cases p with
    | xI p =>
      change false = (2*positiveTo p+1 == 2*positiveTo q)
      apply Bool.eq_iff_iff.mpr; simp <;> omega
    | xO p =>
      change boolTo (Rocq.Corelib.BinNums.PosDef.Pos.eqb p q) = (2*positiveTo p == 2*positiveTo q)
      rw [ih]; apply Bool.eq_iff_iff.mpr; simp only [beq_iff_eq]; omega
    | xH =>
      have := positiveTo_pos q
      change false = (1 == 2*positiveTo q)
      apply Bool.eq_iff_iff.mpr; simp <;> omega
  | xH =>
    cases p with
    | xI p =>
      have := positiveTo_pos p
      change false = (2*positiveTo p+1 == 1)
      apply Bool.eq_iff_iff.mpr; simp <;> omega
    | xO p =>
      have := positiveTo_pos p
      change false = (2*positiveTo p == 1)
      apply Bool.eq_iff_iff.mpr; simp <;> omega
    | xH => rfl

theorem z_eqb_agrees (x y : RIntBinary) :
    boolTo (Rocq.Corelib.BinNums.IntDef.Z.eqb x y) = (binaryIntTo x == binaryIntTo y) := by
  cases x with
  | Z0 =>
    cases y with
    | Z0 => rfl
    | Zpos p =>
      change false = ((0:Int) == (positiveTo p : Int))
      have := positiveTo_pos p
      apply Bool.eq_iff_iff.mpr; simp <;> omega
    | Zneg p =>
      change false = ((0:Int) == -(positiveTo p : Int))
      have := positiveTo_pos p
      apply Bool.eq_iff_iff.mpr; simp <;> omega
  | Zpos p =>
    cases y with
    | Z0 =>
      change false = ((positiveTo p : Int) == 0)
      have := positiveTo_pos p
      apply Bool.eq_iff_iff.mpr; simp <;> omega
    | Zpos q =>
      change boolTo (Rocq.Corelib.BinNums.PosDef.Pos.eqb p q) = ((positiveTo p : Int) == (positiveTo q : Int))
      rw [positive_eqb_agrees]
      apply Bool.eq_iff_iff.mpr; simp only [beq_iff_eq]; omega
    | Zneg q =>
      change false = ((positiveTo p : Int) == -(positiveTo q : Int))
      have := positiveTo_pos p
      apply Bool.eq_iff_iff.mpr; simp <;> omega
  | Zneg p =>
    cases y with
    | Z0 =>
      change false = (-(positiveTo p : Int) == 0)
      have := positiveTo_pos p
      apply Bool.eq_iff_iff.mpr; simp <;> omega
    | Zpos q =>
      change false = (-(positiveTo p : Int) == (positiveTo q : Int))
      have := positiveTo_pos p
      apply Bool.eq_iff_iff.mpr; simp <;> omega
    | Zneg q =>
      change boolTo (Rocq.Corelib.BinNums.PosDef.Pos.eqb p q) = (-(positiveTo p : Int) == -(positiveTo q : Int))
      rw [positive_eqb_agrees]
      apply Bool.eq_iff_iff.mpr; simp only [beq_iff_eq]; omega

theorem eqb_agrees (x y : RIntBinary) :
    boolTo (Rocq.Corelib.BinNums.IntDef.Z.eqb x y) = decide (binaryIntTo x = binaryIntTo y) := by
  rw [z_eqb_agrees]
  exact Bool.beq_eq_decide_eq _ _
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

def conditionalNegate (b : Bool) (z : Int) : Int := if b then -z else z
theorem conditionalNegate_agrees (b : RBool) (z : RIntBinary) :
    binaryIntTo (Rocq.Corelib.Floats.SpecFloat.cond_Zopp b z) = conditionalNegate (boolTo b) (binaryIntTo z) := by
  cases b <;> simp [Rocq.Corelib.Floats.SpecFloat.cond_Zopp,conditionalNegate,boolTo,z_opp_agrees]

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
theorem log2_bit (n c : Nat) (hn : 0 < n) (hc : c ≤ 1) :
    Nat.log2 (2*n+c) = Nat.log2 n + 1 := by
  rw [Nat.log2_def (2*n+c), if_pos (by omega)]
  have hd : (2*n+c)/2=n := by omega
  rw [hd]
def positiveDigits (n : Nat) : Nat := Nat.log2 n+1
theorem positiveDigits_agrees (p : RPositive) :
    positiveTo (Rocq.Corelib.Floats.SpecFloat.digits2_pos p) = positiveDigits (positiveTo p) := by
  induction p with
  | xH => rfl
  | xI p ih =>
    change positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.succ (Rocq.Corelib.Floats.SpecFloat.digits2_pos p)) = _
    rw [BinaryOrder.positive_succ_agrees,ih]
    simp only [positiveDigits,positiveTo_xI,log2_bit _ 1 (positiveTo_pos p) (by omega)]
  | xO p ih =>
    change positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.succ (Rocq.Corelib.Floats.SpecFloat.digits2_pos p)) = _
    rw [BinaryOrder.positive_succ_agrees,ih]
    have hl := log2_bit (positiveTo p) 0 (positiveTo_pos p) (by omega)
    simp only [Nat.add_zero] at hl
    simp only [positiveDigits,positiveTo_xO,hl]
def integerDigits (z : Int) : Int := if z=0 then 0 else Int.ofNat (Nat.log2 z.natAbs+1)
theorem integerDigits_agrees (z : RIntBinary) :
    binaryIntTo (Rocq.Corelib.Floats.SpecFloat.Zdigits2 z) = integerDigits (binaryIntTo z) := by
  cases z with
  | Z0 => rfl
  | Zpos p =>
    change (positiveTo (Rocq.Corelib.Floats.SpecFloat.digits2_pos p) : Int) = _
    rw [positiveDigits_agrees]
    have hp := positiveTo_pos p
    simp [integerDigits,binaryIntTo,positiveDigits,Nat.ne_of_gt hp]
  | Zneg p =>
    change (positiveTo (Rocq.Corelib.Floats.SpecFloat.digits2_pos p) : Int) = _
    rw [positiveDigits_agrees]
    have hp := positiveTo_pos p
    simp [integerDigits,binaryIntTo,positiveDigits,Nat.ne_of_gt hp]

def canonical (prec emax : Int) (m : Nat) (e : Int) : Bool :=
  decide (exponent prec emax ((positiveDigits m : Int)+e) = e)
theorem canonical_agrees (prec emax : RIntBinary) (m : RPositive) (e : RIntBinary) :
    boolTo (Rocq.Corelib.Floats.SpecFloat.canonical_mantissa prec emax m e) =
      canonical (binaryIntTo prec) (binaryIntTo emax) (positiveTo m) (binaryIntTo e) := by
  unfold Rocq.Corelib.Floats.SpecFloat.canonical_mantissa
  rw [eqb_agrees,exponent_agrees,z_add_agrees]
  change decide (exponent _ _ ((positiveTo (Rocq.Corelib.Floats.SpecFloat.digits2_pos m) : Int)+_) = _) = _
  rw [positiveDigits_agrees]
  rfl
def bounded (prec emax : Int) (m : Nat) (e : Int) : Bool :=
  canonical prec emax m e && decide (e ≤ emax-prec)
theorem bounded_agrees (prec emax : RIntBinary) (m : RPositive) (e : RIntBinary) :
    boolTo (Rocq.Corelib.Floats.SpecFloat.bounded prec emax m e) =
      bounded (binaryIntTo prec) (binaryIntTo emax) (positiveTo m) (binaryIntTo e) := by
  unfold Rocq.Corelib.Floats.SpecFloat.bounded
  rw [andb_agrees,canonical_agrees,z_leb_agrees,z_sub_agrees]
  rfl
def valid (prec emax : Int) : nativeSpec → Bool
  | .finite _ m e => bounded prec emax m.val e
  | _ => true
theorem valid_agrees (prec emax : RIntBinary) (x : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    boolTo (Rocq.Corelib.Floats.SpecFloat.valid_binary prec emax x) =
      valid (binaryIntTo prec) (binaryIntTo emax) (specTo x) := by
  cases x with
  | S754_zero s => rfl
  | S754_infinity s => rfl
  | S754_nan => rfl
  | S754_finite s m e => exact bounded_agrees prec emax m e

def nearestEven (m : Int) : Option Ordering → Int
  | none => m
  | some .lt => m
  | some .gt => m+1
  | some .eq => if m%2=0 then m else m+1
theorem nearestEven_agrees (m : RIntBinary) (l : Rocq.Corelib.Floats.SpecFloat.location) :
    binaryIntTo (Rocq.Corelib.Floats.SpecFloat.round_nearest_even m l) =
      nearestEven (binaryIntTo m) (locationTo l) := by
  cases l with
  | loc_Exact => rfl
  | loc_Inexact c =>
    cases c with
    | Lt => rfl
    | Gt => exact z_add_agrees m (.Zpos .xH)
    | Eq =>
      change binaryIntTo (Rocq.Corelib.Init.Datatypes.bool.rec m
        (Rocq.Corelib.BinNums.IntDef.Z.add m (.Zpos .xH))
        (Rocq.Corelib.BinNums.IntDef.Z.even m)) = _
      rw [choose_map binaryIntTo, z_even_agrees, z_add_agrees]
      simp only [nearestEven,locationTo,comparisonTo,evenNative,decide_eq_true_eq]
      rfl
def evenLocation (steps k : Int) : Option Ordering :=
  if k=0 then none else some (compare (2*k) steps)
def oddCompareResult : Ordering → Option Ordering
  | .gt => some .gt
  | _ => some .lt
def oddLocation (steps k : Int) : Option Ordering :=
  if k=0 then none else oddCompareResult (compare (2*k+1) steps)
def newLocation (steps k : Int) : Option Ordering :=
  if steps%2=0 then evenLocation steps k else oddLocation steps k
theorem evenLocation_agrees (steps k : RIntBinary) :
    locationTo (Rocq.Corelib.Floats.SpecFloat.new_location_even steps k) =
      evenLocation (binaryIntTo steps) (binaryIntTo k) := by
  unfold Rocq.Corelib.Floats.SpecFloat.new_location_even
  rw [choose_map locationTo,eqb_agrees]
  simp only [locationTo,z_compare_agrees,z_mul_agrees]
  change (if decide (binaryIntTo k = 0) then none else some (compare (2*binaryIntTo k) (binaryIntTo steps))) = _
  simp only [decide_eq_true_eq,evenLocation]
theorem oddCompare_map (c : RComparison) :
    locationTo (.loc_Inexact (Rocq.Corelib.Init.Datatypes.comparison.rec
      Rocq.Corelib.Init.Datatypes.comparison.Lt .Lt .Gt c)) =
    oddCompareResult (comparisonTo c) := by cases c <;> rfl
theorem oddLocation_agrees (steps k : RIntBinary) :
    locationTo (Rocq.Corelib.Floats.SpecFloat.new_location_odd steps k) =
      oddLocation (binaryIntTo steps) (binaryIntTo k) := by
  unfold Rocq.Corelib.Floats.SpecFloat.new_location_odd
  rw [choose_map locationTo,eqb_agrees]
  rw [oddCompare_map,z_compare_agrees,z_add_agrees,z_mul_agrees]
  change (if decide (binaryIntTo k = 0) then none else oddCompareResult
    (compare (2*binaryIntTo k+1) (binaryIntTo steps))) = _
  simp only [decide_eq_true_eq,oddLocation]
theorem newLocation_agrees (steps k : RIntBinary) :
    locationTo (Rocq.Corelib.Floats.SpecFloat.new_location steps k) =
      newLocation (binaryIntTo steps) (binaryIntTo k) := by
  unfold Rocq.Corelib.Floats.SpecFloat.new_location
  rw [choose_map (fun f : RIntBinary → Rocq.Corelib.Floats.SpecFloat.location => locationTo (f k))]
  rw [z_even_agrees,evenLocation_agrees,oddLocation_agrees]
  simp only [evenNative,decide_eq_true_eq,newLocation]

end NativeBridge.Incremental.SpecFloatRounding

-- Rechecked in the FloatAxioms closure: SpecFloatShift
noncomputable section
namespace NativeBridge.Incremental.SpecFloatShift
open NativeBridge.Incremental.SpecFloatRepresentation NativeBridge.Incremental.SpecFloatRounding
open NativeBridge.Incremental.BinaryArithmetic NativeBridge.Incremental.BinaryPower
universe u v

def iterate {A : Sort u} (f : A → A) (n : Nat) (x : A) : A := repeatNative f n x
theorem repeat_commute {A : Sort u} (f : A → A) (n : Nat) (x : A) :
    repeatNative f n (f x) = f (repeatNative f n x) := by
  induction n with
  | zero => rfl
  | succ n ih => exact congrArg f ih
theorem iterTransport {A : Sort u} {B : Sort v} (g : A → B) (f : A → A) (f' : B → B)
    (h : ∀ x, g (f x) = f' (g x)) (p : RPositive) (x : A) :
    g (Rocq.Corelib.Floats.SpecFloat.iter_pos A f p x) = iterate f' (positiveTo p) (g x) := by
  induction p generalizing x with
  | xH => exact h x
  | xO p ih =>
    change g (Rocq.Corelib.Floats.SpecFloat.iter_pos A f p
      (Rocq.Corelib.Floats.SpecFloat.iter_pos A f p x)) = _
    rw [ih,ih]
    change repeatNative f' (positiveTo p) (repeatNative f' (positiveTo p) (g x)) =
      repeatNative f' (2*positiveTo p) (g x)
    rw [show 2*positiveTo p = positiveTo p+positiveTo p by omega,repeat_add]
  | xI p ih =>
    change g (Rocq.Corelib.Floats.SpecFloat.iter_pos A f p
      (Rocq.Corelib.Floats.SpecFloat.iter_pos A f p (f x))) = _
    rw [ih,ih,h]
    change repeatNative f' (positiveTo p) (repeatNative f' (positiveTo p) (f' (g x))) =
      repeatNative f' (2*positiveTo p+1) (g x)
    rw [repeat_commute,repeat_commute,repeat_succ,
      show 2*positiveTo p = positiveTo p+positiveTo p by omega,repeat_add]
theorem iterate_agrees {A : Sort u} (f : A → A) (p : RPositive) (x : A) :
    Rocq.Corelib.Floats.SpecFloat.iter_pos A f p x = iterate f (positiveTo p) x :=
  iterTransport id f f (fun _ => rfl) p x

def shiftOne (s : nativeShift) : nativeShift :=
  (s.1.tdiv 2, decide (s.1.natAbs%2=1), s.2.1 || s.2.2)
theorem natAbsPositive (n : Nat) : (Int.ofNat n).natAbs = n := rfl
theorem half_positive (n : Nat) (c : Nat) (hc : c < 2) :
    (Int.ofNat (2*n+c)).tdiv 2 = Int.ofNat n := by
  change Int.ofNat ((2*n+c)/2) = Int.ofNat n
  congr 1
  omega
theorem shiftOne_agrees (s : Rocq.Corelib.Floats.SpecFloat.shr_record) :
    shiftTo (Rocq.Corelib.Floats.SpecFloat.shr_1 s) = shiftOne (shiftTo s) := by
  cases s with
  | Build_shr_record m r s =>
    cases m with
    | Z0 =>
      cases r <;> cases s <;> rfl
    | Zpos p =>
      cases p with
      | xH => cases r <;> cases s <;> rfl
      | xI p =>
        change (Int.ofNat (positiveTo p),true,boolTo (Rocq.Corelib.Init.Datatypes.orb r s)) =
          ((Int.ofNat (2*positiveTo p+1)).tdiv 2,decide ((2*positiveTo p+1)%2=1),boolTo r || boolTo s)
        rw [half_positive _ 1 (by decide),orb_agrees]
        simp
      | xO p =>
        change (Int.ofNat (positiveTo p),false,boolTo (Rocq.Corelib.Init.Datatypes.orb r s)) =
          ((Int.ofNat (2*positiveTo p)).tdiv 2,decide ((2*positiveTo p)%2=1),boolTo r || boolTo s)
        have hh := half_positive (positiveTo p) 0 (by decide)
        simp only [Nat.add_zero] at hh
        rw [hh,orb_agrees]
        simp
    | Zneg p =>
      cases p with
      | xH => cases r <;> cases s <;> rfl
      | xI p =>
        change (-Int.ofNat (positiveTo p),true,boolTo (Rocq.Corelib.Init.Datatypes.orb r s)) =
          ((-Int.ofNat (2*positiveTo p+1)).tdiv 2,decide ((-Int.ofNat (2*positiveTo p+1)).natAbs%2=1),boolTo r || boolTo s)
        rw [Int.neg_tdiv,half_positive _ 1 (by decide),orb_agrees]
        simp only [Int.natAbs_neg,natAbsPositive]
        simp
      | xO p =>
        change (-Int.ofNat (positiveTo p),false,boolTo (Rocq.Corelib.Init.Datatypes.orb r s)) =
          ((-Int.ofNat (2*positiveTo p)).tdiv 2,decide ((-Int.ofNat (2*positiveTo p)).natAbs%2=1),boolTo r || boolTo s)
        have hh := half_positive (positiveTo p) 0 (by decide)
        simp only [Nat.add_zero] at hh
        rw [Int.neg_tdiv,hh,orb_agrees]
        simp only [Int.natAbs_neg,natAbsPositive]
        simp

def shiftMany (s : nativeShift) (e n : Int) : nativeShift × Int :=
  if n>0 then (iterate shiftOne n.toNat s,e+n) else (s,e)
def shiftPairTo (p : Rocq.Corelib.Init.Datatypes.prod Rocq.Corelib.Floats.SpecFloat.shr_record RIntBinary) :
    nativeShift × Int :=
  let q := prodTo p
  (shiftTo q.1,binaryIntTo q.2)
theorem shiftMany_agrees (s : Rocq.Corelib.Floats.SpecFloat.shr_record) (e n : RIntBinary) :
    shiftPairTo (Rocq.Corelib.Floats.SpecFloat.shr s e n) =
      shiftMany (shiftTo s) (binaryIntTo e) (binaryIntTo n) := by
  cases n with
  | Z0 => simp [Rocq.Corelib.Floats.SpecFloat.shr,shiftMany,shiftPairTo,prodTo,binaryIntTo]
  | Zneg p =>
    have hp := positiveTo_pos p
    simp [Rocq.Corelib.Floats.SpecFloat.shr,shiftMany,shiftPairTo,prodTo,binaryIntTo]
    omega
  | Zpos p =>
    have hp := positiveTo_pos p
    change (shiftTo (Rocq.Corelib.Floats.SpecFloat.iter_pos _ Rocq.Corelib.Floats.SpecFloat.shr_1 p s),
      binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.add e (.Zpos p))) = _
    rw [iterTransport shiftTo _ shiftOne shiftOne_agrees,z_add_agrees]
    simp [shiftMany,binaryIntTo,Nat.ne_of_gt hp]

def shiftToExponent (prec emax m e : Int) (l : Option Ordering) : nativeShift × Int :=
  shiftMany (toShift m l) e (exponent prec emax (integerDigits m+e)-e)
theorem shiftToExponent_agrees (prec emax m e : RIntBinary) (l : Rocq.Corelib.Floats.SpecFloat.location) :
    shiftPairTo (Rocq.Corelib.Floats.SpecFloat.shr_fexp prec emax m e l) =
      shiftToExponent (binaryIntTo prec) (binaryIntTo emax) (binaryIntTo m) (binaryIntTo e) (locationTo l) := by
  unfold Rocq.Corelib.Floats.SpecFloat.shr_fexp
  rw [shiftMany_agrees,toShift_agrees,z_sub_agrees,exponent_agrees,z_add_agrees,integerDigits_agrees]
  rfl
def alignment (m : Nat) (e target : Int) : Nat × Int :=
  if target < e then (2^(e-target).toNat*m,target) else (m,e)
def alignmentTo (p : Rocq.Corelib.Init.Datatypes.prod RPositive RIntBinary) : Nat × Int :=
  let q := prodTo p
  (positiveTo q.1,binaryIntTo q.2)
theorem repeatDouble (n m : Nat) : repeatNative (fun x => 2*x) n m = 2^n*m := by
  induction n with
  | zero => simp [repeat_zero]
  | succ n ih =>
    rw [repeat_succ,ih,Nat.pow_succ]
    simp only [Nat.mul_comm,Nat.mul_left_comm]
theorem alignment_agrees (m : RPositive) (e target : RIntBinary) :
    alignmentTo (Rocq.Corelib.Floats.SpecFloat.shl_align m e target) =
      alignment (positiveTo m) (binaryIntTo e) (binaryIntTo target) := by
  have hd := z_sub_agrees target e
  unfold Rocq.Corelib.Floats.SpecFloat.shl_align
  generalize heq : Rocq.Corelib.BinNums.IntDef.Z.sub target e = delta at *
  cases delta with
  | Z0 =>
    change (0 : Int) = binaryIntTo target-binaryIntTo e at hd
    have hn : ¬binaryIntTo target < binaryIntTo e := by omega
    simp [alignmentTo,prodTo,alignment,hn]
  | Zpos p =>
    change (positiveTo p : Int) = binaryIntTo target-binaryIntTo e at hd
    have hn : ¬binaryIntTo target < binaryIntTo e := by omega
    simp [alignmentTo,prodTo,alignment,hn]
  | Zneg p =>
    change -(positiveTo p : Int) = binaryIntTo target-binaryIntTo e at hd
    have hp := positiveTo_pos p
    have hn : binaryIntTo target < binaryIntTo e := by omega
    have hnN : (binaryIntTo e-binaryIntTo target).toNat = positiveTo p := by omega
    change (positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.iter RPositive
      Rocq.Corelib.Numbers.BinNums.positive.xO m p),binaryIntTo target) = _
    rw [positive_iter_transport positiveTo _ (fun x => 2*x) positiveTo_xO,repeatDouble]
    simp [alignment,hn,hnN]

end NativeBridge.Incremental.SpecFloatShift

-- Rechecked in the FloatAxioms closure: SpecFloatNormalize
noncomputable section
namespace NativeBridge.Incremental.SpecFloatNormalize
open NativeBridge.Incremental.SpecFloatRepresentation NativeBridge.Incremental.SpecFloatRounding
open NativeBridge.Incremental.SpecFloatShift
open NativeBridge.Incremental.BinaryInt NativeBridge.Incremental.BinaryArithmetic

def finish (sign : Bool) (m e bound : Int) : nativeSpec :=
  if m=0 then .zero sign
  else if h : 0<m then
    if e≤bound then .finite sign ⟨m.toNat, by omega⟩ e else .infinity sign
  else .nan
def sourceFinish (sign : RBool) (m e bound : RIntBinary) : Rocq.Corelib.Floats.SpecFloat.spec_float :=
  Rocq.Corelib.Numbers.BinNums.Z.rec (.S754_zero sign)
    (fun p => Rocq.Corelib.Init.Datatypes.bool.rec (.S754_finite sign p e) (.S754_infinity sign)
      (Rocq.Corelib.BinNums.IntDef.Z.leb e bound))
    (fun _ => .S754_nan) m
theorem finish_agrees (sign : RBool) (m e bound : RIntBinary) :
    specTo (sourceFinish sign m e bound) = finish (boolTo sign) (binaryIntTo m) (binaryIntTo e) (binaryIntTo bound) := by
  change @Eq SpecValue _ _
  cases m with
  | Z0 => simp [sourceFinish,specTo,finish,binaryIntTo] <;> rfl
  | Zneg p =>
    have hp := positiveTo_pos p
    simp [sourceFinish,specTo,finish,binaryIntTo,Nat.ne_of_gt hp]
    omega
  | Zpos p =>
    have hp := positiveTo_pos p
    change specTo (Rocq.Corelib.Init.Datatypes.bool.rec
      (.S754_finite sign p e) (.S754_infinity sign)
      (Rocq.Corelib.BinNums.IntDef.Z.leb e bound)) = _
    rw [choose_map specTo,z_leb_agrees]
    simp only [decide_eq_true_eq,specTo]
    unfold finish
    have hn : binaryIntTo (.Zpos p) ≠ 0 := by change (positiveTo p : Int) ≠ 0; omega
    have hpI : 0 < binaryIntTo (.Zpos p) := by change (0 : Int) < positiveTo p; omega
    simp only [if_neg hn,dif_pos hpI]
    rfl

def roundAux (prec emax : Int) (sign : Bool) (m e : Int) (l : Option Ordering) : nativeSpec :=
  let first := shiftToExponent prec emax m e l
  let next := nearestEven (mantissa first.1) (fromShift first.1)
  let second := shiftToExponent prec emax next first.2 none
  finish sign (mantissa second.1) second.2 (emax-prec)
theorem roundAux_agrees (prec emax : RIntBinary) (sign : RBool) (m e : RIntBinary)
    (l : Rocq.Corelib.Floats.SpecFloat.location) :
    specTo (Rocq.Corelib.Floats.SpecFloat.binary_round_aux prec emax sign m e l) =
      roundAux (binaryIntTo prec) (binaryIntTo emax) (boolTo sign) (binaryIntTo m) (binaryIntTo e) (locationTo l) := by
  have hfirst := shiftToExponent_agrees prec emax m e l
  unfold Rocq.Corelib.Floats.SpecFloat.binary_round_aux
  generalize hf : Rocq.Corelib.Floats.SpecFloat.shr_fexp prec emax m e l = first at *
  cases first with
  | pair r e' =>
    change (shiftTo r,binaryIntTo e') =
      shiftToExponent (binaryIntTo prec) (binaryIntTo emax) (binaryIntTo m) (binaryIntTo e) (locationTo l) at hfirst
    unfold roundAux
    rw [← hfirst]
    dsimp only
    have hsecond := shiftToExponent_agrees prec emax
      (Rocq.Corelib.Floats.SpecFloat.round_nearest_even (Rocq.Corelib.Floats.SpecFloat.shr_m r)
        (Rocq.Corelib.Floats.SpecFloat.loc_of_shr_record r)) e' (.loc_Exact)
    rw [nearestEven_agrees,mantissa_agrees,fromShift_agrees] at hsecond
    generalize hs : Rocq.Corelib.Floats.SpecFloat.shr_fexp prec emax
      (Rocq.Corelib.Floats.SpecFloat.round_nearest_even (Rocq.Corelib.Floats.SpecFloat.shr_m r)
        (Rocq.Corelib.Floats.SpecFloat.loc_of_shr_record r)) e' (.loc_Exact) = second at *
    cases second with
    | pair r' e'' =>
      change (shiftTo r',binaryIntTo e'') =
        shiftToExponent (binaryIntTo prec) (binaryIntTo emax)
          (nearestEven (mantissa (shiftTo r)) (fromShift (shiftTo r))) (binaryIntTo e') none at hsecond
      rw [← hsecond]
      change specTo (sourceFinish sign (Rocq.Corelib.Floats.SpecFloat.shr_m r') e''
        (Rocq.Corelib.BinNums.IntDef.Z.sub emax prec)) = _
      rw [finish_agrees,mantissa_agrees,z_sub_agrees]
def roundPositive (prec emax : Int) (sign : Bool) (m : Nat) (e : Int) : nativeSpec :=
  let aligned := alignment m e (exponent prec emax ((positiveDigits m : Int)+e))
  roundAux prec emax sign aligned.1 aligned.2 none
theorem roundPositive_agrees (prec emax : RIntBinary) (sign : RBool) (m : RPositive) (e : RIntBinary) :
    specTo (Rocq.Corelib.Floats.SpecFloat.binary_round prec emax sign m e) =
      roundPositive (binaryIntTo prec) (binaryIntTo emax) (boolTo sign) (positiveTo m) (binaryIntTo e) := by
  have ha := alignment_agrees m e
    (Rocq.Corelib.Floats.SpecFloat.fexp prec emax
      (Rocq.Corelib.BinNums.IntDef.Z.add (.Zpos (Rocq.Corelib.Floats.SpecFloat.digits2_pos m)) e))
  rw [exponent_agrees,z_add_agrees] at ha
  change alignmentTo _ = alignment (positiveTo m) (binaryIntTo e)
    (exponent (binaryIntTo prec) (binaryIntTo emax)
      ((positiveTo (Rocq.Corelib.Floats.SpecFloat.digits2_pos m) : Int)+binaryIntTo e)) at ha
  rw [positiveDigits_agrees] at ha
  unfold Rocq.Corelib.Floats.SpecFloat.binary_round
  generalize hx : Rocq.Corelib.Floats.SpecFloat.shl_align m e
    (Rocq.Corelib.Floats.SpecFloat.fexp prec emax
      (Rocq.Corelib.BinNums.IntDef.Z.add (.Zpos (Rocq.Corelib.Floats.SpecFloat.digits2_pos m)) e)) = aligned at *
  cases aligned with
  | pair m' e' =>
    unfold roundPositive
    rw [← ha]
    exact roundAux_agrees prec emax sign (.Zpos m') e' (.loc_Exact)
def normalize (prec emax m e : Int) (zeroSign : Bool) : nativeSpec :=
  if m=0 then .zero zeroSign else roundPositive prec emax (decide (m<0)) m.natAbs e
theorem normalize_agrees (prec emax m e : RIntBinary) (zeroSign : RBool) :
    specTo (Rocq.Corelib.Floats.SpecFloat.binary_normalize prec emax m e zeroSign) =
      normalize (binaryIntTo prec) (binaryIntTo emax) (binaryIntTo m) (binaryIntTo e) (boolTo zeroSign) := by
  cases m with
  | Z0 => rfl
  | Zpos p =>
    have hp := positiveTo_pos p
    change specTo (Rocq.Corelib.Floats.SpecFloat.binary_round prec emax .false p e) = _
    rw [roundPositive_agrees]
    have hn : ¬ (positiveTo p : Int) < 0 := by omega
    simp [normalize,binaryIntTo,Nat.ne_of_gt hp,boolTo,hn]
  | Zneg p =>
    have hp := positiveTo_pos p
    change specTo (Rocq.Corelib.Floats.SpecFloat.binary_round prec emax .true p e) = _
    rw [roundPositive_agrees]
    simp [normalize,binaryIntTo,Nat.ne_of_gt hp,boolTo,hp]

def one (prec emax : Int) : nativeSpec := roundPositive prec emax false 1 0
theorem one_agrees (prec emax : RIntBinary) :
    specTo (Rocq.Corelib.Floats.SpecFloat.SFone prec emax) = one (binaryIntTo prec) (binaryIntTo emax) :=
  roundPositive_agrees prec emax .false .xH .Z0
def scale (prec emax : Int) (x : nativeSpec) (n : Int) : nativeSpec :=
  match x with
  | .finite sign m e => roundPositive prec emax sign m.val (e+n)
  | _ => x
theorem scale_agrees (prec emax : RIntBinary) (x : Rocq.Corelib.Floats.SpecFloat.spec_float) (n : RIntBinary) :
    specTo (Rocq.Corelib.Floats.SpecFloat.SFldexp prec emax x n) =
      scale (binaryIntTo prec) (binaryIntTo emax) (specTo x) (binaryIntTo n) := by
  cases x with
  | S754_zero s => rfl
  | S754_infinity s => rfl
  | S754_nan => rfl
  | S754_finite s m e =>
    change specTo (Rocq.Corelib.Floats.SpecFloat.binary_round prec emax s m (Rocq.Corelib.BinNums.IntDef.Z.add e n)) = _
    rw [roundPositive_agrees,z_add_agrees]
    rfl
def normalMantissa (prec : Int) : nativeSpec → Nat
  | .finite _ m e => if e = -prec then m.val else 0
  | _ => 0
theorem normalMantissa_agrees (prec : RIntBinary) (x : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    binaryNatTo (Rocq.Corelib.Floats.SpecFloat.SFnormfr_mantissa prec x) =
      normalMantissa (binaryIntTo prec) (specTo x) := by
  cases x with
  | S754_zero s => rfl
  | S754_infinity s => rfl
  | S754_nan => rfl
  | S754_finite s m e =>
    change binaryNatTo (Rocq.Corelib.Init.Datatypes.bool.rec (.Npos m) .N0
      (Rocq.Corelib.BinNums.IntDef.Z.eqb e (Rocq.Corelib.BinNums.IntDef.Z.opp prec))) = _
    rw [choose_map binaryNatTo,eqb_agrees,z_opp_agrees]
    simp only [decide_eq_true_eq]
    rfl

def classify (prec : Int) : nativeSpec → Fin 9
  | .zero s => if s then 5 else 4
  | .infinity s => if s then 7 else 6
  | .nan => 8
  | .finite s m _ =>
    if s then (if (positiveDigits m.val : Int)=prec then 1 else 3)
    else (if (positiveDigits m.val : Int)=prec then 0 else 2)
theorem classify_agrees (prec : RIntBinary) (x : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    floatClassTo (Rocq.Corelib.Floats.SpecFloat.SFclassify prec x) = classify (binaryIntTo prec) (specTo x) := by
  cases x with
  | S754_zero s => cases s <;> rfl
  | S754_infinity s => cases s <;> rfl
  | S754_nan => rfl
  | S754_finite s m e =>
    cases s <;>
      simp only [Rocq.Corelib.Floats.SpecFloat.SFclassify]
    all_goals
      rw [choose_map floatClassTo,eqb_agrees]
      change (if decide ((positiveTo (Rocq.Corelib.Floats.SpecFloat.digits2_pos m) : Int)=binaryIntTo prec) then _ else _) = _
      rw [positiveDigits_agrees]
      simp only [decide_eq_true_eq]
      rfl

end NativeBridge.Incremental.SpecFloatNormalize

-- Rechecked in the FloatAxioms closure: SpecFloatComparison
set_option maxHeartbeats 30000
noncomputable section
namespace NativeBridge.Incremental.SpecFloatComparison
open NativeBridge.Incremental.SpecFloatRepresentation
open NativeBridge.Incremental.BinaryInt NativeBridge.Incremental.BinaryOrder
def finiteCompare (m : Nat) (e : Int) (n : Nat) (f : Int) : Ordering :=
  (compare e f).then (compare m n)
def comparison : nativeSpec → nativeSpec → Option Ordering
  | .nan, _ => none
  | _, .nan => none
  | .zero _, .zero _ => some .eq
  | .zero _, .infinity t => some (if t then .gt else .lt)
  | .zero _, .finite t _ _ => some (if t then .gt else .lt)
  | .infinity s, .zero _ => some (if s then .lt else .gt)
  | .infinity s, .infinity t => some (if s=t then .eq else if s then .lt else .gt)
  | .infinity s, .finite _ _ _ => some (if s then .lt else .gt)
  | .finite s _ _, .zero _ => some (if s then .lt else .gt)
  | .finite _ _ _, .infinity t => some (if t then .gt else .lt)
  | .finite s m e, .finite t n f =>
    some (if s=t then if s then (finiteCompare m.val e n.val f).swap else finiteCompare m.val e n.val f
      else if s then .lt else .gt)
def comparisonResultTo (c : Rocq.Corelib.Init.Datatypes.option RComparison) : Option Ordering :=
  (optionTo c).map comparisonTo
theorem comparisonStep (a b : RComparison) :
    comparisonTo (Rocq.Corelib.Init.Datatypes.comparison.rec a .Lt .Gt b) =
      (comparisonTo b).then (comparisonTo a) := by cases b <;> rfl
theorem comparisonStepNeg (a b : RComparison) :
    comparisonTo (Rocq.Corelib.Init.Datatypes.comparison.rec
      (Rocq.Corelib.Init.Datatypes.CompOpp a) .Gt .Lt b) =
      ((comparisonTo b).then (comparisonTo a)).swap := by
  cases b <;> cases a <;> rfl
theorem positiveCompare (p q : RPositive) :
    comparisonTo (Rocq.Corelib.BinNums.PosDef.Pos.compare_cont .Eq p q) = compare (positiveTo p) (positiveTo q) := by
  rw [compare_cont_agrees]
  change (if positiveTo p < positiveTo q then Ordering.lt else if positiveTo q < positiveTo p then Ordering.gt else Ordering.eq) = _
  exact (Nat.compare_eq_ite_lt _ _).symm
theorem comparison_agrees (x y : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    comparisonResultTo (Rocq.Corelib.Floats.SpecFloat.SFcompare x y) = comparison (specTo x) (specTo y) := by
  cases x with
  | S754_zero s =>
    cases y with
    | S754_zero t =>
      cases s <;> cases t <;> rfl
    | S754_infinity t =>
      cases s <;> cases t <;> rfl
    | S754_nan =>
      cases s <;> rfl
    | S754_finite t n f =>
      cases s <;> cases t <;> rfl
  | S754_infinity s =>
    cases y with
    | S754_zero t =>
      cases s <;> cases t <;> rfl
    | S754_infinity t =>
      cases s <;> cases t <;> rfl
    | S754_nan =>
      cases s <;> rfl
    | S754_finite t n f =>
      cases s <;> cases t <;> rfl
  | S754_nan =>
    cases y with
    | S754_zero t =>
      cases t <;> rfl
    | S754_infinity t =>
      cases t <;> rfl
    | S754_nan =>
      rfl
    | S754_finite t n f =>
      cases t <;> rfl
  | S754_finite s m e =>
    cases y with
    | S754_zero t =>
      cases s <;> cases t <;> rfl
    | S754_infinity t =>
      cases s <;> cases t <;> rfl
    | S754_nan =>
      cases s <;> rfl
    | S754_finite t n f =>
      cases s <;> cases t
      all_goals
        simp only [Rocq.Corelib.Floats.SpecFloat.SFcompare,specTo,comparisonResultTo,optionTo,Option.map,
          comparison,finiteCompare,boolTo]
      all_goals try rfl
      all_goals first | (rw [comparisonStep,positiveCompare,z_compare_agrees]; rfl) | (rw [comparisonStepNeg,positiveCompare,z_compare_agrees]; rfl)

def equal (x y : nativeSpec) : Bool := comparison x y == some .eq
def less (x y : nativeSpec) : Bool := comparison x y == some .lt
def lessEqual (x y : nativeSpec) : Bool :=
  match comparison x y with | some .eq | some .lt => true | _ => false

theorem equalResult (c : Rocq.Corelib.Init.Datatypes.option RComparison) :
    boolTo (Rocq.Corelib.Init.Datatypes.option.rec
      (fun c => Rocq.Corelib.Init.Datatypes.comparison.rec Rocq.Corelib.Init.Datatypes.bool.true .false .false c)
      Rocq.Corelib.Init.Datatypes.bool.false c) = (comparisonResultTo c == some .eq) := by
  cases c with
  | None => rfl
  | Some c => cases c <;> rfl
theorem lessResult (c : Rocq.Corelib.Init.Datatypes.option RComparison) :
    boolTo (Rocq.Corelib.Init.Datatypes.option.rec
      (fun c => Rocq.Corelib.Init.Datatypes.comparison.rec Rocq.Corelib.Init.Datatypes.bool.false .true .false c)
      Rocq.Corelib.Init.Datatypes.bool.false c) = (comparisonResultTo c == some .lt) := by
  cases c with
  | None => rfl
  | Some c => cases c <;> rfl
def isLessEqual : Option Ordering → Bool
  | some .eq | some .lt => true
  | _ => false
theorem lessEqualResult (c : Rocq.Corelib.Init.Datatypes.option RComparison) :
    boolTo (Rocq.Corelib.Init.Datatypes.option.rec
      (fun c => Rocq.Corelib.Init.Datatypes.comparison.rec Rocq.Corelib.Init.Datatypes.bool.true .true .false c)
      Rocq.Corelib.Init.Datatypes.bool.false c) = isLessEqual (comparisonResultTo c) := by
  cases c with
  | None => rfl
  | Some c => cases c <;> rfl
theorem equal_agrees (x y : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    boolTo (Rocq.Corelib.Floats.SpecFloat.SFeqb x y) = equal (specTo x) (specTo y) := by
  unfold Rocq.Corelib.Floats.SpecFloat.SFeqb
  rw [equalResult,comparison_agrees]
  rfl
theorem less_agrees (x y : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    boolTo (Rocq.Corelib.Floats.SpecFloat.SFltb x y) = less (specTo x) (specTo y) := by
  unfold Rocq.Corelib.Floats.SpecFloat.SFltb
  rw [lessResult,comparison_agrees]
  rfl
theorem lessEqual_agrees (x y : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    boolTo (Rocq.Corelib.Floats.SpecFloat.SFleb x y) = lessEqual (specTo x) (specTo y) := by
  unfold Rocq.Corelib.Floats.SpecFloat.SFleb
  rw [lessEqualResult,comparison_agrees]
  rfl

end NativeBridge.Incremental.SpecFloatComparison

-- Rechecked in the FloatAxioms closure: SpecFloatArithmetic
set_option maxHeartbeats 100000
noncomputable section
namespace NativeBridge.Incremental.SpecFloatArithmetic
open NativeBridge.Incremental.SpecFloatRepresentation NativeBridge.Incremental.SpecFloatRounding
open NativeBridge.Incremental.SpecFloatShift NativeBridge.Incremental.SpecFloatNormalize
open NativeBridge.Incremental.BinaryInt NativeBridge.Incremental.BinaryArithmetic

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
theorem alignmentMantissa (m : RPositive) (e target : RIntBinary) :
    positiveTo (Rocq.Corelib.Init.Datatypes.fst RPositive RIntBinary
      (Rocq.Corelib.Floats.SpecFloat.shl_align m e target)) =
      (alignment (positiveTo m) (binaryIntTo e) (binaryIntTo target)).1 := by
  have h := congrArg Prod.fst (alignment_agrees m e target)
  cases he : Rocq.Corelib.Floats.SpecFloat.shl_align m e target with
  | pair p z => simpa [alignmentTo,prodTo,he,Rocq.Corelib.Init.Datatypes.fst] using h

def addition (prec emax : Int) : nativeSpec → nativeSpec → nativeSpec
  | .nan, _ => .nan
  | _, .nan => .nan
  | .zero s, .zero t => .zero (s && t)
  | .infinity s, .infinity t => if s=t then .infinity s else .nan
  | .infinity s, _ => .infinity s
  | _, .infinity t => .infinity t
  | .zero _, y => y
  | x, .zero _ => x
  | .finite s m e, .finite t n f =>
    let lo := min e f
    normalize prec emax
      (conditionalNegate s ((alignment m.val e lo).1 : Int) +
       conditionalNegate t ((alignment n.val f lo).1 : Int)) lo false
def subtraction (prec emax : Int) (x y : nativeSpec) : nativeSpec :=
  addition prec emax x (negate y)
def multiplication (prec emax : Int) : nativeSpec → nativeSpec → nativeSpec
  | .nan, _ => .nan
  | _, .nan => .nan
  | .zero _, .infinity _ => .nan
  | .infinity _, .zero _ => .nan
  | .zero s, .zero t => .zero (Bool.xor s t)
  | .zero s, .finite t _ _ => .zero (Bool.xor s t)
  | .finite s _ _, .zero t => .zero (Bool.xor s t)
  | .infinity s, .infinity t => .infinity (Bool.xor s t)
  | .infinity s, .finite t _ _ => .infinity (Bool.xor s t)
  | .finite s _ _, .infinity t => .infinity (Bool.xor s t)
  | .finite s m e, .finite t n f =>
    roundAux prec emax (Bool.xor s t) ((m.val*n.val : Nat) : Int) (e+f) none

theorem addition_agrees (prec emax : RIntBinary) (x y : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    specTo (Rocq.Corelib.Floats.SpecFloat.SFadd prec emax x y) =
      addition (binaryIntTo prec) (binaryIntTo emax) (specTo x) (specTo y) := by
  cases x with
  | S754_zero s =>
    cases y with
    | S754_zero t =>
      cases s <;> cases t <;> rfl
    | S754_infinity t =>
      cases s <;> cases t <;> rfl
    | S754_nan =>
      cases s <;> rfl
    | S754_finite t n f =>
      cases s <;> cases t <;> rfl
  | S754_infinity s =>
    cases y with
    | S754_zero t =>
      cases s <;> cases t <;> rfl
    | S754_infinity t =>
      cases s <;> cases t <;> rfl
    | S754_nan =>
      cases s <;> rfl
    | S754_finite t n f =>
      cases s <;> cases t <;> rfl
  | S754_nan =>
    cases y with
    | S754_zero t =>
      cases t <;> rfl
    | S754_infinity t =>
      cases t <;> rfl
    | S754_nan =>
      rfl
    | S754_finite t n f =>
      cases t <;> rfl
  | S754_finite s m e =>
    cases y with
    | S754_zero t =>
      cases s <;> cases t <;> rfl
    | S754_infinity t =>
      cases s <;> cases t <;> rfl
    | S754_nan =>
      cases s <;> rfl
    | S754_finite t n f =>
      unfold Rocq.Corelib.Floats.SpecFloat.SFadd
      rw [normalize_agrees,z_add_agrees,conditionalNegate_agrees,conditionalNegate_agrees]
      change normalize _ _ (conditionalNegate (boolTo s) ((positiveTo (Rocq.Corelib.Init.Datatypes.fst RPositive RIntBinary (Rocq.Corelib.Floats.SpecFloat.shl_align m e (Rocq.Corelib.BinNums.IntDef.Z.min e f)))) : Int) + conditionalNegate (boolTo t) ((positiveTo (Rocq.Corelib.Init.Datatypes.fst RPositive RIntBinary (Rocq.Corelib.Floats.SpecFloat.shl_align n f (Rocq.Corelib.BinNums.IntDef.Z.min e f)))) : Int)) _ _ = _
      rw [alignmentMantissa,alignmentMantissa,minimum_agrees]
      rfl

theorem subtraction_agrees (prec emax : RIntBinary) (x y : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    specTo (Rocq.Corelib.Floats.SpecFloat.SFsub prec emax x y) =
      subtraction (binaryIntTo prec) (binaryIntTo emax) (specTo x) (specTo y) := by
  cases x with
  | S754_zero s =>
    cases y with
    | S754_zero t =>
      cases s <;> cases t <;> rfl
    | S754_infinity t =>
      cases s <;> cases t <;> rfl
    | S754_nan =>
      cases s <;> rfl
    | S754_finite t n f =>
      cases s <;> cases t <;> rfl
  | S754_infinity s =>
    cases y with
    | S754_zero t =>
      cases s <;> cases t <;> rfl
    | S754_infinity t =>
      cases s <;> cases t <;> rfl
    | S754_nan =>
      cases s <;> rfl
    | S754_finite t n f =>
      cases s <;> cases t <;> rfl
  | S754_nan =>
    cases y with
    | S754_zero t =>
      cases t <;> rfl
    | S754_infinity t =>
      cases t <;> rfl
    | S754_nan =>
      rfl
    | S754_finite t n f =>
      cases t <;> rfl
  | S754_finite s m e =>
    cases y with
    | S754_zero t =>
      cases s <;> cases t <;> rfl
    | S754_infinity t =>
      cases s <;> cases t <;> rfl
    | S754_nan =>
      cases s <;> rfl
    | S754_finite t n f =>
      unfold Rocq.Corelib.Floats.SpecFloat.SFsub
      rw [normalize_agrees,z_sub_agrees,conditionalNegate_agrees,conditionalNegate_agrees]
      change normalize _ _ (conditionalNegate (boolTo s) ((positiveTo (Rocq.Corelib.Init.Datatypes.fst RPositive RIntBinary (Rocq.Corelib.Floats.SpecFloat.shl_align m e (Rocq.Corelib.BinNums.IntDef.Z.min e f)))) : Int) - conditionalNegate (boolTo t) ((positiveTo (Rocq.Corelib.Init.Datatypes.fst RPositive RIntBinary (Rocq.Corelib.Floats.SpecFloat.shl_align n f (Rocq.Corelib.BinNums.IntDef.Z.min e f)))) : Int)) _ _ = _
      rw [alignmentMantissa,alignmentMantissa,minimum_agrees]
      cases s <;> cases t <;>
        simp [subtraction,addition,negate,specTo,conditionalNegate,boolTo,Int.sub_eq_add_neg] <;> rfl

theorem multiplication_agrees (prec emax : RIntBinary) (x y : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    specTo (Rocq.Corelib.Floats.SpecFloat.SFmul prec emax x y) =
      multiplication (binaryIntTo prec) (binaryIntTo emax) (specTo x) (specTo y) := by
  cases x with
  | S754_zero s =>
    cases y with
    | S754_zero t =>
      cases s <;> cases t <;> rfl
    | S754_infinity t =>
      cases s <;> cases t <;> rfl
    | S754_nan =>
      cases s <;> rfl
    | S754_finite t n f =>
      cases s <;> cases t <;> rfl
  | S754_infinity s =>
    cases y with
    | S754_zero t =>
      cases s <;> cases t <;> rfl
    | S754_infinity t =>
      cases s <;> cases t <;> rfl
    | S754_nan =>
      cases s <;> rfl
    | S754_finite t n f =>
      cases s <;> cases t <;> rfl
  | S754_nan =>
    cases y with
    | S754_zero t =>
      cases t <;> rfl
    | S754_infinity t =>
      cases t <;> rfl
    | S754_nan =>
      rfl
    | S754_finite t n f =>
      cases t <;> rfl
  | S754_finite s m e =>
    cases y with
    | S754_zero t =>
      cases s <;> cases t <;> rfl
    | S754_infinity t =>
      cases s <;> cases t <;> rfl
    | S754_nan =>
      cases s <;> rfl
    | S754_finite t n f =>
      unfold Rocq.Corelib.Floats.SpecFloat.SFmul
      rw [roundAux_agrees,z_add_agrees,xorb_agrees]
      change roundAux _ _ _ ((positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.mul m n) : Nat) : Int) _ _ = _
      rw [positive_mul_agrees]
      rfl

end NativeBridge.Incremental.SpecFloatArithmetic

-- Rechecked in the FloatAxioms closure: SpecFloatMaskSupport
noncomputable section
namespace NativeBridge.Incremental.SpecFloatMaskSupport
open NativeBridge.Incremental.BinaryOrder
theorem subtractOne_agrees (p : RPositive) :
    positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.sub p .xH) = max 1 (positiveTo p-1) := by
  cases p with
  | xH => rfl
  | xI p =>
    change 2*positiveTo p = max 1 (2*positiveTo p+1-1)
    have hp := positiveTo_pos p
    omega
  | xO p =>
    change positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p) = max 1 (2*positiveTo p-1)
    rw [positive_pred_double_agrees]
    have hp := positiveTo_pos p
    omega
theorem positiveClamp_agrees (z : RIntBinary) :
    positiveTo (Rocq.Corelib.BinNums.IntDef.Z.to_pos z) = max 1 (binaryIntTo z).toNat := by
  cases z with
  | Z0 => rfl
  | Zpos p =>
    change positiveTo p = max 1 ((positiveTo p : Int)).toNat
    have := positiveTo_pos p
    omega
  | Zneg p => change 1 = max 1 (-(positiveTo p : Int)).toNat; omega
end NativeBridge.Incremental.SpecFloatMaskSupport

-- Rechecked in the FloatAxioms closure: SpecFloatExponent
noncomputable section
namespace NativeBridge.Incremental.SpecFloatExponent
open NativeBridge.Incremental.SpecFloatRepresentation NativeBridge.Incremental.SpecFloatRounding
open NativeBridge.Incremental.SpecFloatShift NativeBridge.Incremental.SpecFloatNormalize
open NativeBridge.Incremental.SpecFloatMaskSupport
open NativeBridge.Incremental.BinaryInt NativeBridge.Incremental.BinaryArithmetic NativeBridge.Incremental.BinaryPower

theorem zPositive (p : RPositive) : binaryIntTo (.Zpos p) = (positiveTo p : Int) := rfl

def grow (m : {n : Nat // 0<n}) (k : Nat) : {n : Nat // 0<n} :=
  ⟨2^k*m.val,Nat.mul_pos (Nat.two_pow_pos k) m.property⟩
theorem grow_agrees (m : RPositive) (k : RIntBinary) :
    positiveIso.to (Rocq.Corelib.BinNums.PosDef.Pos.iter RPositive
      Rocq.Corelib.Numbers.BinNums.positive.xO m (Rocq.Corelib.BinNums.IntDef.Z.to_pos k)) =
    grow (positiveIso.to m) (max 1 (binaryIntTo k).toNat) := by
  apply Subtype.ext
  change positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.iter RPositive
    Rocq.Corelib.Numbers.BinNums.positive.xO m (Rocq.Corelib.BinNums.IntDef.Z.to_pos k)) = _
  rw [positive_iter_transport positiveTo _ (fun x => 2*x) positiveTo_xO,
    repeatDouble,positiveClamp_agrees]
  rfl

def maximum (prec emax : Int) : nativeSpec :=
  .finite false ⟨max 1 (2^(max 1 prec.toNat)-1),by omega⟩ (emax-prec)
theorem maximum_agrees (prec emax : RIntBinary) :
    specTo (Rocq.Corelib.Floats.SpecFloat.SFmax_float prec emax) = maximum (binaryIntTo prec) (binaryIntTo emax) := by
  have hm := subtractOne_agrees (Rocq.Corelib.BinNums.PosDef.Pos.iter RPositive
    Rocq.Corelib.Numbers.BinNums.positive.xO .xH (Rocq.Corelib.BinNums.IntDef.Z.to_pos prec))
  rw [positive_iter_transport positiveTo _ (fun x => 2*x) positiveTo_xO,
    repeatDouble,positiveClamp_agrees,positiveTo_xH,Nat.mul_one] at hm
  have hs : positiveIso.to (Rocq.Corelib.BinNums.PosDef.Pos.sub
    (Rocq.Corelib.BinNums.PosDef.Pos.iter RPositive Rocq.Corelib.Numbers.BinNums.positive.xO
      .xH (Rocq.Corelib.BinNums.IntDef.Z.to_pos prec)) .xH) =
      (⟨max 1 (2^(max 1 (binaryIntTo prec).toNat)-1),by omega⟩ : {n : Nat // 0<n}) :=
    Subtype.ext hm
  change SpecValue.finite false _ (binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.sub emax prec)) = _
  rw [hs,z_sub_agrees]
  rfl

def fraction (prec emax : Int) (x : nativeSpec) : nativeSpec × Int :=
  match x with
  | .finite s m e =>
    let digits : Int := positiveDigits m.val
    if prec≤digits then (.finite s m (-prec),e+prec)
    else
      let d := prec-digits
      (.finite s (grow m (max 1 d.toNat)) (-prec),e+prec-d)
  | _ => (x, -2*emax-prec)
def specPairTo (p : Rocq.Corelib.Init.Datatypes.prod Rocq.Corelib.Floats.SpecFloat.spec_float RIntBinary) :
    nativeSpec × Int :=
  let q := prodTo p
  (specTo q.1,binaryIntTo q.2)
theorem fraction_agrees (prec emax : RIntBinary) (x : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    specPairTo (Rocq.Corelib.Floats.SpecFloat.SFfrexp prec emax x) =
      fraction (binaryIntTo prec) (binaryIntTo emax) (specTo x) := by
  cases x with
  | S754_zero s =>
    change (specTo (.S754_zero s),binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.sub
      (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zneg (.xO .xH)) emax) prec)) = _
    rw [z_sub_agrees,z_mul_agrees]
    rfl
  | S754_infinity s =>
    change (specTo (.S754_infinity s),binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.sub
      (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zneg (.xO .xH)) emax) prec)) = _
    rw [z_sub_agrees,z_mul_agrees]
    rfl
  | S754_nan =>
    change (specTo .S754_nan,binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.sub
      (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zneg (.xO .xH)) emax) prec)) = _
    rw [z_sub_agrees,z_mul_agrees]
    rfl
  | S754_finite s m e =>
    unfold Rocq.Corelib.Floats.SpecFloat.SFfrexp
    rw [choose_map specPairTo,z_leb_agrees]
    simp only [specPairTo,prodTo,specTo]
    rw [grow_agrees,z_sub_agrees,z_add_agrees,z_opp_agrees,z_sub_agrees]
    change (if decide (binaryIntTo prec ≤ (positiveTo (Rocq.Corelib.Floats.SpecFloat.digits2_pos m) : Int)) then _ else _) = _
    simp only [z_sub_agrees,z_add_agrees,zPositive,positiveDigits_agrees,decide_eq_true_eq]
    rfl

def unitInLastPlace (prec emax : Int) (x : nativeSpec) : nativeSpec :=
  scale prec emax (one prec emax) (exponent prec emax (fraction prec emax x).2)
theorem unitInLastPlace_agrees (prec emax : RIntBinary) (x : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    specTo (Rocq.Corelib.Floats.SpecFloat.SFulp prec emax x) =
      unitInLastPlace (binaryIntTo prec) (binaryIntTo emax) (specTo x) := by
  have hs := congrArg Prod.snd (fraction_agrees prec emax x)
  have he : binaryIntTo (Rocq.Corelib.Init.Datatypes.snd _ _
    (Rocq.Corelib.Floats.SpecFloat.SFfrexp prec emax x)) =
      (fraction (binaryIntTo prec) (binaryIntTo emax) (specTo x)).2 := by
    cases h : Rocq.Corelib.Floats.SpecFloat.SFfrexp prec emax x with
    | pair a b => simpa [h,specPairTo,prodTo,Rocq.Corelib.Init.Datatypes.snd] using hs
  unfold Rocq.Corelib.Floats.SpecFloat.SFulp
  rw [scale_agrees,one_agrees,exponent_agrees,he]
  rfl
end NativeBridge.Incremental.SpecFloatExponent

-- Rechecked in the FloatAxioms closure: SpecFloatAdjacent
noncomputable section
namespace NativeBridge.Incremental.SpecFloatAdjacent
open NativeBridge.Incremental.SpecFloatRepresentation NativeBridge.Incremental.SpecFloatRounding
open NativeBridge.Incremental.SpecFloatShift NativeBridge.Incremental.SpecFloatNormalize
open NativeBridge.Incremental.SpecFloatExponent NativeBridge.Incremental.SpecFloatArithmetic
open NativeBridge.Incremental.BinaryInt NativeBridge.Incremental.BinaryArithmetic NativeBridge.Incremental.BinaryPower
open NativeBridge.Incremental.SpecFloatMaskSupport

theorem fractionExponent (prec emax : RIntBinary) (x : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    binaryIntTo (Rocq.Corelib.Init.Datatypes.snd _ _
      (Rocq.Corelib.Floats.SpecFloat.SFfrexp prec emax x)) =
      (fraction (binaryIntTo prec) (binaryIntTo emax) (specTo x)).2 := by
  have h := congrArg Prod.snd (fraction_agrees prec emax x)
  cases hx : Rocq.Corelib.Floats.SpecFloat.SFfrexp prec emax x with
  | pair a b => simpa [hx,specPairTo,prodTo,Rocq.Corelib.Init.Datatypes.snd] using h
theorem boundaryTest (m : RPositive) (prec : RIntBinary) :
    boolTo (Rocq.Corelib.BinNums.PosDef.Pos.eqb (.xO m)
      (Rocq.Corelib.BinNums.PosDef.Pos.iter RPositive Rocq.Corelib.Numbers.BinNums.positive.xO
        .xH (Rocq.Corelib.BinNums.IntDef.Z.to_pos prec))) =
    (2*positiveTo m == 2^(max 1 (binaryIntTo prec).toNat)) := by
  rw [positive_eqb_agrees,positiveTo_xO,
    positive_iter_transport positiveTo _ (fun x => 2*x) positiveTo_xO,
    repeatDouble,positiveClamp_agrees,positiveTo_xH,Nat.mul_one]

def predecessorPositive (prec emax : Int) (x : nativeSpec) : nativeSpec :=
  match x with
  | .finite _ m _ =>
    let step := if 2*m.val == 2^(max 1 prec.toNat) then
      scale prec emax (one prec emax) (exponent prec emax ((fraction prec emax x).2-1))
      else unitInLastPlace prec emax x
    subtraction prec emax x step
  | _ => x
theorem predecessorPositive_agrees (prec emax : RIntBinary) (x : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    specTo (Rocq.Corelib.Floats.SpecFloat.SFpred_pos prec emax x) =
      predecessorPositive (binaryIntTo prec) (binaryIntTo emax) (specTo x) := by
  cases x with
  | S754_zero s => rfl
  | S754_infinity s => rfl
  | S754_nan => rfl
  | S754_finite s m e =>
    unfold Rocq.Corelib.Floats.SpecFloat.SFpred_pos
    rw [subtraction_agrees,choose_map specTo,boundaryTest]
    rw [scale_agrees,one_agrees,exponent_agrees,z_sub_agrees,fractionExponent,unitInLastPlace_agrees]
    rfl

def successor (prec emax : Int) (x : nativeSpec) : nativeSpec :=
  match x with
  | .zero _ => scale prec emax (one prec emax) (minimumExponent prec emax)
  | .infinity s => if s then negate (maximum prec emax) else x
  | .nan => x
  | .finite s _ _ =>
    if s then negate (predecessorPositive prec emax (negate x))
    else addition prec emax x (unitInLastPlace prec emax x)
theorem successor_agrees (prec emax : RIntBinary) (x : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    specTo (Rocq.Corelib.Floats.SpecFloat.SFsucc prec emax x) =
      successor (binaryIntTo prec) (binaryIntTo emax) (specTo x) := by
  cases x with
  | S754_zero s =>
    unfold Rocq.Corelib.Floats.SpecFloat.SFsucc
    rw [scale_agrees,one_agrees,minimumExponent_agrees]
    rfl
  | S754_nan => rfl
  | S754_infinity s =>
    unfold Rocq.Corelib.Floats.SpecFloat.SFsucc
    rw [choose_map specTo,negate_agrees,maximum_agrees]
    rfl
  | S754_finite s m e =>
    unfold Rocq.Corelib.Floats.SpecFloat.SFsucc
    rw [choose_map specTo,negate_agrees,predecessorPositive_agrees,negate_agrees,
      addition_agrees,unitInLastPlace_agrees]
    rfl
def predecessor (prec emax : Int) (x : nativeSpec) : nativeSpec :=
  negate (successor prec emax (negate x))
theorem predecessor_agrees (prec emax : RIntBinary) (x : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    specTo (Rocq.Corelib.Floats.SpecFloat.SFpred prec emax x) =
      predecessor (binaryIntTo prec) (binaryIntTo emax) (specTo x) := by
  unfold Rocq.Corelib.Floats.SpecFloat.SFpred
  rw [negate_agrees,successor_agrees,negate_agrees]
  rfl
end NativeBridge.Incremental.SpecFloatAdjacent

-- Rechecked in the FloatAxioms closure: SpecFloatDivisionSupport
set_option autoImplicit false
set_option maxHeartbeats 200000
noncomputable section
namespace NativeBridge.Incremental.BinaryDivision
open NativeBridge BinaryInt BinaryOrder BinaryArithmetic
abbrev ZPair := Rocq.Corelib.Init.Datatypes.prod RIntBinary RIntBinary
abbrev zPairTo (x : ZPair) : Int × Int := match x with | .pair _ _ q r => (binaryIntTo q,binaryIntTo r)
theorem zToZero : binaryIntTo .Z0 = 0 := rfl
theorem zToPos (p : RPositive) : binaryIntTo (.Zpos p) = (positiveTo p : Int) := rfl
theorem zToNeg (p : RPositive) : binaryIntTo (.Zneg p) = -(positiveTo p : Int) := rfl

def zDivStep (b c : Int) (qr : Int × Int) : Int × Int :=
  if 2*qr.2+c < b then (2*qr.1,2*qr.2+c) else (2*qr.1+1,2*qr.2+c-b)

theorem zToOne : binaryIntTo (.Zpos .xH) = 1 := rfl
theorem zToTwo : binaryIntTo (.Zpos (.xO .xH)) = 2 := rfl

theorem z_source_step_I (p : RPositive) (b : RIntBinary) :
    zPairTo (Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl (.xI p) b) =
      zDivStep (binaryIntTo b) 1 (zPairTo (Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl p b)) := by
  cases h : Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl p b with
  | pair q r =>
    change zPairTo (Rocq.Corelib.Init.Datatypes.prod.rec
      (fun q r => Rocq.Corelib.Init.Datatypes.bool.rec
        (.pair _ _ (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH)) q) (Rocq.Corelib.BinNums.IntDef.Z.add (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH)) r) (.Zpos .xH)))
        (.pair _ _ (Rocq.Corelib.BinNums.IntDef.Z.add (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH)) q) (.Zpos .xH))
          (Rocq.Corelib.BinNums.IntDef.Z.sub (Rocq.Corelib.BinNums.IntDef.Z.add (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH)) r) (.Zpos .xH)) b))
        (Rocq.Corelib.BinNums.IntDef.Z.ltb (Rocq.Corelib.BinNums.IntDef.Z.add (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH)) r) (.Zpos .xH)) b))
      (Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl p b)) = _
    rw [h]
    have hc := z_ltb_agrees (Rocq.Corelib.BinNums.IntDef.Z.add (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH)) r) (.Zpos .xH)) b
    simp only [z_add_agrees, BinaryPower.z_mul_agrees, zToOne, zToTwo] at hc
    cases hb : Rocq.Corelib.BinNums.IntDef.Z.ltb (Rocq.Corelib.BinNums.IntDef.Z.add (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH)) r) (.Zpos .xH)) b <;>
      simp [hb, boolTo] at hc <;>
      simp [hb, zPairTo, zDivStep, hc, z_add_agrees, BinaryPower.z_mul_agrees, z_sub_agrees, zToOne, zToTwo]
    all_goals omega

theorem z_source_step_O (p : RPositive) (b : RIntBinary) :
    zPairTo (Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl (.xO p) b) =
      zDivStep (binaryIntTo b) 0 (zPairTo (Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl p b)) := by
  cases h : Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl p b with
  | pair q r =>
    change zPairTo (Rocq.Corelib.Init.Datatypes.prod.rec
      (fun q r => Rocq.Corelib.Init.Datatypes.bool.rec
        (.pair _ _ (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH)) q) (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH)) r))
        (.pair _ _ (Rocq.Corelib.BinNums.IntDef.Z.add (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH)) q) (.Zpos .xH))
          (Rocq.Corelib.BinNums.IntDef.Z.sub (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH)) r) b))
        (Rocq.Corelib.BinNums.IntDef.Z.ltb (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH)) r) b))
      (Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl p b)) = _
    rw [h]
    have hc := z_ltb_agrees (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH)) r) b
    simp only [BinaryPower.z_mul_agrees, zToTwo] at hc
    cases hb : Rocq.Corelib.BinNums.IntDef.Z.ltb (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH)) r) b <;>
      simp [hb, boolTo] at hc <;>
      simp [hb, zPairTo, zDivStep, hc, z_add_agrees, BinaryPower.z_mul_agrees, z_sub_agrees, zToOne, zToTwo]
    all_goals omega

theorem z_divmod_unique (a b q r : Int) (hb : 0 < b)
    (he : r+b*q=a) (hr0 : 0 ≤ r) (hrb : r < b) :
    (a/b,a%b) = (q,r) :=
  Prod.ext ((Int.ediv_emod_unique hb).mpr ⟨he,hr0,hrb⟩).1
    ((Int.ediv_emod_unique hb).mpr ⟨he,hr0,hrb⟩).2

theorem z_divmod_step (a b c : Int) (hb : 0 < b) (hc0 : 0 ≤ c) (hc1 : c ≤ 1) :
    zDivStep b c (a/b,a%b) = ((2*a+c)/b,(2*a+c)%b) := by
  have hr0 := Int.emod_nonneg a (Int.ne_of_gt hb)
  have hrb := Int.emod_lt_of_pos a hb
  have he := Int.emod_add_mul_ediv a b
  have hex : (2*(a%b)+c)+b*(2*(a/b))=2*a+c := by
    rw [Int.mul_left_comm b 2 (a/b)]
    omega
  unfold zDivStep
  dsimp only
  split
  · rename_i h
    symm
    exact z_divmod_unique _ _ _ _ hb hex (by omega) h
  · rename_i h
    symm
    apply z_divmod_unique _ _ _ _ hb
    · simp only [Int.mul_add, Int.mul_one, Int.mul_left_comm b 2]
      omega
    · omega
    · omega

theorem z_pos_div_positive (p : RPositive) (b : RIntBinary) (hb : 0 < binaryIntTo b) :
    zPairTo (Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl p b) =
      ((positiveTo p : Int)/binaryIntTo b,(positiveTo p : Int)%binaryIntTo b) := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec with
  | xI p ih =>
    rw [z_source_step_I, ih]
    simpa [positiveTo_xI] using
      z_divmod_step (positiveTo p) (binaryIntTo b) 1 hb (by omega) (by omega)
  | xO p ih =>
    rw [z_source_step_O, ih]
    simpa [positiveTo_xO] using
      z_divmod_step (positiveTo p) (binaryIntTo b) 0 hb (by omega) (by omega)
  | xH =>
    have hc := z_leb_agrees (.Zpos (.xO .xH)) b
    rw [zToTwo] at hc
    cases h : Rocq.Corelib.BinNums.IntDef.Z.leb (.Zpos (.xO .xH)) b <;>
      simp [h, boolTo] at hc
    · change zPairTo (Rocq.Corelib.Init.Datatypes.bool.rec _ _
        (Rocq.Corelib.BinNums.IntDef.Z.leb (.Zpos (.xO .xH)) b)) = _
      rw [h]
      change (0,1) = (1/binaryIntTo b,1%binaryIntTo b)
      symm
      apply z_divmod_unique _ _ _ _ hb <;> omega
    · change zPairTo (Rocq.Corelib.Init.Datatypes.bool.rec _ _
        (Rocq.Corelib.BinNums.IntDef.Z.leb (.Zpos (.xO .xH)) b)) = _
      rw [h]
      change (1,0) = (1/binaryIntTo b,1%binaryIntTo b)
      symm
      apply z_divmod_unique _ _ _ _ hb <;> omega


def floorPairNative (a b : Int) := (a.fdiv b,a.fmod b)

theorem floorPair_pos_unique (a b q r : Int) (hb : 0 < b)
    (he : r+b*q=a) (hr0 : 0 ≤ r) (hrb : r < b) :
    floorPairNative a b = (q,r) := by
  simpa only [floorPairNative, Int.fdiv_eq_ediv_of_nonneg a (Int.le_of_lt hb),
    Int.fmod_eq_emod_of_nonneg a (Int.le_of_lt hb)] using z_divmod_unique a b q r hb he hr0 hrb

theorem floorPair_neg_unique (a b q r : Int) (hb : b < 0)
    (he : r+b*q=a) (hr0 : r ≤ 0) (hrb : b < r) :
    floorPairNative a b = (q,r) := by
  have h := floorPair_pos_unique (-a) (-b) q (-r) (by omega)
    (by simp only [Int.neg_mul]; omega) (by omega) (by omega)
  simp only [floorPairNative, Int.neg_fdiv_neg, Int.neg_fmod_neg] at h
  change (a.fdiv b,a.fmod b)=(q,r)
  apply Prod.ext
  · have hh := congrArg Prod.fst h
    exact hh
  · have h := congrArg Prod.snd h
    dsimp only at h
    omega

theorem positive_div_invariant (p b : RPositive) (q r : RIntBinary)
    (h : Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl p (.Zpos b) = .pair _ _ q r) :
    binaryIntTo r + (positiveTo b : Int)*binaryIntTo q = (positiveTo p : Int) ∧
      0 ≤ binaryIntTo r ∧ binaryIntTo r < (positiveTo b : Int) := by
  have hb : 0 < (positiveTo b : Int) := by have := positiveTo_pos b; omega
  have he := z_pos_div_positive p (.Zpos b) hb
  rw [h] at he
  have hq := congrArg Prod.fst he
  have hr := congrArg Prod.snd he
  change binaryIntTo q = (positiveTo p : Int)/(positiveTo b : Int) at hq
  change binaryIntTo r = (positiveTo p : Int)%(positiveTo b : Int) at hr
  rw [hq,hr]
  exact ⟨Int.emod_add_mul_ediv _ _,Int.emod_nonneg _ (Int.ne_of_gt hb),Int.emod_lt_of_pos _ hb⟩

theorem z_div_eucl_agrees (x y : RIntBinary) :
    zPairTo (Rocq.Corelib.BinNums.IntDef.Z.div_eucl x y) =
      floorPairNative (binaryIntTo x) (binaryIntTo y) := by
  cases x with
  | Z0 => simp [Rocq.Corelib.BinNums.IntDef.Z.div_eucl,zPairTo,zToZero,floorPairNative]
  | Zpos p =>
    cases y with
    | Z0 => simp [Rocq.Corelib.BinNums.IntDef.Z.div_eucl,zPairTo,zToZero,floorPairNative]
    | Zpos b =>
      have hb : 0 < (positiveTo b : Int) := by have := positiveTo_pos b; omega
      simpa [Rocq.Corelib.BinNums.IntDef.Z.div_eucl, floorPairNative, zToPos,
        Int.fdiv_eq_ediv_of_nonneg _ (Int.le_of_lt hb),
        Int.fmod_eq_emod_of_nonneg _ (Int.le_of_lt hb)] using z_pos_div_positive p (.Zpos b) hb
    | Zneg b =>
      have hb : 0 < (positiveTo b : Int) := by have := positiveTo_pos b; omega
      cases hd : Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl p (.Zpos b) with
      | pair q r =>
        obtain ⟨he,hr0,hrb⟩ := positive_div_invariant p b q r hd
        cases r with
        | Z0 =>
          simp only [zToZero] at he hr0 hrb
          simp only [Rocq.Corelib.BinNums.IntDef.Z.div_eucl,hd,zPairTo,z_opp_agrees,zToZero,zToPos,zToNeg]
          symm
          apply floorPair_neg_unique _ _ _ _ (by omega)
          · simp only [Int.neg_mul,Int.mul_neg]; omega
          · omega
          · omega
        | Zpos r =>
          simp only [zToPos] at he hr0 hrb
          have hrr : 0 < (positiveTo r : Int) := by have := positiveTo_pos r; omega
          simp only [Rocq.Corelib.BinNums.IntDef.Z.div_eucl,hd,zPairTo,z_opp_agrees,
            z_add_agrees,zToPos,zToNeg,positiveTo_xH,Int.natCast_one]
          symm
          apply floorPair_neg_unique _ _ _ _ (by omega)
          · simp only [Int.neg_mul,Int.mul_neg,Int.mul_add,Int.mul_one]; omega
          · omega
          · omega
        | Zneg r =>
          have hrr := positiveTo_pos r
          simp only [zToNeg] at hr0
          omega
  | Zneg p =>
    cases y with
    | Z0 => simp [Rocq.Corelib.BinNums.IntDef.Z.div_eucl,zPairTo,zToZero,floorPairNative]
    | Zpos b =>
      have hb : 0 < (positiveTo b : Int) := by have := positiveTo_pos b; omega
      cases hd : Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl p (.Zpos b) with
      | pair q r =>
        obtain ⟨he,hr0,hrb⟩ := positive_div_invariant p b q r hd
        cases r with
        | Z0 =>
          simp only [zToZero] at he hr0 hrb
          simp only [Rocq.Corelib.BinNums.IntDef.Z.div_eucl,hd,zPairTo,z_opp_agrees,zToZero,zToPos,zToNeg]
          symm
          apply floorPair_pos_unique _ _ _ _ hb
          · simp only [Int.mul_neg]; omega
          · omega
          · omega
        | Zpos r =>
          simp only [zToPos] at he hr0 hrb
          have hrr : 0 < (positiveTo r : Int) := by have := positiveTo_pos r; omega
          simp only [Rocq.Corelib.BinNums.IntDef.Z.div_eucl,hd,zPairTo,z_opp_agrees,
            z_add_agrees,z_sub_agrees,zToPos,zToNeg,positiveTo_xH,Int.natCast_one]
          symm
          apply floorPair_pos_unique _ _ _ _ hb
          · simp only [Int.mul_neg,Int.mul_add,Int.mul_one]; omega
          · omega
          · omega
        | Zneg r =>
          have hrr := positiveTo_pos r
          simp only [zToNeg] at hr0
          omega
    | Zneg b =>
      have hb : 0 < (positiveTo b : Int) := by have := positiveTo_pos b; omega
      cases hd : Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl p (.Zpos b) with
      | pair q r =>
        obtain ⟨he,hr0,hrb⟩ := positive_div_invariant p b q r hd
        simp only [Rocq.Corelib.BinNums.IntDef.Z.div_eucl,hd,zPairTo,z_opp_agrees,zToNeg]
        symm
        apply floorPair_neg_unique _ _ _ _ (by omega)
        · simp only [Int.neg_mul]; omega
        · omega
        · omega


end NativeBridge.Incremental.BinaryDivision

-- Rechecked in the FloatAxioms closure: SpecFloatDivision
set_option autoImplicit false
set_option maxHeartbeats 100000
noncomputable section
namespace NativeBridge.Incremental.SpecFloatDivision
open NativeBridge SpecFloatRepresentation SpecFloatRounding SpecFloatNormalize SpecFloatArithmetic
open BinaryInt BinaryArithmetic BinaryPower BinaryDivision

def scaledInput (m s : Int) : Int := if s < 0 then 0 else 2^s.toNat*m
def sourceScaledInput (m s : RIntBinary) : RIntBinary :=
  Rocq.Corelib.Numbers.BinNums.Z.rec m (fun _ => Rocq.Corelib.BinNums.IntDef.Z.shiftl m s)
    (fun _ => .Z0) s

theorem repeat_mul_start (x a : Int) (n : Nat) :
    repeatNative (x * ·) n a = x ^ n * a := by
  induction n with
  | zero => simp only [repeat_zero,Int.pow_zero,Int.one_mul]
  | succ n ih =>
    simp only [repeat_succ,ih,Int.pow_succ]
    rw [← Int.mul_assoc,Int.mul_comm x (x^n)]
theorem scaledInput_agrees (m s : RIntBinary) :
    binaryIntTo (sourceScaledInput m s) = scaledInput (binaryIntTo m) (binaryIntTo s) := by
  cases s with
  | Z0 => simp [sourceScaledInput,scaledInput,binaryIntTo]
  | Zpos p =>
    change binaryIntTo (Rocq.Corelib.BinNums.PosDef.Pos.iter RIntBinary
      (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH))) m p) =
      scaledInput (binaryIntTo m) (positiveTo p)
    rw [positive_iter_transport binaryIntTo _ ((2:Int)*·) (z_mul_agrees (.Zpos (.xO .xH))),repeat_mul_start]
    simp only [scaledInput,if_neg (show ¬(positiveTo p : Int)<0 by omega),Int.toNat_natCast]
  | Zneg p =>
    change 0 = scaledInput (binaryIntTo m) (-(positiveTo p : Int))
    have hp := positiveTo_pos p
    simp only [scaledInput,if_pos (show -(positiveTo p : Int)<0 by omega)]

abbrev SourceCore := Rocq.Corelib.Init.Datatypes.prod ZPair Rocq.Corelib.Floats.SpecFloat.location
def coreTo (x : SourceCore) : (Int × Int) × Option Ordering :=
  match x with | .pair _ _ (.pair _ _ m e) l => ((binaryIntTo m,binaryIntTo e),locationTo l)
def divisionResult (m b e : Int) : (Int × Int) × Option Ordering :=
  ((m.fdiv b,e),newLocation b (m.fmod b))
def sourceDivisionResult (m b e : RIntBinary) : SourceCore :=
  Rocq.Corelib.Init.Datatypes.prod.rec
    (fun q r => .pair _ _ (.pair _ _ q e) (Rocq.Corelib.Floats.SpecFloat.new_location b r))
    (Rocq.Corelib.BinNums.IntDef.Z.div_eucl m b)
theorem divisionResult_agrees (m b e : RIntBinary) :
    coreTo (sourceDivisionResult m b e) = divisionResult (binaryIntTo m) (binaryIntTo b) (binaryIntTo e) := by
  have h := z_div_eucl_agrees m b
  cases hd : Rocq.Corelib.BinNums.IntDef.Z.div_eucl m b with
  | pair q r =>
    simp only [hd,zPairTo,floorPairNative,Prod.mk.injEq] at h
    simp only [sourceDivisionResult,hd,coreTo,newLocation_agrees,divisionResult,h.1,h.2]

def divisionCore (prec emax m1 e1 m2 e2 : Int) : (Int × Int) × Option Ordering :=
  let e := min (exponent prec emax ((integerDigits m1+e1)-(integerDigits m2+e2))) (e1-e2)
  divisionResult (scaledInput m1 ((e1-e2)-e)) m2 e

theorem divisionCore_agrees (prec emax m1 e1 m2 e2 : RIntBinary) :
    coreTo (Rocq.Corelib.Floats.SpecFloat.SFdiv_core_binary prec emax m1 e1 m2 e2) =
      divisionCore (binaryIntTo prec) (binaryIntTo emax) (binaryIntTo m1) (binaryIntTo e1)
        (binaryIntTo m2) (binaryIntTo e2) := by
  change coreTo (sourceDivisionResult (sourceScaledInput m1
    (Rocq.Corelib.BinNums.IntDef.Z.sub (Rocq.Corelib.BinNums.IntDef.Z.sub e1 e2)
      (Rocq.Corelib.BinNums.IntDef.Z.min
        (Rocq.Corelib.Floats.SpecFloat.fexp prec emax
          (Rocq.Corelib.BinNums.IntDef.Z.sub
            (Rocq.Corelib.BinNums.IntDef.Z.add (Rocq.Corelib.Floats.SpecFloat.Zdigits2 m1) e1)
            (Rocq.Corelib.BinNums.IntDef.Z.add (Rocq.Corelib.Floats.SpecFloat.Zdigits2 m2) e2)))
        (Rocq.Corelib.BinNums.IntDef.Z.sub e1 e2)))) m2 _) = _
  rw [divisionResult_agrees,scaledInput_agrees]
  simp only [z_sub_agrees,z_add_agrees,minimum_agrees,exponent_agrees,integerDigits_agrees]
  rfl

def division (prec emax : Int) : nativeSpec → nativeSpec → nativeSpec
  | .nan, _ => .nan
  | _, .nan => .nan
  | .zero _, .zero _ => .nan
  | .infinity _, .infinity _ => .nan
  | .zero s, .infinity t => .zero (Bool.xor s t)
  | .zero s, .finite t _ _ => .zero (Bool.xor s t)
  | .infinity s, .zero t => .infinity (Bool.xor s t)
  | .infinity s, .finite t _ _ => .infinity (Bool.xor s t)
  | .finite s _ _, .zero t => .infinity (Bool.xor s t)
  | .finite s _ _, .infinity t => .zero (Bool.xor s t)
  | .finite s m e, .finite t n f =>
    let r := divisionCore prec emax m.val e n.val f
    roundAux prec emax (Bool.xor s t) r.1.1 r.1.2 r.2

theorem roundCore_agrees (prec emax : RIntBinary) (s : RBool) (x : SourceCore) :
    specTo (Rocq.Corelib.Init.Datatypes.prod.rec
      (fun a l => Rocq.Corelib.Init.Datatypes.prod.rec
        (fun m e => Rocq.Corelib.Floats.SpecFloat.binary_round_aux prec emax s m e l) a) x) =
      roundAux (binaryIntTo prec) (binaryIntTo emax) (boolTo s) (coreTo x).1.1 (coreTo x).1.2 (coreTo x).2 := by
  cases x with
  | pair a l => cases a; exact roundAux_agrees _ _ _ _ _ _
theorem division_agrees (prec emax : RIntBinary) (x y : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    specTo (Rocq.Corelib.Floats.SpecFloat.SFdiv prec emax x y) =
      division (binaryIntTo prec) (binaryIntTo emax) (specTo x) (specTo y) := by
  cases x with
  | S754_zero s =>
    cases y with
    | S754_zero t =>
      cases s <;> cases t <;> rfl
    | S754_infinity t =>
      cases s <;> cases t <;> rfl
    | S754_nan =>
      cases s <;> rfl
    | S754_finite t n f =>
      cases s <;> cases t <;> rfl
  | S754_infinity s =>
    cases y with
    | S754_zero t =>
      cases s <;> cases t <;> rfl
    | S754_infinity t =>
      cases s <;> cases t <;> rfl
    | S754_nan =>
      cases s <;> rfl
    | S754_finite t n f =>
      cases s <;> cases t <;> rfl
  | S754_nan =>
    cases y with
    | S754_zero t =>
      cases t <;> rfl
    | S754_infinity t =>
      cases t <;> rfl
    | S754_nan =>
      rfl
    | S754_finite t n f =>
      cases t <;> rfl
  | S754_finite s m e =>
    cases y with
    | S754_zero t =>
      cases s <;> cases t <;> rfl
    | S754_infinity t =>
      cases s <;> cases t <;> rfl
    | S754_nan =>
      cases s <;> rfl
    | S754_finite t n f =>
      unfold Rocq.Corelib.Floats.SpecFloat.SFdiv
      rw [roundCore_agrees,divisionCore_agrees]
      cases s <;> cases t <;> rfl

end NativeBridge.Incremental.SpecFloatDivision

-- Rechecked in the FloatAxioms closure: SpecFloatSqrtSupport
set_option autoImplicit false
set_option maxHeartbeats 200000
noncomputable section
namespace NativeBridge.Incremental.BinaryNatSub
open NativeBridge
-- Recover the exact second component of the unchanged source mutual recursor.
-- The outer projection is checked explicitly; inner recursive projections stay unchanged.
run_cmd Lean.Elab.Command.liftTermElabM do
  let ci ← Lean.getConstInfo "Rocq.Corelib.BinNums.PosDef.Pos.sub_mask".toName
  let .defnInfo di := ci | throwError "Expected source definition"
  let .lam xn xt (.lam yn yt (.app (.proj pn 0 pair) arg) ybi) xbi := di.value
    | throwError "Unexpected source mutual-recursion projection"
  let value := Lean.Expr.lam xn xt (.lam yn yt (.app (.proj pn 1 pair) arg) ybi) xbi
  Lean.addDecl (.defnDecl {di with name := "NativeBridge.Incremental.BinaryNatSub.subCarryAux".toName,value:=value})
abbrev RMask := Rocq.Corelib.BinNums.PosDef.Pos.mask
def maskTo : RMask → Option Nat :=
  Rocq.Corelib.BinNums.PosDef.Pos.mask.rec (some 0) (fun p => some (positiveTo p)) none
def maskOf : Option Nat → RMask
  | none => .IsNeg
  | some 0 => .IsNul
  | some (n+1) => .IsPos (positiveOf (n+1))
@[simp] theorem mask_to_of (n : Option Nat) : maskTo (maskOf n) = n := by
  cases n with
  | none => rfl
  | some n =>
    cases n with
    | zero => rfl
    | succ n =>
      change some (positiveTo (positiveOf (n+1))) = some (n+1)
      rw [positive_to_of _ (by omega)]
@[simp] theorem mask_of_to (m : RMask) : maskOf (maskTo m) = m := by
  cases m with
  | IsNul => rfl
  | IsNeg => rfl
  | IsPos p =>
    change maskOf (some (positiveTo p)) = .IsPos p
    have hp := positiveTo_pos p
    cases hn : positiveTo p with
    | zero => omega
    | succ n =>
      change Rocq.Corelib.BinNums.PosDef.Pos.mask.IsPos (positiveOf (n+1)) = .IsPos p
      apply congrArg Rocq.Corelib.BinNums.PosDef.Pos.mask.IsPos
      rw [←hn]; exact positive_of_to p
def maskIso : Iso Rocq.Corelib.BinNums.PosDef.Pos.mask (Option Nat) := ⟨maskTo,maskOf,mask_of_to,mask_to_of⟩

theorem positive_pred_double_agrees (p : RPositive) :
    positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p) = 2*positiveTo p-1 := by
  induction p with
  | xI p ih => change 2*(2*positiveTo p)+1 = 2*(2*positiveTo p+1)-1; omega
  | xO p ih =>
    change 2*positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p)+1 = 2*(2*positiveTo p)-1
    rw [ih]; have := positiveTo_pos p; omega
  | xH => rfl

theorem double_mask_agrees (m : RMask) :
    maskTo (Rocq.Corelib.BinNums.PosDef.Pos.double_mask m) = (maskTo m).map (2*·) := by
  cases m <;> rfl
theorem succ_double_mask_agrees (m : RMask) :
    maskTo (Rocq.Corelib.BinNums.PosDef.Pos.succ_double_mask m) = (maskTo m).map (fun n => 2*n+1) := by
  cases m <;> rfl
theorem double_pred_mask_agrees (p : RPositive) :
    maskTo (Rocq.Corelib.BinNums.PosDef.Pos.double_pred_mask p) = some (2*positiveTo p-2) := by
  cases p with
  | xI p => change some (2*(2*positiveTo p)) = some (2*(2*positiveTo p+1)-2); congr 1 <;> omega
  | xO p =>
    change some (2*positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p)) = some (2*(2*positiveTo p)-2)
    rw [positive_pred_double_agrees]; have := positiveTo_pos p; congr 1 <;> omega
  | xH => rfl

def checkedSub (n m : Nat) : Option Nat := if m ≤ n then some (n-m) else none



theorem sub_ii (n m : Nat) :
    (checkedSub n (m)).map (fun k => 2*k+0) = checkedSub (2*n+1) (2*m+1) := by
  unfold checkedSub
  split <;> split <;> simp_all
  all_goals first | omega | (congr 1 <;> omega)

theorem sub_oo (n m : Nat) :
    (checkedSub n (m)).map (fun k => 2*k+0) = checkedSub (2*n) (2*m) := by
  unfold checkedSub
  split <;> split <;> simp_all
  all_goals first | omega | (congr 1 <;> omega)

theorem sub_io (n m : Nat) :
    (checkedSub n (m)).map (fun k => 2*k+1) = checkedSub (2*n+1) (2*m) := by
  unfold checkedSub
  split <;> split <;> simp_all
  all_goals first | omega | (congr 1 <;> omega)

theorem sub_oi (n m : Nat) :
    (checkedSub n (m+1)).map (fun k => 2*k+1) = checkedSub (2*n) (2*m+1) := by
  unfold checkedSub
  split <;> split <;> simp_all
  all_goals first | omega | (congr 1 <;> omega)

theorem sub_iic (n m : Nat) :
    (checkedSub n (m+1)).map (fun k => 2*k+1) = checkedSub (2*n+1) (2*m+2) := by
  unfold checkedSub
  split <;> split <;> simp_all
  all_goals first | omega | (congr 1 <;> omega)

theorem sub_oic (n m : Nat) :
    (checkedSub n (m+1)).map (fun k => 2*k+0) = checkedSub (2*n) (2*m+2) := by
  unfold checkedSub
  split <;> split <;> simp_all
  all_goals first | omega | (congr 1 <;> omega)


theorem sub_mask_ii (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask (.xI p) (.xI q) = Rocq.Corelib.BinNums.PosDef.Pos.double_mask (Rocq.Corelib.BinNums.PosDef.Pos.sub_mask p q) := rfl
theorem sub_mask_carry_ii (p : RPositive) (q : RPositive) : NativeBridge.Incremental.BinaryNatSub.subCarryAux (.xI p) (.xI q) = Rocq.Corelib.BinNums.PosDef.Pos.succ_double_mask (NativeBridge.Incremental.BinaryNatSub.subCarryAux p q) := rfl
theorem sub_mask_oi (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask (.xO p) (.xI q) = Rocq.Corelib.BinNums.PosDef.Pos.succ_double_mask (NativeBridge.Incremental.BinaryNatSub.subCarryAux p q) := rfl
theorem sub_mask_carry_oi (p : RPositive) (q : RPositive) : NativeBridge.Incremental.BinaryNatSub.subCarryAux (.xO p) (.xI q) = Rocq.Corelib.BinNums.PosDef.Pos.double_mask (NativeBridge.Incremental.BinaryNatSub.subCarryAux p q) := rfl
theorem sub_mask_io (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask (.xI p) (.xO q) = Rocq.Corelib.BinNums.PosDef.Pos.succ_double_mask (Rocq.Corelib.BinNums.PosDef.Pos.sub_mask p q) := rfl
theorem sub_mask_carry_io (p : RPositive) (q : RPositive) : NativeBridge.Incremental.BinaryNatSub.subCarryAux (.xI p) (.xO q) = Rocq.Corelib.BinNums.PosDef.Pos.double_mask (Rocq.Corelib.BinNums.PosDef.Pos.sub_mask p q) := rfl
theorem sub_mask_oo (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask (.xO p) (.xO q) = Rocq.Corelib.BinNums.PosDef.Pos.double_mask (Rocq.Corelib.BinNums.PosDef.Pos.sub_mask p q) := rfl
theorem sub_mask_carry_oo (p : RPositive) (q : RPositive) : NativeBridge.Incremental.BinaryNatSub.subCarryAux (.xO p) (.xO q) = Rocq.Corelib.BinNums.PosDef.Pos.succ_double_mask (NativeBridge.Incremental.BinaryNatSub.subCarryAux p q) := rfl
theorem sub_mask_ih (p : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask (.xI p) (.xH) = .IsPos (.xO p) := rfl
theorem sub_mask_carry_ih (p : RPositive) : NativeBridge.Incremental.BinaryNatSub.subCarryAux (.xI p) (.xH) = .IsPos (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p) := rfl
theorem sub_mask_oh (p : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask (.xO p) (.xH) = .IsPos (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p) := rfl
theorem sub_mask_carry_oh (p : RPositive) : NativeBridge.Incremental.BinaryNatSub.subCarryAux (.xO p) (.xH) = Rocq.Corelib.BinNums.PosDef.Pos.double_pred_mask p := rfl
theorem sub_mask_hi (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask (.xH) (.xI q) = .IsNeg := rfl
theorem sub_mask_carry_hi (q : RPositive) : NativeBridge.Incremental.BinaryNatSub.subCarryAux (.xH) (.xI q) = .IsNeg := rfl
theorem sub_mask_ho (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask (.xH) (.xO q) = .IsNeg := rfl
theorem sub_mask_carry_ho (q : RPositive) : NativeBridge.Incremental.BinaryNatSub.subCarryAux (.xH) (.xO q) = .IsNeg := rfl
theorem sub_mask_hh  : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask (.xH) (.xH) = .IsNul := rfl
theorem sub_mask_carry_hh  : NativeBridge.Incremental.BinaryNatSub.subCarryAux (.xH) (.xH) = .IsNeg := rfl

theorem sub_mask_pair (p q : RPositive) :
    maskTo (Rocq.Corelib.BinNums.PosDef.Pos.sub_mask p q) = checkedSub (positiveTo p) (positiveTo q) ∧
    maskTo (NativeBridge.Incremental.BinaryNatSub.subCarryAux p q) = checkedSub (positiveTo p) (positiveTo q+1) := by
  induction q generalizing p with
  | xI q ih =>
    cases p with
    | xI p =>
      have h := ih p
      simp only [sub_mask_ii,sub_mask_carry_ii,double_mask_agrees,succ_double_mask_agrees,h.1,h.2,positiveTo_xI]
      constructor
      · exact sub_ii _ _
      · exact sub_iic _ _
    | xO p =>
      have h := ih p
      simp only [sub_mask_oi,sub_mask_carry_oi,double_mask_agrees,succ_double_mask_agrees,h.2,positiveTo_xI,positiveTo_xO]
      constructor
      · exact sub_oi _ _
      · exact sub_oic _ _
    | xH =>
      have hp := positiveTo_pos q
      change none = checkedSub 1 (2*positiveTo q+1) ∧ none = checkedSub 1 (2*positiveTo q+1+1)
      unfold checkedSub
      simp only [if_neg (by omega : ¬2*positiveTo q+1 ≤ 1),if_neg (by omega : ¬2*positiveTo q+1+1 ≤ 1)]
      constructor <;> first | rfl | trivial
  | xO q ih =>
    cases p with
    | xI p =>
      have h := ih p
      simp only [sub_mask_io,sub_mask_carry_io,double_mask_agrees,succ_double_mask_agrees,h.1,positiveTo_xI,positiveTo_xO]
      constructor
      · exact sub_io _ _
      · exact sub_ii _ _
    | xO p =>
      have h := ih p
      simp only [sub_mask_oo,sub_mask_carry_oo,double_mask_agrees,succ_double_mask_agrees,h.1,h.2,positiveTo_xO]
      constructor
      · exact sub_oo _ _
      · exact sub_oi _ _
    | xH =>
      have hp := positiveTo_pos q
      change none = checkedSub 1 (2*positiveTo q) ∧ none = checkedSub 1 (2*positiveTo q+1)
      unfold checkedSub
      simp only [if_neg (by omega : ¬2*positiveTo q ≤ 1),if_neg (by omega : ¬2*positiveTo q+1 ≤ 1)]
      constructor <;> first | rfl | trivial
  | xH =>
    cases p with
    | xI p =>
      have hp := positiveTo_pos p
      simp only [sub_mask_ih,sub_mask_carry_ih,maskTo,positiveTo_xI,positiveTo_xO,positiveTo_xH,positive_pred_double_agrees]
      unfold checkedSub
      simp only [if_pos (by omega : 1 ≤ 2*positiveTo p+1),if_pos (by omega : 1+1 ≤ 2*positiveTo p+1)]
      constructor <;> congr 1 <;> omega
    | xO p =>
      have hp := positiveTo_pos p
      rw [sub_mask_oh,sub_mask_carry_oh,double_pred_mask_agrees]
      simp only [maskTo,positiveTo_xO,positiveTo_xH,positive_pred_double_agrees]
      unfold checkedSub
      simp only [if_pos (by omega : 1 ≤ 2*positiveTo p),if_pos (by omega : 1+1 ≤ 2*positiveTo p)]
      constructor <;> first | rfl | trivial
    | xH => constructor <;> first | rfl | trivial

theorem sub_mask_agrees (p q : RPositive) :
    maskTo (Rocq.Corelib.BinNums.PosDef.Pos.sub_mask p q) = checkedSub (positiveTo p) (positiveTo q) :=
  (sub_mask_pair p q).1
theorem sub_mask_carry_agrees (p q : RPositive) :
    maskTo (NativeBridge.Incremental.BinaryNatSub.subCarryAux p q) = checkedSub (positiveTo p) (positiveTo q+1) :=
  (sub_mask_pair p q).2



end NativeBridge.Incremental.BinaryNatSub
namespace NativeBridge.Incremental.BinarySqrtRem
open NativeBridge BinaryInt BinaryOrder BinaryArithmetic BinaryNatSub BinaryDivision
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

theorem positive_leb_agrees (p q : RPositive) :
    boolTo (Rocq.Corelib.BinNums.PosDef.Pos.leb p q) = decide (positiveTo p ≤ positiveTo q) := by
  unfold Rocq.Corelib.BinNums.PosDef.Pos.leb
  rw [compare_leb,positive_compare_agrees]; exact native_leb _ _

abbrev SqrtPair := Rocq.Corelib.Init.Datatypes.prod RPositive RMask
abbrev sqrtPairTo (x : SqrtPair) : Nat × Option Nat :=
  match x with | .pair _ _ s r => (positiveTo s,maskTo r)

@[simp] theorem maskTo_nul : maskTo (.IsNul) = some 0 := rfl
@[simp] theorem maskTo_neg : maskTo (.IsNeg) = none := rfl
@[simp] theorem maskTo_pos (p : RPositive) : maskTo (.IsPos p) = some (positiveTo p) := rfl

def sqrtStepNative (f g : Nat → Nat) (x : Nat × Option Nat) : Nat × Option Nat :=
  match x.2 with
  | none => (2*x.1, checkedSub (g (f 1)) 4)
  | some r =>
    if r = 0 then (2*x.1, checkedSub (g (f 1)) 4)
    else if 4*x.1+1 ≤ g (f r) then
      (2*x.1+1, checkedSub (g (f r)) (4*x.1+1))
    else (2*x.1,some (g (f r)))

theorem sqrtrem_step_agrees (f g : RPositive → RPositive) (F G : Nat → Nat)
    (hf : ∀ p, positiveTo (f p) = F (positiveTo p))
    (hg : ∀ p, positiveTo (g p) = G (positiveTo p)) (x : SqrtPair) :
    sqrtPairTo (Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem_step f g x) =
      sqrtStepNative F G (sqrtPairTo x) := by
  cases x with
  | pair s r =>
    cases r with
    | IsNul => simp [Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem_step,sqrtPairTo,
        sqrtStepNative,positiveTo_xO,sub_mask_agrees,hg,hf,positiveTo_xH]
    | IsNeg => simp [Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem_step,sqrtPairTo,
        sqrtStepNative,positiveTo_xO,sub_mask_agrees,hg,hf,positiveTo_xH]
    | IsPos r =>
      have hr := positiveTo_pos r
      have hc := positive_leb_agrees (.xI (.xO s)) (g (f r))
      simp only [positiveTo_xI,positiveTo_xO,hg,hf] at hc
      have hm : 2*(2*positiveTo s)+1 = 4*positiveTo s+1 := by omega
      rw [hm] at hc
      cases hb : Rocq.Corelib.BinNums.PosDef.Pos.leb (.xI (.xO s)) (g (f r)) <;>
        simp [hb,boolTo] at hc <;>
        simp [Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem_step,hb,sqrtPairTo,sqrtStepNative,
          positiveTo_xI,positiveTo_xO,sub_mask_agrees,hg,hf,hm,
          Nat.ne_of_gt hr,hc]
      all_goals rw [if_neg (by omega)]

theorem source_ii (p : RPositive) :
    Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem (.xI (.xI p)) =
      Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem_step (.xI) (.xI)
        (Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem p) := by rfl
theorem source_oi (p : RPositive) :
    Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem (.xI (.xO p)) =
      Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem_step (.xO) (.xI)
        (Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem p) := by rfl
theorem source_io (p : RPositive) :
    Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem (.xO (.xI p)) =
      Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem_step (.xI) (.xO)
        (Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem p) := by rfl
theorem source_oo (p : RPositive) :
    Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem (.xO (.xO p)) =
      Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem_step (.xO) (.xO)
        (Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem p) := by rfl

def SqrtInvariant (n : Nat) (x : Nat × Option Nat) : Prop :=
  ∃ s r, x = (s,some r) ∧ 0 < s ∧ n = s*s+r ∧ r < 2*s+1

theorem native_step_invariant (n s r a b : Nat)
    (hs : 0 < s) (hn : n = s*s+r) (hr : r < 2*s+1) (ha : a ≤ 1) (hb : b ≤ 1) :
    SqrtInvariant (4*n+2*a+b)
      (sqrtStepNative (fun k => 2*k+a) (fun k => 2*k+b) (s,some r)) := by
  have sq0 : (2*s)*(2*s) = 4*(s*s) := by
    change (2*s)*(2*s) = (2*2)*(s*s)
    ac_rfl
  have sq1 : (2*s+1)*(2*s+1) = 4*(s*s)+4*s+1 := by
    simp only [Nat.add_mul,Nat.mul_add,Nat.one_mul,Nat.mul_one]
    rw [sq0]
    omega
  by_cases hz : r = 0
  · refine ⟨2*s,2*a+b,?_,by omega,?_,by omega⟩
    · simp only [sqrtStepNative,hz]
      have hle : 4 ≤ 2*(2*1+a)+b := by omega
      simp only [checkedSub,if_pos hle]
      have he : 2*(2*1+a)+b-4 = 2*a+b := by omega
      simp only [he,ite_true]
    · rw [sq0]; omega
  · by_cases ht : 4*s+1 ≤ 2*(2*r+a)+b
    · refine ⟨2*s+1,2*(2*r+a)+b-(4*s+1),?_,by omega,?_,?_⟩
      · simp [sqrtStepNative,hz,ht,checkedSub]
      · rw [sq1]; omega
      · omega
    · refine ⟨2*s,2*(2*r+a)+b,?_,by omega,?_,by omega⟩
      · simp [sqrtStepNative,hz,ht]
      · rw [sq0]; omega

theorem invariant_step (f g : RPositive → RPositive) (a b : Nat)
    (hf : ∀ p, positiveTo (f p) = 2*positiveTo p+a)
    (hg : ∀ p, positiveTo (g p) = 2*positiveTo p+b)
    (ha : a ≤ 1) (hb : b ≤ 1) (n : Nat) (x : SqrtPair)
    (h : SqrtInvariant n (sqrtPairTo x)) :
    SqrtInvariant (4*n+2*a+b)
      (sqrtPairTo (Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem_step f g x)) := by
  rw [sqrtrem_step_agrees f g (fun k => 2*k+a) (fun k => 2*k+b) hf hg]
  obtain ⟨s,r,hx,hs,hn,hr⟩ := h
  rw [hx]
  exact native_step_invariant n s r a b hs hn hr ha hb

theorem sqrtrem_invariant (p : RPositive) :
    SqrtInvariant (positiveTo p) (sqrtPairTo (Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem p)) := by
  have h : ∀ p : RPositive,
      SqrtInvariant (positiveTo p) (sqrtPairTo (Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem p)) ∧
      SqrtInvariant (positiveTo (.xI p)) (sqrtPairTo (Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem (.xI p))) ∧
      SqrtInvariant (positiveTo (.xO p)) (sqrtPairTo (Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem (.xO p))) := by
    intro p
    induction p with
    | xH => exact ⟨⟨1,0,rfl,by decide,rfl,by decide⟩,
        ⟨1,2,rfl,by decide,rfl,by decide⟩,⟨1,1,rfl,by decide,rfl,by decide⟩⟩
    | xI p ih =>
      refine ⟨ih.2.1,?_,?_⟩
      · rw [source_ii]
        have hh := invariant_step (.xI) (.xI) 1 1 positiveTo_xI positiveTo_xI
          (by decide) (by decide) _ _ ih.1
        simp only [positiveTo_xI]
        have he : 2*(2*positiveTo p+1)+1 = 4*positiveTo p+2*1+1 := by omega
        rw [he]
        exact hh
      · rw [source_io]
        have hh := invariant_step (.xI) (.xO) 1 0 positiveTo_xI
          (fun p => by simp [positiveTo_xO])
          (by decide) (by decide) _ _ ih.1
        simp only [positiveTo_xI,positiveTo_xO]
        have he : 2*(2*positiveTo p+1) = 4*positiveTo p+2*1+0 := by omega
        rw [he]
        exact hh
    | xO p ih =>
      refine ⟨ih.2.2,?_,?_⟩
      · rw [source_oi]
        have hh := invariant_step (.xO) (.xI) 0 1
          (fun p => by simp [positiveTo_xO]) positiveTo_xI
          (by decide) (by decide) _ _ ih.1
        simp only [positiveTo_xI,positiveTo_xO]
        have he : 2*(2*positiveTo p)+1 = 4*positiveTo p+2*0+1 := by omega
        rw [he]
        exact hh
      · rw [source_oo]
        have hh := invariant_step (.xO) (.xO) 0 0
          (fun p => by simp [positiveTo_xO])
          (fun p => by simp [positiveTo_xO])
          (by decide) (by decide) _ _ ih.1
        simp only [positiveTo_xO]
        have he : 2*(2*positiveTo p) = 4*positiveTo p+2*0+0 := by omega
        rw [he]
        exact hh
  exact (h p).1

-- Native uniqueness proof shared in form with NatIterators; no source closure imported.
theorem sqrt_unique (n p : Nat) (hl : p*p ≤ n) (hu : n < (p+1)*(p+1)) :
    p = Nat.sqrt n := by
  have hsl := Nat.sqrt_le n
  have hsu := Nat.lt_succ_sqrt n
  change n < (Nat.sqrt n+1)*(Nat.sqrt n+1) at hsu
  apply Nat.le_antisymm
  · by_cases hn : p ≤ Nat.sqrt n
    · exact hn
    have h : Nat.sqrt n + 1 ≤ p := by omega
    have hm := Nat.mul_le_mul h h
    omega
  · by_cases hn : Nat.sqrt n ≤ p
    · exact hn
    have h : p+1 ≤ Nat.sqrt n := by omega
    have hm := Nat.mul_le_mul h h
    omega


def sqrtRemNative (n : Nat) : Nat × Option Nat :=
  (Nat.sqrt n, some (n-Nat.sqrt n*Nat.sqrt n))

theorem sqrtrem_agrees (p : RPositive) :
    sqrtPairTo (Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem p) =
      sqrtRemNative (positiveTo p) := by
  obtain ⟨s,r,hx,hs,hn,hr⟩ := sqrtrem_invariant p
  have hl : s*s ≤ positiveTo p := by omega
  have hu : positiveTo p < (s+1)*(s+1) := by
    simp only [Nat.add_mul,Nat.mul_add,Nat.one_mul,Nat.mul_one]
    omega
  have he := sqrt_unique (positiveTo p) s hl hu
  rw [hx, sqrtRemNative, ←he]
  congr 2
  omega

def zSqrtRemNative (z : Int) : Int × Int :=
  (Int.ofNat (Nat.sqrt z.toNat),
    Int.ofNat (z.toNat-Nat.sqrt z.toNat*Nat.sqrt z.toNat))

theorem z_sqrtrem_agrees (z : RIntBinary) :
    zPairTo (Rocq.Corelib.BinNums.IntDef.Z.sqrtrem z) =
      zSqrtRemNative (binaryIntTo z) := by
  cases z with
  | Z0 => rfl
  | Zneg p =>
    change (0,0) = zSqrtRemNative (-Int.ofNat (positiveTo p))
    simp [zSqrtRemNative]
    rfl
  | Zpos p =>
    have h := sqrtrem_agrees p
    cases hx : Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem p with
    | pair s r =>
      rw [hx] at h
      cases r with
      | IsNul =>
        simp only [sqrtPairTo,maskTo_nul,sqrtRemNative,Prod.mk.injEq,Option.some.injEq] at h
        simp [Rocq.Corelib.BinNums.IntDef.Z.sqrtrem,hx,zPairTo,zSqrtRemNative,
          zToPos,zToZero,h.1,←h.2]
      | IsPos r =>
        simp only [sqrtPairTo,maskTo_pos,sqrtRemNative,Prod.mk.injEq,Option.some.injEq] at h
        simp [Rocq.Corelib.BinNums.IntDef.Z.sqrtrem,hx,zPairTo,zSqrtRemNative,
          zToPos,h.1,h.2]
      | IsNeg =>
        simp [sqrtPairTo,sqrtRemNative] at h


end NativeBridge.Incremental.BinarySqrtRem
namespace NativeBridge.Incremental.BinaryOrder
open NativeBridge
theorem positive_div2_up_agrees (p : RPositive) :
    positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.div2_up p) = (positiveTo p+1)/2 := by
  cases p with
  | xI p =>
    change positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.succ p) = (2*positiveTo p+1+1)/2
    rw [positive_succ_agrees]; omega
  | xO p => change positiveTo p = (2*positiveTo p+1)/2; omega
  | xH => rfl
end NativeBridge.Incremental.BinaryOrder
namespace NativeBridge.Incremental.BinaryInt
open NativeBridge BinaryOrder
theorem z_div2_agrees (z : RIntBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.div2 z) = binaryIntTo z / 2 := by
  cases z with
  | Z0 => rfl
  | Zpos p =>
    cases p with
    | xI p => change (positiveTo p : Int) = (2*positiveTo p+1 : Int)/2; omega
    | xO p => change (positiveTo p : Int) = (2*positiveTo p : Int)/2; omega
    | xH => rfl
  | Zneg p =>
    change -(positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.div2_up p) : Int) = (-(positiveTo p : Int))/2
    rw [positive_div2_up_agrees]; omega

end NativeBridge.Incremental.BinaryInt

-- Rechecked in the FloatAxioms closure: SpecFloatSqrt
set_option autoImplicit false
set_option maxHeartbeats 100000
noncomputable section
namespace NativeBridge.Incremental.SpecFloatSqrt
open NativeBridge SpecFloatRepresentation SpecFloatRounding SpecFloatNormalize SpecFloatArithmetic SpecFloatDivision
open BinaryInt BinaryArithmetic BinaryPower BinaryDivision BinarySqrtRem

def sqrtLocation (q r : Int) : Option Ordering :=
  if r=0 then none else some (if r≤q then .lt else .gt)
def sourceSqrtLocation (q r : RIntBinary) : Rocq.Corelib.Floats.SpecFloat.location :=
  Rocq.Corelib.Init.Datatypes.bool.rec .loc_Exact
    (.loc_Inexact (Rocq.Corelib.Init.Datatypes.bool.rec .Lt .Gt
      (Rocq.Corelib.BinNums.IntDef.Z.leb r q)))
    (Rocq.Corelib.BinNums.IntDef.Z.eqb r .Z0)

theorem sqrtLocation_agrees (q r : RIntBinary) :
    locationTo (sourceSqrtLocation q r) = sqrtLocation (binaryIntTo q) (binaryIntTo r) := by
  unfold sourceSqrtLocation
  rw [choose_map locationTo,eqb_agrees]
  change (if decide (binaryIntTo r=0) then none else
    some (comparisonTo (Rocq.Corelib.Init.Datatypes.bool.rec .Lt .Gt
      (Rocq.Corelib.BinNums.IntDef.Z.leb r q)))) = _
  rw [choose_map comparisonTo,z_leb_agrees]
  simp only [decide_eq_true_eq,comparisonTo,sqrtLocation]

def sqrtResult (m e : Int) : (Int × Int) × Option Ordering :=
  let r := zSqrtRemNative m
  ((r.1,e),sqrtLocation r.1 r.2)
def sourceSqrtResult (m e : RIntBinary) : SourceCore :=
  Rocq.Corelib.Init.Datatypes.prod.rec
    (fun q r => .pair _ _ (.pair _ _ q e) (sourceSqrtLocation q r))
    (Rocq.Corelib.BinNums.IntDef.Z.sqrtrem m)
theorem sqrtResult_agrees (m e : RIntBinary) :
    coreTo (sourceSqrtResult m e) = sqrtResult (binaryIntTo m) (binaryIntTo e) := by
  have h := z_sqrtrem_agrees m
  cases hd : Rocq.Corelib.BinNums.IntDef.Z.sqrtrem m with
  | pair q r =>
    have hq := congrArg Prod.fst h
    have hr := congrArg Prod.snd h
    simp only [hd] at hq hr
    simp only [sourceSqrtResult,hd,coreTo,sqrtLocation_agrees,sqrtResult,hq,hr]

def sqrtCore (prec emax m e : Int) : (Int × Int) × Option Ordering :=
  let e' := min (exponent prec emax ((integerDigits m+e+1)/2)) (e/2)
  sqrtResult (scaledInput m (e-2*e')) e'
theorem sqrtCore_agrees (prec emax m e : RIntBinary) :
    coreTo (Rocq.Corelib.Floats.SpecFloat.SFsqrt_core_binary prec emax m e) =
      sqrtCore (binaryIntTo prec) (binaryIntTo emax) (binaryIntTo m) (binaryIntTo e) := by
  change coreTo (sourceSqrtResult (sourceScaledInput m
    (Rocq.Corelib.BinNums.IntDef.Z.sub e
      (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH))
        (Rocq.Corelib.BinNums.IntDef.Z.min
          (Rocq.Corelib.Floats.SpecFloat.fexp prec emax
            (Rocq.Corelib.BinNums.IntDef.Z.div2
              (Rocq.Corelib.BinNums.IntDef.Z.add
                (Rocq.Corelib.BinNums.IntDef.Z.add (Rocq.Corelib.Floats.SpecFloat.Zdigits2 m) e)
                (.Zpos .xH))))
          (Rocq.Corelib.BinNums.IntDef.Z.div2 e))))) _) = _
  rw [sqrtResult_agrees,scaledInput_agrees]
  simp only [z_sub_agrees,z_mul_agrees,minimum_agrees,exponent_agrees,z_div2_agrees,
    z_add_agrees,integerDigits_agrees,zToOne,zToTwo]
  rfl

def squareRoot (prec emax : Int) : nativeSpec → nativeSpec
  | .zero s => .zero s
  | .infinity s => if s then .nan else .infinity s
  | .nan => .nan
  | .finite s m e =>
    if s then .nan else
      let r := sqrtCore prec emax m.val e
      roundAux prec emax false r.1.1 r.1.2 r.2

theorem squareRoot_agrees (prec emax : RIntBinary) (x : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    specTo (Rocq.Corelib.Floats.SpecFloat.SFsqrt prec emax x) =
      squareRoot (binaryIntTo prec) (binaryIntTo emax) (specTo x) := by
  cases x with
  | S754_zero s => cases s <;> rfl
  | S754_infinity s => cases s <;> rfl
  | S754_nan => rfl
  | S754_finite s m e =>
    cases s with
    | true => rfl
    | false =>
      unfold Rocq.Corelib.Floats.SpecFloat.SFsqrt
      change specTo (Rocq.Corelib.Init.Datatypes.prod.rec
        (fun a l => Rocq.Corelib.Init.Datatypes.prod.rec
          (fun m e => Rocq.Corelib.Floats.SpecFloat.binary_round_aux prec emax .false m e l) a)
        (Rocq.Corelib.Floats.SpecFloat.SFsqrt_core_binary prec emax (.Zpos m) e)) = _
      rw [roundCore_agrees,sqrtCore_agrees]
      rfl

end NativeBridge.Incremental.SpecFloatSqrt

-- Rechecked in the FloatAxioms closure: PrimFloatRepresentation
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
def comparisonTo : Rocq.Corelib.Floats.PrimFloat.float_comparison → nativeComparison
  | .FEq => some .eq
  | .FLt => some .lt
  | .FGt => some .gt
  | .FNotComparable => none
def comparisonOf : nativeComparison → Rocq.Corelib.Floats.PrimFloat.float_comparison
  | some .eq => .FEq
  | some .lt => .FLt
  | some .gt => .FGt
  | none => .FNotComparable
def comparisonIso : Iso Rocq.Corelib.Floats.PrimFloat.float_comparison nativeComparison where
  to := comparisonTo
  of := comparisonOf
  of_to x := by cases x <;> rfl
  to_of x := by cases x with
    | none => rfl
    | some c => cases c <;> rfl

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
theorem bitsEqual_agrees (x y : Rocq.Corelib.Floats.PrimFloat.float) :
    boolTo (Rocq.Corelib.Floats.PrimFloat.Leibniz.eqb x y) = bitsEqual (floatTo x) (floatTo y) := by
  unfold Rocq.Corelib.Floats.PrimFloat.Leibniz.eqb
  rw [boolAdapter]
  simp only [Rocq2Lean.PrimFloat.equal,bitsEqual,toBits_agrees]
theorem less_helper (x y : Rocq.Corelib.Floats.PrimFloat.float) :
    Rocq2Lean.PrimFloat.ltb x y = less (floatTo x) (floatTo y) := by
  simp only [Rocq2Lean.PrimFloat.ltb,less,isNaN_helper,ieeeEqual_helper,sign_agrees,toBits_agrees]
theorem less_agrees (x y : Rocq.Corelib.Floats.PrimFloat.float) :
    boolTo (Rocq.Corelib.Floats.PrimFloat.ltb x y) = less (floatTo x) (floatTo y) := by
  unfold Rocq.Corelib.Floats.PrimFloat.ltb
  rw [boolAdapter,less_helper]
theorem lessEqual_agrees (x y : Rocq.Corelib.Floats.PrimFloat.float) :
    boolTo (Rocq.Corelib.Floats.PrimFloat.leb x y) = lessEqual (floatTo x) (floatTo y) := by
  unfold Rocq.Corelib.Floats.PrimFloat.leb
  rw [boolAdapter]
  simp only [Rocq2Lean.PrimFloat.leb,lessEqual,ieeeEqual_helper,less_helper]
theorem comparison_agrees (x y : Rocq.Corelib.Floats.PrimFloat.float) :
    comparisonTo (Rocq.Corelib.Floats.PrimFloat.compare x y) = comparison (floatTo x) (floatTo y) := by
  simp only [Rocq.Corelib.Floats.PrimFloat.compare,Rocq2Lean.PrimFloat.compare,less_helper,ieeeEqual_helper,comparison]
  split <;> first | rfl | (split <;> first | rfl | (split <;> rfl))


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
theorem classification_agrees (x : Rocq.Corelib.Floats.PrimFloat.float) :
    floatClassTo (Rocq.Corelib.Floats.PrimFloat.classify x) = classification (floatTo x) := by
  cases x with
  | nan => rfl
  | infinity s => cases s <;> rfl
  | finite s e f =>
    unfold Rocq.Corelib.Floats.PrimFloat.classify Rocq2Lean.PrimFloat.classify
    simp only [floatTo,classification]
    split <;> first | (split <;> cases s <;> rfl) | (cases s <;> rfl)

end NativeBridge.Incremental.PrimFloatRepresentation

-- Rechecked in the FloatAxioms closure: PrimFloatArithmetic
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

def addition (x y : nativeFloat) : nativeFloat :=
  match x with
  | none => none
  | some (.inr s) =>
    match y with
    | none => none
    | some (.inr t) => if s==t then some (.inr s) else none
    | some (.inl _) => some (.inr s)
  | some (.inl (sx,_,_)) =>
    match y with
    | none => none
    | some (.inr s) => some (.inr s)
    | some (.inl (sy,_,_)) =>
      let e := min (exponent x) (exponent y)
      let a := mantissa x * 2^(exponent x-e).toNat
      let b := mantissa y * 2^(exponent y-e).toNat
      let n := signed sx a + signed sy b
      if n==0 then signedZero (sx&&sy) else round (n<0) n.natAbs 1 e

def subtraction (x y : nativeFloat) : nativeFloat := addition x (negate y)
def multiplication (x y : nativeFloat) : nativeFloat :=
  let s := sign x != sign y
  match x with
  | none => none
  | some (.inr _) =>
    match y with
    | none => none
    | some (.inr _) => some (.inr s)
    | some (.inl _) => if isZero y then none else some (.inr s)
  | some (.inl _) =>
    match y with
    | none => none
    | some (.inr _) => if isZero x then none else some (.inr s)
    | some (.inl _) => round s (mantissa x*mantissa y) 1 (exponent x+exponent y)
def division (x y : nativeFloat) : nativeFloat :=
  let s := sign x != sign y
  match x with
  | none => none
  | some (.inr _) =>
    match y with
    | none => none
    | some (.inr _) => none
    | some (.inl _) => some (.inr s)
  | some (.inl _) =>
    match y with
    | none => none
    | some (.inr _) => signedZero s
    | some (.inl _) =>
      if isZero y then if isZero x then none else some (.inr s)
      else round s (mantissa x) (mantissa y) (exponent x-exponent y)

theorem floatTo_finite (s : Bool) (e : Fin 2047) (f : BitVec 52) :
    floatTo (.finite s e f) = some (.inl (s,e,f)) := rfl
theorem floatTo_infinity (s : Bool) : floatTo (.infinity s) = some (.inr s) := rfl
theorem floatTo_nan : floatTo .nan = none := rfl

theorem floatTo_if (b : Bool) (x y : Rocq2Lean.PrimFloat.Rep) :
    floatTo (if b then x else y) = if b then floatTo x else floatTo y := by cases b <;> rfl

theorem floatTo_if_congr (b : Bool) (x y : Rocq2Lean.PrimFloat.Rep)
    (a c : nativeFloat) (hx : floatTo x=a) (hy : floatTo y=c) :
    floatTo (if b then x else y) = if b then a else c := by cases b <;> assumption

theorem addition_agrees (x y : Rocq.Corelib.Floats.PrimFloat.float) :
    floatTo (Rocq.Corelib.Floats.PrimFloat.add x y) = addition (floatTo x) (floatTo y) := by
  unfold Rocq.Corelib.Floats.PrimFloat.add
  cases x <;> cases y <;>
    simp only [Rocq2Lean.PrimFloat.add, addition,floatTo_finite,floatTo_infinity,floatTo_nan]
  all_goals
    try simp only [Rocq2Lean.PrimFloat.mantissa,Rocq2Lean.PrimFloat.exponent,
      Rocq2Lean.PrimFloat.signed,
      mantissa,exponent,signed]
  all_goals repeat' first | rfl | (exact round_agrees _ _ _ _) | (apply floatTo_if_congr) | split


theorem multiplication_agrees (x y : Rocq.Corelib.Floats.PrimFloat.float) :
    floatTo (Rocq.Corelib.Floats.PrimFloat.mul x y) = multiplication (floatTo x) (floatTo y) := by
  unfold Rocq.Corelib.Floats.PrimFloat.mul
  cases x <;> cases y <;>
    simp only [Rocq2Lean.PrimFloat.mul, multiplication,floatTo_finite,floatTo_infinity,floatTo_nan]
  all_goals
    try simp only [Rocq2Lean.PrimFloat.mantissa,Rocq2Lean.PrimFloat.exponent,
      Rocq2Lean.PrimFloat.sign,Rocq2Lean.PrimFloat.isZero,
      mantissa,exponent,sign,isZero]
  all_goals repeat' first | rfl | (exact round_agrees _ _ _ _) | (apply floatTo_if_congr) | split


theorem division_agrees (x y : Rocq.Corelib.Floats.PrimFloat.float) :
    floatTo (Rocq.Corelib.Floats.PrimFloat.div x y) = division (floatTo x) (floatTo y) := by
  unfold Rocq.Corelib.Floats.PrimFloat.div
  cases x <;> cases y <;>
    simp only [Rocq2Lean.PrimFloat.div, division,floatTo_finite,floatTo_infinity,floatTo_nan]
  all_goals
    try simp only [Rocq2Lean.PrimFloat.mantissa,Rocq2Lean.PrimFloat.exponent,
      Rocq2Lean.PrimFloat.sign,Rocq2Lean.PrimFloat.isZero,
      mantissa,exponent,sign,isZero]
  all_goals repeat' first | rfl | (exact round_agrees _ _ _ _) | (apply floatTo_if_congr) | split


theorem subtraction_agrees (x y : Rocq.Corelib.Floats.PrimFloat.float) :
    floatTo (Rocq.Corelib.Floats.PrimFloat.sub x y) = subtraction (floatTo x) (floatTo y) := by
  change floatTo (Rocq.Corelib.Floats.PrimFloat.add x (Rocq.Corelib.Floats.PrimFloat.opp y)) = _
  rw [addition_agrees,negate_agrees]
  rfl
def getSign (x : nativeFloat) : Bool :=
  less (if zeroTest x then division one x else x) zero
theorem getSign_agrees (x : Rocq.Corelib.Floats.PrimFloat.float) :
    boolTo (Rocq.Corelib.Floats.PrimFloat.get_sign x) = getSign (floatTo x) := by
  unfold Rocq.Corelib.Floats.PrimFloat.get_sign
  dsimp only
  rw [less_agrees]
  have h := zeroTest_agrees x
  cases hz : Rocq.Corelib.Floats.PrimFloat.is_zero x <;> simp only [hz,boolTo] at h ⊢
  all_goals simp only [getSign,←h]
  all_goals first | rfl | (rw [division_agrees,one_agrees,zero_agrees]; rfl)

end NativeBridge.Incremental.PrimFloatArithmetic

-- Rechecked in the FloatAxioms closure: PrimFloatExponent
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

def nextUp (x : nativeFloat) : nativeFloat :=
  match x with
  | none => none
  | some (.inr false) => x
  | some (.inr true) => fromBits (BitVec.ofNat 64 (2^64-2^52-1))
  | some (.inl (s,_,_)) =>
    if isZero x then finite false 0 1
    else fromBits (BitVec.ofNat 64 (if s then (toBits x).toNat-1 else (toBits x).toNat+1))
def nextDown (x : nativeFloat) : nativeFloat := negate (nextUp (negate x))
theorem nextUp_agrees (x : Rocq.Corelib.Floats.PrimFloat.float) :
    floatTo (Rocq.Corelib.Floats.PrimFloat.next_up x) = nextUp (floatTo x) := by
  cases x with
  | nan => rfl
  | infinity s => cases s <;> first | rfl | exact fromBits_agrees _
  | finite s e f =>
    unfold Rocq.Corelib.Floats.PrimFloat.next_up Rocq2Lean.PrimFloat.nextUp
    simp only [floatTo_finite,nextUp]
    apply floatTo_if_congr
    · rfl
    · rw [fromBits_agrees]
      rfl
theorem nextDown_agrees (x : Rocq.Corelib.Floats.PrimFloat.float) :
    floatTo (Rocq.Corelib.Floats.PrimFloat.next_down x) = nextDown (floatTo x) := by
  change floatTo (Rocq.Corelib.Floats.PrimFloat.opp
    (Rocq.Corelib.Floats.PrimFloat.next_up (Rocq.Corelib.Floats.PrimFloat.opp x))) = _
  rw [negate_agrees,nextUp_agrees,negate_agrees]
  rfl

end NativeBridge.Incremental.PrimFloatExponent

-- Rechecked in the FloatAxioms closure: PrimFloatSqrt
set_option autoImplicit false
set_option maxHeartbeats 100000
noncomputable section
namespace NativeBridge.Incremental.PrimFloatSqrt
open NativeBridge PrimFloatRepresentation PrimFloatArithmetic

theorem sqrtDigits_bounds (fuel n : Nat) (hn : n < 4^fuel) :
    let r := Rocq2Lean.PrimFloat.sqrtDigits fuel n
    r*r ≤ n ∧ n < (r+1)*(r+1) := by
  induction fuel generalizing n with
  | zero =>
    simp only [Nat.pow_zero] at hn
    have hz : n=0 := by omega
    subst n
    decide
  | succ k ih =>
    have hn' : n/4 < 4^k := by rw [Nat.pow_succ] at hn; omega
    have hi := ih (n/4) hn'
    let r := Rocq2Lean.PrimFloat.sqrtDigits k (n/4)
    change r*r ≤ n/4 ∧ n/4 < (r+1)*(r+1) at hi
    have hs : (2*r)*(2*r) = 4*(r*r) := by
      change (2*r)*(2*r) = (2*2)*(r*r)
      ac_rfl
    have hs' : (2*r+2)*(2*r+2) = 4*((r+1)*(r+1)) := by
      rw [show 2*r+2=2*(r+1) by omega]
      change (2*(r+1))*(2*(r+1)) = (2*2)*((r+1)*(r+1))
      ac_rfl
    have hl : (2*r)*(2*r) ≤ n := by rw [hs]; omega
    have hu : n < (2*r+2)*(2*r+2) := by rw [hs']; omega
    change (if (2*r+1)^2≤n then 2*r+1 else 2*r) *
      (if (2*r+1)^2≤n then 2*r+1 else 2*r) ≤ n ∧
      n < ((if (2*r+1)^2≤n then 2*r+1 else 2*r)+1) *
        ((if (2*r+1)^2≤n then 2*r+1 else 2*r)+1)
    split
    · rename_i h
      simpa only [Nat.pow_two] using And.intro h hu
    · rename_i h
      constructor
      · exact hl
      · simpa only [Nat.pow_two] using Nat.lt_of_not_ge h

theorem integerSqrt_agrees (n : Nat) :
    Rocq2Lean.PrimFloat.integerSqrt n = Nat.sqrt n := by
  have hpow : n < 4^(Nat.log2 n/2+1) := by
    have h := Nat.lt_log2_self (n:=n)
    have hle : Nat.log2 n+1 ≤ 2*(Nat.log2 n/2+1) := by omega
    have hp := Nat.pow_le_pow_right (by decide : 0<2) hle
    have ht : n < 2^(2*(Nat.log2 n/2+1)) := Nat.lt_of_lt_of_le h hp
    simpa only [Nat.pow_mul] using ht
  have h := sqrtDigits_bounds (Nat.log2 n/2+1) n hpow
  change Rocq2Lean.PrimFloat.integerSqrt n * Rocq2Lean.PrimFloat.integerSqrt n ≤ n ∧
    n < (Rocq2Lean.PrimFloat.integerSqrt n+1)*(Rocq2Lean.PrimFloat.integerSqrt n+1) at h
  have hsl := Nat.sqrt_le n
  have hsu := Nat.lt_succ_sqrt n
  change n < (Nat.sqrt n+1)*(Nat.sqrt n+1) at hsu
  apply Nat.le_antisymm
  · by_cases hn : Rocq2Lean.PrimFloat.integerSqrt n ≤ Nat.sqrt n
    · exact hn
    have hh : Nat.sqrt n+1 ≤ Rocq2Lean.PrimFloat.integerSqrt n := by omega
    have hm := Nat.mul_le_mul hh hh
    omega
  · by_cases hn : Nat.sqrt n ≤ Rocq2Lean.PrimFloat.integerSqrt n
    · exact hn
    have hh : Rocq2Lean.PrimFloat.integerSqrt n+1 ≤ Nat.sqrt n := by omega
    have hm := Nat.mul_le_mul hh hh
    omega

def squareRoot (x : nativeFloat) : nativeFloat :=
  match x with
  | none => none
  | some (.inr s) => if s then none else x
  | some (.inl (s,_,_)) =>
    if isZero x then x else if s then none else
      let k := (Nat.log2 (mantissa x) : Int)+exponent x
      let q := max (-1074) (k/2-52)
      let shift := exponent x-2*q
      let n := if shift<0 then mantissa x else mantissa x*2^shift.toNat
      let d := if shift<0 then 2^(-shift).toNat else 1
      let m := Nat.sqrt (n/d)
      let mid := d*(2*m+1)^2
      let m := if 4*n>mid || (4*n==mid && m%2==1) then m+1 else m
      pack false m q
theorem squareRoot_agrees (x : Rocq.Corelib.Floats.PrimFloat.float) :
    floatTo (Rocq.Corelib.Floats.PrimFloat.sqrt x) = squareRoot (floatTo x) := by
  cases x with
  | nan => rfl
  | infinity s => cases s <;> rfl
  | finite s e f =>
    unfold Rocq.Corelib.Floats.PrimFloat.sqrt Rocq2Lean.PrimFloat.sqrt
    simp only [floatTo_finite,squareRoot]
    apply floatTo_if_congr
    · rfl
    · apply floatTo_if_congr
      · rfl
      · rw [pack_agrees]
        simp only [integerSqrt_agrees]
        rfl

end NativeBridge.Incremental.PrimFloatSqrt

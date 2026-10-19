import SpecFloatArithmeticSupport
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

open Lean Meta Elab Command
private partial def indexedNativeRefs (e : Expr) (seen : NameSet := {}) : MetaM (Array Name) := do
  let mut found : Array Name := #[]
  let mut seen := seen
  for n in e.getUsedConstants do
    if seen.contains n then continue
    seen := seen.insert n
    let s := n.toString
    if s.startsWith "Rocq." || s.startsWith "RocqPending." || s.startsWith "Rocq2Lean." then
      found := found.push n
    else if s.startsWith "NativeBridge." then
      let ci ← getConstInfo n
      let body? := match ci with
        | .defnInfo v => some v.value
        | .thmInfo v => some v.value
        | .opaqueInfo v => some v.value
        | _ => none
      if let some body := body? then
        found := found ++ (← indexedNativeRefs body seen)
  return found


open Lean in
run_cmd Lean.Elab.Command.liftTermElabM do
  for name in ["NativeBridge.Incremental.SpecFloatRounding.bounded", "NativeBridge.Incremental.SpecFloatRounding.canonical", "NativeBridge.Incremental.SpecFloatRounding.conditionalNegate", "NativeBridge.Incremental.SpecFloatRounding.evenLocation", "NativeBridge.Incremental.SpecFloatRounding.exponent", "NativeBridge.Incremental.SpecFloatRounding.integerDigits", "NativeBridge.Incremental.SpecFloatRounding.minimumExponent", "NativeBridge.Incremental.SpecFloatRounding.nearestEven", "NativeBridge.Incremental.SpecFloatRounding.newLocation", "NativeBridge.Incremental.SpecFloatRounding.oddLocation", "NativeBridge.Incremental.SpecFloatRounding.positiveDigits", "NativeBridge.Incremental.SpecFloatRounding.valid"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

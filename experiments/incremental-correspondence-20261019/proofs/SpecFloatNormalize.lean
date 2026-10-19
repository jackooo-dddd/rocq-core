import SpecFloatShift
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
  for name in ["NativeBridge.Incremental.SpecFloatNormalize.classify", "NativeBridge.Incremental.SpecFloatNormalize.normalMantissa", "NativeBridge.Incremental.SpecFloatNormalize.normalize", "NativeBridge.Incremental.SpecFloatNormalize.one", "NativeBridge.Incremental.SpecFloatNormalize.roundAux", "NativeBridge.Incremental.SpecFloatNormalize.roundPositive", "NativeBridge.Incremental.SpecFloatNormalize.scale"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

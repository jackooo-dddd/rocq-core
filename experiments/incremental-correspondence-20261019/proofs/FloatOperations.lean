import FloatWordSupport
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
def fromSpec : SpecFloatRepresentation.nativeSpec → nativeFloat
  | .zero s => signedZero s
  | .infinity s => some (.inr s)
  | .nan => none
  | .finite s m e =>
    let f := scale (fromWord (BitVec.ofInt 63 (m.val : Int))) e
    if s then negate f else f
theorem fromSpec_agrees (x : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    floatTo (Rocq.Corelib.Floats.FloatOps.SF2Prim x) = fromSpec (SpecFloatRepresentation.specTo x) := by
  cases x with
  | S754_zero s => cases s <;> rfl
  | S754_infinity s => cases s <;> rfl
  | S754_nan => rfl
  | S754_finite s m e =>
    cases s with
    | true =>
      change floatTo (Rocq.Corelib.Floats.PrimFloat.opp (Rocq.Corelib.Floats.FloatOps.Z.ldexp _ e)) = _
      rw [negate_agrees,scale_agrees]
      rw [fromWord_agrees (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_Z (.Zpos m)),wordOfInt_agrees]
      rfl
    | false =>
      change floatTo (Rocq.Corelib.Floats.FloatOps.Z.ldexp _ e) = _
      rw [scale_agrees]
      rw [fromWord_agrees (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_Z (.Zpos m)),wordOfInt_agrees]
      rfl

open SpecFloatRepresentation SpecFloatShift
def decoded (s : Bool) (m e : Int) : nativeSpec :=
  if h : 0<m then .finite s ⟨m.toNat,by omega⟩ e else .zero false
def sourceDecoded (s : RBool) (m e : RIntBinary) : Rocq.Corelib.Floats.SpecFloat.spec_float :=
  Rocq.Corelib.Numbers.BinNums.Z.rec (.S754_zero .false)
    (fun p => .S754_finite s p e) (fun _ => .S754_zero .false) m
theorem decoded_agrees (s : RBool) (m e : RIntBinary) :
    specTo (sourceDecoded s m e) = decoded (boolTo s) (binaryIntTo m) (binaryIntTo e) := by
  cases m with
  | Z0 => rfl
  | Zneg p =>
    unfold decoded
    rw [dif_neg (show ¬ 0<binaryIntTo (.Zneg p) by change ¬(0:Int)< -(positiveTo p : Int); omega)]
    rfl
  | Zpos p =>
    have hp : 0<binaryIntTo (.Zpos p) := by change (0:Int)<positiveTo p; have := positiveTo_pos p; omega
    unfold decoded
    rw [dif_pos hp]
    rfl

def finiteToSpec (x a : nativeFloat) (e : Int) : nativeSpec :=
  let p := shiftToExponent precision maximumExponent ((normalMantissa a).toNat : Int) (e-precision) none
  decoded (getSign x) (SpecFloatRepresentation.mantissa p.1) p.2
def sourceFiniteToSpec (x a : Rocq.Corelib.Floats.PrimFloat.float) (e : RIntBinary) : Rocq.Corelib.Floats.SpecFloat.spec_float :=
  Rocq.Corelib.Init.Datatypes.prod.rec
    (fun r e' => sourceDecoded (Rocq.Corelib.Floats.PrimFloat.get_sign x)
      (Rocq.Corelib.Floats.SpecFloat.shr_m r) e')
    (Rocq.Corelib.Floats.SpecFloat.shr_fexp Rocq.Corelib.Floats.FloatOps.prec Rocq.Corelib.Floats.FloatOps.emax
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z (Rocq.Corelib.Floats.PrimFloat.normfr_mantissa a))
      (Rocq.Corelib.BinNums.IntDef.Z.sub e Rocq.Corelib.Floats.FloatOps.prec) .loc_Exact)
theorem finiteToSpec_agrees (x a : Rocq.Corelib.Floats.PrimFloat.float) (e : RIntBinary) :
    specTo (sourceFiniteToSpec x a e) = finiteToSpec (floatTo x) (floatTo a) (binaryIntTo e) := by
  have h := shiftToExponent_agrees Rocq.Corelib.Floats.FloatOps.prec Rocq.Corelib.Floats.FloatOps.emax
    (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z (Rocq.Corelib.Floats.PrimFloat.normfr_mantissa a))
    (Rocq.Corelib.BinNums.IntDef.Z.sub e Rocq.Corelib.Floats.FloatOps.prec) .loc_Exact
  cases he : Rocq.Corelib.Floats.SpecFloat.shr_fexp Rocq.Corelib.Floats.FloatOps.prec Rocq.Corelib.Floats.FloatOps.emax
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z (Rocq.Corelib.Floats.PrimFloat.normfr_mantissa a))
      (Rocq.Corelib.BinNums.IntDef.Z.sub e Rocq.Corelib.Floats.FloatOps.prec) .loc_Exact with
  | pair r ee =>
    rw [he] at h
    rw [wordToInt_agrees (Rocq.Corelib.Floats.PrimFloat.normfr_mantissa a),normalMantissa_agrees] at h
    simp only [precision_agrees,maximumExponent_agrees,z_sub_agrees,locationTo] at h
    change (shiftTo r,binaryIntTo ee) = _ at h
    unfold sourceFiniteToSpec
    rw [he]
    change specTo (sourceDecoded (Rocq.Corelib.Floats.PrimFloat.get_sign x)
      (Rocq.Corelib.Floats.SpecFloat.shr_m r) ee) = _
    rw [decoded_agrees,SpecFloatRepresentation.mantissa_agrees,getSign_agrees]
    rw [finiteToSpec,←h]

def sourceFiniteBody (x : Rocq.Corelib.Floats.PrimFloat.float) : Rocq.Corelib.Floats.SpecFloat.spec_float :=
  Rocq.Corelib.Init.Datatypes.prod.rec (sourceFiniteToSpec x) (Rocq.Corelib.Floats.FloatOps.Z.frexp x)
theorem finiteBody_agrees (x : Rocq.Corelib.Floats.PrimFloat.float) :
    specTo (sourceFiniteBody x) = finiteToSpec (floatTo x) (fraction (floatTo x)).1 (fraction (floatTo x)).2 := by
  have h := fraction_agrees x
  cases he : Rocq.Corelib.Floats.FloatOps.Z.frexp x with
  | pair a e =>
    rw [he] at h
    change (floatTo a,binaryIntTo e) = _ at h
    unfold sourceFiniteBody
    rw [he]
    change specTo (sourceFiniteToSpec x a e) = _
    rw [finiteToSpec_agrees,←h]

def toSpec (x : nativeFloat) : nativeSpec :=
  if isNaN x then .nan
  else if zeroTest x then .zero (getSign x)
  else if infinityTest x then .infinity (getSign x)
  else finiteToSpec x (fraction x).1 (fraction x).2
def sourceComplete (x : Rocq.Corelib.Floats.PrimFloat.float) : Rocq.Corelib.Floats.SpecFloat.spec_float :=
  Rocq.Corelib.Init.Datatypes.bool.rec .S754_nan
    (Rocq.Corelib.Init.Datatypes.bool.rec (.S754_zero (Rocq.Corelib.Floats.PrimFloat.get_sign x))
      (Rocq.Corelib.Init.Datatypes.bool.rec (.S754_infinity (Rocq.Corelib.Floats.PrimFloat.get_sign x))
        (sourceFiniteBody x) (Rocq.Corelib.Floats.PrimFloat.is_infinity x))
      (Rocq.Corelib.Floats.PrimFloat.is_zero x))
    (Rocq.Corelib.Floats.PrimFloat.is_nan x)
theorem toSpec_agrees (x : Rocq.Corelib.Floats.PrimFloat.float) :
    specTo (Rocq.Corelib.Floats.FloatOps.Prim2SF x) = toSpec (floatTo x) := by
  have he : Rocq.Corelib.Floats.FloatOps.Prim2SF x = sourceComplete x := by
    simp only [Rocq.Corelib.Floats.FloatOps.Prim2SF,sourceComplete,sourceFiniteBody,sourceFiniteToSpec,sourceDecoded]
  rw [he]
  unfold sourceComplete
  rw [SpecFloatRounding.choose_map specTo,isNaN_agrees]
  rw [SpecFloatRounding.choose_map specTo,zeroTest_agrees]
  rw [SpecFloatRounding.choose_map specTo,infinityTest_agrees,finiteBody_agrees]
  simp only [specTo,getSign_agrees]
  rfl

end NativeBridge.Incremental.FloatOperations

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
  for name in ["NativeBridge.Incremental.FloatOperations.exponentOffset", "NativeBridge.Incremental.FloatOperations.fraction", "NativeBridge.Incremental.FloatOperations.fromSpec", "NativeBridge.Incremental.FloatOperations.maximumExponent", "NativeBridge.Incremental.FloatOperations.precision", "NativeBridge.Incremental.FloatOperations.scale", "NativeBridge.Incremental.FloatOperations.toSpec"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

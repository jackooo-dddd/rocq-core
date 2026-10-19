import Float64Operations
set_option autoImplicit false
set_option maxHeartbeats 100000
set_option maxRecDepth 4096
noncomputable section
namespace NativeBridge.Incremental.FloatStatements
open NativeBridge FloatOperations SpecFloatRepresentation BinaryArithmetic
def absolute : Prop := ∀ x : PrimFloatRepresentation.nativeFloat, toSpec (PrimFloatRepresentation.absolute x) = SpecFloatRepresentation.absolute (toSpec x)
theorem absolute_correspondence : Rocq.Corelib.Floats.FloatAxioms.abs_spec.statement ↔ absolute := by
  unfold Rocq.Corelib.Floats.FloatAxioms.abs_spec.statement absolute
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro x
  apply Iff.trans (eq_across_iso specIso _ _)
  change specTo _ = specTo _ ↔ _
  simp only [toSpec_agrees,PrimFloatRepresentation.absolute_agrees,SpecFloatRepresentation.absolute_agrees]
  rfl
def negate : Prop := ∀ x : PrimFloatRepresentation.nativeFloat, toSpec (PrimFloatRepresentation.negate x) = SpecFloatRepresentation.negate (toSpec x)
theorem negate_correspondence : Rocq.Corelib.Floats.FloatAxioms.opp_spec.statement ↔ negate := by
  unfold Rocq.Corelib.Floats.FloatAxioms.opp_spec.statement negate
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro x
  apply Iff.trans (eq_across_iso specIso _ _)
  change specTo _ = specTo _ ↔ _
  simp only [toSpec_agrees,PrimFloatRepresentation.negate_agrees,SpecFloatRepresentation.negate_agrees]
  rfl
def addition : Prop := ∀ x y : PrimFloatRepresentation.nativeFloat, toSpec (PrimFloatArithmetic.addition x y) = Float64Operations.addition (toSpec x) (toSpec y)
theorem addition_correspondence : Rocq.Corelib.Floats.FloatAxioms.add_spec.statement ↔ addition := by
  unfold Rocq.Corelib.Floats.FloatAxioms.add_spec.statement addition
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro x
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro y
  apply Iff.trans (eq_across_iso specIso _ _)
  change specTo _ = specTo _ ↔ _
  simp only [toSpec_agrees,PrimFloatArithmetic.addition_agrees,Float64Operations.addition_agrees]
  rfl
def subtraction : Prop := ∀ x y : PrimFloatRepresentation.nativeFloat, toSpec (PrimFloatArithmetic.subtraction x y) = Float64Operations.subtraction (toSpec x) (toSpec y)
theorem subtraction_correspondence : Rocq.Corelib.Floats.FloatAxioms.sub_spec.statement ↔ subtraction := by
  unfold Rocq.Corelib.Floats.FloatAxioms.sub_spec.statement subtraction
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro x
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro y
  apply Iff.trans (eq_across_iso specIso _ _)
  change specTo _ = specTo _ ↔ _
  simp only [toSpec_agrees,PrimFloatArithmetic.subtraction_agrees,Float64Operations.subtraction_agrees]
  rfl
def multiplication : Prop := ∀ x y : PrimFloatRepresentation.nativeFloat, toSpec (PrimFloatArithmetic.multiplication x y) = Float64Operations.multiplication (toSpec x) (toSpec y)
theorem multiplication_correspondence : Rocq.Corelib.Floats.FloatAxioms.mul_spec.statement ↔ multiplication := by
  unfold Rocq.Corelib.Floats.FloatAxioms.mul_spec.statement multiplication
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro x
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro y
  apply Iff.trans (eq_across_iso specIso _ _)
  change specTo _ = specTo _ ↔ _
  simp only [toSpec_agrees,PrimFloatArithmetic.multiplication_agrees,Float64Operations.multiplication_agrees]
  rfl
def division : Prop := ∀ x y : PrimFloatRepresentation.nativeFloat, toSpec (PrimFloatArithmetic.division x y) = Float64Operations.division (toSpec x) (toSpec y)
theorem division_correspondence : Rocq.Corelib.Floats.FloatAxioms.div_spec.statement ↔ division := by
  unfold Rocq.Corelib.Floats.FloatAxioms.div_spec.statement division
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro x
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro y
  apply Iff.trans (eq_across_iso specIso _ _)
  change specTo _ = specTo _ ↔ _
  simp only [toSpec_agrees,PrimFloatArithmetic.division_agrees,Float64Operations.division_agrees]
  rfl
def squareRoot : Prop := ∀ x : PrimFloatRepresentation.nativeFloat, toSpec (PrimFloatSqrt.squareRoot x) = Float64Operations.squareRoot (toSpec x)
theorem squareRoot_correspondence : Rocq.Corelib.Floats.FloatAxioms.sqrt_spec.statement ↔ squareRoot := by
  unfold Rocq.Corelib.Floats.FloatAxioms.sqrt_spec.statement squareRoot
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro x
  apply Iff.trans (eq_across_iso specIso _ _)
  change specTo _ = specTo _ ↔ _
  simp only [toSpec_agrees,PrimFloatSqrt.squareRoot_agrees,Float64Operations.squareRoot_agrees]
  rfl
def successor : Prop := ∀ x : PrimFloatRepresentation.nativeFloat, toSpec (PrimFloatExponent.nextUp x) = Float64Operations.successor (toSpec x)
theorem successor_correspondence : Rocq.Corelib.Floats.FloatAxioms.next_up_spec.statement ↔ successor := by
  unfold Rocq.Corelib.Floats.FloatAxioms.next_up_spec.statement successor
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro x
  apply Iff.trans (eq_across_iso specIso _ _)
  change specTo _ = specTo _ ↔ _
  simp only [toSpec_agrees,PrimFloatExponent.nextUp_agrees,Float64Operations.successor_agrees]
  rfl
def predecessor : Prop := ∀ x : PrimFloatRepresentation.nativeFloat, toSpec (PrimFloatExponent.nextDown x) = Float64Operations.predecessor (toSpec x)
theorem predecessor_correspondence : Rocq.Corelib.Floats.FloatAxioms.next_down_spec.statement ↔ predecessor := by
  unfold Rocq.Corelib.Floats.FloatAxioms.next_down_spec.statement predecessor
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro x
  apply Iff.trans (eq_across_iso specIso _ _)
  change specTo _ = specTo _ ↔ _
  simp only [toSpec_agrees,PrimFloatExponent.nextDown_agrees,Float64Operations.predecessor_agrees]
  rfl
def equal : Prop := ∀ x y : PrimFloatRepresentation.nativeFloat, PrimFloatRepresentation.ieeeEqual x y = SpecFloatComparison.equal (toSpec x) (toSpec y)
theorem equal_correspondence : Rocq.Corelib.Floats.FloatAxioms.eqb_spec.statement ↔ equal := by
  unfold Rocq.Corelib.Floats.FloatAxioms.eqb_spec.statement equal
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro x
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro y
  apply Iff.trans (eq_across_iso boolIso _ _)
  change boolTo _ = boolTo _ ↔ _
  simp only [PrimFloatRepresentation.ieeeEqual_agrees,SpecFloatComparison.equal_agrees,toSpec_agrees]
  rfl
def less : Prop := ∀ x y : PrimFloatRepresentation.nativeFloat, PrimFloatRepresentation.less x y = SpecFloatComparison.less (toSpec x) (toSpec y)
theorem less_correspondence : Rocq.Corelib.Floats.FloatAxioms.ltb_spec.statement ↔ less := by
  unfold Rocq.Corelib.Floats.FloatAxioms.ltb_spec.statement less
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro x
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro y
  apply Iff.trans (eq_across_iso boolIso _ _)
  change boolTo _ = boolTo _ ↔ _
  simp only [PrimFloatRepresentation.less_agrees,SpecFloatComparison.less_agrees,toSpec_agrees]
  rfl
def lessEqual : Prop := ∀ x y : PrimFloatRepresentation.nativeFloat, PrimFloatRepresentation.lessEqual x y = SpecFloatComparison.lessEqual (toSpec x) (toSpec y)
theorem lessEqual_correspondence : Rocq.Corelib.Floats.FloatAxioms.leb_spec.statement ↔ lessEqual := by
  unfold Rocq.Corelib.Floats.FloatAxioms.leb_spec.statement lessEqual
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro x
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro y
  apply Iff.trans (eq_across_iso boolIso _ _)
  change boolTo _ = boolTo _ ↔ _
  simp only [PrimFloatRepresentation.lessEqual_agrees,SpecFloatComparison.lessEqual_agrees,toSpec_agrees]
  rfl

def classification : Prop := ∀ x : PrimFloatRepresentation.nativeFloat,
  PrimFloatRepresentation.classification x = Float64Operations.classification (toSpec x)
theorem classification_correspondence :
    Rocq.Corelib.Floats.FloatAxioms.classify_spec.statement ↔ classification := by
  unfold Rocq.Corelib.Floats.FloatAxioms.classify_spec.statement classification
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro x
  apply Iff.trans (eq_across_iso floatClassIso _ _)
  change floatClassTo _ = floatClassTo _ ↔ _
  simp only [PrimFloatRepresentation.classification_agrees,Float64Operations.classification_agrees,toSpec_agrees]
  rfl
def comparison : Prop := ∀ x y : PrimFloatRepresentation.nativeFloat,
  PrimFloatRepresentation.comparison x y = SpecFloatComparison.comparison (toSpec x) (toSpec y)
theorem comparison_correspondence :
    Rocq.Corelib.Floats.FloatAxioms.compare_spec.statement ↔ comparison := by
  unfold Rocq.Corelib.Floats.FloatAxioms.compare_spec.statement comparison
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro x
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro y
  apply Iff.trans (eq_across_iso PrimFloatRepresentation.comparisonIso _ _)
  change PrimFloatRepresentation.comparisonTo _ = PrimFloatRepresentation.comparisonTo _ ↔ _
  simp only [PrimFloatRepresentation.comparison_agrees,Float64Operations.flatten_agrees,
    SpecFloatComparison.comparison_agrees,toSpec_agrees]
  rfl

theorem specEquality (x y : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    Rocq.Corelib.Init.Logic.eq _ x y ↔ specTo x = specTo y := eq_across_iso specIso x y
theorem floatEquality (x y : Rocq.Corelib.Floats.PrimFloat.float) :
    Rocq.Corelib.Init.Logic.eq _ x y ↔ PrimFloatRepresentation.floatTo x = PrimFloatRepresentation.floatTo y :=
  eq_across_iso PrimFloatRepresentation.floatIso x y
theorem boolEquality (x y : RBool) :
    Rocq.Corelib.Init.Logic.eq _ x y ↔ boolTo x = boolTo y := eq_across_iso boolIso x y
def valid (x : nativeSpec) : Bool := SpecFloatRounding.valid precision maximumExponent x
def specificationRoundtrip : Prop := ∀ x : nativeSpec, valid x=true → toSpec (fromSpec x)=x
def primitiveRoundtrip : Prop := ∀ x : PrimFloatRepresentation.nativeFloat, fromSpec (toSpec x)=x
def toSpecInjective : Prop := ∀ x y : PrimFloatRepresentation.nativeFloat, toSpec x=toSpec y → x=y
def fromSpecInjective : Prop := ∀ x y : nativeSpec, fromSpec x=fromSpec y → valid x=true → valid y=true → x=y
def primitiveValid : Prop := ∀ x : PrimFloatRepresentation.nativeFloat, valid (toSpec x)=true
theorem specificationRoundtrip_correspondence : Rocq.Corelib.Floats.FloatAxioms.Prim2SF_SF2Prim.statement ↔ specificationRoundtrip := by
  unfold Rocq.Corelib.Floats.FloatAxioms.Prim2SF_SF2Prim.statement specificationRoundtrip
  apply specIso.forall_iff
  intro x
  simp only [specEquality,boolEquality,toSpec_agrees,fromSpec_agrees,
    SpecFloatRounding.valid_agrees,precision_agrees,maximumExponent_agrees]
  rfl
theorem primitiveRoundtrip_correspondence : Rocq.Corelib.Floats.FloatAxioms.SF2Prim_Prim2SF.statement ↔ primitiveRoundtrip := by
  unfold Rocq.Corelib.Floats.FloatAxioms.SF2Prim_Prim2SF.statement primitiveRoundtrip
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro x
  simp only [floatEquality,toSpec_agrees,fromSpec_agrees]
  rfl
theorem toSpecInjective_correspondence : Rocq.Corelib.Floats.FloatAxioms.Prim2SF_inj.statement ↔ toSpecInjective := by
  unfold Rocq.Corelib.Floats.FloatAxioms.Prim2SF_inj.statement toSpecInjective
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro x
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro y
  simp only [specEquality,floatEquality,toSpec_agrees]
  rfl
theorem fromSpecInjective_correspondence : Rocq.Corelib.Floats.FloatAxioms.SF2Prim_inj.statement ↔ fromSpecInjective := by
  unfold Rocq.Corelib.Floats.FloatAxioms.SF2Prim_inj.statement fromSpecInjective
  apply specIso.forall_iff
  intro x
  apply specIso.forall_iff
  intro y
  simp only [specEquality,floatEquality,boolEquality,fromSpec_agrees,
    SpecFloatRounding.valid_agrees,precision_agrees,maximumExponent_agrees]
  rfl
theorem primitiveValid_correspondence : Rocq.Corelib.Floats.FloatAxioms.Prim2SF_valid.statement ↔ primitiveValid := by
  unfold Rocq.Corelib.Floats.FloatAxioms.Prim2SF_valid.statement primitiveValid
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro x
  simp only [boolEquality,toSpec_agrees,
    SpecFloatRounding.valid_agrees,precision_agrees,maximumExponent_agrees]
  rfl


theorem sourceIff (P Q : Prop) : Rocq.Corelib.Init.Logic.iff P Q ↔ (P ↔ Q) := by
  constructor
  · intro h
    cases h with | conj hp hq => exact ⟨hp,hq⟩
  · intro h
    exact .conj _ _ h.mp h.mpr
def leibnizEqual : Prop := ∀ x y : PrimFloatRepresentation.nativeFloat,
  PrimFloatRepresentation.bitsEqual x y=true ↔ x=y
theorem leibnizEqual_correspondence :
    Rocq.Corelib.Floats.FloatAxioms.Leibniz.eqb_spec.statement ↔ leibnizEqual := by
  unfold Rocq.Corelib.Floats.FloatAxioms.Leibniz.eqb_spec.statement leibnizEqual
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro x
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro y
  rw [sourceIff]
  simp only [boolEquality,floatEquality,PrimFloatRepresentation.bitsEqual_agrees]
  rfl

def fromWord : Prop := ∀ w : BitVec 63, toSpec (PrimFloatExponent.fromWord w) =
  SpecFloatNormalize.normalize precision maximumExponent (w.toNat : Int) 0 false
theorem fromWord_correspondence :
    Rocq.Corelib.Floats.FloatAxioms.of_uint63_spec.statement ↔ fromWord := by
  unfold Rocq.Corelib.Floats.FloatAxioms.of_uint63_spec.statement fromWord
  apply (identityIso (BitVec 63)).forall_iff
  intro w
  apply Iff.trans (eq_across_iso specIso _ _)
  dsimp only [specIso]
  rw [toSpec_agrees,PrimFloatExponent.fromWord_agrees w,SpecFloatNormalize.normalize_agrees,
    precision_agrees,maximumExponent_agrees,wordToInt_agrees w]
  rfl

theorem ofBinaryNat_agrees (n : RNatBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.of_N n) = (binaryNatTo n : Int) := by cases n <;> rfl
def normalMantissa : Prop := ∀ x : PrimFloatRepresentation.nativeFloat,
  ((PrimFloatRepresentation.normalMantissa x).toNat : Int) =
    (SpecFloatNormalize.normalMantissa precision (toSpec x) : Int)
theorem normalMantissa_correspondence :
    Rocq.Corelib.Floats.FloatAxioms.normfr_mantissa_spec.statement ↔ normalMantissa := by
  unfold Rocq.Corelib.Floats.FloatAxioms.normfr_mantissa_spec.statement normalMantissa
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro x
  apply Iff.trans (eq_across_iso binaryIntIso _ _)
  dsimp only [binaryIntIso]
  rw [wordToInt_agrees (Rocq.Corelib.Floats.PrimFloat.normfr_mantissa x),
    PrimFloatRepresentation.normalMantissa_agrees,ofBinaryNat_agrees,
    SpecFloatNormalize.normalMantissa_agrees,precision_agrees,toSpec_agrees]
  rfl

def scaleShifted : Prop := ∀ (x : PrimFloatRepresentation.nativeFloat) (e : BitVec 63),
  toSpec (PrimFloatExponent.scaleShifted x e) =
    SpecFloatNormalize.scale precision maximumExponent (toSpec x) ((e.toNat : Int)-exponentOffset)
theorem scaleShifted_correspondence :
    Rocq.Corelib.Floats.FloatAxioms.ldshiftexp_spec.statement ↔ scaleShifted := by
  unfold Rocq.Corelib.Floats.FloatAxioms.ldshiftexp_spec.statement scaleShifted
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro x
  apply (identityIso (BitVec 63)).forall_iff
  intro e
  apply Iff.trans (eq_across_iso specIso _ _)
  change specTo _ = specTo _ ↔ _
  rw [toSpec_agrees,PrimFloatExponent.scaleShifted_agrees x e,SpecFloatNormalize.scale_agrees]
  simp only [precision_agrees,maximumExponent_agrees,toSpec_agrees,z_sub_agrees,
    exponentOffset_agrees,wordToInt_agrees e]
  rfl

theorem pairEquality (x y : Rocq.Corelib.Init.Datatypes.prod Rocq.Corelib.Floats.SpecFloat.spec_float RIntBinary) :
    Rocq.Corelib.Init.Logic.eq _ x y ↔ SpecFloatExponent.specPairTo x = SpecFloatExponent.specPairTo y := by
  cases x
  cases y
  exact eq_across_iso ((prodIso _ _).trans (specIso.products binaryIntIso)) _ _
def fractionShifted : Prop := ∀ x : PrimFloatRepresentation.nativeFloat,
  (toSpec (PrimFloatExponent.fractionShifted x).1,
    ((PrimFloatExponent.fractionShifted x).2.toNat : Int)-exponentOffset) =
    SpecFloatExponent.fraction precision maximumExponent (toSpec x)
theorem fractionShifted_correspondence :
    Rocq.Corelib.Floats.FloatAxioms.frshiftexp_spec.statement ↔ fractionShifted := by
  unfold Rocq.Corelib.Floats.FloatAxioms.frshiftexp_spec.statement fractionShifted
  apply PrimFloatRepresentation.floatIso.forall_iff
  intro x
  have h := PrimFloatExponent.fractionShifted_agrees x
  cases he : Rocq.Corelib.Floats.PrimFloat.frshiftexp x with
  | pair a e =>
    rw [he] at h
    change (PrimFloatRepresentation.floatTo a,e) = _ at h
    dsimp only
    apply Iff.trans (pairEquality _ _)
    rw [SpecFloatExponent.fraction_agrees]
    simp only [SpecFloatExponent.specPairTo,prodTo]
    rw [toSpec_agrees,z_sub_agrees,wordToInt_agrees e,exponentOffset_agrees,
      precision_agrees,maximumExponent_agrees,toSpec_agrees]
    change _ ↔ (toSpec (PrimFloatExponent.fractionShifted (PrimFloatRepresentation.floatTo x)).1,
      ((PrimFloatExponent.fractionShifted (PrimFloatRepresentation.floatTo x)).2.toNat : Int)-exponentOffset)=_
    rw [←h]
    rfl

end NativeBridge.Incremental.FloatStatements

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
  for name in ["NativeBridge.Incremental.FloatStatements.absolute", "NativeBridge.Incremental.FloatStatements.addition", "NativeBridge.Incremental.FloatStatements.classification", "NativeBridge.Incremental.FloatStatements.comparison", "NativeBridge.Incremental.FloatStatements.division", "NativeBridge.Incremental.FloatStatements.equal", "NativeBridge.Incremental.FloatStatements.fractionShifted", "NativeBridge.Incremental.FloatStatements.fromSpecInjective", "NativeBridge.Incremental.FloatStatements.fromWord", "NativeBridge.Incremental.FloatStatements.leibnizEqual", "NativeBridge.Incremental.FloatStatements.less", "NativeBridge.Incremental.FloatStatements.lessEqual", "NativeBridge.Incremental.FloatStatements.multiplication", "NativeBridge.Incremental.FloatStatements.negate", "NativeBridge.Incremental.FloatStatements.normalMantissa", "NativeBridge.Incremental.FloatStatements.predecessor", "NativeBridge.Incremental.FloatStatements.primitiveRoundtrip", "NativeBridge.Incremental.FloatStatements.primitiveValid", "NativeBridge.Incremental.FloatStatements.scaleShifted", "NativeBridge.Incremental.FloatStatements.specificationRoundtrip", "NativeBridge.Incremental.FloatStatements.squareRoot", "NativeBridge.Incremental.FloatStatements.subtraction", "NativeBridge.Incremental.FloatStatements.successor", "NativeBridge.Incremental.FloatStatements.toSpecInjective"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

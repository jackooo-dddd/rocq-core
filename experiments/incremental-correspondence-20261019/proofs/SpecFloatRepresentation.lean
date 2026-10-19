import Interface_Floats_SpecFloat
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
theorem roundBit_agrees (s : Rocq.Corelib.Floats.SpecFloat.shr_record) :
    boolTo (Rocq.Corelib.Floats.SpecFloat.shr_r s) = roundBit (shiftTo s) := by cases s; rfl
theorem stickyBit_agrees (s : Rocq.Corelib.Floats.SpecFloat.shr_record) :
    boolTo (Rocq.Corelib.Floats.SpecFloat.shr_s s) = stickyBit (shiftTo s) := by cases s; rfl
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
theorem locationRect_agrees (P : Option Ordering → Sort u) (z : P none)
    (s : ∀ c, P (some c)) (l : Rocq.Corelib.Floats.SpecFloat.location) :
    Rocq.Corelib.Floats.SpecFloat.location_rect (fun l => P (locationTo l)) z
      (fun c => s (comparisonTo c)) l = locationElim P z s (locationTo l) := by cases l <;> rfl
theorem locationRec_agrees (P : Option Ordering → Type) (z : P none)
    (s : ∀ c, P (some c)) (l : Rocq.Corelib.Floats.SpecFloat.location) :
    Rocq.Corelib.Floats.SpecFloat.location_rec (fun l => P (locationTo l)) z
      (fun c => s (comparisonTo c)) l = locationElim P z s (locationTo l) := by cases l <;> rfl
def locationInd : Prop := ∀ P : Option Ordering → Prop, P none → (∀ c, P (some c)) → ∀ l, P l
theorem locationInd_native : locationInd := fun P z s l => locationElim P z s l
theorem locationInd_proof : Rocq.Corelib.Floats.SpecFloat.location_ind.statement := by
  intro P z s l
  cases l with
  | loc_Exact => exact z
  | loc_Inexact c => exact s c
theorem locationSind_proof : Rocq.Corelib.Floats.SpecFloat.location_sind.statement := by
  intro P z s l
  cases l with
  | loc_Exact => exact z
  | loc_Inexact c => exact s c
theorem locationInd_correspondence : Rocq.Corelib.Floats.SpecFloat.location_ind.statement ↔ locationInd :=
  ⟨fun _ => locationInd_native,fun _ => @locationInd_proof⟩
theorem locationSind_correspondence : Rocq.Corelib.Floats.SpecFloat.location_sind.statement ↔ locationInd :=
  ⟨fun _ => locationInd_native,fun _ => @locationSind_proof⟩

end NativeBridge.Incremental.SpecFloatRepresentation

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
  for name in ["NativeBridge.Incremental.SpecFloatRepresentation.absolute", "NativeBridge.Incremental.SpecFloatRepresentation.fromShift", "NativeBridge.Incremental.SpecFloatRepresentation.locationElim", "NativeBridge.Incremental.SpecFloatRepresentation.locationInd", "NativeBridge.Incremental.SpecFloatRepresentation.mantissa", "NativeBridge.Incremental.SpecFloatRepresentation.nativeLocation", "NativeBridge.Incremental.SpecFloatRepresentation.nativeShift", "NativeBridge.Incremental.SpecFloatRepresentation.nativeSpec", "NativeBridge.Incremental.SpecFloatRepresentation.negate", "NativeBridge.Incremental.SpecFloatRepresentation.roundBit", "NativeBridge.Incremental.SpecFloatRepresentation.stickyBit", "NativeBridge.Incremental.SpecFloatRepresentation.toShift"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

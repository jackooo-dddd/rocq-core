import PrimFloatArithmetic
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
  for name in ["NativeBridge.Incremental.PrimFloatExponent.fractionShifted", "NativeBridge.Incremental.PrimFloatExponent.fromWord", "NativeBridge.Incremental.PrimFloatExponent.nextDown", "NativeBridge.Incremental.PrimFloatExponent.nextUp", "NativeBridge.Incremental.PrimFloatExponent.scaleShifted"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

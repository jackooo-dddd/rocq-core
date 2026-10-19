import Interface_Floats_PrimFloat
import Init.Data.BitVec.Lemmas
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
def wrapperTo : Rocq.Corelib.Floats.PrimFloat.float_wrapper → nativeFloat
  | .wrap_float x => floatTo x
def wrapperIso : Iso Rocq.Corelib.Floats.PrimFloat.float_wrapper nativeFloat where
  to := wrapperTo
  of x := .wrap_float (floatOf x)
  of_to x := by cases x; exact congrArg _ (floatIso.of_to _)
  to_of x := floatIso.to_of x

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
theorem two_agrees : floatTo Rocq.Corelib.Floats.PrimFloat.two = two := rfl

def identity (x : nativeFloat) : nativeFloat := x
theorem parser_agrees (x : Rocq.Corelib.Floats.PrimFloat.float) :
    floatTo (Rocq.Corelib.Floats.PrimFloat.parser x) = identity (floatTo x) := rfl
theorem wrap_agrees (x : Rocq.Corelib.Floats.PrimFloat.float_wrapper) :
    floatTo (Rocq.Corelib.Floats.PrimFloat.float_wrap x) = identity (wrapperTo x) := by cases x; rfl
theorem printer_agrees (x : Rocq.Corelib.Floats.PrimFloat.float_wrapper) :
    floatTo (Rocq.Corelib.Floats.PrimFloat.printer x) = identity (wrapperTo x) := by cases x; rfl

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
theorem finiteTest_agrees (x : Rocq.Corelib.Floats.PrimFloat.float) :
    boolTo (Rocq.Corelib.Floats.PrimFloat.is_finite x) = finiteTest (floatTo x) := by
  unfold Rocq.Corelib.Floats.PrimFloat.is_finite
  rw [negb_agrees,orb_agrees,isNaN_agrees,infinityTest_agrees]
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
  for name in ["NativeBridge.Incremental.PrimFloatRepresentation.absolute", "NativeBridge.Incremental.PrimFloatRepresentation.bitsEqual", "NativeBridge.Incremental.PrimFloatRepresentation.classification", "NativeBridge.Incremental.PrimFloatRepresentation.comparison", "NativeBridge.Incremental.PrimFloatRepresentation.finiteTest", "NativeBridge.Incremental.PrimFloatRepresentation.identity", "NativeBridge.Incremental.PrimFloatRepresentation.ieeeEqual", "NativeBridge.Incremental.PrimFloatRepresentation.infinity", "NativeBridge.Incremental.PrimFloatRepresentation.infinityTest", "NativeBridge.Incremental.PrimFloatRepresentation.isNaN", "NativeBridge.Incremental.PrimFloatRepresentation.less", "NativeBridge.Incremental.PrimFloatRepresentation.lessEqual", "NativeBridge.Incremental.PrimFloatRepresentation.nan", "NativeBridge.Incremental.PrimFloatRepresentation.nativeComparison", "NativeBridge.Incremental.PrimFloatRepresentation.nativeFloat", "NativeBridge.Incremental.PrimFloatRepresentation.negate", "NativeBridge.Incremental.PrimFloatRepresentation.negativeInfinity", "NativeBridge.Incremental.PrimFloatRepresentation.negativeZero", "NativeBridge.Incremental.PrimFloatRepresentation.normalMantissa", "NativeBridge.Incremental.PrimFloatRepresentation.one", "NativeBridge.Incremental.PrimFloatRepresentation.two", "NativeBridge.Incremental.PrimFloatRepresentation.zero", "NativeBridge.Incremental.PrimFloatRepresentation.zeroTest"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

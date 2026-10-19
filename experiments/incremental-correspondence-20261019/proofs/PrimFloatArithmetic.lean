import PrimFloatRepresentation
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
  for name in ["NativeBridge.Incremental.PrimFloatArithmetic.addition", "NativeBridge.Incremental.PrimFloatArithmetic.division", "NativeBridge.Incremental.PrimFloatArithmetic.getSign", "NativeBridge.Incremental.PrimFloatArithmetic.multiplication", "NativeBridge.Incremental.PrimFloatArithmetic.subtraction"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

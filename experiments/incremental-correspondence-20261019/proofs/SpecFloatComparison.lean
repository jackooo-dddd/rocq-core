import SpecFloatNormalize
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
  for name in ["NativeBridge.Incremental.SpecFloatComparison.comparison", "NativeBridge.Incremental.SpecFloatComparison.equal", "NativeBridge.Incremental.SpecFloatComparison.less", "NativeBridge.Incremental.SpecFloatComparison.lessEqual"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

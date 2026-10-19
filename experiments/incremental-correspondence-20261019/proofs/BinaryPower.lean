import BinaryArithmetic
set_option autoImplicit false
noncomputable section
namespace NativeBridge.Incremental.BinaryPower
open NativeBridge NativeBridge.Incremental.BinaryArithmetic
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

abbrev powPosNative (z : Int) (p : Nat) : Int := z ^ p

theorem z_pow_pos_agrees (z : RIntBinary) (p : RPositive) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.pow_pos z p) = powPosNative (binaryIntTo z) (positiveTo p) := by
  change binaryIntTo (Rocq.Corelib.BinNums.PosDef.Pos.iter RIntBinary
    (Rocq.Corelib.BinNums.IntDef.Z.mul z) (.Zpos .xH) p) = _
  rw [positive_iter_transport binaryIntTo _ (binaryIntTo z * ·) (z_mul_agrees z)]
  exact repeat_mul _ _

def zPowNative (x y : Int) : Int := if y < 0 then 0 else x ^ y.toNat

theorem z_pow_agrees (x y : RIntBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.pow x y) = zPowNative (binaryIntTo x) (binaryIntTo y) := by
  cases y with
  | Z0 => simp [Rocq.Corelib.BinNums.IntDef.Z.pow, binaryIntTo, positiveTo, zPowNative]
  | Zpos p =>
    change binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.pow_pos x p) = zPowNative (binaryIntTo x) (positiveTo p)
    rw [z_pow_pos_agrees]
    simp only [zPowNative, if_neg (show ¬(positiveTo p : Int) < 0 by omega), Int.toNat_natCast]
  | Zneg p =>
    change 0 = zPowNative (binaryIntTo x) (-(positiveTo p : Int))
    have hp : 0 < positiveTo p := positiveTo_pos p
    simp only [zPowNative, if_pos (show -(positiveTo p : Int) < 0 by omega)]

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


theorem repeat_mul_start (x a : Int) (n : Nat) :
    repeatNative (x * ·) n a = x ^ n * a := by
  induction n with
  | zero => simp only [repeat_zero, Int.pow_zero, Int.one_mul]
  | succ n ih =>
    simp only [repeat_succ, ih, Int.pow_succ]
    rw [← Int.mul_assoc, Int.mul_comm x (x^n)]

theorem repeat_div_two (x : Int) (n : Nat) :
    repeatNative (· / 2) n x = x / (2 ^ n) := by
  induction n with
  | zero => simp only [repeat_zero, Int.pow_zero, Int.ediv_one]
  | succ n ih =>
    rw [repeat_succ, ih, Int.ediv_ediv_of_nonneg (Int.pow_nonneg (by decide : (0:Int) ≤ 2)),
      ← Int.pow_succ]

def shiftLeftNative (x n : Int) : Int :=
  if n < 0 then x / 2 ^ (-n).toNat else 2 ^ n.toNat * x

def shiftRightNative (x n : Int) : Int := shiftLeftNative x (-n)

theorem z_shiftl_agrees (x n : RIntBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.shiftl x n) =
      shiftLeftNative (binaryIntTo x) (binaryIntTo n) := by
  cases n with
  | Z0 =>
    change binaryIntTo x = shiftLeftNative (binaryIntTo x) 0
    simp [shiftLeftNative]
  | Zpos p =>
    change binaryIntTo (Rocq.Corelib.BinNums.PosDef.Pos.iter RIntBinary
      (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH))) x p) =
      shiftLeftNative (binaryIntTo x) (positiveTo p)
    rw [positive_iter_transport binaryIntTo _ ((2:Int) * ·) (z_mul_agrees (.Zpos (.xO .xH)))]
    rw [repeat_mul_start]
    simp only [shiftLeftNative, if_neg (show ¬(positiveTo p : Int) < 0 by omega), Int.toNat_natCast]
  | Zneg p =>
    change binaryIntTo (Rocq.Corelib.BinNums.PosDef.Pos.iter RIntBinary
      Rocq.Corelib.BinNums.IntDef.Z.div2 x p) = shiftLeftNative (binaryIntTo x) (-(positiveTo p : Int))
    rw [positive_iter_transport binaryIntTo _ (· / 2) NativeBridge.Incremental.BinaryInt.z_div2_agrees,
      repeat_div_two]
    have hp := positiveTo_pos p
    simp only [shiftLeftNative, if_pos (show -(positiveTo p : Int) < 0 by omega),
      Int.neg_neg, Int.toNat_natCast]

theorem z_opp_agrees (n : RIntBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.opp n) = -binaryIntTo n := by
  cases n <;> simp [Rocq.Corelib.BinNums.IntDef.Z.opp, binaryIntTo]

theorem z_shiftr_agrees (x n : RIntBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.shiftr x n) =
      shiftRightNative (binaryIntTo x) (binaryIntTo n) := by
  change binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.shiftl x (Rocq.Corelib.BinNums.IntDef.Z.opp n)) = _
  rw [z_shiftl_agrees, z_opp_agrees]
  rfl


-- Concrete uses of the general correspondence proofs, not additional Corelib roots.
theorem example_negative_exponent :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.pow (.Zneg (.xO .xH)) (.Zneg (.xI .xH))) = 0 := by
  rw [z_pow_agrees]
  decide

theorem example_negative_base :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.pow_pos (.Zneg (.xO .xH)) (.xI .xH)) = -8 := by
  rw [z_pow_pos_agrees]
  decide

theorem example_negative_right_shift :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.shiftr (.Zneg (.xI .xH)) (.Zpos .xH)) = -2 := by
  rw [z_shiftr_agrees]
  decide

theorem example_negative_shift_count :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.shiftl (.Zpos (.xI .xH)) (.Zneg .xH)) = 1 := by
  rw [z_shiftl_agrees]
  decide

end NativeBridge.Incremental.BinaryPower

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
  for name in ["NativeBridge.Incremental.BinaryPower.evenNative", "NativeBridge.Incremental.BinaryPower.powPosNative", "NativeBridge.Incremental.BinaryPower.repeatNative", "NativeBridge.Incremental.BinaryPower.shiftLeftNative", "NativeBridge.Incremental.BinaryPower.shiftRightNative", "NativeBridge.Incremental.BinaryPower.zPowNative"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

import BinaryBitwise
import Mathlib.Data.Int.Bitwise
set_option autoImplicit false
noncomputable section
namespace NativeBridge.Incremental.BinaryIntBitwise
open NativeBridge BinaryInt BinaryOrder BinaryBitwise

theorem positive_ldiff_mathlib_agrees (p q : RPositive) :
    binaryNatTo (Rocq.Corelib.BinNums.PosDef.Pos.ldiff p q) = Nat.ldiff (positiveTo p) (positiveTo q) :=
  positive_ldiff_agrees p q
theorem binaryNat_ldiff_mathlib_agrees (m n : RNatBinary) :
    binaryNatTo (Rocq.Corelib.BinNums.NatDef.N.ldiff m n) = Nat.ldiff (binaryNatTo m) (binaryNatTo n) :=
  binaryNat_ldiff_agrees m n

theorem zToZero : binaryIntTo .Z0 = 0 := rfl
theorem zToPos (p : RPositive) : binaryIntTo (.Zpos p) = Int.ofNat (positiveTo p) := rfl
theorem zToNeg (p : RPositive) : binaryIntTo (.Zneg p) = Int.negSucc (positiveTo p-1) := by
  change -(positiveTo p : Int) = _
  have := positiveTo_pos p
  omega
theorem zOfN_agrees (n : RNatBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.of_N n) = Int.ofNat (binaryNatTo n) := by
  cases n <;> rfl

theorem native_ldiff_zero_left (n : Nat) : Nat.ldiff 0 n = 0 := diff_zero_left n
theorem native_ldiff_zero_right (n : Nat) : Nat.ldiff n 0 = n := diff_zero_right n
theorem native_diff (m n : Nat) : diffNative m n = Nat.ldiff m n := rfl

theorem z_land_agrees (x y : RIntBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.land x y) = Int.land (binaryIntTo x) (binaryIntTo y) := by
  cases x <;> cases y <;>
    simp [Rocq.Corelib.BinNums.IntDef.Z.land, zToZero, zToPos, zToNeg, zOfN_agrees,
      binaryNatTo_pos, positive_land_agrees,
      binaryNat_ldiff_agrees, binaryNat_lor_agrees, positive_pred_N_agrees, n_succ_pos_agrees,
      Int.land, native_diff, native_ldiff_zero_left]

theorem z_lor_agrees (x y : RIntBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.lor x y) = Int.lor (binaryIntTo x) (binaryIntTo y) := by
  cases x <;> cases y <;>
    simp [Rocq.Corelib.BinNums.IntDef.Z.lor, zToZero, zToPos, zToNeg,
      binaryNatTo_pos, positive_lor_agrees,
      binaryNat_ldiff_agrees, binaryNat_land_agrees, positive_pred_N_agrees, n_succ_pos_agrees,
      Int.lor, native_diff, native_ldiff_zero_right]

theorem z_lxor_agrees (x y : RIntBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.lxor x y) = Int.xor (binaryIntTo x) (binaryIntTo y) := by
  cases x <;> cases y <;>
    simp [Rocq.Corelib.BinNums.IntDef.Z.lxor, zToZero, zToPos, zToNeg, zOfN_agrees,
      binaryNatTo_pos, positive_lxor_agrees,
      binaryNat_lxor_agrees, positive_pred_N_agrees, n_succ_pos_agrees,
      Int.xor]


theorem example_negative_and :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.land (binaryIntOf (-3)) (binaryIntOf 6)) = 4 := by
  rw [z_land_agrees, binaryInt_to_of, binaryInt_to_of]
  change (diffNative (BinaryBitwise.bit false 3) (BinaryBitwise.bit false 1) : Int) = 4
  rw [ldiff_bits]
  change (BinaryBitwise.bit false (diffNative (BinaryBitwise.bit true 1) (BinaryBitwise.bit true 0)) : Int) = 4
  rw [ldiff_bits, diff_zero_right]
  rfl
theorem example_negative_or :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.lor (binaryIntOf (-3)) (binaryIntOf (-6))) = -1 := by
  rw [z_lor_agrees, binaryInt_to_of, binaryInt_to_of]
  decide
theorem example_mixed_xor :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.lxor (binaryIntOf (-3)) (binaryIntOf 6)) = -5 := by
  rw [z_lxor_agrees, binaryInt_to_of, binaryInt_to_of]
  decide
theorem example_negative_xor :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.lxor (binaryIntOf (-3)) (binaryIntOf (-6))) = 7 := by
  rw [z_lxor_agrees, binaryInt_to_of, binaryInt_to_of]
  decide

-- Reuse a native bitwise theorem to prove a property of the mechanical operation.
theorem binaryNat_land_comm (m n : RNatBinary) :
    Rocq.Corelib.BinNums.NatDef.N.land m n = Rocq.Corelib.BinNums.NatDef.N.land n m := by
  apply binaryNatIso.injective
  change binaryNatTo _ = binaryNatTo _
  rw [binaryNat_land_agrees, binaryNat_land_agrees]
  exact Nat.and_comm _ _

end NativeBridge.Incremental.BinaryIntBitwise

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
  for name in ["Int.land", "Int.lor", "Int.xor", "Nat.ldiff"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

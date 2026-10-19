import BinaryInt
import Init.Data.Nat.Bitwise.Lemmas
set_option autoImplicit false
-- Uniform constructor case proofs share simplification sets.
set_option linter.unusedSimpArgs false
noncomputable section
namespace NativeBridge.Incremental.BinaryBitwise
open NativeBridge BinaryInt

def bit (b : Bool) (n : Nat) := 2*n + b.toNat
theorem testBit_bit_zero (b : Bool) (n : Nat) : (bit b n).testBit 0 = b := by
  cases b <;> simp [bit, Nat.testBit_zero, Nat.add_mod]
theorem testBit_bit_succ (b : Bool) (n i : Nat) : (bit b n).testBit (i+1) = n.testBit i := by
  rw [Nat.testBit_add_one]
  have h : bit b n / 2 = n := by cases b <;> simp [bit, Nat.add_div, Nat.mul_comm]
  rw [h]

theorem bitwise_bit (f : Bool → Bool → Bool) (h : f false false = false)
    (a b : Bool) (m n : Nat) :
    Nat.bitwise f (bit a m) (bit b n) = bit (f a b) (Nat.bitwise f m n) := by
  apply Nat.eq_of_testBit_eq
  intro i
  rw [Nat.testBit_bitwise h]
  cases i with
  | zero => simp only [testBit_bit_zero]
  | succ i => simp only [testBit_bit_succ, Nat.testBit_bitwise h]



def diffNative (m n : Nat) := Nat.bitwise (fun a b => a && !b) m n

theorem land_bits (a b : Bool) (m n : Nat) :
    Nat.land (bit a m) (bit b n) = bit (Bool.and a b) (Nat.land m n) := by
  exact bitwise_bit Bool.and (by rfl) a b m n

theorem lor_bits (a b : Bool) (m n : Nat) :
    Nat.lor (bit a m) (bit b n) = bit (Bool.or a b) (Nat.lor m n) := by
  exact bitwise_bit Bool.or (by rfl) a b m n

theorem lxor_bits (a b : Bool) (m n : Nat) :
    Nat.xor (bit a m) (bit b n) = bit (Bool.xor a b) (Nat.xor m n) := by
  exact bitwise_bit Bool.xor (by rfl) a b m n

theorem ldiff_bits (a b : Bool) (m n : Nat) :
    diffNative (bit a m) (bit b n) = bit ((fun a b => a && !b) a b) (diffNative m n) := by
  exact bitwise_bit (fun a b => a && !b) (by rfl) a b m n



theorem diff_zero_left (n : Nat) : diffNative 0 n = 0 := by simp [diffNative, Nat.bitwise]
theorem diff_zero_right (n : Nat) : diffNative n 0 = n := by
  by_cases h : n = 0 <;> simp [diffNative, Nat.bitwise, h]
theorem binaryNatTo_zero : binaryNatTo .N0 = 0 := rfl
theorem binaryNatTo_pos (p : RPositive) : binaryNatTo (.Npos p) = positiveTo p := rfl
theorem positiveTo_bit_I (p : RPositive) : positiveTo (.xI p) = bit true (positiveTo p) := rfl
theorem positiveTo_bit_O (p : RPositive) : positiveTo (.xO p) = bit false (positiveTo p) := rfl
theorem positiveTo_bit_H : positiveTo (.xH : RPositive) = bit true 0 := rfl

theorem pos_land_II (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.land (.xI p) (.xI q) = Rocq.Corelib.BinNums.PosDef.Pos.Nsucc_double (Rocq.Corelib.BinNums.PosDef.Pos.land p q) := rfl

theorem pos_land_IO (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.land (.xI p) (.xO q) = Rocq.Corelib.BinNums.PosDef.Pos.Ndouble (Rocq.Corelib.BinNums.PosDef.Pos.land p q) := rfl

theorem pos_land_IH (p : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.land (.xI p) .xH = Rocq.Corelib.Numbers.BinNums.N.Npos .xH := rfl

theorem pos_land_OI (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.land (.xO p) (.xI q) = Rocq.Corelib.BinNums.PosDef.Pos.Ndouble (Rocq.Corelib.BinNums.PosDef.Pos.land p q) := rfl

theorem pos_land_OO (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.land (.xO p) (.xO q) = Rocq.Corelib.BinNums.PosDef.Pos.Ndouble (Rocq.Corelib.BinNums.PosDef.Pos.land p q) := rfl

theorem pos_land_OH (p : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.land (.xO p) .xH = Rocq.Corelib.Numbers.BinNums.N.N0 := rfl

theorem pos_land_HI (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.land .xH (.xI q) = Rocq.Corelib.Numbers.BinNums.N.Npos .xH := rfl

theorem pos_land_HO (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.land .xH (.xO q) = Rocq.Corelib.Numbers.BinNums.N.N0 := rfl

theorem pos_land_HH : Rocq.Corelib.BinNums.PosDef.Pos.land .xH .xH = Rocq.Corelib.Numbers.BinNums.N.Npos .xH := rfl

theorem positive_land_agrees (p q : RPositive) :
    binaryNatTo (Rocq.Corelib.BinNums.PosDef.Pos.land p q) = Nat.land (positiveTo p) (positiveTo q) := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec generalizing q with
  | xI p ih =>
    cases q <;> simp only [pos_land_II, pos_land_IO, pos_land_IH, pos_land_OI, pos_land_OO, pos_land_OH, pos_land_HI, pos_land_HO, pos_land_HH, pos_Ndouble_agrees, pos_Nsucc_double_agrees, binaryNatTo_zero, binaryNatTo_pos, positiveTo_bit_I, positiveTo_bit_O, positiveTo_bit_H]
    all_goals simp only [land_bits, ih, Nat.zero_and, Nat.and_zero, Nat.zero_or, Nat.or_zero, Nat.zero_xor, Nat.xor_zero, diff_zero_left, diff_zero_right]
    all_goals simp [bit]
  | xO p ih =>
    cases q <;> simp only [pos_land_II, pos_land_IO, pos_land_IH, pos_land_OI, pos_land_OO, pos_land_OH, pos_land_HI, pos_land_HO, pos_land_HH, pos_Ndouble_agrees, pos_Nsucc_double_agrees, binaryNatTo_zero, binaryNatTo_pos, positiveTo_bit_I, positiveTo_bit_O, positiveTo_bit_H]
    all_goals simp only [land_bits, ih, Nat.zero_and, Nat.and_zero, Nat.zero_or, Nat.or_zero, Nat.zero_xor, Nat.xor_zero, diff_zero_left, diff_zero_right]
    all_goals simp [bit]
  | xH =>
    cases q <;> simp only [pos_land_II, pos_land_IO, pos_land_IH, pos_land_OI, pos_land_OO, pos_land_OH, pos_land_HI, pos_land_HO, pos_land_HH, pos_Ndouble_agrees, pos_Nsucc_double_agrees, binaryNatTo_zero, binaryNatTo_pos, positiveTo_bit_I, positiveTo_bit_O, positiveTo_bit_H]
    all_goals simp only [land_bits, Nat.zero_and, Nat.and_zero, Nat.zero_or, Nat.or_zero, Nat.zero_xor, Nat.xor_zero, diff_zero_left, diff_zero_right]
    all_goals simp [bit]

theorem pos_lor_II (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.lor (.xI p) (.xI q) = (Rocq.Corelib.BinNums.PosDef.Pos.lor p q).xI := rfl

theorem pos_lor_IO (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.lor (.xI p) (.xO q) = (Rocq.Corelib.BinNums.PosDef.Pos.lor p q).xI := rfl

theorem pos_lor_IH (p : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.lor (.xI p) .xH = p.xI := rfl

theorem pos_lor_OI (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.lor (.xO p) (.xI q) = (Rocq.Corelib.BinNums.PosDef.Pos.lor p q).xI := rfl

theorem pos_lor_OO (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.lor (.xO p) (.xO q) = (Rocq.Corelib.BinNums.PosDef.Pos.lor p q).xO := rfl

theorem pos_lor_OH (p : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.lor (.xO p) .xH = p.xI := rfl

theorem pos_lor_HI (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.lor .xH (.xI q) = q.xI := rfl

theorem pos_lor_HO (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.lor .xH (.xO q) = q.xI := rfl

theorem pos_lor_HH : Rocq.Corelib.BinNums.PosDef.Pos.lor .xH .xH = .xH := rfl

theorem positive_lor_agrees (p q : RPositive) :
    positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.lor p q) = Nat.lor (positiveTo p) (positiveTo q) := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec generalizing q with
  | xI p ih =>
    cases q <;> simp only [pos_lor_II, pos_lor_IO, pos_lor_IH, pos_lor_OI, pos_lor_OO, pos_lor_OH, pos_lor_HI, pos_lor_HO, pos_lor_HH, pos_Ndouble_agrees, pos_Nsucc_double_agrees, binaryNatTo_zero, binaryNatTo_pos, positiveTo_bit_I, positiveTo_bit_O, positiveTo_bit_H]
    all_goals simp only [lor_bits, ih, Nat.zero_and, Nat.and_zero, Nat.zero_or, Nat.or_zero, Nat.zero_xor, Nat.xor_zero, diff_zero_left, diff_zero_right]
    all_goals simp [bit]
  | xO p ih =>
    cases q <;> simp only [pos_lor_II, pos_lor_IO, pos_lor_IH, pos_lor_OI, pos_lor_OO, pos_lor_OH, pos_lor_HI, pos_lor_HO, pos_lor_HH, pos_Ndouble_agrees, pos_Nsucc_double_agrees, binaryNatTo_zero, binaryNatTo_pos, positiveTo_bit_I, positiveTo_bit_O, positiveTo_bit_H]
    all_goals simp only [lor_bits, ih, Nat.zero_and, Nat.and_zero, Nat.zero_or, Nat.or_zero, Nat.zero_xor, Nat.xor_zero, diff_zero_left, diff_zero_right]
    all_goals simp [bit]
  | xH =>
    cases q <;> simp only [pos_lor_II, pos_lor_IO, pos_lor_IH, pos_lor_OI, pos_lor_OO, pos_lor_OH, pos_lor_HI, pos_lor_HO, pos_lor_HH, pos_Ndouble_agrees, pos_Nsucc_double_agrees, binaryNatTo_zero, binaryNatTo_pos, positiveTo_bit_I, positiveTo_bit_O, positiveTo_bit_H]
    all_goals simp only [lor_bits, Nat.zero_and, Nat.and_zero, Nat.zero_or, Nat.or_zero, Nat.zero_xor, Nat.xor_zero, diff_zero_left, diff_zero_right]
    all_goals simp [bit]

theorem pos_lxor_II (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.lxor (.xI p) (.xI q) = Rocq.Corelib.BinNums.PosDef.Pos.Ndouble (Rocq.Corelib.BinNums.PosDef.Pos.lxor p q) := rfl

theorem pos_lxor_IO (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.lxor (.xI p) (.xO q) = Rocq.Corelib.BinNums.PosDef.Pos.Nsucc_double (Rocq.Corelib.BinNums.PosDef.Pos.lxor p q) := rfl

theorem pos_lxor_IH (p : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.lxor (.xI p) .xH = Rocq.Corelib.Numbers.BinNums.N.Npos p.xO := rfl

theorem pos_lxor_OI (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.lxor (.xO p) (.xI q) = Rocq.Corelib.BinNums.PosDef.Pos.Nsucc_double (Rocq.Corelib.BinNums.PosDef.Pos.lxor p q) := rfl

theorem pos_lxor_OO (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.lxor (.xO p) (.xO q) = Rocq.Corelib.BinNums.PosDef.Pos.Ndouble (Rocq.Corelib.BinNums.PosDef.Pos.lxor p q) := rfl

theorem pos_lxor_OH (p : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.lxor (.xO p) .xH = Rocq.Corelib.Numbers.BinNums.N.Npos p.xI := rfl

theorem pos_lxor_HI (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.lxor .xH (.xI q) = Rocq.Corelib.Numbers.BinNums.N.Npos q.xO := rfl

theorem pos_lxor_HO (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.lxor .xH (.xO q) = Rocq.Corelib.Numbers.BinNums.N.Npos q.xI := rfl

theorem pos_lxor_HH : Rocq.Corelib.BinNums.PosDef.Pos.lxor .xH .xH = Rocq.Corelib.Numbers.BinNums.N.N0 := rfl

theorem positive_lxor_agrees (p q : RPositive) :
    binaryNatTo (Rocq.Corelib.BinNums.PosDef.Pos.lxor p q) = Nat.xor (positiveTo p) (positiveTo q) := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec generalizing q with
  | xI p ih =>
    cases q <;> simp only [pos_lxor_II, pos_lxor_IO, pos_lxor_IH, pos_lxor_OI, pos_lxor_OO, pos_lxor_OH, pos_lxor_HI, pos_lxor_HO, pos_lxor_HH, pos_Ndouble_agrees, pos_Nsucc_double_agrees, binaryNatTo_zero, binaryNatTo_pos, positiveTo_bit_I, positiveTo_bit_O, positiveTo_bit_H]
    all_goals simp only [lxor_bits, ih, Nat.zero_and, Nat.and_zero, Nat.zero_or, Nat.or_zero, Nat.zero_xor, Nat.xor_zero, diff_zero_left, diff_zero_right]
    all_goals simp [bit]
  | xO p ih =>
    cases q <;> simp only [pos_lxor_II, pos_lxor_IO, pos_lxor_IH, pos_lxor_OI, pos_lxor_OO, pos_lxor_OH, pos_lxor_HI, pos_lxor_HO, pos_lxor_HH, pos_Ndouble_agrees, pos_Nsucc_double_agrees, binaryNatTo_zero, binaryNatTo_pos, positiveTo_bit_I, positiveTo_bit_O, positiveTo_bit_H]
    all_goals simp only [lxor_bits, ih, Nat.zero_and, Nat.and_zero, Nat.zero_or, Nat.or_zero, Nat.zero_xor, Nat.xor_zero, diff_zero_left, diff_zero_right]
    all_goals simp [bit]
  | xH =>
    cases q <;> simp only [pos_lxor_II, pos_lxor_IO, pos_lxor_IH, pos_lxor_OI, pos_lxor_OO, pos_lxor_OH, pos_lxor_HI, pos_lxor_HO, pos_lxor_HH, pos_Ndouble_agrees, pos_Nsucc_double_agrees, binaryNatTo_zero, binaryNatTo_pos, positiveTo_bit_I, positiveTo_bit_O, positiveTo_bit_H]
    all_goals simp only [lxor_bits, Nat.zero_and, Nat.and_zero, Nat.zero_or, Nat.or_zero, Nat.zero_xor, Nat.xor_zero, diff_zero_left, diff_zero_right]
    all_goals simp [bit]

theorem pos_ldiff_II (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.ldiff (.xI p) (.xI q) = Rocq.Corelib.BinNums.PosDef.Pos.Ndouble (Rocq.Corelib.BinNums.PosDef.Pos.ldiff p q) := rfl

theorem pos_ldiff_IO (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.ldiff (.xI p) (.xO q) = Rocq.Corelib.BinNums.PosDef.Pos.Nsucc_double (Rocq.Corelib.BinNums.PosDef.Pos.ldiff p q) := rfl

theorem pos_ldiff_IH (p : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.ldiff (.xI p) .xH = Rocq.Corelib.Numbers.BinNums.N.Npos p.xO := rfl

theorem pos_ldiff_OI (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.ldiff (.xO p) (.xI q) = Rocq.Corelib.BinNums.PosDef.Pos.Ndouble (Rocq.Corelib.BinNums.PosDef.Pos.ldiff p q) := rfl

theorem pos_ldiff_OO (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.ldiff (.xO p) (.xO q) = Rocq.Corelib.BinNums.PosDef.Pos.Ndouble (Rocq.Corelib.BinNums.PosDef.Pos.ldiff p q) := rfl

theorem pos_ldiff_OH (p : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.ldiff (.xO p) .xH = Rocq.Corelib.Numbers.BinNums.N.Npos p.xO := rfl

theorem pos_ldiff_HI (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.ldiff .xH (.xI q) = Rocq.Corelib.Numbers.BinNums.N.N0 := rfl

theorem pos_ldiff_HO (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.ldiff .xH (.xO q) = Rocq.Corelib.Numbers.BinNums.N.Npos .xH := rfl

theorem pos_ldiff_HH : Rocq.Corelib.BinNums.PosDef.Pos.ldiff .xH .xH = Rocq.Corelib.Numbers.BinNums.N.N0 := rfl

theorem positive_ldiff_agrees (p q : RPositive) :
    binaryNatTo (Rocq.Corelib.BinNums.PosDef.Pos.ldiff p q) = diffNative (positiveTo p) (positiveTo q) := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec generalizing q with
  | xI p ih =>
    cases q <;> simp only [pos_ldiff_II, pos_ldiff_IO, pos_ldiff_IH, pos_ldiff_OI, pos_ldiff_OO, pos_ldiff_OH, pos_ldiff_HI, pos_ldiff_HO, pos_ldiff_HH, pos_Ndouble_agrees, pos_Nsucc_double_agrees, binaryNatTo_zero, binaryNatTo_pos, positiveTo_bit_I, positiveTo_bit_O, positiveTo_bit_H]
    all_goals simp only [ldiff_bits, ih, Nat.zero_and, Nat.and_zero, Nat.zero_or, Nat.or_zero, Nat.zero_xor, Nat.xor_zero, diff_zero_left, diff_zero_right]
    all_goals simp [bit]
  | xO p ih =>
    cases q <;> simp only [pos_ldiff_II, pos_ldiff_IO, pos_ldiff_IH, pos_ldiff_OI, pos_ldiff_OO, pos_ldiff_OH, pos_ldiff_HI, pos_ldiff_HO, pos_ldiff_HH, pos_Ndouble_agrees, pos_Nsucc_double_agrees, binaryNatTo_zero, binaryNatTo_pos, positiveTo_bit_I, positiveTo_bit_O, positiveTo_bit_H]
    all_goals simp only [ldiff_bits, ih, Nat.zero_and, Nat.and_zero, Nat.zero_or, Nat.or_zero, Nat.zero_xor, Nat.xor_zero, diff_zero_left, diff_zero_right]
    all_goals simp [bit]
  | xH =>
    cases q <;> simp only [pos_ldiff_II, pos_ldiff_IO, pos_ldiff_IH, pos_ldiff_OI, pos_ldiff_OO, pos_ldiff_OH, pos_ldiff_HI, pos_ldiff_HO, pos_ldiff_HH, pos_Ndouble_agrees, pos_Nsucc_double_agrees, binaryNatTo_zero, binaryNatTo_pos, positiveTo_bit_I, positiveTo_bit_O, positiveTo_bit_H]
    all_goals simp only [ldiff_bits, Nat.zero_and, Nat.and_zero, Nat.zero_or, Nat.or_zero, Nat.zero_xor, Nat.xor_zero, diff_zero_left, diff_zero_right]
    all_goals simp [bit]



theorem binaryNat_land_agrees (m n : RNatBinary) :
    binaryNatTo (Rocq.Corelib.BinNums.NatDef.N.land m n) = Nat.land (binaryNatTo m) (binaryNatTo n) := by
  cases m <;> cases n <;> simp [Rocq.Corelib.BinNums.NatDef.N.land, binaryNatTo_zero, binaryNatTo_pos, positive_land_agrees, diff_zero_left, diff_zero_right]

theorem binaryNat_lor_agrees (m n : RNatBinary) :
    binaryNatTo (Rocq.Corelib.BinNums.NatDef.N.lor m n) = Nat.lor (binaryNatTo m) (binaryNatTo n) := by
  cases m <;> cases n <;> simp [Rocq.Corelib.BinNums.NatDef.N.lor, binaryNatTo_zero, binaryNatTo_pos, positive_lor_agrees, diff_zero_left, diff_zero_right]

theorem binaryNat_lxor_agrees (m n : RNatBinary) :
    binaryNatTo (Rocq.Corelib.BinNums.NatDef.N.lxor m n) = Nat.xor (binaryNatTo m) (binaryNatTo n) := by
  cases m <;> cases n <;> simp [Rocq.Corelib.BinNums.NatDef.N.lxor, binaryNatTo_zero, binaryNatTo_pos, positive_lxor_agrees, diff_zero_left, diff_zero_right]

theorem binaryNat_ldiff_agrees (m n : RNatBinary) :
    binaryNatTo (Rocq.Corelib.BinNums.NatDef.N.ldiff m n) = diffNative (binaryNatTo m) (binaryNatTo n) := by
  cases m <;> cases n <;> simp [Rocq.Corelib.BinNums.NatDef.N.ldiff, binaryNatTo_zero, binaryNatTo_pos, positive_ldiff_agrees, diff_zero_left, diff_zero_right]

end NativeBridge.Incremental.BinaryBitwise

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
  for name in ["Nat.land", "Nat.lor", "Nat.xor", "NativeBridge.Incremental.BinaryBitwise.diffNative"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

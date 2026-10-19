import Uint63Operations
set_option maxRecDepth 4096
set_option maxHeartbeats 50000
noncomputable section
namespace NativeBridge.Incremental.Uint63Conversions
open NativeBridge.Incremental.Uint63Operations

def positiveFuel (n p : Nat) : Word := BitVec.ofNat 63 (p % 2^n)
def recWord (n : MN) (p : RPositive) : Word :=
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_pos_rec n p
theorem ofPosRec_zero (p : RPositive) :
    recWord .O p = (0 : Word) := by cases p <;> rfl
theorem ofPosRec_xO (n : MN) (p : RPositive) :
    recWord (.S n) (.xO p) =
      BitVec.shiftLeft (recWord n p) 1 :=
  int63_lsl_agrees _ (1 : Word)
theorem ofPosRec_xI (n : MN) (p : RPositive) :
    recWord (.S n) (.xI p) =
      (BitVec.shiftLeft (recWord n p) 1) ||| (1 : Word) := by
  have h1 := int63_lor_agrees
    (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsl
      (recWord n p) (1#63)) (1 : Word)
  have h2 := congrArg (fun x : Word => BitVec.or x (1#63))
    (int63_lsl_agrees (recWord n p) (1#63))
  exact h1.trans h2
theorem ofPosRec_bits (n : MN) (p : RPositive) (i : Nat) (hi : i < 63) :
    (recWord n p).getLsbD i =
      (decide (i < natTo n) && (positiveTo p).testBit i) := by
  induction p generalizing n i with
  | xH =>
    cases n with
    | O => rw [ofPosRec_zero]; simp [natTo]
    | S n =>
      change (1#63).getLsbD i = (decide (i < natTo n + 1) && (1 : Nat).testBit i)
      cases i with
      | zero => simp
      | succ i => simp [Nat.testBit_succ]
  | xO p ih =>
    cases n with
    | O => rw [ofPosRec_zero]; simp [natTo]
    | S n =>
      have h := congrArg (fun x : Word => x.getLsbD i) (ofPosRec_xO n p)
      apply h.trans
      cases i with
      | zero => simp [natTo_succ, positiveTo_xO]
      | succ i =>
        have hi' : i < 63 := by omega
        have hp : (2*positiveTo p)/2 = positiveTo p := by omega
        simp [hi, natTo_succ, positiveTo_xO, Nat.testBit_succ, hp]
        simpa [BitVec.getLsbD_eq_getElem, hi'] using ih n i hi'
  | xI p ih =>
    cases n with
    | O => rw [ofPosRec_zero]; simp [natTo]
    | S n =>
      have h := congrArg (fun x : Word => x.getLsbD i) (ofPosRec_xI n p)
      apply h.trans
      cases i with
      | zero => simp [natTo_succ, positiveTo_xI]
      | succ i =>
        have hi' : i < 63 := by omega
        have hp : (2*positiveTo p+1)/2 = positiveTo p := by omega
        simp [hi, natTo_succ, positiveTo_xI, Nat.testBit_succ, hp]
        simpa [BitVec.getLsbD_eq_getElem, hi'] using ih n i hi'

theorem ofPosRec_agrees (n : MN) (p : RPositive) :
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_pos_rec n p =
      positiveFuel (natTo n) (positiveTo p) := by
  apply BitVec.eq_of_getLsbD_eq
  intro i hi
  change (recWord n p).getLsbD i = _
  rw [ofPosRec_bits n p i hi]
  change _ = (BitVec.ofNat 63 (positiveTo p % 2^natTo n)).getLsbD i
  simp only [BitVec.getLsbD_ofNat, Nat.testBit_mod_two_pow, hi, decide_true, Bool.true_and]
def ofPositive (p : Nat) : Word := BitVec.ofNat 63 p
theorem ofPos_agrees (p : RPositive) :
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_pos p = ofPositive (positiveTo p) := by
  have h := ofPosRec_agrees Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.size p
  change Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_pos_rec Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.size p = _
  rw [h]
  apply BitVec.eq_of_toNat_eq
  simp [positiveFuel, ofPositive, size_agrees, bitCount]

abbrev RZ := Rocq.Corelib.Numbers.BinNums.Z
def zTo : RZ → Int
  | .Z0 => 0
  | .Zpos p => Int.ofNat (positiveTo p)
  | .Zneg p => -(Int.ofNat (positiveTo p))
def ofInteger (z : Int) : Word := BitVec.ofInt 63 z
theorem ofZ_agrees (z : RZ) :
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_Z z = ofInteger (zTo z) := by
  cases z with
  | Z0 => rfl
  | Zpos p =>
    change Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_pos p = _
    simpa [ofInteger, zTo, ofPositive] using ofPos_agrees p
  | Zneg p =>
    have h1 := int63_sub_agrees (0 : Word) (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_pos p)
    have h2 := congrArg (fun a : Word => (0 : Word)-a) (ofPos_agrees p)
    apply (h1.trans h2).trans
    simp [ofInteger, zTo, ofPositive, BitVec.ofInt_neg]
    rfl
def wordBase : Int := 2^63
theorem wordBase_agrees : zTo Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB = wordBase := rfl

theorem positive_pred_double (p : RPositive) :
    positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p) = 2*positiveTo p-1 := by
  induction p with
  | xI p ih => change 2*(2*positiveTo p)+1 = 2*(2*positiveTo p+1)-1; omega
  | xO p ih =>
    change 2*positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p)+1 = 2*(2*positiveTo p)-1
    rw [ih]; have := positiveTo_pos p; omega
  | xH => rfl
theorem zDouble_agrees (z : RZ) :
    zTo (Rocq.Corelib.BinNums.IntDef.Z.double z) = 2*zTo z := by
  cases z <;> simp only [Rocq.Corelib.BinNums.IntDef.Z.double,zTo,positiveTo_xO,Int.ofNat_eq_natCast] <;> omega
theorem zSuccDouble_agrees (z : RZ) :
    zTo (Rocq.Corelib.BinNums.IntDef.Z.succ_double z) = 2*zTo z+1 := by
  cases z with
  | Z0 => rfl
  | Zpos p => change (2*positiveTo p+1 : Int) = 2*(positiveTo p : Int)+1; omega
  | Zneg p =>
    change -(positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p) : Int) = 2*(-(positiveTo p : Int))+1
    rw [positive_pred_double]; have := positiveTo_pos p; omega
theorem boolDouble (b : RBool) (z : RZ) :
    zTo (Rocq.Corelib.Init.Datatypes.bool.rec (motive := fun _ => Rocq.Corelib.Numbers.BinNums.Z → Rocq.Corelib.Numbers.BinNums.Z)
      Rocq.Corelib.BinNums.IntDef.Z.double Rocq.Corelib.BinNums.IntDef.Z.succ_double b z) =
      if boolTo b then 2*zTo z else 2*zTo z+1 := by
  cases b with
  | true => exact zDouble_agrees z
  | false => exact zSuccDouble_agrees z
theorem toZRec_succ (n : MN) (x : Word) :
    zTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z_rec (.S n) x) =
      if isEven x then
        2*zTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z_rec n
          (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr x (1#63)))
      else 2*zTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z_rec n
          (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr x (1#63)))+1 := by
  let z : RZ := Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z_rec n
    (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr x (1#63))
  have h₁ := boolDouble (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.is_even x) z
  have h₂ := congrArg (fun b : Bool => if b then 2*zTo z else 2*zTo z+1) (isEven_agrees x)
  have hs : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z_rec (.S n) x =
      Rocq.Corelib.Init.Datatypes.bool.rec (motive := fun _ => Rocq.Corelib.Numbers.BinNums.Z → Rocq.Corelib.Numbers.BinNums.Z)
        Rocq.Corelib.BinNums.IntDef.Z.double Rocq.Corelib.BinNums.IntDef.Z.succ_double
        (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.is_even x) z := by
        dsimp only [z, RZ, Word, Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z_rec]
  rw [hs]
  simpa only [RZ, z] using h₁.trans h₂

def unsignedFuel (n : Nat) (x : Word) : Int := Int.ofNat (x.toNat % 2^n)
theorem toZRec_agrees (n : MN) (x : Word) :
    zTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z_rec n x) = unsignedFuel (natTo n) x := by
  induction n generalizing x with
  | O =>
    change (0 : Int) = Int.ofNat (x.toNat % 1)
    simp
  | S n ih =>
    rw [toZRec_succ]
    have hs := int63_lsr_agrees x (1 : Word)
    have hsN : (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr x (1#63)).toNat = x.toNat/2 := by
      apply (congrArg BitVec.toNat hs).trans
      simp [Nat.shiftRight_eq_div_pow]
    have hi := ih (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr x (1#63))
    unfold unsignedFuel at hi
    rw [hsN] at hi
    rw [hi]
    have hmod : x.toNat % 2 = if isEven x then 0 else 1 := by
      have hm := Nat.mod_lt x.toNat (by decide : 0 < 2)
      unfold isEven BitVec.getLsbD
      rw [Nat.testBit_zero]
      by_cases h : x.toNat % 2 = 1 <;> simp_all <;> omega
    unfold unsignedFuel
    rw [natTo_succ, Nat.pow_succ', Nat.mod_mul, hmod]
    cases isEven x <;> simp <;> omega
def unsignedInteger (x : Word) : Int := Int.ofNat x.toNat
theorem toZ_agrees (x : Word) :
    zTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x) = unsignedInteger x := by
  have h := toZRec_agrees Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.size x
  change zTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z_rec
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.size x) = _
  simpa [unsignedFuel, unsignedInteger, size_agrees, bitCount, Nat.mod_eq_of_lt x.isLt] using h

end NativeBridge.Incremental.Uint63Conversions

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
  for name in ["NativeBridge.Incremental.Uint63Conversions.ofInteger", "NativeBridge.Incremental.Uint63Conversions.ofPositive", "NativeBridge.Incremental.Uint63Conversions.positiveFuel", "NativeBridge.Incremental.Uint63Conversions.unsignedFuel", "NativeBridge.Incremental.Uint63Conversions.unsignedInteger", "NativeBridge.Incremental.Uint63Conversions.wordBase"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

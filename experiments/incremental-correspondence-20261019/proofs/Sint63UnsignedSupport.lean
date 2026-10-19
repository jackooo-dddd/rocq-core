import Interface_Numbers_Cyclic_Int63_Sint63Axioms
import Init.Data.BitVec.Lemmas
set_option maxHeartbeats 100000
set_option maxRecDepth 4096
noncomputable section
namespace NativeBridge.Incremental.Sint63UnsignedSupport
abbrev Word := BitVec 63
def bitCount : Nat := 63
def isZero (x : Word) : Bool := x == 0
def isEven (x : Word) : Bool := !x.getLsbD 0
def RZ := Rocq.Corelib.Numbers.BinNums.Z
def zTo : RZ → Int
  | .Z0 => 0
  | .Zpos p => Int.ofNat (positiveTo p)
  | .Zneg p => -Int.ofNat (positiveTo p)
theorem size_agrees : natTo Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.size = bitCount := rfl
-- Rechecked from Uint63Operations and Uint63Conversions in this source closure.
theorem isZero_agrees (x : Word) :
    boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.is_zero x) = isZero x := by
  change boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.eqb x (0 : Word)) = _
  have h := int63_eqb_agrees x (0 : Word)
  apply h.trans
  unfold isZero
  simp only [Bool.beq_eq_decide_eq, ← BitVec.toNat_inj]

theorem word_bitwise_bits (f : Bool → Bool → Bool) (n a b i : Nat) :
 (Rocq2Lean.PrimInt63.bitwise f n a b).testBit i =
 (decide (i < n) && f (a.testBit i) (b.testBit i)) := by
 induction n generalizing a b i with
 | zero => change (0 : Nat).testBit i = _; simp
 | succ n ih =>
   rw [Rocq2Lean.PrimInt63.bitwise]
   have ha : (a % 2 == 1) = a.testBit 0 := by simp [Bool.beq_eq_decide_eq]
   have hb : (b % 2 == 1) = b.testBit 0 := by simp [Bool.beq_eq_decide_eq]
   rw [ha,hb]
   cases i with
   | zero =>
     rw [Nat.testBit_zero]
     cases h : f (a.testBit 0) (b.testBit 0) <;> simp [Nat.add_mod]
   | succ i =>
     rw [Nat.testBit_succ]
     have low : (if f (a.testBit 0) (b.testBit 0) then 1 else 0) < 2 := by
       cases f (a.testBit 0) (b.testBit 0) <;> decide
     have half : ((if f (a.testBit 0) (b.testBit 0) then 1 else 0) +
       2 * Rocq2Lean.PrimInt63.bitwise f n (a/2) (b/2)) / 2 =
       Rocq2Lean.PrimInt63.bitwise f n (a/2) (b/2) := by omega
     rw [half, ih, Nat.testBit_succ, Nat.testBit_succ]
     simp
theorem word_bitwise_agrees (f : Bool → Bool → Bool) (hff : f false false = false) (n a b : Nat) :
 Rocq2Lean.PrimInt63.bitwise f n a b = Nat.bitwise f a b % 2^n := by
 apply Nat.eq_of_testBit_eq
 intro i
 rw [word_bitwise_bits, Nat.testBit_mod_two_pow, Nat.testBit_bitwise hff]
@[simp] theorem int63_land_agrees (x y : BitVec 63) :
 Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.land x y = x &&& y := by
 apply BitVec.eq_of_toNat_eq
 simp only [Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.land, Rocq2Lean.PrimInt63.land,
  BitVec.toNat_ofNat, word_bitwise_agrees Bool.and rfl, Nat.mod_mod, BitVec.toNat_and]
 exact Nat.mod_eq_of_lt (Nat.lt_of_le_of_lt Nat.and_le_left x.isLt)
@[simp] theorem int63_lsr_agrees (x y : BitVec 63) :
 Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr x y = x >>> y.toNat := by
 change (if y.toNat < 63 then BitVec.ofNat 63 (x.toNat >>> y.toNat) else BitVec.ofNat 63 0) = _
 by_cases h : y.toNat < 63
 · simp only [h, if_true]
   apply BitVec.eq_of_toNat_eq
   simp only [BitVec.toNat_ofNat, BitVec.toNat_ushiftRight]
   exact Nat.mod_eq_of_lt (Nat.lt_of_le_of_lt (Nat.shiftRight_le _ _) x.isLt)
 · simp [h, BitVec.ushiftRight_eq_zero (by omega : 63 ≤ y.toNat)]


theorem isEven_agrees (x : Word) :
    boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.is_even x) = isEven x := by
  change boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.is_zero
    (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.land x (1 : Word))) = _
  have h1 := isZero_agrees (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.land x (1 : Word))
  have h2 := congrArg isZero (int63_land_agrees x (1 : Word))
  apply (h1.trans h2).trans
  unfold isZero isEven
  change ((x &&& 1#63) == 0#63) = !x.getLsbD 0
  have hm := BitVec.and_one_eq_setWidth_ofBool_getLsbD (x := x)
  exact (congrArg (fun a : Word => a == 0#63) hm).trans (by cases x.getLsbD 0 <;> rfl)

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

end NativeBridge.Incremental.Sint63UnsignedSupport

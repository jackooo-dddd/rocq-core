import Interface_Numbers_Cyclic_Int63_Uint63Axioms
import Init.Data.BitVec.Lemmas
set_option maxHeartbeats 300000
set_option maxRecDepth 4096
noncomputable section
namespace NativeBridge.Incremental.Uint63Operations

abbrev Word := BitVec 63
def carryTo : Rocq.Corelib.Numbers.Cyclic.Int63.CarryType.carry Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int → Bool × Word
  | .C0 _ x => (false,x)
  | .C1 _ x => (true,x)
def width : Word := 63
def bitCount : Nat := 63
def largest : Word := BitVec.ofNat 63 (2^63-1)
def addOne (x y : Word) : Word := x+y+1
def addWithCarry (x y : Word) : Bool × Word := (x.uaddOverflow y,x+y)
def addOneWithCarry (x y : Word) : Bool × Word :=
  (decide (2^63 ≤ x.toNat+y.toNat+1),x+y+1)
def subWithBorrow (x y : Word) : Bool × Word := (x.usubOverflow y,x-y)
def subOneWithBorrow (x y : Word) : Bool × Word := (decide (x.toNat ≤ y.toNat),x-y-1)
def divisionPair (x y : Word) : Word × Word := (x/y,x%y)
def funnelShift (p x y : Word) : Word := (x <<< p.toNat) ||| (y >>> ((63 : Word)-p).toNat)
def compareWords (x y : Word) : Ordering := compare x.toNat y.toNat
def isZero (x : Word) : Bool := x == 0
def isEven (x : Word) : Bool := !x.getLsbD 0

theorem digits_agrees : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.digits = width := rfl
theorem size_agrees : natTo Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.size = bitCount := rfl
theorem maxInt_agrees : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.max_int = largest := rfl
theorem addcarry_agrees (x y : Word) :
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarry x y = addOne x y := rfl
theorem addc_agrees (x y : Word) :
    carryTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addc_def x y) = addWithCarry x y := by
  unfold Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addc_def
    Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb Rocq2Lean.PrimInt63.ltb
  change carryTo (Rocq.Corelib.Init.Datatypes.bool.rec _ _ (Bool.rec _ _ (decide ((x+y).toNat < x.toNat)))) = _
  by_cases h : (x.toNat+y.toNat) % 2^63 < x.toNat
  · have ho : x.uaddOverflow y = true := by
      simp only [BitVec.uaddOverflow, decide_eq_true_eq]
      have hx := x.isLt; have hy := y.isLt
      omega
    simp [h,carryTo,addWithCarry,ho]
  · have ho : x.uaddOverflow y = false := by
      simp only [BitVec.uaddOverflow, decide_eq_false_iff_not, Nat.not_le]
      have hx := x.isLt; have hy := y.isLt
      omega
    simp [h,carryTo,addWithCarry,ho]
theorem addcarryc_agrees (x y : Word) :
    carryTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarryc_def x y) = addOneWithCarry x y := by
  unfold Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarryc_def
    Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.leb Rocq2Lean.PrimInt63.leb
  change carryTo (Rocq.Corelib.Init.Datatypes.bool.rec _ _ (Bool.rec _ _ (decide ((x+y+1).toNat ≤ x.toNat)))) = _
  have he : ((x.toNat+y.toNat+1) % 2^63 ≤ x.toNat) ↔ 2^63 ≤ x.toNat+y.toNat+1 := by
    have hx := x.isLt; have hy := y.isLt
    omega
  by_cases h : 2^63 ≤ x.toNat+y.toNat+1
  · have hc := he.mpr h
    simp [hc,h,carryTo,addOneWithCarry]
    rfl
  · have hc : ¬ (x.toNat+y.toNat+1) % 2^63 ≤ x.toNat := fun hc => h (he.mp hc)
    simp [hc,h,carryTo,addOneWithCarry]
    rfl
theorem subc_agrees (x y : Word) :
    carryTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subc_def x y) = subWithBorrow x y := by
  unfold Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subc_def
    Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.leb Rocq2Lean.PrimInt63.leb
  by_cases h : y.toNat ≤ x.toNat
  · have hn : ¬ x.toNat < y.toNat := by omega
    simp [h,hn,carryTo,subWithBorrow,BitVec.usubOverflow]
  · have hn : x.toNat < y.toNat := by omega
    simp [h,hn,carryTo,subWithBorrow,BitVec.usubOverflow]
theorem subcarryc_agrees (x y : Word) :
    carryTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subcarryc_def x y) = subOneWithBorrow x y := by
  unfold Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subcarryc_def
    Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb Rocq2Lean.PrimInt63.ltb
  by_cases h : y.toNat < x.toNat
  · have hn : ¬ x.toNat ≤ y.toNat := by omega
    simp [h,hn,carryTo,subOneWithBorrow]
  · have hn : x.toNat ≤ y.toNat := by omega
    simp [h,hn,carryTo,subOneWithBorrow]
theorem divPair_agrees (x y : Word) :
    prodTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_def x y) = divisionPair x y := by
  change (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.div x y,
    Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mod x y) = _
  rw [int63_div_agrees,int63_mod_agrees]
  rfl
theorem compare_agrees (x y : Word) :
    comparisonTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.compare_def x y) = compareWords x y := by
  unfold Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.compare_def
    Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.eqb
    Rocq2Lean.PrimInt63.ltb Rocq2Lean.PrimInt63.eqb
  by_cases h : x.toNat < y.toNat
  · simp [h,compareWords,compare,compareOfLessAndEq]
    rfl
  · by_cases e : x.toNat = y.toNat
    · simp [e,compareWords,compare,compareOfLessAndEq]
      rfl
    · simp [h,e,Bool.beq_eq_decide_eq,compareWords,compare,compareOfLessAndEq]
      rfl
theorem isZero_agrees (x : Word) :
    boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.is_zero x) = isZero x := by
  change boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.eqb x (0 : Word)) = _
  have h := int63_eqb_agrees x (0 : Word)
  apply h.trans
  unfold isZero
  simp only [Bool.beq_eq_decide_eq, ← BitVec.toNat_inj]

-- Bitwise/shift helper proof text from mechanical-correspondence Int63.lean,
-- independently rechecked in the Uint63Axioms dependency closure.
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
@[simp] theorem int63_lor_agrees (x y : BitVec 63) :
 Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lor x y = x ||| y := by
 apply BitVec.eq_of_toNat_eq
 simp only [Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lor, Rocq2Lean.PrimInt63.lor,
  BitVec.toNat_ofNat, word_bitwise_agrees Bool.or rfl, Nat.mod_mod, BitVec.toNat_or]
 exact Nat.mod_eq_of_lt (Nat.or_lt_two_pow x.isLt y.isLt)
@[simp] theorem int63_lxor_agrees (x y : BitVec 63) :
 Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lxor x y = x ^^^ y := by
 apply BitVec.eq_of_toNat_eq
 simp only [Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lxor, Rocq2Lean.PrimInt63.lxor,
  BitVec.toNat_ofNat, word_bitwise_agrees Bool.xor rfl, Nat.mod_mod, BitVec.toNat_xor]
 exact Nat.mod_eq_of_lt (Nat.xor_lt_two_pow x.isLt y.isLt)
@[simp] theorem int63_lsl_agrees (x y : BitVec 63) :
 Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsl x y = x <<< y.toNat := by
 change (if y.toNat < 63 then BitVec.ofNat 63 (x.toNat <<< y.toNat) else BitVec.ofNat 63 0) = _
 by_cases h : y.toNat < 63
 · simp only [h, if_true]
   apply BitVec.eq_of_toNat_eq
   simp
 · simp [h, BitVec.shiftLeft_eq_zero (by omega : 63 ≤ y.toNat)]
@[simp] theorem int63_lsr_agrees (x y : BitVec 63) :
 Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr x y = x >>> y.toNat := by
 change (if y.toNat < 63 then BitVec.ofNat 63 (x.toNat >>> y.toNat) else BitVec.ofNat 63 0) = _
 by_cases h : y.toNat < 63
 · simp only [h, if_true]
   apply BitVec.eq_of_toNat_eq
   simp only [BitVec.toNat_ofNat, BitVec.toNat_ushiftRight]
   exact Nat.mod_eq_of_lt (Nat.lt_of_le_of_lt (Nat.shiftRight_le _ _) x.isLt)
 · simp [h, BitVec.ushiftRight_eq_zero (by omega : 63 ≤ y.toNat)]


theorem funnel_agrees (p x y : Word) :
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addmuldiv_def p x y = funnelShift p x y := by
  have h1 := int63_lor_agrees (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsl x p)
    (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr y ((63 : Word)-p))
  have h2 := congrArg (fun a : Word => BitVec.or a
    (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr y ((63 : Word)-p))) (int63_lsl_agrees x p)
  have h3 := congrArg (fun b : Word => (x <<< p.toNat) ||| b) (int63_lsr_agrees y ((63 : Word)-p))
  exact h1.trans (h2.trans h3)
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

theorem maskedBit (x : Word) (p : Nat) :
    x &&& (1#63 <<< p) = if x.getLsbD p then (1#63 <<< p) else 0#63 := by
  apply BitVec.eq_of_getLsbD_eq
  intro i
  by_cases h : i = p
  · subst i
    simp [BitVec.getLsbD_shiftLeft]
    cases x.getLsbD p <;> simp_all
  · have hm : (1#63 <<< p).getLsbD i = false := by
      by_cases hp : i < p
      · simp [BitVec.getLsbD_shiftLeft, hp]
      · have hz : i-p ≠ 0 := by omega
        simp [BitVec.getLsbD_shiftLeft, hz]
    rw [BitVec.getLsbD_and, hm]
    split <;> simp [hm]

def readBit (x p : Word) : Bool := x.getLsbD p.toNat
theorem maskedBit_nonzero (x : Word) (p : Nat) :
    decide (0 < (x &&& (1#63 <<< p)).toNat) = x.getLsbD p := by
  rw [maskedBit]
  cases hb : x.getLsbD p with
  | false => simp
  | true =>
    have hp := BitVec.lt_of_getLsbD hb
    have hm : (1#63 <<< p).getLsbD p = true := by simp [hp]
    have hn : (1#63 <<< p).toNat ≠ 0 := by
      intro h
      have hz : (1#63 <<< p) = 0#63 := BitVec.eq_of_toNat_eq h
      rw [hz] at hm
      simp at hm
    simpa only [ite_true, decide_eq_true_eq] using (Nat.pos_of_ne_zero hn)
theorem getDigit_agrees (x p : Word) :
    boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.get_digit x p) = readBit x p := by
  have h1 := int63_ltb_agrees (0 : Word)
    (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.land x
      (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsl (1 : Word) p))
  have h2 := (int63_land_agrees x
    (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsl (1 : Word) p)).trans
      (congrArg (BitVec.and x) (int63_lsl_agrees (1 : Word) p))
  exact h1.trans ((congrArg (fun a : Word => decide (0 < a.toNat)) h2).trans (maskedBit_nonzero x p.toNat))

theorem shiftedHigh (x : Word) :
    x <<< 62 = if x.getLsbD 0 then (1#63 <<< 62) else 0#63 := by
  apply BitVec.eq_of_getLsbD_eq
  intro i hi
  by_cases h : i = 62
  · subst i
    rw [BitVec.getLsbD_shiftLeft]
    change x.getLsbD 0 = (if x.getLsbD 0 then (1#63 <<< 62) else 0#63).getLsbD 62
    cases x.getLsbD 0 <;> rfl
  · have hlo : i < 62 := by omega
    cases hb : x.getLsbD 0 <;>
      simp only [Bool.false_eq_true, ite_false, ite_true, BitVec.getLsbD_shiftLeft,
        hlo, decide_true, Bool.not_true, Bool.and_false, Bool.false_and, BitVec.getLsbD_zero]
theorem shiftedHigh_nonzero (x : Word) :
    (!isZero (x <<< 62)) = x.getLsbD 0 := by
  rw [shiftedHigh]
  cases x.getLsbD 0 <;> rfl
theorem bit_agrees (x p : Word) :
    boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit x p) = readBit x p := by
  have hshift := int63_lsl_agrees
    (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr x p) (62 : Word)
  have hright := int63_lsr_agrees x p
  have hz := isZero_agrees
    (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsl
      (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr x p) (62 : Word))
  have hn := negb_agrees (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.is_zero
    (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsl
      (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr x p) (62 : Word)))
  have h3 : BitVec.shiftLeft (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr x p) 62 =
      BitVec.shiftLeft (x >>> p.toNat) 62 :=
    congrArg (fun a : Word => BitVec.shiftLeft a 62) hright
  have h4 : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsl
      (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr x p) (62 : Word) =
      BitVec.shiftLeft (x >>> p.toNat) 62 := hshift.trans h3
  have hh := congrArg (fun a : Word => !isZero a) h4
  have h5 : (!isZero ((x >>> p.toNat) <<< (62 : Nat))) = readBit x p := by
    rw [shiftedHigh_nonzero]
    simp [readBit]
  have h6 := (congrArg Bool.not hz).trans (hh.trans h5)
  exact hn.trans h6

def writeBit (x p : Word) (b : Bool) : Word :=
  if p.toNat < 63 then
    if b then x ||| (1#63 <<< p.toNat)
    else x &&& (largest ^^^ (1#63 <<< p.toNat))
  else x
theorem setDigit_agrees (x p : Word) (b : RBool) :
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.set_digit x p b = writeBit x p (boolTo b) := by
  unfold Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.set_digit
    Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.leb Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb
    Rocq2Lean.PrimInt63.leb Rocq2Lean.PrimInt63.ltb
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.digits
  simp only [BitVec.toNat_ofNat]
  by_cases h : p.toNat < 63
  · simp only [h, decide_true]
    cases b with
    | true =>
      change Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lor x
        (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsl (1 : Word) p) = writeBit x p true
      have hh := (int63_lor_agrees x (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsl (1 : Word) p)).trans
        (congrArg (BitVec.or x) (int63_lsl_agrees (1 : Word) p))
      simpa [writeBit,h] using hh
    | false =>
      change Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.land x
        (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lxor largest
          (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsl (1 : Word) p)) = writeBit x p false
      have hs := int63_lsl_agrees (1 : Word) p
      have hx := (int63_lxor_agrees largest (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsl (1 : Word) p)).trans
        (congrArg (BitVec.xor largest) hs)
      have hh := (int63_land_agrees x (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lxor largest
          (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsl (1 : Word) p))).trans
        (congrArg (BitVec.and x) hx)
      simpa [writeBit,h] using hh
  · simp only [h, decide_false]
    cases b <;> simp [writeBit,h] <;> rfl

theorem set_at_width_example : writeBit 5 63 true = 5 := rfl
theorem set_top_bit_example : writeBit 0 62 true = BitVec.ofNat 63 (2^62) := rfl
theorem bit_out_of_range_example : readBit (BitVec.ofNat 63 (2^63-1)) 63 = false := rfl

end NativeBridge.Incremental.Uint63Operations

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
  for name in ["NativeBridge.Incremental.Uint63Operations.addOne", "NativeBridge.Incremental.Uint63Operations.addOneWithCarry", "NativeBridge.Incremental.Uint63Operations.addWithCarry", "NativeBridge.Incremental.Uint63Operations.bitCount", "NativeBridge.Incremental.Uint63Operations.compareWords", "NativeBridge.Incremental.Uint63Operations.divisionPair", "NativeBridge.Incremental.Uint63Operations.funnelShift", "NativeBridge.Incremental.Uint63Operations.isEven", "NativeBridge.Incremental.Uint63Operations.isZero", "NativeBridge.Incremental.Uint63Operations.largest", "NativeBridge.Incremental.Uint63Operations.readBit", "NativeBridge.Incremental.Uint63Operations.subOneWithBorrow", "NativeBridge.Incremental.Uint63Operations.subWithBorrow", "NativeBridge.Incremental.Uint63Operations.width", "NativeBridge.Incremental.Uint63Operations.writeBit"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

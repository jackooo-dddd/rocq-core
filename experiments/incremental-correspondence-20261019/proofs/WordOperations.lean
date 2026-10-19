import Int63
import Init.Data.BitVec.Lemmas
set_option autoImplicit false
noncomputable section
namespace NativeBridge.Incremental.WordOperations
open NativeBridge
universe u
abbrev Word := BitVec 63

def carryTo {A : Sort u} : Rocq.Corelib.Numbers.Cyclic.Int63.CarryType.carry A → PProd Bool A
  | .C0 _ a => ⟨false,a⟩
  | .C1 _ a => ⟨true,a⟩
def carryOf {A : Sort u} (p : PProd Bool A) : Rocq.Corelib.Numbers.Cyclic.Int63.CarryType.carry A :=
  if p.1 then .C1 A p.2 else .C0 A p.2
def carryIso (A : Sort u) : Iso (Rocq.Corelib.Numbers.Cyclic.Int63.CarryType.carry A) (PProd Bool A) where
  to := carryTo
  of := carryOf
  of_to x := by cases x <;> rfl
  to_of x := by rcases x with ⟨b,a⟩; cases b <;> rfl
abbrev CarryNative (A : Sort u) := PProd Bool A
abbrev wordCarryTo (x : Rocq.Corelib.Numbers.Cyclic.Int63.CarryType.carry Word) : Bool × Word :=
  ((carryTo x).1,(carryTo x).2)
abbrev wordPairTo (x : Rocq.Corelib.Init.Datatypes.prod Word Word) : Word × Word :=
  match x with | .pair _ _ a b => (a,b)

def addCarry (x y : Word) : Bool × Word :=
  if x.toNat+y.toNat < 2^63 then (false,x+y) else (true,x+y)
def addCarryOne (x y : Word) : Bool × Word :=
  let z := BitVec.ofNat 63 (x.toNat+y.toNat+1)
  if x.toNat+y.toNat+1 < 2^63 then (false,z) else (true,z)
def subCarry (x y : Word) : Bool × Word :=
  if y.toNat ≤ x.toNat then (false,x-y) else (true,x-y)
def subCarryOne (x y : Word) : Bool × Word :=
  if y.toNat < x.toNat then (false,x-y-1) else (true,x-y-1)

theorem addc_agrees (x y : Word) :
    wordCarryTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.addc x y) = addCarry x y := by
  unfold Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.addc Rocq2Lean.PrimInt63.addc addCarry
  split <;> rfl
theorem addcarryc_agrees (x y : Word) :
    wordCarryTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.addcarryc x y) = addCarryOne x y := by
  unfold Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.addcarryc Rocq2Lean.PrimInt63.addcarryc addCarryOne
  split <;> rfl
theorem subc_agrees (x y : Word) :
    wordCarryTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.subc x y) = subCarry x y := by
  unfold Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.subc Rocq2Lean.PrimInt63.subc subCarry
  split <;> rfl
theorem subcarryc_agrees (x y : Word) :
    wordCarryTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.subcarryc x y) = subCarryOne x y := by
  unfold Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.subcarryc Rocq2Lean.PrimInt63.subcarryc subCarryOne
  split <;> rfl

def mulWide (x y : Word) : Word × Word :=
  (BitVec.ofNat 63 (x.toNat*y.toNat/2^63),BitVec.ofNat 63 (x.toNat*y.toNat))
theorem mulc_agrees (x y : Word) :
    wordPairTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mulc x y) = mulWide x y := rfl

def divRem (x y : Word) : Word × Word := (x/y,x%y)
theorem diveucl_agrees (x y : Word) :
    wordPairTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.diveucl x y) = divRem x y := by
  change (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.div x y,
    Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mod x y) = _
  rw [int63_div_agrees,int63_mod_agrees]
  rfl
def divDouble (hi lo y : Word) : Word × Word :=
  if hi.toNat < y.toNat then
    let n := hi.toNat*2^63+lo.toNat
    (BitVec.ofNat 63 (n/y.toNat),BitVec.ofNat 63 (n%y.toNat))
  else (0,0)
theorem diveucl_21_agrees (hi lo y : Word) :
    wordPairTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.diveucl_21 hi lo y) =
      divDouble hi lo y := by
  unfold Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.diveucl_21 Rocq2Lean.PrimInt63.div21 divDouble
  split <;> rfl

theorem ofSigned_agrees (w : Nat) (z : Int) :
    Rocq2Lean.PrimInt63.ofSigned w z = BitVec.ofInt w z := by
  cases z with
  | ofNat n => simp [Rocq2Lean.PrimInt63.ofSigned]
  | negSucc n =>
    change BitVec.ofNat w (2^w-(n+1)%2^w) = BitVec.ofInt w (-Int.ofNat (n+1))
    rw [BitVec.ofInt_neg]
    change BitVec.ofNat w (2^w-(n+1)%2^w) = -(BitVec.ofNat w (n+1))
    rfl

def signedDiv (x y : Word) : Word := BitVec.ofInt 63 (Int.tdiv x.toInt y.toInt)
def signedRem (x y : Word) : Word := BitVec.ofInt 63 (Int.tmod x.toInt y.toInt)
theorem divs_agrees (x y : Word) :
    Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.divs x y = signedDiv x y :=
  ofSigned_agrees _ _
theorem mods_agrees (x y : Word) :
    Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mods x y = signedRem x y :=
  ofSigned_agrees _ _
def arithmeticShift (x y : Word) : Word :=
  if y.toInt < 0 then 0 else BitVec.ofInt 63 (Int.shiftRight x.toInt (min y.toNat 63))
theorem asr_agrees (x y : Word) :
    Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.asr x y = arithmeticShift x y := by
  unfold Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.asr Rocq2Lean.PrimInt63.asr arithmeticShift
  split
  · rfl
  · exact ofSigned_agrees _ _

def funnelShift (p x y : Word) : Word := (x <<< p.toNat) ||| (y >>> ((63 : Word)-p).toNat)
theorem addmuldiv_agrees (p x y : Word) :
    Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.addmuldiv p x y = funnelShift p x y := by
  have h1 := int63_lor_agrees
    (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsl x p)
    (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr y ((63 : Word)-p))
  have h2 := congrArg (fun a : Word => BitVec.or a (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr y ((63 : Word)-p)))
    (int63_lsl_agrees x p)
  have h3 := congrArg (fun b : Word => (x <<< p.toNat) ||| b)
    (int63_lsr_agrees y ((63 : Word)-p))
  exact h1.trans (h2.trans h3)

def signedWordTo : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.pos_neg_int63 → Bool × Word
  | .Pos n => (false,n)
  | .Neg n => (true,n)
def signedWordOf (p : Bool × Word) : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.pos_neg_int63 :=
  if p.1 then .Neg p.2 else .Pos p.2
abbrev SignedWordNative := Bool × Word
def signedWordIso : Iso Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.pos_neg_int63 SignedWordNative where
  to := signedWordTo
  of := signedWordOf
  of_to x := by cases x <;> rfl
  to_of x := by rcases x with ⟨s,n⟩; cases s <;> rfl

def wordOptionTo : Rocq.Corelib.Init.Datatypes.option Word → Option Word
  | .Some _ n => some n
  | .None _ => none
def parseWord (p : SignedWordNative) : Option Word := if p.1 then none else some p.2
def printWord (n : Word) : SignedWordNative := (false,n)
theorem parser_agrees (x : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.pos_neg_int63) :
    wordOptionTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.parser x) = parseWord (signedWordTo x) := by
  cases x <;> rfl
theorem int_wrap_agrees (x : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int_wrapper) :
    Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int_wrap x = id (int63WrapperIso.to x) := by
  cases x <;> rfl
theorem printer_agrees (x : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int_wrapper) :
    signedWordTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.printer x) = printWord (int63WrapperIso.to x) := by
  cases x <;> rfl

theorem leadingZeros_formula (w n : Nat) (hn : n < 2^w) :
    Rocq2Lean.PrimInt63.leadingZeros w n = if n = 0 then w else w-1-Nat.log2 n := by
  induction w with
  | zero =>
    have hz : n = 0 := by simpa using hn
    simp [Rocq2Lean.PrimInt63.leadingZeros,hz]
  | succ w ih =>
    rw [Rocq2Lean.PrimInt63.leadingZeros]
    by_cases h : n < 2^w
    · rw [if_pos h,ih h]
      by_cases hz : n = 0
      · simp [hz]
      · have hl := (Nat.log2_lt hz).mpr h
        simp only [if_neg hz]
        omega
    · rw [if_neg h]
      have hz : n ≠ 0 := by
        have hp := Nat.two_pow_pos w
        omega
      have hl : Nat.log2 n = w := (Nat.log2_eq_iff hz).mpr ⟨by omega,hn⟩
      simp [hz,hl]

theorem head0_agrees (x : Word) :
    Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.head0 x = BitVec.clz x := by
  change BitVec.ofNat 63 (Rocq2Lean.PrimInt63.leadingZeros 63 x.toNat) = x.clz
  rw [leadingZeros_formula 63 x.toNat x.isLt]
  by_cases hx : x = 0
  · subst x
    have h : (0 : Word).clz = 63 := BitVec.clz_eq_iff_eq_zero.mpr rfl
    simp
  · have hz : x.toNat ≠ 0 := by
      intro hn
      apply hx
      apply BitVec.eq_of_toNat_eq
      exact hn
    have hk : x.clz.toNat < 63 := BitVec.clz_lt_iff_ne_zero.mpr hx
    have hl := BitVec.two_pow_sub_clz_le_toNat_of_ne_zero (x := x) (by decide) hx
    have hu := BitVec.toNat_lt_two_pow_sub_clz (x := x)
    have he : 63-x.clz.toNat = (62-x.clz.toNat)+1 := by omega
    rw [he] at hu
    have hh : Nat.log2 x.toNat = 62-x.clz.toNat := (Nat.log2_eq_iff hz).mpr ⟨hl,hu⟩
    have hn : 63-1-Nat.log2 x.toNat = x.clz.toNat := by omega
    rw [if_neg hz,hn]
    simp

theorem trailingZeros_zero (w : Nat) : Rocq2Lean.PrimInt63.trailingZeros w 0 = w := by
  induction w with
  | zero => rfl
  | succ w ih => simpa [Rocq2Lean.PrimInt63.trailingZeros] using congrArg Nat.succ ih

theorem trailingZeros_first (k w n : Nat) (hk : k < w)
    (lo : ∀ i, i < k → Nat.testBit n i = false) (hi : Nat.testBit n k = true) :
    Rocq2Lean.PrimInt63.trailingZeros w n = k := by
  induction k generalizing w n with
  | zero =>
    cases w with
    | zero => omega
    | succ w =>
      have hm : n%2 = 1 := Nat.mod_two_eq_one_iff_testBit_zero.mpr hi
      simp [Rocq2Lean.PrimInt63.trailingZeros,hm]
  | succ k ih =>
    cases w with
    | zero => omega
    | succ w =>
      have hm : n%2 = 0 := Nat.mod_two_eq_zero_iff_testBit_zero.mpr (lo 0 (by omega))
      have hlo : ∀ i, i < k → Nat.testBit (n/2) i = false := by
        intro i h
        rw [Nat.testBit_div_two]
        exact lo (i+1) (by omega)
      have hhi : Nat.testBit (n/2) k = true := by
        rw [Nat.testBit_div_two]; exact hi
      have hrec := ih w (n/2) (by omega) hlo hhi
      simpa [Rocq2Lean.PrimInt63.trailingZeros,hm] using congrArg Nat.succ hrec

theorem tail0_agrees (x : Word) :
    Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.tail0 x = BitVec.ctz x := by
  change BitVec.ofNat 63 (Rocq2Lean.PrimInt63.trailingZeros 63 x.toNat) = x.ctz
  by_cases hx : x = 0
  · subst x
    rw [show (0 : Word).toNat = 0 by rfl,trailingZeros_zero]
    have h : (0 : Word).ctz = 63 := by
      change BitVec.clz ((0 : Word).reverse) = 63
      apply BitVec.clz_eq_iff_eq_zero.mpr
      simp
    exact h.symm
  · have hk : x.ctz.toNat < 63 := BitVec.ctz_lt_iff_ne_zero.mpr hx
    have hlo : ∀ i, i < x.ctz.toNat → Nat.testBit x.toNat i = false := by
      intro i hi
      exact BitVec.getLsbD_false_of_lt_ctz hi
    have hhi : Nat.testBit x.toNat x.ctz.toNat = true :=
      BitVec.getLsbD_true_ctz_of_ne_zero hx
    rw [trailingZeros_first _ _ _ hk hlo hhi]
    simp

theorem addition_overflow_example :
    wordCarryTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.addc (BitVec.ofNat 63 (2^63-1)) (1 : Word)) = (true,0) := rfl
theorem subtraction_borrow_example :
    wordCarryTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.subc (0 : Word) (1 : Word)) =
      (true,BitVec.ofNat 63 (2^63-1)) := rfl
theorem leading_one_example : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.head0 (1 : Word) = (62 : Word) := rfl
theorem trailing_eight_example : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.tail0 (8 : Word) = (3 : Word) := rfl
theorem leading_zero_example : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.head0 (0 : Word) = (63 : Word) := rfl
theorem trailing_zero_example : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.tail0 (0 : Word) = (63 : Word) := rfl
theorem negative_zero_parse_example :
    wordOptionTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.parser (.Neg (0 : Word))) = none := rfl
theorem division_double_invalid_example :
    wordPairTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.diveucl_21 (1 : Word) (3 : Word) (1 : Word)) = (0,0) := rfl

end NativeBridge.Incremental.WordOperations

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
  for name in ["BitVec.clz", "BitVec.ctz", "NativeBridge.Incremental.WordOperations.CarryNative", "NativeBridge.Incremental.WordOperations.SignedWordNative", "NativeBridge.Incremental.WordOperations.addCarry", "NativeBridge.Incremental.WordOperations.addCarryOne", "NativeBridge.Incremental.WordOperations.arithmeticShift", "NativeBridge.Incremental.WordOperations.divDouble", "NativeBridge.Incremental.WordOperations.divRem", "NativeBridge.Incremental.WordOperations.funnelShift", "NativeBridge.Incremental.WordOperations.mulWide", "NativeBridge.Incremental.WordOperations.parseWord", "NativeBridge.Incremental.WordOperations.printWord", "NativeBridge.Incremental.WordOperations.signedDiv", "NativeBridge.Incremental.WordOperations.signedRem", "NativeBridge.Incremental.WordOperations.subCarry", "NativeBridge.Incremental.WordOperations.subCarryOne", "id"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

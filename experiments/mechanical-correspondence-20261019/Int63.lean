import Rocq2LeanOut
import Std
set_option maxRecDepth 4096
set_option maxHeartbeats 1000000
-- Supply ordinary Lean eliminator helpers missing from the mechanical artifact.
run_cmd Lean.Elab.Command.liftTermElabM do
  let env ← Lean.getEnv
  for (n, ci) in env.constants.toList do
    if n.toString.startsWith "Rocq." then
      if let .inductInfo _ := ci then
        unless env.contains (.str n "casesOn") do
          Lean.mkCasesOn n
noncomputable section
namespace NativeBridge
universe u v w
/-- Explicit equivalence: no classical choice, no new axiom. -/
structure Iso (A : Sort u) (B : Sort v) where
  to : A → B
  of : B → A
  of_to : ∀ a, of (to a) = a
  to_of : ∀ b, to (of b) = b
def identityIso (A : Sort u) : Iso A A := ⟨id,id,fun _ => rfl,fun _ => rfl⟩
namespace Iso
theorem injective (e : Iso A B) {a b : A} (h : e.to a = e.to b) : a = b :=
  (e.of_to a).symm.trans ((congrArg e.of h).trans (e.of_to b))
theorem eq_iff (e : Iso A B) (a b : A) : e.to a = e.to b ↔ a = b :=
  ⟨e.injective, fun h => congrArg e.to h⟩
theorem surjective (e : Iso A B) (b : B) : ∃ a, e.to a = b := ⟨e.of b, e.to_of b⟩
def symm (e : Iso A B) : Iso B A := ⟨e.of, e.to, e.to_of, e.of_to⟩
def trans (e : Iso A B) (f : Iso B C) : Iso A C where
  to a := f.to (e.to a)
  of c := e.of (f.of c)
  of_to a := by rw [f.of_to, e.of_to]
  to_of c := by rw [e.to_of, f.to_of]
theorem forall_iff (e : Iso A B) (P : A → Prop) (Q : B → Prop)
    (h : ∀ a, P a ↔ Q (e.to a)) : (∀ a, P a) ↔ (∀ b, Q b) := by
  constructor
  · intro hp b
    have hb := (h (e.of b)).mp (hp (e.of b))
    simpa only [e.to_of] using hb
  · intro hq a
    exact (h a).mpr (hq (e.to a))
theorem exists_iff (e : Iso A B) (P : A → Prop) (Q : B → Prop)
    (h : ∀ a, P a ↔ Q (e.to a)) : (∃ a, P a) ↔ (∃ b, Q b) := by
  constructor
  · rintro ⟨a, ha⟩; exact ⟨e.to a, (h a).mp ha⟩
  · rintro ⟨b, hb⟩
    refine ⟨e.of b, (h (e.of b)).mpr ?_⟩
    simpa only [e.to_of] using hb
def functions (a : Iso A B) (b : Iso C D) : Iso (A → C) (B → D) where
  to f x := b.to (f (a.of x))
  of f x := b.of (f (a.to x))
  of_to f := by funext x; simp only [a.of_to, b.of_to]
  to_of f := by funext x; simp only [a.to_of, b.to_of]
def piSame {A : Sort u} {B : A → Sort v} {C : A → Sort w}
 (e : ∀ a, Iso (B a) (C a)) : Iso ((a : A) → B a) ((a : A) → C a) where
 to f a := (e a).to (f a)
 of f a := (e a).of (f a)
 of_to f := by funext a; exact (e a).of_to (f a)
 to_of f := by funext a; exact (e a).to_of (f a)
def call (a : Iso A B) (b : Iso C D) (f : B → D) (x : A) : C :=
  b.of (f (a.to x))
@[simp] theorem call_agrees (a : Iso A B) (b : Iso C D) (f : B → D) (x : A) :
  b.to (a.call b f x) = f (a.to x) := b.to_of _
def call₂ (a : Iso A B) (b : Iso C D) (c : Iso E F) (f : B → D → F) (x : A) (y : C) : E :=
  c.of (f (a.to x) (b.to y))
@[simp] theorem call₂_agrees (a : Iso A B) (b : Iso C D) (c : Iso E F)
    (f : B → D → F) (x : A) (y : C) :
  c.to (a.call₂ b c f x y) = f (a.to x) (b.to y) := c.to_of _
def decidableEq (e : Iso A B) [DecidableEq B] : DecidableEq A :=
  fun x y => if h : e.to x = e.to y then .isTrue (e.injective h)
    else .isFalse (fun hxy => h (congrArg e.to hxy))
def lists {A : Type u} {B : Type v} (e : Iso A B) : Iso (List A) (List B) where
  to := List.map e.to
  of := List.map e.of
  of_to xs := by
    induction xs with
    | nil => rfl
    | cons x xs ih => simp only [List.map_cons, e.of_to, ih]
  to_of xs := by
    induction xs with
    | nil => rfl
    | cons x xs ih => simp only [List.map_cons, e.to_of, ih]
def options {A : Type u} {B : Type v} (e : Iso A B) : Iso (Option A) (Option B) where
  to := Option.map e.to
  of := Option.map e.of
  of_to x := by cases x <;> simp only [Option.map_none, Option.map_some, e.of_to]
  to_of x := by cases x <;> simp only [Option.map_none, Option.map_some, e.to_of]

def products {A : Type u} {B : Type v} {C : Type w} {D : Type _}
 (a : Iso A B) (b : Iso C D) : Iso (A × C) (B × D) where
 to x := (a.to x.1, b.to x.2)
 of x := (a.of x.1, b.of x.2)
 of_to x := by cases x; simp only [a.of_to, b.of_to]
 to_of x := by cases x; simp only [a.to_of, b.to_of]
def sums {A : Type u} {B : Type v} {C : Type w} {D : Type _}
 (a : Iso A B) (b : Iso C D) : Iso (Sum A C) (Sum B D) where
 to := Sum.map a.to b.to
 of := Sum.map a.of b.of
 of_to x := by cases x <;> simp [Sum.map, a.of_to, b.of_to]
 to_of x := by cases x <;> simp [Sum.map, a.to_of, b.to_of]
def propositions {P Q : Prop} (h : P ↔ Q) : Iso P Q :=
 ⟨h.mp, h.mpr, fun _ => rfl, fun _ => rfl⟩
def subtypes {A : Type u} {B : Type v} (e : Iso A B) (P : A → Prop) (Q : B → Prop)
 (h : ∀ a, P a ↔ Q (e.to a)) : Iso {a // P a} {b // Q b} where
 to a := ⟨e.to a.val, (h a.val).mp a.property⟩
 of b := ⟨e.of b.val, (h (e.of b.val)).mpr (by simpa only [e.to_of] using b.property)⟩
 of_to a := Subtype.ext (e.of_to a.val)
 to_of b := Subtype.ext (e.to_of b.val)
/-- Native-side presentation of ANY source function on bridged types. -/
def exportFunction (a : Iso A B) (b : Iso C D) (f : A → C) : B → D :=
 (a.functions b).to f
@[simp] theorem exportFunction_agrees (a : Iso A B) (b : Iso C D) (f : A → C) (x : A) :
 a.exportFunction b f (a.to x) = b.to (f x) := by
 change b.to (f (a.of (a.to x))) = _
 rw [a.of_to]
theorem transfer (P Q : Prop) (h : P ↔ Q) (proof : P) : Q := h.mp proof
theorem transferBack (P Q : Prop) (h : P ↔ Q) (proof : Q) : P := h.mpr proof

end Iso

abbrev RBool := Rocq.Corelib.Init.Datatypes.bool
def boolTo : RBool → Bool :=
  Rocq.Corelib.Init.Datatypes.bool.rec true false
def boolOf (b : Bool) : RBool := if b then .true else .false
@[simp] theorem bool_of_to (b : RBool) : boolOf (boolTo b) = b := by cases b <;> rfl
@[simp] theorem bool_to_of (b : Bool) : boolTo (boolOf b) = b := by cases b <;> rfl
def boolIso : Iso RBool Bool := ⟨boolTo, boolOf, bool_of_to, bool_to_of⟩

abbrev RComparison := Rocq.Corelib.Init.Datatypes.comparison
def comparisonTo : RComparison → Ordering :=
  Rocq.Corelib.Init.Datatypes.comparison.rec .eq .lt .gt
def comparisonOf : Ordering → RComparison
  | .eq => .Eq
  | .lt => .Lt
  | .gt => .Gt
@[simp] theorem comparison_of_to (c : RComparison) : comparisonOf (comparisonTo c) = c := by cases c <;> rfl
@[simp] theorem comparison_to_of (c : Ordering) : comparisonTo (comparisonOf c) = c := by cases c <;> rfl
def comparisonIso : Iso RComparison Ordering := ⟨comparisonTo, comparisonOf, comparison_of_to, comparison_to_of⟩

def int63Iso : Iso Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int (BitVec 63) := ⟨id,id,fun _ => rfl,fun _ => rfl⟩
def int63WrapperIso : Iso Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int_wrapper (BitVec 63) where
  to := Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int_wrap
  of := Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int_wrapper.wrap_int
  of_to x := by cases x <;> rfl
  to_of _ := rfl
@[simp] theorem int63_id_agrees (x : BitVec 63) : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.id_int x = x := rfl
@[simp] theorem int63_add_agrees (x y : BitVec 63) : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.add x y = x + y := rfl
@[simp] theorem int63_sub_agrees (x y : BitVec 63) : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.sub x y = x-y := rfl
@[simp] theorem int63_mul_agrees (x y : BitVec 63) : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mul x y = x*y := rfl
@[simp] theorem int63_div_agrees (x y : BitVec 63) : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.div x y = x / y := by
  apply BitVec.eq_of_toNat_eq
  change (x.toNat / y.toNat) % 2^63 = x.toNat / y.toNat
  exact Nat.mod_eq_of_lt (Nat.lt_of_le_of_lt (Nat.div_le_self x.toNat y.toNat) x.isLt)
@[simp] theorem int63_mod_agrees (x y : BitVec 63) : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mod x y = x % y := by
  apply BitVec.eq_of_toNat_eq
  change (x.toNat % y.toNat) % 2^63 = x.toNat % y.toNat
  exact Nat.mod_eq_of_lt (Nat.lt_of_le_of_lt (Nat.mod_le x.toNat y.toNat) x.isLt)
@[simp] theorem int63_eqb_agrees (x y : BitVec 63) : boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.eqb x y) = (x.toNat == y.toNat) := by
  change boolTo (Bool.rec .false .true (x.toNat == y.toNat)) = _
  cases (x.toNat == y.toNat) <;> rfl
@[simp] theorem int63_ltb_agrees (x y : BitVec 63) : boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb x y) = decide (x.toNat < y.toNat) := by
  change boolTo (Bool.rec .false .true (decide (x.toNat < y.toNat))) = _
  cases (decide (x.toNat < y.toNat)) <;> rfl
@[simp] theorem int63_leb_agrees (x y : BitVec 63) : boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.leb x y) = decide (x.toNat ≤ y.toNat) := by
  change boolTo (Bool.rec .false .true (decide (x.toNat ≤ y.toNat))) = _
  cases (decide (x.toNat ≤ y.toNat)) <;> rfl
@[simp] theorem int63_ltsb_agrees (x y : BitVec 63) : boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltsb x y) = decide (x.toInt < y.toInt) := by
  change boolTo (Bool.rec .false .true (decide (x.toInt < y.toInt))) = _
  cases (decide (x.toInt < y.toInt)) <;> rfl
@[simp] theorem int63_lesb_agrees (x y : BitVec 63) : boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lesb x y) = decide (x.toInt ≤ y.toInt) := by
  change boolTo (Bool.rec .false .true (decide (x.toInt ≤ y.toInt))) = _
  cases (decide (x.toInt ≤ y.toInt)) <;> rfl
@[simp] theorem int63_compare_agrees (x y : BitVec 63) :
  comparisonTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.compare x y) = (if x.toNat < y.toNat then Ordering.lt else if y.toNat < x.toNat then Ordering.gt else Ordering.eq) := by
  unfold Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.compare Rocq2Lean.PrimInt63.compare
  split
  · rfl
  · split <;> rfl
@[simp] theorem int63_compares_agrees (x y : BitVec 63) :
  comparisonTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.compares x y) = (if x.toInt < y.toInt then Ordering.lt else if y.toInt < x.toInt then Ordering.gt else Ordering.eq) := by
  unfold Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.compares Rocq2Lean.PrimInt63.compares
  split
  · rfl
  · split <;> rfl
@[simp] theorem int63_add_nat (x y : BitVec 63) : (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.add x y).toNat = (x.toNat+y.toNat) % 2^63 := rfl
@[simp] theorem int63_mul_nat (x y : BitVec 63) : (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mul x y).toNat = (x.toNat*y.toNat) % 2^63 := rfl


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

end NativeBridge
run_cmd Lean.Elab.Command.liftTermElabM do
  let env ← Lean.getEnv
  let mut rows : Array Lean.Json := #[]
  for (n, ci) in env.constants.toList do
    if n.toString.startsWith "NativeBridge." then
      if ci.isDefinition || ci.isTheorem then
        let axs ← Lean.collectAxioms n
        for ax in axs do
          unless ["propext", "Quot.sound", "Classical.choice"].contains ax.toString do
            throwError "Unapproved axiom in {n}: {ax}"
        let ty ← Lean.Meta.ppExpr ci.type
        let mut bodyRefs : Array Lean.Json := #[]
        let mut bodyText := ""
        if n.toString.endsWith ".native" then
          if let some body := ci.value? then
            bodyText := (← Lean.Meta.ppExpr body).pretty
            for r in body.getUsedConstants do
              if r.toString.startsWith "Rocq." || r.toString.startsWith "RocqPending." || r.toString.startsWith "Rocq2Lean." then
                bodyRefs := bodyRefs.push (.str r.toString)
        let mut refs : Array Lean.Json := #[]
        for r in ci.type.getUsedConstants do
          if r.toString.startsWith "Rocq." || r.toString.startsWith "RocqPending." || r.toString.startsWith "Rocq2Lean." then
            refs := refs.push (.str r.toString)
        rows := rows.push (Lean.Json.mkObj [
          ("name", .str n.toString),
          ("kind", .str (if ci.isTheorem then "theorem" else "definition")),
          ("type", .str ty.pretty),
          ("source_references", .arr refs),
          ("native_body", .str bodyText),
          ("remaining_source_symbols", .arr bodyRefs),
          ("axioms", .arr (axs.map (fun a => .str a.toString)))])
  IO.FS.writeFile "/home/shunqwang4/research/rocq-core/experiments/mechanical-correspondence-20261019/audits/Int63.json" (Lean.Json.pretty (.arr rows))

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


abbrev MN := Rocq.Corelib.Init.Datatypes.nat
def natTo : MN → Nat := fun n =>
  Rocq.Corelib.Init.Datatypes.nat.rec (motive := fun _ => Nat) 0 (fun _ r => Nat.succ r) n
def natOf : Nat → MN
  | 0 => .O
  | n+1 => .S (natOf n)
@[simp] theorem natTo_zero : natTo Rocq.Corelib.Init.Datatypes.nat.O = 0 := rfl
@[simp] theorem natTo_succ (n : MN) : natTo (Rocq.Corelib.Init.Datatypes.nat.S n) = Nat.succ (natTo n) := rfl
@[simp] theorem natOf_zero : natOf 0 = Rocq.Corelib.Init.Datatypes.nat.O := rfl
@[simp] theorem natOf_succ (n : Nat) : natOf (Nat.succ n) = Rocq.Corelib.Init.Datatypes.nat.S (natOf n) := rfl
@[simp] theorem natOf_to (n : MN) : natOf (natTo n) = n := by
  induction n with
  | O => rfl
  | S n ih => change Rocq.Corelib.Init.Datatypes.nat.S (natOf (natTo n)) = Rocq.Corelib.Init.Datatypes.nat.S n; rw [ih]
@[simp] theorem natTo_of (n : Nat) : natTo (natOf n) = n := by
  induction n with
  | zero => rfl
  | succ n ih => change Nat.succ (natTo (natOf n)) = Nat.succ n; rw [ih]
def natIso : Iso MN Nat := ⟨natTo,natOf,natOf_to,natTo_of⟩
theorem nat_equality_iff (x y : MN) : natTo x = natTo y ↔ x = y := natIso.eq_iff x y
theorem nat_rec_agrees {A : Sort u} (z : A) (s : Nat → A → A) (n : MN) :
  Rocq.Corelib.Init.Datatypes.nat.rec (motive := fun _ => A) z (fun k r => s (natTo k) r) n =
    Nat.rec z s (natTo n) := by
  induction n with
  | O => rfl
  | S n ih => change s (natTo n) _ = s (natTo n) _; rw [ih]; rfl

theorem nat_forall_correspondence (P : MN → Prop) :
 (∀ n, P n) ↔ ∀ n : Nat, P (natOf n) := by
 constructor
 · intro h n; exact h (natOf n)
 · intro h n; simpa only [natOf_to] using h (natTo n)
theorem nat_exists_correspondence (P : MN → Prop) :
 (∃ n, P n) ↔ ∃ n : Nat, P (natOf n) := by
 constructor
 · rintro ⟨n,h⟩; exact ⟨natTo n, by simpa only [natOf_to] using h⟩
 · rintro ⟨n,h⟩; exact ⟨natOf n,h⟩
theorem nat_eq_native (a b : MN) : (a=b) ↔ natTo a = natTo b := (nat_equality_iff a b).symm
theorem nat_dependent_rec_agrees {P : Nat → Sort u} (z : P 0)
    (s : ∀ n, P n → P (n+1)) (n : MN) :
 Rocq.Corelib.Init.Datatypes.nat.rec (motive := fun n => P (natTo n)) z (fun k r => s (natTo k) r) n =
 Nat.rec z s (natTo n) := by
 induction n with
 | O => rfl
 | S n ih => change s (natTo n) _ = s (natTo n) _; rw [ih]; rfl

theorem nat_family_forall {A : Sort u} (F : (MN → A) → Prop) :
 (∀ f, F f) ↔ ∀ f : Nat → A, F (fun n => f (natTo n)) := by
 constructor
 · intro h f; exact h _
 · intro h f
   simpa only [natOf_to] using h (fun n => f (natOf n))
theorem nat_binary_family_forall {A : Sort u} (F : (MN → MN → A) → Prop) :
 (∀ f, F f) ↔ ∀ f : Nat → Nat → A, F (fun n m => f (natTo n) (natTo m)) := by
 constructor
 · intro h f; exact h _
 · intro h f
   simpa only [natOf_to] using h (fun n m => f (natOf n) (natOf m))

theorem nat_inner_family_forall {A : Sort u} {B : Sort v} (F : (A → MN → B) → Prop) :
 (∀ f, F f) ↔ ∀ f : A → Nat → B, F (fun a n => f a (natTo n)) := by
 constructor
 · intro h f; exact h _
 · intro h f
   simpa only [natOf_to] using h (fun a n => f a (natOf n))

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


@[simp] theorem nat_zero_agrees : natTo Rocq.Corelib.Init.Nat.zero = 0 := rfl
@[simp] theorem nat_one_agrees : natTo Rocq.Corelib.Init.Nat.one = 1 := rfl
@[simp] theorem nat_two_agrees : natTo Rocq.Corelib.Init.Nat.two = 2 := rfl
@[simp] theorem nat_succ_agrees (n : MN) : natTo (Rocq.Corelib.Init.Nat.succ n) = natTo n + 1 := rfl
@[simp] theorem nat_pred_agrees (n : MN) : natTo (Rocq.Corelib.Init.Nat.pred n) = natTo n - 1 := by
  cases n <;> rfl
@[simp] theorem nat_add_agrees (n m : MN) :
  natTo (Rocq.Corelib.Init.Nat.add n m) = natTo n + natTo m := by
  induction n with
  | O => exact (Nat.zero_add _).symm
  | S n ih =>
    change Nat.succ (natTo (Rocq.Corelib.Init.Nat.add n m)) = Nat.succ (natTo n) + natTo m
    rw [ih, Nat.succ_add]
@[simp] theorem nat_sub_agrees (n m : MN) :
  natTo (Rocq.Corelib.Init.Nat.sub n m) = natTo n - natTo m := by
  induction n generalizing m with
  | O => change 0 = 0 - natTo m; simp
  | S n ih => cases m with
    | O => rfl
    | S m =>
      change natTo (Rocq.Corelib.Init.Nat.sub n m) = (natTo n+1)-(natTo m+1)
      rw [Nat.succ_sub_succ]; exact ih m
@[simp] theorem nat_mul_agrees (n m : MN) :
  natTo (Rocq.Corelib.Init.Nat.mul n m) = natTo n * natTo m := by
  induction n with
  | O => exact (Nat.zero_mul _).symm
  | S n ih =>
    change natTo (Rocq.Corelib.Init.Nat.add m (Rocq.Corelib.Init.Nat.mul n m)) = (natTo n+1)*natTo m
    rw [nat_add_agrees, ih, Nat.succ_mul, Nat.add_comm]
@[simp] theorem nat_pow_agrees (n m : MN) :
  natTo (Rocq.Corelib.Init.Nat.pow n m) = natTo n ^ natTo m := by
  induction m with
  | O => rfl
  | S m ih =>
    change natTo (Rocq.Corelib.Init.Nat.mul n (Rocq.Corelib.Init.Nat.pow n m)) = natTo n ^ (natTo m+1)
    rw [nat_mul_agrees, ih, Nat.pow_succ, Nat.mul_comm]
@[simp] theorem nat_double_agrees (n : MN) : natTo (Rocq.Corelib.Init.Nat.double n) = 2*natTo n := by
  change natTo (Rocq.Corelib.Init.Nat.add n n) = 2*natTo n
  rw [nat_add_agrees]; omega
@[simp] theorem nat_square_agrees (n : MN) : natTo (Rocq.Corelib.Init.Nat.square n) = natTo n*natTo n := nat_mul_agrees n n
@[simp] theorem nat_eqb_agrees (n m : MN) :
  boolTo (Rocq.Corelib.Init.Nat.eqb n m) = (natTo n == natTo m) := by
  induction n generalizing m with
  | O => cases m <;> rfl
  | S n ih => cases m with
    | O => rfl
    | S m =>
      change boolTo (Rocq.Corelib.Init.Nat.eqb n m) = (natTo n+1 == natTo m+1)
      simpa using ih m
@[simp] theorem nat_leb_agrees (n m : MN) :
  boolTo (Rocq.Corelib.Init.Nat.leb n m) = decide (natTo n ≤ natTo m) := by
  induction n generalizing m with
  | O => cases m <;> rfl
  | S n ih => cases m with
    | O => rfl
    | S m =>
      change boolTo (Rocq.Corelib.Init.Nat.leb n m) = decide (natTo n+1 ≤ natTo m+1)
      simpa using ih m
@[simp] theorem nat_ltb_agrees (n m : MN) :
  boolTo (Rocq.Corelib.Init.Nat.ltb n m) = decide (natTo n < natTo m) :=
  nat_leb_agrees (.S n) m
@[simp] theorem nat_min_agrees (n m : MN) :
  natTo (Rocq.Corelib.Init.Nat.min n m) = min (natTo n) (natTo m) := by
  induction n generalizing m with
  | O => cases m <;> rfl
  | S n ih => cases m with
    | O => rfl
    | S m =>
      change natTo (Rocq.Corelib.Init.Nat.min n m)+1 = min (natTo n+1) (natTo m+1)
      rw [ih]; omega
@[simp] theorem nat_max_agrees (n m : MN) :
  natTo (Rocq.Corelib.Init.Nat.max n m) = max (natTo n) (natTo m) := by
  induction n generalizing m with
  | O => cases m <;> rfl
  | S n ih => cases m with
    | O => rfl
    | S m =>
      change natTo (Rocq.Corelib.Init.Nat.max n m)+1 = max (natTo n+1) (natTo m+1)
      rw [ih]; omega
theorem translated_add_comm (n m : MN) :
  Rocq.Corelib.Init.Nat.add n m = Rocq.Corelib.Init.Nat.add m n := by
  apply natIso.injective
  change natTo _ = natTo _
  rw [nat_add_agrees,nat_add_agrees,Nat.add_comm]

def nat_type_agrees : Iso Rocq.Corelib.Init.Nat.t Nat := natIso
theorem translated_mul_comm (n m : MN) :
 Rocq.Corelib.Init.Nat.mul n m = Rocq.Corelib.Init.Nat.mul m n := by
 apply natIso.injective
 change natTo _ = natTo _
 rw [nat_mul_agrees,nat_mul_agrees,Nat.mul_comm]
theorem translated_add_assoc (n m k : MN) :
 Rocq.Corelib.Init.Nat.add (Rocq.Corelib.Init.Nat.add n m) k =
 Rocq.Corelib.Init.Nat.add n (Rocq.Corelib.Init.Nat.add m k) := by
 apply natIso.injective
 change natTo _ = natTo _
 simp only [nat_add_agrees,Nat.add_assoc]
theorem translated_sub_add (n m : MN) (h : natTo m ≤ natTo n) :
 Rocq.Corelib.Init.Nat.add (Rocq.Corelib.Init.Nat.sub n m) m = n := by
 apply natIso.injective
 change natTo _ = natTo _
 rw [nat_add_agrees,nat_sub_agrees]
 exact Nat.sub_add_cancel h


theorem two_step {P : MN → Prop} (hz : P .O) (ho : P (.S .O))
    (hs : ∀ n, P n → P (.S n) → P (.S (.S n))) : ∀ n, P n := by
  intro n
  have h : P n ∧ P (.S n) := by
    induction n with
    | O => exact ⟨hz,ho⟩
    | S n ih => exact ⟨ih.2, hs n ih.1 ih.2⟩
  exact h.1
@[simp] theorem nat_compare_agrees (n m : MN) :
  comparisonTo (Rocq.Corelib.Init.Nat.compare n m) = compare (natTo n) (natTo m) := by
  induction n generalizing m with
  | O => cases m with
    | O => rfl
    | S m =>
      change Ordering.lt = compare 0 (natTo m+1)
      exact (Nat.compare_eq_lt.mpr (by omega)).symm
  | S n ih => cases m with
    | O =>
      change Ordering.gt = compare (natTo n+1) 0
      exact (Nat.compare_eq_gt.mpr (by omega)).symm
    | S m =>
      change comparisonTo (Rocq.Corelib.Init.Nat.compare n m) = compare (natTo n+1) (natTo m+1)
      rw [ih, Nat.compare_eq_ite_lt, Nat.compare_eq_ite_lt]
      simp
theorem nat_even_step (n : MN) : Rocq.Corelib.Init.Nat.even (.S (.S n)) = Rocq.Corelib.Init.Nat.even n := rfl
@[simp] theorem nat_even_agrees (n : MN) :
  boolTo (Rocq.Corelib.Init.Nat.even n) = decide (natTo n % 2 = 0) := by
  induction n using two_step with
  | hz => rfl
  | ho => rfl
  | hs n ih ih1 =>
    rw [nat_even_step, ih]
    change decide (natTo n%2=0) = decide ((natTo n+2)%2=0)
    rw [show (natTo n+2)%2 = natTo n%2 by omega]
@[simp] theorem nat_odd_agrees (n : MN) :
  boolTo (Rocq.Corelib.Init.Nat.odd n) = decide (natTo n % 2 = 1) := by
  change boolTo (Rocq.Corelib.Init.Datatypes.negb (Rocq.Corelib.Init.Nat.even n)) = _
  have h : ∀ b : RBool, boolTo (Rocq.Corelib.Init.Datatypes.negb b) = !boolTo b := by intro b; cases b <;> rfl
  rw [h, nat_even_agrees]
  by_cases h0 : natTo n % 2 = 0
  · have h1 : natTo n % 2 ≠ 1 := by omega
    simp [h0,h1]
  · have h1 : natTo n % 2 = 1 := by omega
    simp [h0,h1]
@[simp] theorem nat_div2_agrees (n : MN) : natTo (Rocq.Corelib.Init.Nat.div2 n) = natTo n/2 := by
  induction n using two_step with
  | hz => rfl
  | ho => rfl
  | hs n ih ih1 =>
    change natTo (Rocq.Corelib.Init.Nat.div2 n)+1 = (natTo n+2)/2
    rw [ih]; omega
@[simp] theorem nat_shiftl_agrees (n k : MN) :
  natTo (Rocq.Corelib.Init.Nat.shiftl n k) = natTo n <<< natTo k := by
  rw [Nat.shiftLeft_eq]
  induction k with
  | O => exact (Nat.mul_one _).symm
  | S k ih =>
    change natTo (Rocq.Corelib.Init.Nat.double (Rocq.Corelib.Init.Nat.shiftl n k)) = natTo n * 2^(natTo k+1)
    rw [nat_double_agrees, ih, Nat.pow_succ]
    simp only [Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm]
@[simp] theorem nat_shiftr_agrees (n k : MN) :
  natTo (Rocq.Corelib.Init.Nat.shiftr n k) = natTo n >>> natTo k := by
  rw [Nat.shiftRight_eq_div_pow]
  induction k with
  | O => exact (Nat.div_one _).symm
  | S k ih =>
    change natTo (Rocq.Corelib.Init.Nat.div2 (Rocq.Corelib.Init.Nat.shiftr n k)) = natTo n / 2^(natTo k+1)
    rw [nat_div2_agrees, ih, Nat.div_div_eq_div_mul, Nat.pow_succ]
@[simp] theorem nat_tail_add_agrees (n m : MN) :
  natTo (Rocq.Corelib.Init.Nat.tail_add n m) = natTo n+natTo m := by
  induction n generalizing m with
  | O => exact (Nat.zero_add _).symm
  | S n ih =>
    change natTo (Rocq.Corelib.Init.Nat.tail_add n (.S m)) = natTo n+1+natTo m
    rw [ih]; simp only [natTo_succ]; omega
@[simp] theorem nat_tail_addmul_agrees (r n m : MN) :
  natTo (Rocq.Corelib.Init.Nat.tail_addmul r n m) = natTo r+natTo n*natTo m := by
  induction n generalizing r with
  | O => change natTo r = natTo r+0*natTo m; simp
  | S n ih =>
    change natTo (Rocq.Corelib.Init.Nat.tail_addmul (Rocq.Corelib.Init.Nat.tail_add m r) n m) = natTo r+(natTo n+1)*natTo m
    rw [ih, nat_tail_add_agrees, Nat.succ_mul]; omega
@[simp] theorem nat_tail_mul_agrees (n m : MN) :
  natTo (Rocq.Corelib.Init.Nat.tail_mul n m) = natTo n*natTo m := by
  change natTo (Rocq.Corelib.Init.Nat.tail_addmul .O n m) = _
  rw [nat_tail_addmul_agrees]; exact Nat.zero_add _

def divmodTo (x y q u : Nat) : Nat × Nat :=
  Rocq.Corelib.Init.Datatypes.prod.rec (fun q r => (natTo q,natTo r)) (Rocq.Corelib.Init.Nat.divmod (natOf x) (natOf y) (natOf q) (natOf u))
theorem divmod_zero (y q u : Nat) : divmodTo 0 y q u = (q,u) := by change (natTo (natOf q),natTo (natOf u)) = (q,u); simp
theorem divmod_succ_zero (x y q : Nat) : divmodTo (x+1) y q 0 = divmodTo x y (q+1) y := rfl
theorem divmod_succ_succ (x y q u : Nat) : divmodTo (x+1) y q (u+1) = divmodTo x y q u := rfl
theorem divmod_invariant (x y q u : Nat) (hu : u ≤ y) :
  (divmodTo x y q u).2 ≤ y ∧
  x + q*(y+1) + (y-u) = (divmodTo x y q u).1*(y+1) + (y-(divmodTo x y q u).2) := by
  induction x generalizing q u with
  | zero => rw [divmod_zero]; exact ⟨hu, by simp⟩
  | succ x ih =>
    cases u with
    | zero =>
      rw [divmod_succ_zero]
      have h := ih (q+1) y (Nat.le_refl y)
      refine ⟨h.1, ?_⟩
      simp only [Nat.sub_self, Nat.add_zero, Nat.succ_mul] at h
      omega
    | succ u =>
      rw [divmod_succ_succ]
      have h := ih q u (by omega)
      refine ⟨h.1, ?_⟩
      omega
@[simp] theorem nat_div_native_agrees (x y : Nat) : natTo (Rocq.Corelib.Init.Nat.div (natOf x) (natOf y)) = x/y := by
  cases y with
  | zero => exact (Nat.div_zero x).symm
  | succ y =>
    have h := divmod_invariant x y 0 y (Nat.le_refl y)
    have hq : x / (y+1) = (divmodTo x y 0 y).1 := by
      apply Nat.div_eq_of_lt_le
      · simp only [Nat.zero_mul, Nat.add_zero, Nat.sub_self] at h
        omega
      · simp only [Nat.zero_mul, Nat.add_zero, Nat.sub_self] at h
        rw [Nat.succ_mul]
        omega
    exact hq.symm
@[simp] theorem nat_modulo_native_agrees (x y : Nat) : natTo (Rocq.Corelib.Init.Nat.modulo (natOf x) (natOf y)) = x%y := by
  cases y with
  | zero => change natTo (natOf x) = x%0; simp
  | succ y =>
    change natTo (Rocq.Corelib.Init.Nat.sub (natOf y) (Rocq.Corelib.Init.Datatypes.snd MN MN (Rocq.Corelib.Init.Nat.divmod (natOf x) (natOf y) .O (natOf y)))) = x%(y+1)
    rw [nat_sub_agrees, natTo_of]
    have h := divmod_invariant x y 0 y (Nat.le_refl y)
    have hq : (divmodTo x y 0 y).1 = x/(y+1) := nat_div_native_agrees x (y+1)
    rw [Nat.mod_eq_sub_div_mul, ← hq]
    change y - (divmodTo x y 0 y).2 = x - (divmodTo x y 0 y).1 * (y+1)
    simp only [Nat.zero_mul, Nat.add_zero, Nat.sub_self] at h
    omega

@[simp] theorem nat_div_agrees (x y : MN) :
 natTo (Rocq.Corelib.Init.Nat.div x y) = natTo x / natTo y := by
 simpa only [natOf_to] using nat_div_native_agrees (natTo x) (natTo y)
@[simp] theorem nat_modulo_agrees (x y : MN) :
 natTo (Rocq.Corelib.Init.Nat.modulo x y) = natTo x % natTo y := by
 simpa only [natOf_to] using nat_modulo_native_agrees (natTo x) (natTo y)


@[simp] theorem nat_testbit_agrees (a n : MN) :
 boolTo (Rocq.Corelib.Init.Nat.testbit a n) = (natTo a).testBit (natTo n) := by
 induction n generalizing a with
 | O => change boolTo (Rocq.Corelib.Init.Nat.odd a) = _; rw [nat_odd_agrees, natTo_zero, Nat.testBit_zero]
 | S n ih =>
   change boolTo (Rocq.Corelib.Init.Nat.testbit (Rocq.Corelib.Init.Nat.div2 a) n) = (natTo a).testBit (natTo n+1)
   rw [ih, nat_div2_agrees, Nat.testBit_succ]
theorem nat_bitwise_step (op : RBool → RBool → RBool) (n a b : MN) :
 natTo (Rocq.Corelib.Init.Nat.bitwise op (.S n) a b) =
 (boolTo (op (Rocq.Corelib.Init.Nat.odd a) (Rocq.Corelib.Init.Nat.odd b))).toNat +
 2 * natTo (Rocq.Corelib.Init.Nat.bitwise op n (Rocq.Corelib.Init.Nat.div2 a) (Rocq.Corelib.Init.Nat.div2 b)) := by
 change natTo (Rocq.Corelib.Init.Nat.add _ (Rocq.Corelib.Init.Nat.mul (.S (.S .O)) _)) = _
 rw [nat_add_agrees, nat_mul_agrees]
 cases op (Rocq.Corelib.Init.Nat.odd a) (Rocq.Corelib.Init.Nat.odd b) <;> rfl
theorem nat_bitwise_bits (op : RBool → RBool → RBool) (f : Bool → Bool → Bool)
 (hf : ∀ x y, boolTo (op x y) = f (boolTo x) (boolTo y)) (n a b : MN) (i : Nat) :
 (natTo (Rocq.Corelib.Init.Nat.bitwise op n a b)).testBit i =
 (decide (i < natTo n) && f ((natTo a).testBit i) ((natTo b).testBit i)) := by
 induction n generalizing a b i with
 | O => change (0 : Nat).testBit i = (decide (i < 0) && _); simp
 | S n ih =>
   rw [nat_bitwise_step, hf, nat_odd_agrees, nat_odd_agrees,
     ← Nat.testBit_zero, ← Nat.testBit_zero, natTo_succ]
   cases i with
   | zero =>
     rw [Nat.testBit_zero]
     cases h : f ((natTo a).testBit 0) ((natTo b).testBit 0) <;> simp [Bool.toNat, Nat.add_mod, Nat.mul_mod]
   | succ i =>
     rw [Nat.testBit_succ]
     have low : (f ((natTo a).testBit 0) ((natTo b).testBit 0)).toNat < 2 := by
       cases f ((natTo a).testBit 0) ((natTo b).testBit 0) <;> decide
     have half : ((f ((natTo a).testBit 0) ((natTo b).testBit 0)).toNat +
       2 * natTo (Rocq.Corelib.Init.Nat.bitwise op n (Rocq.Corelib.Init.Nat.div2 a) (Rocq.Corelib.Init.Nat.div2 b))) / 2 =
       natTo (Rocq.Corelib.Init.Nat.bitwise op n (Rocq.Corelib.Init.Nat.div2 a) (Rocq.Corelib.Init.Nat.div2 b)) := by omega
     rw [half, ih, nat_div2_agrees, nat_div2_agrees, Nat.testBit_succ, Nat.testBit_succ]
     simp
theorem nat_bitwise_agrees (op : RBool → RBool → RBool) (f : Bool → Bool → Bool)
 (hf : ∀ x y, boolTo (op x y) = f (boolTo x) (boolTo y))
 (hff : f false false = false) (n a b : MN) :
 natTo (Rocq.Corelib.Init.Nat.bitwise op n a b) = Nat.bitwise f (natTo a) (natTo b) % 2^(natTo n) := by
 apply Nat.eq_of_testBit_eq
 intro i
 rw [nat_bitwise_bits op f hf, Nat.testBit_mod_two_pow, Nat.testBit_bitwise hff]
@[simp] theorem nat_land_agrees (a b : MN) :
 natTo (Rocq.Corelib.Init.Nat.land a b) = natTo a &&& natTo b := by
 change natTo (Rocq.Corelib.Init.Nat.bitwise _ a a b) = _
 rw [nat_bitwise_agrees _ Bool.and (by intro x y; cases x <;> cases y <;> rfl) rfl]
 exact Nat.mod_eq_of_lt (Nat.lt_of_le_of_lt Nat.and_le_left (Nat.lt_two_pow_self))
@[simp] theorem nat_lor_agrees (a b : MN) :
 natTo (Rocq.Corelib.Init.Nat.lor a b) = natTo a ||| natTo b := by
 change natTo (Rocq.Corelib.Init.Nat.bitwise _ (Rocq.Corelib.Init.Nat.max a b) a b) = _
 rw [nat_bitwise_agrees _ Bool.or (by intro x y; cases x <;> cases y <;> rfl) rfl, nat_max_agrees]
 exact Nat.mod_eq_of_lt (Nat.or_lt_two_pow
   (Nat.lt_of_le_of_lt (Nat.le_max_left _ _) Nat.lt_two_pow_self)
   (Nat.lt_of_le_of_lt (Nat.le_max_right _ _) Nat.lt_two_pow_self))
@[simp] theorem nat_lxor_agrees (a b : MN) :
 natTo (Rocq.Corelib.Init.Nat.lxor a b) = natTo a ^^^ natTo b := by
 change natTo (Rocq.Corelib.Init.Nat.bitwise _ (Rocq.Corelib.Init.Nat.max a b) a b) = _
 rw [nat_bitwise_agrees _ Bool.xor (by intro x y; cases x <;> cases y <;> rfl) rfl, nat_max_agrees]
 exact Nat.mod_eq_of_lt (Nat.xor_lt_two_pow
   (Nat.lt_of_le_of_lt (Nat.le_max_left _ _) Nat.lt_two_pow_self)
   (Nat.lt_of_le_of_lt (Nat.le_max_right _ _) Nat.lt_two_pow_self))
@[simp] theorem nat_ldiff_agrees (a b : MN) :
 natTo (Rocq.Corelib.Init.Nat.ldiff a b) = Nat.bitwise (fun x y => x && !y) (natTo a) (natTo b) := by
 apply Nat.eq_of_testBit_eq
 intro i
 change (natTo (Rocq.Corelib.Init.Nat.bitwise _ a a b)).testBit i = _
 rw [nat_bitwise_bits _ (fun x y => x && !y) (by intro x y; cases x <;> cases y <;> rfl),
   Nat.testBit_bitwise (by rfl)]
 by_cases h : i < natTo a
 · simp [h]
 · have ha : natTo a < 2^i := Nat.lt_of_lt_of_le Nat.lt_two_pow_self (Nat.pow_le_pow_right (by decide) (by omega))
   simp [h, Nat.testBit_lt_two_pow ha]

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
  IO.FS.writeFile "/home/shunqwang4/research/rocq-core/experiments/mechanical-correspondence-20261019/audits/Nat.json" (Lean.Json.pretty (.arr rows))

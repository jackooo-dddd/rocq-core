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
def natIso : Iso Nat Nat := ⟨id, id, fun _ => rfl, fun _ => rfl⟩
theorem eq_correspondence {A : Sort u} (x y : A) : (x = y) ↔ (x = y) := Iff.rfl

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

abbrev RList (A : Type u) := Rocq.Corelib.Init.Datatypes.list A
def listOf {A : Type u} : List A → RList A
  | [] => Rocq.Corelib.Init.Datatypes.list.nil A
  | x :: xs => Rocq.Corelib.Init.Datatypes.list.cons A x (listOf xs)
def listTo {A : Type u} : RList A → List A :=
  @Rocq.Corelib.Init.Datatypes.list.rec A (fun _ => List A)
    [] (fun x _ xs => x :: xs)
@[simp] theorem list_to_of {A : Type u} (xs : List A) : listTo (listOf xs) = xs := by
  induction xs with
  | nil => rfl
  | cons x xs ih => change x :: listTo (listOf xs) = x :: xs; rw [ih]
@[simp] theorem list_of_to {A : Type u} (xs : RList A) : listOf (listTo xs) = xs :=
  @Rocq.Corelib.Init.Datatypes.list.rec A (fun xs => listOf (listTo xs) = xs)
    rfl (fun x xs ih => by
      change Rocq.Corelib.Init.Datatypes.list.cons A x (listOf (listTo xs)) =
        Rocq.Corelib.Init.Datatypes.list.cons A x xs
      rw [ih]) xs
def listIso (A : Type u) : Iso (RList A) (List A) := ⟨listTo, listOf, list_of_to, list_to_of⟩

def optionTo {A : Type u} : Rocq.Corelib.Init.Datatypes.option A → Option A :=
  Rocq.Corelib.Init.Datatypes.option.rec (fun x => some x) none
def optionOf {A : Type u} : Option A → Rocq.Corelib.Init.Datatypes.option A
  | some x => .Some A x
  | none => .None A
@[simp] theorem option_of_to {A : Type u} (x : Rocq.Corelib.Init.Datatypes.option A) : optionOf (optionTo x) = x := by cases x <;> rfl
@[simp] theorem option_to_of {A : Type u} (x : Option A) : optionTo (optionOf x) = x := by cases x <;> rfl
def optionIso (A : Type u) : Iso (Rocq.Corelib.Init.Datatypes.option A) (Option A) := ⟨optionTo, optionOf, option_of_to, option_to_of⟩

def prodTo {A : Type u} {B : Type v} : Rocq.Corelib.Init.Datatypes.prod A B → A × B :=
  Rocq.Corelib.Init.Datatypes.prod.rec (fun a b => (a,b))
def prodOf {A : Type u} {B : Type v} (x : A × B) : Rocq.Corelib.Init.Datatypes.prod A B := .pair A B x.1 x.2
@[simp] theorem prod_of_to {A : Type u} {B : Type v} (x : Rocq.Corelib.Init.Datatypes.prod A B) : prodOf (prodTo x) = x := by cases x <;> rfl
@[simp] theorem prod_to_of {A : Type u} {B : Type v} (x : A × B) : prodTo (prodOf x) = x := by cases x <;> rfl
def prodIso (A : Type u) (B : Type v) : Iso (Rocq.Corelib.Init.Datatypes.prod A B) (A × B) := ⟨prodTo, prodOf, prod_of_to, prod_to_of⟩

def sumTo {A : Type u} {B : Type v} : Rocq.Corelib.Init.Datatypes.sum A B → Sum A B :=
  Rocq.Corelib.Init.Datatypes.sum.rec Sum.inl Sum.inr
def sumOf {A : Type u} {B : Type v} : Sum A B → Rocq.Corelib.Init.Datatypes.sum A B
  | .inl x => .inl A B x
  | .inr y => .inr A B y
@[simp] theorem sum_of_to {A : Type u} {B : Type v} (x : Rocq.Corelib.Init.Datatypes.sum A B) : sumOf (sumTo x) = x := by cases x <;> rfl
@[simp] theorem sum_to_of {A : Type u} {B : Type v} (x : Sum A B) : sumTo (sumOf x) = x := by cases x <;> rfl
def sumIso (A : Type u) (B : Type v) : Iso (Rocq.Corelib.Init.Datatypes.sum A B) (Sum A B) := ⟨sumTo, sumOf, sum_of_to, sum_to_of⟩

def resultTo {A : Type u} {E : Type v} : Rocq.Corelib.Init.Datatypes.result A E → Except E A :=
  Rocq.Corelib.Init.Datatypes.result.rec Except.ok Except.error
def resultOf {A : Type u} {E : Type v} : Except E A → Rocq.Corelib.Init.Datatypes.result A E
  | .ok x => .Ok A E x
  | .error e => .Error A E e
@[simp] theorem result_of_to {A : Type u} {E : Type v} (x : Rocq.Corelib.Init.Datatypes.result A E) : resultOf (resultTo x) = x := by cases x <;> rfl
@[simp] theorem result_to_of {A : Type u} {E : Type v} (x : Except E A) : resultTo (resultOf x) = x := by cases x <;> rfl
def resultIso (A : Type u) (E : Type v) : Iso (Rocq.Corelib.Init.Datatypes.result A E) (Except E A) := ⟨resultTo, resultOf, result_of_to, result_to_of⟩
def unitIso : Iso Rocq.Corelib.Init.Datatypes.unit Unit where
  to _ := ()
  of _ := .tt
  of_to x := by cases x; rfl
  to_of x := by cases x; rfl
def emptyIso : Iso Rocq.Corelib.Init.Datatypes.Empty_set Empty where
  to x := by cases x
  of x := nomatch x
  of_to x := by cases x
  to_of x := nomatch x

@[simp] theorem andb_agrees (a b : RBool) : boolTo (Rocq.Corelib.Init.Datatypes.andb a b) = (boolTo a && boolTo b) := by cases a <;> cases b <;> rfl
@[simp] theorem orb_agrees (a b : RBool) : boolTo (Rocq.Corelib.Init.Datatypes.orb a b) = (boolTo a || boolTo b) := by cases a <;> cases b <;> rfl
@[simp] theorem negb_agrees (a : RBool) : boolTo (Rocq.Corelib.Init.Datatypes.negb a) = !boolTo a := by cases a <;> rfl
@[simp] theorem xorb_agrees (a b : RBool) : boolTo (Rocq.Corelib.Init.Datatypes.xorb a b) = Bool.xor (boolTo a) (boolTo b) := by cases a <;> cases b <;> rfl
@[simp] theorem implb_agrees (a b : RBool) : boolTo (Rocq.Corelib.Init.Datatypes.implb a b) = (!boolTo a || boolTo b) := by cases a <;> cases b <;> rfl
@[simp] theorem is_true_agrees (a : RBool) : Rocq.Corelib.Init.Datatypes.is_true a ↔ boolTo a = true := by
  cases a
  · constructor <;> intro h <;> rfl
  · constructor
    · intro h
      exact congrArg boolTo h
    · intro h
      exact Bool.noConfusion h
@[simp] theorem compOpp_agrees (c : RComparison) : comparisonTo (Rocq.Corelib.Init.Datatypes.CompOpp c) = (comparisonTo c).swap := by cases c <;> rfl
@[simp] theorem option_map_agrees {A : Type u} {B : Type v} (f : A → B) (x : Rocq.Corelib.Init.Datatypes.option A) :
  optionTo (Rocq.Corelib.Init.Datatypes.option_map A B f x) = (optionTo x).map f := by cases x <;> rfl
@[simp] theorem fst_agrees {A : Type u} {B : Type v} (x : Rocq.Corelib.Init.Datatypes.prod A B) :
  Rocq.Corelib.Init.Datatypes.fst A B x = (prodTo x).1 := by cases x <;> rfl
@[simp] theorem snd_agrees {A : Type u} {B : Type v} (x : Rocq.Corelib.Init.Datatypes.prod A B) :
  Rocq.Corelib.Init.Datatypes.snd A B x = (prodTo x).2 := by cases x <;> rfl
@[simp] theorem length_agrees {A : Type u} (xs : RList A) :
  Rocq.Corelib.Init.Datatypes.length A xs = (listTo xs).length :=
  @Rocq.Corelib.Init.Datatypes.list.rec A (fun xs => Rocq.Corelib.Init.Datatypes.length A xs = (listTo xs).length)
    rfl (fun x xs ih => by change Nat.succ (Rocq.Corelib.Init.Datatypes.length A xs) = Nat.succ (listTo xs).length; rw [ih]) xs
@[simp] theorem append_agrees {A : Type u} (xs ys : RList A) :
  listTo (Rocq.Corelib.Init.Datatypes.app A xs ys) = listTo xs ++ listTo ys :=
  @Rocq.Corelib.Init.Datatypes.list.rec A (fun xs => listTo (Rocq.Corelib.Init.Datatypes.app A xs ys) = listTo xs ++ listTo ys)
    rfl (fun x xs ih => by change x :: listTo (Rocq.Corelib.Init.Datatypes.app A xs ys) = x :: (listTo xs ++ listTo ys); rw [ih]) xs

-- Consume native List functions on arbitrary translated lists, and return translated data.
def reverseTranslated {A : Type u} (xs : RList A) : RList A :=
  (listIso A).call (listIso A) List.reverse xs
theorem reverseTranslated_agrees {A : Type u} (xs : RList A) :
  listTo (reverseTranslated xs) = (listTo xs).reverse :=
  Iso.call_agrees (listIso A) (listIso A) List.reverse xs
theorem reverseTranslated_involutive {A : Type u} (xs : RList A) :
  reverseTranslated (reverseTranslated xs) = xs := by
  apply (listIso A).injective
  change listTo (reverseTranslated (reverseTranslated xs)) = listTo xs
  rw [reverseTranslated_agrees, reverseTranslated_agrees, List.reverse_reverse]
-- Recursive element conversion: mechanically translated lists of booleans ↔ native List Bool.
def boolListIso : Iso (RList RBool) (List Bool) := (listIso RBool).trans boolIso.lists
-- Transfer equality decisions from the native carrier.
noncomputable def translatedBoolDecidableEq : DecidableEq RBool := boolIso.decidableEq
-- Use a native theorem to establish a property of the actual mechanical append.
theorem translated_append_assoc {A : Type u} (xs ys zs : RList A) :
  Rocq.Corelib.Init.Datatypes.app A (Rocq.Corelib.Init.Datatypes.app A xs ys) zs =
  Rocq.Corelib.Init.Datatypes.app A xs (Rocq.Corelib.Init.Datatypes.app A ys zs) := by
  apply (listIso A).injective
  change listTo (Rocq.Corelib.Init.Datatypes.app A (Rocq.Corelib.Init.Datatypes.app A xs ys) zs) =
    listTo (Rocq.Corelib.Init.Datatypes.app A xs (Rocq.Corelib.Init.Datatypes.app A ys zs))
  simp only [append_agrees, List.append_assoc]

@[simp] theorem true_agrees : Rocq.Corelib.Init.Logic.True ↔ True := by
  constructor
  · intro _; trivial
  · intro _; exact .I
@[simp] theorem false_agrees : Rocq.Corelib.Init.Logic.False ↔ False := by
  constructor <;> intro h <;> cases h
@[simp] theorem and_agrees (P Q : Prop) : Rocq.Corelib.Init.Logic.and P Q ↔ (P ∧ Q) := by
  constructor
  · intro h; cases h with | conj p q => exact ⟨p,q⟩
  · rintro ⟨p,q⟩; exact .conj P Q p q
@[simp] theorem or_agrees (P Q : Prop) : Rocq.Corelib.Init.Logic.or P Q ↔ (P ∨ Q) := by
  constructor
  · intro h; cases h with
    | or_introl p => exact Or.inl p
    | or_intror q => exact Or.inr q
  · intro h; cases h with
    | inl p => exact .or_introl P Q p
    | inr q => exact .or_intror P Q q
@[simp] theorem not_agrees (P : Prop) : Rocq.Corelib.Init.Logic.not P ↔ ¬ P := by
  change (P → Rocq.Corelib.Init.Logic.False) ↔ (P → False)
  simp only [false_agrees]
@[simp] theorem notT_agrees (A : Sort u) : Rocq.Corelib.Init.Logic.notT A ↔ (A → False) := by
  change (A → Rocq.Corelib.Init.Logic.False) ↔ (A → False)
  simp only [false_agrees]
@[simp] theorem iff_agrees (P Q : Prop) : Rocq.Corelib.Init.Logic.iff P Q ↔ (P ↔ Q) := by
  change Rocq.Corelib.Init.Logic.and (P → Q) (Q → P) ↔ (P ↔ Q)
  rw [and_agrees]
  exact ⟨fun h => ⟨h.1,h.2⟩, fun h => ⟨h.mp,h.mpr⟩⟩
@[simp] theorem ex_agrees {A : Sort u} (P : A → Prop) : Rocq.Corelib.Init.Logic.ex A P ↔ ∃ x, P x := by
  constructor
  · intro h; cases h with | ex_intro x hx => exact ⟨x,hx⟩
  · rintro ⟨x,hx⟩; exact .ex_intro A P x hx
@[simp] theorem ex2_agrees {A : Sort u} (P Q : A → Prop) : Rocq.Corelib.Init.Logic.ex2 A P Q ↔ ∃ x, P x ∧ Q x := by
  constructor
  · intro h; cases h with | ex_intro2 x hp hq => exact ⟨x,hp,hq⟩
  · rintro ⟨x,hp,hq⟩; exact .ex_intro2 A P Q x hp hq
@[simp] theorem inhabited_agrees (A : Sort u) : Rocq.Corelib.Init.Logic.inhabited A ↔ Nonempty A := by
  constructor
  · intro h; cases h with | inhabits x => exact ⟨x⟩
  · rintro ⟨x⟩; exact .inhabits A x
@[simp] theorem all_agrees {A : Sort u} (P : A → Prop) : Rocq.Corelib.Init.Logic.all A P ↔ ∀ x, P x := Iff.rfl

abbrev RN := Rocq.Corelib.Init.Nat.t
theorem nat_type_agrees : RN = Nat := rfl
@[simp] theorem nat_zero_agrees : Rocq.Corelib.Init.Nat.zero = 0 := rfl
@[simp] theorem nat_one_agrees : Rocq.Corelib.Init.Nat.one = 1 := rfl
@[simp] theorem nat_two_agrees : Rocq.Corelib.Init.Nat.two = 2 := rfl
@[simp] theorem nat_succ_agrees (n : Nat) : Rocq.Corelib.Init.Nat.succ n = n+1 := rfl
@[simp] theorem nat_pred_agrees (n : Nat) : Rocq.Corelib.Init.Nat.pred n = n-1 := by cases n <;> rfl
@[simp] theorem nat_add_agrees (n m : Nat) : Rocq.Corelib.Init.Nat.add n m = n + m := by
  induction n with
  | zero => exact (Nat.zero_add m).symm
  | succ n ih =>
    change Nat.succ (Rocq.Corelib.Init.Nat.add n m) = Nat.succ n + m
    rw [ih, Nat.succ_add]
@[simp] theorem nat_sub_agrees (n m : Nat) : Rocq.Corelib.Init.Nat.sub n m = n - m := by
  induction n generalizing m with
  | zero => change 0 = 0 - m; simp
  | succ n ih => cases m with
    | zero => rfl
    | succ m =>
      change Rocq.Corelib.Init.Nat.sub n m = (n+1)-(m+1)
      rw [Nat.succ_sub_succ]; exact ih m
@[simp] theorem nat_mul_agrees (n m : Nat) : Rocq.Corelib.Init.Nat.mul n m = n * m := by
  induction n with
  | zero => exact (Nat.zero_mul m).symm
  | succ n ih =>
    change Rocq.Corelib.Init.Nat.add m (Rocq.Corelib.Init.Nat.mul n m) = (n+1)*m
    rw [nat_add_agrees, ih, Nat.succ_mul, Nat.add_comm]
@[simp] theorem nat_pow_agrees (n m : Nat) : Rocq.Corelib.Init.Nat.pow n m = n ^ m := by
  induction m with
  | zero => rfl
  | succ m ih =>
    change Rocq.Corelib.Init.Nat.mul n (Rocq.Corelib.Init.Nat.pow n m) = n ^ (m+1)
    rw [nat_mul_agrees, ih, Nat.pow_succ, Nat.mul_comm]
@[simp] theorem nat_double_agrees (n : Nat) : Rocq.Corelib.Init.Nat.double n = 2*n := by
  change Rocq.Corelib.Init.Nat.add n n = 2*n
  rw [nat_add_agrees]; omega
@[simp] theorem nat_square_agrees (n : Nat) : Rocq.Corelib.Init.Nat.square n = n*n := nat_mul_agrees n n
@[simp] theorem nat_eqb_agrees (n m : Nat) : boolTo (Rocq.Corelib.Init.Nat.eqb n m) = (n == m) := by
  induction n generalizing m with
  | zero => cases m <;> rfl
  | succ n ih => cases m with
    | zero => rfl
    | succ m =>
      change boolTo (Rocq.Corelib.Init.Nat.eqb n m) = (n+1 == m+1)
      simpa using ih m
@[simp] theorem nat_leb_agrees (n m : Nat) : boolTo (Rocq.Corelib.Init.Nat.leb n m) = decide (n ≤ m) := by
  induction n generalizing m with
  | zero => cases m <;> rfl
  | succ n ih => cases m with
    | zero => rfl
    | succ m =>
      change boolTo (Rocq.Corelib.Init.Nat.leb n m) = decide (n+1 ≤ m+1)
      simpa using ih m
@[simp] theorem nat_ltb_agrees (n m : Nat) : boolTo (Rocq.Corelib.Init.Nat.ltb n m) = decide (n < m) :=
  nat_leb_agrees (n+1) m
@[simp] theorem nat_min_agrees (n m : Nat) : Rocq.Corelib.Init.Nat.min n m = min n m := by
  induction n generalizing m with
  | zero => cases m <;> rfl
  | succ n ih => cases m with
    | zero => rfl
    | succ m =>
      change (Rocq.Corelib.Init.Nat.min n m)+1 = min (n+1) (m+1)
      rw [ih]; omega
@[simp] theorem nat_max_agrees (n m : Nat) : Rocq.Corelib.Init.Nat.max n m = max n m := by
  induction n generalizing m with
  | zero => cases m <;> rfl
  | succ n ih => cases m with
    | zero => rfl
    | succ m =>
      change (Rocq.Corelib.Init.Nat.max n m)+1 = max (n+1) (m+1)
      rw [ih]; omega
@[simp] theorem nat_tail_add_agrees (n m : Nat) : Rocq.Corelib.Init.Nat.tail_add n m = n+m := by
  induction n generalizing m with
  | zero => exact (Nat.zero_add m).symm
  | succ n ih =>
    change Rocq.Corelib.Init.Nat.tail_add n (m+1) = n+1+m
    rw [ih]; omega
@[simp] theorem nat_tail_addmul_agrees (r n m : Nat) : Rocq.Corelib.Init.Nat.tail_addmul r n m = r+n*m := by
  induction n generalizing r with
  | zero => change r = r+0*m; simp
  | succ n ih =>
    change Rocq.Corelib.Init.Nat.tail_addmul (Rocq.Corelib.Init.Nat.tail_add m r) n m = r+(n+1)*m
    rw [ih, nat_tail_add_agrees, Nat.succ_mul]; omega
@[simp] theorem nat_tail_mul_agrees (n m : Nat) : Rocq.Corelib.Init.Nat.tail_mul n m = n*m := by
  change Rocq.Corelib.Init.Nat.tail_addmul 0 n m = n*m
  rw [nat_tail_addmul_agrees, Nat.zero_add]

-- Direct reuse of native Lean laws with the mechanically translated operation.
theorem translated_add_comm (n m : Nat) : Rocq.Corelib.Init.Nat.add n m = Rocq.Corelib.Init.Nat.add m n := by
  simp only [nat_add_agrees, Nat.add_comm]
theorem translated_mul_comm (n m : Nat) : Rocq.Corelib.Init.Nat.mul n m = Rocq.Corelib.Init.Nat.mul m n := by
  simp only [nat_mul_agrees, Nat.mul_comm]
theorem translated_add_assoc (n m k : Nat) :
  Rocq.Corelib.Init.Nat.add (Rocq.Corelib.Init.Nat.add n m) k =
  Rocq.Corelib.Init.Nat.add n (Rocq.Corelib.Init.Nat.add m k) := by simp only [nat_add_agrees, Nat.add_assoc]
theorem translated_sub_add (n m : Nat) (h : m ≤ n) : Rocq.Corelib.Init.Nat.add (Rocq.Corelib.Init.Nat.sub n m) m = n := by
  simp only [nat_add_agrees, nat_sub_agrees]; exact Nat.sub_add_cancel h

theorem two_step {P : Nat → Prop} (hz : P 0) (ho : P 1) (hs : ∀ n, P n → P (n+1) → P (n+2)) : ∀ n, P n := by
  intro n
  have h : P n ∧ P (n+1) := by
    induction n with
    | zero => exact ⟨hz,ho⟩
    | succ n ih => exact ⟨ih.2, hs n ih.1 ih.2⟩
  exact h.1
@[simp] theorem nat_compare_agrees (n m : Nat) :
  comparisonTo (Rocq.Corelib.Init.Nat.compare n m) = compare n m := by
  induction n generalizing m with
  | zero =>
    cases m with
    | zero => rfl
    | succ m =>
      change Ordering.lt = compare 0 (m+1)
      exact (Nat.compare_eq_lt.mpr (by omega)).symm
  | succ n ih =>
    cases m with
    | zero =>
      change Ordering.gt = compare (n+1) 0
      exact (Nat.compare_eq_gt.mpr (by omega)).symm
    | succ m =>
      change comparisonTo (Rocq.Corelib.Init.Nat.compare n m) = compare (n+1) (m+1)
      rw [ih, Nat.compare_eq_ite_lt, Nat.compare_eq_ite_lt]
      simp
theorem nat_even_step (n : Nat) : Rocq.Corelib.Init.Nat.even (n+2) = Rocq.Corelib.Init.Nat.even n := rfl
@[simp] theorem nat_even_agrees (n : Nat) :
  boolTo (Rocq.Corelib.Init.Nat.even n) = decide (n % 2 = 0) := by
  induction n using two_step with
  | hz => rfl
  | ho => rfl
  | hs n ih ih1 =>
    rw [nat_even_step, ih]
    rw [show (n+2)%2 = n%2 by omega]
@[simp] theorem nat_odd_agrees (n : Nat) :
  boolTo (Rocq.Corelib.Init.Nat.odd n) = decide (n % 2 = 1) := by
  change boolTo (Rocq.Corelib.Init.Datatypes.negb (Rocq.Corelib.Init.Nat.even n)) = _
  have h : ∀ b : RBool, boolTo (Rocq.Corelib.Init.Datatypes.negb b) = !boolTo b := by intro b; cases b <;> rfl
  rw [h, nat_even_agrees]
  by_cases h0 : n % 2 = 0
  · have h1 : n % 2 ≠ 1 := by omega
    simp [h0, h1]
  · have h1 : n % 2 = 1 := by omega
    simp [h0, h1]
theorem nat_div2_step (n : Nat) : Rocq.Corelib.Init.Nat.div2 (n+2) = Rocq.Corelib.Init.Nat.div2 n+1 := rfl
@[simp] theorem nat_div2_agrees (n : Nat) : Rocq.Corelib.Init.Nat.div2 n = n/2 := by
  induction n using two_step with
  | hz => rfl
  | ho => rfl
  | hs n ih ih1 => rw [nat_div2_step, ih]; omega
@[simp] theorem nat_shiftl_agrees (n k : Nat) : Rocq.Corelib.Init.Nat.shiftl n k = n <<< k := by
  rw [Nat.shiftLeft_eq]
  induction k with
  | zero => exact (Nat.mul_one n).symm
  | succ k ih =>
    change Rocq.Corelib.Init.Nat.double (Rocq.Corelib.Init.Nat.shiftl n k) = _
    rw [nat_double_agrees, ih, Nat.pow_succ]
    simp only [Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm]
@[simp] theorem nat_shiftr_agrees (n k : Nat) : Rocq.Corelib.Init.Nat.shiftr n k = n >>> k := by
  rw [Nat.shiftRight_eq_div_pow]
  induction k with
  | zero => exact (Nat.div_one n).symm
  | succ k ih =>
    change Rocq.Corelib.Init.Nat.div2 (Rocq.Corelib.Init.Nat.shiftr n k) = _
    rw [nat_div2_agrees, ih, Nat.div_div_eq_div_mul, Nat.pow_succ]

def divmodTo (x y q u : Nat) : Nat × Nat :=
  Rocq.Corelib.Init.Datatypes.prod.rec (fun q r => (q,r)) (Rocq.Corelib.Init.Nat.divmod x y q u)
theorem divmod_zero (y q u : Nat) : divmodTo 0 y q u = (q,u) := rfl
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
@[simp] theorem nat_div_agrees (x y : Nat) : Rocq.Corelib.Init.Nat.div x y = x/y := by
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
@[simp] theorem nat_modulo_agrees (x y : Nat) : Rocq.Corelib.Init.Nat.modulo x y = x%y := by
  cases y with
  | zero => exact (Nat.mod_zero x).symm
  | succ y =>
    change Rocq.Corelib.Init.Nat.sub y (Rocq.Corelib.Init.Datatypes.snd Nat Nat (Rocq.Corelib.Init.Nat.divmod x y 0 y)) = x%(y+1)
    rw [nat_sub_agrees]
    have h := divmod_invariant x y 0 y (Nat.le_refl y)
    have hq : (divmodTo x y 0 y).1 = x/(y+1) := nat_div_agrees x (y+1)
    rw [Nat.mod_eq_sub_div_mul, ← hq]
    change y - (divmodTo x y 0 y).2 = x - (divmodTo x y 0 y).1 * (y+1)
    simp only [Nat.zero_mul, Nat.add_zero, Nat.sub_self] at h
    omega


@[simp] theorem nat_testbit_agrees (a n : Nat) :
 boolTo (Rocq.Corelib.Init.Nat.testbit a n) = a.testBit n := by
 induction n generalizing a with
 | zero => change boolTo (Rocq.Corelib.Init.Nat.odd a) = _; rw [nat_odd_agrees, Nat.testBit_zero]
 | succ n ih =>
   change boolTo (Rocq.Corelib.Init.Nat.testbit (Rocq.Corelib.Init.Nat.div2 a) n) = _
   rw [ih, nat_div2_agrees, Nat.testBit_succ]
theorem nat_bitwise_step (op : RBool → RBool → RBool) (n a b : Nat) :
 Rocq.Corelib.Init.Nat.bitwise op (n+1) a b =
 (boolTo (op (Rocq.Corelib.Init.Nat.odd a) (Rocq.Corelib.Init.Nat.odd b))).toNat +
 2 * Rocq.Corelib.Init.Nat.bitwise op n (Rocq.Corelib.Init.Nat.div2 a) (Rocq.Corelib.Init.Nat.div2 b) := by
 change Rocq.Corelib.Init.Nat.add _ (Rocq.Corelib.Init.Nat.mul 2 _) = _
 rw [nat_add_agrees, nat_mul_agrees]
 cases op (Rocq.Corelib.Init.Nat.odd a) (Rocq.Corelib.Init.Nat.odd b) <;> rfl
theorem nat_bitwise_bits (op : RBool → RBool → RBool) (f : Bool → Bool → Bool)
 (hf : ∀ x y, boolTo (op x y) = f (boolTo x) (boolTo y)) (n a b i : Nat) :
 (Rocq.Corelib.Init.Nat.bitwise op n a b).testBit i =
 (decide (i < n) && f (a.testBit i) (b.testBit i)) := by
 induction n generalizing a b i with
 | zero => change (0 : Nat).testBit i = _; simp
 | succ n ih =>
   rw [nat_bitwise_step, hf, nat_odd_agrees, nat_odd_agrees,
     ← Nat.testBit_zero, ← Nat.testBit_zero, nat_div2_agrees, nat_div2_agrees]
   cases i with
   | zero =>
     rw [Nat.testBit_zero]
     cases h : f (a.testBit 0) (b.testBit 0) <;> simp [Bool.toNat, Nat.add_mod, Nat.mul_mod]
   | succ i =>
     rw [Nat.testBit_succ]
     have low : (f (a.testBit 0) (b.testBit 0)).toNat < 2 := by cases f (a.testBit 0) (b.testBit 0) <;> decide
     have half : ((f (a.testBit 0) (b.testBit 0)).toNat +
       2 * Rocq.Corelib.Init.Nat.bitwise op n (a/2) (b/2)) / 2 =
       Rocq.Corelib.Init.Nat.bitwise op n (a/2) (b/2) := by omega
     rw [half, ih, Nat.testBit_succ, Nat.testBit_succ]
     simp
theorem nat_bitwise_agrees (op : RBool → RBool → RBool) (f : Bool → Bool → Bool)
 (hf : ∀ x y, boolTo (op x y) = f (boolTo x) (boolTo y))
 (hff : f false false = false) (n a b : Nat) :
 Rocq.Corelib.Init.Nat.bitwise op n a b = Nat.bitwise f a b % 2^n := by
 apply Nat.eq_of_testBit_eq
 intro i
 rw [nat_bitwise_bits op f hf, Nat.testBit_mod_two_pow, Nat.testBit_bitwise hff]
@[simp] theorem nat_land_agrees (a b : Nat) :
 Rocq.Corelib.Init.Nat.land a b = a &&& b := by
 change Rocq.Corelib.Init.Nat.bitwise _ a a b = _
 rw [nat_bitwise_agrees _ Bool.and (by intro x y; cases x <;> cases y <;> rfl) rfl]
 exact Nat.mod_eq_of_lt (Nat.lt_of_le_of_lt Nat.and_le_left (Nat.lt_two_pow_self))
@[simp] theorem nat_lor_agrees (a b : Nat) :
 Rocq.Corelib.Init.Nat.lor a b = a ||| b := by
 change Rocq.Corelib.Init.Nat.bitwise _ (Rocq.Corelib.Init.Nat.max a b) a b = _
 rw [nat_max_agrees, nat_bitwise_agrees _ Bool.or (by intro x y; cases x <;> cases y <;> rfl) rfl]
 exact Nat.mod_eq_of_lt (Nat.or_lt_two_pow
   (Nat.lt_of_le_of_lt (Nat.le_max_left a b) Nat.lt_two_pow_self)
   (Nat.lt_of_le_of_lt (Nat.le_max_right a b) Nat.lt_two_pow_self))
@[simp] theorem nat_lxor_agrees (a b : Nat) :
 Rocq.Corelib.Init.Nat.lxor a b = a ^^^ b := by
 change Rocq.Corelib.Init.Nat.bitwise _ (Rocq.Corelib.Init.Nat.max a b) a b = _
 rw [nat_max_agrees, nat_bitwise_agrees _ Bool.xor (by intro x y; cases x <;> cases y <;> rfl) rfl]
 exact Nat.mod_eq_of_lt (Nat.xor_lt_two_pow
   (Nat.lt_of_le_of_lt (Nat.le_max_left a b) Nat.lt_two_pow_self)
   (Nat.lt_of_le_of_lt (Nat.le_max_right a b) Nat.lt_two_pow_self))
@[simp] theorem nat_ldiff_agrees (a b : Nat) :
 Rocq.Corelib.Init.Nat.ldiff a b = Nat.bitwise (fun x y => x && !y) a b := by
 apply Nat.eq_of_testBit_eq
 intro i
 change (Rocq.Corelib.Init.Nat.bitwise _ a a b).testBit i = _
 rw [nat_bitwise_bits _ (fun x y => x && !y) (by intro x y; cases x <;> cases y <;> rfl),
   Nat.testBit_bitwise (by rfl)]
 by_cases h : i < a
 · simp [h]
 · have ha : a < 2^i := Nat.lt_of_lt_of_le Nat.lt_two_pow_self (Nat.pow_le_pow_right (by decide) (by omega))
   simp [h, Nat.testBit_lt_two_pow ha]

@[simp] theorem map_agrees {A : Type u} {B : Type v} (f : A → B) (xs : RList A) :
  listTo (Rocq.Corelib.Lists.ListDef.map A B f xs) = (listTo xs).map f :=
  @Rocq.Corelib.Init.Datatypes.list.rec A (fun xs => listTo (Rocq.Corelib.Lists.ListDef.map A B f xs) = (listTo xs).map f)
    rfl (fun x xs ih => by change f x :: listTo (Rocq.Corelib.Lists.ListDef.map A B f xs) = f x :: (listTo xs).map f; rw [ih]) xs
@[simp] theorem repeat_agrees {A : Type u} (a : A) (n : Nat) :
  listTo (Rocq.Corelib.Lists.ListDef.repeat A a n) = List.replicate n a := by
  induction n with
  | zero => rfl
  | succ n ih => change a :: listTo (Rocq.Corelib.Lists.ListDef.repeat A a n) = a :: List.replicate n a; rw [ih]
@[simp] theorem firstn_agrees {A : Type u} (n : Nat) (xs : RList A) :
  listTo (Rocq.Corelib.Lists.ListDef.firstn A n xs) = (listTo xs).take n := by
  induction n generalizing xs with
  | zero => rfl
  | succ n ih =>
    cases xs with
    | nil => rfl
    | cons x xs => change x :: listTo (Rocq.Corelib.Lists.ListDef.firstn A n xs) = x :: (listTo xs).take n; rw [ih]
@[simp] theorem skipn_agrees {A : Type u} (n : Nat) (xs : RList A) :
  listTo (Rocq.Corelib.Lists.ListDef.skipn A n xs) = (listTo xs).drop n := by
  induction n generalizing xs with
  | zero => rfl
  | succ n ih =>
    cases xs with
    | nil => rfl
    | cons x xs => exact ih xs
@[simp] theorem nth_agrees {A : Type u} (n : Nat) (xs : RList A) (d : A) :
  Rocq.Corelib.Lists.ListDef.nth A n xs d = (listTo xs)[n]?.getD d := by
  induction n generalizing xs with
  | zero => cases xs <;> rfl
  | succ n ih =>
    cases xs with
    | nil => rfl
    | cons x xs => exact ih xs
@[simp] theorem seq_agrees (start len : Nat) :
  listTo (Rocq.Corelib.Lists.ListDef.seq start len) = List.range' start len := by
  induction len generalizing start with
  | zero => rfl
  | succ len ih =>
    change start :: listTo (Rocq.Corelib.Lists.ListDef.seq (start+1) len) = start :: List.range' (start+1) len
    rw [ih]
@[simp] theorem forall_list_agrees {A : Type u} (P : A → Prop) (xs : RList A) :
  Rocq.Corelib.Lists.ListDef.Forall A P xs ↔ ∀ x ∈ listTo xs, P x := by
  constructor
  · intro h
    induction h using Rocq.Corelib.Lists.ListDef.Forall.rec with
    | Forall_nil => intro x hx; cases hx
    | Forall_cons x xs hx hxs ih =>
      intro y hy
      change y ∈ x :: listTo xs at hy
      cases hy with
      | head => exact hx
      | tail _ hy => exact ih y hy
  · induction xs using Rocq.Corelib.Init.Datatypes.list.rec with
    | nil => intro _; exact .Forall_nil A P
    | cons x xs ih =>
      intro h
      apply Rocq.Corelib.Lists.ListDef.Forall.Forall_cons A P x xs
      · exact h x (by change x ∈ x :: listTo xs; exact .head _)
      · apply ih; intro y hy
        exact h y (by change y ∈ x :: listTo xs; exact .tail _ hy)

def sigTo {A : Type u} {P : A → Prop} : Rocq.Corelib.Init.Specif.sig A P → Subtype P :=
  Rocq.Corelib.Init.Specif.sig.rec (fun x h => ⟨x,h⟩)
def sigOf {A : Type u} {P : A → Prop} (x : Subtype P) : Rocq.Corelib.Init.Specif.sig A P := .exist A P x.val x.property
@[simp] theorem sig_of_to {A : Type u} {P : A → Prop} (x : Rocq.Corelib.Init.Specif.sig A P) : sigOf (sigTo x) = x := by cases x <;> rfl
@[simp] theorem sig_to_of {A : Type u} {P : A → Prop} (x : Subtype P) : sigTo (sigOf x) = x := by cases x <;> rfl
def sigIso (A : Type u) (P : A → Prop) : Iso (Rocq.Corelib.Init.Specif.sig A P) (Subtype P) := ⟨sigTo, sigOf, sig_of_to, sig_to_of⟩

def sig2To {A : Type u} {P Q : A → Prop} : Rocq.Corelib.Init.Specif.sig2 A P Q → {x : A // P x ∧ Q x} :=
  Rocq.Corelib.Init.Specif.sig2.rec (fun x hp hq => ⟨x,hp,hq⟩)
def sig2Of {A : Type u} {P Q : A → Prop} (x : {x : A // P x ∧ Q x}) : Rocq.Corelib.Init.Specif.sig2 A P Q :=
  .exist2 A P Q x.val x.property.1 x.property.2
@[simp] theorem sig2_of_to {A : Type u} {P Q : A → Prop} (x : Rocq.Corelib.Init.Specif.sig2 A P Q) : sig2Of (sig2To x) = x := by cases x <;> rfl
@[simp] theorem sig2_to_of {A : Type u} {P Q : A → Prop} (x : {x : A // P x ∧ Q x}) : sig2To (sig2Of x) = x := by cases x <;> rfl
def sig2Iso (A : Type u) (P Q : A → Prop) : Iso (Rocq.Corelib.Init.Specif.sig2 A P Q) {x : A // P x ∧ Q x} := ⟨sig2To, sig2Of, sig2_of_to, sig2_to_of⟩

def sigmaTo {A : Type u} {P : A → Type v} : Rocq.Corelib.Init.Specif.sigT A P → Sigma P :=
  Rocq.Corelib.Init.Specif.sigT.rec (fun x y => ⟨x,y⟩)
def sigmaOf {A : Type u} {P : A → Type v} (x : Sigma P) : Rocq.Corelib.Init.Specif.sigT A P := .existT A P x.1 x.2
@[simp] theorem sigma_of_to {A : Type u} {P : A → Type v} (x : Rocq.Corelib.Init.Specif.sigT A P) : sigmaOf (sigmaTo x) = x := by cases x <;> rfl
@[simp] theorem sigma_to_of {A : Type u} {P : A → Type v} (x : Sigma P) : sigmaTo (sigmaOf x) = x := by cases x <;> rfl
def sigmaIso (A : Type u) (P : A → Type v) : Iso (Rocq.Corelib.Init.Specif.sigT A P) (Sigma P) := ⟨sigmaTo, sigmaOf, sigma_of_to, sigma_to_of⟩

def sigma2To {A : Type u} {P : A → Type v} {Q : A → Type w} : Rocq.Corelib.Init.Specif.sigT2 A P Q → Sigma (fun x => P x × Q x) :=
  Rocq.Corelib.Init.Specif.sigT2.rec (fun x p q => ⟨x,p,q⟩)
def sigma2Of {A : Type u} {P : A → Type v} {Q : A → Type w} (x : Sigma (fun x => P x × Q x)) : Rocq.Corelib.Init.Specif.sigT2 A P Q :=
  .existT2 A P Q x.1 x.2.1 x.2.2
@[simp] theorem sigma2_of_to {A : Type u} {P : A → Type v} {Q : A → Type w} (x : Rocq.Corelib.Init.Specif.sigT2 A P Q) : sigma2Of (sigma2To x) = x := by cases x <;> rfl
@[simp] theorem sigma2_to_of {A : Type u} {P : A → Type v} {Q : A → Type w} (x : Sigma (fun x => P x × Q x)) : sigma2To (sigma2Of x) = x := by cases x with | mk x pq => cases pq; rfl
def sigma2Iso (A : Type u) (P : A → Type v) (Q : A → Type w) : Iso (Rocq.Corelib.Init.Specif.sigT2 A P Q) (Sigma (fun x => P x × Q x)) := ⟨sigma2To, sigma2Of, sigma2_of_to, sigma2_to_of⟩

def sumboolTo {P Q : Prop} : Rocq.Corelib.Init.Specif.sumbool P Q → PSum P Q :=
  Rocq.Corelib.Init.Specif.sumbool.rec PSum.inl PSum.inr
def sumboolOf {P Q : Prop} : PSum P Q → Rocq.Corelib.Init.Specif.sumbool P Q
  | .inl p => .left P Q p
  | .inr q => .right P Q q
@[simp] theorem sumbool_of_to {P Q : Prop} (x : Rocq.Corelib.Init.Specif.sumbool P Q) : sumboolOf (sumboolTo x) = x := by cases x <;> rfl
@[simp] theorem sumbool_to_of {P Q : Prop} (x : PSum P Q) : sumboolTo (sumboolOf x) = x := by cases x <;> rfl
def sumboolIso (P Q : Prop) : Iso (Rocq.Corelib.Init.Specif.sumbool P Q) (PSum P Q) := ⟨sumboolTo, sumboolOf, sumbool_of_to, sumbool_to_of⟩
def decidableTo {P : Prop} : Rocq.Corelib.Init.Specif.sumbool P (¬ P) → Decidable P :=
  Rocq.Corelib.Init.Specif.sumbool.rec Decidable.isTrue Decidable.isFalse
def decidableOf {P : Prop} : Decidable P → Rocq.Corelib.Init.Specif.sumbool P (¬ P)
  | .isTrue h => .left P (¬P) h
  | .isFalse h => .right P (¬P) h
def decidableIso (P : Prop) : Iso (Rocq.Corelib.Init.Specif.sumbool P (¬ P)) (Decidable P) where
  to := decidableTo
  of := decidableOf
  of_to x := by cases x <;> rfl
  to_of x := by cases x <;> rfl

def sumorTo {A : Type u} {P : Prop} : Rocq.Corelib.Init.Specif.sumor A P → PSum A P :=
  Rocq.Corelib.Init.Specif.sumor.rec PSum.inl PSum.inr
def sumorOf {A : Type u} {P : Prop} : PSum A P → Rocq.Corelib.Init.Specif.sumor A P
  | .inl a => .inleft A P a
  | .inr p => .inright A P p
def sumorIso (A : Type u) (P : Prop) : Iso (Rocq.Corelib.Init.Specif.sumor A P) (PSum A P) where
  to := sumorTo
  of := sumorOf
  of_to x := by cases x <;> rfl
  to_of x := by cases x <;> rfl

@[simp] theorem proj1_sig_agrees {A : Type u} {P : A → Prop} (x : Rocq.Corelib.Init.Specif.sig A P) :
  Rocq.Corelib.Init.Specif.proj1_sig A P x = (sigTo x).val := by cases x <;> rfl
@[simp] theorem projT1_agrees {A : Type u} {P : A → Type v} (x : Rocq.Corelib.Init.Specif.sigT A P) :
  Rocq.Corelib.Init.Specif.projT1 A P x = (sigmaTo x).1 := by cases x <;> rfl
theorem projT2_agrees {A : Type u} {P : A → Type v} (x : Rocq.Corelib.Init.Specif.sigT A P) :
  HEq (Rocq.Corelib.Init.Specif.projT2 A P x) (sigmaTo x).2 := by cases x <;> rfl

abbrev RPositive := Rocq.Corelib.Numbers.BinNums.positive
abbrev RNatBinary := Rocq.Corelib.Numbers.BinNums.N
abbrev RIntBinary := Rocq.Corelib.Numbers.BinNums.Z
def positiveTo : RPositive → Nat :=
  Rocq.Corelib.Numbers.BinNums.positive.rec (fun _ n => 2*n+1) (fun _ n => 2*n) 1
@[simp] theorem positiveTo_xI (p : RPositive) : positiveTo (.xI p) = 2*positiveTo p+1 := rfl
@[simp] theorem positiveTo_xO (p : RPositive) : positiveTo (.xO p) = 2*positiveTo p := rfl
@[simp] theorem positiveTo_xH : positiveTo .xH = 1 := rfl
theorem positiveTo_pos (p : RPositive) : 0 < positiveTo p := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec with
  | xI p ih => rw [positiveTo_xI]; omega
  | xO p ih => rw [positiveTo_xO]; omega
  | xH => exact Nat.zero_lt_one
def positiveOf (n : Nat) : RPositive :=
  if n < 2 then .xH
  else if n % 2 = 0 then .xO (positiveOf (n/2))
  else .xI (positiveOf (n/2))
termination_by n
decreasing_by all_goals omega
theorem positive_to_of (n : Nat) (hn : 0 < n) : positiveTo (positiveOf n) = n := by
  induction n using Nat.strongRecOn with
  | ind n ih =>
    rw [positiveOf]
    split
    · rw [positiveTo_xH]; omega
    · rename_i h
      have hdiv : 0 < n/2 := by omega
      have hlt : n/2 < n := by omega
      split
      · rw [positiveTo_xO, ih (n/2) hlt hdiv]; omega
      · rw [positiveTo_xI, ih (n/2) hlt hdiv]; omega
theorem positiveTo_injective (p q : RPositive) (h : positiveTo p = positiveTo q) : p = q := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec generalizing q with
  | xI p ih =>
    cases q with
    | xI q =>
      rw [positiveTo_xI, positiveTo_xI] at h
      exact congrArg Rocq.Corelib.Numbers.BinNums.positive.xI (ih q (by omega))
    | xO q => rw [positiveTo_xI, positiveTo_xO] at h; omega
    | xH => rw [positiveTo_xI, positiveTo_xH] at h; have := positiveTo_pos p; omega
  | xO p ih =>
    cases q with
    | xI q => rw [positiveTo_xO, positiveTo_xI] at h; omega
    | xO q =>
      rw [positiveTo_xO, positiveTo_xO] at h
      exact congrArg Rocq.Corelib.Numbers.BinNums.positive.xO (ih q (by omega))
    | xH => rw [positiveTo_xO, positiveTo_xH] at h; omega
  | xH =>
    cases q with
    | xI q => rw [positiveTo_xH, positiveTo_xI] at h; have := positiveTo_pos q; omega
    | xO q => rw [positiveTo_xH, positiveTo_xO] at h; omega
    | xH => rfl
@[simp] theorem positive_of_to (p : RPositive) : positiveOf (positiveTo p) = p :=
  positiveTo_injective _ _ (positive_to_of _ (positiveTo_pos p))
def positiveIso : Iso RPositive {n : Nat // 0 < n} where
  to p := ⟨positiveTo p, positiveTo_pos p⟩
  of n := positiveOf n.val
  of_to := positive_of_to
  to_of n := Subtype.ext (positive_to_of n.val n.property)

def binaryNatTo : RNatBinary → Nat :=
  Rocq.Corelib.Numbers.BinNums.N.rec 0 positiveTo
def binaryNatOf (n : Nat) : RNatBinary :=
  if n = 0 then .N0 else .Npos (positiveOf n)
@[simp] theorem binaryNat_to_of (n : Nat) : binaryNatTo (binaryNatOf n) = n := by
  unfold binaryNatOf; split
  · rename_i h; subst n; rfl
  · rename_i h; exact positive_to_of n (by omega)
@[simp] theorem binaryNat_of_to (n : RNatBinary) : binaryNatOf (binaryNatTo n) = n := by
  cases n with
  | N0 => rfl
  | Npos p =>
    change (if positiveTo p = 0 then _ else _) = _
    rw [if_neg (by have := positiveTo_pos p; omega)]
    exact congrArg Rocq.Corelib.Numbers.BinNums.N.Npos (positive_of_to p)
def binaryNatIso : Iso RNatBinary Nat := ⟨binaryNatTo, binaryNatOf, binaryNat_of_to, binaryNat_to_of⟩

def binaryIntTo : RIntBinary → Int :=
  Rocq.Corelib.Numbers.BinNums.Z.rec 0 (fun p => Int.ofNat (positiveTo p)) (fun p => -Int.ofNat (positiveTo p))
def binaryIntOf : Int → RIntBinary
  | .ofNat 0 => .Z0
  | .ofNat (n+1) => .Zpos (positiveOf (n+1))
  | .negSucc n => .Zneg (positiveOf (n+1))
@[simp] theorem binaryInt_to_of (n : Int) : binaryIntTo (binaryIntOf n) = n := by
  cases n with
  | ofNat n =>
    cases n with
    | zero => rfl
    | succ n =>
      change Int.ofNat (positiveTo (positiveOf (n+1))) = Int.ofNat (n+1)
      rw [positive_to_of _ (by omega)]
  | negSucc n =>
    change -Int.ofNat (positiveTo (positiveOf (n+1))) = Int.negSucc n
    rw [positive_to_of _ (by omega)]; rfl
@[simp] theorem binaryInt_of_to (n : RIntBinary) : binaryIntOf (binaryIntTo n) = n := by
  cases n with
  | Z0 => rfl
  | Zpos p =>
    change binaryIntOf (Int.ofNat (positiveTo p)) = _
    have hp := positiveTo_pos p
    generalize he : positiveTo p = k at *
    cases k with
    | zero => omega
    | succ k =>
      change Rocq.Corelib.Numbers.BinNums.Z.Zpos (positiveOf (k+1)) = _
      rw [← he, positive_of_to]
  | Zneg p =>
    change binaryIntOf (-Int.ofNat (positiveTo p)) = _
    have hp := positiveTo_pos p
    generalize he : positiveTo p = k at *
    cases k with
    | zero => omega
    | succ k =>
      change Rocq.Corelib.Numbers.BinNums.Z.Zneg (positiveOf (k+1)) = _
      rw [← he, positive_of_to]
def binaryIntIso : Iso RIntBinary Int := ⟨binaryIntTo, binaryIntOf, binaryInt_of_to, binaryInt_to_of⟩

@[simp] theorem positive_succ_agrees (p : RPositive) : positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.succ p) = positiveTo p + 1 := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec with
  | xI p ih =>
    change 2 * positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.succ p) = 2*positiveTo p+1+1
    rw [ih]; omega
  | xO p ih => rfl
  | xH => rfl
@[simp] theorem pos_add_xI_xI (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add (.xI p) (.xI q) = .xO (Rocq.Corelib.BinNums.PosDef.Pos.add_carry p q) := rfl
@[simp] theorem pos_add_xI_xO (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add (.xI p) (.xO q) = .xI (Rocq.Corelib.BinNums.PosDef.Pos.add p q) := rfl
@[simp] theorem pos_add_xI_xH (p : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add (.xI p) .xH = .xO (Rocq.Corelib.BinNums.PosDef.Pos.succ p) := rfl
@[simp] theorem pos_add_xO_xI (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add (.xO p) (.xI q) = .xI (Rocq.Corelib.BinNums.PosDef.Pos.add p q) := rfl
@[simp] theorem pos_add_xO_xO (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add (.xO p) (.xO q) = .xO (Rocq.Corelib.BinNums.PosDef.Pos.add p q) := rfl
@[simp] theorem pos_add_xO_xH (p : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add (.xO p) .xH = .xI p := rfl
@[simp] theorem pos_add_xH_xI (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add .xH (.xI q) = .xO (Rocq.Corelib.BinNums.PosDef.Pos.succ q) := rfl
@[simp] theorem pos_add_xH_xO (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add .xH (.xO q) = .xI q := rfl
@[simp] theorem pos_add_xH_xH : Rocq.Corelib.BinNums.PosDef.Pos.add .xH .xH = .xO .xH := rfl
@[simp] theorem pos_add_carry_xI_xI (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add_carry (.xI p) (.xI q) = .xI (Rocq.Corelib.BinNums.PosDef.Pos.add_carry p q) := rfl
@[simp] theorem pos_add_carry_xI_xO (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add_carry (.xI p) (.xO q) = .xO (Rocq.Corelib.BinNums.PosDef.Pos.add_carry p q) := rfl
@[simp] theorem pos_add_carry_xI_xH (p : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add_carry (.xI p) .xH = .xI (Rocq.Corelib.BinNums.PosDef.Pos.succ p) := rfl
@[simp] theorem pos_add_carry_xO_xI (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add_carry (.xO p) (.xI q) = .xO (Rocq.Corelib.BinNums.PosDef.Pos.add_carry p q) := rfl
@[simp] theorem pos_add_carry_xO_xO (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add_carry (.xO p) (.xO q) = .xI (Rocq.Corelib.BinNums.PosDef.Pos.add p q) := rfl
@[simp] theorem pos_add_carry_xO_xH (p : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add_carry (.xO p) .xH = .xO (Rocq.Corelib.BinNums.PosDef.Pos.succ p) := rfl
@[simp] theorem pos_add_carry_xH_xI (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add_carry .xH (.xI q) = .xI (Rocq.Corelib.BinNums.PosDef.Pos.succ q) := rfl
@[simp] theorem pos_add_carry_xH_xO (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.add_carry .xH (.xO q) = .xO (Rocq.Corelib.BinNums.PosDef.Pos.succ q) := rfl
@[simp] theorem pos_add_carry_xH_xH : Rocq.Corelib.BinNums.PosDef.Pos.add_carry .xH .xH = .xI .xH := rfl

theorem positive_add_pair (p q : RPositive) :
  positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.add p q) = positiveTo p + positiveTo q ∧
  positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.add_carry p q) = positiveTo p + positiveTo q + 1 := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec generalizing q with
  | xI p ih =>
    cases q with
    | xI q => have h := ih q; simp only [pos_add_xI_xI, pos_add_carry_xI_xI, positiveTo_xO, positiveTo_xI, h.1, h.2]; constructor <;> first | omega | trivial
    | xO q => have h := ih q; simp only [pos_add_xI_xO, pos_add_carry_xI_xO, positiveTo_xO, positiveTo_xI, h.1, h.2]; constructor <;> first | omega | trivial
    | xH => simp only [pos_add_xI_xH, pos_add_carry_xI_xH, positiveTo_xO, positiveTo_xI, positiveTo_xH, positive_succ_agrees]; constructor <;> first | omega | trivial
  | xO p ih =>
    cases q with
    | xI q => have h := ih q; simp only [pos_add_xO_xI, pos_add_carry_xO_xI, positiveTo_xO, positiveTo_xI, h.1, h.2]; constructor <;> first | omega | trivial
    | xO q => have h := ih q; simp only [pos_add_xO_xO, pos_add_carry_xO_xO, positiveTo_xO, positiveTo_xI, h.1, h.2]; constructor <;> first | omega | trivial
    | xH => simp only [pos_add_xO_xH, pos_add_carry_xO_xH, positiveTo_xO, positiveTo_xI, positiveTo_xH, positive_succ_agrees]; constructor <;> first | omega | trivial
  | xH =>
    cases q <;> simp only [pos_add_xH_xI, pos_add_carry_xH_xI, pos_add_xH_xO, pos_add_carry_xH_xO, pos_add_xH_xH, pos_add_carry_xH_xH, positiveTo_xO, positiveTo_xI, positiveTo_xH, positive_succ_agrees] <;> constructor <;> first | omega | trivial
@[simp] theorem positive_add_agrees (p q : RPositive) :
  positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.add p q) = positiveTo p + positiveTo q := (positive_add_pair p q).1
@[simp] theorem positive_add_carry_agrees (p q : RPositive) :
  positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.add_carry p q) = positiveTo p + positiveTo q + 1 := (positive_add_pair p q).2
@[simp] theorem positive_mul_agrees (p q : RPositive) :
  positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.mul p q) = positiveTo p * positiveTo q := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec with
  | xI p ih =>
    change positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.add q (.xO (Rocq.Corelib.BinNums.PosDef.Pos.mul p q))) = _
    rw [positive_add_agrees, positiveTo_xO, ih, positiveTo_xI, Nat.add_mul, Nat.one_mul, Nat.mul_assoc]
    omega
  | xO p ih =>
    change 2 * positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.mul p q) = _
    rw [ih, positiveTo_xO, Nat.mul_assoc]
  | xH => change positiveTo q = 1 * positiveTo q; exact (Nat.one_mul _).symm
@[simp] theorem positive_pred_double_agrees (p : RPositive) :
  positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p) = 2*positiveTo p-1 := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec with
  | xI p ih => change 2*(2*positiveTo p)+1 = 2*(2*positiveTo p+1)-1; omega
  | xO p ih =>
    change 2*positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p)+1 = 2*(2*positiveTo p)-1
    rw [ih]; have := positiveTo_pos p; omega
  | xH => rfl

theorem positive_iter_add (p : RPositive) (n : Nat) :
  Rocq.Corelib.BinNums.PosDef.Pos.iter_op Nat Rocq.Corelib.Init.Nat.add p n = positiveTo p * n := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec generalizing n with
  | xI p ih =>
    change Rocq.Corelib.Init.Nat.add n (Rocq.Corelib.BinNums.PosDef.Pos.iter_op Nat Rocq.Corelib.Init.Nat.add p (Rocq.Corelib.Init.Nat.add n n)) = _
    rw [nat_add_agrees, ih, nat_add_agrees, positiveTo_xI, Nat.add_mul, Nat.one_mul, Nat.mul_add]
    try simp only [Nat.mul_assoc]
    omega
  | xO p ih =>
    change Rocq.Corelib.BinNums.PosDef.Pos.iter_op Nat Rocq.Corelib.Init.Nat.add p (Rocq.Corelib.Init.Nat.add n n) = _
    rw [ih, nat_add_agrees, positiveTo_xO, Nat.mul_add, Nat.mul_assoc]
    try simp only [Nat.mul_assoc]
    omega
  | xH => exact (Nat.one_mul n).symm
@[simp] theorem positive_to_nat_agrees (p : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.to_nat p = positiveTo p := by
  change Rocq.Corelib.BinNums.PosDef.Pos.iter_op Nat Rocq.Corelib.Init.Nat.add p 1 = _
  rw [positive_iter_add, Nat.mul_one]
@[simp] theorem positive_of_succ_nat_agrees (n : Nat) :
  positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.of_succ_nat n) = n+1 := by
  induction n with
  | zero => rfl
  | succ n ih =>
    change positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.succ (Rocq.Corelib.BinNums.PosDef.Pos.of_succ_nat n)) = n+1+1
    rw [positive_succ_agrees, ih]

@[simp] theorem binaryIntTo_pos (p : RPositive) : binaryIntTo (.Zpos p) = (positiveTo p : Int) := rfl
@[simp] theorem binaryIntTo_neg (p : RPositive) : binaryIntTo (.Zneg p) = -(positiveTo p : Int) := rfl
@[simp] theorem binaryIntTo_zero : binaryIntTo .Z0 = 0 := rfl
@[simp] theorem int_opp_agrees (x : RIntBinary) : binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.opp x) = -binaryIntTo x := by
  cases x <;> simp [Rocq.Corelib.BinNums.IntDef.Z.opp, binaryIntTo]
@[simp] theorem int_mul_agrees (x y : RIntBinary) :
  binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.mul x y) = binaryIntTo x * binaryIntTo y := by
  cases x <;> cases y <;>
    simp only [Rocq.Corelib.BinNums.IntDef.Z.mul, Rocq.Corelib.Numbers.BinNums.Z.rec, binaryIntTo_pos, binaryIntTo_neg, binaryIntTo_zero, positive_mul_agrees, Int.natCast_mul, Int.zero_mul, Int.mul_zero, Int.neg_mul, Int.mul_neg, Int.neg_neg, Int.neg_zero]
@[simp] theorem int_of_nat_agrees (n : Nat) :
  binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.of_nat n) = (n : Int) := by
  cases n with
  | zero => rfl
  | succ n =>
    change (positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.of_succ_nat n) : Int) = (n+1 : Nat)
    rw [positive_of_succ_nat_agrees]
@[simp] theorem int_of_binary_nat_agrees (n : RNatBinary) :
  binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.of_N n) = (binaryNatTo n : Int) := by cases n <;> rfl
@[simp] theorem int_to_nat_agrees (z : RIntBinary) :
  Rocq.Corelib.BinNums.IntDef.Z.to_nat z = (binaryIntTo z).toNat := by
  cases z with
  | Z0 => rfl
  | Zpos p => exact positive_to_nat_agrees p
  | Zneg p =>
    change 0 = (-(positiveTo p : Int)).toNat
    omega

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

abbrev NativeArray (A : Type u) := Σ n : Fin (4194304), Vector A n.val × A
def arrayTo {A : Type u} (a : Rocq.Corelib.Array.PrimArray.array A) : NativeArray A :=
  ⟨a.size, Vector.ofFn a.value, a.fallback⟩
def arrayOf {A : Type u} (a : NativeArray A) : Rocq.Corelib.Array.PrimArray.array A :=
  ⟨a.1, fun i => a.2.1[i.val], a.2.2⟩
@[simp] theorem array_of_to {A : Type u} (a : Rocq.Corelib.Array.PrimArray.array A) : arrayOf (arrayTo a) = a := by
  cases a with
  | mk n f d =>
    change Rocq2Lean.PrimArray.Rep.mk n (fun i => (Vector.ofFn f)[i.val]) d = _
    have h : (fun i => (Vector.ofFn f)[i.val]) = f := by funext i; simp [Vector.get]
    rw [h]
@[simp] theorem array_to_of {A : Type u} (a : NativeArray A) : arrayTo (arrayOf a) = a := by
  rcases a with ⟨n,xs,d⟩
  change (⟨n,(Vector.ofFn (fun i => xs[i.val]),d)⟩ : NativeArray A) = ⟨n,(xs,d)⟩
  have h : Vector.ofFn (fun i => xs[i.val]) = xs := by apply Vector.ext; intros i hi; simp [Vector.get]
  rw [h]
def arrayIso (A : Type u) : Iso (Rocq.Corelib.Array.PrimArray.array A) (NativeArray A) := ⟨arrayTo, arrayOf, array_of_to, array_to_of⟩
@[simp] theorem array_default_agrees {A : Type u} (a : Rocq.Corelib.Array.PrimArray.array A) :
  Rocq.Corelib.Array.PrimArray.default A a = (arrayTo a).2.2 := rfl
@[simp] theorem array_length_agrees {A : Type u} (a : Rocq.Corelib.Array.PrimArray.array A) :
  Rocq.Corelib.Array.PrimArray.length A a = BitVec.ofNat 63 (arrayTo a).1.val := rfl
@[simp] theorem array_copy_agrees {A : Type u} (a : Rocq.Corelib.Array.PrimArray.array A) :
  arrayTo (Rocq.Corelib.Array.PrimArray.copy A a) = arrayTo a := rfl
theorem array_get_agrees {A : Type u} (a : Rocq.Corelib.Array.PrimArray.array A) (i : BitVec 63) :
  Rocq.Corelib.Array.PrimArray.get A a i =
    if h : i.toNat < (arrayTo a).1.val then (arrayTo a).2.1[i.toNat] else (arrayTo a).2.2 := by
  simp [Rocq.Corelib.Array.PrimArray.get, Rocq2Lean.PrimArray.get, arrayTo]

theorem array_make_length_agrees {A : Type u} (n : BitVec 63) (x : A) :
 (arrayTo (Rocq.Corelib.Array.PrimArray.make A n x)).1.val = min n.toNat 4194303 := by
 simp only [arrayTo, Rocq.Corelib.Array.PrimArray.make, Rocq2Lean.PrimArray.make,
   Rocq2Lean.PrimArray.boundedSize, Rocq2Lean.PrimArray.maxLength]
 by_cases h : n.toNat < 4194303 + 1
 · simp [h]; omega
 · simp [h]; omega
theorem array_make_values_agrees {A : Type u} (n : BitVec 63) (x : A) :
 (arrayTo (Rocq.Corelib.Array.PrimArray.make A n x)).2.1 =
 Vector.replicate _ x := by
 apply Vector.ext
 intro i hi
 simp [arrayTo, Rocq.Corelib.Array.PrimArray.make, Rocq2Lean.PrimArray.make, Vector.get]
theorem array_set_agrees {A : Type u} (a : Rocq.Corelib.Array.PrimArray.array A)
 (i : BitVec 63) (x : A) :
 arrayTo (Rocq.Corelib.Array.PrimArray.set A a i x) =
 ⟨(arrayTo a).1, (arrayTo a).2.1.setIfInBounds i.toNat x, (arrayTo a).2.2⟩ := by
 change (⟨a.size,Vector.ofFn (fun j => if j.val == i.toNat then x else a.value j), a.fallback⟩ : NativeArray A) = _
 congr 2
 apply Vector.ext
 intro j hj
 simp only [arrayTo, Vector.getElem_setIfInBounds, Vector.getElem_ofFn, beq_iff_eq]
 by_cases h : j = i.toNat
 · simp [h]
 · have hi : i.toNat ≠ j := Ne.symm h
   simp [h, hi]

abbrev NativeByteString := Σ n : Fin (16777212), Vector (BitVec 8) n.val
def byteStringTo (s : Rocq.Corelib.Strings.PrimString.string) : NativeByteString :=
  ⟨s.size, Vector.ofFn s.value⟩
def byteStringOf (s : NativeByteString) : Rocq.Corelib.Strings.PrimString.string :=
  ⟨s.1, fun i => s.2[i.val]⟩
@[simp] theorem byteString_of_to (s : Rocq.Corelib.Strings.PrimString.string) : byteStringOf (byteStringTo s) = s := by
  cases s with
  | mk n f =>
    change Rocq2Lean.PrimString.Rep.mk n (fun i => (Vector.ofFn f)[i.val]) = _
    have h : (fun i => (Vector.ofFn f)[i.val]) = f := by funext i; simp [Vector.get]
    rw [h]
@[simp] theorem byteString_to_of (s : NativeByteString) : byteStringTo (byteStringOf s) = s := by
  rcases s with ⟨n,xs⟩
  change (⟨n,Vector.ofFn (fun i => xs[i.val])⟩ : NativeByteString) = ⟨n,xs⟩
  have h : Vector.ofFn (fun i => xs[i.val]) = xs := by apply Vector.ext; intros i hi; simp [Vector.get]
  rw [h]
def byteStringIso : Iso Rocq.Corelib.Strings.PrimString.string NativeByteString := ⟨byteStringTo, byteStringOf, byteString_of_to, byteString_to_of⟩
@[simp] theorem byteString_length_agrees (s : Rocq.Corelib.Strings.PrimString.string) :
  Rocq.Corelib.Strings.PrimString.length s = BitVec.ofNat 63 (byteStringTo s).1.val := rfl
theorem byteString_get_agrees (s : Rocq.Corelib.Strings.PrimString.string) (i : BitVec 63) :
  Rocq.Corelib.Strings.PrimString.get s i =
    BitVec.ofNat 63 ((if h : i.toNat < (byteStringTo s).1.val then (byteStringTo s).2[i.toNat] else (0 : BitVec 8)).toNat) := by
  unfold Rocq.Corelib.Strings.PrimString.get Rocq2Lean.PrimString.get Rocq2Lean.PrimString.read byteStringTo
  split <;> simp_all <;> rfl

def byteTo : Rocq.Corelib.Init.Byte.byte → Fin 256 := Rocq.Corelib.Init.Byte.byte.rec (⟨0, by decide⟩) (⟨1, by decide⟩) (⟨2, by decide⟩) (⟨3, by decide⟩) (⟨4, by decide⟩) (⟨5, by decide⟩) (⟨6, by decide⟩) (⟨7, by decide⟩) (⟨8, by decide⟩) (⟨9, by decide⟩) (⟨10, by decide⟩) (⟨11, by decide⟩) (⟨12, by decide⟩) (⟨13, by decide⟩) (⟨14, by decide⟩) (⟨15, by decide⟩) (⟨16, by decide⟩) (⟨17, by decide⟩) (⟨18, by decide⟩) (⟨19, by decide⟩) (⟨20, by decide⟩) (⟨21, by decide⟩) (⟨22, by decide⟩) (⟨23, by decide⟩) (⟨24, by decide⟩) (⟨25, by decide⟩) (⟨26, by decide⟩) (⟨27, by decide⟩) (⟨28, by decide⟩) (⟨29, by decide⟩) (⟨30, by decide⟩) (⟨31, by decide⟩) (⟨32, by decide⟩) (⟨33, by decide⟩) (⟨34, by decide⟩) (⟨35, by decide⟩) (⟨36, by decide⟩) (⟨37, by decide⟩) (⟨38, by decide⟩) (⟨39, by decide⟩) (⟨40, by decide⟩) (⟨41, by decide⟩) (⟨42, by decide⟩) (⟨43, by decide⟩) (⟨44, by decide⟩) (⟨45, by decide⟩) (⟨46, by decide⟩) (⟨47, by decide⟩) (⟨48, by decide⟩) (⟨49, by decide⟩) (⟨50, by decide⟩) (⟨51, by decide⟩) (⟨52, by decide⟩) (⟨53, by decide⟩) (⟨54, by decide⟩) (⟨55, by decide⟩) (⟨56, by decide⟩) (⟨57, by decide⟩) (⟨58, by decide⟩) (⟨59, by decide⟩) (⟨60, by decide⟩) (⟨61, by decide⟩) (⟨62, by decide⟩) (⟨63, by decide⟩) (⟨64, by decide⟩) (⟨65, by decide⟩) (⟨66, by decide⟩) (⟨67, by decide⟩) (⟨68, by decide⟩) (⟨69, by decide⟩) (⟨70, by decide⟩) (⟨71, by decide⟩) (⟨72, by decide⟩) (⟨73, by decide⟩) (⟨74, by decide⟩) (⟨75, by decide⟩) (⟨76, by decide⟩) (⟨77, by decide⟩) (⟨78, by decide⟩) (⟨79, by decide⟩) (⟨80, by decide⟩) (⟨81, by decide⟩) (⟨82, by decide⟩) (⟨83, by decide⟩) (⟨84, by decide⟩) (⟨85, by decide⟩) (⟨86, by decide⟩) (⟨87, by decide⟩) (⟨88, by decide⟩) (⟨89, by decide⟩) (⟨90, by decide⟩) (⟨91, by decide⟩) (⟨92, by decide⟩) (⟨93, by decide⟩) (⟨94, by decide⟩) (⟨95, by decide⟩) (⟨96, by decide⟩) (⟨97, by decide⟩) (⟨98, by decide⟩) (⟨99, by decide⟩) (⟨100, by decide⟩) (⟨101, by decide⟩) (⟨102, by decide⟩) (⟨103, by decide⟩) (⟨104, by decide⟩) (⟨105, by decide⟩) (⟨106, by decide⟩) (⟨107, by decide⟩) (⟨108, by decide⟩) (⟨109, by decide⟩) (⟨110, by decide⟩) (⟨111, by decide⟩) (⟨112, by decide⟩) (⟨113, by decide⟩) (⟨114, by decide⟩) (⟨115, by decide⟩) (⟨116, by decide⟩) (⟨117, by decide⟩) (⟨118, by decide⟩) (⟨119, by decide⟩) (⟨120, by decide⟩) (⟨121, by decide⟩) (⟨122, by decide⟩) (⟨123, by decide⟩) (⟨124, by decide⟩) (⟨125, by decide⟩) (⟨126, by decide⟩) (⟨127, by decide⟩) (⟨128, by decide⟩) (⟨129, by decide⟩) (⟨130, by decide⟩) (⟨131, by decide⟩) (⟨132, by decide⟩) (⟨133, by decide⟩) (⟨134, by decide⟩) (⟨135, by decide⟩) (⟨136, by decide⟩) (⟨137, by decide⟩) (⟨138, by decide⟩) (⟨139, by decide⟩) (⟨140, by decide⟩) (⟨141, by decide⟩) (⟨142, by decide⟩) (⟨143, by decide⟩) (⟨144, by decide⟩) (⟨145, by decide⟩) (⟨146, by decide⟩) (⟨147, by decide⟩) (⟨148, by decide⟩) (⟨149, by decide⟩) (⟨150, by decide⟩) (⟨151, by decide⟩) (⟨152, by decide⟩) (⟨153, by decide⟩) (⟨154, by decide⟩) (⟨155, by decide⟩) (⟨156, by decide⟩) (⟨157, by decide⟩) (⟨158, by decide⟩) (⟨159, by decide⟩) (⟨160, by decide⟩) (⟨161, by decide⟩) (⟨162, by decide⟩) (⟨163, by decide⟩) (⟨164, by decide⟩) (⟨165, by decide⟩) (⟨166, by decide⟩) (⟨167, by decide⟩) (⟨168, by decide⟩) (⟨169, by decide⟩) (⟨170, by decide⟩) (⟨171, by decide⟩) (⟨172, by decide⟩) (⟨173, by decide⟩) (⟨174, by decide⟩) (⟨175, by decide⟩) (⟨176, by decide⟩) (⟨177, by decide⟩) (⟨178, by decide⟩) (⟨179, by decide⟩) (⟨180, by decide⟩) (⟨181, by decide⟩) (⟨182, by decide⟩) (⟨183, by decide⟩) (⟨184, by decide⟩) (⟨185, by decide⟩) (⟨186, by decide⟩) (⟨187, by decide⟩) (⟨188, by decide⟩) (⟨189, by decide⟩) (⟨190, by decide⟩) (⟨191, by decide⟩) (⟨192, by decide⟩) (⟨193, by decide⟩) (⟨194, by decide⟩) (⟨195, by decide⟩) (⟨196, by decide⟩) (⟨197, by decide⟩) (⟨198, by decide⟩) (⟨199, by decide⟩) (⟨200, by decide⟩) (⟨201, by decide⟩) (⟨202, by decide⟩) (⟨203, by decide⟩) (⟨204, by decide⟩) (⟨205, by decide⟩) (⟨206, by decide⟩) (⟨207, by decide⟩) (⟨208, by decide⟩) (⟨209, by decide⟩) (⟨210, by decide⟩) (⟨211, by decide⟩) (⟨212, by decide⟩) (⟨213, by decide⟩) (⟨214, by decide⟩) (⟨215, by decide⟩) (⟨216, by decide⟩) (⟨217, by decide⟩) (⟨218, by decide⟩) (⟨219, by decide⟩) (⟨220, by decide⟩) (⟨221, by decide⟩) (⟨222, by decide⟩) (⟨223, by decide⟩) (⟨224, by decide⟩) (⟨225, by decide⟩) (⟨226, by decide⟩) (⟨227, by decide⟩) (⟨228, by decide⟩) (⟨229, by decide⟩) (⟨230, by decide⟩) (⟨231, by decide⟩) (⟨232, by decide⟩) (⟨233, by decide⟩) (⟨234, by decide⟩) (⟨235, by decide⟩) (⟨236, by decide⟩) (⟨237, by decide⟩) (⟨238, by decide⟩) (⟨239, by decide⟩) (⟨240, by decide⟩) (⟨241, by decide⟩) (⟨242, by decide⟩) (⟨243, by decide⟩) (⟨244, by decide⟩) (⟨245, by decide⟩) (⟨246, by decide⟩) (⟨247, by decide⟩) (⟨248, by decide⟩) (⟨249, by decide⟩) (⟨250, by decide⟩) (⟨251, by decide⟩) (⟨252, by decide⟩) (⟨253, by decide⟩) (⟨254, by decide⟩) (⟨255, by decide⟩)
def byteOf : Fin 256 → Rocq.Corelib.Init.Byte.byte := (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x00) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x01) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x02) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x03) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x04) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x05) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x06) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x07) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x08) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x09) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x0a) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x0b) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x0c) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x0d) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x0e) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x0f) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x10) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x11) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x12) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x13) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x14) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x15) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x16) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x17) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x18) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x19) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x1a) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x1b) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x1c) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x1d) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x1e) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x1f) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x20) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x21) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x22) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x23) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x24) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x25) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x26) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x27) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x28) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x29) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x2a) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x2b) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x2c) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x2d) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x2e) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x2f) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x30) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x31) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x32) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x33) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x34) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x35) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x36) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x37) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x38) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x39) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x3a) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x3b) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x3c) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x3d) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x3e) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x3f) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x40) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x41) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x42) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x43) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x44) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x45) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x46) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x47) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x48) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x49) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x4a) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x4b) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x4c) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x4d) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x4e) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x4f) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x50) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x51) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x52) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x53) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x54) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x55) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x56) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x57) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x58) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x59) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x5a) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x5b) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x5c) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x5d) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x5e) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x5f) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x60) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x61) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x62) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x63) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x64) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x65) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x66) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x67) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x68) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x69) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x6a) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x6b) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x6c) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x6d) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x6e) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x6f) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x70) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x71) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x72) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x73) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x74) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x75) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x76) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x77) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x78) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x79) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x7a) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x7b) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x7c) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x7d) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x7e) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x7f) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x80) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x81) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x82) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x83) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x84) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x85) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x86) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x87) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x88) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x89) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x8a) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x8b) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x8c) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x8d) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x8e) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x8f) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x90) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x91) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x92) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x93) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x94) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x95) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x96) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x97) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x98) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x99) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x9a) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x9b) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x9c) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x9d) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x9e) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x9f) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xa0) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xa1) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xa2) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xa3) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xa4) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xa5) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xa6) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xa7) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xa8) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xa9) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xaa) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xab) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xac) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xad) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xae) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xaf) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xb0) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xb1) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xb2) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xb3) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xb4) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xb5) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xb6) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xb7) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xb8) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xb9) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xba) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xbb) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xbc) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xbd) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xbe) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xbf) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xc0) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xc1) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xc2) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xc3) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xc4) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xc5) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xc6) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xc7) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xc8) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xc9) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xca) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xcb) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xcc) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xcd) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xce) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xcf) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xd0) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xd1) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xd2) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xd3) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xd4) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xd5) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xd6) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xd7) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xd8) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xd9) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xda) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xdb) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xdc) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xdd) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xde) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xdf) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xe0) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xe1) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xe2) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xe3) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xe4) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xe5) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xe6) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xe7) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xe8) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xe9) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xea) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xeb) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xec) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xed) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xee) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xef) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xf0) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xf1) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xf2) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xf3) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xf4) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xf5) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xf6) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xf7) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xf8) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xf9) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xfa) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xfb) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xfc) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xfd) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xfe) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xff) (fun i => Fin.elim0 i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i)
@[simp] theorem byte_of_to (x : Rocq.Corelib.Init.Byte.byte) : byteOf (byteTo x) = x := by cases x <;> rfl
@[simp] theorem byte_to_of : ∀ x : Fin 256, byteTo (byteOf x) = x := (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.elim0 i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i)
def byteIso : Iso Rocq.Corelib.Init.Byte.byte (Fin 256) := ⟨byteTo,byteOf,byte_of_to,byte_to_of⟩

def floatClassTo : Rocq.Corelib.Floats.FloatClass.float_class → Fin 9 := Rocq.Corelib.Floats.FloatClass.float_class.rec (⟨0, by decide⟩) (⟨1, by decide⟩) (⟨2, by decide⟩) (⟨3, by decide⟩) (⟨4, by decide⟩) (⟨5, by decide⟩) (⟨6, by decide⟩) (⟨7, by decide⟩) (⟨8, by decide⟩)
def floatClassOf : Fin 9 → Rocq.Corelib.Floats.FloatClass.float_class := (fun i => Fin.cases (Rocq.Corelib.Floats.FloatClass.float_class.PNormal) (fun i => Fin.cases (Rocq.Corelib.Floats.FloatClass.float_class.NNormal) (fun i => Fin.cases (Rocq.Corelib.Floats.FloatClass.float_class.PSubn) (fun i => Fin.cases (Rocq.Corelib.Floats.FloatClass.float_class.NSubn) (fun i => Fin.cases (Rocq.Corelib.Floats.FloatClass.float_class.PZero) (fun i => Fin.cases (Rocq.Corelib.Floats.FloatClass.float_class.NZero) (fun i => Fin.cases (Rocq.Corelib.Floats.FloatClass.float_class.PInf) (fun i => Fin.cases (Rocq.Corelib.Floats.FloatClass.float_class.NInf) (fun i => Fin.cases (Rocq.Corelib.Floats.FloatClass.float_class.NaN) (fun i => Fin.elim0 i) i) i) i) i) i) i) i) i) i)
@[simp] theorem floatClass_of_to (x : Rocq.Corelib.Floats.FloatClass.float_class) : floatClassOf (floatClassTo x) = x := by cases x <;> rfl
@[simp] theorem floatClass_to_of : ∀ x : Fin 9, floatClassTo (floatClassOf x) = x := (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.elim0 i) i) i) i) i) i) i) i) i) i)
def floatClassIso : Iso Rocq.Corelib.Floats.FloatClass.float_class (Fin 9) := ⟨floatClassTo,floatClassOf,floatClass_of_to,floatClass_to_of⟩

def decimalDigitsTo : Rocq.Corelib.Init.Decimal.uint → List (Fin 10) := Rocq.Corelib.Init.Decimal.uint.rec [] (fun _ xs => (⟨0,by decide⟩ : Fin 10) :: xs) (fun _ xs => (⟨1,by decide⟩ : Fin 10) :: xs) (fun _ xs => (⟨2,by decide⟩ : Fin 10) :: xs) (fun _ xs => (⟨3,by decide⟩ : Fin 10) :: xs) (fun _ xs => (⟨4,by decide⟩ : Fin 10) :: xs) (fun _ xs => (⟨5,by decide⟩ : Fin 10) :: xs) (fun _ xs => (⟨6,by decide⟩ : Fin 10) :: xs) (fun _ xs => (⟨7,by decide⟩ : Fin 10) :: xs) (fun _ xs => (⟨8,by decide⟩ : Fin 10) :: xs) (fun _ xs => (⟨9,by decide⟩ : Fin 10) :: xs)
def decimalDigitsPrepend (d : Fin 10) (xs : Rocq.Corelib.Init.Decimal.uint) : Rocq.Corelib.Init.Decimal.uint := ((fun i => Fin.cases (Rocq.Corelib.Init.Decimal.uint.D0 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Decimal.uint.D1 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Decimal.uint.D2 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Decimal.uint.D3 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Decimal.uint.D4 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Decimal.uint.D5 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Decimal.uint.D6 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Decimal.uint.D7 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Decimal.uint.D8 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Decimal.uint.D9 xs) (fun i => Fin.elim0 i) i) i) i) i) i) i) i) i) i) i)) d
def decimalDigitsOf : List (Fin 10) → Rocq.Corelib.Init.Decimal.uint
  | [] => Rocq.Corelib.Init.Decimal.uint.Nil
  | d :: ds => decimalDigitsPrepend d (decimalDigitsOf ds)
theorem decimalDigits_prepend (xs : Rocq.Corelib.Init.Decimal.uint) : ∀ d : Fin 10, decimalDigitsTo (decimalDigitsPrepend d xs) = d :: decimalDigitsTo xs := (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.elim0 i) i) i) i) i) i) i) i) i) i) i)
@[simp] theorem decimalDigits_of_to (x : Rocq.Corelib.Init.Decimal.uint) : decimalDigitsOf (decimalDigitsTo x) = x :=
  Rocq.Corelib.Init.Decimal.uint.rec rfl (fun x ih => congrArg Rocq.Corelib.Init.Decimal.uint.D0 ih) (fun x ih => congrArg Rocq.Corelib.Init.Decimal.uint.D1 ih) (fun x ih => congrArg Rocq.Corelib.Init.Decimal.uint.D2 ih) (fun x ih => congrArg Rocq.Corelib.Init.Decimal.uint.D3 ih) (fun x ih => congrArg Rocq.Corelib.Init.Decimal.uint.D4 ih) (fun x ih => congrArg Rocq.Corelib.Init.Decimal.uint.D5 ih) (fun x ih => congrArg Rocq.Corelib.Init.Decimal.uint.D6 ih) (fun x ih => congrArg Rocq.Corelib.Init.Decimal.uint.D7 ih) (fun x ih => congrArg Rocq.Corelib.Init.Decimal.uint.D8 ih) (fun x ih => congrArg Rocq.Corelib.Init.Decimal.uint.D9 ih) x
@[simp] theorem decimalDigits_to_of (xs : List (Fin 10)) : decimalDigitsTo (decimalDigitsOf xs) = xs := by
  induction xs with
  | nil => rfl
  | cons d ds ih => change decimalDigitsTo (decimalDigitsPrepend d (decimalDigitsOf ds)) = d :: ds; rw [decimalDigits_prepend, ih]
def decimalDigitsIso : Iso Rocq.Corelib.Init.Decimal.uint (List (Fin 10)) := ⟨decimalDigitsTo,decimalDigitsOf,decimalDigits_of_to,decimalDigits_to_of⟩


/-- Numeric evaluation loses leading-zero information; it is not a bijection. -/
theorem decimal_numeric_decode_not_injective :
 ¬ (∀ x y : Rocq.Corelib.Init.Decimal.uint,
   Rocq.Corelib.Init.Nat.of_uint x = Rocq.Corelib.Init.Nat.of_uint y → x = y) := by
 intro h
 have e := h .Nil (.D0 .Nil) rfl
 have bad := congrArg decimalDigitsTo e
 change ([] : List (Fin 10)) = [⟨0, by decide⟩] at bad
 cases bad

def hexadecimalDigitsTo : Rocq.Corelib.Init.Hexadecimal.uint → List (Fin 16) := Rocq.Corelib.Init.Hexadecimal.uint.rec [] (fun _ xs => (⟨0,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨1,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨2,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨3,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨4,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨5,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨6,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨7,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨8,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨9,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨10,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨11,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨12,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨13,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨14,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨15,by decide⟩ : Fin 16) :: xs)
def hexadecimalDigitsPrepend (d : Fin 16) (xs : Rocq.Corelib.Init.Hexadecimal.uint) : Rocq.Corelib.Init.Hexadecimal.uint := ((fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.D0 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.D1 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.D2 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.D3 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.D4 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.D5 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.D6 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.D7 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.D8 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.D9 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.Da xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.Db xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.Dc xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.Dd xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.De xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.Df xs) (fun i => Fin.elim0 i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i)) d
def hexadecimalDigitsOf : List (Fin 16) → Rocq.Corelib.Init.Hexadecimal.uint
  | [] => Rocq.Corelib.Init.Hexadecimal.uint.Nil
  | d :: ds => hexadecimalDigitsPrepend d (hexadecimalDigitsOf ds)
theorem hexadecimalDigits_prepend (xs : Rocq.Corelib.Init.Hexadecimal.uint) : ∀ d : Fin 16, hexadecimalDigitsTo (hexadecimalDigitsPrepend d xs) = d :: hexadecimalDigitsTo xs := (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.elim0 i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i)
@[simp] theorem hexadecimalDigits_of_to (x : Rocq.Corelib.Init.Hexadecimal.uint) : hexadecimalDigitsOf (hexadecimalDigitsTo x) = x :=
  Rocq.Corelib.Init.Hexadecimal.uint.rec rfl (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.D0 ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.D1 ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.D2 ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.D3 ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.D4 ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.D5 ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.D6 ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.D7 ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.D8 ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.D9 ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.Da ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.Db ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.Dc ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.Dd ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.De ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.Df ih) x
@[simp] theorem hexadecimalDigits_to_of (xs : List (Fin 16)) : hexadecimalDigitsTo (hexadecimalDigitsOf xs) = xs := by
  induction xs with
  | nil => rfl
  | cons d ds ih => change hexadecimalDigitsTo (hexadecimalDigitsPrepend d (hexadecimalDigitsOf ds)) = d :: ds; rw [hexadecimalDigits_prepend, ih]
def hexadecimalDigitsIso : Iso Rocq.Corelib.Init.Hexadecimal.uint (List (Fin 16)) := ⟨hexadecimalDigitsTo,hexadecimalDigitsOf,hexadecimalDigits_of_to,hexadecimalDigits_to_of⟩

@[simp] theorem peano_le_agrees (n m : Nat) : Rocq.Corelib.Init.Peano.le n m ↔ n ≤ m := by
  constructor
  · intro h
    induction h using Rocq.Corelib.Init.Peano.le.rec with
    | le_n => exact Nat.le_refl n
    | le_S m h ih => exact Nat.le_trans ih (Nat.le_succ m)
  · intro h
    induction h with
    | refl => exact .le_n n
    | step h ih => exact .le_S n _ ih
@[simp] theorem peano_lt_agrees (n m : Nat) : Rocq.Corelib.Init.Peano.lt n m ↔ n < m := peano_le_agrees (n+1) m
@[simp] theorem peano_ge_agrees (n m : Nat) : Rocq.Corelib.Init.Peano.ge n m ↔ n ≥ m := peano_le_agrees m n
@[simp] theorem peano_gt_agrees (n m : Nat) : Rocq.Corelib.Init.Peano.gt n m ↔ n > m := peano_lt_agrees m n

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
  IO.FS.writeFile "/home/shunqwang4/research/rocq-core/experiments/native-correspondence-main75-20261018/audits/Unified.json" (Lean.Json.pretty (.arr rows))

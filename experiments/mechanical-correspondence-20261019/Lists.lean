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

@[simp] theorem map_agrees {A : Type u} {B : Type v} (f : A → B) (xs : RList A) :
  listTo (Rocq.Corelib.Lists.ListDef.map A B f xs) = (listTo xs).map f :=
  @Rocq.Corelib.Init.Datatypes.list.rec A (fun xs => listTo (Rocq.Corelib.Lists.ListDef.map A B f xs) = (listTo xs).map f)
    rfl (fun x xs ih => by change f x :: listTo (Rocq.Corelib.Lists.ListDef.map A B f xs) = f x :: (listTo xs).map f; rw [ih]) xs
@[simp] theorem repeat_agrees {A : Type u} (a : A) (n : MN) :
  listTo (Rocq.Corelib.Lists.ListDef.repeat A a n) = List.replicate (natTo n) a := by
  induction n with
  | O => rfl
  | S n ih => change a :: listTo (Rocq.Corelib.Lists.ListDef.repeat A a n) = a :: List.replicate (natTo n) a; rw [ih]
@[simp] theorem firstn_agrees {A : Type u} (n : MN) (xs : RList A) :
  listTo (Rocq.Corelib.Lists.ListDef.firstn A n xs) = (listTo xs).take (natTo n) := by
  induction n generalizing xs with
  | O => rfl
  | S n ih =>
    cases xs with
    | nil => rfl
    | cons x xs => change x :: listTo (Rocq.Corelib.Lists.ListDef.firstn A n xs) = x :: (listTo xs).take (natTo n); rw [ih]
@[simp] theorem skipn_agrees {A : Type u} (n : MN) (xs : RList A) :
  listTo (Rocq.Corelib.Lists.ListDef.skipn A n xs) = (listTo xs).drop (natTo n) := by
  induction n generalizing xs with
  | O => rfl
  | S n ih =>
    cases xs with
    | nil => rfl
    | cons x xs => exact ih xs
@[simp] theorem nth_agrees {A : Type u} (n : MN) (xs : RList A) (d : A) :
  Rocq.Corelib.Lists.ListDef.nth A n xs d = (listTo xs)[natTo n]?.getD d := by
  induction n generalizing xs with
  | O => cases xs <;> rfl
  | S n ih =>
    cases xs with
    | nil => rfl
    | cons x xs => exact ih xs
@[simp] theorem seq_agrees (start len : MN) :
  (listTo (Rocq.Corelib.Lists.ListDef.seq start len)).map natTo = List.range' (natTo start) (natTo len) := by
  induction len generalizing start with
  | O => rfl
  | S len ih =>
    change natTo start :: (listTo (Rocq.Corelib.Lists.ListDef.seq (.S start) len)).map natTo =
      natTo start :: List.range' (natTo start+1) (natTo len)
    rw [ih]; rfl
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
  IO.FS.writeFile "/home/shunqwang4/research/rocq-core/experiments/mechanical-correspondence-20261019/audits/Lists.json" (Lean.Json.pretty (.arr rows))

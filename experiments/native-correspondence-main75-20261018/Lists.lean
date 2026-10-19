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
  IO.FS.writeFile "/home/shunqwang4/research/rocq-core/experiments/native-correspondence-main75-20261018/audits/Lists.json" (Lean.Json.pretty (.arr rows))

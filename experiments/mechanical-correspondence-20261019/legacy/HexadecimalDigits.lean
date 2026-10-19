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
  IO.FS.writeFile "/home/shunqwang4/research/rocq-core/experiments/mechanical-correspondence-20261019/legacy/audits/HexadecimalDigits.json" (Lean.Json.pretty (.arr rows))

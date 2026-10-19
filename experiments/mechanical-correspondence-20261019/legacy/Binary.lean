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
  IO.FS.writeFile "/home/shunqwang4/research/rocq-core/experiments/mechanical-correspondence-20261019/legacy/audits/Binary.json" (Lean.Json.pretty (.arr rows))

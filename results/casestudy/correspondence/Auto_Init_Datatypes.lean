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


abbrev ME := Rocq.Corelib.Init.Logic.eq
def eqTo {A : Sort u} {a b : A} (h : ME A a b) : a = b :=
  Rocq.Corelib.Init.Logic.eq.rec (motive := fun b _ => a = b) rfl h
def eqOf {A : Sort u} {a b : A} (h : a = b) : ME A a b :=
  h ▸ Rocq.Corelib.Init.Logic.eq.eq_refl A a
theorem eq_correspondence {A : Sort u} (a b : A) : ME A a b ↔ a = b :=
  ⟨eqTo,eqOf⟩
@[simp] theorem eqOf_to {A : Sort u} {a b : A} (h : ME A a b) :
  eqOf (eqTo h) = h := rfl
@[simp] theorem eqTo_of {A : Sort u} {a b : A} (h : a = b) :
  eqTo (eqOf h) = h := rfl
def eqIso {A : Sort u} (a b : A) : Iso (ME A a b) (a = b) :=
  ⟨eqTo,eqOf,eqOf_to,eqTo_of⟩
def eqTransport {A : Sort u} (P : A → Sort v) {a b : A} (h : ME A a b) (x : P a) : P b :=
  Rocq.Corelib.Init.Logic.eq.rec (motive := fun b _ => P b) x h
theorem eq_transport_agrees {A : Sort u} (P : A → Sort v) {a b : A}
    (h : ME A a b) (x : P a) : eqTransport P h x = (eqTo h ▸ x) := by
  cases h
  rfl
theorem eq_across_iso {A : Sort u} {B : Sort v} (e : Iso A B) (a b : A) :
    ME A a b ↔ e.to a = e.to b :=
  (eq_correspondence a b).trans (e.eq_iff a b).symm

abbrev RBool := Rocq.Corelib.Init.Datatypes.bool
def boolTo : RBool → Bool :=
  Rocq.Corelib.Init.Datatypes.bool.rec true false
def boolOf (b : Bool) : RBool := if b then .true else .false
@[simp] theorem bool_of_to (b : RBool) : boolOf (boolTo b) = b := by cases b <;> rfl
@[simp] theorem bool_to_of (b : Bool) : boolTo (boolOf b) = b := by cases b <;> rfl
def boolIso : Iso RBool Bool := ⟨boolTo, boolOf, bool_of_to, bool_to_of⟩

@[simp] theorem false_agrees : Rocq.Corelib.Init.Logic.False ↔ False := by
  constructor <;> intro h <;> cases h

@[simp] theorem and_agrees (P Q : Prop) : Rocq.Corelib.Init.Logic.and P Q ↔ (P ∧ Q) := by
  constructor
  · intro h; cases h with | conj p q => exact ⟨p,q⟩
  · rintro ⟨p,q⟩; exact .conj P Q p q

@[simp] theorem not_agrees (P : Prop) : Rocq.Corelib.Init.Logic.not P ↔ ¬ P := by
  change (P → Rocq.Corelib.Init.Logic.False) ↔ (P → False)
  simp only [false_agrees]

@[simp] theorem iff_agrees (P Q : Prop) : Rocq.Corelib.Init.Logic.iff P Q ↔ (P ↔ Q) := by
  change Rocq.Corelib.Init.Logic.and (P → Q) (Q → P) ↔ (P ↔ Q)
  rw [and_agrees]
  exact ⟨fun h => ⟨h.1,h.2⟩, fun h => ⟨h.mp,h.mpr⟩⟩

end NativeBridge
open Lean Meta Elab Command
syntax (name := nativeStatement) "#native_statement " ident : command
@[command_elab nativeStatement] def elabNativeStatement : CommandElab := fun stx => do
  let sourceName := stx[1].getId
  liftTermElabM do
    let ci ← getConstInfo sourceName
    let .defnInfo di := ci | throwError "Expected an actual translated statement definition"
    unless di.type == .sort .zero do throwError "Conditional/type-valued statement needs an explicit bridge"
    let mut rules : SimpTheorems := {}
    for rule in ["eq_correspondence","nat_eq_native","nat_family_forall","nat_binary_family_forall","nat_inner_family_forall","nat_forall_correspondence","nat_exists_correspondence","natTo_of","natOf_to","natTo_zero","natTo_succ","true_agrees","false_agrees","and_agrees","or_agrees","not_agrees","notT_agrees","iff_agrees","ex_agrees","ex2_agrees","inhabited_agrees","all_agrees",
      "nat_add_agrees","nat_sub_agrees","nat_mul_agrees","nat_pow_agrees","nat_min_agrees","nat_max_agrees",
      "peano_le_agrees","peano_lt_agrees","peano_ge_agrees","peano_gt_agrees"] do
      let rn := ("NativeBridge." ++ rule).toName
      if (← getEnv).contains rn then rules ← rules.addConst rn
    let ctx ← Simp.mkContext (config := { maxSteps := 20000 }) (simpTheorems := #[rules])
    let (r, _) ← Meta.simp di.value ctx
    let nativeName := ("NativeBridge.Statements." ++ sourceName.toString ++ ".native").toName
    let certName := ("NativeBridge.Statements." ++ sourceName.toString ++ ".correspondence").toName
    addDecl (.defnDecl {name:=nativeName,levelParams:=di.levelParams,type:=.sort .zero,value:=r.expr,hints:=.abbrev,safety:=.safe})
    let ls := di.levelParams.map Level.param
    let ty := mkApp2 (mkConst "Iff".toName) (mkConst sourceName ls) (mkConst nativeName ls)
    let proof ← mkAppM "Iff.of_eq".toName #[← r.getProof' di.value]
    addDecl (.thmDecl {name:=certName,levelParams:=di.levelParams,type:=ty,value:=proof})
namespace NativeBridge

#native_statement Rocq.Corelib.Init.Datatypes.BoolSpec_ind.statement
#native_statement Rocq.Corelib.Init.Datatypes.BoolSpec_sind.statement
#native_statement Rocq.Corelib.Init.Datatypes.CompOpp_iff.statement
#native_statement Rocq.Corelib.Init.Datatypes.CompOpp_inj.statement
#native_statement Rocq.Corelib.Init.Datatypes.CompOpp_involutive.statement
#native_statement Rocq.Corelib.Init.Datatypes.CompareSpecT_ind.statement
#native_statement Rocq.Corelib.Init.Datatypes.CompareSpecT_sind.statement
#native_statement Rocq.Corelib.Init.Datatypes.CompareSpec_ind.statement
#native_statement Rocq.Corelib.Init.Datatypes.CompareSpec_sind.statement
#native_statement Rocq.Corelib.Init.Datatypes.Empty_set_ind.statement
#native_statement Rocq.Corelib.Init.Datatypes.Empty_set_sind.statement
#native_statement Rocq.Corelib.Init.Datatypes.andb_prop.statement
#native_statement Rocq.Corelib.Init.Datatypes.andb_true_intro.statement
#native_statement Rocq.Corelib.Init.Datatypes.bool_ind.statement
#native_statement Rocq.Corelib.Init.Datatypes.bool_sind.statement
#native_statement Rocq.Corelib.Init.Datatypes.comparison_eq_stable.statement
#native_statement Rocq.Corelib.Init.Datatypes.comparison_ind.statement
#native_statement Rocq.Corelib.Init.Datatypes.comparison_sind.statement
#native_statement Rocq.Corelib.Init.Datatypes.eq_true_ind.statement
#native_statement Rocq.Corelib.Init.Datatypes.eq_true_ind_r.statement
#native_statement Rocq.Corelib.Init.Datatypes.eq_true_sind.statement
#native_statement Rocq.Corelib.Init.Datatypes.idProp.statement
#native_statement Rocq.Corelib.Init.Datatypes.injective_projections.statement
#native_statement Rocq.Corelib.Init.Datatypes.list_ind.statement
#native_statement Rocq.Corelib.Init.Datatypes.list_sind.statement
#native_statement Rocq.Corelib.Init.Datatypes.nat_ind.statement
#native_statement Rocq.Corelib.Init.Datatypes.nat_sind.statement
#native_statement Rocq.Corelib.Init.Datatypes.option_ind.statement
#native_statement Rocq.Corelib.Init.Datatypes.option_sind.statement
#native_statement Rocq.Corelib.Init.Datatypes.pair_equal_spec.statement
#native_statement Rocq.Corelib.Init.Datatypes.prod_ind.statement
#native_statement Rocq.Corelib.Init.Datatypes.prod_sind.statement
#native_statement Rocq.Corelib.Init.Datatypes.reflect_ind.statement
#native_statement Rocq.Corelib.Init.Datatypes.reflect_sind.statement
#native_statement Rocq.Corelib.Init.Datatypes.result_ind.statement
#native_statement Rocq.Corelib.Init.Datatypes.result_sind.statement
#native_statement Rocq.Corelib.Init.Datatypes.rew_pair.statement
#native_statement Rocq.Corelib.Init.Datatypes.sum_ind.statement
#native_statement Rocq.Corelib.Init.Datatypes.sum_sind.statement
#native_statement Rocq.Corelib.Init.Datatypes.surjective_pairing.statement
#native_statement Rocq.Corelib.Init.Datatypes.unit_ind.statement
#native_statement Rocq.Corelib.Init.Datatypes.unit_sind.statement
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
  IO.FS.writeFile "/home/shunqwang4/research/rocq-core/experiments/mechanical-correspondence-20261019/audits/Auto_Init_Datatypes.json" (Lean.Json.pretty (.arr rows))

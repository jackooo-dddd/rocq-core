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

#native_statement Rocq.Corelib.Init.Logic.False_ind.statement
#native_statement Rocq.Corelib.Init.Logic.False_sind.statement
#native_statement Rocq.Corelib.Init.Logic.True_ind.statement
#native_statement Rocq.Corelib.Init.Logic.True_sind.statement
#native_statement Rocq.Corelib.Init.Logic.absurd.statement
#native_statement Rocq.Corelib.Init.Logic.and_assoc.statement
#native_statement Rocq.Corelib.Init.Logic.and_cancel_l.statement
#native_statement Rocq.Corelib.Init.Logic.and_cancel_r.statement
#native_statement Rocq.Corelib.Init.Logic.and_comm.statement
#native_statement Rocq.Corelib.Init.Logic.and_iff_compat_l.statement
#native_statement Rocq.Corelib.Init.Logic.and_iff_compat_r.statement
#native_statement Rocq.Corelib.Init.Logic.and_ind.statement
#native_statement Rocq.Corelib.Init.Logic.and_sind.statement
#native_statement Rocq.Corelib.Init.Logic.eq_ex2_nondep.statement
#native_statement Rocq.Corelib.Init.Logic.ex_proj1_of_ex2_eq.statement
#native_statement Rocq.Corelib.Init.Logic.eq_ex_hprop.statement
#native_statement Rocq.Corelib.Init.Logic.eq_ex_hprop_iff.statement
#native_statement Rocq.Corelib.Init.Logic.ex_proj1_eq.statement
#native_statement Rocq.Corelib.Init.Logic.eq_ind.statement
#native_statement Rocq.Corelib.Init.Logic.eq_ind_r.statement
#native_statement Rocq.Corelib.Init.Logic.eq_sym.statement
#native_statement Rocq.Corelib.Init.Logic.eq_sind.statement
#native_statement Rocq.Corelib.Init.Logic.eq_sind_r.statement
#native_statement Rocq.Corelib.Init.Logic.eq_stepl.statement
#native_statement Rocq.Corelib.Init.Logic.eq_trans.statement
#native_statement Rocq.Corelib.Init.Logic.eq_trans_r.statement
#native_statement Rocq.Corelib.Init.Logic.ex2_ind.statement
#native_statement Rocq.Corelib.Init.Logic.ex2_sind.statement
#native_statement Rocq.Corelib.Init.Logic.ex_ind.statement
#native_statement Rocq.Corelib.Init.Logic.ex_of_ex2.statement
#native_statement Rocq.Corelib.Init.Logic.ex_proj1.statement
#native_statement Rocq.Corelib.Init.Logic.ex_proj2.statement
#native_statement Rocq.Corelib.Init.Logic.ex_proj3.statement
#native_statement Rocq.Corelib.Init.Logic.ex_sind.statement
#native_statement Rocq.Corelib.Init.Logic.exists_inhabited.statement
#native_statement Rocq.Corelib.Init.Logic.f_equal.statement
#native_statement Rocq.Corelib.Init.Logic.f_equal2.statement
#native_statement Rocq.Corelib.Init.Logic.f_equal3.statement
#native_statement Rocq.Corelib.Init.Logic.f_equal4.statement
#native_statement Rocq.Corelib.Init.Logic.f_equal5.statement
#native_statement Rocq.Corelib.Init.Logic.f_equal_dep.statement
#native_statement Rocq.Corelib.Init.Logic.forall_exists_coincide_unique_domain.statement
#native_statement Rocq.Corelib.Init.Logic.forall_exists_unique_domain_coincide.statement
#native_statement Rocq.Corelib.Init.Logic.gen.statement
#native_statement Rocq.Corelib.Init.Logic.iff_and.statement
#native_statement Rocq.Corelib.Init.Logic.iff_refl.statement
#native_statement Rocq.Corelib.Init.Logic.iff_stepl.statement
#native_statement Rocq.Corelib.Init.Logic.iff_sym.statement
#native_statement Rocq.Corelib.Init.Logic.iff_to_and.statement
#native_statement Rocq.Corelib.Init.Logic.iff_trans.statement
#native_statement Rocq.Corelib.Init.Logic.imp_iff_compat_l.statement
#native_statement Rocq.Corelib.Init.Logic.imp_iff_compat_r.statement
#native_statement Rocq.Corelib.Init.Logic.inhabited_covariant.statement
#native_statement Rocq.Corelib.Init.Logic.inhabited_ind.statement
#native_statement Rocq.Corelib.Init.Logic.inhabited_sind.statement
#native_statement Rocq.Corelib.Init.Logic.inst.statement
#native_statement Rocq.Corelib.Init.Logic.map_subst.statement
#native_statement Rocq.Corelib.Init.Logic.neg_false.statement
#native_statement Rocq.Corelib.Init.Logic.not_eq_sym.statement
#native_statement Rocq.Corelib.Init.Logic.not_iff_compat.statement
#native_statement Rocq.Corelib.Init.Logic.or_assoc.statement
#native_statement Rocq.Corelib.Init.Logic.or_cancel_l.statement
#native_statement Rocq.Corelib.Init.Logic.or_cancel_r.statement
#native_statement Rocq.Corelib.Init.Logic.or_comm.statement
#native_statement Rocq.Corelib.Init.Logic.or_iff_compat_l.statement
#native_statement Rocq.Corelib.Init.Logic.or_iff_compat_r.statement
#native_statement Rocq.Corelib.Init.Logic.or_ind.statement
#native_statement Rocq.Corelib.Init.Logic.or_sind.statement
#native_statement Rocq.Corelib.Init.Logic.proj1.statement
#native_statement Rocq.Corelib.Init.Logic.proj2.statement
#native_statement Rocq.Corelib.Init.Logic.rew_const.statement
#native_statement Rocq.Corelib.Init.Logic.unique_existence.statement
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
  IO.FS.writeFile "/home/shunqwang4/research/rocq-core/experiments/mechanical-correspondence-20261019/audits/Auto_Init_Logic.json" (Lean.Json.pretty (.arr rows))

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
    for rule in ["true_agrees","false_agrees","and_agrees","or_agrees","not_agrees","notT_agrees","iff_agrees","ex_agrees","ex2_agrees","inhabited_agrees","all_agrees",
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

#native_statement Rocq.Corelib.ssr.ssrbool.addFb.statement
#native_statement Rocq.Corelib.ssr.ssrbool.addIb.statement
#native_statement Rocq.Corelib.ssr.ssrbool.addKb.statement
#native_statement Rocq.Corelib.ssr.ssrbool.addNb.statement
#native_statement Rocq.Corelib.ssr.ssrbool.addTb.statement
#native_statement Rocq.Corelib.ssr.ssrbool.addbA.statement
#native_statement Rocq.Corelib.ssr.ssrbool.addbAC.statement
#native_statement Rocq.Corelib.ssr.ssrbool.addbACA.statement
#native_statement Rocq.Corelib.ssr.ssrbool.addbC.statement
#native_statement Rocq.Corelib.ssr.ssrbool.addbCA.statement
#native_statement Rocq.Corelib.ssr.ssrbool.addbF.statement
#native_statement Rocq.Corelib.ssr.ssrbool.addbI.statement
#native_statement Rocq.Corelib.ssr.ssrbool.addbK.statement
#native_statement Rocq.Corelib.ssr.ssrbool.addbN.statement
#native_statement Rocq.Corelib.ssr.ssrbool.not_false_is_true.statement
#native_statement Rocq.Corelib.ssr.ssrbool.addbT.statement
#native_statement Rocq.Corelib.ssr.ssrbool.addbb.statement
#native_statement Rocq.Corelib.ssr.ssrbool.and3_ind.statement
#native_statement Rocq.Corelib.ssr.ssrbool.and3_sind.statement
#native_statement Rocq.Corelib.ssr.ssrbool.and4_ind.statement
#native_statement Rocq.Corelib.ssr.ssrbool.and4_sind.statement
#native_statement Rocq.Corelib.ssr.ssrbool.and5_ind.statement
#native_statement Rocq.Corelib.ssr.ssrbool.and5_sind.statement
#native_statement Rocq.Corelib.ssr.ssrbool.andFb.statement
#native_statement Rocq.Corelib.ssr.ssrbool.andKb.statement
#native_statement Rocq.Corelib.ssr.ssrbool.andNb.statement
#native_statement Rocq.Corelib.ssr.ssrbool.andTb.statement
#native_statement Rocq.Corelib.ssr.ssrbool.andbA.statement
#native_statement Rocq.Corelib.ssr.ssrbool.andbAC.statement
#native_statement Rocq.Corelib.ssr.ssrbool.andbACA.statement
#native_statement Rocq.Corelib.ssr.ssrbool.andbC.statement
#native_statement Rocq.Corelib.ssr.ssrbool.andbCA.statement
#native_statement Rocq.Corelib.ssr.ssrbool.andbF.statement
#native_statement Rocq.Corelib.ssr.ssrbool.andbK.statement
#native_statement Rocq.Corelib.ssr.ssrbool.andbN.statement
#native_statement Rocq.Corelib.ssr.ssrbool.andbT.statement
#native_statement Rocq.Corelib.ssr.ssrbool.andb_addl.statement
#native_statement Rocq.Corelib.ssr.ssrbool.andb_addr.statement
#native_statement Rocq.Corelib.ssr.ssrbool.andb_id2l.statement
#native_statement Rocq.Corelib.ssr.ssrbool.andb_id2r.statement
#native_statement Rocq.Corelib.ssr.ssrbool.andb_idl.statement
#native_statement Rocq.Corelib.ssr.ssrbool.andb_idr.statement
#native_statement Rocq.Corelib.ssr.ssrbool.andb_orl.statement
#native_statement Rocq.Corelib.ssr.ssrbool.andb_orr.statement
#native_statement Rocq.Corelib.ssr.ssrbool.andbb.statement
#native_statement Rocq.Corelib.ssr.ssrbool.appP.statement
#native_statement Rocq.Corelib.ssr.ssrbool.app_predE.statement
#native_statement Rocq.Corelib.ssr.ssrbool.is_true_true.statement
#native_statement Rocq.Corelib.ssr.ssrbool.can_mono.statement
#native_statement Rocq.Corelib.ssr.ssrbool.classicP.statement
#native_statement Rocq.Corelib.ssr.ssrbool.classicW.statement
#native_statement Rocq.Corelib.ssr.ssrbool.classic_EM.statement
#native_statement Rocq.Corelib.ssr.ssrbool.classic_bind.statement
#native_statement Rocq.Corelib.ssr.ssrbool.classic_ex.statement
#native_statement Rocq.Corelib.ssr.ssrbool.classic_imply.statement
#native_statement Rocq.Corelib.ssr.ssrbool.classic_pick.statement
#native_statement Rocq.Corelib.ssr.ssrbool.classic_sigW.statement
#native_statement Rocq.Corelib.ssr.ssrbool.contra.statement
#native_statement Rocq.Corelib.ssr.ssrbool.contraFF.statement
#native_statement Rocq.Corelib.ssr.ssrbool.contraFN.statement
#native_statement Rocq.Corelib.ssr.ssrbool.contraFT.statement
#native_statement Rocq.Corelib.ssr.ssrbool.contraFnot.statement
#native_statement Rocq.Corelib.ssr.ssrbool.contraL.statement
#native_statement Rocq.Corelib.ssr.ssrbool.contraLR.statement
#native_statement Rocq.Corelib.ssr.ssrbool.contraNF.statement
#native_statement Rocq.Corelib.ssr.ssrbool.contraNN.statement
#native_statement Rocq.Corelib.ssr.ssrbool.contraNT.statement
#native_statement Rocq.Corelib.ssr.ssrbool.contraNnot.statement
#native_statement Rocq.Corelib.ssr.ssrbool.contraPF.statement
#native_statement Rocq.Corelib.ssr.ssrbool.contraPN.statement
#native_statement Rocq.Corelib.ssr.ssrbool.contraPT.statement
#native_statement Rocq.Corelib.ssr.ssrbool.contraPnot.statement
#native_statement Rocq.Corelib.ssr.ssrbool.contraR.statement
#native_statement Rocq.Corelib.ssr.ssrbool.contraT.statement
#native_statement Rocq.Corelib.ssr.ssrbool.contraTF.statement
#native_statement Rocq.Corelib.ssr.ssrbool.contraTN.statement
#native_statement Rocq.Corelib.ssr.ssrbool.contraTT.statement
#native_statement Rocq.Corelib.ssr.ssrbool.contraTnot.statement
#native_statement Rocq.Corelib.ssr.ssrbool.contra_not.statement
#native_statement Rocq.Corelib.ssr.ssrbool.contra_notF.statement
#native_statement Rocq.Corelib.ssr.ssrbool.contra_notN.statement
#native_statement Rocq.Corelib.ssr.ssrbool.contra_notT.statement
#native_statement Rocq.Corelib.ssr.ssrbool.decPcases.statement
#native_statement Rocq.Corelib.ssr.ssrbool.elimF.statement
#native_statement Rocq.Corelib.ssr.ssrbool.elimFn.statement
#native_statement Rocq.Corelib.ssr.ssrbool.elimN.statement
#native_statement Rocq.Corelib.ssr.ssrbool.elimNTF.statement
#native_statement Rocq.Corelib.ssr.ssrbool.elimNf.statement
#native_statement Rocq.Corelib.ssr.ssrbool.elimT.statement
#native_statement Rocq.Corelib.ssr.ssrbool.elimTF.statement
#native_statement Rocq.Corelib.ssr.ssrbool.elimTFn.statement
#native_statement Rocq.Corelib.ssr.ssrbool.elimTn.statement
#native_statement Rocq.Corelib.ssr.ssrbool.eqbLR.statement
#native_statement Rocq.Corelib.ssr.ssrbool.eqbRL.statement
#native_statement Rocq.Corelib.ssr.ssrbool.equivPif.statement
#native_statement Rocq.Corelib.ssr.ssrbool.equivPifn.statement
#native_statement Rocq.Corelib.ssr.ssrbool.equivalence_relP.statement
#native_statement Rocq.Corelib.ssr.ssrbool.forE.statement
#native_statement Rocq.Corelib.ssr.ssrbool.fun_if.statement
#native_statement Rocq.Corelib.ssr.ssrbool.homoLR.statement
#native_statement Rocq.Corelib.ssr.ssrbool.homoRL.statement
#native_statement Rocq.Corelib.ssr.ssrbool.homo_mono.statement
#native_statement Rocq.Corelib.ssr.ssrbool.homo_sym.statement
#native_statement Rocq.Corelib.ssr.ssrbool.ifE.statement
#native_statement Rocq.Corelib.ssr.ssrbool.ifF.statement
#native_statement Rocq.Corelib.ssr.ssrbool.ifN.statement
#native_statement Rocq.Corelib.ssr.ssrbool.ifT.statement
#native_statement Rocq.Corelib.ssr.ssrbool.if_arg.statement
#native_statement Rocq.Corelib.ssr.ssrbool.if_neg.statement
#native_statement Rocq.Corelib.ssr.ssrbool.if_same.statement
#native_statement Rocq.Corelib.ssr.ssrbool.impliesPn.statement
#native_statement Rocq.Corelib.ssr.ssrbool.implyFb.statement
#native_statement Rocq.Corelib.ssr.ssrbool.implyNb.statement
#native_statement Rocq.Corelib.ssr.ssrbool.implyTb.statement
#native_statement Rocq.Corelib.ssr.ssrbool.implybE.statement
#native_statement Rocq.Corelib.ssr.ssrbool.implybF.statement
#native_statement Rocq.Corelib.ssr.ssrbool.implybN.statement
#native_statement Rocq.Corelib.ssr.ssrbool.implybNN.statement
#native_statement Rocq.Corelib.ssr.ssrbool.implybT.statement
#native_statement Rocq.Corelib.ssr.ssrbool.implyb_id2l.statement
#native_statement Rocq.Corelib.ssr.ssrbool.implyb_idl.statement
#native_statement Rocq.Corelib.ssr.ssrbool.implyb_idr.statement
#native_statement Rocq.Corelib.ssr.ssrbool.implybb.statement
#native_statement Rocq.Corelib.ssr.ssrbool.inE.statement
#native_statement Rocq.Corelib.ssr.ssrbool.inPhantom.statement
#native_statement Rocq.Corelib.ssr.ssrbool.in_applicative.statement
#native_statement Rocq.Corelib.ssr.ssrbool.in_collective.statement
#native_statement Rocq.Corelib.ssr.ssrbool.in_simpl.statement
#native_statement Rocq.Corelib.ssr.ssrbool.introF.statement
#native_statement Rocq.Corelib.ssr.ssrbool.introFn.statement
#native_statement Rocq.Corelib.ssr.ssrbool.introN.statement
#native_statement Rocq.Corelib.ssr.ssrbool.introNTF.statement
#native_statement Rocq.Corelib.ssr.ssrbool.introNf.statement
#native_statement Rocq.Corelib.ssr.ssrbool.introT.statement
#native_statement Rocq.Corelib.ssr.ssrbool.introTF.statement
#native_statement Rocq.Corelib.ssr.ssrbool.introTFn.statement
#native_statement Rocq.Corelib.ssr.ssrbool.introTn.statement
#native_statement Rocq.Corelib.ssr.ssrbool.isT.statement
#native_statement Rocq.Corelib.ssr.ssrbool.is_true_locked_true.statement
#native_statement Rocq.Corelib.ssr.ssrbool.keyed_predE.statement
#native_statement Rocq.Corelib.ssr.ssrbool.keyed_qualifier_suproof.statement
#native_statement Rocq.Corelib.ssr.ssrbool.memE.statement
#native_statement Rocq.Corelib.ssr.ssrbool.mem_mem.statement
#native_statement Rocq.Corelib.ssr.ssrbool.mem_simpl.statement
#native_statement Rocq.Corelib.ssr.ssrbool.mem_topred.statement
#native_statement Rocq.Corelib.ssr.ssrbool.mono2W.statement
#native_statement Rocq.Corelib.ssr.ssrbool.monoLR.statement
#native_statement Rocq.Corelib.ssr.ssrbool.monoRL.statement
#native_statement Rocq.Corelib.ssr.ssrbool.monoW.statement
#native_statement Rocq.Corelib.ssr.ssrbool.mono_sym.statement
#native_statement Rocq.Corelib.ssr.ssrbool.negbF.statement
#native_statement Rocq.Corelib.ssr.ssrbool.negbFE.statement
#native_statement Rocq.Corelib.ssr.ssrbool.negbK.statement
#native_statement Rocq.Corelib.ssr.ssrbool.negbLR.statement
#native_statement Rocq.Corelib.ssr.ssrbool.negbNE.statement
#native_statement Rocq.Corelib.ssr.ssrbool.negbRL.statement
#native_statement Rocq.Corelib.ssr.ssrbool.negbT.statement
#native_statement Rocq.Corelib.ssr.ssrbool.negbTE.statement
#native_statement Rocq.Corelib.ssr.ssrbool.negb_and.statement
#native_statement Rocq.Corelib.ssr.ssrbool.negb_imply.statement
#native_statement Rocq.Corelib.ssr.ssrbool.negb_inj.statement
#native_statement Rocq.Corelib.ssr.ssrbool.negb_or.statement
#native_statement Rocq.Corelib.ssr.ssrbool.notF.statement
#native_statement Rocq.Corelib.ssr.ssrbool.onPhantom.statement
#native_statement Rocq.Corelib.ssr.ssrbool.or3_ind.statement
#native_statement Rocq.Corelib.ssr.ssrbool.or3_sind.statement
#native_statement Rocq.Corelib.ssr.ssrbool.or4_ind.statement
#native_statement Rocq.Corelib.ssr.ssrbool.or4_sind.statement
#native_statement Rocq.Corelib.ssr.ssrbool.orFb.statement
#native_statement Rocq.Corelib.ssr.ssrbool.orKb.statement
#native_statement Rocq.Corelib.ssr.ssrbool.orNb.statement
#native_statement Rocq.Corelib.ssr.ssrbool.orTb.statement
#native_statement Rocq.Corelib.ssr.ssrbool.orbA.statement
#native_statement Rocq.Corelib.ssr.ssrbool.orbAC.statement
#native_statement Rocq.Corelib.ssr.ssrbool.orbACA.statement
#native_statement Rocq.Corelib.ssr.ssrbool.orbC.statement
#native_statement Rocq.Corelib.ssr.ssrbool.orbCA.statement
#native_statement Rocq.Corelib.ssr.ssrbool.orbF.statement
#native_statement Rocq.Corelib.ssr.ssrbool.orbK.statement
#native_statement Rocq.Corelib.ssr.ssrbool.orbN.statement
#native_statement Rocq.Corelib.ssr.ssrbool.orbT.statement
#native_statement Rocq.Corelib.ssr.ssrbool.orb_andl.statement
#native_statement Rocq.Corelib.ssr.ssrbool.orb_andr.statement
#native_statement Rocq.Corelib.ssr.ssrbool.orb_id2l.statement
#native_statement Rocq.Corelib.ssr.ssrbool.orb_id2r.statement
#native_statement Rocq.Corelib.ssr.ssrbool.orb_idl.statement
#native_statement Rocq.Corelib.ssr.ssrbool.orb_idr.statement
#native_statement Rocq.Corelib.ssr.ssrbool.orbb.statement
#native_statement Rocq.Corelib.ssr.ssrbool.pair_andP.statement
#native_statement Rocq.Corelib.ssr.ssrbool.prop_congr.statement
#native_statement Rocq.Corelib.ssr.ssrbool.qualifE.statement
#native_statement Rocq.Corelib.ssr.ssrbool.rev_trans.statement
#native_statement Rocq.Corelib.ssr.ssrbool.rwP.statement
#native_statement Rocq.Corelib.ssr.ssrbool.rwP2.statement
#native_statement Rocq.Corelib.ssr.ssrbool.sameP.statement
#native_statement Rocq.Corelib.ssr.ssrbool.simpl_predE.statement
#native_statement Rocq.Corelib.ssr.ssrbool.sub_in1.statement
#native_statement Rocq.Corelib.ssr.ssrbool.sub_in11.statement
#native_statement Rocq.Corelib.ssr.ssrbool.sub_in111.statement
#native_statement Rocq.Corelib.ssr.ssrbool.sub_in12.statement
#native_statement Rocq.Corelib.ssr.ssrbool.sub_in2.statement
#native_statement Rocq.Corelib.ssr.ssrbool.sub_in21.statement
#native_statement Rocq.Corelib.ssr.ssrbool.sub_in3.statement
#native_statement Rocq.Corelib.ssr.ssrbool.sub_refl.statement
#native_statement Rocq.Corelib.ssr.ssrbool.subon1.statement
#native_statement Rocq.Corelib.ssr.ssrbool.subon1l.statement
#native_statement Rocq.Corelib.ssr.ssrbool.subon2.statement
#native_statement Rocq.Corelib.ssr.ssrbool.subrelUl.statement
#native_statement Rocq.Corelib.ssr.ssrbool.subrelUr.statement
#native_statement Rocq.Corelib.ssr.ssrbool.sym_left_transitive.statement
#native_statement Rocq.Corelib.ssr.ssrbool.sym_right_transitive.statement
#native_statement Rocq.Corelib.ssr.ssrbool.symmetric_from_pre.statement
#native_statement Rocq.Corelib.ssr.ssrbool.topredE.statement
#native_statement Rocq.Corelib.ssr.ssrbool.unfold_in.statement
#native_statement Rocq.Corelib.ssr.ssrbool.unlessP.statement
#native_statement Rocq.Corelib.ssr.ssrbool.wlog_neg.statement
#native_statement Rocq.Corelib.ssr.ssrbool.xorPif.statement
#native_statement Rocq.Corelib.ssr.ssrbool.xorPifn.statement
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
  IO.FS.writeFile "/home/shunqwang4/research/rocq-core/experiments/native-correspondence-main75-20261018/audits/Auto_ssr_ssrbool.json" (Lean.Json.pretty (.arr rows))

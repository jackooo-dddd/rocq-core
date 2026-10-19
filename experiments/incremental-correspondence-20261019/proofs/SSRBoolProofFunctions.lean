import SSRBoolReflection
set_option autoImplicit false
set_option linter.defProp false
noncomputable section
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.all_and2
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.all_and3
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.all_and4
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.all_and5
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.unlessL
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.unlessR
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.unless_sym
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.bind_unless
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.keyed_mem
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.keyed_mem_simpl
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.keyed_qualifier_keyed
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.decP
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.unless_contra
namespace NativeBridge.Incremental.SSRBoolProofFunctions
open NativeBridge SSRBoolData SSRBoolPackaging SSRBoolLogic
universe u v w

def all_and2_native (T : Sort u) (P1 P2 : T → Prop) (h : ∀ x, P1 x ∧ P2 x) : (∀ x, P1 x) ∧ (∀ x, P2 x) :=
  ⟨(fun x => (h x).1), (fun x => (h x).2)⟩

theorem all_and2_agrees (T : Sort u) (P1 P2 : T → Prop) (h : ∀ x, P1 x ∧ P2 x) :
  (NativeBridge.Incremental.and_agrees (∀ x, P1 x) (∀ x, P2 x)).mp ((impliesIso _ _).to (@RocqPending.Corelib.ssr.ssrbool.all_and2.{u} NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.all_and2__rocq2lean_obligation_1.statement T P1 P2) (fun x => (NativeBridge.Incremental.and_agrees (P1 x) (P2 x)).mpr (h x))) =
    all_and2_native T P1 P2 h := rfl

def all_and3_native (T : Sort u) (P1 P2 P3 : T → Prop) (h : ∀ x, P1 x ∧ P2 x ∧ P3 x) : (∀ x, P1 x) ∧ (∀ x, P2 x) ∧ (∀ x, P3 x) :=
  ⟨(fun x => (h x).1), (fun x => (h x).2.1), (fun x => (h x).2.2)⟩

theorem all_and3_agrees (T : Sort u) (P1 P2 P3 : T → Prop) (h : ∀ x, P1 x ∧ P2 x ∧ P3 x) :
  (and3Iso (∀ x, P1 x) (∀ x, P2 x) (∀ x, P3 x)).to ((impliesIso _ _).to (@RocqPending.Corelib.ssr.ssrbool.all_and3.{u} NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.all_and3__rocq2lean_obligation_1.statement T P1 P2 P3) (fun x => (and3Iso (P1 x) (P2 x) (P3 x)).of (h x))) =
    all_and3_native T P1 P2 P3 h := rfl

def all_and4_native (T : Sort u) (P1 P2 P3 P4 : T → Prop) (h : ∀ x, P1 x ∧ P2 x ∧ P3 x ∧ P4 x) : (∀ x, P1 x) ∧ (∀ x, P2 x) ∧ (∀ x, P3 x) ∧ (∀ x, P4 x) :=
  ⟨(fun x => (h x).1), (fun x => (h x).2.1), (fun x => (h x).2.2.1), (fun x => (h x).2.2.2)⟩

theorem all_and4_agrees (T : Sort u) (P1 P2 P3 P4 : T → Prop) (h : ∀ x, P1 x ∧ P2 x ∧ P3 x ∧ P4 x) :
  (and4Iso (∀ x, P1 x) (∀ x, P2 x) (∀ x, P3 x) (∀ x, P4 x)).to ((impliesIso _ _).to (@RocqPending.Corelib.ssr.ssrbool.all_and4.{u} NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.all_and4__rocq2lean_obligation_1.statement T P1 P2 P3 P4) (fun x => (and4Iso (P1 x) (P2 x) (P3 x) (P4 x)).of (h x))) =
    all_and4_native T P1 P2 P3 P4 h := rfl

def all_and5_native (T : Sort u) (P1 P2 P3 P4 P5 : T → Prop) (h : ∀ x, P1 x ∧ P2 x ∧ P3 x ∧ P4 x ∧ P5 x) : (∀ x, P1 x) ∧ (∀ x, P2 x) ∧ (∀ x, P3 x) ∧ (∀ x, P4 x) ∧ (∀ x, P5 x) :=
  ⟨(fun x => (h x).1), (fun x => (h x).2.1), (fun x => (h x).2.2.1), (fun x => (h x).2.2.2.1), (fun x => (h x).2.2.2.2)⟩

theorem all_and5_agrees (T : Sort u) (P1 P2 P3 P4 P5 : T → Prop) (h : ∀ x, P1 x ∧ P2 x ∧ P3 x ∧ P4 x ∧ P5 x) :
  (and5Iso (∀ x, P1 x) (∀ x, P2 x) (∀ x, P3 x) (∀ x, P4 x) (∀ x, P5 x)).to ((impliesIso _ _).to (@RocqPending.Corelib.ssr.ssrbool.all_and5.{u} NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.all_and5__rocq2lean_obligation_1.statement T P1 P2 P3 P4 P5) (fun x => (and5Iso (P1 x) (P2 x) (P3 x) (P4 x) (P5 x)).of (h x))) =
    all_and5_native T P1 P2 P3 P4 P5 h := rfl

def unlessL_native (C : Sort u) (P : Sort v) (c : C) : Nonempty C ∨ Nonempty P := .inl ⟨c⟩
def unlessR_native (C : Sort u) (P : Sort v) (p : P) : Nonempty C ∨ Nonempty P := .inr ⟨p⟩
def unless_sym_native (C : Sort u) (P : Sort v) (h : Nonempty C ∨ Nonempty P) :
    Nonempty P ∨ Nonempty C := h.symm
def bind_unless_native (C : Sort u) (P : Sort v) (Q : Sort w) (h : Nonempty C ∨ Nonempty P) :
    (Nonempty C ∨ Nonempty Q) ∨ Nonempty P := h.elim (fun hc => .inl (.inl hc)) Or.inr
def bindUnlessTo (C : Sort u) (P : Sort v) (Q : Sort w)
    (h : Rocq.Corelib.ssr.ssrbool.unless (Rocq.Corelib.ssr.ssrbool.unless C Q) P) :
    (Nonempty C ∨ Nonempty Q) ∨ Nonempty P := by
  rcases (unless_agrees _ P).mp h with hcq | hp
  · rcases hcq with ⟨hcq⟩
    exact .inl ((unless_agrees C Q).mp hcq)
  · exact .inr hp

theorem unlessL_agrees (C : Sort u) (P : Sort v) (c : C) :
  (unless_agrees C P).mp ((impliesIso _ _).to (@RocqPending.Corelib.ssr.ssrbool.unlessL.{u,v} NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.unlessL__rocq2lean_obligation_1.statement C P) c) =
    unlessL_native C P c := rfl

theorem unlessR_agrees (C : Sort u) (P : Sort v) (p : P) :
  (unless_agrees C P).mp ((impliesIso _ _).to (@RocqPending.Corelib.ssr.ssrbool.unlessR.{v,u} NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.unlessR__rocq2lean_obligation_1.statement C P) p) =
    unlessR_native C P p := rfl

theorem unless_sym_agrees (C : Sort u) (P : Sort v) (h : Nonempty C ∨ Nonempty P) :
  (unless_agrees P C).mp ((impliesIso _ _).to (@RocqPending.Corelib.ssr.ssrbool.unless_sym.{u,v} NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.unless_sym__rocq2lean_obligation_1.statement C P) ((unless_agrees C P).mpr h)) =
    unless_sym_native C P h := rfl

theorem bind_unless_agrees (C : Sort u) (P : Sort v) (Q : Sort w) (h : Nonempty C ∨ Nonempty P) :
  bindUnlessTo C P Q ((impliesIso _ _).to (@RocqPending.Corelib.ssr.ssrbool.bind_unless.{u,v,w} NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.bind_unless__rocq2lean_obligation_1.statement C P Q) ((unless_agrees C P).mpr h)) =
    bind_unless_native C P Q h := rfl

theorem keyed_mem_agrees (A : Type u) (p : A → Bool) (k : True) (x : Unit) :
    (keyedPredIso.{u,u} A (predOf p) ((predKeyIso A (predOf p)).of k)).to
      (@RocqPending.Corelib.ssr.ssrbool.keyed_mem.{v,u} NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.keyed_mem__rocq2lean_obligation_1.statement A (predOf p) ((predKeyIso A (predOf p)).of k) ((keyedPredIso A (predOf p) ((predKeyIso A (predOf p)).of k)).of x)) = id x := by cases x; rfl

theorem keyed_mem_simpl_agrees (A : Type u) (p : A → Bool) (k : True) (x : Unit) :
    (keyedPredIso.{u,u} A (predOf p) ((predKeyIso A (predOf p)).of k)).to
      (@RocqPending.Corelib.ssr.ssrbool.keyed_mem_simpl.{v,u} NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.keyed_mem_simpl__rocq2lean_obligation_1.statement A (predOf p) ((predKeyIso A (predOf p)).of k) ((keyedPredIso A (predOf p) ((predKeyIso A (predOf p)).of k)).of x)) = id x := by cases x; rfl

theorem keyed_qualifier_keyed_agrees (A : Type u) (n : Nat) (p : A → Bool) (k : True) (x : Unit) :
    (keyedPredIso.{u,u} A (predOf p) ((predKeyIso A (predOf p)).of k)).to
      (@RocqPending.Corelib.ssr.ssrbool.keyed_qualifier_keyed.{v,u} NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.keyed_qualifier_keyed__rocq2lean_obligation_1.statement A (natOf n) ((qualifierIso (natOf n) A).of p) ((predKeyIso A (predOf p)).of k)
        ((keyedQualifierIso A (natOf n) ((qualifierIso (natOf n) A).of p) ((predKeyIso A (predOf p)).of k)).of x)) = id x := by cases x; rfl

def decP_native (P : Prop) (b : Bool) (hp : P ↔ b = true) : Decidable P := by
  cases b
  · exact .isFalse (fun h => Bool.false_ne_true (hp.mp h))
  · exact .isTrue (hp.mpr rfl)
def reflectNativeOf (P : Prop) (b : Bool) (hp : P ↔ b = true) :
    Rocq.Corelib.Init.Datatypes.reflect P (boolOf b) :=
  (reflectIso P (boolOf b)).of (by simpa only [bool_to_of] using hp)
theorem decP_agrees (P : Prop) (b : Bool) (hp : P ↔ b = true) :
    SSRBoolData.decidableTo P (@RocqPending.Corelib.ssr.ssrbool.decP NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.decP__rocq2lean_obligation_1.statement P (boolOf b) (reflectNativeOf P b hp)) =
      decP_native P b hp := Subsingleton.elim _ _
def unless_contra_native (b : Bool) (C : Sort u) (f : (!b) = true → C) : Nonempty C ∨ b = true := by
  cases b
  · exact .inl ⟨f rfl⟩
  · exact .inr rfl
def negBoolTo (b : Bool) (h : Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb (boolOf b))) :
    (!b) = true := by
  simpa only [negb_agrees, bool_to_of] using (is_true_agrees _).mp h
def unlessBoolTo (C : Sort u) (b : Bool)
    (h : Rocq.Corelib.ssr.ssrbool.unless C (Rocq.Corelib.Init.Datatypes.is_true (boolOf b))) :
    Nonempty C ∨ b = true := by
  rcases (unless_agrees C _).mp h with hc | hb
  · exact .inl hc
  · rcases hb with ⟨hb⟩
    exact .inr (by simpa only [bool_to_of] using (is_true_agrees _).mp hb)
theorem unless_contra_agrees (b : Bool) (C : Sort u) (f : (!b) = true → C) :
    unlessBoolTo C b ((impliesIso _ _).to (@RocqPending.Corelib.ssr.ssrbool.unless_contra.{u} NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.unless_contra__rocq2lean_obligation_1.statement (boolOf b) C)
      (fun h => f (negBoolTo b h))) = unless_contra_native b C f := rfl

end NativeBridge.Incremental.SSRBoolProofFunctions

open Lean Meta Elab Command
private partial def proofFunctionNativeRefs (e : Expr) (seen : NameSet := {}) : MetaM (Array Name) := do
  let mut found : Array Name := #[]
  let mut seen := seen
  for n in e.getUsedConstants do
    if seen.contains n then continue
    seen := seen.insert n
    let s := n.toString
    if s.startsWith "Rocq." || s.startsWith "RocqPending." || s.startsWith "Rocq2Lean." then
      found := found.push n
    else if s.startsWith "NativeBridge." then
      let ci ← getConstInfo n
      let body? := match ci with
        | .defnInfo v => some v.value
        | .thmInfo v => some v.value
        | .opaqueInfo v => some v.value
        | _ => none
      if let some body := body? then
        found := found ++ (← proofFunctionNativeRefs body seen)
  return found



open Lean in
run_cmd Lean.Elab.Command.liftTermElabM do
  for name in ["NativeBridge.Incremental.SSRBoolProofFunctions.all_and2_native", "NativeBridge.Incremental.SSRBoolProofFunctions.all_and3_native", "NativeBridge.Incremental.SSRBoolProofFunctions.all_and4_native", "NativeBridge.Incremental.SSRBoolProofFunctions.all_and5_native", "NativeBridge.Incremental.SSRBoolProofFunctions.unlessL_native", "NativeBridge.Incremental.SSRBoolProofFunctions.unlessR_native", "NativeBridge.Incremental.SSRBoolProofFunctions.unless_sym_native", "NativeBridge.Incremental.SSRBoolProofFunctions.bind_unless_native", "NativeBridge.Incremental.SSRBoolProofFunctions.decP_native", "NativeBridge.Incremental.SSRBoolProofFunctions.unless_contra_native"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← proofFunctionNativeRefs body) ++ (← proofFunctionNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

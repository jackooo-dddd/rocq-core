import SSRBoolProofFunctions
set_option autoImplicit false
set_option linter.defProp false
noncomputable section

#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.altP
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.boolP
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.ifP
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.ifPn

namespace NativeBridge.Incremental.SSRBoolIndexed
open NativeBridge
universe u

def altNative (P : Prop) (b c : Bool) : Prop := if c then P else b = false

def altTo (P : Prop) (b c : RBool) (h : Rocq.Corelib.ssr.ssrbool.alt_spec P b c) :
    PLift (altNative P (boolTo b) (boolTo c)) := by
  cases h with
  | AltTrue hp => exact ⟨hp⟩
  | AltFalse hn =>
    have hh := (is_true_agrees _).mp hn
    rw [negb_agrees] at hh
    exact ⟨by cases b <;> simpa [boolTo, altNative] using hh⟩

def altOf (P : Prop) (b : RBool) :
    (c : RBool) → PLift (altNative P (boolTo b) (boolTo c)) → Rocq.Corelib.ssr.ssrbool.alt_spec P b c
  | .true, ⟨h⟩ => .AltTrue P b h
  | .false, ⟨h⟩ => .AltFalse P b ((is_true_agrees _).mpr (by
      rw [negb_agrees]
      cases b <;> simpa [boolTo, altNative] using h))

def altIso (P : Prop) (b c : RBool) :
    Iso (Rocq.Corelib.ssr.ssrbool.alt_spec P b c) (PLift (altNative P (boolTo b) (boolTo c))) where
  to := altTo P b c
  of := altOf P b c
  of_to h := by cases h <;> rfl
  to_of h := Subsingleton.elim _ _

def ifNative (A : Type u) (b : Bool) (vT vF : A) (notB : Prop) (c : Bool) (x : A) : Prop :=
  if c then b = true ∧ x = vT else notB ∧ x = vF

def ifTo (A : Type u) (b : RBool) (vT vF : A) (notB : Prop)
    (c : RBool) (x : A) (h : Rocq.Corelib.ssr.ssrbool.if_spec A b vT vF notB c x) :
      PLift (ifNative A (boolTo b) vT vF notB (boolTo c) x) := by
  cases h with
  | IfSpecTrue hb => exact ⟨(is_true_agrees b).mp hb, rfl⟩
  | IfSpecFalse hb => exact ⟨hb, rfl⟩

def ifOf (A : Type u) (b : RBool) (vT vF : A) (notB : Prop) :
    (c : RBool) → (x : A) → PLift (ifNative A (boolTo b) vT vF notB (boolTo c) x) →
      Rocq.Corelib.ssr.ssrbool.if_spec A b vT vF notB c x
  | .true, _, ⟨h⟩ => h.2.symm ▸ (.IfSpecTrue A b vT vF notB ((is_true_agrees b).mpr h.1))
  | .false, _, ⟨h⟩ => h.2.symm ▸ (.IfSpecFalse A b vT vF notB h.1)

def ifIso (A : Type u) (b : RBool) (vT vF : A) (notB : Prop) (c : RBool) (x : A) :
    Iso (Rocq.Corelib.ssr.ssrbool.if_spec A b vT vF notB c x)
      (PLift (ifNative A (boolTo b) vT vF notB (boolTo c) x)) where
  to := ifTo A b vT vF notB c x
  of := ifOf A b vT vF notB c x
  of_to h := by cases h <;> rfl
  to_of h := Subsingleton.elim _ _

def altP_native (P : Prop) (b : Bool) (h : P ↔ b = true) : PLift (altNative P b b) := by
  cases b
  · exact ⟨rfl⟩
  · exact ⟨h.mpr rfl⟩

def boolP_native (b : Bool) : PLift (altNative (b = true) b b) := by
  cases b <;> exact ⟨rfl⟩

def ifP_native (A : Type u) (b : Bool) (vT vF : A) :
    PLift (ifNative A b vT vF (b = false) b (if b then vT else vF)) := by
  cases b <;> exact ⟨rfl, rfl⟩

def ifPn_native (A : Type u) (b : Bool) (vT vF : A) :
    PLift (ifNative A b vT vF ((!b) = true) b (if b then vT else vF)) := by
  cases b <;> exact ⟨rfl, rfl⟩

theorem altP_agrees (P : Prop) (b : Bool) (h : P ↔ b = true) :
    (altIso P (boolOf b) (boolOf b)).to
      ((@RocqPending.Corelib.ssr.ssrbool.altP NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.altP__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.altP__rocq2lean_obligation_2.statement) P (boolOf b)
        (SSRBoolProofFunctions.reflectNativeOf P b h)) =
      (show PLift (altNative P (boolTo (boolOf b)) (boolTo (boolOf b))) from
        by simpa only [bool_to_of] using altP_native P b h) := Subsingleton.elim _ _

def boolPTo (b : Bool)
    (h : Rocq.Corelib.ssr.ssrbool.alt_spec (Rocq.Corelib.Init.Datatypes.is_true (boolOf b)) (boolOf b) (boolOf b)) :
    PLift (altNative (b = true) b b) := by
  have hh := (altIso _ _ _).to h
  simpa only [bool_to_of, is_true_agrees] using hh

theorem boolP_agrees (b : Bool) :
    boolPTo b ((@RocqPending.Corelib.ssr.ssrbool.boolP NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.is_true_true.statement NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.not_false_is_true.statement NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.altP__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.altP__rocq2lean_obligation_2.statement) (boolOf b)) =
      boolP_native b := Subsingleton.elim _ _

def ifPTo (A : Type u) (b : Bool) (vT vF : A)
    (h : Rocq.Corelib.ssr.ssrbool.if_spec A (boolOf b) vT vF
      (Rocq.Corelib.Init.Logic.eq RBool (boolOf b) .false) (boolOf b)
      (Rocq.Corelib.Init.Datatypes.bool.rec vT vF (boolOf b))) :
    PLift (ifNative A b vT vF (b = false) b (if b then vT else vF)) := by
  have hh := (ifIso A (boolOf b) vT vF _ _ _).to h
  cases b <;> simpa [ifNative, boolTo, boolOf, eq_correspondence] using hh

def ifPnTo (A : Type u) (b : Bool) (vT vF : A)
    (h : Rocq.Corelib.ssr.ssrbool.if_spec A (boolOf b) vT vF
      (Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb (boolOf b))) (boolOf b)
      (Rocq.Corelib.Init.Datatypes.bool.rec vT vF (boolOf b))) :
    PLift (ifNative A b vT vF ((!b) = true) b (if b then vT else vF)) := by
  have hh := (ifIso A (boolOf b) vT vF _ _ _).to h
  simp only [is_true_agrees, negb_agrees, bool_to_of] at hh
  cases b <;> simpa [ifNative, boolTo, boolOf] using hh

theorem ifP_agrees (A : Type u) (b : Bool) (vT vF : A) :
    ifPTo A b vT vF ((@RocqPending.Corelib.ssr.ssrbool.ifP NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.ifP__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.ifP__rocq2lean_obligation_2.statement) A (boolOf b) vT vF) =
      ifP_native A b vT vF := Subsingleton.elim _ _

theorem ifPn_agrees (A : Type u) (b : Bool) (vT vF : A) :
    ifPnTo A b vT vF ((@RocqPending.Corelib.ssr.ssrbool.ifPn NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.ifPn__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.is_true_true.statement NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.ifPn__rocq2lean_obligation_2.statement) A (boolOf b) vT vF) =
      ifPn_native A b vT vF := Subsingleton.elim _ _

end NativeBridge.Incremental.SSRBoolIndexed

open Lean Meta Elab Command
private partial def indexedNativeRefs (e : Expr) (seen : NameSet := {}) : MetaM (Array Name) := do
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
        found := found ++ (← indexedNativeRefs body seen)
  return found


open Lean in
run_cmd Lean.Elab.Command.liftTermElabM do
  for name in ["NativeBridge.Incremental.SSRBoolIndexed.altNative", "NativeBridge.Incremental.SSRBoolIndexed.altP_native", "NativeBridge.Incremental.SSRBoolIndexed.boolP_native", "NativeBridge.Incremental.SSRBoolIndexed.ifNative", "NativeBridge.Incremental.SSRBoolIndexed.ifP_native", "NativeBridge.Incremental.SSRBoolIndexed.ifPn_native"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

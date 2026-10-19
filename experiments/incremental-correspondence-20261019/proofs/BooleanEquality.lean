import Datatypes
noncomputable section
namespace NativeBridge.Incremental
open NativeBridge
universe u

theorem eqTrueTo {b : RBool} (h : Rocq.Corelib.Init.Datatypes.eq_true b) :
    boolTo b = true := by cases h; rfl
theorem eqTrueOf {b : RBool} (h : boolTo b = true) :
    Rocq.Corelib.Init.Datatypes.eq_true b := by
  cases b
  · exact .is_eq_true
  · change false = true at h
    cases h
def eqTrueIso (b : RBool) :
    Iso (Rocq.Corelib.Init.Datatypes.eq_true b) (boolTo b = true) :=
  ⟨eqTrueTo, eqTrueOf, fun _ => rfl, fun _ => rfl⟩

theorem eq_true_rec_native (P : Bool → Type) (b : RBool)
    (h : P true) (e : Rocq.Corelib.Init.Datatypes.eq_true b) :
    Rocq.Corelib.Init.Datatypes.eq_true_rec (fun b => P (boolTo b)) h b e =
      Eq.ndrec h (eqTrueTo e).symm := by
  cases e; rfl

theorem eq_true_rect_native (P : Bool → Sort u) (b : RBool)
    (h : P true) (e : Rocq.Corelib.Init.Datatypes.eq_true b) :
    Rocq.Corelib.Init.Datatypes.eq_true_rect (fun b => P (boolTo b)) h b e =
      Eq.ndrec h (eqTrueTo e).symm := by
  cases e; rfl

theorem eq_true_rew_native (P : Bool → Sort u) (b : RBool)
    (h : P true) (e : Rocq.Corelib.Init.Datatypes.eq_true b) :
    Rocq.Corelib.Init.Datatypes.eq_true_rew (fun b => P (boolTo b)) h b e =
      Eq.ndrec h (eqTrueTo e).symm := by
  cases e; rfl

theorem eq_true_rec_r_native (P : Bool → Type) (b : RBool)
    (h : P (boolTo b)) (e : Rocq.Corelib.Init.Datatypes.eq_true b) :
    Rocq.Corelib.Init.Datatypes.eq_true_rec_r (fun b => P (boolTo b)) b h e =
      Eq.ndrec h (eqTrueTo e) := by
  cases e; rfl

theorem eq_true_rect_r_native (P : Bool → Sort u) (b : RBool)
    (h : P (boolTo b)) (e : Rocq.Corelib.Init.Datatypes.eq_true b) :
    Rocq.Corelib.Init.Datatypes.eq_true_rect_r (fun b => P (boolTo b)) b h e =
      Eq.ndrec h (eqTrueTo e) := by
  cases e; rfl

theorem eq_true_rew_r_native (P : Bool → Sort u) (b : RBool)
    (h : P (boolTo b)) (e : Rocq.Corelib.Init.Datatypes.eq_true b) :
    Rocq.Corelib.Init.Datatypes.eq_true_rew_r b (fun b => P (boolTo b)) h e =
      Eq.ndrec h (eqTrueTo e) := by
  cases e; rfl

def eqTrueNativeRec (P : (b : Bool) → b = true → Sort u)
    (h : P true rfl) (b : Bool) (e : b = true) : P b e := by
  cases e
  exact h

def eqTrueNativeRecBack (P : (b : Bool) → b = true → Sort u)
    (b : Bool) (e : b = true) (h : P b e) : P true rfl := by
  cases e
  exact h

theorem eq_true_rew_dep_native (P : (b : Bool) → b = true → Sort u)
    (h : P true rfl) (b : RBool) (e : Rocq.Corelib.Init.Datatypes.eq_true b) :
    Rocq.Corelib.Init.Datatypes.eq_true_rew_dep
      (fun b e => P (boolTo b) (eqTrueTo e)) h b e =
      eqTrueNativeRec P h (boolTo b) (eqTrueTo e) := by
  cases e; rfl

theorem eq_true_rew_fwd_dep_native (P : (b : Bool) → b = true → Sort u)
    (b : RBool) (e : Rocq.Corelib.Init.Datatypes.eq_true b)
    (h : P (boolTo b) (eqTrueTo e)) :
    Rocq.Corelib.Init.Datatypes.eq_true_rew_fwd_dep b e
      (fun b e => P (boolTo b) (eqTrueTo e)) h =
      eqTrueNativeRecBack P (boolTo b) (eqTrueTo e) h := by
  cases e; rfl


def eqTrueIndNative : Prop :=
  ∀ (P : Bool → Prop), P true → ∀ b, b = true → P b
def eqTrueIndRNative : Prop :=
  ∀ (P : Bool → Prop) (b : Bool), P b → b = true → P true

theorem eq_true_ind_native :
    Rocq.Corelib.Init.Datatypes.eq_true_ind.statement ↔ eqTrueIndNative := by
  constructor
  · intro hs P h b e
    have eb : Rocq.Corelib.Init.Datatypes.eq_true (boolOf b) :=
      eqTrueOf (by simpa only [bool_to_of] using e)
    simpa only [bool_to_of] using hs (fun x => P (boolTo x)) h (boolOf b) eb
  · intro hn P h b e
    have ht : (fun x => P (boolOf x)) true := h
    simpa only [bool_of_to] using hn (fun x => P (boolOf x)) ht (boolTo b) (eqTrueTo e)

theorem eq_true_sind_native :
    Rocq.Corelib.Init.Datatypes.eq_true_sind.statement ↔ eqTrueIndNative :=
  eq_true_ind_native

theorem eq_true_ind_r_native :
    Rocq.Corelib.Init.Datatypes.eq_true_ind_r.statement ↔ eqTrueIndRNative := by
  constructor
  · intro hs P b h e
    have eb : Rocq.Corelib.Init.Datatypes.eq_true (boolOf b) :=
      eqTrueOf (by simpa only [bool_to_of] using e)
    exact hs (fun x => P (boolTo x)) (boolOf b) (by simpa only [bool_to_of] using h) eb
  · intro hn P b h e
    exact hn (fun x => P (boolOf x)) (boolTo b) (by simpa only [bool_of_to] using h) (eqTrueTo e)

theorem eq_true_ind_closed : Rocq.Corelib.Init.Datatypes.eq_true_ind.statement :=
  eq_true_ind_native.mpr (fun P h b e => e ▸ h)
theorem eq_true_sind_closed : Rocq.Corelib.Init.Datatypes.eq_true_sind.statement :=
  eq_true_sind_native.mpr (fun P h b e => e ▸ h)
theorem eq_true_ind_r_closed : Rocq.Corelib.Init.Datatypes.eq_true_ind_r.statement :=
  eq_true_ind_r_native.mpr (fun P b h e => e ▸ h)

end NativeBridge.Incremental

open Lean Meta in
private partial def dependentNativeRefs (e : Expr) (seen : NameSet := {}) : MetaM (Array Name) := do
  let mut found : Array Name := #[]
  let mut seen := seen
  for n in e.getUsedConstants do
    if seen.contains n then continue
    seen := seen.insert n
    let s := n.toString
    if s.startsWith "Rocq." || s.startsWith "RocqPending." || s.startsWith "Rocq2Lean." then
      found := found.push n
    else if s.startsWith "NativeBridge." then
      if let some body := (← getConstInfo n).value? then
        found := found ++ (← dependentNativeRefs body seen)
  return found

open Lean in
run_cmd Lean.Elab.Command.liftTermElabM do
  for name in ["eqTrueIndNative", "eqTrueIndRNative"] do
    let n := ("NativeBridge.Incremental." ++ name).toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native proposition definition"
    let refs ← dependentNativeRefs body
    unless refs.isEmpty do throwError "Residual source references in {n}: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

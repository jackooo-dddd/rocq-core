import Logic
noncomputable section
namespace NativeBridge.Incremental
open NativeBridge
universe u v

theorem eq_rec_native {A : Sort u} (x : A) (P : A → Type)
    (h : P x) (y : A) (e : ME A x y) :
    Rocq.Corelib.Init.Logic.eq_rec A x P h y e = Eq.ndrec h (eqTo e) := by
  cases e; rfl

theorem eq_rew_native {A : Sort u} (x : A) (P : A → Sort v)
    (h : P x) (y : A) (e : ME A x y) :
    Rocq.Corelib.Init.Logic.eq_rew A x P h y e = Eq.ndrec h (eqTo e) := by
  cases e; rfl

theorem eq_rew_r_native {A : Sort u} (x y : A) (P : A → Sort v)
    (h : P y) (e : ME A x y) :
    Rocq.Corelib.Init.Logic.eq_rew_r A x y P h e =
      Eq.ndrec h (eqTo e).symm := by
  cases e; rfl

theorem eq_rect_r_obligation :
    Rocq.Corelib.Init.Logic.eq_rect_r__rocq2lean_obligation_1.statement.{u,v} := by
  intro A x P h y e
  cases e
  exact .eq_refl A x

theorem eq_rec_r_obligation :
    Rocq.Corelib.Init.Logic.eq_rec_r__rocq2lean_obligation_1.statement.{u} := by
  intro A x P h y e
  cases e
  exact .eq_refl A x

def eqRectRClosed {A : Sort u} (x : A) (P : A → Sort v)
    (h : P x) (y : A) (e : ME A y x) : P y :=
  @RocqPending.Corelib.Init.Logic.eq_rect_r eq_rect_r_obligation A x P h y e

def eqRecRClosed {A : Sort u} (x : A) (P : A → Type)
    (h : P x) (y : A) (e : ME A y x) : P y :=
  @RocqPending.Corelib.Init.Logic.eq_rec_r eq_rec_r_obligation A x P h y e

theorem eq_rect_r_native {A : Sort u} (x : A) (P : A → Sort v)
    (h : P x) (y : A) (e : ME A y x) :
    @RocqPending.Corelib.Init.Logic.eq_rect_r eq_rect_r_obligation A x P h y e =
      Eq.ndrec h (eqTo e).symm := by
  cases e; rfl

theorem eq_rec_r_native {A : Sort u} (x : A) (P : A → Type)
    (h : P x) (y : A) (e : ME A y x) :
    @RocqPending.Corelib.Init.Logic.eq_rec_r eq_rec_r_obligation A x P h y e =
      Eq.ndrec h (eqTo e).symm := by
  cases e; rfl

-- A native carrier can be used directly by pulling its motive back along any Iso.
theorem eq_rew_across_iso {A : Sort u} {B : Sort v} (i : Iso A B)
    {x y : A} (P : B → Sort _) (h : P (i.to x)) (e : ME A x y) :
    Rocq.Corelib.Init.Logic.eq_rew A x (fun a => P (i.to a)) h y e =
      Eq.ndrec h (congrArg i.to (eqTo e)) := by
  cases e; rfl


theorem eq_sym_closed : Rocq.Corelib.Init.Logic.eq_sym.statement.{u} := by
  intro A x y h
  exact eqOf (eqTo h).symm
theorem eq_sym_involutive_obligation :
    Rocq.Corelib.Init.Logic.eq_sym_involutive__rocq2lean_obligation_1.statement.{u} := by
  intro A x y h
  exact h
theorem eq_sym_involutive_closed :
    @RocqPending.Corelib.Init.Logic.eq_sym_involutive.statement.{u}
      eq_sym_involutive_obligation := by
  intro A x y h
  exact eqOf (Subsingleton.elim _ _)

def eqRewRDepClosed {A : Sort u} (x y : A)
    (P : (x : A) → ME A x y → Sort v)
    (h : P y (.eq_refl A y)) (e : ME A x y) : P x e :=
  @RocqPending.Corelib.Init.Logic.eq_rew_r_dep
    eq_sym_closed eq_sym_involutive_obligation eq_sym_involutive_closed A x y P h e

def nativeEqRightRec {A : Sort u} (y : A) (P : (x : A) → x = y → Sort v)
    (h : P y rfl) (x : A) (e : x = y) : P x e := by
  cases e
  exact h

theorem eq_rew_r_dep_native {A : Sort u} (x y : A)
    (P : (x : A) → x = y → Sort v) (h : P y rfl) (e : ME A x y) :
    @RocqPending.Corelib.Init.Logic.eq_rew_r_dep
      eq_sym_closed eq_sym_involutive_obligation eq_sym_involutive_closed
      A x y (fun x e => P x (eqTo e)) h e =
        nativeEqRightRec y P h x (eqTo e) := by
  cases e
  rfl

def eqSymInvolutiveNative : Prop :=
  ∀ (A : Sort u) (x y : A) (h : x = y), h.symm.symm = h

theorem eq_sym_involutive_native :
    (@RocqPending.Corelib.Init.Logic.eq_sym_involutive.statement.{u}
      eq_sym_involutive_obligation) ↔ eqSymInvolutiveNative.{u} := by
  constructor
  · intro _ A x y h
    rfl
  · intro _ 
    exact eq_sym_involutive_closed

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
  for name in ["eqSymInvolutiveNative"] do
    let n := ("NativeBridge.Incremental." ++ name).toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native proposition definition"
    let refs ← dependentNativeRefs body
    unless refs.isEmpty do throwError "Residual source references in {n}: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

import Interface_Program_Wf
noncomputable section
namespace NativeBridge.Incremental.ProgramWellFounded
universe u v w
theorem accTo {A : Type u} {R : A → A → Prop} {x : A}
    (a : Rocq.Corelib.Init.Wf.Acc A R x) : Acc R x :=
  Rocq.Corelib.Init.Wf.Acc.rec (motive := fun x _ => Acc R x)
    (fun x _ ih => Acc.intro x ih) a
theorem accOf {A : Type u} {R : A → A → Prop} {x : A}
    (a : Acc R x) : Rocq.Corelib.Init.Wf.Acc A R x :=
  Acc.rec (motive := fun x _ => Rocq.Corelib.Init.Wf.Acc A R x)
    (fun x _ ih => Rocq.Corelib.Init.Wf.Acc.Acc_intro A R x ih) a
theorem wellFoundedTo {A : Type u} {R : A → A → Prop}
    (h : Rocq.Corelib.Init.Wf.well_founded A R) : WellFounded R :=
  ⟨fun x => accTo (h x)⟩
theorem wellFoundedOf {A : Type u} {R : A → A → Prop}
    (h : WellFounded R) : Rocq.Corelib.Init.Wf.well_founded A R :=
  fun x => accOf (h.apply x)

theorem proj2_witness : Rocq.Corelib.Init.Specif.proj2_sig.statement.{u} := by
  intro A P e
  cases e with
  | exist x h => exact h
theorem fixF_eq_witness : Rocq.Corelib.Program.Wf.Fix_F_eq__rocq2lean_obligation_1.statement.{u,v} := by
  intro A R P F x r y
  exact proj2_witness A (fun y => R y x) y
theorem unfold_witness : Rocq.Corelib.Program.Wf.F_unfold__rocq2lean_obligation_1.statement.{u,v} := by
  intro A P R F x r y
  exact proj2_witness A (fun y => R y x) y

def NativeStep (R : A → A → Prop) (P : A → Type v) :=
  (x : A) → ((y : {y // R y x}) → P y.val) → P x
def sourceStep {A : Type u} (R : A → A → Prop) (P : A → Type v) (G : NativeStep R P)
    (x : A) (rec : (y : Rocq.Corelib.Init.Specif.sig A (fun y => R y x)) →
      P (Rocq.Corelib.Init.Specif.proj1_sig A (fun y => R y x) y)) : P x :=
  G x (fun y => rec (sigOf y))
def fixFSubtype {A : Type u} (R : A → A → Prop) (P : A → Type v) (G : NativeStep R P)
    (x : A) (a : Acc R x) : P x :=
  WellFounded.fixF (fun x rec => G x (fun y => rec y.val y.property)) x a
def fixSubtype {A : Type u} (R : A → A → Prop) (wf : WellFounded R)
    (P : A → Type v) (G : NativeStep R P) (x : A) : P x :=
  wf.fix (fun x rec => G x (fun y => rec y.val y.property)) x
def closedFixF {A : Type u} (R : A → A → Prop) (P : A → Type v) :=
  @RocqPending.Corelib.Program.Wf.Fix_F_sub proj2_witness A R P
def closedFix {A : Type u} (R : A → A → Prop) (wf : Rocq.Corelib.Init.Wf.well_founded A R)
    (P : A → Type v) :=
  @RocqPending.Corelib.Program.Wf.Fix_sub proj2_witness A R wf P

theorem fixF_agrees {A : Type u} (R : A → A → Prop) (P : A → Type v)
    (G : NativeStep R P) (x : A) (a : Rocq.Corelib.Init.Wf.Acc A R x) :
    @RocqPending.Corelib.Program.Wf.Fix_F_sub proj2_witness A R P (sourceStep R P G) x a =
      fixFSubtype R P G x (accTo a) := by
  induction a with
  | Acc_intro x h ih =>
    unfold fixFSubtype
    rw [WellFounded.fixF_eq]
    change G x (fun y => @RocqPending.Corelib.Program.Wf.Fix_F_sub proj2_witness A R P
      (sourceStep R P G) y.val (h y.val y.property)) = _
    apply congrArg (G x)
    funext y
    exact ih y.val y.property
theorem fix_agrees {A : Type u} (R : A → A → Prop)
    (wf : Rocq.Corelib.Init.Wf.well_founded A R) (P : A → Type v)
    (G : NativeStep R P) (x : A) :
    @RocqPending.Corelib.Program.Wf.Fix_sub proj2_witness A R wf P (sourceStep R P G) x =
      fixSubtype R (wellFoundedTo wf) P G x :=
  fixF_agrees R P G x (wf x)

theorem mr_agrees (T : Sort u) (M : Sort v) (R : M → M → Prop) (m : T → M) :
    Rocq.Corelib.Program.Wf.MR T M R m = InvImage R m := rfl
def measureStatement : Prop :=
  ∀ (T : Type u) (M : Type v) (R : M → M → Prop), WellFounded R →
    ∀ m : T → M, WellFounded (InvImage R m)
theorem measureStatement_proof : measureStatement.{u,v} :=
  fun _ _ _ wf m => InvImage.wf m wf
theorem measure_wf_proof : Rocq.Corelib.Program.Wf.measure_wf.statement.{u,v} :=
  fun _ _ _ wf m => wellFoundedOf (InvImage.wf m (wellFoundedTo wf))
theorem measure_wf_correspondence :
    Rocq.Corelib.Program.Wf.measure_wf.statement.{u,v} ↔ measureStatement.{u,v} :=
  ⟨fun _ => measureStatement_proof, fun _ => measure_wf_proof⟩

theorem sourceFixF_unfold {A : Type u} (R : A → A → Prop) (P : A → Type v)
    (F : (x : A) → ((y : Rocq.Corelib.Init.Specif.sig A (fun y => R y x)) →
      P (Rocq.Corelib.Init.Specif.proj1_sig A (fun y => R y x) y)) → P x)
    (x : A) (a : Rocq.Corelib.Init.Wf.Acc A R x) :
    closedFixF R P F x a =
      F x (fun y => closedFixF R P F
        (Rocq.Corelib.Init.Specif.proj1_sig A (fun y => R y x) y)
        (accOf ((accTo a).inv (proj2_witness A (fun y => R y x) y)))) := by
  cases a
  rfl
theorem f_unfold_proof :
    @RocqPending.Corelib.Program.Wf.F_unfold.statement.{u,v} proj2_witness unfold_witness := by
  intro A P R F x a
  exact eqOf (sourceFixF_unfold R P F x a)
theorem fix_f_eq_proof :
    @RocqPending.Corelib.Program.Wf.Fix_F_eq.statement.{u,v} fixF_eq_witness proj2_witness := by
  intro A R P F x a
  exact eqOf (sourceFixF_unfold R P F x a).symm
theorem fix_f_inv_proof :
    @RocqPending.Corelib.Program.Wf.Fix_F_inv.statement.{u,v} proj2_witness := by
  intro A R wf P F hext x r s
  exact eqOf rfl
theorem eq_fix_f_sub_proof :
    @RocqPending.Corelib.Program.Wf.eq_Fix_F_sub.statement.{u,v} proj2_witness := by
  intro A P R wf F hext x r s
  exact eqOf rfl
theorem fix_eq_proof :
    @RocqPending.Corelib.Program.Wf.Fix_eq.statement.{u,v} proj2_witness := by
  intro A R wf P F hext x
  exact eqOf (sourceFixF_unfold R P F x (wf x))
theorem fix_sub_eq_proof :
    @RocqPending.Corelib.Program.Wf.fix_sub_eq.statement.{u,v} proj2_witness := fix_eq_proof

def nativeStep {A : Type u} (R : A → A → Prop) (P : A → Type v)
    (F : (x : A) → ((y : Rocq.Corelib.Init.Specif.sig A (fun y => R y x)) →
      P (Rocq.Corelib.Init.Specif.proj1_sig A (fun y => R y x) y)) → P x) : NativeStep R P :=
  fun x rec => F x (fun y => rec (sigTo y))
theorem sourceStep_nativeStep {A : Type u} (R : A → A → Prop) (P : A → Type v) (F) :
    sourceStep R P (nativeStep R P F) = F := by
  funext x rec
  unfold sourceStep nativeStep
  apply congrArg (F x)
  funext y
  cases y
  rfl
theorem nativeStep_sourceStep {A : Type u} (R : A → A → Prop) (P : A → Type v) (G : NativeStep R P) :
    nativeStep R P (sourceStep R P G) = G := by
  funext x rec
  unfold sourceStep nativeStep
  apply congrArg (G x)
  funext y
  cases y
  rfl

def unfoldStatement : Prop :=
  ∀ (A : Type u) (P : A → Type v) (R : A → A → Prop) (G : NativeStep R P) (x : A) (a : Acc R x),
    fixFSubtype R P G x a = G x (fun y => fixFSubtype R P G y.val (a.inv y.property))
theorem unfoldStatement_proof : unfoldStatement.{u,v} := by
  intro A P R G x a
  exact WellFounded.fixF_eq _ x a
def fixFEquation : Prop :=
  ∀ (A : Type u) (R : A → A → Prop) (P : A → Type v) (G : NativeStep R P) (x : A) (a : Acc R x),
    G x (fun y => fixFSubtype R P G y.val (a.inv y.property)) = fixFSubtype R P G x a
theorem fixFEquation_proof : fixFEquation.{u,v} := by
  intro A R P G x a
  exact (unfoldStatement_proof A P R G x a).symm
def extensional (R : A → A → Prop) (P : A → Type v) (G : NativeStep R P) : Prop :=
  ∀ x g h, (∀ y, g y = h y) → G x g = G x h
def extensionalGeneral (R : A → A → Prop) (P : A → Type v) (G : NativeStep R P) : Prop :=
  ∀ x g h, (∀ y p q, g ⟨y,p⟩ = h ⟨y,q⟩) → G x g = G x h
def fixFIndependent : Prop :=
  ∀ (A : Type u) (R : A → A → Prop), WellFounded R →
    ∀ (P : A → Type v) (G : NativeStep R P), extensional R P G →
      ∀ (x : A) (r s : Acc R x), fixFSubtype R P G x r = fixFSubtype R P G x s
theorem fixFIndependent_proof : fixFIndependent.{u,v} := by
  intro A R wf P G hext x r s
  rfl
def fixFIndependentGeneral : Prop :=
  ∀ (A : Type u) (P : A → Type v) (R : A → A → Prop), WellFounded R →
    ∀ (G : NativeStep R P), extensionalGeneral R P G →
      ∀ (x : A) (r s : Acc R x), fixFSubtype R P G x r = fixFSubtype R P G x s
theorem fixFIndependentGeneral_proof : fixFIndependentGeneral.{u,v} := by
  intro A P R wf G hext x r s
  rfl
def fixEquation : Prop :=
  ∀ (A : Type u) (R : A → A → Prop) (wf : WellFounded R)
    (P : A → Type v) (G : NativeStep R P), extensional R P G →
      ∀ x, fixSubtype R wf P G x = G x (fun y => fixSubtype R wf P G y.val)
theorem fixEquation_proof : fixEquation.{u,v} := by
  intro A R wf P G hext x
  exact wf.fix_eq _ x

def unfoldClosed : Prop := @RocqPending.Corelib.Program.Wf.F_unfold.statement.{u,v} proj2_witness unfold_witness
def fixFEquationClosed : Prop := @RocqPending.Corelib.Program.Wf.Fix_F_eq.statement.{u,v} fixF_eq_witness proj2_witness
def fixFIndependentClosed : Prop := @RocqPending.Corelib.Program.Wf.Fix_F_inv.statement.{u,v} proj2_witness
def fixFIndependentGeneralClosed : Prop := @RocqPending.Corelib.Program.Wf.eq_Fix_F_sub.statement.{u,v} proj2_witness
def fixEquationClosed : Prop := @RocqPending.Corelib.Program.Wf.Fix_eq.statement.{u,v} proj2_witness
def fixSubEquationClosed : Prop := @RocqPending.Corelib.Program.Wf.fix_sub_eq.statement.{u,v} proj2_witness

theorem f_unfold_correspondence :
    @RocqPending.Corelib.Program.Wf.F_unfold.statement.{u,v} proj2_witness unfold_witness ↔ unfoldStatement.{u,v} :=
  ⟨fun _ => unfoldStatement_proof, fun _ => f_unfold_proof⟩
theorem fix_f_eq_correspondence :
    @RocqPending.Corelib.Program.Wf.Fix_F_eq.statement.{u,v} fixF_eq_witness proj2_witness ↔ fixFEquation.{u,v} :=
  ⟨fun _ => fixFEquation_proof, fun _ => fix_f_eq_proof⟩
theorem fix_f_inv_correspondence :
    @RocqPending.Corelib.Program.Wf.Fix_F_inv.statement.{u,v} proj2_witness ↔ fixFIndependent.{u,v} :=
  ⟨fun _ => fixFIndependent_proof, fun _ => fix_f_inv_proof⟩
theorem eq_fix_f_sub_correspondence :
    @RocqPending.Corelib.Program.Wf.eq_Fix_F_sub.statement.{u,v} proj2_witness ↔ fixFIndependentGeneral.{u,v} :=
  ⟨fun _ => fixFIndependentGeneral_proof, fun _ => eq_fix_f_sub_proof⟩
theorem fix_eq_correspondence :
    @RocqPending.Corelib.Program.Wf.Fix_eq.statement.{u,v} proj2_witness ↔ fixEquation.{u,v} :=
  ⟨fun _ => fixEquation_proof, fun _ => fix_eq_proof⟩
theorem fix_sub_eq_correspondence :
    @RocqPending.Corelib.Program.Wf.fix_sub_eq.statement.{u,v} proj2_witness ↔ fixEquation.{u,v} :=
  ⟨fun _ => fixEquation_proof, fun _ => fix_sub_eq_proof⟩

end NativeBridge.Incremental.ProgramWellFounded

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
  for name in ["InvImage", "NativeBridge.Incremental.ProgramWellFounded.fixEquation", "NativeBridge.Incremental.ProgramWellFounded.fixFEquation", "NativeBridge.Incremental.ProgramWellFounded.fixFIndependent", "NativeBridge.Incremental.ProgramWellFounded.fixFIndependentGeneral", "NativeBridge.Incremental.ProgramWellFounded.fixFSubtype", "NativeBridge.Incremental.ProgramWellFounded.fixSubtype", "NativeBridge.Incremental.ProgramWellFounded.measureStatement", "NativeBridge.Incremental.ProgramWellFounded.unfoldStatement"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

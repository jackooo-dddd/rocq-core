import WellFounded
noncomputable section
namespace NativeBridge.Incremental.WellFoundedStatements
universe u v

def accInduction : Prop :=
  ∀ (A : Type u) (R : A → A → Prop) (P : A → Prop),
    (∀ x, (∀ y, R y x → Acc R y) → (∀ y, R y x → P y) → P x) →
    ∀ x, Acc R x → P x
theorem accInduction_proof : accInduction.{u} := by
  intro A R P step x a
  induction a with
  | intro x h ih => exact step x h ih
def accGenerator : Prop :=
  ∀ (A : Type u) (R : A → A → Prop) (_n : Nat), WellFounded R → WellFounded R
theorem accGenerator_proof : accGenerator.{u} := fun _ _ _ wf => wf
def accInverse : Prop :=
  ∀ (A : Type u) (R : A → A → Prop) (x : A), Acc R x → ∀ y, R y x → Acc R y
theorem accInverse_proof : accInverse.{u} := fun _ _ _ a _ h => a.inv h
def wellFoundedInduction : Prop :=
  ∀ (A : Type u) (R : A → A → Prop), WellFounded R →
    ∀ (P : A → Prop), (∀ x, (∀ y, R y x → P y) → P x) → ∀ a, P a
theorem wellFoundedInduction_proof : wellFoundedInduction.{u} :=
  fun _ _ wf _ step a => wf.induction a step

def fixFEquation : Prop :=
  ∀ (A : Type u) (R : A → A → Prop) (P : A → Type v)
    (F : (x : A) → ((y : A) → R y x → P y) → P x) (x : A) (a : Acc R x),
    F x (fun y h => WellFounded.fixF F y (a.inv h)) = WellFounded.fixF F x a
theorem fixFEquation_proof : fixFEquation.{u,v} := by
  intro A R P F x a
  exact (WellFounded.fixF_eq F x a).symm
def extensional (R : A → A → Prop) (P : A → Type v)
    (F : (x : A) → ((y : A) → R y x → P y) → P x) : Prop :=
  ∀ x f g, (∀ y h, f y h = g y h) → F x f = F x g
def extensionalGeneral (R : A → A → Prop) (P : A → Type v)
    (F : (x : A) → ((y : A) → R y x → P y) → P x) : Prop :=
  ∀ x f g, (∀ y p q, f y p = g y q) → F x f = F x g
def fixFIndependent : Prop :=
  ∀ (A : Type u) (R : A → A → Prop), WellFounded R →
    ∀ (P : A → Type v) (F : (x : A) → ((y : A) → R y x → P y) → P x),
      extensional R P F →
      ∀ (x : A) (r s : Acc R x), WellFounded.fixF F x r = WellFounded.fixF F x s
def fixFIndependentGeneral : Prop :=
  ∀ (A : Type u) (R : A → A → Prop), WellFounded R →
    ∀ (P : A → Type v) (F : (x : A) → ((y : A) → R y x → P y) → P x),
      extensionalGeneral R P F →
      ∀ (x : A) (r s : Acc R x), WellFounded.fixF F x r = WellFounded.fixF F x s
theorem fixFIndependent_proof : fixFIndependent.{u,v} := by intro A R wf P F hext x r s; rfl
theorem fixFIndependentGeneral_proof : fixFIndependentGeneral.{u,v} := by intro A R wf P F hext x r s; rfl
def fixEquation : Prop :=
  ∀ (A : Type u) (R : A → A → Prop) (wf : WellFounded R)
    (P : A → Type v) (F : (x : A) → ((y : A) → R y x → P y) → P x),
    extensional R P F → ∀ x, wf.fix F x = F x (fun y _ => wf.fix F y)
def fixEquationGeneral : Prop :=
  ∀ (A : Type u) (R : A → A → Prop) (wf : WellFounded R)
    (P : A → Type v) (F : (x : A) → ((y : A) → R y x → P y) → P x),
    extensionalGeneral R P F → ∀ x, wf.fix F x = F x (fun y _ => wf.fix F y)
theorem fixEquation_proof : fixEquation.{u,v} := by
  intro A R wf P F _ x
  exact wf.fix_eq F x
theorem fixEquationGeneral_proof : fixEquationGeneral.{u,v} := by
  intro A R wf P F _ x
  exact wf.fix_eq F x

theorem acc_ind_proof : Rocq.Corelib.Init.Wf.Acc_ind.statement.{u} := by
  intro A R P step x a
  induction a with
  | Acc_intro x h ih => exact step x h ih
theorem acc_sind_proof : Rocq.Corelib.Init.Wf.Acc_sind.statement.{u} := acc_ind_proof
theorem acc_intro_generator_proof : Rocq.Corelib.Init.Wf.Acc_intro_generator.statement.{u} := fun _ _ _ wf => wf
theorem acc_inv_proof : Rocq.Corelib.Init.Wf.Acc_inv.statement.{u} := by
  intro A R x a y h
  cases a with
  | Acc_intro _ f => exact f y h
theorem well_founded_ind_proof : Rocq.Corelib.Init.Wf.well_founded_ind.statement.{u} :=
  fun _ _ wf _ step a => (wellFoundedTo wf).induction a step
theorem fix_f_eq_proof : Rocq.Corelib.Init.Wf.Fix_F_eq.statement.{u,v} := by
  intro A R P F x a
  apply eqOf
  cases a
  rfl
theorem fix_f_inv_proof : Rocq.Corelib.Init.Wf.Fix_F_inv.statement.{u,v} := by intro A R wf P F hext x r s; exact eqOf rfl
theorem fix_f_inv_gen_proof : Rocq.Corelib.Init.Wf.Fix_F_inv_gen.statement.{u,v} := by intro A R wf P F hext x r s; exact eqOf rfl
theorem fix_eq_proof : Rocq.Corelib.Init.Wf.Fix_eq.statement.{u,v} := by
  intro A R wf P F _ x
  apply eqOf
  simpa only [fix_agrees] using (wellFoundedTo wf).fix_eq F x
theorem fix_eq_gen_proof : Rocq.Corelib.Init.Wf.Fix_eq_gen.statement.{u,v} := by
  intro A R wf P F _ x
  apply eqOf
  simpa only [fix_agrees] using (wellFoundedTo wf).fix_eq F x

theorem acc_ind_correspondence : Rocq.Corelib.Init.Wf.Acc_ind.statement.{u} ↔ accInduction.{u} :=
  ⟨fun _ => accInduction_proof, fun _ => acc_ind_proof⟩
theorem acc_sind_correspondence : Rocq.Corelib.Init.Wf.Acc_sind.statement.{u} ↔ accInduction.{u} :=
  ⟨fun _ => accInduction_proof, fun _ => acc_sind_proof⟩
theorem acc_intro_generator_correspondence : Rocq.Corelib.Init.Wf.Acc_intro_generator.statement.{u} ↔ accGenerator.{u} :=
  ⟨fun _ => accGenerator_proof, fun _ => acc_intro_generator_proof⟩
theorem acc_inv_correspondence : Rocq.Corelib.Init.Wf.Acc_inv.statement.{u} ↔ accInverse.{u} :=
  ⟨fun _ => accInverse_proof, fun _ => acc_inv_proof⟩
theorem well_founded_ind_correspondence : Rocq.Corelib.Init.Wf.well_founded_ind.statement.{u} ↔ wellFoundedInduction.{u} :=
  ⟨fun _ => wellFoundedInduction_proof, fun _ => well_founded_ind_proof⟩
theorem fix_f_eq_correspondence : Rocq.Corelib.Init.Wf.Fix_F_eq.statement.{u,v} ↔ fixFEquation.{u,v} :=
  ⟨fun _ => fixFEquation_proof, fun _ => fix_f_eq_proof⟩
theorem fix_f_inv_correspondence : Rocq.Corelib.Init.Wf.Fix_F_inv.statement.{u,v} ↔ fixFIndependent.{u,v} :=
  ⟨fun _ => fixFIndependent_proof, fun _ => fix_f_inv_proof⟩
theorem fix_f_inv_gen_correspondence : Rocq.Corelib.Init.Wf.Fix_F_inv_gen.statement.{u,v} ↔ fixFIndependentGeneral.{u,v} :=
  ⟨fun _ => fixFIndependentGeneral_proof, fun _ => fix_f_inv_gen_proof⟩
theorem fix_eq_correspondence : Rocq.Corelib.Init.Wf.Fix_eq.statement.{u,v} ↔ fixEquation.{u,v} :=
  ⟨fun _ => fixEquation_proof, fun _ => fix_eq_proof⟩
theorem fix_eq_gen_correspondence : Rocq.Corelib.Init.Wf.Fix_eq_gen.statement.{u,v} ↔ fixEquationGeneral.{u,v} :=
  ⟨fun _ => fixEquationGeneral_proof, fun _ => fix_eq_gen_proof⟩

def accDependentInduction : Prop :=
  ∀ (A : Type u) (R : A → A → Prop) (P : (x : A) → Acc R x → Prop),
    (∀ x (a : ∀ y, R y x → Acc R y), (∀ y h, P y (a y h)) → P x (Acc.intro x a)) →
    ∀ x a, P x a
theorem accDependentInduction_proof : accDependentInduction.{u} := by
  intro A R P step x a
  induction a with
  | intro x h ih => exact step x h ih
theorem acc_inv_dep_witness : Rocq.Corelib.Init.Wf.Acc_inv_dep__rocq2lean_obligation_1.statement.{u} :=
  fun A R _P x a _ih => Rocq.Corelib.Init.Wf.Acc.Acc_intro A R x a
def accInvDepClosed : Prop := @RocqPending.Corelib.Init.Wf.Acc_inv_dep.statement.{u} acc_inv_dep_witness
theorem acc_inv_dep_proof : @RocqPending.Corelib.Init.Wf.Acc_inv_dep.statement.{u} acc_inv_dep_witness := by
  intro A R P step x a
  induction a with
  | Acc_intro x h ih => exact step x h ih
theorem acc_inv_dep_correspondence :
    @RocqPending.Corelib.Init.Wf.Acc_inv_dep.statement.{u} acc_inv_dep_witness ↔ accDependentInduction.{u} :=
  ⟨fun _ => accDependentInduction_proof, fun _ => acc_inv_dep_proof⟩

end NativeBridge.Incremental.WellFoundedStatements

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
  for name in ["NativeBridge.Incremental.WellFoundedStatements.accDependentInduction", "NativeBridge.Incremental.WellFoundedStatements.accGenerator", "NativeBridge.Incremental.WellFoundedStatements.accInduction", "NativeBridge.Incremental.WellFoundedStatements.accInverse", "NativeBridge.Incremental.WellFoundedStatements.fixEquation", "NativeBridge.Incremental.WellFoundedStatements.fixEquationGeneral", "NativeBridge.Incremental.WellFoundedStatements.fixFEquation", "NativeBridge.Incremental.WellFoundedStatements.fixFIndependent", "NativeBridge.Incremental.WellFoundedStatements.fixFIndependentGeneral", "NativeBridge.Incremental.WellFoundedStatements.wellFoundedInduction"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

import LogicElimination
open Lean Meta Elab Term
elab "closed_logic% " n:ident : term => do
  let mut value ← mkConstWithFreshMVarLevels n.getId
  let mut ty ← inferType value
  while let .forallE _ domain body _ := ty do
    let some name := domain.getAppFn.constName? | break
    unless name.toString.endsWith ".statement" do break
    let proofName := ("NativeBridge.Incremental.LogicWitnesses.closed." ++ name.toString).toName
    let proof ← mkConstWithFreshMVarLevels proofName
    unless ← isDefEq (← inferType proof) domain do throwError "Closed witness type mismatch"
    value := mkApp value proof
    ty := body.instantiate1 proof
  return ← instantiateMVars value

noncomputable section
namespace NativeBridge.Incremental.LogicExistsElimination
open NativeBridge NativeBridge.Incremental.LogicNormalization
universe u
theorem exProperty {A : Prop} {P : A → Prop} (h : Exists P) : P (exProof h) := by
  obtain ⟨x,hx⟩ := h; exact hx
theorem ex2Property {A : Prop} {P Q : A → Prop} (h : ∃ x, P x ∧ Q x) :
    P (ex2Proof h) ∧ Q (ex2Proof h) := by
  obtain ⟨x,hx⟩ := h; exact hx
def nativeExistsElim {A : Prop} {P : A → Prop} (F : Exists P → Sort u)
    (f : ∀ x p, F ⟨x,p⟩) (h : Exists P) : F h :=
  f (exProof h) (exProperty h)
def nativeExists2Elim {A : Prop} {P Q : A → Prop} (F : (∃ x, P x ∧ Q x) → Sort u)
    (f : ∀ x p q, F ⟨x,p,q⟩) (h : ∃ x, P x ∧ Q x) : F h :=
  f (ex2Proof h) (ex2Property h).1 (ex2Property h).2
def exRectClosed := closed_logic% RocqPending.Corelib.Init.Logic.ex_rect
def exRecClosed := closed_logic% RocqPending.Corelib.Init.Logic.ex_rec
def ex2RectClosed := closed_logic% RocqPending.Corelib.Init.Logic.ex2_rect
def ex2RecClosed := closed_logic% RocqPending.Corelib.Init.Logic.ex2_rec
theorem ex_rect_agrees (A : Prop) (P : A → Prop) (F : Exists P → Sort u)
    (f : ∀ x p, F ⟨x,p⟩) (h : Rocq.Corelib.Init.Logic.ex A P) :
    (closed_logic% RocqPending.Corelib.Init.Logic.ex_rect) A P
      (fun e => F (ex_agrees P |>.mp e)) f h =
    nativeExistsElim F f (ex_agrees P |>.mp h) := by cases h; rfl
theorem ex_rec_agrees (A : Prop) (P : A → Prop) (F : Exists P → Type)
    (f : ∀ x p, F ⟨x,p⟩) (h : Rocq.Corelib.Init.Logic.ex A P) :
    (closed_logic% RocqPending.Corelib.Init.Logic.ex_rec) A P
      (fun e => F (ex_agrees P |>.mp e)) f h =
    nativeExistsElim F f (ex_agrees P |>.mp h) := by cases h; rfl
theorem ex2_rect_agrees (A : Prop) (P Q : A → Prop) (F : (∃ x, P x ∧ Q x) → Sort u)
    (f : ∀ x p q, F ⟨x,p,q⟩) (h : Rocq.Corelib.Init.Logic.ex2 A P Q) :
    (closed_logic% RocqPending.Corelib.Init.Logic.ex2_rect) A P Q
      (fun e => F (ex2_agrees P Q |>.mp e)) f h =
    nativeExists2Elim F f (ex2_agrees P Q |>.mp h) := by cases h; rfl
theorem ex2_rec_agrees (A : Prop) (P Q : A → Prop) (F : (∃ x, P x ∧ Q x) → Type)
    (f : ∀ x p q, F ⟨x,p,q⟩) (h : Rocq.Corelib.Init.Logic.ex2 A P Q) :
    (closed_logic% RocqPending.Corelib.Init.Logic.ex2_rec) A P Q
      (fun e => F (ex2_agrees P Q |>.mp e)) f h =
    nativeExists2Elim F f (ex2_agrees P Q |>.mp h) := by cases h; rfl
end NativeBridge.Incremental.LogicExistsElimination

import SpecifConditionalNormalization
open Lean Meta Elab Term
elab "closed_specif% " n:ident : term => do
  let mut value ← mkConstWithFreshMVarLevels n.getId
  let mut ty ← inferType value
  while let .forallE _ domain body _ := ty do
    let some name := domain.getAppFn.constName? | break
    unless name.toString.endsWith ".statement" do break
    let proofName := ("NativeBridge.Incremental.SpecifWitnesses.closed." ++ name.toString).toName
    let proof ← mkConstWithFreshMVarLevels proofName
    unless ← isDefEq (← inferType proof) domain do throwError "Closed witness type mismatch"
    value := mkApp value proof
    ty := body.instantiate1 proof
  return ← instantiateMVars value

noncomputable section
namespace NativeBridge.Incremental.SpecifOperations
open NativeBridge NativeBridge.Incremental
universe u v w
def nativeChoice {S : Sort u} {T : Sort v} {R : S → T → Prop}
    (H : (x : S) → {y // R x y}) : {f : S → T // ∀ x, R x (f x)} :=
  ⟨fun x => (H x).val,fun x => (H x).property⟩
def nativeChoice2 {S : Sort u} {T : Sort v} {R : S → T → Sort w}
    (H : (x : S) → PSigma (R x)) : PSigma (fun f : S → T => (x : S) → R x (f x)) :=
  ⟨fun x => (H x).fst,fun x => (H x).snd⟩
def choiceClosed := closed_specif% RocqPending.Corelib.Init.Specif.Choice
def sig2OfSigT2Closed := closed_specif% RocqPending.Corelib.Init.Specif.sig2_of_sigT2
theorem choice_agrees (S T : Type) (R : S → T → Prop)
    (H : (x : S) → Rocq.Corelib.Init.Specif.sig T (R x)) :
    subtypeTo ((closed_specif% RocqPending.Corelib.Init.Specif.Choice) S T R H) =
      nativeChoice (fun x => subtypeTo (H x)) := rfl
theorem choice2_agrees (S T : Type) (R : S → T → Type)
    (H : (x : S) → Rocq.Corelib.Init.Specif.sigT T (R x)) :
    psigmaTo (Rocq.Corelib.Init.Specif.Choice2 S T R H) =
      nativeChoice2 (fun x => psigmaTo (H x)) := rfl
theorem sig2_of_sigT2_agrees (A : Sort u) (P Q : A → Prop)
    (x : Rocq.Corelib.Init.Specif.sigT2 A P Q) :
    subtype2To ((closed_specif% RocqPending.Corelib.Init.Specif.sig2_of_sigT2) A P Q x) =
      (⟨(psigma2To x).fst, (psigma2To x).snd.fst, (psigma2To x).snd.snd⟩ : {a // P a ∧ Q a}) := by
  cases x; rfl

def optionToNative {A : Type u} : Rocq.Corelib.Init.Datatypes.option A → Option A
  | .None _ => none
  | .Some _ a => some a
def optionOfNative {A : Type u} : Option A → Rocq.Corelib.Init.Datatypes.option A
  | none => .None A
  | some a => .Some A a
def excIso (A : Type u) : Iso (Rocq.Corelib.Init.Specif.Exc A) (Option A) where
  to := optionToNative
  of := optionOfNative
  of_to x := by cases x <;> rfl
  to_of x := by cases x <;> rfl
def optionToLift {A : Sort u} : Rocq.Corelib.Init.Datatypes.option A → Option (PLift A)
  | .None _ => none
  | .Some _ a => some (.up a)
theorem error_agrees (A : Sort u) :
    optionToLift (Rocq.Corelib.Init.Specif.error A) = none := rfl
theorem value_agrees (A : Sort u) (a : A) :
    optionToLift (Rocq.Corelib.Init.Specif.value A a) = some (.up a) := rfl
def falseToNative (h : Rocq.Corelib.Init.Logic.False) : False := by cases h

theorem except_agrees (A : Type) (h : Rocq.Corelib.Init.Logic.False) :
    Rocq.Corelib.Init.Specif.except A h = False.elim (falseToNative h) := by cases h
theorem absurd_set_agrees (A : Prop) (C : Type) (h : A) (hn : Rocq.Corelib.Init.Logic.not A) :
    Rocq.Corelib.Init.Specif.absurd_set A C h hn = False.elim (falseToNative (hn h)) := by
  exact False.elim (falseToNative (hn h))

theorem sumbool_rect_agrees (A B : Prop) (P : PSum A B → Sort u)
    (f : ∀ a, P (.inl a)) (g : ∀ b, P (.inr b)) (x : Rocq.Corelib.Init.Specif.sumbool A B) :
    Rocq.Corelib.Init.Specif.sumbool_rect A B (fun x => P (sumboolTo x)) f g x =
      PSum.rec f g (sumboolTo x) := by cases x <;> rfl
theorem sumbool_rec_agrees (A B : Prop) (P : PSum A B → Type)
    (f : ∀ a, P (.inl a)) (g : ∀ b, P (.inr b)) (x : Rocq.Corelib.Init.Specif.sumbool A B) :
    Rocq.Corelib.Init.Specif.sumbool_rec A B (fun x => P (sumboolTo x)) f g x =
      PSum.rec f g (sumboolTo x) := by cases x <;> rfl
theorem sumor_rect_agrees (A : Sort u) (B : Prop) (P : PSum A B → Sort v)
    (f : ∀ a, P (.inl a)) (g : ∀ b, P (.inr b)) (x : Rocq.Corelib.Init.Specif.sumor A B) :
    Rocq.Corelib.Init.Specif.sumor_rect A B (fun x => P (sumorSortTo x)) f g x =
      PSum.rec f g (sumorSortTo x) := by cases x <;> rfl
theorem sumor_rec_agrees (A : Sort u) (B : Prop) (P : PSum A B → Type)
    (f : ∀ a, P (.inl a)) (g : ∀ b, P (.inr b)) (x : Rocq.Corelib.Init.Specif.sumor A B) :
    Rocq.Corelib.Init.Specif.sumor_rec A B (fun x => P (sumorSortTo x)) f g x =
      PSum.rec f g (sumorSortTo x) := by cases x <;> rfl
end NativeBridge.Incremental.SpecifOperations

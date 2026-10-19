import DataProgramWf
set_option autoImplicit false
noncomputable section
namespace NativeBridge.ComputationalCorrespondence.ProgramWf
open Computational.ProgramWf.NativeBridge
open Computational.ProgramWf.NativeBridge.Incremental.ProgramWellFounded
universe u v w z
abbrev SAcc {A : Type u} (R : A → A → Prop) := Computational.ProgramWf.Rocq.Corelib.Init.Wf.Acc A R
abbrev SWf {A : Type u} (R : A → A → Prop) := Computational.ProgramWf.Rocq.Corelib.Init.Wf.well_founded A R
theorem eqTo {A : Sort u} {x y : A}
    (h : Computational.ProgramWf.Rocq.Corelib.Init.Logic.eq A x y) : x = y :=
  Computational.ProgramWf.Rocq.Corelib.Init.Logic.eq.rec (motive := fun y _ => x = y) rfl h
theorem reverseProof :
    Computational.ProgramWf.Rocq.Corelib.Init.Logic.eq_rect_r__rocq2lean_obligation_1.statement.{u,v} := by
  intro A x P h y e
  exact Computational.ProgramWf.Rocq.Corelib.Init.Logic.eq.rec
    (motive := fun z _ => Computational.ProgramWf.Rocq.Corelib.Init.Logic.eq A z y) (.eq_refl A y) e

theorem cast_comp {X Y Z : Sort u} (e : X = Y) (f : Y = Z) (x : X) :
    cast f (cast e x) = cast (e.trans f) x := by cases e; cases f; rfl
theorem cast_cancel {X Y : Sort u} (e : X = Y) (x : X) :
    cast e.symm (cast e x) = x := by cases e; rfl

theorem sourceTransport {A : Sort u} {x y : A} (P : A → Sort v) (t : P x)
    (e : Computational.ProgramWf.Rocq.Corelib.Init.Logic.eq A y x) :
    @Computational.ProgramWf.RocqPending.Corelib.Init.Logic.eq_rect_r reverseProof A x P t y e =
    cast (congrArg P (eqTo e).symm) t := by
  have h := eqTo e
  cases h
  rfl

theorem sourceWF {A : Type u} (R : A → A → Prop) (wf : SWf R) (M : A → Type v)
    (F : (x : A) → ((y : A) → R y x → M y) → M x) (x : A) :
    Computational.ProgramWf.Rocq.Corelib.Init.Wf.well_founded_induction_type A R wf M F x =
      (wellFoundedTo wf).fix F x := by
  suffices h : ∀ x (a : SAcc R x),
      Computational.ProgramWf.Rocq.Corelib.Init.Wf.Acc_rect A R M (fun x _ ih => F x ih) x a =
        WellFounded.fixF F x (accTo a) from h x (wf x)
  intro x a
  induction a with
  | Acc_intro x h ih =>
    rw [WellFounded.fixF_eq]
    change F x (fun y hy => Computational.ProgramWf.Rocq.Corelib.Init.Wf.Acc_rect A R M (fun x _ ih => F x ih) y (h y hy)) = _
    exact congrArg (F x) (funext fun y => funext fun hy => ih y hy)

def nativeValue {A : Type u} (R : A → A → Prop) (wf : WellFounded R)
    (P : A → Type v) (G : NativeStep R P) (x : A) : P x :=
  wf.fix (fun x rec => G x (fun y => rec y.val y.property)) x

def sourceValue {A : Type u} (R : A → A → Prop) (wf : SWf R)
    (P : A → Type v) (G : NativeStep R P) (x : A) : P x :=
  @Computational.ProgramWf.RocqPending.Corelib.Program.Wf.Fix_F_sub proj2_witness A R P
    (sourceStep R P G) x (wf x)

theorem value_agrees {A : Type u} (R : A → A → Prop) (wf : SWf R)
    (P : A → Type v) (G : NativeStep R P) (x : A) :
    sourceValue R wf P G x = nativeValue R (wellFoundedTo wf) P G x :=
  fixF_agrees R P G x (wf x)

theorem step_agrees {A : Type u} (R : A → A → Prop) (wf : SWf R)
    (P : A → Type v) (G : NativeStep R P) (x : A) :
    G x (fun y => sourceValue R wf P G y.val) = nativeValue R (wellFoundedTo wf) P G x := by
  calc
    _ = G x (fun y => nativeValue R (wellFoundedTo wf) P G y.val) :=
      congrArg (G x) (funext fun y => value_agrees R wf P G y.val)
    _ = _ := (WellFounded.fix_eq (wellFoundedTo wf) (fun x rec => G x (fun y => rec y.val y.property)) x).symm

def nativeRect {A : Type u} (R : A → A → Prop) (wf : WellFounded R)
    (P : A → Type v) (G : NativeStep R P) (Q : (x : A) → P x → Type w)
    (I : (x : A) → ((y : A) → R y x → Q y (nativeValue R wf P G y)) →
      Q x (nativeValue R wf P G x)) (x : A) : Q x (nativeValue R wf P G x) :=
  wf.fix I x

def SourceInvF {A : Type u} (R : A → A → Prop) (wf : SWf R)
    (P : A → Type v) (G : NativeStep R P) (Q : (x : A) → P x → Type w) :=
  (x : A) → ((y : A) → R y x → SAcc R y → Q y (sourceValue R wf P G y)) →
    SAcc R x → Q x (G x (fun y => sourceValue R wf P G y.val))

def fromInvariant {A : Type u} (R : A → A → Prop) (wf : SWf R)
    (P : A → Type v) (G : NativeStep R P) (Q : (x : A) → P x → Type w)
    (I : (x : A) → ((y : A) → R y x → Q y (nativeValue R (wellFoundedTo wf) P G y)) →
      Q x (nativeValue R (wellFoundedTo wf) P G x)) : SourceInvF R wf P G Q :=
  fun x ih _ => cast (congrArg (Q x) (step_agrees R wf P G x).symm)
    (I x (fun y hy => cast (congrArg (Q y) (value_agrees R wf P G y)) (ih y hy (wf y))))

def toInvariant {A : Type u} (R : A → A → Prop) (wf : SWf R)
    (P : A → Type v) (G : NativeStep R P) (Q : (x : A) → P x → Type w)
    (I : SourceInvF R wf P G Q) :
    (x : A) → ((y : A) → R y x → Q y (nativeValue R (wellFoundedTo wf) P G y)) →
      Q x (nativeValue R (wellFoundedTo wf) P G x) :=
  fun x ih => cast (congrArg (Q x) (step_agrees R wf P G x))
    (I x (fun y hy _ => cast (congrArg (Q y) (value_agrees R wf P G y).symm) (ih y hy)) (wf x))

theorem invariant_from_to {A : Type u} (R : A → A → Prop) (wf : SWf R)
    (P : A → Type v) (G : NativeStep R P) (Q : (x : A) → P x → Type w)
    (I : SourceInvF R wf P G Q) :
    fromInvariant R wf P G Q (toInvariant R wf P G Q I) = I := by
  funext x ih a
  simp only [fromInvariant, toInvariant, cast_comp]
  change I x (fun y hy _ => cast _ (ih y hy (wf y))) (wf x) = I x ih a
  simp only [cast_eq]


theorem invariant_to_from {A : Type u} (R : A → A → Prop) (wf : SWf R)
    (P : A → Type v) (G : NativeStep R P) (Q : (x : A) → P x → Type w)
    (I : (x : A) → ((y : A) → R y x → Q y (nativeValue R (wellFoundedTo wf) P G y)) →
      Q x (nativeValue R (wellFoundedTo wf) P G x)) :
    toInvariant R wf P G Q (fromInvariant R wf P G Q I) = I := by
  funext x ih
  simp only [fromInvariant, toInvariant, cast_comp]
  rfl

theorem sourceUnfold {A : Type u} (R : A → A → Prop) (wf : SWf R)
    (P : A → Type v) (G : NativeStep R P) (x : A) :
    sourceValue R wf P G x = G x (fun y => sourceValue R wf P G y.val) :=
  sourceFixF_unfold R P (sourceStep R P G) x (wf x)

def sourceRectStep {A : Type u} (R : A → A → Prop) (wf : SWf R)
    (P : A → Type v) (G : NativeStep R P) (Q : (x : A) → P x → Type w)
    (I : SourceInvF R wf P G Q) (x : A)
    (ih : (y : A) → R y x → SAcc R y → Q y (sourceValue R wf P G y))
    (a : SAcc R x) : Q x (sourceValue R wf P G x) :=
  cast (congrArg (Q x) (sourceUnfold R wf P G x).symm) (I x ih a)

theorem sourceRect_eq {A : Type u} (R : A → A → Prop) (wf : SWf R)
    (P : A → Type v) (G : NativeStep R P) (Q : (x : A) → P x → Type w)
    (I : SourceInvF R wf P G Q) (x : A) (a : SAcc R x) :
    @Computational.ProgramWf.RocqPending.Corelib.Program.Wf.Fix_F_sub_rect.{u,v,w}
      proj2_witness unfold_witness f_unfold_proof reverseProof A P R wf (sourceStep R P G) Q I x a =
    (wellFoundedTo wf).fix (sourceRectStep R wf P G Q I) x a := by
  unfold Computational.ProgramWf.RocqPending.Corelib.Program.Wf.Fix_F_sub_rect
  dsimp only
  rw [sourceWF]
  apply congrArg (fun F : (x : A) → ((y : A) → R y x → SAcc R y → Q y (sourceValue R wf P G y)) → SAcc R x → Q x (sourceValue R wf P G x) => (wellFoundedTo wf).fix F x a)
  funext x ih a
  exact sourceTransport _ _ _

theorem fixFRect_agrees {A : Type u} (R : A → A → Prop) (wf : SWf R)
    (P : A → Type v) (G : NativeStep R P) (Q : (x : A) → P x → Type w)
    (I : (x : A) → ((y : A) → R y x → Q y (nativeValue R (wellFoundedTo wf) P G y)) →
      Q x (nativeValue R (wellFoundedTo wf) P G x)) (x : A) (a : SAcc R x) :
    cast (congrArg (Q x) (value_agrees R wf P G x))
      (@Computational.ProgramWf.RocqPending.Corelib.Program.Wf.Fix_F_sub_rect.{u,v,w}
        proj2_witness unfold_witness f_unfold_proof reverseProof A P R wf (sourceStep R P G) Q
          (fromInvariant R wf P G Q I) x a) =
    nativeRect R (wellFoundedTo wf) P G Q I x := by
  rw [sourceRect_eq]
  induction x using (wellFoundedTo wf).induction with
  | h x ih =>
    rw [WellFounded.fix_eq]
    rw [sourceRectStep, fromInvariant, cast_comp, cast_comp]
    change I x (fun y hy => cast _ ((wellFoundedTo wf).fix
      (sourceRectStep R wf P G Q (fromInvariant R wf P G Q I)) y (wf y))) =
      nativeRect R (wellFoundedTo wf) P G Q I x
    unfold nativeRect
    rw [WellFounded.fix_eq]
    apply congrArg (I x)
    funext y hy
    exact ih y hy (wf y)

theorem subRectProof :
    @Computational.ProgramWf.RocqPending.Corelib.Program.Wf.Fix_sub_rect__rocq2lean_obligation_1.statement.{u,v,w}
      proj2_witness := by
  intro A P R wf F hext Q inv x x0 H a X0 q y p p'
  exact eqOf rfl

theorem stepExtensional {A : Type u} (R : A → A → Prop) (P : A → Type v)
    (G : NativeStep R P) :
    ∀ x g h, (∀ y (p p' : R y x),
      Computational.ProgramWf.Rocq.Corelib.Init.Logic.eq (P y)
        (g (Computational.ProgramWf.Rocq.Corelib.Init.Specif.sig.exist A (fun y => R y x) y p))
        (h (Computational.ProgramWf.Rocq.Corelib.Init.Specif.sig.exist A (fun y => R y x) y p'))) →
      Computational.ProgramWf.Rocq.Corelib.Init.Logic.eq (P x) (sourceStep R P G x g) (sourceStep R P G x h) := by
  intro x g h hext
  apply eqOf
  apply congrArg (sourceStep R P G x)
  funext y
  induction y with
  | exist y hy => exact eqTo (hext y hy hy)

def SourceInvSub {A : Type u} (R : A → A → Prop) (wf : SWf R)
    (P : A → Type v) (G : NativeStep R P) (Q : (x : A) → P x → Type w) :=
  (x : A) → ((y : A) → R y x → Q y (sourceValue R wf P G y)) →
    SAcc R x → Q x (G x (fun y => sourceValue R wf P G y.val))

def fromSubInvariant {A : Type u} (R : A → A → Prop) (wf : SWf R)
    (P : A → Type v) (G : NativeStep R P) (Q : (x : A) → P x → Type w)
    (I : (x : A) → ((y : A) → R y x → Q y (nativeValue R (wellFoundedTo wf) P G y)) →
      Q x (nativeValue R (wellFoundedTo wf) P G x)) : SourceInvSub R wf P G Q :=
  fun x ih _ => cast (congrArg (Q x) (step_agrees R wf P G x).symm)
    (I x (fun y hy => cast (congrArg (Q y) (value_agrees R wf P G y)) (ih y hy)))

def toSubInvariant {A : Type u} (R : A → A → Prop) (wf : SWf R)
    (P : A → Type v) (G : NativeStep R P) (Q : (x : A) → P x → Type w)
    (I : SourceInvSub R wf P G Q) :
    (x : A) → ((y : A) → R y x → Q y (nativeValue R (wellFoundedTo wf) P G y)) →
      Q x (nativeValue R (wellFoundedTo wf) P G x) :=
  fun x ih => cast (congrArg (Q x) (step_agrees R wf P G x))
    (I x (fun y hy => cast (congrArg (Q y) (value_agrees R wf P G y).symm) (ih y hy)) (wf x))

theorem subInvariant_from_to {A : Type u} (R : A → A → Prop) (wf : SWf R)
    (P : A → Type v) (G : NativeStep R P) (Q : (x : A) → P x → Type w)
    (I : SourceInvSub R wf P G Q) :
    fromSubInvariant R wf P G Q (toSubInvariant R wf P G Q I) = I := by
  funext x ih a
  simp only [fromSubInvariant, toSubInvariant, cast_comp]
  change I x (fun y hy => cast _ (ih y hy)) (wf x) = I x ih a
  simp only [cast_eq]

theorem subInvariant_to_from {A : Type u} (R : A → A → Prop) (wf : SWf R)
    (P : A → Type v) (G : NativeStep R P) (Q : (x : A) → P x → Type w)
    (I : (x : A) → ((y : A) → R y x → Q y (nativeValue R (wellFoundedTo wf) P G y)) →
      Q x (nativeValue R (wellFoundedTo wf) P G x)) :
    toSubInvariant R wf P G Q (fromSubInvariant R wf P G Q I) = I := by
  funext x ih
  simp only [fromSubInvariant, toSubInvariant, cast_comp]
  rfl

theorem fixSubRect_agrees {A : Type u} (R : A → A → Prop) (wf : SWf R)
    (P : A → Type v) (G : NativeStep R P) (Q : (x : A) → P x → Type w)
    (I : (x : A) → ((y : A) → R y x → Q y (nativeValue R (wellFoundedTo wf) P G y)) →
      Q x (nativeValue R (wellFoundedTo wf) P G x)) (x : A) :
    cast (congrArg (Q x) (value_agrees R wf P G x))
      (@Computational.ProgramWf.RocqPending.Corelib.Program.Wf.Fix_sub_rect.{u,v,w}
        proj2_witness subRectProof unfold_witness f_unfold_proof reverseProof A P R wf (sourceStep R P G)
          (stepExtensional R P G) Q (fromSubInvariant R wf P G Q I) x) =
    nativeRect R (wellFoundedTo wf) P G Q I x := by
  exact fixFRect_agrees R wf P G Q I x (wf x)

end NativeBridge.ComputationalCorrespondence.ProgramWf

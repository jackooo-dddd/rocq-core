import DataSSRBool
set_option autoImplicit false
set_option maxRecDepth 4096
noncomputable section
open Lean Meta Elab Command in
run_cmd liftTermElabM do
  let n := "Computational.SSRBool.RocqPending.Corelib.ssr.ssrbool.all_tag_cond_dep".toName
  let ci ← getConstInfo n
  let some value := ci.value? | throwError "Expected transparent source variant"
  let point ← lambdaTelescope value fun xs body => do
    unless body.getAppFn.constName? == some "Computational.SSRBool.Rocq.Corelib.ssr.ssrfun.all_tag".toName do
      throwError "Unexpected source shape"
    mkLambdaFVars xs body.getAppArgs.back!
  let ty ← inferType point
  addDecl (.defnDecl {name := "NativeBridge.ComputationalCorrespondence.SSRBool.sourcePoint".toName, levelParams := ci.levelParams, type := ty, value := point, hints := .regular 1, safety := .safe})

namespace NativeBridge.ComputationalCorrespondence.SSRBool
open Computational.SSRBool.NativeBridge
open Computational.SSRBool.NativeBridge.Incremental.SSRBoolData
open Computational.SSRBool.Rocq.Corelib.ssr
universe u v w

def applyImplication (P : Sort u) (Q : Sort v) (f : P → Q) := f
theorem applyImplication_agrees (P : Sort u) (Q : Sort v) (f : P → Q) :
    ssrbool.impliesP.{u,v} P Q ((impliesIso P Q).of f) = applyImplication P Q f := rfl

theorem truthTo (b : Bool) (h : Computational.SSRBool.Rocq.Corelib.Init.Datatypes.is_true (boolOf b)) : b = true := by
  simpa only [bool_to_of] using (is_true_agrees _).mp h
theorem truthOf (b : Bool) (h : b = true) :
    Computational.SSRBool.Rocq.Corelib.Init.Datatypes.is_true (boolOf b) :=
  (is_true_agrees _).mpr (by simpa only [bool_to_of] using h)

def pointIso (b : Bool) (T : Type v) (U : T → Type w) :
    Iso (Computational.SSRBool.Rocq.Corelib.Init.Specif.sigT T
      (fun y => Computational.SSRBool.Rocq.Corelib.Init.Datatypes.is_true (boolOf b) → U y))
      (Sigma (fun y => b = true → U y)) :=
  Iso.mk
    (fun p => let q := (sigmaIso _ _).to p; ⟨q.1,fun h => q.2 (truthOf b h)⟩)
    (fun p => (sigmaIso _ _).of ⟨p.1,fun h => p.2 (truthTo b h)⟩)
    (by intro p; cases p; rfl) (fun _ => rfl)
def conditionalTagIso (I : Type u) (T : I → Type v) (C : I → Bool) (U : (x : I) → T x → Type w) :
    Iso (Computational.SSRBool.Rocq.Corelib.Init.Specif.sigT ((x : I) → T x)
      (fun g => (x : I) → Computational.SSRBool.Rocq.Corelib.Init.Datatypes.is_true (boolOf (C x)) → U x (g x)))
      (Sigma (fun g : (x : I) → T x => (x : I) → C x = true → U x (g x))) :=
  Iso.mk
    (fun p => let q := (sigmaIso _ _).to p; ⟨q.1,fun x h => q.2 x (truthOf (C x) h)⟩)
    (fun p => (sigmaIso _ _).of ⟨p.1,fun x h => p.2 x (truthTo (C x) h)⟩)
    (by intro p; cases p; rfl) (fun _ => rfl)

def choose (b : Bool) (T : Type v) (U : T → Type w) (d : T) (f : b = true → Sigma U) :
    Sigma (fun y => b = true → U y) :=
  match b with
  | true => let q := f rfl; ⟨q.1,fun _ => q.2⟩
  | false => ⟨d,fun h => False.elim (Bool.noConfusion h)⟩
def assemble (I : Type u) (T : I → Type v) (C : I → Bool) (U : (x : I) → T x → Type w)
    (p : (x : I) → Sigma (fun y => C x = true → U x y)) :
    Sigma (fun g : (x : I) → T x => (x : I) → C x = true → U x (g x)) :=
  ⟨fun x => (p x).1,fun x => (p x).2⟩
def allTagCondDep (I : Type u) (T : I → Type v) (C : I → Bool) (U : (x : I) → T x → Type w)
    (d : (x : I) → T x) (f : (x : I) → C x = true → Sigma (U x)) :=
  assemble I T C U (fun x => choose (C x) (T x) (U x) (d x) (f x))

theorem tagProof1 : ssrbool.all_tag_cond_dep__rocq2lean_obligation_1.statement.{u,v,w} :=
  Computational.SSRBool.NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.all_tag_cond_dep__rocq2lean_obligation_1.statement
theorem tagProof2 : ssrbool.all_tag_cond_dep__rocq2lean_obligation_2.statement.{u,v,w} :=
  Computational.SSRBool.NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.all_tag_cond_dep__rocq2lean_obligation_2.statement


def genericSourcePoint (b : Bool) (T : Type v) (U : T → Type w) (d : T) (f : b = true → Sigma U) :
    Computational.SSRBool.Rocq.Corelib.Init.Specif.sigT T
      (fun y => Computational.SSRBool.Rocq.Corelib.Init.Datatypes.is_true (boolOf b) → U y) :=
  Computational.SSRBool.Rocq.Corelib.Init.Datatypes.bool.rec
    (motive := fun q =>
      Computational.SSRBool.Rocq.Corelib.Init.Logic.eq
        Computational.SSRBool.Rocq.Corelib.Init.Datatypes.bool (boolOf b) q →
      Computational.SSRBool.Rocq.Corelib.Init.Specif.sigT T
        (fun y => Computational.SSRBool.Rocq.Corelib.Init.Datatypes.is_true q → U y))
    (fun e => (sigmaIso _ _).of ⟨(f (truthTo b e)).1,fun _ => (f (truthTo b e)).2⟩)
    (fun _ => (sigmaIso _ _).of ⟨d,fun h =>
      Computational.SSRBool.Rocq.Corelib.Init.Logic.False.rec (fun _ => U d)
        (False.elim (Bool.noConfusion (truthTo false h)))⟩)
    (boolOf b) (.eq_refl _ (boolOf b))

theorem genericPoint_agrees (b : Bool) (T : Type v) (U : T → Type w) (d : T) (f : b = true → Sigma U) :
    (pointIso b T U).to (genericSourcePoint b T U d f) = choose b T U d f := by
  cases b with
  | true => rfl
  | false =>
    apply Sigma.ext
    · rfl
    · apply heq_of_eq
      funext h
      exact False.elim (Bool.noConfusion h)

theorem point_agrees (I : Type u) (T : I → Type v) (C : I → Bool) (U : (x : I) → T x → Type w)
    (d : (x : I) → T x) (f : (x : I) → C x = true → Sigma (U x)) (x : I) :
    (pointIso (C x) (T x) (U x)).to
      (@sourcePoint.{u,v,w} tagProof1 tagProof2 I T (predOf C) U d
        (fun x h => (sigmaIso _ _).of (f x (truthTo (C x) h))) x) =
          choose (C x) (T x) (U x) (d x) (f x) := by
  change (pointIso (C x) (T x) (U x)).to (genericSourcePoint (C x) (T x) (U x) (d x) (f x)) = _
  exact genericPoint_agrees _ _ _ _ _

theorem allTagCondDep_agrees (I : Type u) (T : I → Type v) (C : I → Bool) (U : (x : I) → T x → Type w)
    (d : (x : I) → T x) (f : (x : I) → C x = true → Sigma (U x)) :
    (conditionalTagIso I T C U).to
      (@Computational.SSRBool.RocqPending.Corelib.ssr.ssrbool.all_tag_cond_dep.{u,v,w}
        tagProof1 tagProof2 I T (predOf C) U d
        (fun x h => (sigmaIso _ _).of (f x (truthTo (C x) h)))) = allTagCondDep I T C U d f := by
  change assemble I T C U (fun x => (pointIso (C x) (T x) (U x)).to
    (@sourcePoint.{u,v,w} tagProof1 tagProof2 I T (predOf C) U d
      (fun x h => (sigmaIso _ _).of (f x (truthTo (C x) h))) x)) =
    assemble I T C U (fun x => choose (C x) (T x) (U x) (d x) (f x))
  apply congrArg (assemble I T C U)
  funext x
  exact point_agrees I T C U d f x

def allTagCond (I : Type u) (T : Type v) (C : I → Bool) (U : I → T → Type w)
    (d : T) (f : (x : I) → C x = true → Sigma (U x)) :=
  allTagCondDep I (fun _ => T) C U (fun _ => d) f
theorem allTagCond_agrees (I : Type u) (T : Type v) (C : I → Bool) (U : I → T → Type w)
    (d : T) (f : (x : I) → C x = true → Sigma (U x)) :
    (conditionalTagIso I (fun _ => T) C U).to
      (@Computational.SSRBool.RocqPending.Corelib.ssr.ssrbool.all_tag_cond.{u,v,w}
        tagProof1 tagProof2 I T (predOf C) U d
        (fun x h => (sigmaIso _ _).of (f x (truthTo (C x) h)))) = allTagCond I T C U d f :=
  allTagCondDep_agrees I (fun _ => T) C U (fun _ => d) f

def chooseValue (b : Bool) (T : Type v) (d : T) (f : b = true → T) : T :=
  if h : b = true then f h else d
theorem choose_value (b : Bool) (T : Type v) (U : T → Type w) (d : T) (f : b = true → Sigma U) :
    (choose b T U d f).1 = chooseValue b T d (fun h => (f h).1) := by cases b <;> rfl

def conditionalSigIso (I : Type u) (T : I → Type v) (C : I → Bool) (P : (x : I) → T x → Prop) :
    Iso (Computational.SSRBool.Rocq.Corelib.Init.Specif.sig ((x : I) → T x)
      (fun g => ∀ x, Computational.SSRBool.Rocq.Corelib.Init.Datatypes.is_true (boolOf (C x)) → P x (g x)))
      {g : (x : I) → T x // ∀ x, C x = true → P x (g x)} :=
  Iso.mk
    (fun p => let q := (sigIso _ _).to p; ⟨q.val,fun x h => q.property x (truthOf (C x) h)⟩)
    (fun p => (sigIso _ _).of ⟨p.val,fun x h => p.property x (truthTo (C x) h)⟩)
    (by intro p; cases p; rfl) (fun _ => rfl)
theorem tagSigProof : ssrfun.tag_of_sig__rocq2lean_obligation_1.statement.{u} :=
  Computational.SSRBool.NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrfun.tag_of_sig__rocq2lean_obligation_1.statement

def allSigCondDep (I : Type u) (T : I → Type v) (C : I → Bool) (P : (x : I) → T x → Prop)
    (d : (x : I) → T x) (f : (x : I) → C x = true → Subtype (P x)) :
    {g : (x : I) → T x // ∀ x, C x = true → P x (g x)} :=
  ⟨fun x => chooseValue (C x) (T x) (d x) (fun h => (f x h).val),
   fun x h => by simpa only [chooseValue, dif_pos h] using (f x h).property⟩
theorem allSigCondDep_agrees (I : Type u) (T : I → Type v) (C : I → Bool) (P : (x : I) → T x → Prop)
    (d : (x : I) → T x) (f : (x : I) → C x = true → Subtype (P x)) :
    (conditionalSigIso I T C P).to
      (@Computational.SSRBool.RocqPending.Corelib.ssr.ssrbool.all_sig_cond_dep.{u,v}
        tagSigProof tagProof1 tagProof2 I T (predOf C) P d
        (fun x h => (sigIso _ _).of (f x (truthTo (C x) h)))) = allSigCondDep I T C P d f := by
  apply Subtype.ext
  have h := congrArg Sigma.fst (allTagCondDep_agrees I T C (fun x y => PULift (P x y)) d
    (fun x h => ⟨(f x h).val,⟨(f x h).property⟩⟩))
  exact h.trans (funext (fun x => choose_value (C x) (T x) (fun y => PULift (P x y))
    (d x) (fun h => ⟨(f x h).val,⟨(f x h).property⟩⟩)))

def allSigCond (I : Type u) (T : Type v) (C : I → Bool) (P : I → T → Prop)
    (d : T) (f : (x : I) → C x = true → Subtype (P x)) :=
  allSigCondDep I (fun _ => T) C P (fun _ => d) f
theorem allSigCond_agrees (I : Type u) (T : Type v) (C : I → Bool) (P : I → T → Prop)
    (d : T) (f : (x : I) → C x = true → Subtype (P x)) :
    (conditionalSigIso I (fun _ => T) C P).to
      (@Computational.SSRBool.RocqPending.Corelib.ssr.ssrbool.all_sig_cond.{u,v}
        tagSigProof tagProof1 tagProof2 I T (predOf C) P d
        (fun x h => (sigIso _ _).of (f x (truthTo (C x) h)))) = allSigCond I T C P d f :=
  allSigCondDep_agrees I (fun _ => T) C P (fun _ => d) f

theorem sig2SourceProof : ssrfun.sig_of_sig2__rocq2lean_obligation_1.statement.{u} :=
  Computational.SSRBool.NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrfun.sig_of_sig2__rocq2lean_obligation_1.statement
theorem sig2CondProof1 : ssrbool.all_sig2_cond__rocq2lean_obligation_1.statement.{u,v} :=
  Computational.SSRBool.NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.all_sig2_cond__rocq2lean_obligation_1.statement
theorem sig2CondProof2 : ssrbool.all_sig2_cond__rocq2lean_obligation_2.statement.{u,v} :=
  Computational.SSRBool.NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.all_sig2_cond__rocq2lean_obligation_2.statement

def conditionalSig2Iso (I : Type u) (T : Type v) (C : I → Bool) (P Q : I → T → Prop) :
    Iso (Computational.SSRBool.Rocq.Corelib.Init.Specif.sig2 (I → T)
      (fun g => ∀ x, Computational.SSRBool.Rocq.Corelib.Init.Datatypes.is_true (boolOf (C x)) → P x (g x))
      (fun g => ∀ x, Computational.SSRBool.Rocq.Corelib.Init.Datatypes.is_true (boolOf (C x)) → Q x (g x)))
      {g : I → T // (∀ x, C x = true → P x (g x)) ∧ (∀ x, C x = true → Q x (g x))} :=
  Iso.mk
    (fun p => let q := (sig2Iso _ _ _).to p
              ⟨q.val,⟨fun x h => q.property.1 x (truthOf (C x) h),
                       fun x h => q.property.2 x (truthOf (C x) h)⟩⟩)
    (fun p => (sig2Iso _ _ _).of
      ⟨p.val,⟨fun x h => p.property.1 x (truthTo (C x) h),
               fun x h => p.property.2 x (truthTo (C x) h)⟩⟩)
    (by intro p; cases p; rfl) (fun _ => rfl)

def allSig2Cond (I : Type u) (T : Type v) (C : I → Bool) (P Q : I → T → Prop)
    (d : T) (f : (x : I) → C x = true → {a : T // P x a ∧ Q x a}) :
    {g : I → T // (∀ x, C x = true → P x (g x)) ∧ (∀ x, C x = true → Q x (g x))} :=
  ⟨fun x => chooseValue (C x) T d (fun h => (f x h).val),
   ⟨fun x h => by simpa only [chooseValue, dif_pos h] using (f x h).property.1,
    fun x h => by simpa only [chooseValue, dif_pos h] using (f x h).property.2⟩⟩
theorem allSig2Cond_agrees (I : Type u) (T : Type v) (C : I → Bool) (P Q : I → T → Prop)
    (d : T) (f : (x : I) → C x = true → {a : T // P x a ∧ Q x a}) :
    (conditionalSig2Iso I T C P Q).to
      (@Computational.SSRBool.RocqPending.Corelib.ssr.ssrbool.all_sig2_cond.{u,v}
        tagSigProof tagProof1 tagProof2 sig2SourceProof sig2CondProof1 sig2CondProof2
        I T (predOf C) P Q d (fun x h => (sig2Iso _ _ _).of (f x (truthTo (C x) h)))) =
          allSig2Cond I T C P Q d f := by
  apply Subtype.ext
  have h := allSigCond_agrees I T C
    (fun x y => Computational.SSRBool.Rocq.Corelib.Init.Logic.and (P x y) (Q x y)) d
    (fun x h => ⟨(f x h).val,.conj _ _ (f x h).property.1 (f x h).property.2⟩)
  have hv := congrArg Subtype.val h
  exact hv

end NativeBridge.ComputationalCorrespondence.SSRBool

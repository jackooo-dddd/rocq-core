import DataSSRFun
set_option autoImplicit false
set_option maxRecDepth 4096
noncomputable section
namespace NativeBridge.ComputationalCorrespondence.SSRFun
open Computational.SSRFun.NativeBridge
open Computational.SSRFun.NativeBridge.Incremental
open Computational.SSRFun.Rocq.Corelib.ssr
universe u v w z

def allTag (I : Sort u) (T : I → Sort v) (U : (i : I) → T i → Sort w)
    (f : (i : I) → PSigma (U i)) : PSigma (fun g : (i : I) → T i => (i : I) → U i (g i)) :=
  ⟨fun i => (f i).fst,fun i => (f i).snd⟩
theorem allTag_agrees (I : Sort u) (T : I → Sort v) (U : (i : I) → T i → Sort w)
    (f : (i : I) → PSigma (U i)) :
    SSRFunData.sigmaTo (ssrfun.all_tag.{u,v,w} I T U (fun i => SSRFunData.sigmaOf (f i))) = allTag I T U f := rfl

def allTag2 (I : Sort u) (T : I → Sort v)
    (U : (i : I) → T i → Sort w) (V : (i : I) → T i → Sort z)
    (f : (i : I) → PSigma (fun a => PProd (U i a) (V i a))) :
    PSigma (fun g : (i : I) → T i => PProd ((i : I) → U i (g i)) ((i : I) → V i (g i))) :=
  ⟨fun i => (f i).fst,⟨fun i => (f i).snd.fst,fun i => (f i).snd.snd⟩⟩
theorem allTag2_agrees (I : Sort u) (T : I → Sort v)
    (U : (i : I) → T i → Sort w) (V : (i : I) → T i → Sort z)
    (f : (i : I) → PSigma (fun a => PProd (U i a) (V i a))) :
    SSRFunData.sigma2To (ssrfun.all_tag2.{u,v,w,z} I T U V (fun i => SSRFunData.sigma2Of (f i))) =
      allTag2 I T U V f := rfl

def allSig (I : Sort u) (T : I → Sort v) (P : (i : I) → T i → Prop)
    (f : (i : I) → Subtype (P i)) : {g : (i : I) → T i // ∀ i, P i (g i)} :=
  ⟨fun i => (f i).val,fun i => (f i).property⟩
theorem allSig_agrees (I : Sort u) (T : I → Sort v) (P : (i : I) → T i → Prop)
    (f : (i : I) → Subtype (P i)) :
    SSRFunNormalization.sigTo (@Computational.SSRFun.RocqPending.Corelib.ssr.ssrfun.all_sig.{u,v}
      SSRFunConditions.tagWitness I T P (fun i => SSRFunNormalization.sigOf (f i))) = allSig I T P f := rfl

theorem sig2Proof1 : ssrfun.all_sig2__rocq2lean_obligation_1.statement.{u,v} := by
  intro I T P Q input f h pair hp hq
  exact pair
theorem sig2Proof2 : ssrfun.all_sig2__rocq2lean_obligation_2.statement.{u,v} := by
  intro I T P Q input f h
  exact .pair _ _ (fun i => Computational.SSRFun.Rocq.Corelib.Init.Logic.and.rec (fun p _ => p) (h i))
    (fun i => Computational.SSRFun.Rocq.Corelib.Init.Logic.and.rec (fun _ q => q) (h i))
def allSig2 (I : Sort u) (T : I → Sort v) (P Q : (i : I) → T i → Prop)
    (f : (i : I) → {a : T i // P i a ∧ Q i a}) :
    {g : (i : I) → T i // (∀ i, P i (g i)) ∧ (∀ i, Q i (g i))} :=
  ⟨fun i => (f i).val,⟨fun i => (f i).property.1,fun i => (f i).property.2⟩⟩
theorem sig2Value (A : Sort u) (P Q : A → Prop) (a : A)
    (h : Computational.SSRFun.Rocq.Corelib.Init.Datatypes.prod.qualityProp (P a) (Q a)) :
    (SSRFunNormalization.sig2To
      (Computational.SSRFun.Rocq.Corelib.Init.Datatypes.prod.qualityProp.rec
        (motive := fun _ => Computational.SSRFun.Rocq.Corelib.Init.Specif.sig2 A P Q)
        (fun hp hq => .exist2 A P Q a hp hq) h)).val = a := by
  induction h
  rfl

theorem allSig2_agrees (I : Sort u) (T : I → Sort v) (P Q : (i : I) → T i → Prop)
    (f : (i : I) → {a : T i // P i a ∧ Q i a}) :
    SSRFunNormalization.sig2To (@Computational.SSRFun.RocqPending.Corelib.ssr.ssrfun.all_sig2.{u,v}
      sig2Proof2 sig2Proof1 SSRFunConditions.sigWitness SSRFunConditions.tagWitness
      I T P Q (fun i => SSRFunNormalization.sig2Of (f i))) = allSig2 I T P Q f := by
  apply Subtype.ext
  exact sig2Value _ _ _ _ _

end NativeBridge.ComputationalCorrespondence.SSRFun

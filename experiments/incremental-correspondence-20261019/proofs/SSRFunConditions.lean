import SSRFunData
set_option autoImplicit false
noncomputable section
namespace NativeBridge.Incremental.SSRFunConditions
open NativeBridge
open SSRFunData SSRFunNormalization
universe u v

theorem tagWitness : Rocq.Corelib.ssr.ssrfun.tag_of_sig__rocq2lean_obligation_1.statement := by
  intro I P x
  cases x with | exist x h => exact h
theorem sigWitness : Rocq.Corelib.ssr.ssrfun.sig_of_sig2__rocq2lean_obligation_1.statement := by
  intro I P Q x
  cases x with | exist2 x hp hq => exact .conj _ _ hp hq

def tagOfSig := @RocqPending.Corelib.ssr.ssrfun.tag_of_sig tagWitness
def sigOfSig2 := @RocqPending.Corelib.ssr.ssrfun.sig_of_sig2 sigWitness
def nativeTagOfSig {A : Sort u} {P : A → Prop} (x : Subtype P) : PSigma P := ⟨x.val,x.property⟩
def andSubtypeTo {A : Sort u} {P Q : A → Prop}
    (x : Rocq.Corelib.Init.Specif.sig A (fun a => Rocq.Corelib.Init.Logic.and (P a) (Q a))) :
    {a // P a ∧ Q a} := ⟨(SSRFunNormalization.sigTo x).val,(and_agrees _ _).mp (SSRFunNormalization.sigTo x).property⟩
theorem tag_of_sig_agrees (A : Sort u) (P : A → Prop) (x : Rocq.Corelib.Init.Specif.sig A P) :
    SSRFunData.sigmaTo (@RocqPending.Corelib.ssr.ssrfun.tag_of_sig tagWitness A P x) =
      nativeTagOfSig (SSRFunNormalization.sigTo x) := by cases x; rfl
theorem sig_of_sig2_agrees (A : Sort u) (P Q : A → Prop) (x : Rocq.Corelib.Init.Specif.sig2 A P Q) :
    andSubtypeTo (@RocqPending.Corelib.ssr.ssrfun.sig_of_sig2 sigWitness A P Q x) =
      id (SSRFunNormalization.sig2To x) := by cases x; rfl

theorem esymWitness1 : Rocq.Corelib.ssr.ssrfun.esymK__rocq2lean_obligation_1.statement := by
  intro T x y h
  cases h
  exact .eq_refl _ _
theorem esymWitness2 : Rocq.Corelib.ssr.ssrfun.esymK__rocq2lean_obligation_2.statement := by
  intro T x y h
  cases h
  exact .eq_refl _ _
theorem etransWitness : Rocq.Corelib.ssr.ssrfun.etrans_id__rocq2lean_obligation_1.statement := by
  intro T x y h; exact h
def esymClosed : Prop := @RocqPending.Corelib.ssr.ssrfun.esymK.statement.{u} esymWitness1 esymWitness2
def etransClosed : Prop := @RocqPending.Corelib.ssr.ssrfun.etrans_id.statement.{u} etransWitness
theorem esym_proof : @RocqPending.Corelib.ssr.ssrfun.esymK.statement.{u} esymWitness1 esymWitness2 := by
  intro T x y h
  exact eqOf (Subsingleton.elim _ _)
theorem etrans_proof : @RocqPending.Corelib.ssr.ssrfun.etrans_id.statement.{u} etransWitness := by
  intro T x y h
  exact eqOf (Subsingleton.elim _ _)
def nativeEsym : Prop := ∀ (T : Sort u) (x y : T) (h : x = y), h.symm.symm = h
def nativeEtrans : Prop := ∀ (T : Sort u) (x y : T) (h : x = y), h.trans rfl = h
theorem esym_agrees :
    (@RocqPending.Corelib.ssr.ssrfun.esymK.statement.{u} esymWitness1 esymWitness2) ↔ nativeEsym.{u} := by
  constructor
  · intro _ T x y h; rfl
  · intro _; exact esym_proof
theorem etrans_agrees :
    (@RocqPending.Corelib.ssr.ssrfun.etrans_id.statement.{u} etransWitness) ↔ nativeEtrans.{u} := by
  constructor
  · intro _ T x y h; rfl
  · intro _; exact etrans_proof
end NativeBridge.Incremental.SSRFunConditions

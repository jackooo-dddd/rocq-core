import SSRBoolWitnesses
namespace NativeBridge.Incremental.SSRBoolFinalWitnesses
open NativeBridge SSRBoolData SSRBoolPackaging
theorem bindUnless : Rocq.Corelib.ssr.ssrbool.bind_unless__rocq2lean_obligation_1.statement := by
  intro C P Q h
  rcases (unless_agrees C P).mp h with hc | hp
  · exact (unless_agrees _ P).mpr (.inl ⟨(unless_agrees C Q).mpr (.inl hc)⟩)
  · exact (unless_agrees _ P).mpr (.inr hp)
theorem keyedMem : Rocq.Corelib.ssr.ssrbool.keyed_mem__rocq2lean_obligation_1.statement := by
  intro T p k x
  cases x with
  | PackKeyedPred value h => exact h
theorem keyedMemSimpl : Rocq.Corelib.ssr.ssrbool.keyed_mem_simpl__rocq2lean_obligation_1.statement := by
  intro T p k x
  cases x with
  | PackKeyedPred value h => exact h
theorem keyedQualifier : Rocq.Corelib.ssr.ssrbool.keyed_qualifier_keyed__rocq2lean_obligation_1.statement := by
  intro T n q k x
  cases x with
  | PackKeyedQualifier value h =>
    have e := eqTo h
    subst value
    intro x
    exact .eq_refl _ _
end NativeBridge.Incremental.SSRBoolFinalWitnesses


theorem NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.bind_unless__rocq2lean_obligation_1.statement :
    Rocq.Corelib.ssr.ssrbool.bind_unless__rocq2lean_obligation_1.statement :=
  NativeBridge.Incremental.SSRBoolFinalWitnesses.bindUnless

theorem NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.keyed_mem__rocq2lean_obligation_1.statement :
    Rocq.Corelib.ssr.ssrbool.keyed_mem__rocq2lean_obligation_1.statement :=
  NativeBridge.Incremental.SSRBoolFinalWitnesses.keyedMem

theorem NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.keyed_mem_simpl__rocq2lean_obligation_1.statement :
    Rocq.Corelib.ssr.ssrbool.keyed_mem_simpl__rocq2lean_obligation_1.statement :=
  NativeBridge.Incremental.SSRBoolFinalWitnesses.keyedMemSimpl

theorem NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.keyed_qualifier_keyed__rocq2lean_obligation_1.statement :
    Rocq.Corelib.ssr.ssrbool.keyed_qualifier_keyed__rocq2lean_obligation_1.statement :=
  NativeBridge.Incremental.SSRBoolFinalWitnesses.keyedQualifier

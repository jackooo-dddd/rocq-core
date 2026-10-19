import DependentElimination

noncomputable section
namespace NativeBridge.Incremental
open NativeBridge
universe u

theorem subtype2_forall_native {A : Sort u} {P Q : A → Prop}
    (F : Rocq.Corelib.Init.Specif.sig2 A P Q → Prop) :
    (∀ s, F s) ↔ (∀ s : {x : A // P x ∧ Q x}, F (subtype2Of s)) := by
  constructor
  · intro h s; exact h _
  · intro h s
    have hs := h (subtype2To s)
    have he : subtype2Of (subtype2To s) = s := (subtype2Iso A P Q).of_to s
    rw [he] at hs
    exact hs

theorem subtype2_native_roundtrip {A : Sort u} {P Q : A → Prop}
    (s : {x : A // P x ∧ Q x}) : subtype2To (subtype2Of s) = s :=
  (subtype2Iso A P Q).to_of s

theorem subtype2_eq_native {A : Sort u} {P Q : A → Prop}
    (x y : Rocq.Corelib.Init.Specif.sig2 A P Q) :
    ME _ x y ↔ subtype2To x = subtype2To y :=
  (eq_correspondence x y).trans ((subtype2Iso A P Q).eq_iff x y).symm

theorem subtype_eq_native {A : Sort u} {P : A → Prop}
    (x y : Rocq.Corelib.Init.Specif.sig A P) :
    ME _ x y ↔ subtypeTo x = subtypeTo y :=
  (eq_correspondence x y).trans ((subtypeIso A P).eq_iff x y).symm

theorem subtype2_equality_native {A : Sort u} {P Q : A → Prop}
    (x y : Rocq.Corelib.Init.Specif.sig2 A P Q) :
    (x = y) ↔ subtype2To x = subtype2To y := ((subtype2Iso A P Q).eq_iff x y).symm

theorem subtype_equality_native {A : Sort u} {P : A → Prop}
    (x y : Rocq.Corelib.Init.Specif.sig A P) :
    (x = y) ↔ subtypeTo x = subtypeTo y := ((subtypeIso A P).eq_iff x y).symm

def dropSecondProperty {A : Sort u} {P Q : A → Prop}
    (s : {x : A // P x ∧ Q x}) : Subtype P := ⟨s.val, s.property.1⟩

theorem closed_projection_native {A : Sort u} {P Q : A → Prop}
    (s : {x : A // P x ∧ Q x}) :
    subtypeTo (@RocqPending.Corelib.Init.Specif.sig_of_sig2 sig_of_sig2_obligation
      A P Q (subtype2Of s)) = dropSecondProperty s := by cases s <;> rfl

theorem closed_projection_value_native {A : Sort u} {P Q : A → Prop}
    (s : {x : A // P x ∧ Q x}) :
    Rocq.Corelib.Init.Specif.proj1_sig A P
      (@RocqPending.Corelib.Init.Specif.sig_of_sig2 sig_of_sig2_obligation
        A P Q (subtype2Of s)) = s.val := by cases s <;> rfl

theorem source_iff_native (P Q : Prop) :
    Rocq.Corelib.Init.Logic.iff P Q ↔ (P ↔ Q) := by
  constructor
  · intro h; cases h with | conj hp hq => exact ⟨hp,hq⟩
  · intro h; exact .conj _ _ h.mp h.mpr

def proj3SigNative : Prop :=
  ∀ (A : Sort u) (P Q : A → Prop) (s : {x : A // P x ∧ Q x}), Q s.val
def proj1SigOfSig2EqNative : Prop :=
  ∀ (A : Sort u) (P Q : A → Prop) (s t : {x : A // P x ∧ Q x}),
    s = t → s.val = t.val
def sigOfSig2EqNative : Prop :=
  ∀ (A : Sort u) (P Q : A → Prop) (s t : {x : A // P x ∧ Q x}),
    s = t → dropSecondProperty s = dropSecondProperty t
def eqSig2HpropNative : Prop :=
  ∀ (A : Sort u) (P Q : A → Prop),
    (∀ (x : A) (p q : Q x), p = q) →
    ∀ (s t : {x : A // P x ∧ Q x}),
      dropSecondProperty s = dropSecondProperty t → s = t
def eqSig2HpropIffNative : Prop :=
  ∀ (A : Sort u) (P Q : A → Prop),
    (∀ (x : A) (p q : Q x), p = q) →
    ∀ (s t : {x : A // P x ∧ Q x}),
      (s = t ↔ dropSecondProperty s = dropSecondProperty t)

theorem proj3_sig_native :
    (@RocqPending.Corelib.Init.Specif.proj3_sig.statement.{u} sig_of_sig2_obligation) ↔
      proj3SigNative.{u} := by
  unfold RocqPending.Corelib.Init.Specif.proj3_sig.statement proj3SigNative
  simp only [subtype2_equality_native, subtype_equality_native, subtype2_forall_native, closed_projection_value_native]

theorem proj1_sig_of_sig2_eq_native :
    (@RocqPending.Corelib.Init.Specif.proj1_sig_of_sig2_eq.statement.{u} sig_of_sig2_obligation) ↔
      proj1SigOfSig2EqNative.{u} := by
  unfold RocqPending.Corelib.Init.Specif.proj1_sig_of_sig2_eq.statement proj1SigOfSig2EqNative
  simp only [subtype2_equality_native, subtype_equality_native, subtype2_forall_native, subtype2_eq_native, subtype2_native_roundtrip,
    eq_correspondence, closed_projection_value_native]

theorem sig_of_sig2_eq_native :
    (@RocqPending.Corelib.Init.Specif.sig_of_sig2_eq.statement.{u} sig_of_sig2_obligation) ↔
      sigOfSig2EqNative.{u} := by
  unfold RocqPending.Corelib.Init.Specif.sig_of_sig2_eq.statement sigOfSig2EqNative
  simp only [subtype2_equality_native, subtype_equality_native, subtype2_forall_native, subtype2_eq_native, subtype2_native_roundtrip,
    subtype_eq_native, closed_projection_native]

theorem eq_sig2_hprop_native :
    (@RocqPending.Corelib.Init.Specif.eq_sig2_hprop.statement.{u} sig_of_sig2_obligation) ↔
      eqSig2HpropNative.{u} := by
  unfold RocqPending.Corelib.Init.Specif.eq_sig2_hprop.statement eqSig2HpropNative
  simp only [subtype2_equality_native, subtype_equality_native, subtype2_forall_native, subtype2_eq_native, subtype2_native_roundtrip,
    subtype_eq_native, closed_projection_native, eq_correspondence]

theorem eq_sig2_hprop_iff_native :
    (@RocqPending.Corelib.Init.Specif.eq_sig2_hprop_iff.statement.{u} sig_of_sig2_obligation) ↔
      eqSig2HpropIffNative.{u} := by
  unfold RocqPending.Corelib.Init.Specif.eq_sig2_hprop_iff.statement eqSig2HpropIffNative
  simp only [subtype2_equality_native, subtype_equality_native, subtype2_forall_native, source_iff_native, subtype2_eq_native,
    subtype2_native_roundtrip, subtype_eq_native, closed_projection_native, eq_correspondence]

theorem proj3_sig_closed :
    @RocqPending.Corelib.Init.Specif.proj3_sig.statement.{u} sig_of_sig2_obligation :=
  proj3_sig_native.mpr (fun _ _ _ s => s.property.2)

theorem proj1_sig_of_sig2_eq_closed :
    @RocqPending.Corelib.Init.Specif.proj1_sig_of_sig2_eq.statement.{u} sig_of_sig2_obligation :=
  proj1_sig_of_sig2_eq_native.mpr (fun _ _ _ _ _ h => congrArg Subtype.val h)

theorem sig_of_sig2_eq_closed :
    @RocqPending.Corelib.Init.Specif.sig_of_sig2_eq.statement.{u} sig_of_sig2_obligation :=
  sig_of_sig2_eq_native.mpr (fun _ _ _ _ _ h => congrArg dropSecondProperty h)

theorem dropSecondProperty_injective {A : Sort u} {P Q : A → Prop}
    (s t : {x : A // P x ∧ Q x}) (h : dropSecondProperty s = dropSecondProperty t) : s = t :=
  Subtype.ext (congrArg (fun z : Subtype P => z.val) h)

theorem eq_sig2_hprop_closed :
    @RocqPending.Corelib.Init.Specif.eq_sig2_hprop.statement.{u} sig_of_sig2_obligation :=
  eq_sig2_hprop_native.mpr (fun _ _ _ _ s t h => dropSecondProperty_injective s t h)

theorem eq_sig2_hprop_iff_closed :
    @RocqPending.Corelib.Init.Specif.eq_sig2_hprop_iff.statement.{u} sig_of_sig2_obligation :=
  eq_sig2_hprop_iff_native.mpr (fun _ _ _ _ s t =>
    ⟨fun h => congrArg dropSecondProperty h, dropSecondProperty_injective s t⟩)

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
  for name in ["proj3SigNative", "proj1SigOfSig2EqNative", "sigOfSig2EqNative",
      "eqSig2HpropNative", "eqSig2HpropIffNative"] do
    let n := ("NativeBridge.Incremental." ++ name).toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native proposition definition"
    let refs ← dependentNativeRefs body
    unless refs.isEmpty do throwError "Residual source references in {n}: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

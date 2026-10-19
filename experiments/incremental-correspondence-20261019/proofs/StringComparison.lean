import StringRoundtrip
set_option maxHeartbeats 100000
set_option maxRecDepth 4096
noncomputable section
namespace NativeBridge.Incremental.StringComparison
open NativeBridge.Incremental.StringUnsignedSupport
open NativeBridge.Incremental.StringOperations
open NativeBridge.Incremental.StringSpecs
def wordCompare (a b : BitVec 63) : Ordering := compare a.toNat b.toNat
def nativeCompare (a b : Bytes) : Ordering := List.compareLex wordCompare (toWords a) (toWords b)
def compareSpec : Prop := ∀ (a b : Bytes), compareBytes a b = nativeCompare a b

theorem byteNat (x : BitVec 8) : (x.setWidth 63).toNat = x.toNat := by
  have hx := x.isLt
  simp only [BitVec.toNat_setWidth]
  exact Nat.mod_eq_of_lt (by omega)
theorem compareRange_list (a b : Bytes) (fuel i : Nat)
    (ha : i ≤ a.1.val) (hb : i ≤ b.1.val)
    (hf : fuel = min (a.1.val-i) (b.1.val-i)) :
    compareRange a b fuel i =
      List.compareLex wordCompare ((toWords a).drop i) ((toWords b).drop i) := by
  induction fuel generalizing i with
  | zero =>
    have hla : ((toWords a).drop i).length = a.1.val-i := by simp [toWords]
    have hlb : ((toWords b).drop i).length = b.1.val-i := by simp [toWords]
    generalize heqa : (toWords a).drop i = la at *
    generalize heqb : (toWords b).drop i = lb at *
    cases la with
    | nil =>
      cases lb with
      | nil =>
        have hab : a.1.val = b.1.val := by simp only [List.length_nil] at hla hlb; omega
        simp [compareRange, hab, List.compareLex]
      | cons c cs =>
        have hab : a.1.val < b.1.val := by simp only [List.length_nil,List.length_cons] at hla hlb; omega
        simp [compareRange, hab, List.compareLex]
    | cons c cs =>
      cases lb with
      | nil =>
        have hab : b.1.val < a.1.val := by simp only [List.length_nil,List.length_cons] at hla hlb; omega
        simp [compareRange, hab, Nat.not_lt_of_ge (Nat.le_of_lt hab), List.compareLex]
      | cons d ds =>
        simp only [List.length_cons] at hla hlb
        omega
  | succ fuel ih =>
    have hai : i < a.1.val := by omega
    have hbi : i < b.1.val := by omega
    have hal : i < (toWords a).length := by simpa [toWords]
    have hbl : i < (toWords b).length := by simpa [toWords]
    rw [List.drop_eq_getElem_cons hal, List.drop_eq_getElem_cons hbl]
    rw [compareRange, List.compareLex_cons_cons]
    have hstep := ih (i+1) (by omega) (by omega) (by omega)
    rw [← hstep]
    have hca : (toWords a)[i].toNat = (readByte a i).toNat := by
      have hx := a.2[i].isLt
      simp [toWords, readByte, hai]
      omega
    have hcb : (toWords b)[i].toNat = (readByte b i).toNat := by
      have hx := b.2[i].isLt
      simp [toWords, readByte, hbi]
      omega
    unfold wordCompare
    rw [hca, hcb, Nat.compare_eq_ite_lt]
    by_cases hlt : (readByte a i).toNat < (readByte b i).toNat <;>
      by_cases hgt : (readByte b i).toNat < (readByte a i).toNat <;> simp [hlt, hgt]
theorem compareSpec_native : compareSpec := by
  intro a b
  simpa [compareBytes, nativeCompare] using
    compareRange_list a b (min a.1.val b.1.val) 0 (by omega) (by omega) (by simp)

theorem listCompare_agrees (xs ys : RList (BitVec 63)) :
  comparisonTo (Rocq.Corelib.Lists.ListDef.list_compare (BitVec 63)
    Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.compare xs ys) =
    List.compareLex wordCompare (listTo xs) (listTo ys) := by
  induction xs generalizing ys with
  | nil => cases ys <;> rfl
  | cons x xs ih =>
    cases ys with
    | nil => rfl
    | cons y ys =>
      simp only [Rocq.Corelib.Lists.ListDef.list_compare, listTo, List.compareLex]
      have hc : comparisonTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.compare x y) =
          wordCompare x y :=
        (int63_compare_agrees x y).trans (Nat.compare_eq_ite_lt x.toNat y.toNat).symm
      cases h : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.compare x y <;>
        simp only [h, comparisonTo] at hc ⊢
      · rw [← hc]; exact ih ys
      · rw [← hc]
      · rw [← hc]
theorem comparisonInjective {a b : RComparison} (h : comparisonTo a = comparisonTo b) : a=b :=
  (comparisonIso.eq_iff a b).mp h
theorem compareSpec_proof : Rocq.Corelib.Strings.PrimStringAxioms.compare_spec.statement := by
  intro a b
  apply eqOf
  apply comparisonInjective
  have lhs := (compare_agrees a b).trans (compareSpec_native (byteStringTo a) (byteStringTo b))
  have rhs := (listCompare_agrees
    (Rocq.Corelib.Strings.PrimStringAxioms.to_list a)
    (Rocq.Corelib.Strings.PrimStringAxioms.to_list b)).trans
    (map2 (List.compareLex wordCompare) (toList_agrees a) (toList_agrees b))
  exact lhs.trans rhs.symm

theorem primitiveCompare_agrees (a b : Rocq.Corelib.Strings.PrimString.string) :
    comparisonTo (Rocq.Corelib.Strings.PrimString.compare a b) = nativeCompare (byteStringTo a) (byteStringTo b) :=
  (compare_agrees a b).trans (compareSpec_native (byteStringTo a) (byteStringTo b))
theorem compareSpec_correspondence : Rocq.Corelib.Strings.PrimStringAxioms.compare_spec.statement ↔ compareSpec :=
  ⟨fun _ => compareSpec_native, fun _ => @compareSpec_proof⟩
end NativeBridge.Incremental.StringComparison

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
  for name in ["NativeBridge.Incremental.StringComparison.compareSpec", "NativeBridge.Incremental.StringComparison.nativeCompare"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

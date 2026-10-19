import Sint63ArithmeticSupport
set_option maxHeartbeats 100000
noncomputable section
namespace NativeBridge.Incremental.Sint63Operations
open NativeBridge.Incremental.Sint63UnsignedSupport
open NativeBridge.Incremental.BinaryArithmetic

theorem boolInjective {a b : Rocq.Corelib.Init.Datatypes.bool} (h : boolTo a = boolTo b) : a = b := by
  cases a <;> cases b <;> simp_all [boolTo]
theorem unsignedSource (x : Word) :
    binaryIntTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x) = Int.ofNat x.toNat := by
  have he (z : Rocq.Corelib.Numbers.BinNums.Z) : binaryIntTo z = zTo z := by cases z <;> rfl
  exact (he _).trans (toZ_agrees x)
def minimum : Word := BitVec.ofNat 63 (2^62)
def signedInteger (x : Word) : Int := x.toInt
theorem minimum_agrees : Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.min_int = minimum := rfl
theorem signedInteger_agrees (x : Word) :
    binaryIntTo (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z x) = signedInteger x := by
  have hc := int63_ltb_agrees x Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.min_int
  have hmin : Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.min_int.toNat = 2^62 := rfl
  rw [hmin] at hc
  by_cases hx : x.toNat < 2^62
  · have hb : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb x
        Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.min_int = .true := by
      apply boolInjective
      exact hc.trans (by simp [hx,boolTo])
    unfold Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z
    rw [hb]
    change binaryIntTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x) = x.toInt
    exact (unsignedSource x).trans (BitVec.toInt_eq_toNat_of_lt (by omega)).symm
  · have hb : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb x
        Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.min_int = .false := by
      apply boolInjective
      exact hc.trans (by simp [hx,boolTo])
    unfold Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z
    rw [hb]
    have hn := (z_opp_agrees
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z
        (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.sub (0#63) x))).trans
      (congrArg Int.neg (unsignedSource (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.sub (0#63) x)))
    have hw := congrArg (fun w : Word => -Int.ofNat w.toNat) (int63_sub_agrees (0#63) x)
    have ht : -Int.ofNat ((0 : Word)-x).toNat = x.toInt := by
      have hnot : ¬ 2*x.toNat < 2^63 := by omega
      have hbound : 2^63-x.toNat < 2^63 := by omega
      rw [BitVec.toInt_eq_toNat_cond,if_neg hnot]
      change -Int.ofNat ((2^63-x.toNat)%2^63) = _
      rw [Nat.mod_eq_of_lt hbound]
      have hxb := x.isLt
      simp only [Int.ofNat_eq_natCast]
      omega
    exact hn.trans (hw.trans ht)
theorem map2 {A B C : Type} (f : A → B → C) {a a' : A} {b b' : B}
    (ha : a = a') (hb : b = b') : f a b = f a' b' := by cases ha; cases hb; rfl
theorem comparisonInjective {a b : Rocq.Corelib.Init.Datatypes.comparison}
    (h : comparisonTo a = comparisonTo b) : a = b := by
  cases a <;> cases b <;> cases h <;> rfl
def comparisonSpec : Prop := ∀ x y : Word,
  (if x.toInt < y.toInt then Ordering.lt else if y.toInt < x.toInt then Ordering.gt else Ordering.eq) =
    compare x.toInt y.toInt
def lessSpec : Prop := ∀ x y : Word,
  decide (x.toInt < y.toInt) = true ↔ compare x.toInt y.toInt = Ordering.lt
def lessEqualSpec : Prop := ∀ x y : Word,
  decide (x.toInt ≤ y.toInt) = true ↔ compare x.toInt y.toInt ≠ Ordering.gt
theorem comparisonSpec_native : comparisonSpec := by
  intro x y
  rw [Int.compare_eq_ite_lt]
theorem lessSpec_native : lessSpec := by intro x y; simp [Int.compare_eq_lt]
theorem lessEqualSpec_native : lessEqualSpec := by intro x y; simp [Int.compare_eq_gt]
theorem sourceCompare (x y : Word) :
    comparisonTo (Rocq.Corelib.BinNums.IntDef.Z.compare
      (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z x)
      (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z y)) = compare x.toInt y.toInt :=
  (NativeBridge.Incremental.BinaryInt.z_compare_agrees _ _).trans
    (map2 (compare : Int → Int → Ordering) (signedInteger_agrees x) (signedInteger_agrees y))
theorem comparisonSpec_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.compare_spec.statement := by
  change ∀ (x y : Word), _
  intro x y
  apply eqOf
  apply comparisonInjective
  exact (int63_compares_agrees x y).trans ((comparisonSpec_native x y).trans (sourceCompare x y).symm)
theorem lessSpec_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.ltb_spec.statement := by
  change ∀ (x y : Word), _
  intro x y
  apply Rocq.Corelib.Init.Logic.and.conj
  · intro h
    have hb := congrArg boolTo (eqTo h)
    have hn : decide (x.toInt < y.toInt) = true := (int63_ltsb_agrees x y).symm.trans hb
    apply eqOf
    apply comparisonInjective
    exact (sourceCompare x y).trans ((lessSpec_native x y).mp hn)
  · intro h
    have hc := congrArg comparisonTo (eqTo h)
    have hn : compare x.toInt y.toInt = Ordering.lt := (sourceCompare x y).symm.trans hc
    apply eqOf
    apply boolInjective
    exact (int63_ltsb_agrees x y).trans ((lessSpec_native x y).mpr hn)
theorem lessEqualSpec_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.leb_spec.statement := by
  change ∀ (x y : Word), _
  intro x y
  apply Rocq.Corelib.Init.Logic.and.conj
  · intro h hc
    have hb := congrArg boolTo (eqTo h)
    have hn : decide (x.toInt ≤ y.toInt) = true := (int63_lesb_agrees x y).symm.trans hb
    have hcomp := congrArg comparisonTo (eqTo hc)
    have he : compare x.toInt y.toInt = Ordering.gt := (sourceCompare x y).symm.trans hcomp
    exact ((lessEqualSpec_native x y).mp hn he).elim
  · intro h
    have hn : compare x.toInt y.toInt ≠ Ordering.gt := by
      intro hc
      have hm := comparisonInjective (b := Rocq.Corelib.Init.Datatypes.comparison.Gt) ((sourceCompare x y).trans hc)
      cases h (eqOf hm)
    apply eqOf
    apply boolInjective
    exact (int63_lesb_agrees x y).trans ((lessEqualSpec_native x y).mpr hn)

theorem comparisonSpec_correspondence : Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.compare_spec.statement ↔ comparisonSpec :=
  ⟨fun _ => comparisonSpec_native,fun _ => comparisonSpec_proof⟩

theorem lessSpec_correspondence : Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.ltb_spec.statement ↔ lessSpec :=
  ⟨fun _ => lessSpec_native,fun _ => lessSpec_proof⟩

theorem lessEqualSpec_correspondence : Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.leb_spec.statement ↔ lessEqualSpec :=
  ⟨fun _ => lessEqualSpec_native,fun _ => lessEqualSpec_proof⟩

end NativeBridge.Incremental.Sint63Operations

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
  for name in ["NativeBridge.Incremental.Sint63Operations.comparisonSpec", "NativeBridge.Incremental.Sint63Operations.lessEqualSpec", "NativeBridge.Incremental.Sint63Operations.lessSpec", "NativeBridge.Incremental.Sint63Operations.minimum", "NativeBridge.Incremental.Sint63Operations.signedInteger"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

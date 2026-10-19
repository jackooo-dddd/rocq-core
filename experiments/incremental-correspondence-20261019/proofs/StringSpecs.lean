import StringOperations
set_option maxHeartbeats 100000
set_option maxRecDepth 4096
noncomputable section
namespace NativeBridge.Incremental.StringSpecs
open NativeBridge.Incremental.StringUnsignedSupport
open NativeBridge.Incremental.StringOperations

def getSpec : Prop := ∀ (s : Bytes) (i : BitVec 63),
  (readByte s i.toNat).setWidth 63 = (toWords s)[i.toNat]?.getD 0
def lengthSpec : Prop := ∀ s : Bytes, s.1.val = (toWords s).length
def makeSpec : Prop := ∀ (i c : BitVec 63),
  toWords (repeatByte i c) = List.replicate (min i.toNat 16777211) (c &&& 255#63)
def subSpec : Prop := ∀ (s : Bytes) (off len : BitVec 63),
  toWords (sliceBytes s off len) = ((toWords s).drop off.toNat).take len.toNat
def validSpec : Prop := ∀ (s : Bytes), ∀ c ∈ toWords s, validChar c
def boundSpec : Prop := ∀ (s : Bytes), (toWords s).length ≤ 16777211

theorem readList (s : Bytes) (i : Nat) :
    (readByte s i).setWidth 63 = (toWords s)[i]?.getD 0 := by
  by_cases hi : i < s.1.val
  · simp [readByte, hi, toWords]
  · have hn : (toWords s).length ≤ i := by simp [toWords]; omega
    simp [readByte, hi, List.getElem?_eq_none hn]
theorem getSpec_native : getSpec := fun s i => readList s i.toNat
theorem lengthSpec_native : lengthSpec := by intro s; simp [toWords]
theorem makeSpec_native : makeSpec := by
  intro i c
  apply List.ext_getElem
  · simp [toWords, repeatByte, bounded]
  · intro k h₁ h₂
    simp only [toWords, repeatByte, Vector.toList_replicate, List.map_replicate,
      List.getElem_replicate]
    apply BitVec.eq_of_toNat_eq
    simp only [BitVec.toNat_setWidth, BitVec.toNat_ofNat, BitVec.toNat_and]
    change c.toNat % 256 % 2^63 = c.toNat &&& (2^8-1)
    rw [Nat.and_two_pow_sub_one_eq_mod]
    omega
theorem subSpec_native : subSpec := by
  intro s off len
  have hs := s.1.isLt
  have hb : min len.toNat (s.1.val-off.toNat) ≤ 16777211 := by omega
  apply List.ext_getElem
  · simp [toWords, sliceBytes, bounded, Nat.min_eq_left hb]
  · intro k h₁ h₂
    have hk : k < min len.toNat (s.1.val-off.toNat) := by
      simpa [toWords, sliceBytes, bounded, Nat.min_eq_left hb] using h₁
    have hi : off.toNat + k < s.1.val := by omega
    simp [toWords, sliceBytes, readByte, hi]
theorem validSpec_native : validSpec := by
  intro s c hc
  obtain ⟨b,hb,rfl⟩ := List.mem_map.mp hc
  unfold validChar
  have h := b.isLt
  simp only [BitVec.toNat_setWidth]
  omega
theorem boundSpec_native : boundSpec := by
  intro s
  have hs := s.1.isLt
  simp only [toWords, List.length_map, Vector.length_toList]
  omega

theorem natInjective {a b : MN} (h : natTo a = natTo b) : a = b :=
  (natIso.eq_iff a b).mp h
theorem listInjective {A : Type} {a b : RList A} (h : listTo a = listTo b) : a = b :=
  ((listIso A).eq_iff a b).mp h

theorem getSpec_proof : Rocq.Corelib.Strings.PrimStringAxioms.get_spec.statement := by
  intro s i
  apply eqOf
  have h := nth_agrees
    (Rocq.Corelib.BinNums.IntDef.Z.to_nat (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z i))
    (Rocq.Corelib.Strings.PrimStringAxioms.to_list s) (0#63)
  rw (transparency := .default) [unsignedNat_agrees, toList_agrees] at h
  exact (getWord_agrees s i).trans ((readList (byteStringTo s) i.toNat).trans h.symm)
theorem lengthSpec_proof : Rocq.Corelib.Strings.PrimStringAxioms.length_spec.statement := by
  intro s
  apply eqOf
  apply natInjective
  change natTo _ = natTo _
  have h₁ := (unsignedNat_agrees (Rocq.Corelib.Strings.PrimString.length s)).trans (lengthWord_agrees s)
  have h₂ := (length_agrees (Rocq.Corelib.Strings.PrimStringAxioms.to_list s)).trans
    (congrArg List.length (toList_agrees s))
  exact h₁.trans ((lengthSpec_native (byteStringTo s)).trans h₂.symm)
theorem map2 {A B C : Sort _} (f : A → B → C) {a a' : A} {b b' : B}
    (ha : a = a') (hb : b = b') : f a b = f a' b' := by cases ha; cases hb; rfl
theorem makeSpec_proof : Rocq.Corelib.Strings.PrimStringAxioms.make_spec.statement := by
  intro i c
  apply eqOf
  apply listInjective
  change listTo _ = listTo _
  have lhs := (toList_agrees (Rocq.Corelib.Strings.PrimString.make i c)).trans
    ((congrArg toWords (make_agrees i c)).trans (makeSpec_native i c))
  have hn := nat_min_agrees
    (Rocq.Corelib.BinNums.IntDef.Z.to_nat (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z i))
    (Rocq.Corelib.BinNums.IntDef.Z.to_nat (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z Rocq.Corelib.Strings.PrimString.max_length))
  have hmin : natTo (Rocq.Corelib.Init.Nat.min
    (Rocq.Corelib.BinNums.IntDef.Z.to_nat (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z i))
    (Rocq.Corelib.BinNums.IntDef.Z.to_nat (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z Rocq.Corelib.Strings.PrimString.max_length))) =
      min i.toNat 16777211 := by
    apply hn.trans
    exact map2 Nat.min (unsignedNat_agrees i) (unsignedNat_agrees Rocq.Corelib.Strings.PrimString.max_length)
  have rhs := repeat_agrees
    (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.land c (255#63))
    (Rocq.Corelib.Init.Nat.min
      (Rocq.Corelib.BinNums.IntDef.Z.to_nat (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z i))
      (Rocq.Corelib.BinNums.IntDef.Z.to_nat (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z Rocq.Corelib.Strings.PrimString.max_length)))
  have hrep := map2 (List.replicate (α := BitVec 63)) hmin (int63_land_agrees c (255#63))
  exact lhs.trans (rhs.trans hrep).symm

theorem takeWord_agrees (i : BitVec 63) (xs : RList (BitVec 63)) :
  listTo (Rocq.Corelib.Lists.ListDef.firstn (BitVec 63)
    (Rocq.Corelib.BinNums.IntDef.Z.to_nat (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z i)) xs) =
    (listTo xs).take i.toNat :=
  (firstn_agrees _ xs).trans (congrArg (fun n => (listTo xs).take n) (unsignedNat_agrees i))
theorem dropWord_agrees (i : BitVec 63) (xs : RList (BitVec 63)) :
  listTo (Rocq.Corelib.Lists.ListDef.skipn (BitVec 63)
    (Rocq.Corelib.BinNums.IntDef.Z.to_nat (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z i)) xs) =
    (listTo xs).drop i.toNat :=
  (skipn_agrees _ xs).trans (congrArg (fun n => (listTo xs).drop n) (unsignedNat_agrees i))
theorem subSpec_proof : Rocq.Corelib.Strings.PrimStringAxioms.sub_spec.statement := by
  intro s off len
  apply eqOf
  apply listInjective
  change listTo _ = listTo _
  have lhs := (toList_agrees (Rocq.Corelib.Strings.PrimString.sub s off len)).trans
    ((congrArg toWords (sub_agrees s off len)).trans (subSpec_native (byteStringTo s) off len))
  have hd := (dropWord_agrees off (Rocq.Corelib.Strings.PrimStringAxioms.to_list s)).trans
    (congrArg (fun xs : List (BitVec 63) => xs.drop off.toNat) (toList_agrees s))
  have rhs := (takeWord_agrees len (Rocq.Corelib.Lists.ListDef.skipn (BitVec 63)
    (Rocq.Corelib.BinNums.IntDef.Z.to_nat (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z off))
    (Rocq.Corelib.Strings.PrimStringAxioms.to_list s))).trans
      (congrArg (fun xs : List (BitVec 63) => xs.take len.toNat) hd)
  exact lhs.trans rhs.symm
theorem validSpec_proof : Rocq.Corelib.Strings.PrimStringAxioms.to_list_char63_valid.statement := by
  intro s
  apply (forall_list_agrees _ _).mpr
  intro c hc
  rw [toList_agrees] at hc
  exact (charValid_agrees c).mpr (validSpec_native (byteStringTo s) c hc)


theorem peano_le_of_native (n m : Nat) (h : n ≤ m) :
 Rocq.Corelib.Init.Peano.le (natOf n) (natOf m) := by
 induction h with
 | refl => exact .le_n _
 | step h ih => exact .le_S _ _ ih
@[simp] theorem peano_le_agrees (n m : MN) :
 Rocq.Corelib.Init.Peano.le n m ↔ natTo n ≤ natTo m := by
 constructor
 · intro h
   induction h using Rocq.Corelib.Init.Peano.le.rec with
   | le_n => exact Nat.le_refl _
   | le_S m h ih => exact Nat.le_trans ih (Nat.le_succ _)
 · intro h
   simpa only [natOf_to] using peano_le_of_native (natTo n) (natTo m) h

theorem boundSpec_proof : Rocq.Corelib.Strings.PrimStringAxioms.to_list_length.statement := by
  intro s
  apply (peano_le_agrees _ _).mpr
  rw [length_agrees, toList_agrees]
  have h := unsignedNat_agrees Rocq.Corelib.Strings.PrimString.max_length
  rw [h]
  exact boundSpec_native _
theorem getSpec_correspondence : Rocq.Corelib.Strings.PrimStringAxioms.get_spec.statement ↔ getSpec :=
  ⟨fun _ => getSpec_native, fun _ => @getSpec_proof⟩

theorem lengthSpec_correspondence : Rocq.Corelib.Strings.PrimStringAxioms.length_spec.statement ↔ lengthSpec :=
  ⟨fun _ => lengthSpec_native, fun _ => @lengthSpec_proof⟩

theorem makeSpec_correspondence : Rocq.Corelib.Strings.PrimStringAxioms.make_spec.statement ↔ makeSpec :=
  ⟨fun _ => makeSpec_native, fun _ => @makeSpec_proof⟩

theorem subSpec_correspondence : Rocq.Corelib.Strings.PrimStringAxioms.sub_spec.statement ↔ subSpec :=
  ⟨fun _ => subSpec_native, fun _ => @subSpec_proof⟩

theorem validSpec_correspondence : Rocq.Corelib.Strings.PrimStringAxioms.to_list_char63_valid.statement ↔ validSpec :=
  ⟨fun _ => validSpec_native, fun _ => @validSpec_proof⟩

theorem boundSpec_correspondence : Rocq.Corelib.Strings.PrimStringAxioms.to_list_length.statement ↔ boundSpec :=
  ⟨fun _ => boundSpec_native, fun _ => @boundSpec_proof⟩

end NativeBridge.Incremental.StringSpecs

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
  for name in ["NativeBridge.Incremental.StringSpecs.boundSpec", "NativeBridge.Incremental.StringSpecs.getSpec", "NativeBridge.Incremental.StringSpecs.lengthSpec", "NativeBridge.Incremental.StringSpecs.makeSpec", "NativeBridge.Incremental.StringSpecs.subSpec", "NativeBridge.Incremental.StringSpecs.validSpec"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

import Auto_Array_ArrayAxioms
import Init.Data.BitVec.Lemmas
set_option maxHeartbeats 100000
set_option linter.unusedSimpArgs false
noncomputable section
namespace NativeBridge.Incremental.ArraySpecs
universe u
abbrev Word := BitVec 63
-- Existing array representation proofs rechecked in ArrayAxioms.
abbrev NativeArray (A : Type u) := Σ n : Fin (4194304), Vector A n.val × A
def arrayTo {A : Type u} (a : Rocq.Corelib.Array.PrimArray.array A) : NativeArray A :=
  ⟨a.size, Vector.ofFn a.value, a.fallback⟩
def arrayOf {A : Type u} (a : NativeArray A) : Rocq.Corelib.Array.PrimArray.array A :=
  ⟨a.1, fun i => a.2.1[i.val], a.2.2⟩
@[simp] theorem array_of_to {A : Type u} (a : Rocq.Corelib.Array.PrimArray.array A) : arrayOf (arrayTo a) = a := by
  cases a with
  | mk n f d =>
    change Rocq2Lean.PrimArray.Rep.mk n (fun i => (Vector.ofFn f)[i.val]) d = _
    have h : (fun i => (Vector.ofFn f)[i.val]) = f := by funext i; simp [Vector.get]
    rw [h]
@[simp] theorem array_to_of {A : Type u} (a : NativeArray A) : arrayTo (arrayOf a) = a := by
  rcases a with ⟨n,xs,d⟩
  change (⟨n,(Vector.ofFn (fun i => xs[i.val]),d)⟩ : NativeArray A) = ⟨n,(xs,d)⟩
  have h : Vector.ofFn (fun i => xs[i.val]) = xs := by apply Vector.ext; intros i hi; simp [Vector.get]
  rw [h]
def arrayIso (A : Type u) : Iso (Rocq.Corelib.Array.PrimArray.array A) (NativeArray A) := ⟨arrayTo, arrayOf, array_of_to, array_to_of⟩
@[simp] theorem array_default_agrees {A : Type u} (a : Rocq.Corelib.Array.PrimArray.array A) :
  Rocq.Corelib.Array.PrimArray.default A a = (arrayTo a).2.2 := rfl
@[simp] theorem array_length_agrees {A : Type u} (a : Rocq.Corelib.Array.PrimArray.array A) :
  Rocq.Corelib.Array.PrimArray.length A a = BitVec.ofNat 63 (arrayTo a).1.val := rfl
@[simp] theorem array_copy_agrees {A : Type u} (a : Rocq.Corelib.Array.PrimArray.array A) :
  arrayTo (Rocq.Corelib.Array.PrimArray.copy A a) = arrayTo a := rfl
theorem array_get_agrees {A : Type u} (a : Rocq.Corelib.Array.PrimArray.array A) (i : BitVec 63) :
  Rocq.Corelib.Array.PrimArray.get A a i =
    if h : i.toNat < (arrayTo a).1.val then (arrayTo a).2.1[i.toNat] else (arrayTo a).2.2 := by
  simp [Rocq.Corelib.Array.PrimArray.get, Rocq2Lean.PrimArray.get, arrayTo]

theorem array_make_length_agrees {A : Type u} (n : BitVec 63) (x : A) :
 (arrayTo (Rocq.Corelib.Array.PrimArray.make A n x)).1.val = min n.toNat 4194303 := by
 simp only [arrayTo, Rocq.Corelib.Array.PrimArray.make, Rocq2Lean.PrimArray.make,
   Rocq2Lean.PrimArray.boundedSize, Rocq2Lean.PrimArray.maxLength]
 by_cases h : n.toNat < 4194303 + 1
 · simp [h]; omega
 · simp [h]; omega
theorem array_make_values_agrees {A : Type u} (n : BitVec 63) (x : A) :
 (arrayTo (Rocq.Corelib.Array.PrimArray.make A n x)).2.1 =
 Vector.replicate _ x := by
 apply Vector.ext
 intro i hi
 simp [arrayTo, Rocq.Corelib.Array.PrimArray.make, Rocq2Lean.PrimArray.make, Vector.get]
theorem array_set_agrees {A : Type u} (a : Rocq.Corelib.Array.PrimArray.array A)
 (i : BitVec 63) (x : A) :
 arrayTo (Rocq.Corelib.Array.PrimArray.set A a i x) =
 ⟨(arrayTo a).1, (arrayTo a).2.1.setIfInBounds i.toNat x, (arrayTo a).2.2⟩ := by
 change (⟨a.size,Vector.ofFn (fun j => if j.val == i.toNat then x else a.value j), a.fallback⟩ : NativeArray A) = _
 congr 2
 apply Vector.ext
 intro j hj
 simp only [arrayTo, Vector.getElem_setIfInBounds, Vector.getElem_ofFn, beq_iff_eq]
 by_cases h : j = i.toNat
 · simp [h]
 · have hi : i.toNat ≠ j := Ne.symm h
   simp [h, hi]

def read {A : Type u} (a : NativeArray A) (i : Word) : A :=
  if h : i.toNat < a.1.val then a.2.1[i.toNat] else a.2.2
def write {A : Type u} (a : NativeArray A) (i : Word) (x : A) : NativeArray A :=
  ⟨a.1,a.2.1.setIfInBounds i.toNat x,a.2.2⟩
def make {A : Type u} (n : Word) (x : A) : NativeArray A :=
  ⟨⟨min n.toNat 4194303, by omega⟩,Vector.replicate _ x,x⟩
def defaultSet : Prop := ∀ (A : Type u) (a : NativeArray A) i x, (write a i x).2.2 = a.2.2
def lengthSet : Prop := ∀ (A : Type u) (a : NativeArray A) i x, (write a i x).1.val = a.1.val
def getCopy : Prop := ∀ (A : Type u) (a : NativeArray A) i, read (id a) i = read a i
def lengthCopy : Prop := ∀ (A : Type u) (a : NativeArray A), (id a).1.val = a.1.val
def boundedLength : Prop := ∀ (A : Type u) (a : NativeArray A), a.1.val ≤ 4194303
def getMake : Prop := ∀ (A : Type u) (x : A) n i, read (make n x) i = x
def lengthMake : Prop := ∀ (A : Type u) (n : Word) (x : A), (make n x).1.val = min n.toNat 4194303
def getOutOfBounds : Prop := ∀ (A : Type u) (a : NativeArray A) i, a.1.val ≤ i.toNat → read a i = a.2.2
def getSetSame : Prop := ∀ (A : Type u) (a : NativeArray A) i x, i.toNat < a.1.val → read (write a i x) i = x
def getSetOther : Prop := ∀ (A : Type u) (a : NativeArray A) i j x, i ≠ j → read (write a i x) j = read a j
def extensionality : Prop := ∀ (A : Type u) (a b : NativeArray A),
  a.1.val = b.1.val → (∀ i : Word, i.toNat < a.1.val → read a i = read b i) →
  a.2.2 = b.2.2 → a = b

theorem defaultSet_native : defaultSet.{u} := fun _ _ _ _ => rfl
theorem lengthSet_native : lengthSet.{u} := fun _ _ _ _ => rfl
theorem getCopy_native : getCopy.{u} := fun _ _ _ => rfl
theorem lengthCopy_native : lengthCopy.{u} := fun _ _ => rfl
theorem boundedLength_native : boundedLength.{u} := by intro A a; have := a.1.isLt; omega
theorem getMake_native : getMake.{u} := by intro A x n i; simp [read,make]
theorem lengthMake_native : lengthMake.{u} := fun _ _ _ => rfl
theorem getOutOfBounds_native : getOutOfBounds.{u} := by intro A a i h; simp [read,show ¬i.toNat<a.1.val by omega]
theorem getSetSame_native : getSetSame.{u} := by
  intro A a i x h
  simp [read,write,h]
theorem getSetOther_native : getSetOther.{u} := by
  intro A a i j x h
  have hn : j.toNat ≠ i.toNat := fun hh => h (BitVec.eq_of_toNat_eq hh.symm)
  by_cases hj : j.toNat < a.1.val <;> simp [read,write,hj,Vector.getElem_setIfInBounds,hn,Ne.symm hn]
theorem extensionality_native : extensionality.{u} := by
  intro A a b hn hg hd
  rcases a with ⟨an,av,ad⟩
  rcases b with ⟨bn,bv,bd⟩
  have he : an = bn := Fin.ext hn
  cases he
  have hv : av = bv := by
    apply Vector.ext
    intro i hi
    have hil : i < 2^63 := by have := an.isLt; omega
    have hx := hg (BitVec.ofNat 63 i)
    simp only [BitVec.toNat_ofNat,Nat.mod_eq_of_lt hil] at hx
    have hh := hx hi
    simpa [read,hi,Nat.mod_eq_of_lt hil] using hh
  cases hv
  cases hd
  rfl

theorem defaultSet_proof : Rocq.Corelib.Array.ArrayAxioms.default_set.statement.{u} := fun _ _ _ _ => eqOf rfl
theorem lengthSet_proof : Rocq.Corelib.Array.ArrayAxioms.length_set.statement.{u} := fun _ _ _ _ => eqOf rfl
theorem getCopy_proof : Rocq.Corelib.Array.ArrayAxioms.get_copy.statement.{u} := fun _ _ _ => eqOf rfl
theorem lengthCopy_proof : Rocq.Corelib.Array.ArrayAxioms.length_copy.statement.{u} := fun _ _ => eqOf rfl
theorem getMake_proof : Rocq.Corelib.Array.ArrayAxioms.get_make.statement.{u} := by
  intro A x n i
  apply eqOf
  simp [Rocq.Corelib.Array.PrimArray.get,Rocq.Corelib.Array.PrimArray.make,Rocq2Lean.PrimArray.get,Rocq2Lean.PrimArray.make]
  by_cases h : i.toNat < (Rocq2Lean.PrimArray.boundedSize n.toNat).val
  · exact dif_pos h
  · exact dif_neg h
@[simp] theorem int63_ltb_agrees (x y : BitVec 63) : boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb x y) = decide (x.toNat < y.toNat) := by
  change boolTo (Bool.rec .false .true (decide (x.toNat < y.toNat))) = _
  cases (decide (x.toNat < y.toNat)) <;> rfl

@[simp] theorem int63_leb_agrees (x y : BitVec 63) : boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.leb x y) = decide (x.toNat ≤ y.toNat) := by
  change boolTo (Bool.rec .false .true (decide (x.toNat ≤ y.toNat))) = _
  cases (decide (x.toNat ≤ y.toNat)) <;> rfl


theorem boolInjective {a b : Rocq.Corelib.Init.Datatypes.bool} (h : boolTo a = boolTo b) : a = b := by
  cases a <;> cases b <;> simp_all [boolTo]
theorem lengthValue {A : Type u} (a : Rocq.Corelib.Array.PrimArray.array A) :
    (Rocq.Corelib.Array.PrimArray.length A a).toNat = a.size.val := by
  have h : a.size.val < 2^63 := by have ha := a.size.isLt; change a.size.val < 4194304 at ha; omega
  exact Nat.mod_eq_of_lt h
theorem lengthBool {A : Type u} (a : Rocq.Corelib.Array.PrimArray.array A) (i : Word) :
    boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb i (Rocq.Corelib.Array.PrimArray.length A a)) =
      decide (i.toNat < a.size.val) :=
  (int63_ltb_agrees _ _).trans (congrArg (fun n => decide (i.toNat < n)) (lengthValue a))
theorem getOutOfBounds_proof : Rocq.Corelib.Array.ArrayAxioms.get_out_of_bounds.statement.{u} := by
  intro A a i h
  have hb := (lengthBool a i).symm.trans (congrArg boolTo (eqTo h))
  have hn : ¬ i.toNat < a.size.val := of_decide_eq_false hb
  apply eqOf
  simp [Rocq.Corelib.Array.PrimArray.get,Rocq2Lean.PrimArray.get,hn,
    Rocq.Corelib.Array.PrimArray.default,Rocq2Lean.PrimArray.default]
theorem getSetSame_proof : Rocq.Corelib.Array.ArrayAxioms.get_set_same.statement.{u} := by
  intro A a i x h
  have hb := (lengthBool a i).symm.trans (congrArg boolTo (eqTo h))
  have hn : i.toNat < a.size.val := of_decide_eq_true hb
  apply eqOf
  simp [Rocq.Corelib.Array.PrimArray.get,Rocq2Lean.PrimArray.get,
    Rocq.Corelib.Array.PrimArray.set,Rocq2Lean.PrimArray.set,hn]
theorem getSetOther_proof : Rocq.Corelib.Array.ArrayAxioms.get_set_other.statement.{u} := by
  intro A a i j x h
  have hn : j.toNat ≠ i.toNat := by
    intro he
    cases h (eqOf (BitVec.eq_of_toNat_eq he.symm))
  apply eqOf
  simp [Rocq.Corelib.Array.PrimArray.get,Rocq2Lean.PrimArray.get,
    Rocq.Corelib.Array.PrimArray.set,Rocq2Lean.PrimArray.set,hn,Bool.beq_eq_decide_eq]
theorem boundedLength_proof : Rocq.Corelib.Array.ArrayAxioms.leb_length.statement.{u} := by
  intro A a
  apply eqOf
  apply boolInjective
  have hb := int63_leb_agrees (Rocq.Corelib.Array.PrimArray.length A a)
    Rocq.Corelib.Array.PrimArray.max_length
  apply hb.trans
  rw [lengthValue]
  change decide (a.size.val ≤ 4194303) = true
  have ha := a.size.isLt
  change a.size.val < 4194304 at ha
  simp; omega
theorem lengthMake_proof : Rocq.Corelib.Array.ArrayAxioms.length_make.statement.{u} := by
  change ∀ (A : Type u) (n : Word) (x : A), _
  intro A n x
  apply eqOf
  unfold Rocq.Corelib.Array.PrimArray.length Rocq.Corelib.Array.PrimArray.make
    Rocq2Lean.PrimArray.length Rocq2Lean.PrimArray.make Rocq2Lean.PrimArray.boundedSize
    Rocq2Lean.PrimArray.maxLength Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.leb Rocq2Lean.PrimInt63.leb
  by_cases h : n.toNat < 4194303+1
  · have h' : n.toNat ≤ 4194303 := by omega
    simp [h,h',Rocq.Corelib.Array.PrimArray.max_length]
    rfl
  · have h' : ¬n.toNat ≤ 4194303 := by omega
    simp [h,h',Rocq.Corelib.Array.PrimArray.max_length]
    rfl
theorem extensionality_proof : Rocq.Corelib.Array.ArrayAxioms.array_ext.statement.{u} := by
  intro A a b hn hg hd
  apply eqOf
  apply (arrayIso A).injective
  apply extensionality_native A (arrayTo a) (arrayTo b)
  · have h := congrArg BitVec.toNat (eqTo hn)
    rw [lengthValue,lengthValue] at h
    exact h
  · intro i hi
    have hb : Rocq.Corelib.Init.Logic.eq Rocq.Corelib.Init.Datatypes.bool
        (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb i (Rocq.Corelib.Array.PrimArray.length A a))
        Rocq.Corelib.Init.Datatypes.bool.true := by
      apply eqOf
      apply boolInjective
      exact (lengthBool a i).trans (decide_eq_true hi)
    exact (array_get_agrees a i).symm.trans ((eqTo (hg i hb)).trans (array_get_agrees b i))
  · exact eqTo hd

theorem defaultSet_correspondence : Rocq.Corelib.Array.ArrayAxioms.default_set.statement.{u} ↔ defaultSet.{u} :=
  ⟨fun _ => defaultSet_native,fun _ => defaultSet_proof⟩

theorem lengthSet_correspondence : Rocq.Corelib.Array.ArrayAxioms.length_set.statement.{u} ↔ lengthSet.{u} :=
  ⟨fun _ => lengthSet_native,fun _ => lengthSet_proof⟩

theorem getCopy_correspondence : Rocq.Corelib.Array.ArrayAxioms.get_copy.statement.{u} ↔ getCopy.{u} :=
  ⟨fun _ => getCopy_native,fun _ => getCopy_proof⟩

theorem lengthCopy_correspondence : Rocq.Corelib.Array.ArrayAxioms.length_copy.statement.{u} ↔ lengthCopy.{u} :=
  ⟨fun _ => lengthCopy_native,fun _ => lengthCopy_proof⟩

theorem getMake_correspondence : Rocq.Corelib.Array.ArrayAxioms.get_make.statement.{u} ↔ getMake.{u} :=
  ⟨fun _ => getMake_native,fun _ => getMake_proof⟩

theorem lengthMake_correspondence : Rocq.Corelib.Array.ArrayAxioms.length_make.statement.{u} ↔ lengthMake.{u} :=
  ⟨fun _ => lengthMake_native,fun _ => lengthMake_proof⟩

theorem getOutOfBounds_correspondence : Rocq.Corelib.Array.ArrayAxioms.get_out_of_bounds.statement.{u} ↔ getOutOfBounds.{u} :=
  ⟨fun _ => getOutOfBounds_native,fun _ => getOutOfBounds_proof⟩

theorem getSetSame_correspondence : Rocq.Corelib.Array.ArrayAxioms.get_set_same.statement.{u} ↔ getSetSame.{u} :=
  ⟨fun _ => getSetSame_native,fun _ => getSetSame_proof⟩

theorem getSetOther_correspondence : Rocq.Corelib.Array.ArrayAxioms.get_set_other.statement.{u} ↔ getSetOther.{u} :=
  ⟨fun _ => getSetOther_native,fun _ => getSetOther_proof⟩

theorem boundedLength_correspondence : Rocq.Corelib.Array.ArrayAxioms.leb_length.statement.{u} ↔ boundedLength.{u} :=
  ⟨fun _ => boundedLength_native,fun _ => boundedLength_proof⟩

theorem extensionality_correspondence : Rocq.Corelib.Array.ArrayAxioms.array_ext.statement.{u} ↔ extensionality.{u} :=
  ⟨fun _ => extensionality_native,fun _ => extensionality_proof⟩

end NativeBridge.Incremental.ArraySpecs

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
  for name in ["NativeBridge.Incremental.ArraySpecs.boundedLength", "NativeBridge.Incremental.ArraySpecs.defaultSet", "NativeBridge.Incremental.ArraySpecs.extensionality", "NativeBridge.Incremental.ArraySpecs.getCopy", "NativeBridge.Incremental.ArraySpecs.getMake", "NativeBridge.Incremental.ArraySpecs.getOutOfBounds", "NativeBridge.Incremental.ArraySpecs.getSetOther", "NativeBridge.Incremental.ArraySpecs.getSetSame", "NativeBridge.Incremental.ArraySpecs.lengthCopy", "NativeBridge.Incremental.ArraySpecs.lengthMake", "NativeBridge.Incremental.ArraySpecs.lengthSet"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

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

abbrev NativeByteString := Σ n : Fin (16777212), Vector (BitVec 8) n.val
def byteStringTo (s : Rocq.Corelib.Strings.PrimString.string) : NativeByteString :=
  ⟨s.size, Vector.ofFn s.value⟩
def byteStringOf (s : NativeByteString) : Rocq.Corelib.Strings.PrimString.string :=
  ⟨s.1, fun i => s.2[i.val]⟩
@[simp] theorem byteString_of_to (s : Rocq.Corelib.Strings.PrimString.string) : byteStringOf (byteStringTo s) = s := by
  cases s with
  | mk n f =>
    change Rocq2Lean.PrimString.Rep.mk n (fun i => (Vector.ofFn f)[i.val]) = _
    have h : (fun i => (Vector.ofFn f)[i.val]) = f := by funext i; simp [Vector.get]
    rw [h]
@[simp] theorem byteString_to_of (s : NativeByteString) : byteStringTo (byteStringOf s) = s := by
  rcases s with ⟨n,xs⟩
  change (⟨n,Vector.ofFn (fun i => xs[i.val])⟩ : NativeByteString) = ⟨n,xs⟩
  have h : Vector.ofFn (fun i => xs[i.val]) = xs := by apply Vector.ext; intros i hi; simp [Vector.get]
  rw [h]
def byteStringIso : Iso Rocq.Corelib.Strings.PrimString.string NativeByteString := ⟨byteStringTo, byteStringOf, byteString_of_to, byteString_to_of⟩
@[simp] theorem byteString_length_agrees (s : Rocq.Corelib.Strings.PrimString.string) :
  Rocq.Corelib.Strings.PrimString.length s = BitVec.ofNat 63 (byteStringTo s).1.val := rfl
theorem byteString_get_agrees (s : Rocq.Corelib.Strings.PrimString.string) (i : BitVec 63) :
  Rocq.Corelib.Strings.PrimString.get s i =
    BitVec.ofNat 63 ((if h : i.toNat < (byteStringTo s).1.val then (byteStringTo s).2[i.toNat] else (0 : BitVec 8)).toNat) := by
  unfold Rocq.Corelib.Strings.PrimString.get Rocq2Lean.PrimString.get Rocq2Lean.PrimString.read byteStringTo
  split <;> simp_all <;> rfl

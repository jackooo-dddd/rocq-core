import StringUnsignedSupport
set_option maxHeartbeats 100000
set_option maxRecDepth 4096
noncomputable section
namespace NativeBridge.Incremental.StringOperations
open NativeBridge.Incremental.StringUnsignedSupport
universe u v
@[simp] theorem positive_succ_agrees (p : RPositive) : positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.succ p) = positiveTo p + 1 := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec with
  | xI p ih =>
    change 2 * positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.succ p) = 2*positiveTo p+1+1
    rw [ih]; omega
  | xO p ih => rfl
  | xH => rfl
@[simp] theorem nat_add_agrees (n m : MN) :
  natTo (Rocq.Corelib.Init.Nat.add n m) = natTo n + natTo m := by
  induction n with
  | O => exact (Nat.zero_add _).symm
  | S n ih =>
    change Nat.succ (natTo (Rocq.Corelib.Init.Nat.add n m)) = Nat.succ (natTo n) + natTo m
    rw [ih, Nat.succ_add]
theorem positive_iter_add (p : RPositive) (n : MN) :
  natTo (Rocq.Corelib.BinNums.PosDef.Pos.iter_op MN Rocq.Corelib.Init.Nat.add p n) = positiveTo p * natTo n := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec generalizing n with
  | xI p ih =>
    change natTo (Rocq.Corelib.Init.Nat.add n (Rocq.Corelib.BinNums.PosDef.Pos.iter_op MN Rocq.Corelib.Init.Nat.add p (Rocq.Corelib.Init.Nat.add n n))) = _
    rw [nat_add_agrees, ih, nat_add_agrees, positiveTo_xI, Nat.add_mul, Nat.one_mul, Nat.mul_add]
    try simp only [Nat.mul_assoc]
    omega
  | xO p ih =>
    change natTo (Rocq.Corelib.BinNums.PosDef.Pos.iter_op MN Rocq.Corelib.Init.Nat.add p (Rocq.Corelib.Init.Nat.add n n)) = _
    rw [ih, nat_add_agrees, positiveTo_xO, Nat.mul_add, Nat.mul_assoc]
    try simp only [Nat.mul_assoc]
    omega
  | xH => exact (Nat.one_mul (natTo n)).symm
@[simp] theorem positive_to_nat_agrees (p : RPositive) : natTo (Rocq.Corelib.BinNums.PosDef.Pos.to_nat p) = positiveTo p := by
  change natTo (Rocq.Corelib.BinNums.PosDef.Pos.iter_op MN Rocq.Corelib.Init.Nat.add p (.S .O)) = _
  rw [positive_iter_add]; exact Nat.mul_one _
@[simp] theorem positive_of_succ_nat_agrees (n : MN) :
  positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.of_succ_nat n) = natTo n+1 := by
  induction n with
  | O => rfl
  | S n ih =>
    change positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.succ (Rocq.Corelib.BinNums.PosDef.Pos.of_succ_nat n)) = natTo n+1+1
    rw [positive_succ_agrees, ih]
@[simp] theorem int_of_nat_agrees (n : MN) :
  zTo (Rocq.Corelib.BinNums.IntDef.Z.of_nat n) = (natTo n : Int) := by
  cases n with
  | O => rfl
  | S n =>
    change (positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.of_succ_nat n) : Int) = (natTo n+1 : Nat)
    rw [positive_of_succ_nat_agrees]
@[simp] theorem int_to_nat_agrees (z : RZ) :
  natTo (Rocq.Corelib.BinNums.IntDef.Z.to_nat z) = (zTo z).toNat := by
  cases z with
  | Z0 => rfl
  | Zpos p => exact positive_to_nat_agrees p
  | Zneg p =>
    change 0 = (-(positiveTo p : Int)).toNat
    omega
@[simp] theorem map_agrees {A : Type u} {B : Type v} (f : A → B) (xs : RList A) :
  listTo (Rocq.Corelib.Lists.ListDef.map A B f xs) = (listTo xs).map f :=
  @Rocq.Corelib.Init.Datatypes.list.rec A (fun xs => listTo (Rocq.Corelib.Lists.ListDef.map A B f xs) = (listTo xs).map f)
    rfl (fun x xs ih => by change f x :: listTo (Rocq.Corelib.Lists.ListDef.map A B f xs) = f x :: (listTo xs).map f; rw [ih]) xs
@[simp] theorem repeat_agrees {A : Type u} (a : A) (n : MN) :
  listTo (Rocq.Corelib.Lists.ListDef.repeat A a n) = List.replicate (natTo n) a := by
  induction n with
  | O => rfl
  | S n ih => change a :: listTo (Rocq.Corelib.Lists.ListDef.repeat A a n) = a :: List.replicate (natTo n) a; rw [ih]
@[simp] theorem firstn_agrees {A : Type u} (n : MN) (xs : RList A) :
  listTo (Rocq.Corelib.Lists.ListDef.firstn A n xs) = (listTo xs).take (natTo n) := by
  induction n generalizing xs with
  | O => rfl
  | S n ih =>
    cases xs with
    | nil => rfl
    | cons x xs => change x :: listTo (Rocq.Corelib.Lists.ListDef.firstn A n xs) = x :: (listTo xs).take (natTo n); rw [ih]
@[simp] theorem skipn_agrees {A : Type u} (n : MN) (xs : RList A) :
  listTo (Rocq.Corelib.Lists.ListDef.skipn A n xs) = (listTo xs).drop (natTo n) := by
  induction n generalizing xs with
  | O => rfl
  | S n ih =>
    cases xs with
    | nil => rfl
    | cons x xs => exact ih xs
@[simp] theorem nth_agrees {A : Type u} (n : MN) (xs : RList A) (d : A) :
  Rocq.Corelib.Lists.ListDef.nth A n xs d = (listTo xs)[natTo n]?.getD d := by
  induction n generalizing xs with
  | O => cases xs <;> rfl
  | S n ih =>
    cases xs with
    | nil => rfl
    | cons x xs => exact ih xs
@[simp] theorem seq_agrees (start len : MN) :
  (listTo (Rocq.Corelib.Lists.ListDef.seq start len)).map natTo = List.range' (natTo start) (natTo len) := by
  induction len generalizing start with
  | O => rfl
  | S len ih =>
    change natTo start :: (listTo (Rocq.Corelib.Lists.ListDef.seq (.S start) len)).map natTo =
      natTo start :: List.range' (natTo start+1) (natTo len)
    rw [ih]; rfl
@[simp] theorem forall_list_agrees {A : Type u} (P : A → Prop) (xs : RList A) :
  Rocq.Corelib.Lists.ListDef.Forall A P xs ↔ ∀ x ∈ listTo xs, P x := by
  constructor
  · intro h
    induction h using Rocq.Corelib.Lists.ListDef.Forall.rec with
    | Forall_nil => intro x hx; cases hx
    | Forall_cons x xs hx hxs ih =>
      intro y hy
      change y ∈ x :: listTo xs at hy
      cases hy with
      | head => exact hx
      | tail _ hy => exact ih y hy
  · induction xs using Rocq.Corelib.Init.Datatypes.list.rec with
    | nil => intro _; exact .Forall_nil A P
    | cons x xs ih =>
      intro h
      apply Rocq.Corelib.Lists.ListDef.Forall.Forall_cons A P x xs
      · exact h x (by change x ∈ x :: listTo xs; exact .head _)
      · apply ih; intro y hy
        exact h y (by change y ∈ x :: listTo xs; exact .tail _ hy)
@[simp] theorem nat_min_agrees (n m : MN) :
  natTo (Rocq.Corelib.Init.Nat.min n m) = min (natTo n) (natTo m) := by
  induction n generalizing m with
  | O => cases m <;> rfl
  | S n ih => cases m with
    | O => rfl
    | S m =>
      change natTo (Rocq.Corelib.Init.Nat.min n m)+1 = min (natTo n+1) (natTo m+1)
      rw [ih]; omega
abbrev Bytes := NativeByteString
def capacity : Word := 16777211
def bounded (n : Nat) : Fin 16777212 := ⟨min n 16777211, by omega⟩
theorem bounded_agrees (n : Nat) : Rocq2Lean.PrimString.boundedSize n = bounded n := by
  apply Fin.ext
  unfold Rocq2Lean.PrimString.boundedSize Rocq2Lean.PrimString.maxLength bounded
  split <;> simp_all <;> omega

def readByte (s : Bytes) (i : Nat) : BitVec 8 :=
  if h : i < s.1.val then s.2[i] else 0
theorem read_agrees (s : Rocq.Corelib.Strings.PrimString.string) (i : Nat) :
    Rocq2Lean.PrimString.read s i = readByte (byteStringTo s) i := by
  unfold Rocq2Lean.PrimString.read readByte byteStringTo
  split <;> simp_all

def repeatByte (n c : Word) : Bytes :=
  ⟨bounded n.toNat, Vector.replicate (bounded n.toNat).val (BitVec.ofNat 8 c.toNat)⟩
theorem make_agrees (n c : Word) :
    byteStringTo (Rocq.Corelib.Strings.PrimString.make n c) = repeatByte n c := by
  unfold Rocq.Corelib.Strings.PrimString.make Rocq2Lean.PrimString.make byteStringTo repeatByte
  dsimp only
  rw [bounded_agrees]
  congr 1
  apply Vector.ext
  intros
  simp

def sliceBytes (s : Bytes) (off len : Word) : Bytes :=
  ⟨bounded (min len.toNat (s.1.val - off.toNat)),
   Vector.ofFn (fun i => readByte s (off.toNat + i.val))⟩
theorem sub_agrees (s : Rocq.Corelib.Strings.PrimString.string) (off len : Word) :
    byteStringTo (Rocq.Corelib.Strings.PrimString.sub s off len) = sliceBytes (byteStringTo s) off len := by
  unfold Rocq.Corelib.Strings.PrimString.sub Rocq2Lean.PrimString.sub byteStringTo sliceBytes
  dsimp only
  rw [bounded_agrees]
  congr 2
  funext i
  exact read_agrees s _

def appendBytes (a b : Bytes) : Bytes :=
  ⟨bounded (a.1.val + b.1.val),
   Vector.ofFn (fun i => if i.val < a.1.val then readByte a i.val else readByte b (i.val-a.1.val))⟩
theorem cat_agrees (a b : Rocq.Corelib.Strings.PrimString.string) :
    byteStringTo (Rocq.Corelib.Strings.PrimString.cat a b) = appendBytes (byteStringTo a) (byteStringTo b) := by
  unfold Rocq.Corelib.Strings.PrimString.cat Rocq2Lean.PrimString.cat byteStringTo appendBytes
  dsimp only
  rw [bounded_agrees]
  congr 2
  funext i
  split <;> exact read_agrees _ _

def compareRange (a b : Bytes) : Nat → Nat → Ordering
  | 0, _ => if a.1.val < b.1.val then .lt else if b.1.val < a.1.val then .gt else .eq
  | fuel+1, i =>
    if (readByte a i).toNat < (readByte b i).toNat then .lt
    else if (readByte b i).toNat < (readByte a i).toNat then .gt
    else compareRange a b fuel (i+1)
theorem compareRange_agrees (a b : Rocq.Corelib.Strings.PrimString.string) (fuel i : Nat) :
    Rocq2Lean.PrimString.compareBytes a b fuel i = compareRange (byteStringTo a) (byteStringTo b) fuel i := by
  induction fuel generalizing i with
  | zero => rfl
  | succ fuel ih =>
    simp only [Rocq2Lean.PrimString.compareBytes, compareRange, read_agrees, ih]
def compareBytes (a b : Bytes) : Ordering := compareRange a b (min a.1.val b.1.val) 0
theorem compare_agrees (a b : Rocq.Corelib.Strings.PrimString.string) :
    comparisonTo (Rocq.Corelib.Strings.PrimString.compare a b) = compareBytes (byteStringTo a) (byteStringTo b) := by
  have h : comparisonTo (Rocq.Corelib.Strings.PrimString.compare a b) = Rocq2Lean.PrimString.compare a b := by
    unfold Rocq.Corelib.Strings.PrimString.compare
    cases Rocq2Lean.PrimString.compare a b <;> rfl
  exact h.trans (compareRange_agrees a b _ _)

def validChar (c : Word) : Prop := c.toNat < 256
theorem charValid_agrees (c : Word) :
    Rocq.Corelib.Strings.PrimStringAxioms.char63_valid c ↔ validChar c := by
  change ME Word (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.land c (255#63)) c ↔ _
  apply (eq_correspondence (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.land c (255#63)) c).trans
  change (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.land c (255#63) = c) ↔ _
  rw (transparency := .default) [int63_land_agrees]
  have hmask : c &&& 255#63 = BitVec.ofNat 63 (c.toNat % 256) := by
    apply BitVec.eq_of_toNat_eq
    simp only [BitVec.toNat_and, BitVec.toNat_ofNat]
    change c.toNat &&& (2^8-1) = c.toNat % 2^8 % 2^63
    rw [Nat.and_two_pow_sub_one_eq_mod]
    omega
  rw [hmask]
  change (BitVec.ofNat 63 (c.toNat % 256) = (c : BitVec 63)) ↔ _
  rw [← BitVec.toNat_inj]
  simp only [BitVec.toNat_ofNat]
  unfold validChar
  have hm := Nat.mod_lt c.toNat (by decide : 0 < 256)
  rw [Nat.mod_eq_of_lt (by omega : c.toNat % 256 < 2^63)]
  exact ⟨fun h => by omega, Nat.mod_eq_of_lt⟩

def emptyBytes : Bytes := ⟨⟨0, by decide⟩, #v[]⟩
def ofWords (cs : List Word) : Bytes :=
  cs.foldr (fun c rest => appendBytes (repeatByte 1 c) rest) emptyBytes
theorem ofList_agrees (cs : RList Word) :
    byteStringTo (Rocq.Corelib.Strings.PrimStringAxioms.of_list cs) = ofWords (listTo cs) := by
  induction cs with
  | nil => rfl
  | cons c cs ih =>
    change byteStringTo (Rocq.Corelib.Strings.PrimString.cat
      (Rocq.Corelib.Strings.PrimString.make (1#63) c)
      (Rocq.Corelib.Strings.PrimStringAxioms.of_list cs)) = _
    rw [cat_agrees, make_agrees, ih]
    rfl

def toWords (s : Bytes) : List Word := s.2.toList.map (BitVec.setWidth 63)
theorem unsignedNat_agrees (x : Word) :
    natTo (Rocq.Corelib.BinNums.IntDef.Z.to_nat
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)) = x.toNat := by
  exact (int_to_nat_agrees (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)).trans
    (congrArg Int.toNat (toZ_agrees x))
theorem natWord_agrees (n : MN) :
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_Z
      (Rocq.Corelib.BinNums.IntDef.Z.of_nat n) = BitVec.ofNat 63 (natTo n) := by
  exact (ofZ_agrees (Rocq.Corelib.BinNums.IntDef.Z.of_nat n)).trans
    (congrArg ofInteger (int_of_nat_agrees n))
theorem lengthWord_agrees (s : Rocq.Corelib.Strings.PrimString.string) :
    (Rocq.Corelib.Strings.PrimString.length s).toNat = (byteStringTo s).1.val := by
  have hs := s.size.isLt
  change s.size.val < 16777212 at hs
  change (BitVec.ofNat 63 s.size.val).toNat = s.size.val
  simp only [BitVec.toNat_ofNat]
  exact Nat.mod_eq_of_lt (by omega)
theorem getWord_agrees (s : Rocq.Corelib.Strings.PrimString.string) (i : Word) :
    Rocq.Corelib.Strings.PrimString.get s i =
      (readByte (byteStringTo s) i.toNat).setWidth 63 := by
  unfold Rocq.Corelib.Strings.PrimString.get Rocq2Lean.PrimString.get
  rw [read_agrees]
  apply BitVec.eq_of_toNat_eq
  simp

theorem toList_agrees (s : Rocq.Corelib.Strings.PrimString.string) :
    listTo (Rocq.Corelib.Strings.PrimStringAxioms.to_list s) = toWords (byteStringTo s) := by
  unfold Rocq.Corelib.Strings.PrimStringAxioms.to_list
  rw [map_agrees]
  simp only [natWord_agrees, getWord_agrees]
  change (listTo (Rocq.Corelib.Lists.ListDef.seq .O
    (Rocq.Corelib.BinNums.IntDef.Z.to_nat
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z
        (Rocq.Corelib.Strings.PrimString.length s))))).map
    ((fun i : Nat => (readByte (byteStringTo s) (BitVec.ofNat 63 i).toNat).setWidth 63) ∘ natTo) = _
  rw [← List.map_map, seq_agrees]
  have hn := (unsignedNat_agrees (Rocq.Corelib.Strings.PrimString.length s)).trans (lengthWord_agrees s)
  rw [hn]
  simp only [natTo_zero]
  apply List.ext_getElem
  · simp [toWords]
  · intro i h₁ h₂
    have hs := (byteStringTo s).1.isLt
    have hi : i < (byteStringTo s).1.val := by simpa using h₁
    simp only [List.getElem_map, List.getElem_range', Nat.zero_add]
    have hi63 : i < 9223372036854775808 := by omega
    simp [readByte, toWords, Nat.mod_eq_of_lt hi63, hi]

end NativeBridge.Incremental.StringOperations

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
  for name in ["NativeBridge.Incremental.StringOperations.validChar", "NativeBridge.Incremental.StringOperations.ofWords", "NativeBridge.Incremental.StringOperations.toWords"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

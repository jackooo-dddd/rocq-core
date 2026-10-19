import Interface_Strings_PrimString
noncomputable section
namespace NativeBridge.Incremental.PrimitiveStrings

abbrev Word := BitVec 63
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
def equalBytes (a b : Bytes) : Bool := compareBytes a b == .eq
theorem eqb_agrees (a b : Rocq.Corelib.Strings.PrimString.string) :
    boolTo (Rocq.Corelib.Strings.PrimString.eqb a b) = equalBytes (byteStringTo a) (byteStringTo b) := by
  unfold equalBytes
  rw [← compare_agrees]
  unfold Rocq.Corelib.Strings.PrimString.eqb
  cases Rocq.Corelib.Strings.PrimString.compare a b <;> rfl

def charIso : Iso Rocq.Corelib.Strings.PrimString.char63 Word := ⟨id,id,fun _ => rfl,fun _ => rfl⟩
def charTo : Rocq.Corelib.Strings.PrimString.char63_wrapper → Word
  | .wrap_char63 c => c
def charWrapperIso : Iso Rocq.Corelib.Strings.PrimString.char63_wrapper Word :=
  ⟨charTo, .wrap_char63, fun x => by cases x; rfl, fun _ => rfl⟩
def stringTo : Rocq.Corelib.Strings.PrimString.PStringNotations.string_wrapper → Bytes
  | .wrap_string s => byteStringTo s
def stringWrapperIso : Iso Rocq.Corelib.Strings.PrimString.PStringNotations.string_wrapper Bytes :=
  ⟨stringTo, fun s => .wrap_string (byteStringOf s),
   fun x => by cases x; simp only [stringTo, byteString_of_to],
   fun s => byteString_to_of s⟩
theorem char_wrap_agrees (c : Rocq.Corelib.Strings.PrimString.char63_wrapper) :
    Rocq.Corelib.Strings.PrimString.char63_wrap c = id (charTo c) := by cases c; rfl
theorem string_wrap_agrees (s : Rocq.Corelib.Strings.PrimString.PStringNotations.string_wrapper) :
    byteStringTo (Rocq.Corelib.Strings.PrimString.PStringNotations.string_wrap s) = id (stringTo s) := by cases s; rfl
theorem id_string_agrees (s : Rocq.Corelib.Strings.PrimString.string) :
    byteStringTo (Rocq.Corelib.Strings.PrimString.PStringNotations.id_string s) = id (byteStringTo s) := rfl
theorem max_length_agrees : Rocq.Corelib.Strings.PrimString.max_length = capacity := rfl

def parseChar (s : Bytes) : Option Word :=
  if s.1.val = 1 then some (BitVec.ofNat 63 (readByte s 0).toNat) else none
def printChar (c : Word) : Option Bytes :=
  if c.toNat < 256 then some (repeatByte 1 c) else none
theorem parse_agrees (s : Rocq.Corelib.Strings.PrimString.string) :
    (optionTo (Rocq.Corelib.Strings.PrimString.Char63Notations.parse s)).map charTo = parseChar (byteStringTo s) := by
  have hs : s.size.val < 2^63 := by have := s.size.isLt; change s.size.val < 16777212 at this; omega
  unfold Rocq.Corelib.Strings.PrimString.Char63Notations.parse
    Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.eqb Rocq.Corelib.Strings.PrimString.length
    Rocq2Lean.PrimString.length Rocq2Lean.PrimInt63.eqb
  simp only [BitVec.toNat_ofNat, Nat.mod_eq_of_lt hs]
  unfold parseChar
  split <;> simp_all [optionTo, charTo, Rocq.Corelib.Strings.PrimString.get, Rocq2Lean.PrimString.get, read_agrees, byteStringTo, Bool.beq_eq_decide_eq]
theorem print_agrees (c : Rocq.Corelib.Strings.PrimString.char63_wrapper) :
    (optionTo (Rocq.Corelib.Strings.PrimString.Char63Notations.print c)).map byteStringTo = printChar (charTo c) := by
  cases c with
  | wrap_char63 c =>
    unfold Rocq.Corelib.Strings.PrimString.Char63Notations.print
      Rocq.Corelib.Strings.PrimString.char63_wrap Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb
      Rocq2Lean.PrimInt63.ltb
    change (optionTo (Rocq.Corelib.Init.Datatypes.bool.rec _ _ (Bool.rec _ _ (decide (c.toNat < 256))))).map byteStringTo = printChar c
    by_cases h : c.toNat < 256 <;> simp [h, printChar, optionTo]
    exact make_agrees (1 : Word) (show Word from c)

theorem nul_parse_example : parseChar (repeatByte 1 0) = some 0 := rfl
theorem nonbyte_print_example : printChar 256 = none := rfl
theorem make_reduces_byte_example : parseChar (repeatByte 1 256) = some 0 := rfl
theorem beyond_end_example : (sliceBytes (repeatByte 3 42) 5 2).1.val = 0 := rfl
theorem append_clips_length (a b : Bytes) :
    (appendBytes a b).1.val = min (a.1.val + b.1.val) 16777211 := rfl

end NativeBridge.Incremental.PrimitiveStrings

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
  for name in ["NativeBridge.Incremental.PrimitiveStrings.Bytes", "NativeBridge.Incremental.PrimitiveStrings.Word", "NativeBridge.Incremental.PrimitiveStrings.appendBytes", "NativeBridge.Incremental.PrimitiveStrings.capacity", "NativeBridge.Incremental.PrimitiveStrings.compareBytes", "NativeBridge.Incremental.PrimitiveStrings.equalBytes", "NativeBridge.Incremental.PrimitiveStrings.parseChar", "NativeBridge.Incremental.PrimitiveStrings.printChar", "NativeBridge.Incremental.PrimitiveStrings.repeatByte", "NativeBridge.Incremental.PrimitiveStrings.sliceBytes", "id"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

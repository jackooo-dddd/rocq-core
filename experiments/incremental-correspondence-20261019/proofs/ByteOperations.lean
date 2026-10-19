import Interface_Init_Byte
set_option autoImplicit false
set_option maxHeartbeats 3000000
noncomputable section
namespace NativeBridge.Incremental.ByteOperations
open NativeBridge
universe u
abbrev RBits := Rocq.Corelib.Init.Datatypes.prod Rocq.Corelib.Init.Datatypes.bool (Rocq.Corelib.Init.Datatypes.prod Rocq.Corelib.Init.Datatypes.bool (Rocq.Corelib.Init.Datatypes.prod Rocq.Corelib.Init.Datatypes.bool (Rocq.Corelib.Init.Datatypes.prod Rocq.Corelib.Init.Datatypes.bool (Rocq.Corelib.Init.Datatypes.prod Rocq.Corelib.Init.Datatypes.bool (Rocq.Corelib.Init.Datatypes.prod Rocq.Corelib.Init.Datatypes.bool (Rocq.Corelib.Init.Datatypes.prod Rocq.Corelib.Init.Datatypes.bool (Rocq.Corelib.Init.Datatypes.bool)))))))
abbrev Bits := Bool × Bool × Bool × Bool × Bool × Bool × Bool × Bool
def bitsTo (x : RBits) : Bits :=
  match x with | .pair _ _ a (.pair _ _ b (.pair _ _ c (.pair _ _ d (.pair _ _ e (.pair _ _ f (.pair _ _ g (h))))))) => (boolTo a,boolTo b,boolTo c,boolTo d,boolTo e,boolTo f,boolTo g,boolTo h)
def bitsOf (x : Bits) : RBits :=
  match x with | (a,b,c,d,e,f,g,h) => .pair _ _ (boolOf a) (.pair _ _ (boolOf b) (.pair _ _ (boolOf c) (.pair _ _ (boolOf d) (.pair _ _ (boolOf e) (.pair _ _ (boolOf f) (.pair _ _ (boolOf g) ((boolOf h))))))))
theorem bits_of_to (x : RBits) : bitsOf (bitsTo x) = x := by
  rcases x with ⟨a,b,c,d,e,f,g,h⟩
  simp [bitsOf,bitsTo,bool_of_to]
theorem bits_to_of (x : Bits) : bitsTo (bitsOf x) = x := by
  rcases x with ⟨a,b,c,d,e,f,g,h⟩
  simp [bitsOf,bitsTo,bool_to_of]
def bitsIso : Iso RBits Bits := ⟨bitsTo,bitsOf,bits_of_to,bits_to_of⟩

def byteBits (b : Fin 256) : Bits :=
  let v : BitVec 8 := BitVec.ofFin b
  (v.getLsbD 0,v.getLsbD 1,v.getLsbD 2,v.getLsbD 3,
   v.getLsbD 4,v.getLsbD 5,v.getLsbD 6,v.getLsbD 7)
def bitsByte (x : Bits) : Fin 256 :=
  let (a,b,c,d,e,f,g,h) := x
  (BitVec.ofNat 8 (a.toNat+2*b.toNat+4*c.toNat+8*d.toNat+
    16*e.toNat+32*f.toNat+64*g.toNat+128*h.toNat)).toFin

theorem to_bits_agrees (b : Rocq.Corelib.Init.Byte.byte) :
    bitsTo (Rocq.Corelib.Init.Byte.to_bits b) = byteBits (byteTo b) := by
  cases b <;> rfl
theorem of_bits_agrees (x : RBits) :
    byteTo (Rocq.Corelib.Init.Byte.of_bits x) = bitsByte (bitsTo x) := by
  rcases x with ⟨a,b,c,d,e,f,g,h⟩
  cases a <;> cases b <;> cases c <;> cases d <;>
    cases e <;> cases f <;> cases g <;> cases h <;> rfl
theorem byte_of_byte_agrees (b : Rocq.Corelib.Init.Byte.byte) :
    byteTo (Rocq.Corelib.Init.Byte.byte_of_byte b) = id (byteTo b) := rfl

theorem of_bits_to_bits_proof : Rocq.Corelib.Init.Byte.of_bits_to_bits.statement := by
  intro b
  cases b <;> exact .eq_refl _ _
theorem to_bits_of_bits_proof : Rocq.Corelib.Init.Byte.to_bits_of_bits.statement := by
  intro x
  rcases x with ⟨a,b,c,d,e,f,g,h⟩
  cases a <;> cases b <;> cases c <;> cases d <;>
    cases e <;> cases f <;> cases g <;> cases h <;> exact .eq_refl _ _

def byteRoundtrip : Prop := ∀ b, bitsByte (byteBits b) = b
def bitsRoundtrip : Prop := ∀ x, byteBits (bitsByte x) = x
theorem byte_roundtrip_native : byteRoundtrip := by
  intro b
  have h := congrArg byteTo (eqTo (of_bits_to_bits_proof (byteOf b)))
  rw [of_bits_agrees,to_bits_agrees,byte_to_of] at h
  exact h
theorem bits_roundtrip_native : bitsRoundtrip := by
  intro x
  have h := congrArg bitsTo (eqTo (to_bits_of_bits_proof (bitsOf x)))
  rw [to_bits_agrees,of_bits_agrees,bits_to_of] at h
  exact h
theorem of_bits_to_bits_correspondence :
    Rocq.Corelib.Init.Byte.of_bits_to_bits.statement ↔ byteRoundtrip :=
  ⟨fun _ => byte_roundtrip_native,fun _ => of_bits_to_bits_proof⟩
theorem to_bits_of_bits_correspondence :
    Rocq.Corelib.Init.Byte.to_bits_of_bits.statement ↔ bitsRoundtrip :=
  ⟨fun _ => bits_roundtrip_native,fun _ => to_bits_of_bits_proof⟩

theorem bit_order_one :
    bitsTo (Rocq.Corelib.Init.Byte.to_bits .x01) =
      (true,false,false,false,false,false,false,false) := rfl
theorem bit_order_high :
    bitsTo (Rocq.Corelib.Init.Byte.to_bits .x80) =
      (false,false,false,false,false,false,false,true) := rfl
theorem byte_all_bits :
    bitsTo (Rocq.Corelib.Init.Byte.to_bits .xff) =
      (true,true,true,true,true,true,true,true) := rfl

end NativeBridge.Incremental.ByteOperations

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
  for name in ["NativeBridge.Incremental.ByteOperations.bitsByte", "NativeBridge.Incremental.ByteOperations.bitsRoundtrip", "NativeBridge.Incremental.ByteOperations.byteBits", "NativeBridge.Incremental.ByteOperations.byteRoundtrip", "id"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

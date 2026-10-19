import Uint63Conversions
set_option maxHeartbeats 50000
noncomputable section
namespace NativeBridge.Incremental.Uint63Statements
open NativeBridge.Incremental.Uint63Operations
open NativeBridge.Incremental.Uint63Conversions

def eqbCorrect : Prop := ∀ x y : Word, (x == y) = true → x = y
def eqbRefl : Prop := ∀ x : Word, (x == x) = true
def andBits : Prop := ∀ (x y : Word) (i : Word),
  readBit (x &&& y) i = (readBit x i && readBit y i)
def orBits : Prop := ∀ (x y : Word) (i : Word),
  readBit (x ||| y) i = (readBit x i || readBit y i)
def xorBits : Prop := ∀ (x y : Word) (i : Word),
  readBit (x ^^^ y) i = (readBit x i ^^ readBit y i)
def unsignedRoundtrip : Prop := ∀ x : Word, BitVec.ofInt 63 (Int.ofNat x.toNat) = x

theorem eqbCorrect_native : eqbCorrect := by intro x y h; exact eq_of_beq h
theorem eqbRefl_native : eqbRefl := by intro x; simp
theorem andBits_native : andBits := by intro x y i; simp [readBit]
theorem orBits_native : orBits := by intro x y i; simp [readBit]
theorem xorBits_native : xorBits := by intro x y i; simp [readBit]
theorem unsignedRoundtrip_native : unsignedRoundtrip := by intro x; simp

theorem boolInjective {a b : Rocq.Corelib.Init.Datatypes.bool} (h : boolTo a = boolTo b) : a = b := by
  cases a <;> cases b <;> simp_all [boolTo]

theorem eqbCorrect_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.eqb_correct.statement := by
  change ∀ (x y : Word), _
  intro x y h
  apply eqOf
  have hb := congrArg boolTo (eqTo h)
  rw [int63_eqb_agrees] at hb
  apply BitVec.eq_of_toNat_eq
  exact eq_of_beq hb
theorem eqbRefl_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.eqb_refl.statement := by
  change ∀ (x : Word), _
  intro x
  apply eqOf
  apply boolInjective
  change boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.eqb x x) = true
  simp [int63_eqb_agrees]

theorem bool_and (x y : RBool) :
    boolTo (Rocq.Corelib.Init.Datatypes.andb x y) = (boolTo x && boolTo y) := by cases x <;> cases y <;> rfl
theorem bool_or (x y : RBool) :
    boolTo (Rocq.Corelib.Init.Datatypes.orb x y) = (boolTo x || boolTo y) := by cases x <;> cases y <;> rfl
theorem bool_xor (x y : RBool) :
    boolTo (Rocq.Corelib.Init.Datatypes.xorb x y) = (boolTo x ^^ boolTo y) := by cases x <;> cases y <;> rfl
theorem andBits_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.land_spec.statement := by
  change ∀ (x y i : Word), _
  intro x y i
  apply eqOf
  apply boolInjective
  have hl := (bit_agrees (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.land x y) i).trans
    (congrArg (fun w : Word => readBit w i) (int63_land_agrees x y))
  have hr := bool_and (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit x i)
    (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit y i)
  have hx := bit_agrees x i
  have hy := bit_agrees y i
  rw [hx,hy] at hr
  exact hl.trans ((andBits_native x y i).trans hr.symm)

theorem orBits_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lor_spec.statement := by
  change ∀ (x y i : Word), _
  intro x y i
  apply eqOf
  apply boolInjective
  have hl := (bit_agrees (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lor x y) i).trans
    (congrArg (fun w : Word => readBit w i) (int63_lor_agrees x y))
  have hr := bool_or (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit x i)
    (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit y i)
  have hx := bit_agrees x i
  have hy := bit_agrees y i
  rw [hx,hy] at hr
  exact hl.trans ((orBits_native x y i).trans hr.symm)

theorem xorBits_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lxor_spec.statement := by
  change ∀ (x y i : Word), _
  intro x y i
  apply eqOf
  apply boolInjective
  have hl := (bit_agrees (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lxor x y) i).trans
    (congrArg (fun w : Word => readBit w i) (int63_lxor_agrees x y))
  have hr := bool_xor (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit x i)
    (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit y i)
  have hx := bit_agrees x i
  have hy := bit_agrees y i
  rw [hx,hy] at hr
  exact hl.trans ((xorBits_native x y i).trans hr.symm)

theorem unsignedRoundtrip_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_to_Z.statement := by
  change ∀ (x : Word), _
  intro x
  apply eqOf
  change (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_Z (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x) : Word) = x
  exact (ofZ_agrees _).trans ((congrArg ofInteger (toZ_agrees x)).trans (unsignedRoundtrip_native x))

theorem eqbCorrect_correspondence : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.eqb_correct.statement ↔ eqbCorrect :=
  ⟨fun _ => eqbCorrect_native, fun _ => eqbCorrect_proof⟩

theorem eqbRefl_correspondence : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.eqb_refl.statement ↔ eqbRefl :=
  ⟨fun _ => eqbRefl_native, fun _ => eqbRefl_proof⟩

theorem andBits_correspondence : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.land_spec.statement ↔ andBits :=
  ⟨fun _ => andBits_native, fun _ => andBits_proof⟩

theorem orBits_correspondence : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lor_spec.statement ↔ orBits :=
  ⟨fun _ => orBits_native, fun _ => orBits_proof⟩

theorem xorBits_correspondence : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lxor_spec.statement ↔ xorBits :=
  ⟨fun _ => xorBits_native, fun _ => xorBits_proof⟩

theorem unsignedRoundtrip_correspondence : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_to_Z.statement ↔ unsignedRoundtrip :=
  ⟨fun _ => unsignedRoundtrip_native, fun _ => unsignedRoundtrip_proof⟩

end NativeBridge.Incremental.Uint63Statements

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
  for name in ["NativeBridge.Incremental.Uint63Statements.andBits", "NativeBridge.Incremental.Uint63Statements.eqbCorrect", "NativeBridge.Incremental.Uint63Statements.eqbRefl", "NativeBridge.Incremental.Uint63Statements.orBits", "NativeBridge.Incremental.Uint63Statements.unsignedRoundtrip", "NativeBridge.Incremental.Uint63Statements.xorBits"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

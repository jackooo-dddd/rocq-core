import StringSpecs
set_option maxHeartbeats 100000
set_option maxRecDepth 4096
noncomputable section
namespace NativeBridge.Incremental.StringRoundtrip
open NativeBridge.Incremental.StringUnsignedSupport
open NativeBridge.Incremental.StringOperations
open NativeBridge.Incremental.StringSpecs

def catSpec : Prop := ∀ (a b : Bytes),
  toWords (appendBytes a b) = (toWords a ++ toWords b).take 16777211
def roundtripSpec : Prop := ∀ (s : Bytes), ofWords (toWords s) = s
theorem catSpec_native : catSpec := by
  intro a b
  apply List.ext_getElem
  · simp [toWords, appendBytes, bounded, Nat.min_comm]
  · intro i h₁ h₂
    have hi : i < min (a.1.val+b.1.val) 16777211 := by
      simpa [toWords, appendBytes, bounded] using h₁
    by_cases ha : i < a.1.val
    · simp [toWords, appendBytes, readByte, ha, List.getElem_append_left]
    · have hb : i-a.1.val < b.1.val := by omega
      simp [toWords, appendBytes, readByte, ha, hb, List.getElem_append]
theorem byteWidth_injective {x y : BitVec 8} (h : x.setWidth 63 = y.setWidth 63) : x = y := by
  apply BitVec.eq_of_toNat_eq
  have hx := x.isLt
  have hy := y.isLt
  have hn := congrArg BitVec.toNat h
  simp only [BitVec.toNat_setWidth] at hn
  omega
theorem toWords_injective {a b : Bytes} (h : toWords a = toWords b) : a = b := by
  obtain ⟨an,av⟩ := a
  obtain ⟨bn,bv⟩ := b
  have hn := congrArg List.length h
  simp only [toWords, List.length_map, Vector.length_toList] at hn
  have hf : an = bn := Fin.ext hn
  cases hf
  congr 1
  apply Vector.ext
  intro i hi
  apply byteWidth_injective
  have hh := congrArg (fun xs : List (BitVec 63) => xs[i]?) h
  simpa [toWords, hi] using hh
theorem take_cons_take {A : Type} (n : Nat) (x : A) (xs : List A) :
    (x :: xs.take (n+1)).take (n+1) = (x::xs).take (n+1) := by
  simp [List.take_take]
theorem ofWords_list (cs : List (BitVec 63)) :
    toWords (ofWords cs) = (cs.map (fun c => c &&& 255#63)).take 16777211 := by
  induction cs with
  | nil => rfl
  | cons c cs ih =>
    change toWords (appendBytes (repeatByte (1#63) c) (ofWords cs)) = _
    rw [catSpec_native, makeSpec_native, ih]
    change ((c &&& 255#63) :: (cs.map (fun c => c &&& 255#63)).take 16777211).take 16777211 =
      ((c &&& 255#63) :: cs.map (fun c => c &&& 255#63)).take 16777211
    exact take_cons_take 16777210 _ _
theorem mask_identity (c : BitVec 63) (h : c.toNat < 256) : c &&& 255#63 = c := by
  apply BitVec.eq_of_toNat_eq
  change c.toNat &&& (2^8-1) = c.toNat
  rw [Nat.and_two_pow_sub_one_eq_mod, Nat.mod_eq_of_lt h]
theorem roundtripSpec_native : roundtripSpec := by
  intro s
  apply toWords_injective
  rw [ofWords_list]
  have hm : (toWords s).map (fun c => c &&& 255#63) = toWords s := by
    calc
      _ = (toWords s).map id := List.map_congr_left (fun c hc => mask_identity c (validSpec_native s c hc))
      _ = _ := List.map_id _
  rw [hm, List.take_of_length_le (boundSpec_native s)]

theorem catSpec_proof : Rocq.Corelib.Strings.PrimStringAxioms.cat_spec.statement := by
  intro a b
  apply eqOf
  apply listInjective
  have lhs := (toList_agrees (Rocq.Corelib.Strings.PrimString.cat a b)).trans
    ((congrArg toWords (cat_agrees a b)).trans (catSpec_native (byteStringTo a) (byteStringTo b)))
  have hap := (append_agrees (Rocq.Corelib.Strings.PrimStringAxioms.to_list a)
    (Rocq.Corelib.Strings.PrimStringAxioms.to_list b)).trans
    (map2 (List.append (α := BitVec 63)) (toList_agrees a) (toList_agrees b))
  have rhs := (takeWord_agrees Rocq.Corelib.Strings.PrimString.max_length
    (Rocq.Corelib.Init.Datatypes.app (BitVec 63)
      (Rocq.Corelib.Strings.PrimStringAxioms.to_list a)
      (Rocq.Corelib.Strings.PrimStringAxioms.to_list b))).trans
    (congrArg (fun xs : List (BitVec 63) => xs.take 16777211) hap)
  exact lhs.trans rhs.symm
theorem stringInjective {a b : Rocq.Corelib.Strings.PrimString.string}
    (h : byteStringTo a = byteStringTo b) : a = b := (byteStringIso.eq_iff a b).mp h
theorem roundtripSpec_proof : Rocq.Corelib.Strings.PrimStringAxioms.of_to_list.statement := by
  intro s
  apply eqOf
  apply stringInjective
  exact (ofList_agrees (Rocq.Corelib.Strings.PrimStringAxioms.to_list s)).trans
    ((congrArg ofWords (toList_agrees s)).trans (roundtripSpec_native (byteStringTo s)))
theorem catSpec_correspondence : Rocq.Corelib.Strings.PrimStringAxioms.cat_spec.statement ↔ catSpec :=
  ⟨fun _ => catSpec_native, fun _ => @catSpec_proof⟩

theorem roundtripSpec_correspondence : Rocq.Corelib.Strings.PrimStringAxioms.of_to_list.statement ↔ roundtripSpec :=
  ⟨fun _ => roundtripSpec_native, fun _ => @roundtripSpec_proof⟩

end NativeBridge.Incremental.StringRoundtrip

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
  for name in ["NativeBridge.Incremental.StringRoundtrip.catSpec", "NativeBridge.Incremental.StringRoundtrip.roundtripSpec"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

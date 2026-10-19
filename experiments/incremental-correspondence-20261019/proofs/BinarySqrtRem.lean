import BinaryDivision
import Init.Data.Nat.Sqrt.Lemmas
set_option autoImplicit false
set_option linter.unusedSimpArgs false
noncomputable section
namespace NativeBridge.Incremental.BinarySqrtRem
open NativeBridge BinaryInt BinaryOrder BinaryArithmetic BinaryNatSub BinaryDivision
abbrev SqrtPair := Rocq.Corelib.Init.Datatypes.prod RPositive RMask
abbrev sqrtPairTo (x : SqrtPair) : Nat × Option Nat :=
  match x with | .pair _ _ s r => (positiveTo s,maskTo r)

@[simp] theorem maskTo_nul : maskTo (.IsNul) = some 0 := rfl
@[simp] theorem maskTo_neg : maskTo (.IsNeg) = none := rfl
@[simp] theorem maskTo_pos (p : RPositive) : maskTo (.IsPos p) = some (positiveTo p) := rfl

def sqrtStepNative (f g : Nat → Nat) (x : Nat × Option Nat) : Nat × Option Nat :=
  match x.2 with
  | none => (2*x.1, checkedSub (g (f 1)) 4)
  | some r =>
    if r = 0 then (2*x.1, checkedSub (g (f 1)) 4)
    else if 4*x.1+1 ≤ g (f r) then
      (2*x.1+1, checkedSub (g (f r)) (4*x.1+1))
    else (2*x.1,some (g (f r)))

theorem sqrtrem_step_agrees (f g : RPositive → RPositive) (F G : Nat → Nat)
    (hf : ∀ p, positiveTo (f p) = F (positiveTo p))
    (hg : ∀ p, positiveTo (g p) = G (positiveTo p)) (x : SqrtPair) :
    sqrtPairTo (Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem_step f g x) =
      sqrtStepNative F G (sqrtPairTo x) := by
  cases x with
  | pair s r =>
    cases r with
    | IsNul => simp [Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem_step,sqrtPairTo,
        sqrtStepNative,positiveTo_xO,sub_mask_agrees,hg,hf,positiveTo_xH]
    | IsNeg => simp [Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem_step,sqrtPairTo,
        sqrtStepNative,positiveTo_xO,sub_mask_agrees,hg,hf,positiveTo_xH]
    | IsPos r =>
      have hr := positiveTo_pos r
      have hc := positive_leb_agrees (.xI (.xO s)) (g (f r))
      simp only [positiveTo_xI,positiveTo_xO,hg,hf] at hc
      have hm : 2*(2*positiveTo s)+1 = 4*positiveTo s+1 := by omega
      rw [hm] at hc
      cases hb : Rocq.Corelib.BinNums.PosDef.Pos.leb (.xI (.xO s)) (g (f r)) <;>
        simp [hb,boolTo] at hc <;>
        simp [Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem_step,hb,sqrtPairTo,sqrtStepNative,
          positiveTo_xI,positiveTo_xO,sub_mask_agrees,hg,hf,hm,
          Nat.ne_of_gt hr,hc]
      all_goals rw [if_neg (by omega)]

theorem source_ii (p : RPositive) :
    Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem (.xI (.xI p)) =
      Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem_step (.xI) (.xI)
        (Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem p) := by rfl
theorem source_oi (p : RPositive) :
    Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem (.xI (.xO p)) =
      Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem_step (.xO) (.xI)
        (Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem p) := by rfl
theorem source_io (p : RPositive) :
    Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem (.xO (.xI p)) =
      Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem_step (.xI) (.xO)
        (Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem p) := by rfl
theorem source_oo (p : RPositive) :
    Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem (.xO (.xO p)) =
      Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem_step (.xO) (.xO)
        (Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem p) := by rfl

def SqrtInvariant (n : Nat) (x : Nat × Option Nat) : Prop :=
  ∃ s r, x = (s,some r) ∧ 0 < s ∧ n = s*s+r ∧ r < 2*s+1

theorem native_step_invariant (n s r a b : Nat)
    (hs : 0 < s) (hn : n = s*s+r) (hr : r < 2*s+1) (ha : a ≤ 1) (hb : b ≤ 1) :
    SqrtInvariant (4*n+2*a+b)
      (sqrtStepNative (fun k => 2*k+a) (fun k => 2*k+b) (s,some r)) := by
  have sq0 : (2*s)*(2*s) = 4*(s*s) := by
    change (2*s)*(2*s) = (2*2)*(s*s)
    ac_rfl
  have sq1 : (2*s+1)*(2*s+1) = 4*(s*s)+4*s+1 := by
    simp only [Nat.add_mul,Nat.mul_add,Nat.one_mul,Nat.mul_one]
    rw [sq0]
    omega
  by_cases hz : r = 0
  · refine ⟨2*s,2*a+b,?_,by omega,?_,by omega⟩
    · simp only [sqrtStepNative,hz,if_pos rfl]
      have hle : 4 ≤ 2*(2*1+a)+b := by omega
      simp only [checkedSub,if_pos hle]
      have he : 2*(2*1+a)+b-4 = 2*a+b := by omega
      simp only [he,ite_true]
    · rw [sq0]; omega
  · by_cases ht : 4*s+1 ≤ 2*(2*r+a)+b
    · refine ⟨2*s+1,2*(2*r+a)+b-(4*s+1),?_,by omega,?_,?_⟩
      · simp [sqrtStepNative,hz,ht,checkedSub]
      · rw [sq1]; omega
      · omega
    · refine ⟨2*s,2*(2*r+a)+b,?_,by omega,?_,by omega⟩
      · simp [sqrtStepNative,hz,ht]
      · rw [sq0]; omega

theorem invariant_step (f g : RPositive → RPositive) (a b : Nat)
    (hf : ∀ p, positiveTo (f p) = 2*positiveTo p+a)
    (hg : ∀ p, positiveTo (g p) = 2*positiveTo p+b)
    (ha : a ≤ 1) (hb : b ≤ 1) (n : Nat) (x : SqrtPair)
    (h : SqrtInvariant n (sqrtPairTo x)) :
    SqrtInvariant (4*n+2*a+b)
      (sqrtPairTo (Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem_step f g x)) := by
  rw [sqrtrem_step_agrees f g (fun k => 2*k+a) (fun k => 2*k+b) hf hg]
  obtain ⟨s,r,hx,hs,hn,hr⟩ := h
  rw [hx]
  exact native_step_invariant n s r a b hs hn hr ha hb

theorem sqrtrem_invariant (p : RPositive) :
    SqrtInvariant (positiveTo p) (sqrtPairTo (Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem p)) := by
  have h : ∀ p : RPositive,
      SqrtInvariant (positiveTo p) (sqrtPairTo (Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem p)) ∧
      SqrtInvariant (positiveTo (.xI p)) (sqrtPairTo (Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem (.xI p))) ∧
      SqrtInvariant (positiveTo (.xO p)) (sqrtPairTo (Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem (.xO p))) := by
    intro p
    induction p with
    | xH => exact ⟨⟨1,0,rfl,by decide,rfl,by decide⟩,
        ⟨1,2,rfl,by decide,rfl,by decide⟩,⟨1,1,rfl,by decide,rfl,by decide⟩⟩
    | xI p ih =>
      refine ⟨ih.2.1,?_,?_⟩
      · rw [source_ii]
        have hh := invariant_step (.xI) (.xI) 1 1 positiveTo_xI positiveTo_xI
          (by decide) (by decide) _ _ ih.1
        simp only [positiveTo_xI,positiveTo_xO]
        have he : 2*(2*positiveTo p+1)+1 = 4*positiveTo p+2*1+1 := by omega
        rw [he]
        exact hh
      · rw [source_io]
        have hh := invariant_step (.xI) (.xO) 1 0 positiveTo_xI
          (fun p => by simp [positiveTo_xO])
          (by decide) (by decide) _ _ ih.1
        simp only [positiveTo_xI,positiveTo_xO]
        have he : 2*(2*positiveTo p+1) = 4*positiveTo p+2*1+0 := by omega
        rw [he]
        exact hh
    | xO p ih =>
      refine ⟨ih.2.2,?_,?_⟩
      · rw [source_oi]
        have hh := invariant_step (.xO) (.xI) 0 1
          (fun p => by simp [positiveTo_xO]) positiveTo_xI
          (by decide) (by decide) _ _ ih.1
        simp only [positiveTo_xI,positiveTo_xO]
        have he : 2*(2*positiveTo p)+1 = 4*positiveTo p+2*0+1 := by omega
        rw [he]
        exact hh
      · rw [source_oo]
        have hh := invariant_step (.xO) (.xO) 0 0
          (fun p => by simp [positiveTo_xO])
          (fun p => by simp [positiveTo_xO])
          (by decide) (by decide) _ _ ih.1
        simp only [positiveTo_xI,positiveTo_xO]
        have he : 2*(2*positiveTo p) = 4*positiveTo p+2*0+0 := by omega
        rw [he]
        exact hh
  exact (h p).1

-- Native uniqueness proof shared in form with NatIterators; no source closure imported.
theorem sqrt_unique (n p : Nat) (hl : p*p ≤ n) (hu : n < (p+1)*(p+1)) :
    p = Nat.sqrt n := by
  have hsl := Nat.sqrt_le n
  have hsu := Nat.lt_succ_sqrt n
  change n < (Nat.sqrt n+1)*(Nat.sqrt n+1) at hsu
  apply Nat.le_antisymm
  · by_cases hn : p ≤ Nat.sqrt n
    · exact hn
    have h : Nat.sqrt n + 1 ≤ p := by omega
    have hm := Nat.mul_le_mul h h
    omega
  · by_cases hn : Nat.sqrt n ≤ p
    · exact hn
    have h : p+1 ≤ Nat.sqrt n := by omega
    have hm := Nat.mul_le_mul h h
    omega


def sqrtRemNative (n : Nat) : Nat × Option Nat :=
  (Nat.sqrt n, some (n-Nat.sqrt n*Nat.sqrt n))

theorem sqrtrem_agrees (p : RPositive) :
    sqrtPairTo (Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem p) =
      sqrtRemNative (positiveTo p) := by
  obtain ⟨s,r,hx,hs,hn,hr⟩ := sqrtrem_invariant p
  have hl : s*s ≤ positiveTo p := by omega
  have hu : positiveTo p < (s+1)*(s+1) := by
    simp only [Nat.add_mul,Nat.mul_add,Nat.one_mul,Nat.mul_one]
    omega
  have he := sqrt_unique (positiveTo p) s hl hu
  rw [hx, sqrtRemNative, ←he]
  congr 2
  omega

def zSqrtRemNative (z : Int) : Int × Int :=
  (Int.ofNat (Nat.sqrt z.toNat),
    Int.ofNat (z.toNat-Nat.sqrt z.toNat*Nat.sqrt z.toNat))

theorem z_sqrtrem_agrees (z : RIntBinary) :
    zPairTo (Rocq.Corelib.BinNums.IntDef.Z.sqrtrem z) =
      zSqrtRemNative (binaryIntTo z) := by
  cases z with
  | Z0 => rfl
  | Zneg p =>
    change (0,0) = zSqrtRemNative (-Int.ofNat (positiveTo p))
    simp [zSqrtRemNative]
    rfl
  | Zpos p =>
    have h := sqrtrem_agrees p
    cases hx : Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem p with
    | pair s r =>
      rw [hx] at h
      cases r with
      | IsNul =>
        simp only [sqrtPairTo,maskTo_nul,sqrtRemNative,Prod.mk.injEq,Option.some.injEq] at h
        simp [Rocq.Corelib.BinNums.IntDef.Z.sqrtrem,hx,zPairTo,zSqrtRemNative,
          zToPos,zToZero,h.1,←h.2]
      | IsPos r =>
        simp only [sqrtPairTo,maskTo_pos,sqrtRemNative,Prod.mk.injEq,Option.some.injEq] at h
        simp [Rocq.Corelib.BinNums.IntDef.Z.sqrtrem,hx,zPairTo,zSqrtRemNative,
          zToPos,h.1,h.2]
      | IsNeg =>
        simp [sqrtPairTo,sqrtRemNative] at h

-- Evaluated boundary and non-square examples; these are not extra root counts.
theorem example_positive_12345 :
    sqrtPairTo (Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem (positiveOf 12345)) =
      (111,some 24) := by
  rw [sqrtrem_agrees,positive_to_of _ (by decide)]
  decide +kernel
theorem example_negative_12345 :
    zPairTo (Rocq.Corelib.BinNums.IntDef.Z.sqrtrem (binaryIntOf (-12345))) = (0,0) := by
  rw [z_sqrtrem_agrees,binaryInt_to_of]
  decide +kernel
theorem example_integer_12345 :
    zPairTo (Rocq.Corelib.BinNums.IntDef.Z.sqrtrem (binaryIntOf 12345)) = (111,24) := by
  rw [z_sqrtrem_agrees,binaryInt_to_of]
  decide +kernel
theorem sqrtrem_native_bound (p : RPositive) :
    let s := (sqrtPairTo (Rocq.Corelib.BinNums.PosDef.Pos.sqrtrem p)).1
    s*s ≤ positiveTo p := by
  rw [sqrtrem_agrees]
  exact Nat.sqrt_le _

end NativeBridge.Incremental.BinarySqrtRem

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
  for name in ["NativeBridge.Incremental.BinarySqrtRem.sqrtStepNative", "NativeBridge.Incremental.BinarySqrtRem.sqrtRemNative", "NativeBridge.Incremental.BinarySqrtRem.zSqrtRemNative"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

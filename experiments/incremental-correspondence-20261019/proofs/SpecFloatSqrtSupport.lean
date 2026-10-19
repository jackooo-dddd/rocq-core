import SpecFloatDivision
import Init.Data.Nat.Sqrt.Lemmas
set_option autoImplicit false
set_option maxHeartbeats 200000
noncomputable section
namespace NativeBridge.Incremental.BinaryNatSub
open NativeBridge
-- Recover the exact second component of the unchanged source mutual recursor.
-- The outer projection is checked explicitly; inner recursive projections stay unchanged.
run_cmd Lean.Elab.Command.liftTermElabM do
  let ci ← Lean.getConstInfo "Rocq.Corelib.BinNums.PosDef.Pos.sub_mask".toName
  let .defnInfo di := ci | throwError "Expected source definition"
  let .lam xn xt (.lam yn yt (.app (.proj pn 0 pair) arg) ybi) xbi := di.value
    | throwError "Unexpected source mutual-recursion projection"
  let value := Lean.Expr.lam xn xt (.lam yn yt (.app (.proj pn 1 pair) arg) ybi) xbi
  Lean.addDecl (.defnDecl {di with name := "NativeBridge.Incremental.BinaryNatSub.subCarryAux".toName,value:=value})
abbrev RMask := Rocq.Corelib.BinNums.PosDef.Pos.mask
def maskTo : RMask → Option Nat :=
  Rocq.Corelib.BinNums.PosDef.Pos.mask.rec (some 0) (fun p => some (positiveTo p)) none
def maskOf : Option Nat → RMask
  | none => .IsNeg
  | some 0 => .IsNul
  | some (n+1) => .IsPos (positiveOf (n+1))
@[simp] theorem mask_to_of (n : Option Nat) : maskTo (maskOf n) = n := by
  cases n with
  | none => rfl
  | some n =>
    cases n with
    | zero => rfl
    | succ n =>
      change some (positiveTo (positiveOf (n+1))) = some (n+1)
      rw [positive_to_of _ (by omega)]
@[simp] theorem mask_of_to (m : RMask) : maskOf (maskTo m) = m := by
  cases m with
  | IsNul => rfl
  | IsNeg => rfl
  | IsPos p =>
    change maskOf (some (positiveTo p)) = .IsPos p
    have hp := positiveTo_pos p
    cases hn : positiveTo p with
    | zero => omega
    | succ n =>
      change Rocq.Corelib.BinNums.PosDef.Pos.mask.IsPos (positiveOf (n+1)) = .IsPos p
      apply congrArg Rocq.Corelib.BinNums.PosDef.Pos.mask.IsPos
      rw [←hn]; exact positive_of_to p
def maskIso : Iso Rocq.Corelib.BinNums.PosDef.Pos.mask (Option Nat) := ⟨maskTo,maskOf,mask_of_to,mask_to_of⟩

theorem positive_pred_double_agrees (p : RPositive) :
    positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p) = 2*positiveTo p-1 := by
  induction p with
  | xI p ih => change 2*(2*positiveTo p)+1 = 2*(2*positiveTo p+1)-1; omega
  | xO p ih =>
    change 2*positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p)+1 = 2*(2*positiveTo p)-1
    rw [ih]; have := positiveTo_pos p; omega
  | xH => rfl

theorem double_mask_agrees (m : RMask) :
    maskTo (Rocq.Corelib.BinNums.PosDef.Pos.double_mask m) = (maskTo m).map (2*·) := by
  cases m <;> rfl
theorem succ_double_mask_agrees (m : RMask) :
    maskTo (Rocq.Corelib.BinNums.PosDef.Pos.succ_double_mask m) = (maskTo m).map (fun n => 2*n+1) := by
  cases m <;> rfl
theorem double_pred_mask_agrees (p : RPositive) :
    maskTo (Rocq.Corelib.BinNums.PosDef.Pos.double_pred_mask p) = some (2*positiveTo p-2) := by
  cases p with
  | xI p => change some (2*(2*positiveTo p)) = some (2*(2*positiveTo p+1)-2); congr 1 <;> omega
  | xO p =>
    change some (2*positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p)) = some (2*(2*positiveTo p)-2)
    rw [positive_pred_double_agrees]; have := positiveTo_pos p; congr 1 <;> omega
  | xH => rfl

def checkedSub (n m : Nat) : Option Nat := if m ≤ n then some (n-m) else none



theorem sub_ii (n m : Nat) :
    (checkedSub n (m)).map (fun k => 2*k+0) = checkedSub (2*n+1) (2*m+1) := by
  unfold checkedSub
  split <;> split <;> simp_all
  all_goals first | omega | (congr 1 <;> omega)

theorem sub_oo (n m : Nat) :
    (checkedSub n (m)).map (fun k => 2*k+0) = checkedSub (2*n) (2*m) := by
  unfold checkedSub
  split <;> split <;> simp_all
  all_goals first | omega | (congr 1 <;> omega)

theorem sub_io (n m : Nat) :
    (checkedSub n (m)).map (fun k => 2*k+1) = checkedSub (2*n+1) (2*m) := by
  unfold checkedSub
  split <;> split <;> simp_all
  all_goals first | omega | (congr 1 <;> omega)

theorem sub_oi (n m : Nat) :
    (checkedSub n (m+1)).map (fun k => 2*k+1) = checkedSub (2*n) (2*m+1) := by
  unfold checkedSub
  split <;> split <;> simp_all
  all_goals first | omega | (congr 1 <;> omega)

theorem sub_iic (n m : Nat) :
    (checkedSub n (m+1)).map (fun k => 2*k+1) = checkedSub (2*n+1) (2*m+2) := by
  unfold checkedSub
  split <;> split <;> simp_all
  all_goals first | omega | (congr 1 <;> omega)

theorem sub_oic (n m : Nat) :
    (checkedSub n (m+1)).map (fun k => 2*k+0) = checkedSub (2*n) (2*m+2) := by
  unfold checkedSub
  split <;> split <;> simp_all
  all_goals first | omega | (congr 1 <;> omega)


theorem sub_mask_ii (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask (.xI p) (.xI q) = Rocq.Corelib.BinNums.PosDef.Pos.double_mask (Rocq.Corelib.BinNums.PosDef.Pos.sub_mask p q) := rfl
theorem sub_mask_carry_ii (p : RPositive) (q : RPositive) : NativeBridge.Incremental.BinaryNatSub.subCarryAux (.xI p) (.xI q) = Rocq.Corelib.BinNums.PosDef.Pos.succ_double_mask (NativeBridge.Incremental.BinaryNatSub.subCarryAux p q) := rfl
theorem sub_mask_oi (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask (.xO p) (.xI q) = Rocq.Corelib.BinNums.PosDef.Pos.succ_double_mask (NativeBridge.Incremental.BinaryNatSub.subCarryAux p q) := rfl
theorem sub_mask_carry_oi (p : RPositive) (q : RPositive) : NativeBridge.Incremental.BinaryNatSub.subCarryAux (.xO p) (.xI q) = Rocq.Corelib.BinNums.PosDef.Pos.double_mask (NativeBridge.Incremental.BinaryNatSub.subCarryAux p q) := rfl
theorem sub_mask_io (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask (.xI p) (.xO q) = Rocq.Corelib.BinNums.PosDef.Pos.succ_double_mask (Rocq.Corelib.BinNums.PosDef.Pos.sub_mask p q) := rfl
theorem sub_mask_carry_io (p : RPositive) (q : RPositive) : NativeBridge.Incremental.BinaryNatSub.subCarryAux (.xI p) (.xO q) = Rocq.Corelib.BinNums.PosDef.Pos.double_mask (Rocq.Corelib.BinNums.PosDef.Pos.sub_mask p q) := rfl
theorem sub_mask_oo (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask (.xO p) (.xO q) = Rocq.Corelib.BinNums.PosDef.Pos.double_mask (Rocq.Corelib.BinNums.PosDef.Pos.sub_mask p q) := rfl
theorem sub_mask_carry_oo (p : RPositive) (q : RPositive) : NativeBridge.Incremental.BinaryNatSub.subCarryAux (.xO p) (.xO q) = Rocq.Corelib.BinNums.PosDef.Pos.succ_double_mask (NativeBridge.Incremental.BinaryNatSub.subCarryAux p q) := rfl
theorem sub_mask_ih (p : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask (.xI p) (.xH) = .IsPos (.xO p) := rfl
theorem sub_mask_carry_ih (p : RPositive) : NativeBridge.Incremental.BinaryNatSub.subCarryAux (.xI p) (.xH) = .IsPos (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p) := rfl
theorem sub_mask_oh (p : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask (.xO p) (.xH) = .IsPos (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p) := rfl
theorem sub_mask_carry_oh (p : RPositive) : NativeBridge.Incremental.BinaryNatSub.subCarryAux (.xO p) (.xH) = Rocq.Corelib.BinNums.PosDef.Pos.double_pred_mask p := rfl
theorem sub_mask_hi (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask (.xH) (.xI q) = .IsNeg := rfl
theorem sub_mask_carry_hi (q : RPositive) : NativeBridge.Incremental.BinaryNatSub.subCarryAux (.xH) (.xI q) = .IsNeg := rfl
theorem sub_mask_ho (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask (.xH) (.xO q) = .IsNeg := rfl
theorem sub_mask_carry_ho (q : RPositive) : NativeBridge.Incremental.BinaryNatSub.subCarryAux (.xH) (.xO q) = .IsNeg := rfl
theorem sub_mask_hh  : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask (.xH) (.xH) = .IsNul := rfl
theorem sub_mask_carry_hh  : NativeBridge.Incremental.BinaryNatSub.subCarryAux (.xH) (.xH) = .IsNeg := rfl

theorem sub_mask_pair (p q : RPositive) :
    maskTo (Rocq.Corelib.BinNums.PosDef.Pos.sub_mask p q) = checkedSub (positiveTo p) (positiveTo q) ∧
    maskTo (NativeBridge.Incremental.BinaryNatSub.subCarryAux p q) = checkedSub (positiveTo p) (positiveTo q+1) := by
  induction q generalizing p with
  | xI q ih =>
    cases p with
    | xI p =>
      have h := ih p
      simp only [sub_mask_ii,sub_mask_carry_ii,double_mask_agrees,succ_double_mask_agrees,h.1,h.2,positiveTo_xI]
      constructor
      · exact sub_ii _ _
      · exact sub_iic _ _
    | xO p =>
      have h := ih p
      simp only [sub_mask_oi,sub_mask_carry_oi,double_mask_agrees,succ_double_mask_agrees,h.2,positiveTo_xI,positiveTo_xO]
      constructor
      · exact sub_oi _ _
      · exact sub_oic _ _
    | xH =>
      have hp := positiveTo_pos q
      change none = checkedSub 1 (2*positiveTo q+1) ∧ none = checkedSub 1 (2*positiveTo q+1+1)
      unfold checkedSub
      simp only [if_neg (by omega : ¬2*positiveTo q+1 ≤ 1),if_neg (by omega : ¬2*positiveTo q+1+1 ≤ 1)]
      constructor <;> first | rfl | trivial
  | xO q ih =>
    cases p with
    | xI p =>
      have h := ih p
      simp only [sub_mask_io,sub_mask_carry_io,double_mask_agrees,succ_double_mask_agrees,h.1,positiveTo_xI,positiveTo_xO]
      constructor
      · exact sub_io _ _
      · exact sub_ii _ _
    | xO p =>
      have h := ih p
      simp only [sub_mask_oo,sub_mask_carry_oo,double_mask_agrees,succ_double_mask_agrees,h.1,h.2,positiveTo_xO]
      constructor
      · exact sub_oo _ _
      · exact sub_oi _ _
    | xH =>
      have hp := positiveTo_pos q
      change none = checkedSub 1 (2*positiveTo q) ∧ none = checkedSub 1 (2*positiveTo q+1)
      unfold checkedSub
      simp only [if_neg (by omega : ¬2*positiveTo q ≤ 1),if_neg (by omega : ¬2*positiveTo q+1 ≤ 1)]
      constructor <;> first | rfl | trivial
  | xH =>
    cases p with
    | xI p =>
      have hp := positiveTo_pos p
      simp only [sub_mask_ih,sub_mask_carry_ih,maskTo,positiveTo_xI,positiveTo_xO,positiveTo_xH,positive_pred_double_agrees]
      unfold checkedSub
      simp only [if_pos (by omega : 1 ≤ 2*positiveTo p+1),if_pos (by omega : 1+1 ≤ 2*positiveTo p+1)]
      constructor <;> congr 1 <;> omega
    | xO p =>
      have hp := positiveTo_pos p
      rw [sub_mask_oh,sub_mask_carry_oh,double_pred_mask_agrees]
      simp only [maskTo,positiveTo_xO,positiveTo_xH,positive_pred_double_agrees]
      unfold checkedSub
      simp only [if_pos (by omega : 1 ≤ 2*positiveTo p),if_pos (by omega : 1+1 ≤ 2*positiveTo p)]
      constructor <;> first | rfl | trivial
    | xH => constructor <;> first | rfl | trivial

theorem sub_mask_agrees (p q : RPositive) :
    maskTo (Rocq.Corelib.BinNums.PosDef.Pos.sub_mask p q) = checkedSub (positiveTo p) (positiveTo q) :=
  (sub_mask_pair p q).1
theorem sub_mask_carry_agrees (p q : RPositive) :
    maskTo (NativeBridge.Incremental.BinaryNatSub.subCarryAux p q) = checkedSub (positiveTo p) (positiveTo q+1) :=
  (sub_mask_pair p q).2



end NativeBridge.Incremental.BinaryNatSub
namespace NativeBridge.Incremental.BinarySqrtRem
open NativeBridge BinaryInt BinaryOrder BinaryArithmetic BinaryNatSub BinaryDivision
theorem compare_leb (c : RComparison) :
    boolTo (Rocq.Corelib.Init.Datatypes.comparison.rec
      Rocq.Corelib.Init.Datatypes.bool.true .true .false c) =
      (comparisonTo c != Ordering.gt) := by cases c <;> rfl
theorem native_leb (n m : Nat) :
    (compare n m != Ordering.gt) = decide (n ≤ m) := by
  rw [Nat.compare_eq_ite_lt]
  split
  · rename_i h
    have hh : n ≤ m := by omega
    simp only [hh,decide_true]; rfl
  · split
    · rename_i h h'
      have hh : ¬ n ≤ m := by omega
      simp only [hh,decide_false]; rfl
    · rename_i h h'
      have hh : n ≤ m := by omega
      simp only [hh,decide_true]; rfl

theorem positive_leb_agrees (p q : RPositive) :
    boolTo (Rocq.Corelib.BinNums.PosDef.Pos.leb p q) = decide (positiveTo p ≤ positiveTo q) := by
  unfold Rocq.Corelib.BinNums.PosDef.Pos.leb
  rw [compare_leb,positive_compare_agrees]; exact native_leb _ _

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
    · simp only [sqrtStepNative,hz]
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
        simp only [positiveTo_xI]
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
        simp only [positiveTo_xO]
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


end NativeBridge.Incremental.BinarySqrtRem
namespace NativeBridge.Incremental.BinaryOrder
open NativeBridge
theorem positive_div2_up_agrees (p : RPositive) :
    positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.div2_up p) = (positiveTo p+1)/2 := by
  cases p with
  | xI p =>
    change positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.succ p) = (2*positiveTo p+1+1)/2
    rw [positive_succ_agrees]; omega
  | xO p => change positiveTo p = (2*positiveTo p+1)/2; omega
  | xH => rfl
end NativeBridge.Incremental.BinaryOrder
namespace NativeBridge.Incremental.BinaryInt
open NativeBridge BinaryOrder
theorem z_div2_agrees (z : RIntBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.div2 z) = binaryIntTo z / 2 := by
  cases z with
  | Z0 => rfl
  | Zpos p =>
    cases p with
    | xI p => change (positiveTo p : Int) = (2*positiveTo p+1 : Int)/2; omega
    | xO p => change (positiveTo p : Int) = (2*positiveTo p : Int)/2; omega
    | xH => rfl
  | Zneg p =>
    change -(positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.div2_up p) : Int) = (-(positiveTo p : Int))/2
    rw [positive_div2_up_agrees]; omega

end NativeBridge.Incremental.BinaryInt

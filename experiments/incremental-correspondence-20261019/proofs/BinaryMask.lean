import Interface_BinNums_PosDef
noncomputable section
namespace NativeBridge.Incremental.BinaryMask
open NativeBridge
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
theorem sub_mask_carry_ii (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask_carry (.xI p) (.xI q) = Rocq.Corelib.BinNums.PosDef.Pos.succ_double_mask (Rocq.Corelib.BinNums.PosDef.Pos.sub_mask_carry p q) := rfl
theorem sub_mask_oi (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask (.xO p) (.xI q) = Rocq.Corelib.BinNums.PosDef.Pos.succ_double_mask (Rocq.Corelib.BinNums.PosDef.Pos.sub_mask_carry p q) := rfl
theorem sub_mask_carry_oi (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask_carry (.xO p) (.xI q) = Rocq.Corelib.BinNums.PosDef.Pos.double_mask (Rocq.Corelib.BinNums.PosDef.Pos.sub_mask_carry p q) := rfl
theorem sub_mask_io (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask (.xI p) (.xO q) = Rocq.Corelib.BinNums.PosDef.Pos.succ_double_mask (Rocq.Corelib.BinNums.PosDef.Pos.sub_mask p q) := rfl
theorem sub_mask_carry_io (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask_carry (.xI p) (.xO q) = Rocq.Corelib.BinNums.PosDef.Pos.double_mask (Rocq.Corelib.BinNums.PosDef.Pos.sub_mask p q) := rfl
theorem sub_mask_oo (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask (.xO p) (.xO q) = Rocq.Corelib.BinNums.PosDef.Pos.double_mask (Rocq.Corelib.BinNums.PosDef.Pos.sub_mask p q) := rfl
theorem sub_mask_carry_oo (p : RPositive) (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask_carry (.xO p) (.xO q) = Rocq.Corelib.BinNums.PosDef.Pos.succ_double_mask (Rocq.Corelib.BinNums.PosDef.Pos.sub_mask_carry p q) := rfl
theorem sub_mask_ih (p : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask (.xI p) (.xH) = .IsPos (.xO p) := rfl
theorem sub_mask_carry_ih (p : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask_carry (.xI p) (.xH) = .IsPos (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p) := rfl
theorem sub_mask_oh (p : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask (.xO p) (.xH) = .IsPos (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p) := rfl
theorem sub_mask_carry_oh (p : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask_carry (.xO p) (.xH) = Rocq.Corelib.BinNums.PosDef.Pos.double_pred_mask p := rfl
theorem sub_mask_hi (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask (.xH) (.xI q) = .IsNeg := rfl
theorem sub_mask_carry_hi (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask_carry (.xH) (.xI q) = .IsNeg := rfl
theorem sub_mask_ho (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask (.xH) (.xO q) = .IsNeg := rfl
theorem sub_mask_carry_ho (q : RPositive) : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask_carry (.xH) (.xO q) = .IsNeg := rfl
theorem sub_mask_hh  : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask (.xH) (.xH) = .IsNul := rfl
theorem sub_mask_carry_hh  : Rocq.Corelib.BinNums.PosDef.Pos.sub_mask_carry (.xH) (.xH) = .IsNeg := rfl

theorem sub_mask_pair (p q : RPositive) :
    maskTo (Rocq.Corelib.BinNums.PosDef.Pos.sub_mask p q) = checkedSub (positiveTo p) (positiveTo q) ∧
    maskTo (Rocq.Corelib.BinNums.PosDef.Pos.sub_mask_carry p q) = checkedSub (positiveTo p) (positiveTo q+1) := by
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
    maskTo (Rocq.Corelib.BinNums.PosDef.Pos.sub_mask_carry p q) = checkedSub (positiveTo p) (positiveTo q+1) :=
  (sub_mask_pair p q).2


theorem mask_sub_value (m : RMask) :
    positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.mask.rec
      Rocq.Corelib.Numbers.BinNums.positive.xH (fun p => p) .xH m) =
      max 1 ((maskTo m).getD 0) := by
  cases m with
  | IsNul => rfl
  | IsNeg => rfl
  | IsPos p => change positiveTo p = max 1 (positiveTo p); have := positiveTo_pos p; omega
theorem positive_sub_agrees (p q : RPositive) :
    positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.sub p q) = max 1 (positiveTo p-positiveTo q) := by
  unfold Rocq.Corelib.BinNums.PosDef.Pos.sub
  rw [mask_sub_value,sub_mask_agrees]
  unfold checkedSub
  split <;> simp_all <;> omega

universe u v
def maskElim {P : Option Nat → Sort u} (z : P (some 0))
    (p : (n : {n : Nat // 0<n}) → P (some n.val)) (neg : P none) :
    (m : Option Nat) → P m
  | none => neg
  | some 0 => z
  | some (n+1) => p ⟨n+1,by omega⟩
theorem maskElim_pos {P : Option Nat → Sort u} (z : P (some 0))
    (p : (n : {n : Nat // 0<n}) → P (some n.val)) (neg : P none) (n : Nat) (hn : 0<n) :
    maskElim z p neg (some n) = p ⟨n,hn⟩ := by
  cases n with
  | zero => omega
  | succ n => rfl
theorem mask_rect_agrees (P : Option Nat → Sort u) (z : P (some 0))
    (p : (n : {n : Nat // 0<n}) → P (some n.val)) (neg : P none) (m : RMask) :
    Rocq.Corelib.BinNums.PosDef.Pos.mask_rect (fun m => P (maskTo m)) z
      (fun x => p ⟨positiveTo x,positiveTo_pos x⟩) neg m =
      maskElim z p neg (maskTo m) := by
  cases m with
  | IsNul => rfl
  | IsNeg => rfl
  | IsPos x =>
    change p ⟨positiveTo x,positiveTo_pos x⟩ = maskElim z p neg (some (positiveTo x))
    exact (maskElim_pos z p neg _ _).symm
theorem mask_rec_agrees (P : Option Nat → Type) (z : P (some 0))
    (p : (n : {n : Nat // 0<n}) → P (some n.val)) (neg : P none) (m : RMask) :
    Rocq.Corelib.BinNums.PosDef.Pos.mask_rec (fun m => P (maskTo m)) z
      (fun x => p ⟨positiveTo x,positiveTo_pos x⟩) neg m =
      maskElim z p neg (maskTo m) :=
  mask_rect_agrees P z p neg m

theorem mask_forall (P : RMask → Prop) :
    (∀ m, P m) ↔ ∀ m : Option Nat, P (maskOf m) := by
  constructor
  · intro h m; exact h _
  · intro h m; simpa only [mask_of_to] using h (maskTo m)
theorem mask_family_forall {A : Sort u} (F : (RMask → A) → Prop) :
    (∀ f, F f) ↔ ∀ f : Option Nat → A, F (fun m => f (maskTo m)) := by
  constructor
  · intro h f; exact h _
  · intro h f; simpa only [mask_of_to] using h (fun m => f (maskOf m))
theorem positive_forall (P : RPositive → Prop) :
    (∀ p, P p) ↔ ∀ n : {n : Nat // 0<n}, P (positiveOf n.val) := by
  constructor
  · intro h n; exact h _
  · intro h p; simpa only [positive_of_to] using h ⟨positiveTo p,positiveTo_pos p⟩
theorem positive_to_of_subtype (n : {n : Nat // 0<n}) :
    positiveTo (positiveOf n.val) = n.val := positive_to_of _ n.property
theorem maskTo_nul : maskTo Rocq.Corelib.BinNums.PosDef.Pos.mask.IsNul = some 0 := rfl
theorem maskTo_neg : maskTo Rocq.Corelib.BinNums.PosDef.Pos.mask.IsNeg = none := rfl
theorem maskTo_pos (p : RPositive) :
    maskTo (Rocq.Corelib.BinNums.PosDef.Pos.mask.IsPos p) = some (positiveTo p) := rfl

end NativeBridge.Incremental.BinaryMask

import Sint63Operations
import Init.Data.Nat.Log2
set_option maxHeartbeats 300000
set_option maxRecDepth 4096
set_option linter.unusedSimpArgs false
noncomputable section
-- Rechecked N-division and signed truncation paths in Sint63Axioms.
namespace NativeBridge.Incremental.BinaryOrder
open NativeBridge
theorem n_compare_agrees (p q : RNatBinary) :
    comparisonTo (Rocq.Corelib.BinNums.NatDef.N.compare p q) = compare (binaryNatTo p) (binaryNatTo q) := by
  cases p with
  | N0 =>
    cases q with
    | N0 => rfl
    | Npos q =>
      have := positiveTo_pos q
      change Ordering.lt = compare 0 (positiveTo q)
      rw [Nat.compare_eq_ite_lt]; simp [this]
  | Npos p =>
    cases q with
    | N0 =>
      have := positiveTo_pos p
      change Ordering.gt = compare (positiveTo p) 0
      rw [Nat.compare_eq_ite_lt]; simp [this]
    | Npos q => exact positive_compare_agrees p q
theorem n_leb_agrees (p q : RNatBinary) :
    boolTo (Rocq.Corelib.BinNums.NatDef.N.leb p q) = decide (binaryNatTo p ≤ binaryNatTo q) := by
  unfold Rocq.Corelib.BinNums.NatDef.N.leb
  rw [compare_leb,n_compare_agrees]; exact native_leb _ _

end NativeBridge.Incremental.BinaryOrder
namespace NativeBridge.Incremental.BinaryInt
open NativeBridge BinaryOrder
theorem n_double_agrees (n : RNatBinary) :
    binaryNatTo (Rocq.Corelib.BinNums.NatDef.N.double n) = 2*binaryNatTo n := by
  cases n <;> rfl
theorem n_succ_double_agrees (n : RNatBinary) :
    binaryNatTo (Rocq.Corelib.BinNums.NatDef.N.succ_double n) = 2*binaryNatTo n+1 := by
  cases n <;> rfl

end NativeBridge.Incremental.BinaryInt

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


theorem mask_sub_value (m : RMask) :
    positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.mask.rec
      Rocq.Corelib.Numbers.BinNums.positive.xH (fun p => p) .xH m) =
      max 1 ((maskTo m).getD 0) := by
  cases m with
  | IsNul => rfl
  | IsNeg => rfl
  | IsPos p => change positiveTo p = max 1 (positiveTo p); have := positiveTo_pos p; omega

theorem mask_n_value (m : RMask) :
    binaryNatTo (Rocq.Corelib.BinNums.PosDef.Pos.mask.rec
      Rocq.Corelib.Numbers.BinNums.N.N0 (fun p => .Npos p) .N0 m) = (maskTo m).getD 0 := by
  cases m <;> rfl

theorem n_sub_agrees (x y : RNatBinary) :
    binaryNatTo (Rocq.Corelib.BinNums.NatDef.N.sub x y) = binaryNatTo x-binaryNatTo y := by
  cases x with
  | N0 => change 0 = 0-binaryNatTo y; omega
  | Npos p =>
    cases y with
    | N0 => rfl
    | Npos q =>
      change binaryNatTo (Rocq.Corelib.BinNums.PosDef.Pos.mask.rec
        Rocq.Corelib.Numbers.BinNums.N.N0 (fun p => .Npos p) .N0
        (Rocq.Corelib.BinNums.PosDef.Pos.sub_mask p q)) = positiveTo p-positiveTo q
      rw [mask_n_value,sub_mask_agrees]
      unfold checkedSub
      split <;> simp_all <;> omega

end NativeBridge.Incremental.BinaryNatSub

namespace NativeBridge.Incremental.BinaryDivision
open NativeBridge BinaryInt BinaryOrder BinaryArithmetic BinaryNatSub
abbrev NPair := Rocq.Corelib.Init.Datatypes.prod RNatBinary RNatBinary
abbrev nPairTo (x : NPair) : Nat × Nat := match x with | .pair _ _ q r => (binaryNatTo q,binaryNatTo r)

def divStep (b c : Nat) (qr : Nat × Nat) : Nat × Nat :=
  if b ≤ 2*qr.2+c then (2*qr.1+1,2*qr.2+c-b) else (2*qr.1,2*qr.2+c)

theorem source_step_I (p : RPositive) (b : RNatBinary) :
    nPairTo (Rocq.Corelib.BinNums.NatDef.N.pos_div_eucl (.xI p) b) =
      divStep (binaryNatTo b) 1 (nPairTo (Rocq.Corelib.BinNums.NatDef.N.pos_div_eucl p b)) := by
  cases h : Rocq.Corelib.BinNums.NatDef.N.pos_div_eucl p b with
  | pair q r =>
    change nPairTo (Rocq.Corelib.Init.Datatypes.prod.rec
      (fun q r =>
        Rocq.Corelib.Init.Datatypes.bool.rec
          (.pair _ _ (Rocq.Corelib.BinNums.NatDef.N.succ_double q)
            (Rocq.Corelib.BinNums.NatDef.N.sub (Rocq.Corelib.BinNums.NatDef.N.succ_double r) b))
          (.pair _ _ (Rocq.Corelib.BinNums.NatDef.N.double q)
            (Rocq.Corelib.BinNums.NatDef.N.succ_double r))
          (Rocq.Corelib.BinNums.NatDef.N.leb b (Rocq.Corelib.BinNums.NatDef.N.succ_double r)))
      (Rocq.Corelib.BinNums.NatDef.N.pos_div_eucl p b)) = _
    rw [h]
    have hc := n_leb_agrees b (Rocq.Corelib.BinNums.NatDef.N.succ_double r)
    rw [n_succ_double_agrees] at hc
    cases hb : Rocq.Corelib.BinNums.NatDef.N.leb b (Rocq.Corelib.BinNums.NatDef.N.succ_double r) <;>
      simp [hb, boolTo] at hc <;>
      simp [hb, nPairTo, divStep, hc, n_succ_double_agrees, n_double_agrees, n_sub_agrees]
    all_goals rw [if_neg (by omega)]

theorem source_step_O (p : RPositive) (b : RNatBinary) :
    nPairTo (Rocq.Corelib.BinNums.NatDef.N.pos_div_eucl (.xO p) b) =
      divStep (binaryNatTo b) 0 (nPairTo (Rocq.Corelib.BinNums.NatDef.N.pos_div_eucl p b)) := by
  cases h : Rocq.Corelib.BinNums.NatDef.N.pos_div_eucl p b with
  | pair q r =>
    change nPairTo (Rocq.Corelib.Init.Datatypes.prod.rec
      (fun q r =>
        Rocq.Corelib.Init.Datatypes.bool.rec
          (.pair _ _ (Rocq.Corelib.BinNums.NatDef.N.succ_double q)
            (Rocq.Corelib.BinNums.NatDef.N.sub (Rocq.Corelib.BinNums.NatDef.N.double r) b))
          (.pair _ _ (Rocq.Corelib.BinNums.NatDef.N.double q)
            (Rocq.Corelib.BinNums.NatDef.N.double r))
          (Rocq.Corelib.BinNums.NatDef.N.leb b (Rocq.Corelib.BinNums.NatDef.N.double r)))
      (Rocq.Corelib.BinNums.NatDef.N.pos_div_eucl p b)) = _
    rw [h]
    have hc := n_leb_agrees b (Rocq.Corelib.BinNums.NatDef.N.double r)
    rw [n_double_agrees] at hc
    cases hb : Rocq.Corelib.BinNums.NatDef.N.leb b (Rocq.Corelib.BinNums.NatDef.N.double r) <;>
      simp [hb, boolTo] at hc <;>
      simp [hb, nPairTo, divStep, hc, n_succ_double_agrees, n_double_agrees, n_sub_agrees]
    all_goals rw [if_neg (by omega)]

theorem divmod_unique (a b q r : Nat) (hb : 0 < b) (he : a = q*b+r) (hr : r < b) :
    (a/b,a%b) = (q,r) := by
  subst a
  rw [Nat.add_comm]
  simp [Nat.add_mul_div_right _ _ hb, Nat.div_eq_of_lt hr, Nat.mod_eq_of_lt hr]

theorem divmod_step (a b c : Nat) (hb : 0 < b) (hc : c ≤ 1) :
    divStep b c (a/b,a%b) = ((2*a+c)/b,(2*a+c)%b) := by
  have hr := Nat.mod_lt a hb
  have he := Nat.div_add_mod a b
  rw [Nat.mul_comm b (a/b)] at he
  have hex : 2*a+c = (2*(a/b))*b+(2*(a%b)+c) := by
    simp only [Nat.mul_assoc]
    omega
  unfold divStep
  dsimp only
  split
  · rename_i h
    symm
    apply divmod_unique _ _ _ _ hb
    · simp only [Nat.add_mul, Nat.one_mul]
      omega
    · omega
  · rename_i h
    symm
    exact divmod_unique _ _ _ _ hb hex (by omega)


theorem n_pos_div_nonzero (p : RPositive) (b : RNatBinary) (hb : 0 < binaryNatTo b) :
    nPairTo (Rocq.Corelib.BinNums.NatDef.N.pos_div_eucl p b) =
      (positiveTo p / binaryNatTo b, positiveTo p % binaryNatTo b) := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec with
  | xI p ih =>
    rw [source_step_I, ih]
    exact divmod_step (positiveTo p) (binaryNatTo b) 1 hb (by omega)
  | xO p ih =>
    rw [source_step_O, ih]
    exact divmod_step (positiveTo p) (binaryNatTo b) 0 hb (by omega)
  | xH =>
    cases b with
    | N0 => cases Nat.not_lt_zero _ hb
    | Npos p =>
      cases p with
      | xI p =>
        change (0,1) = (1/(2*positiveTo p+1),1%(2*positiveTo p+1))
        have hp := positiveTo_pos p
        simp [Nat.div_eq_of_lt (show 1 < 2*positiveTo p+1 by omega),
          Nat.mod_eq_of_lt (show 1 < 2*positiveTo p+1 by omega)]
      | xO p =>
        change (0,1) = (1/(2*positiveTo p),1%(2*positiveTo p))
        have hp := positiveTo_pos p
        simp [Nat.div_eq_of_lt (show 1 < 2*positiveTo p by omega),
          Nat.mod_eq_of_lt (show 1 < 2*positiveTo p by omega)]
      | xH => rfl

theorem n_pos_div_zero (p : RPositive) :
    nPairTo (Rocq.Corelib.BinNums.NatDef.N.pos_div_eucl p .N0) =
      (2 ^ Nat.log2 (positiveTo p) - 1, positiveTo p) := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec with
  | xI p ih =>
    rw [source_step_I, ih]
    change divStep 0 1 (2 ^ Nat.log2 (positiveTo p)-1,positiveTo p) =
      (2 ^ Nat.log2 (2*positiveTo p+1)-1,2*positiveTo p+1)
    rw [log2_bit _ _ (positiveTo_pos p) (by omega)]
    have hp : 0 < 2 ^ Nat.log2 (positiveTo p) := Nat.pow_pos (by omega)
    simp only [divStep, Nat.zero_le, ↓reduceIte, Nat.sub_zero, Nat.pow_succ]
    congr 1
    omega
  | xO p ih =>
    rw [source_step_O, ih]
    change divStep 0 0 (2 ^ Nat.log2 (positiveTo p)-1,positiveTo p) =
      (2 ^ Nat.log2 (2*positiveTo p+0)-1,2*positiveTo p+0)
    rw [log2_bit _ _ (positiveTo_pos p) (by omega)]
    have hp : 0 < 2 ^ Nat.log2 (positiveTo p) := Nat.pow_pos (by omega)
    simp only [divStep, Nat.zero_le, ↓reduceIte, Nat.sub_zero, Nat.pow_succ]
    congr 1
    omega
  | xH => rfl

def nPosDivNative (p b : Nat) : Nat × Nat :=
  if b=0 then (2 ^ Nat.log2 p-1,p) else (p/b,p%b)
theorem n_pos_div_eucl_agrees (p : RPositive) (b : RNatBinary) :
    nPairTo (Rocq.Corelib.BinNums.NatDef.N.pos_div_eucl p b) =
      nPosDivNative (positiveTo p) (binaryNatTo b) := by
  cases b with
  | N0 => exact n_pos_div_zero p
  | Npos b =>
    have hb : 0 < binaryNatTo (.Npos b) := positiveTo_pos b
    rw [n_pos_div_nonzero p _ hb]
    simp [nPosDivNative, Nat.ne_of_gt hb]


theorem zOfN_agrees (n : RNatBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.of_N n) = (binaryNatTo n : Int) := by
  cases n <;> rfl
def quotremNative (x y : Int) := (x.tdiv y,x.tmod y)
theorem z_quotrem_agrees (x y : RIntBinary) :
    zPairTo (Rocq.Corelib.BinNums.IntDef.Z.quotrem x y) =
      quotremNative (binaryIntTo x) (binaryIntTo y) := by
  cases x with
  | Z0 => simp [Rocq.Corelib.BinNums.IntDef.Z.quotrem, zPairTo, zToZero, quotremNative]
  | Zpos p =>
    cases y with
    | Z0 => simp [Rocq.Corelib.BinNums.IntDef.Z.quotrem, zPairTo, zToZero, quotremNative]
    | Zpos b =>
      have he := n_pos_div_nonzero p (.Npos b) (positiveTo_pos b)
      cases h : Rocq.Corelib.BinNums.NatDef.N.pos_div_eucl p (.Npos b) with
      | pair q r =>
        rw [h] at he
        have hq := congrArg Prod.fst he
        have hr := congrArg Prod.snd he
        change binaryNatTo q = positiveTo p / positiveTo b at hq
        change binaryNatTo r = positiveTo p % positiveTo b at hr
        simp [Rocq.Corelib.BinNums.IntDef.Z.quotrem, h, zPairTo, zOfN_agrees, zToPos,
          quotremNative, ← Int.ofNat_tdiv, ← Int.ofNat_tmod, hq, hr]
    | Zneg b =>
      have he := n_pos_div_nonzero p (.Npos b) (positiveTo_pos b)
      cases h : Rocq.Corelib.BinNums.NatDef.N.pos_div_eucl p (.Npos b) with
      | pair q r =>
        rw [h] at he
        have hq := congrArg Prod.fst he
        have hr := congrArg Prod.snd he
        change binaryNatTo q = positiveTo p / positiveTo b at hq
        change binaryNatTo r = positiveTo p % positiveTo b at hr
        simp [Rocq.Corelib.BinNums.IntDef.Z.quotrem, h, zPairTo, z_opp_agrees, zOfN_agrees, zToPos, zToNeg,
          quotremNative, ← Int.ofNat_tdiv, ← Int.ofNat_tmod, hq, hr]
  | Zneg p =>
    cases y with
    | Z0 => simp [Rocq.Corelib.BinNums.IntDef.Z.quotrem, zPairTo, zToZero, quotremNative]
    | Zpos b =>
      have he := n_pos_div_nonzero p (.Npos b) (positiveTo_pos b)
      cases h : Rocq.Corelib.BinNums.NatDef.N.pos_div_eucl p (.Npos b) with
      | pair q r =>
        rw [h] at he
        have hq := congrArg Prod.fst he
        have hr := congrArg Prod.snd he
        change binaryNatTo q = positiveTo p / positiveTo b at hq
        change binaryNatTo r = positiveTo p % positiveTo b at hr
        simp [Rocq.Corelib.BinNums.IntDef.Z.quotrem, h, zPairTo, z_opp_agrees, zOfN_agrees, zToPos, zToNeg,
          quotremNative, ← Int.ofNat_tdiv, ← Int.ofNat_tmod, hq, hr]
    | Zneg b =>
      have he := n_pos_div_nonzero p (.Npos b) (positiveTo_pos b)
      cases h : Rocq.Corelib.BinNums.NatDef.N.pos_div_eucl p (.Npos b) with
      | pair q r =>
        rw [h] at he
        have hq := congrArg Prod.fst he
        have hr := congrArg Prod.snd he
        change binaryNatTo q = positiveTo p / positiveTo b at hq
        change binaryNatTo r = positiveTo p % positiveTo b at hr
        simp [Rocq.Corelib.BinNums.IntDef.Z.quotrem, h, zPairTo, z_opp_agrees, zOfN_agrees, zToPos, zToNeg,
          quotremNative, ← Int.ofNat_tdiv, ← Int.ofNat_tmod, hq, hr]

theorem z_quot_agrees (x y : RIntBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.quot x y) = (binaryIntTo x).tdiv (binaryIntTo y) := by
  have h := congrArg Prod.fst (z_quotrem_agrees x y)
  cases he : Rocq.Corelib.BinNums.IntDef.Z.quotrem x y with
  | pair q r =>
    rw [he] at h
    simpa [Rocq.Corelib.BinNums.IntDef.Z.quot, he, zPairTo, prodTo, quotremNative] using h

theorem z_rem_agrees (x y : RIntBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.rem x y) = (binaryIntTo x).tmod (binaryIntTo y) := by
  have h := congrArg Prod.snd (z_quotrem_agrees x y)
  cases he : Rocq.Corelib.BinNums.IntDef.Z.quotrem x y with
  | pair q r =>
    rw [he] at h
    simpa [Rocq.Corelib.BinNums.IntDef.Z.rem, he, zPairTo, prodTo, quotremNative] using h






end NativeBridge.Incremental.BinaryDivision

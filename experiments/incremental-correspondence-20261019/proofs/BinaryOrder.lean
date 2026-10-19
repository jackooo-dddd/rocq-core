import Interface_BinNums_IntDef
noncomputable section
namespace NativeBridge.Incremental.BinaryOrder
open NativeBridge
@[simp] theorem positive_succ_agrees (p : RPositive) : positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.succ p) = positiveTo p + 1 := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec with
  | xI p ih =>
    change 2 * positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.succ p) = 2*positiveTo p+1+1
    rw [ih]; omega
  | xO p ih => rfl
  | xH => rfl
@[simp] theorem positive_pred_double_agrees (p : RPositive) :
  positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p) = 2*positiveTo p-1 := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec with
  | xI p ih => change 2*(2*positiveTo p)+1 = 2*(2*positiveTo p+1)-1; omega
  | xO p ih =>
    change 2*positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p)+1 = 2*(2*positiveTo p)-1
    rw [ih]; have := positiveTo_pos p; omega
  | xH => rfl

def compareCont (r : Ordering) (n m : Nat) : Ordering :=
  if n < m then .lt else if m < n then .gt else r

theorem cc_ii (r : Ordering) (n m : Nat) :
    compareCont r n m = compareCont r (2*n+1) (2*m+1) := by
  unfold compareCont
  repeat' first | split | omega | rfl

theorem cc_oo (r : Ordering) (n m : Nat) :
    compareCont r n m = compareCont r (2*n) (2*m) := by
  unfold compareCont
  repeat' first | split | omega | rfl

theorem cc_oi (r : Ordering) (n m : Nat) :
    compareCont .lt n m = compareCont r (2*n) (2*m+1) := by
  unfold compareCont
  repeat' first | split | omega | rfl

theorem cc_io (r : Ordering) (n m : Nat) :
    compareCont .gt n m = compareCont r (2*n+1) (2*m) := by
  unfold compareCont
  repeat' first | split | omega | rfl

theorem compare_cont_agrees (r : RComparison) (p q : RPositive) :
    comparisonTo (Rocq.Corelib.BinNums.PosDef.Pos.compare_cont r p q) =
      compareCont (comparisonTo r) (positiveTo p) (positiveTo q) := by
  induction q generalizing p r with
  | xI q ih =>
    cases p with
    | xI p =>
      change comparisonTo (Rocq.Corelib.BinNums.PosDef.Pos.compare_cont r p q) =
        compareCont (comparisonTo r) (2*positiveTo p+1) (2*positiveTo q+1)
      rw [ih]; exact cc_ii _ _ _
    | xO p =>
      change comparisonTo (Rocq.Corelib.BinNums.PosDef.Pos.compare_cont .Lt p q) =
        compareCont (comparisonTo r) (2*positiveTo p) (2*positiveTo q+1)
      rw [ih]; exact cc_oi _ _ _
    | xH =>
      change Ordering.lt = compareCont (comparisonTo r) 1 (2*positiveTo q+1)
      have h : 1 < 2*positiveTo q+1 := by have := positiveTo_pos q; omega
      simp [compareCont,h]
  | xO q ih =>
    cases p with
    | xI p =>
      change comparisonTo (Rocq.Corelib.BinNums.PosDef.Pos.compare_cont .Gt p q) =
        compareCont (comparisonTo r) (2*positiveTo p+1) (2*positiveTo q)
      rw [ih]; exact cc_io _ _ _
    | xO p =>
      change comparisonTo (Rocq.Corelib.BinNums.PosDef.Pos.compare_cont r p q) =
        compareCont (comparisonTo r) (2*positiveTo p) (2*positiveTo q)
      rw [ih]; exact cc_oo _ _ _
    | xH =>
      change Ordering.lt = compareCont (comparisonTo r) 1 (2*positiveTo q)
      have h : 1 < 2*positiveTo q := by have := positiveTo_pos q; omega
      simp [compareCont,h]
  | xH =>
    cases p with
    | xI p =>
      change Ordering.gt = compareCont (comparisonTo r) (2*positiveTo p+1) 1
      have h : 1 < 2*positiveTo p+1 := by have := positiveTo_pos p; omega
      simp [compareCont,h,Nat.not_lt_of_ge (Nat.le_of_lt h)]
    | xO p =>
      change Ordering.gt = compareCont (comparisonTo r) (2*positiveTo p) 1
      have h : 1 < 2*positiveTo p := by have := positiveTo_pos p; omega
      simp [compareCont,h,Nat.not_lt_of_ge (Nat.le_of_lt h)]
    | xH =>
      change comparisonTo r = compareCont (comparisonTo r) 1 1
      rfl

theorem positive_compare_agrees (p q : RPositive) :
    comparisonTo (Rocq.Corelib.BinNums.PosDef.Pos.compare p q) = compare (positiveTo p) (positiveTo q) := by
  change comparisonTo (Rocq.Corelib.BinNums.PosDef.Pos.compare_cont .Eq p q) = _
  rw [compare_cont_agrees, Nat.compare_eq_ite_lt]; rfl

theorem positive_div2_agrees (p : RPositive) :
    positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.div2 p) = max 1 (positiveTo p / 2) := by
  cases p with
  | xI p => have := positiveTo_pos p; change positiveTo p = max 1 ((2*positiveTo p+1)/2); omega
  | xO p => have := positiveTo_pos p; change positiveTo p = max 1 ((2*positiveTo p)/2); omega
  | xH => rfl
theorem positive_div2_up_agrees (p : RPositive) :
    positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.div2_up p) = (positiveTo p+1)/2 := by
  cases p with
  | xI p =>
    change positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.succ p) = (2*positiveTo p+1+1)/2
    rw [positive_succ_agrees]; omega
  | xO p => change positiveTo p = (2*positiveTo p+1)/2; omega
  | xH => rfl
theorem positive_pred_N_agrees (p : RPositive) :
    binaryNatTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_N p) = positiveTo p-1 := by
  cases p with
  | xI p => change 2*positiveTo p = 2*positiveTo p+1-1; omega
  | xO p => exact positive_pred_double_agrees p
  | xH => rfl

theorem positive_eqb_agrees (p q : RPositive) :
    boolTo (Rocq.Corelib.BinNums.PosDef.Pos.eqb p q) = (positiveTo p == positiveTo q) := by
  induction q generalizing p with
  | xI q ih =>
    cases p with
    | xI p =>
      change boolTo (Rocq.Corelib.BinNums.PosDef.Pos.eqb p q) = (2*positiveTo p+1 == 2*positiveTo q+1)
      rw [ih]; apply Bool.eq_iff_iff.mpr; simp only [beq_iff_eq]; omega
    | xO p =>
      change false = (2*positiveTo p == 2*positiveTo q+1)
      apply Bool.eq_iff_iff.mpr; simp <;> omega
    | xH =>
      have := positiveTo_pos q
      change false = (1 == 2*positiveTo q+1)
      apply Bool.eq_iff_iff.mpr; simp <;> omega
  | xO q ih =>
    cases p with
    | xI p =>
      change false = (2*positiveTo p+1 == 2*positiveTo q)
      apply Bool.eq_iff_iff.mpr; simp <;> omega
    | xO p =>
      change boolTo (Rocq.Corelib.BinNums.PosDef.Pos.eqb p q) = (2*positiveTo p == 2*positiveTo q)
      rw [ih]; apply Bool.eq_iff_iff.mpr; simp only [beq_iff_eq]; omega
    | xH =>
      have := positiveTo_pos q
      change false = (1 == 2*positiveTo q)
      apply Bool.eq_iff_iff.mpr; simp <;> omega
  | xH =>
    cases p with
    | xI p =>
      have := positiveTo_pos p
      change false = (2*positiveTo p+1 == 1)
      apply Bool.eq_iff_iff.mpr; simp <;> omega
    | xO p =>
      have := positiveTo_pos p
      change false = (2*positiveTo p == 1)
      apply Bool.eq_iff_iff.mpr; simp <;> omega
    | xH => rfl
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

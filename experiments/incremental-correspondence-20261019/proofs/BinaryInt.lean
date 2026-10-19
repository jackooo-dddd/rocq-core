import BinaryOrder
noncomputable section
namespace NativeBridge.Incremental.BinaryInt
open NativeBridge NativeBridge.Incremental.BinaryOrder

theorem n_double_agrees (n : RNatBinary) :
    binaryNatTo (Rocq.Corelib.BinNums.NatDef.N.double n) = 2*binaryNatTo n := by
  cases n <;> rfl
theorem n_succ_double_agrees (n : RNatBinary) :
    binaryNatTo (Rocq.Corelib.BinNums.NatDef.N.succ_double n) = 2*binaryNatTo n+1 := by
  cases n <;> rfl
theorem n_succ_pos_agrees (n : RNatBinary) :
    positiveTo (Rocq.Corelib.BinNums.NatDef.N.succ_pos n) = binaryNatTo n+1 := by
  cases n with
  | N0 => rfl
  | Npos n => exact positive_succ_agrees n
theorem pos_Ndouble_agrees (n : RNatBinary) :
    binaryNatTo (Rocq.Corelib.BinNums.PosDef.Pos.Ndouble n) = 2*binaryNatTo n := by
  cases n <;> rfl
theorem pos_Nsucc_double_agrees (n : RNatBinary) :
    binaryNatTo (Rocq.Corelib.BinNums.PosDef.Pos.Nsucc_double n) = 2*binaryNatTo n+1 := by
  cases n <;> rfl

theorem compare_ofNat (n m : Nat) :
    compare ((n : Int)) ((m : Int)) = compare n m := by
  rw [Int.compare_eq_ite_lt,Nat.compare_eq_ite_lt]; simp
theorem compare_negNat (n m : Nat) :
    (compare n m).swap = compare (-(n : Int)) (-(m : Int)) := by
  rw [Int.compare_eq_ite_lt,Nat.compare_eq_ite_lt]
  repeat' first | split | omega | rfl

theorem z_compare_agrees (x y : RIntBinary) :
    comparisonTo (Rocq.Corelib.BinNums.IntDef.Z.compare x y) =
      compare (binaryIntTo x) (binaryIntTo y) := by
  cases x with
  | Z0 =>
    cases y with
    | Z0 => rfl
    | Zpos p =>
      change Ordering.lt = compare 0 ((positiveTo p : Int))
      have h : 0 < (positiveTo p : Int) := by have := positiveTo_pos p; omega
      rw [Int.compare_eq_ite_lt, if_pos h]
    | Zneg p =>
      change Ordering.gt = compare 0 (-(positiveTo p : Int))
      have h : -(positiveTo p : Int) < 0 := by have := positiveTo_pos p; omega
      rw [Int.compare_eq_ite_lt, if_neg (by omega), if_pos h]
  | Zpos p =>
    cases y with
    | Z0 =>
      change Ordering.gt = compare ((positiveTo p : Int)) 0
      have h : 0 < (positiveTo p : Int) := by have := positiveTo_pos p; omega
      rw [Int.compare_eq_ite_lt, if_neg (by omega), if_pos h]
    | Zpos q =>
      change comparisonTo (Rocq.Corelib.BinNums.PosDef.Pos.compare p q) =
        compare ((positiveTo p : Int)) ((positiveTo q : Int))
      rw [positive_compare_agrees,compare_ofNat]
    | Zneg q =>
      change Ordering.gt = compare ((positiveTo p : Int)) (-(positiveTo q : Int))
      have h : -(positiveTo q : Int) < (positiveTo p : Int) := by have := positiveTo_pos p; omega
      rw [Int.compare_eq_ite_lt, if_neg (by omega), if_pos h]
  | Zneg p =>
    cases y with
    | Z0 =>
      change Ordering.lt = compare (-(positiveTo p : Int)) 0
      have h : -(positiveTo p : Int) < 0 := by have := positiveTo_pos p; omega
      rw [Int.compare_eq_ite_lt, if_pos h]
    | Zpos q =>
      change Ordering.lt = compare (-(positiveTo p : Int)) ((positiveTo q : Int))
      have h : -(positiveTo p : Int) < (positiveTo q : Int) := by have := positiveTo_pos p; omega
      rw [Int.compare_eq_ite_lt, if_pos h]
    | Zneg q =>
      change comparisonTo (Rocq.Corelib.Init.Datatypes.CompOpp (Rocq.Corelib.BinNums.PosDef.Pos.compare p q)) =
        compare (-(positiveTo p : Int)) (-(positiveTo q : Int))
      rw [compOpp_agrees,positive_compare_agrees,compare_negNat]

theorem z_double_agrees (z : RIntBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.double z) = 2*binaryIntTo z := by
  cases z <;> simp only [Rocq.Corelib.BinNums.IntDef.Z.double,binaryIntTo,positiveTo_xO,Int.ofNat_eq_natCast] <;> omega
theorem z_succ_double_agrees (z : RIntBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.succ_double z) = 2*binaryIntTo z+1 := by
  cases z with
  | Z0 => rfl
  | Zpos p => change (2*positiveTo p+1 : Int) = 2*(positiveTo p : Int)+1; omega
  | Zneg p =>
    change -(positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p) : Int) = 2*(-(positiveTo p : Int))+1
    rw [positive_pred_double_agrees]; have := positiveTo_pos p; omega
theorem z_pred_double_agrees (z : RIntBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.pred_double z) = 2*binaryIntTo z-1 := by
  cases z with
  | Z0 => rfl
  | Zpos p =>
    change (positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p) : Int) = 2*(positiveTo p : Int)-1
    rw [positive_pred_double_agrees]; have := positiveTo_pos p; omega
  | Zneg p => change -(2*positiveTo p+1 : Int) = 2*(-(positiveTo p : Int))-1; omega
theorem z_to_pos_agrees (z : RIntBinary) :
    positiveTo (Rocq.Corelib.BinNums.IntDef.Z.to_pos z) = max 1 (binaryIntTo z).toNat := by
  cases z with
  | Z0 => rfl
  | Zpos p => change positiveTo p = max 1 ((positiveTo p : Int)).toNat; have := positiveTo_pos p; omega
  | Zneg p => change 1 = max 1 (-(positiveTo p : Int)).toNat; omega
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

theorem mechanical_eq {A : Sort u} (x y : A) :
    Rocq.Corelib.Init.Logic.eq A x y ↔ x = y := by
  constructor
  · intro h; cases h; rfl
  · intro h; cases h; exact .eq_refl A x
theorem mechanical_not (P : Prop) : Rocq.Corelib.Init.Logic.not P ↔ ¬P := by
  constructor
  · intro h hp; cases h hp
  · intro h hp; exact (h hp).elim
theorem z_lt_agrees (x y : RIntBinary) :
    Rocq.Corelib.BinNums.IntDef.Z.lt x y ↔ binaryIntTo x < binaryIntTo y := by
  unfold Rocq.Corelib.BinNums.IntDef.Z.lt
  rw [mechanical_eq,← comparisonIso.eq_iff]
  change comparisonTo (Rocq.Corelib.BinNums.IntDef.Z.compare x y) = Ordering.lt ↔ _
  rw [z_compare_agrees,Int.compare_eq_lt]
theorem z_gt_agrees (x y : RIntBinary) :
    Rocq.Corelib.BinNums.IntDef.Z.gt x y ↔ binaryIntTo x > binaryIntTo y := by
  unfold Rocq.Corelib.BinNums.IntDef.Z.gt
  rw [mechanical_eq,← comparisonIso.eq_iff]
  change comparisonTo (Rocq.Corelib.BinNums.IntDef.Z.compare x y) = Ordering.gt ↔ _
  rw [z_compare_agrees,Int.compare_eq_gt]
theorem z_le_agrees (x y : RIntBinary) :
    Rocq.Corelib.BinNums.IntDef.Z.le x y ↔ binaryIntTo x ≤ binaryIntTo y := by
  unfold Rocq.Corelib.BinNums.IntDef.Z.le
  rw [mechanical_not,mechanical_eq,← comparisonIso.eq_iff]
  change (¬comparisonTo (Rocq.Corelib.BinNums.IntDef.Z.compare x y) = Ordering.gt) ↔ _
  rw [z_compare_agrees,Int.compare_eq_gt]; omega
theorem z_ge_agrees (x y : RIntBinary) :
    Rocq.Corelib.BinNums.IntDef.Z.ge x y ↔ binaryIntTo x ≥ binaryIntTo y := by
  unfold Rocq.Corelib.BinNums.IntDef.Z.ge
  rw [mechanical_not,mechanical_eq,← comparisonIso.eq_iff]
  change (¬comparisonTo (Rocq.Corelib.BinNums.IntDef.Z.compare x y) = Ordering.lt) ↔ _
  rw [z_compare_agrees,Int.compare_eq_lt]; omega
theorem compare_ltb (c : RComparison) :
    boolTo (Rocq.Corelib.Init.Datatypes.comparison.rec
      Rocq.Corelib.Init.Datatypes.bool.false .true .false c) =
      decide (comparisonTo c = Ordering.lt) := by cases c <;> rfl
theorem z_ltb_agrees (x y : RIntBinary) :
    boolTo (Rocq.Corelib.BinNums.IntDef.Z.ltb x y) = decide (binaryIntTo x < binaryIntTo y) := by
  unfold Rocq.Corelib.BinNums.IntDef.Z.ltb
  rw [compare_ltb,z_compare_agrees]
  apply Bool.eq_iff_iff.mpr
  simp only [decide_eq_true_eq,Int.compare_eq_lt]
theorem z_leb_agrees (x y : RIntBinary) :
    boolTo (Rocq.Corelib.BinNums.IntDef.Z.leb x y) = decide (binaryIntTo x ≤ binaryIntTo y) := by
  unfold Rocq.Corelib.BinNums.IntDef.Z.leb
  rw [compare_leb,z_compare_agrees]
  apply Bool.eq_iff_iff.mpr
  change (compare (binaryIntTo x) (binaryIntTo y) != Ordering.gt) = true ↔ _
  rw [bne_iff_ne,decide_eq_true_eq]
  change (¬compare (binaryIntTo x) (binaryIntTo y) = Ordering.gt) ↔ _
  rw [Int.compare_eq_gt]; omega

theorem z_eqb_agrees (x y : RIntBinary) :
    boolTo (Rocq.Corelib.BinNums.IntDef.Z.eqb x y) = (binaryIntTo x == binaryIntTo y) := by
  cases x with
  | Z0 =>
    cases y with
    | Z0 => rfl
    | Zpos p =>
      change false = ((0:Int) == (positiveTo p : Int))
      have := positiveTo_pos p
      apply Bool.eq_iff_iff.mpr; simp <;> omega
    | Zneg p =>
      change false = ((0:Int) == -(positiveTo p : Int))
      have := positiveTo_pos p
      apply Bool.eq_iff_iff.mpr; simp <;> omega
  | Zpos p =>
    cases y with
    | Z0 =>
      change false = ((positiveTo p : Int) == 0)
      have := positiveTo_pos p
      apply Bool.eq_iff_iff.mpr; simp <;> omega
    | Zpos q =>
      change boolTo (Rocq.Corelib.BinNums.PosDef.Pos.eqb p q) = ((positiveTo p : Int) == (positiveTo q : Int))
      rw [positive_eqb_agrees]
      apply Bool.eq_iff_iff.mpr; simp only [beq_iff_eq]; omega
    | Zneg q =>
      change false = ((positiveTo p : Int) == -(positiveTo q : Int))
      have := positiveTo_pos p
      apply Bool.eq_iff_iff.mpr; simp <;> omega
  | Zneg p =>
    cases y with
    | Z0 =>
      change false = (-(positiveTo p : Int) == 0)
      have := positiveTo_pos p
      apply Bool.eq_iff_iff.mpr; simp <;> omega
    | Zpos q =>
      change false = (-(positiveTo p : Int) == (positiveTo q : Int))
      have := positiveTo_pos p
      apply Bool.eq_iff_iff.mpr; simp <;> omega
    | Zneg q =>
      change boolTo (Rocq.Corelib.BinNums.PosDef.Pos.eqb p q) = (-(positiveTo p : Int) == -(positiveTo q : Int))
      rw [positive_eqb_agrees]
      apply Bool.eq_iff_iff.mpr; simp only [beq_iff_eq]; omega

theorem z_max_agrees (x y : RIntBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.max x y) = max (binaryIntTo x) (binaryIntTo y) := by
  have hc := z_compare_agrees x y
  unfold Rocq.Corelib.BinNums.IntDef.Z.max
  cases h : Rocq.Corelib.BinNums.IntDef.Z.compare x y with
  | Eq =>
    rw [h] at hc
    change Ordering.eq = compare (binaryIntTo x) (binaryIntTo y) at hc
    have he := Int.compare_eq_eq.mp hc.symm
    change binaryIntTo x = max (binaryIntTo x) (binaryIntTo y); omega
  | Lt =>
    rw [h] at hc
    change Ordering.lt = compare (binaryIntTo x) (binaryIntTo y) at hc
    have he := Int.compare_eq_lt.mp hc.symm
    change binaryIntTo y = max (binaryIntTo x) (binaryIntTo y); omega
  | Gt =>
    rw [h] at hc
    change Ordering.gt = compare (binaryIntTo x) (binaryIntTo y) at hc
    have he := Int.compare_eq_gt.mp hc.symm
    change binaryIntTo x = max (binaryIntTo x) (binaryIntTo y); omega
theorem z_min_agrees (x y : RIntBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.min x y) = min (binaryIntTo x) (binaryIntTo y) := by
  have hc := z_compare_agrees x y
  unfold Rocq.Corelib.BinNums.IntDef.Z.min
  cases h : Rocq.Corelib.BinNums.IntDef.Z.compare x y with
  | Eq =>
    rw [h] at hc
    change Ordering.eq = compare (binaryIntTo x) (binaryIntTo y) at hc
    have he := Int.compare_eq_eq.mp hc.symm
    change binaryIntTo x = min (binaryIntTo x) (binaryIntTo y); omega
  | Lt =>
    rw [h] at hc
    change Ordering.lt = compare (binaryIntTo x) (binaryIntTo y) at hc
    have he := Int.compare_eq_lt.mp hc.symm
    change binaryIntTo x = min (binaryIntTo x) (binaryIntTo y); omega
  | Gt =>
    rw [h] at hc
    change Ordering.gt = compare (binaryIntTo x) (binaryIntTo y) at hc
    have he := Int.compare_eq_gt.mp hc.symm
    change binaryIntTo y = min (binaryIntTo x) (binaryIntTo y); omega

end NativeBridge.Incremental.BinaryInt

import SpecFloatNormalize
set_option autoImplicit false
set_option maxHeartbeats 200000
noncomputable section
namespace NativeBridge.Incremental.BinaryDivision
open NativeBridge BinaryInt BinaryOrder BinaryArithmetic
abbrev ZPair := Rocq.Corelib.Init.Datatypes.prod RIntBinary RIntBinary
abbrev zPairTo (x : ZPair) : Int × Int := match x with | .pair _ _ q r => (binaryIntTo q,binaryIntTo r)
theorem zToZero : binaryIntTo .Z0 = 0 := rfl
theorem zToPos (p : RPositive) : binaryIntTo (.Zpos p) = (positiveTo p : Int) := rfl
theorem zToNeg (p : RPositive) : binaryIntTo (.Zneg p) = -(positiveTo p : Int) := rfl

def zDivStep (b c : Int) (qr : Int × Int) : Int × Int :=
  if 2*qr.2+c < b then (2*qr.1,2*qr.2+c) else (2*qr.1+1,2*qr.2+c-b)

theorem zToOne : binaryIntTo (.Zpos .xH) = 1 := rfl
theorem zToTwo : binaryIntTo (.Zpos (.xO .xH)) = 2 := rfl

theorem z_source_step_I (p : RPositive) (b : RIntBinary) :
    zPairTo (Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl (.xI p) b) =
      zDivStep (binaryIntTo b) 1 (zPairTo (Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl p b)) := by
  cases h : Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl p b with
  | pair q r =>
    change zPairTo (Rocq.Corelib.Init.Datatypes.prod.rec
      (fun q r => Rocq.Corelib.Init.Datatypes.bool.rec
        (.pair _ _ (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH)) q) (Rocq.Corelib.BinNums.IntDef.Z.add (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH)) r) (.Zpos .xH)))
        (.pair _ _ (Rocq.Corelib.BinNums.IntDef.Z.add (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH)) q) (.Zpos .xH))
          (Rocq.Corelib.BinNums.IntDef.Z.sub (Rocq.Corelib.BinNums.IntDef.Z.add (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH)) r) (.Zpos .xH)) b))
        (Rocq.Corelib.BinNums.IntDef.Z.ltb (Rocq.Corelib.BinNums.IntDef.Z.add (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH)) r) (.Zpos .xH)) b))
      (Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl p b)) = _
    rw [h]
    have hc := z_ltb_agrees (Rocq.Corelib.BinNums.IntDef.Z.add (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH)) r) (.Zpos .xH)) b
    simp only [z_add_agrees, BinaryPower.z_mul_agrees, zToOne, zToTwo] at hc
    cases hb : Rocq.Corelib.BinNums.IntDef.Z.ltb (Rocq.Corelib.BinNums.IntDef.Z.add (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH)) r) (.Zpos .xH)) b <;>
      simp [hb, boolTo] at hc <;>
      simp [hb, zPairTo, zDivStep, hc, z_add_agrees, BinaryPower.z_mul_agrees, z_sub_agrees, zToOne, zToTwo]
    all_goals omega

theorem z_source_step_O (p : RPositive) (b : RIntBinary) :
    zPairTo (Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl (.xO p) b) =
      zDivStep (binaryIntTo b) 0 (zPairTo (Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl p b)) := by
  cases h : Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl p b with
  | pair q r =>
    change zPairTo (Rocq.Corelib.Init.Datatypes.prod.rec
      (fun q r => Rocq.Corelib.Init.Datatypes.bool.rec
        (.pair _ _ (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH)) q) (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH)) r))
        (.pair _ _ (Rocq.Corelib.BinNums.IntDef.Z.add (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH)) q) (.Zpos .xH))
          (Rocq.Corelib.BinNums.IntDef.Z.sub (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH)) r) b))
        (Rocq.Corelib.BinNums.IntDef.Z.ltb (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH)) r) b))
      (Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl p b)) = _
    rw [h]
    have hc := z_ltb_agrees (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH)) r) b
    simp only [BinaryPower.z_mul_agrees, zToTwo] at hc
    cases hb : Rocq.Corelib.BinNums.IntDef.Z.ltb (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH)) r) b <;>
      simp [hb, boolTo] at hc <;>
      simp [hb, zPairTo, zDivStep, hc, z_add_agrees, BinaryPower.z_mul_agrees, z_sub_agrees, zToOne, zToTwo]
    all_goals omega

theorem z_divmod_unique (a b q r : Int) (hb : 0 < b)
    (he : r+b*q=a) (hr0 : 0 ≤ r) (hrb : r < b) :
    (a/b,a%b) = (q,r) :=
  Prod.ext ((Int.ediv_emod_unique hb).mpr ⟨he,hr0,hrb⟩).1
    ((Int.ediv_emod_unique hb).mpr ⟨he,hr0,hrb⟩).2

theorem z_divmod_step (a b c : Int) (hb : 0 < b) (hc0 : 0 ≤ c) (hc1 : c ≤ 1) :
    zDivStep b c (a/b,a%b) = ((2*a+c)/b,(2*a+c)%b) := by
  have hr0 := Int.emod_nonneg a (Int.ne_of_gt hb)
  have hrb := Int.emod_lt_of_pos a hb
  have he := Int.emod_add_mul_ediv a b
  have hex : (2*(a%b)+c)+b*(2*(a/b))=2*a+c := by
    rw [Int.mul_left_comm b 2 (a/b)]
    omega
  unfold zDivStep
  dsimp only
  split
  · rename_i h
    symm
    exact z_divmod_unique _ _ _ _ hb hex (by omega) h
  · rename_i h
    symm
    apply z_divmod_unique _ _ _ _ hb
    · simp only [Int.mul_add, Int.mul_one, Int.mul_left_comm b 2]
      omega
    · omega
    · omega

theorem z_pos_div_positive (p : RPositive) (b : RIntBinary) (hb : 0 < binaryIntTo b) :
    zPairTo (Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl p b) =
      ((positiveTo p : Int)/binaryIntTo b,(positiveTo p : Int)%binaryIntTo b) := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec with
  | xI p ih =>
    rw [z_source_step_I, ih]
    simpa [positiveTo_xI] using
      z_divmod_step (positiveTo p) (binaryIntTo b) 1 hb (by omega) (by omega)
  | xO p ih =>
    rw [z_source_step_O, ih]
    simpa [positiveTo_xO] using
      z_divmod_step (positiveTo p) (binaryIntTo b) 0 hb (by omega) (by omega)
  | xH =>
    have hc := z_leb_agrees (.Zpos (.xO .xH)) b
    rw [zToTwo] at hc
    cases h : Rocq.Corelib.BinNums.IntDef.Z.leb (.Zpos (.xO .xH)) b <;>
      simp [h, boolTo] at hc
    · change zPairTo (Rocq.Corelib.Init.Datatypes.bool.rec _ _
        (Rocq.Corelib.BinNums.IntDef.Z.leb (.Zpos (.xO .xH)) b)) = _
      rw [h]
      change (0,1) = (1/binaryIntTo b,1%binaryIntTo b)
      symm
      apply z_divmod_unique _ _ _ _ hb <;> omega
    · change zPairTo (Rocq.Corelib.Init.Datatypes.bool.rec _ _
        (Rocq.Corelib.BinNums.IntDef.Z.leb (.Zpos (.xO .xH)) b)) = _
      rw [h]
      change (1,0) = (1/binaryIntTo b,1%binaryIntTo b)
      symm
      apply z_divmod_unique _ _ _ _ hb <;> omega


def floorPairNative (a b : Int) := (a.fdiv b,a.fmod b)

theorem floorPair_pos_unique (a b q r : Int) (hb : 0 < b)
    (he : r+b*q=a) (hr0 : 0 ≤ r) (hrb : r < b) :
    floorPairNative a b = (q,r) := by
  simpa only [floorPairNative, Int.fdiv_eq_ediv_of_nonneg a (Int.le_of_lt hb),
    Int.fmod_eq_emod_of_nonneg a (Int.le_of_lt hb)] using z_divmod_unique a b q r hb he hr0 hrb

theorem floorPair_neg_unique (a b q r : Int) (hb : b < 0)
    (he : r+b*q=a) (hr0 : r ≤ 0) (hrb : b < r) :
    floorPairNative a b = (q,r) := by
  have h := floorPair_pos_unique (-a) (-b) q (-r) (by omega)
    (by simp only [Int.neg_mul]; omega) (by omega) (by omega)
  simp only [floorPairNative, Int.neg_fdiv_neg, Int.neg_fmod_neg] at h
  change (a.fdiv b,a.fmod b)=(q,r)
  apply Prod.ext
  · have hh := congrArg Prod.fst h
    exact hh
  · have h := congrArg Prod.snd h
    dsimp only at h
    omega

theorem positive_div_invariant (p b : RPositive) (q r : RIntBinary)
    (h : Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl p (.Zpos b) = .pair _ _ q r) :
    binaryIntTo r + (positiveTo b : Int)*binaryIntTo q = (positiveTo p : Int) ∧
      0 ≤ binaryIntTo r ∧ binaryIntTo r < (positiveTo b : Int) := by
  have hb : 0 < (positiveTo b : Int) := by have := positiveTo_pos b; omega
  have he := z_pos_div_positive p (.Zpos b) hb
  rw [h] at he
  have hq := congrArg Prod.fst he
  have hr := congrArg Prod.snd he
  change binaryIntTo q = (positiveTo p : Int)/(positiveTo b : Int) at hq
  change binaryIntTo r = (positiveTo p : Int)%(positiveTo b : Int) at hr
  rw [hq,hr]
  exact ⟨Int.emod_add_mul_ediv _ _,Int.emod_nonneg _ (Int.ne_of_gt hb),Int.emod_lt_of_pos _ hb⟩

theorem z_div_eucl_agrees (x y : RIntBinary) :
    zPairTo (Rocq.Corelib.BinNums.IntDef.Z.div_eucl x y) =
      floorPairNative (binaryIntTo x) (binaryIntTo y) := by
  cases x with
  | Z0 => simp [Rocq.Corelib.BinNums.IntDef.Z.div_eucl,zPairTo,zToZero,floorPairNative]
  | Zpos p =>
    cases y with
    | Z0 => simp [Rocq.Corelib.BinNums.IntDef.Z.div_eucl,zPairTo,zToZero,floorPairNative]
    | Zpos b =>
      have hb : 0 < (positiveTo b : Int) := by have := positiveTo_pos b; omega
      simpa [Rocq.Corelib.BinNums.IntDef.Z.div_eucl, floorPairNative, zToPos,
        Int.fdiv_eq_ediv_of_nonneg _ (Int.le_of_lt hb),
        Int.fmod_eq_emod_of_nonneg _ (Int.le_of_lt hb)] using z_pos_div_positive p (.Zpos b) hb
    | Zneg b =>
      have hb : 0 < (positiveTo b : Int) := by have := positiveTo_pos b; omega
      cases hd : Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl p (.Zpos b) with
      | pair q r =>
        obtain ⟨he,hr0,hrb⟩ := positive_div_invariant p b q r hd
        cases r with
        | Z0 =>
          simp only [zToZero] at he hr0 hrb
          simp only [Rocq.Corelib.BinNums.IntDef.Z.div_eucl,hd,zPairTo,z_opp_agrees,zToZero,zToPos,zToNeg]
          symm
          apply floorPair_neg_unique _ _ _ _ (by omega)
          · simp only [Int.neg_mul,Int.mul_neg]; omega
          · omega
          · omega
        | Zpos r =>
          simp only [zToPos] at he hr0 hrb
          have hrr : 0 < (positiveTo r : Int) := by have := positiveTo_pos r; omega
          simp only [Rocq.Corelib.BinNums.IntDef.Z.div_eucl,hd,zPairTo,z_opp_agrees,
            z_add_agrees,zToPos,zToNeg,positiveTo_xH,Int.natCast_one]
          symm
          apply floorPair_neg_unique _ _ _ _ (by omega)
          · simp only [Int.neg_mul,Int.mul_neg,Int.mul_add,Int.mul_one]; omega
          · omega
          · omega
        | Zneg r =>
          have hrr := positiveTo_pos r
          simp only [zToNeg] at hr0
          omega
  | Zneg p =>
    cases y with
    | Z0 => simp [Rocq.Corelib.BinNums.IntDef.Z.div_eucl,zPairTo,zToZero,floorPairNative]
    | Zpos b =>
      have hb : 0 < (positiveTo b : Int) := by have := positiveTo_pos b; omega
      cases hd : Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl p (.Zpos b) with
      | pair q r =>
        obtain ⟨he,hr0,hrb⟩ := positive_div_invariant p b q r hd
        cases r with
        | Z0 =>
          simp only [zToZero] at he hr0 hrb
          simp only [Rocq.Corelib.BinNums.IntDef.Z.div_eucl,hd,zPairTo,z_opp_agrees,zToZero,zToPos,zToNeg]
          symm
          apply floorPair_pos_unique _ _ _ _ hb
          · simp only [Int.mul_neg]; omega
          · omega
          · omega
        | Zpos r =>
          simp only [zToPos] at he hr0 hrb
          have hrr : 0 < (positiveTo r : Int) := by have := positiveTo_pos r; omega
          simp only [Rocq.Corelib.BinNums.IntDef.Z.div_eucl,hd,zPairTo,z_opp_agrees,
            z_add_agrees,z_sub_agrees,zToPos,zToNeg,positiveTo_xH,Int.natCast_one]
          symm
          apply floorPair_pos_unique _ _ _ _ hb
          · simp only [Int.mul_neg,Int.mul_add,Int.mul_one]; omega
          · omega
          · omega
        | Zneg r =>
          have hrr := positiveTo_pos r
          simp only [zToNeg] at hr0
          omega
    | Zneg b =>
      have hb : 0 < (positiveTo b : Int) := by have := positiveTo_pos b; omega
      cases hd : Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl p (.Zpos b) with
      | pair q r =>
        obtain ⟨he,hr0,hrb⟩ := positive_div_invariant p b q r hd
        simp only [Rocq.Corelib.BinNums.IntDef.Z.div_eucl,hd,zPairTo,z_opp_agrees,zToNeg]
        symm
        apply floorPair_neg_unique _ _ _ _ (by omega)
        · simp only [Int.neg_mul]; omega
        · omega
        · omega


end NativeBridge.Incremental.BinaryDivision

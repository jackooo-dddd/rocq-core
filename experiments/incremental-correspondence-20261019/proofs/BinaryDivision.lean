import BinaryNatSub
import BinaryPower
import Init.Data.Nat.Log2
set_option autoImplicit false
-- Shared simplification sets for the source constructor cases.
set_option linter.unusedSimpArgs false
noncomputable section
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

theorem log2_bit (n c : Nat) (hn : 0 < n) (hc : c ≤ 1) :
    Nat.log2 (2*n+c) = Nat.log2 n + 1 := by
  rw [Nat.log2_def (2*n+c), if_pos (by omega)]
  have hd : (2*n+c)/2=n := by omega
  rw [hd]

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


abbrev ZPair := Rocq.Corelib.Init.Datatypes.prod RIntBinary RIntBinary
abbrev zPairTo (x : ZPair) : Int × Int := match x with | .pair _ _ q r => (binaryIntTo q,binaryIntTo r)
theorem zOfN_agrees (n : RNatBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.of_N n) = (binaryNatTo n : Int) := by
  cases n <;> rfl
theorem zToZero : binaryIntTo .Z0 = 0 := rfl
theorem zToPos (p : RPositive) : binaryIntTo (.Zpos p) = (positiveTo p : Int) := rfl
theorem zToNeg (p : RPositive) : binaryIntTo (.Zneg p) = -(positiveTo p : Int) := rfl

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
    simp only [z_add_agrees, BinaryPower.z_mul_agrees, zToOne, zToTwo] at hc
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


def badPosDivNative (p : Nat) (b : Int) : Int × Int :=
  (2 * (2:Int)^Nat.log2 p - 1, (p:Int)-(2:Int)^Nat.log2 p - ((2:Int)^Nat.log2 p-1)*b)

theorem badPosDiv_step (n c : Nat) (b : Int) (hn : 0 < n) (hc : c ≤ 1) :
    badPosDivNative (2*n+c) b =
      (2*(badPosDivNative n b).1+1,2*(badPosDivNative n b).2+(c:Int)-b) := by
  simp only [badPosDivNative, log2_bit n c hn hc, Int.pow_succ, Int.natCast_add, Int.natCast_mul]
  apply Prod.ext <;> dsimp only
  · omega
  · simp only [Int.sub_mul, Int.one_mul, Int.mul_assoc]
    rw [Int.mul_left_comm ((2:Int)^Nat.log2 n) 2 b]
    omega

theorem z_pos_div_nonpositive (p : RPositive) (b : RIntBinary) (hb : binaryIntTo b ≤ 0) :
    zPairTo (Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl p b) =
      badPosDivNative (positiveTo p) (binaryIntTo b) ∧
      0 ≤ (badPosDivNative (positiveTo p) (binaryIntTo b)).2 := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec with
  | xI p ih =>
    rw [z_source_step_I]
    rw [ih.1]
    change zDivStep (binaryIntTo b) 1 (badPosDivNative (positiveTo p) (binaryIntTo b)) =
      badPosDivNative (2*positiveTo p+1) (binaryIntTo b) ∧
      0 ≤ (badPosDivNative (2*positiveTo p+1) (binaryIntTo b)).2
    rw [badPosDiv_step _ _ _ (positiveTo_pos p) (by omega)]
    have hr := ih.2
    simp only [zDivStep, if_neg (show ¬(2*(badPosDivNative (positiveTo p) (binaryIntTo b)).2+1 < binaryIntTo b) by omega)]
    exact ⟨rfl,by omega⟩
  | xO p ih =>
    rw [z_source_step_O, ih.1]
    change zDivStep (binaryIntTo b) 0 (badPosDivNative (positiveTo p) (binaryIntTo b)) =
      badPosDivNative (2*positiveTo p+0) (binaryIntTo b) ∧
      0 ≤ (badPosDivNative (2*positiveTo p+0) (binaryIntTo b)).2
    rw [badPosDiv_step _ _ _ (positiveTo_pos p) (by omega)]
    have hr := ih.2
    simp only [zDivStep, if_neg (show ¬(2*(badPosDivNative (positiveTo p) (binaryIntTo b)).2+0 < binaryIntTo b) by omega)]
    exact ⟨rfl,by omega⟩
  | xH =>
    have hc := z_leb_agrees (.Zpos (.xO .xH)) b
    rw [zToTwo] at hc
    have he : Rocq.Corelib.BinNums.IntDef.Z.leb (.Zpos (.xO .xH)) b = .false := by
      cases h : Rocq.Corelib.BinNums.IntDef.Z.leb (.Zpos (.xO .xH)) b <;>
        simp [h, boolTo] at hc <;> first | omega | rfl
    constructor
    · change zPairTo (Rocq.Corelib.Init.Datatypes.bool.rec _ _
        (Rocq.Corelib.BinNums.IntDef.Z.leb (.Zpos (.xO .xH)) b)) = _
      rw [he]
      simp [zPairTo, badPosDivNative, positiveTo_xH, zToOne, zToZero, Nat.log2_def]
    · simp [badPosDivNative, positiveTo_xH, Nat.log2_def]

def zPosDivNative (p : Nat) (b : Int) : Int × Int :=
  if 0 < b then ((p:Int)/b,(p:Int)%b) else badPosDivNative p b
theorem z_pos_div_eucl_agrees (p : RPositive) (b : RIntBinary) :
    zPairTo (Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl p b) =
      zPosDivNative (positiveTo p) (binaryIntTo b) := by
  by_cases hb : 0 < binaryIntTo b
  · rw [z_pos_div_positive p b hb]
    simp [zPosDivNative,hb]
  · rw [(z_pos_div_nonpositive p b (by omega)).1]
    simp [zPosDivNative,hb]


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
            z_add_agrees,zToOne,zToPos,zToNeg,positiveTo_xH,Int.natCast_one]
          symm
          apply floorPair_neg_unique _ _ _ _ (by omega)
          · simp only [Int.neg_mul,Int.mul_neg,Int.mul_add,Int.mul_one,Int.neg_neg]; omega
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
            z_add_agrees,z_sub_agrees,zToOne,zToPos,zToNeg,positiveTo_xH,Int.natCast_one]
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
        simp only [Rocq.Corelib.BinNums.IntDef.Z.div_eucl,hd,zPairTo,z_opp_agrees,zToPos,zToNeg]
        symm
        apply floorPair_neg_unique _ _ _ _ (by omega)
        · simp only [Int.neg_mul]; omega
        · omega
        · omega

theorem z_div_agrees (x y : RIntBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.div x y) = (binaryIntTo x).fdiv (binaryIntTo y) := by
  have h := congrArg Prod.fst (z_div_eucl_agrees x y)
  cases he : Rocq.Corelib.BinNums.IntDef.Z.div_eucl x y with
  | pair q r =>
    rw [he] at h
    simpa [Rocq.Corelib.BinNums.IntDef.Z.div, he, zPairTo, prodTo, floorPairNative] using h

theorem z_modulo_agrees (x y : RIntBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.modulo x y) = (binaryIntTo x).fmod (binaryIntTo y) := by
  have h := congrArg Prod.snd (z_div_eucl_agrees x y)
  cases he : Rocq.Corelib.BinNums.IntDef.Z.div_eucl x y with
  | pair q r =>
    rw [he] at h
    simpa [Rocq.Corelib.BinNums.IntDef.Z.modulo, he, zPairTo, prodTo, floorPairNative] using h


theorem example_floor_negative :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.div (binaryIntOf (-7)) (binaryIntOf 3)) = -3 := by
  rw [z_div_agrees,binaryInt_to_of,binaryInt_to_of]
  decide
theorem example_trunc_negative :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.quot (binaryIntOf (-7)) (binaryIntOf 3)) = -2 := by
  rw [z_quot_agrees,binaryInt_to_of,binaryInt_to_of]
  decide
theorem example_floor_mod_negative :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.modulo (binaryIntOf (-7)) (binaryIntOf 3)) = 2 := by
  rw [z_modulo_agrees,binaryInt_to_of,binaryInt_to_of]
  decide
theorem example_trunc_rem_negative :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.rem (binaryIntOf (-7)) (binaryIntOf 3)) = -1 := by
  rw [z_rem_agrees,binaryInt_to_of,binaryInt_to_of]
  decide
theorem example_negative_divisor :
    zPairTo (Rocq.Corelib.BinNums.IntDef.Z.div_eucl (binaryIntOf 7) (binaryIntOf (-3))) = (-3,-2) := by
  rw [z_div_eucl_agrees,binaryInt_to_of,binaryInt_to_of]
  decide
theorem example_n_internal_zero :
    nPairTo (Rocq.Corelib.BinNums.NatDef.N.pos_div_eucl (.xI (.xO .xH)) .N0) = (3,5) := by
  rw [n_pos_div_eucl_agrees]
  rfl
theorem example_z_internal_zero :
    zPairTo (Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl (.xI (.xO .xH)) .Z0) = (7,1) := by
  rw [z_pos_div_eucl_agrees]
  rfl
theorem example_z_internal_negative :
    zPairTo (Rocq.Corelib.BinNums.IntDef.Z.pos_div_eucl (.xI (.xO .xH)) (binaryIntOf (-2))) = (7,7) := by
  rw [z_pos_div_eucl_agrees,binaryInt_to_of]
  rfl

end NativeBridge.Incremental.BinaryDivision



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
  for name in ["Int.fdiv", "Int.fmod", "Int.tdiv", "Int.tmod", "NativeBridge.Incremental.BinaryDivision.floorPairNative", "NativeBridge.Incremental.BinaryDivision.nPosDivNative", "NativeBridge.Incremental.BinaryDivision.quotremNative", "NativeBridge.Incremental.BinaryDivision.zPosDivNative"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

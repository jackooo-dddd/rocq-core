abbrev RPositive := Rocq.Corelib.Numbers.BinNums.positive
abbrev RNatBinary := Rocq.Corelib.Numbers.BinNums.N
abbrev RIntBinary := Rocq.Corelib.Numbers.BinNums.Z
def positiveTo : RPositive → Nat :=
  Rocq.Corelib.Numbers.BinNums.positive.rec (fun _ n => 2*n+1) (fun _ n => 2*n) 1
@[simp] theorem positiveTo_xI (p : RPositive) : positiveTo (.xI p) = 2*positiveTo p+1 := rfl
@[simp] theorem positiveTo_xO (p : RPositive) : positiveTo (.xO p) = 2*positiveTo p := rfl
@[simp] theorem positiveTo_xH : positiveTo .xH = 1 := rfl
theorem positiveTo_pos (p : RPositive) : 0 < positiveTo p := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec with
  | xI p ih => rw [positiveTo_xI]; omega
  | xO p ih => rw [positiveTo_xO]; omega
  | xH => exact Nat.zero_lt_one
def positiveOf (n : Nat) : RPositive :=
  if n < 2 then .xH
  else if n % 2 = 0 then .xO (positiveOf (n/2))
  else .xI (positiveOf (n/2))
termination_by n
decreasing_by all_goals omega
theorem positive_to_of (n : Nat) (hn : 0 < n) : positiveTo (positiveOf n) = n := by
  induction n using Nat.strongRecOn with
  | ind n ih =>
    rw [positiveOf]
    split
    · rw [positiveTo_xH]; omega
    · rename_i h
      have hdiv : 0 < n/2 := by omega
      have hlt : n/2 < n := by omega
      split
      · rw [positiveTo_xO, ih (n/2) hlt hdiv]; omega
      · rw [positiveTo_xI, ih (n/2) hlt hdiv]; omega
theorem positiveTo_injective (p q : RPositive) (h : positiveTo p = positiveTo q) : p = q := by
  induction p using Rocq.Corelib.Numbers.BinNums.positive.rec generalizing q with
  | xI p ih =>
    cases q with
    | xI q =>
      rw [positiveTo_xI, positiveTo_xI] at h
      exact congrArg Rocq.Corelib.Numbers.BinNums.positive.xI (ih q (by omega))
    | xO q => rw [positiveTo_xI, positiveTo_xO] at h; omega
    | xH => rw [positiveTo_xI, positiveTo_xH] at h; have := positiveTo_pos p; omega
  | xO p ih =>
    cases q with
    | xI q => rw [positiveTo_xO, positiveTo_xI] at h; omega
    | xO q =>
      rw [positiveTo_xO, positiveTo_xO] at h
      exact congrArg Rocq.Corelib.Numbers.BinNums.positive.xO (ih q (by omega))
    | xH => rw [positiveTo_xO, positiveTo_xH] at h; omega
  | xH =>
    cases q with
    | xI q => rw [positiveTo_xH, positiveTo_xI] at h; have := positiveTo_pos q; omega
    | xO q => rw [positiveTo_xH, positiveTo_xO] at h; omega
    | xH => rfl
@[simp] theorem positive_of_to (p : RPositive) : positiveOf (positiveTo p) = p :=
  positiveTo_injective _ _ (positive_to_of _ (positiveTo_pos p))
def positiveIso : Iso RPositive {n : Nat // 0 < n} where
  to p := ⟨positiveTo p, positiveTo_pos p⟩
  of n := positiveOf n.val
  of_to := positive_of_to
  to_of n := Subtype.ext (positive_to_of n.val n.property)

def binaryNatTo : RNatBinary → Nat :=
  Rocq.Corelib.Numbers.BinNums.N.rec 0 positiveTo
def binaryNatOf (n : Nat) : RNatBinary :=
  if n = 0 then .N0 else .Npos (positiveOf n)
@[simp] theorem binaryNat_to_of (n : Nat) : binaryNatTo (binaryNatOf n) = n := by
  unfold binaryNatOf; split
  · rename_i h; subst n; rfl
  · rename_i h; exact positive_to_of n (by omega)
@[simp] theorem binaryNat_of_to (n : RNatBinary) : binaryNatOf (binaryNatTo n) = n := by
  cases n with
  | N0 => rfl
  | Npos p =>
    change (if positiveTo p = 0 then _ else _) = _
    rw [if_neg (by have := positiveTo_pos p; omega)]
    exact congrArg Rocq.Corelib.Numbers.BinNums.N.Npos (positive_of_to p)
def binaryNatIso : Iso RNatBinary Nat := ⟨binaryNatTo, binaryNatOf, binaryNat_of_to, binaryNat_to_of⟩

def binaryIntTo : RIntBinary → Int :=
  Rocq.Corelib.Numbers.BinNums.Z.rec 0 (fun p => Int.ofNat (positiveTo p)) (fun p => -Int.ofNat (positiveTo p))
def binaryIntOf : Int → RIntBinary
  | .ofNat 0 => .Z0
  | .ofNat (n+1) => .Zpos (positiveOf (n+1))
  | .negSucc n => .Zneg (positiveOf (n+1))
@[simp] theorem binaryInt_to_of (n : Int) : binaryIntTo (binaryIntOf n) = n := by
  cases n with
  | ofNat n =>
    cases n with
    | zero => rfl
    | succ n =>
      change Int.ofNat (positiveTo (positiveOf (n+1))) = Int.ofNat (n+1)
      rw [positive_to_of _ (by omega)]
  | negSucc n =>
    change -Int.ofNat (positiveTo (positiveOf (n+1))) = Int.negSucc n
    rw [positive_to_of _ (by omega)]; rfl
@[simp] theorem binaryInt_of_to (n : RIntBinary) : binaryIntOf (binaryIntTo n) = n := by
  cases n with
  | Z0 => rfl
  | Zpos p =>
    change binaryIntOf (Int.ofNat (positiveTo p)) = _
    have hp := positiveTo_pos p
    generalize he : positiveTo p = k at *
    cases k with
    | zero => omega
    | succ k =>
      change Rocq.Corelib.Numbers.BinNums.Z.Zpos (positiveOf (k+1)) = _
      rw [← he, positive_of_to]
  | Zneg p =>
    change binaryIntOf (-Int.ofNat (positiveTo p)) = _
    have hp := positiveTo_pos p
    generalize he : positiveTo p = k at *
    cases k with
    | zero => omega
    | succ k =>
      change Rocq.Corelib.Numbers.BinNums.Z.Zneg (positiveOf (k+1)) = _
      rw [← he, positive_of_to]
def binaryIntIso : Iso RIntBinary Int := ⟨binaryIntTo, binaryIntOf, binaryInt_of_to, binaryInt_to_of⟩

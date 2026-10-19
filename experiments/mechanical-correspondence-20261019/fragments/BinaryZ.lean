abbrev RIntBinary := Rocq.Corelib.Numbers.BinNums.Z
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

abbrev RNatBinary := Rocq.Corelib.Numbers.BinNums.N
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


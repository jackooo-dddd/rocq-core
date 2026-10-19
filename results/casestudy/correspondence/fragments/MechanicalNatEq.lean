
theorem nat_eq_correspondence (a b : MN) :
    ME MN a b ↔ natTo a = natTo b := eq_across_iso natIso a b
theorem nat_native_add_comm (a b : MN) :
    ME MN (natOf (natTo a + natTo b)) (natOf (natTo b + natTo a)) :=
  eqOf (congrArg natOf (Nat.add_comm _ _))

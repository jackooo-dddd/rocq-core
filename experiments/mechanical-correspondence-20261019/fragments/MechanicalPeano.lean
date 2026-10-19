
theorem peano_le_of_native (n m : Nat) (h : n ≤ m) :
 Rocq.Corelib.Init.Peano.le (natOf n) (natOf m) := by
 induction h with
 | refl => exact .le_n _
 | step h ih => exact .le_S _ _ ih
@[simp] theorem peano_le_agrees (n m : MN) :
 Rocq.Corelib.Init.Peano.le n m ↔ natTo n ≤ natTo m := by
 constructor
 · intro h
   induction h using Rocq.Corelib.Init.Peano.le.rec with
   | le_n => exact Nat.le_refl _
   | le_S m h ih => exact Nat.le_trans ih (Nat.le_succ _)
 · intro h
   simpa only [natOf_to] using peano_le_of_native (natTo n) (natTo m) h
@[simp] theorem peano_lt_agrees (n m : MN) :
 Rocq.Corelib.Init.Peano.lt n m ↔ natTo n < natTo m := peano_le_agrees (.S n) m
@[simp] theorem peano_ge_agrees (n m : MN) :
 Rocq.Corelib.Init.Peano.ge n m ↔ natTo n ≥ natTo m := peano_le_agrees m n
@[simp] theorem peano_gt_agrees (n m : MN) :
 Rocq.Corelib.Init.Peano.gt n m ↔ natTo n > natTo m := peano_lt_agrees m n

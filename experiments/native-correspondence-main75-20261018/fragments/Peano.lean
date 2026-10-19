@[simp] theorem peano_le_agrees (n m : Nat) : Rocq.Corelib.Init.Peano.le n m ↔ n ≤ m := by
  constructor
  · intro h
    induction h using Rocq.Corelib.Init.Peano.le.rec with
    | le_n => exact Nat.le_refl n
    | le_S m h ih => exact Nat.le_trans ih (Nat.le_succ m)
  · intro h
    induction h with
    | refl => exact .le_n n
    | step h ih => exact .le_S n _ ih
@[simp] theorem peano_lt_agrees (n m : Nat) : Rocq.Corelib.Init.Peano.lt n m ↔ n < m := peano_le_agrees (n+1) m
@[simp] theorem peano_ge_agrees (n m : Nat) : Rocq.Corelib.Init.Peano.ge n m ↔ n ≥ m := peano_le_agrees m n
@[simp] theorem peano_gt_agrees (n m : Nat) : Rocq.Corelib.Init.Peano.gt n m ↔ n > m := peano_lt_agrees m n

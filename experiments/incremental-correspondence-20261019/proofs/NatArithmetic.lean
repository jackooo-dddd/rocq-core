import NatGcd
noncomputable section
namespace NativeBridge.Incremental.NatArithmetic
open NativeBridge

theorem divmod_bounded (x y q u : Nat) (hu : u ≤ y) :
    divmodTo x y q u =
      ((x + q * (y+1) + (y-u)) / (y+1),
        y - (x + q * (y+1) + (y-u)) % (y+1)) := by
  have h := divmod_invariant x y q u hu
  have hq : (x + q * (y+1) + (y-u)) / (y+1) = (divmodTo x y q u).1 := by
    apply Nat.div_eq_of_lt_le
    · omega
    · rw [Nat.succ_mul]
      omega
  have hr : (x + q * (y+1) + (y-u)) % (y+1) = y - (divmodTo x y q u).2 := by
    rw [Nat.mod_eq_sub_div_mul,hq]
    omega
  apply Prod.ext
  · exact hq.symm
  · rw [hr]; omega

theorem divmod_no_reset (x y q u : Nat) (h : x ≤ u) :
    divmodTo x y q u = (q,u-x) := by
  induction x generalizing u with
  | zero => rw [divmod_zero]; rfl
  | succ x ih =>
    cases u with
    | zero => omega
    | succ u =>
      rw [divmod_succ_succ,ih u (by omega)]
      congr 1 <;> omega

theorem divmod_after_reset (x y q u : Nat) :
    divmodTo (x+u+1) y q u = divmodTo x y (q+1) y := by
  induction u with
  | zero => exact divmod_succ_zero x y q
  | succ u ih =>
    change divmodTo ((x+u+1)+1) y q (u+1) = _
    rw [divmod_succ_succ,ih]

def divmodNative (x y q u : Nat) : Nat × Nat :=
  if x ≤ u then (q,u-x)
  else
    let t := x-(u+1)+(q+1)*(y+1)
    (t/(y+1),y-t%(y+1))

theorem divmod_full (x y q u : Nat) :
    divmodTo x y q u = divmodNative x y q u := by
  unfold divmodNative
  split
  · exact divmod_no_reset x y q u (by assumption)
  · have hx : x = (x-(u+1))+u+1 := by omega
    have he := divmod_after_reset (x-(u+1)) y q u
    rw [← hx] at he
    rw [he,divmod_bounded _ _ _ _ (Nat.le_refl y)]
    simp only [Nat.sub_self,Nat.add_zero]

theorem divmod_agrees (x y q u : MN) :
    Rocq.Corelib.Init.Datatypes.prod.rec (fun q r => (natTo q,natTo r))
      (Rocq.Corelib.Init.Nat.divmod x y q u) =
      divmodNative (natTo x) (natTo y) (natTo q) (natTo u) := by
  simpa only [divmodTo,natOf_to] using divmod_full (natTo x) (natTo y) (natTo q) (natTo u)

end NativeBridge.Incremental.NatArithmetic

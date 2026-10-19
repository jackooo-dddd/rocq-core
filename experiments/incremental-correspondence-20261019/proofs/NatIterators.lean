import NatArithmetic
import Init.Data.Nat.Sqrt.Lemmas
import Init.Data.Nat.Lemmas
noncomputable section
namespace NativeBridge.Incremental.NatIterators
open NativeBridge

def sqrtIter : Nat → Nat → Nat → Nat → Nat
  | 0,p,_,_ => p
  | k+1,p,q,0 => sqrtIter k (p+1) (q+2) (q+2)
  | k+1,p,q,r+1 => sqrtIter k p q r
def log2Iter : Nat → Nat → Nat → Nat → Nat
  | 0,p,_,_ => p
  | k+1,p,q,0 => log2Iter k (p+1) (q+1) q
  | k+1,p,q,r+1 => log2Iter k p (q+1) r

theorem sqrt_iter_agrees (k p q r : MN) :
    natTo (Rocq.Corelib.Init.Nat.sqrt_iter k p q r) =
      sqrtIter (natTo k) (natTo p) (natTo q) (natTo r) := by
  induction k generalizing p q r with
  | O => rfl
  | S k ih =>
    cases r with
    | O =>
      change natTo (Rocq.Corelib.Init.Nat.sqrt_iter k p.S q.S.S q.S.S) = _
      rw [ih]; rfl
    | S r =>
      change natTo (Rocq.Corelib.Init.Nat.sqrt_iter k p q r) = _
      rw [ih]; rfl

theorem log2_iter_agrees (k p q r : MN) :
    natTo (Rocq.Corelib.Init.Nat.log2_iter k p q r) =
      log2Iter (natTo k) (natTo p) (natTo q) (natTo r) := by
  induction k generalizing p q r with
  | O => rfl
  | S k ih =>
    cases r with
    | O =>
      change natTo (Rocq.Corelib.Init.Nat.log2_iter k p.S q.S q) = _
      rw [ih]; rfl
    | S r =>
      change natTo (Rocq.Corelib.Init.Nat.log2_iter k p q.S r) = _
      rw [ih]; rfl

theorem sqrt_unique (n p : Nat) (hl : p*p ≤ n) (hu : n < (p+1)*(p+1)) :
    p = Nat.sqrt n := by
  have hsl := Nat.sqrt_le n
  have hsu := Nat.lt_succ_sqrt n
  change n < (Nat.sqrt n+1)*(Nat.sqrt n+1) at hsu
  apply Nat.le_antisymm
  · by_cases hn : p ≤ Nat.sqrt n
    · exact hn
    have h : Nat.sqrt n + 1 ≤ p := by omega
    have hm := Nat.mul_le_mul h h
    omega
  · by_cases hn : Nat.sqrt n ≤ p
    · exact hn
    have h : p+1 ≤ Nat.sqrt n := by omega
    have hm := Nat.mul_le_mul h h
    omega

theorem sqrtIter_native (k p r : Nat) (hr : r ≤ 2*p) :
    sqrtIter k p (2*p) r = Nat.sqrt (k+p*p+2*p-r) := by
  induction k generalizing p r with
  | zero =>
    change p = Nat.sqrt (0+p*p+2*p-r)
    apply sqrt_unique
    · omega
    · simp only [Nat.add_mul,Nat.mul_add,Nat.one_mul,Nat.mul_one]
      omega
  | succ k ih =>
    cases r with
    | zero =>
      change sqrtIter k (p+1) (2*p+2) (2*p+2) = _
      have he : 2*p+2 = 2*(p+1) := by omega
      rw [he,ih (p+1) (2*(p+1)) (Nat.le_refl _)]
      congr 1
      simp only [Nat.add_mul,Nat.mul_add,Nat.one_mul,Nat.mul_one]
      omega
    | succ r =>
      change sqrtIter k p (2*p) r = _
      rw [ih p r (by omega)]
      congr 1
      omega

theorem log2Iter_native (k p q r : Nat)
    (hl : 2^p ≤ q) (hu : q+r+1 = 2^(p+1)) :
    log2Iter k p q r = Nat.log2 (k+q) := by
  induction k generalizing p q r with
  | zero =>
    change p = Nat.log2 (0+q)
    rw [Nat.zero_add]
    have hp : 0 < 2^p := Nat.pow_pos (by decide)
    exact ((Nat.log2_eq_iff (by omega)).mpr ⟨hl,by omega⟩).symm
  | succ k ih =>
    cases r with
    | zero =>
      change log2Iter k (p+1) (q+1) q = _
      have hnext : q+1+q+1 = 2^((p+1)+1) := by
        rw [Nat.pow_succ]
        omega
      rw [ih (p+1) (q+1) q (by omega) hnext]
      congr 1
      omega
    | succ r =>
      change log2Iter k p (q+1) r = _
      rw [ih p (q+1) r (by omega) (by omega)]
      congr 1
      omega

theorem sqrt_agrees (n : MN) :
    natTo (Rocq.Corelib.Init.Nat.sqrt n) = Nat.sqrt (natTo n) := by
  change natTo (Rocq.Corelib.Init.Nat.sqrt_iter n .O .O .O) = _
  rw [sqrt_iter_agrees]
  simpa only [natTo_zero,Nat.mul_zero,Nat.add_zero,Nat.sub_zero] using
    sqrtIter_native (natTo n) 0 0 (Nat.le_refl 0)

theorem log2_agrees (n : MN) :
    natTo (Rocq.Corelib.Init.Nat.log2 n) = Nat.log2 (natTo n) := by
  change natTo (Rocq.Corelib.Init.Nat.log2_iter (Rocq.Corelib.Init.Nat.pred n) .O (.S .O) .O) = _
  rw [log2_iter_agrees,nat_pred_agrees]
  change log2Iter (natTo n - 1) 0 1 0 = Nat.log2 (natTo n)
  by_cases hn : natTo n = 0
  · rw [hn]; rfl
  · rw [log2Iter_native _ 0 1 0 (by decide) (by decide)]
    congr 1
    omega

end NativeBridge.Incremental.NatIterators

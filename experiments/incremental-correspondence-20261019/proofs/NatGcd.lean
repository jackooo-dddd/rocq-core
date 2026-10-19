import NumericSigned
noncomputable section
namespace NativeBridge.Incremental.NatGcd
open NativeBridge

def step (y s : MN) : Prop :=
  ∃ (b a : MN) (_h : s = a.S), y = Rocq.Corelib.Init.Nat.modulo b a.S

theorem termination : Rocq.Corelib.Init.Nat.gcd__rocq2lean_termination_1.statement := by
  change ∀ s, Acc step s
  intro s
  have wf := (measure natTo).wf
  induction wf.apply s with
  | intro s hs ih =>
    apply Acc.intro
    intro y hy
    apply ih y
    rcases hy with ⟨b,a,h,rfl⟩
    cases h
    change natTo (Rocq.Corelib.Init.Nat.modulo b a.S) < natTo a.S
    rw [nat_modulo_agrees,natTo_succ]
    exact Nat.mod_lt _ (Nat.succ_pos _)

def gcdClosed (a b : MN) : MN :=
  @RocqPending.Corelib.Init.Nat.gcd termination a b

theorem gcd_zero (b : MN) : gcdClosed .O b = b := by
  unfold gcdClosed RocqPending.Corelib.Init.Nat.gcd
  cases termination .O
  rfl

theorem gcd_step (a b : MN) :
    gcdClosed a.S b = gcdClosed (Rocq.Corelib.Init.Nat.modulo b a.S) a.S := by
  unfold gcdClosed RocqPending.Corelib.Init.Nat.gcd
  cases termination a.S
  rfl

theorem gcd_agrees (a b : MN) :
    natTo (@RocqPending.Corelib.Init.Nat.gcd termination a b) = Nat.gcd (natTo a) (natTo b) := by
  change natTo (gcdClosed a b) = Nat.gcd (natTo a) (natTo b)
  revert b
  refine (measure natTo).wf.induction (C := fun a => ∀ b, natTo (gcdClosed a b) = Nat.gcd (natTo a) (natTo b)) a ?_
  intro a ih b
  cases a with
  | O => rw [gcd_zero,natTo_zero,Nat.gcd_zero_left]
  | S a =>
    rw [gcd_step]
    have hlt : natTo (Rocq.Corelib.Init.Nat.modulo b a.S) < natTo a.S := by
      rw [nat_modulo_agrees,natTo_succ]
      exact Nat.mod_lt _ (Nat.succ_pos _)
    rw [ih _ hlt _,nat_modulo_agrees]
    exact (Nat.gcd_rec (natTo a.S) (natTo b)).symm

end NativeBridge.Incremental.NatGcd

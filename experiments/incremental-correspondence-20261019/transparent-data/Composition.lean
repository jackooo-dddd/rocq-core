import Transparent_Existing_Iteration
import Consumer
set_option autoImplicit false
noncomputable section
namespace NativeBridge.ComputationalCorrespondence.Composition
open ComputationalRegression.Existing_Iteration.NativeBridge

/-- The input is the separately declared mechanical Nat, not Lean Nat. -/
def mechanicalCount (n : MN) : Nat :=
  ComputationalRegression.Existing_Iteration.Rocq.Corelib.Init.Nat.iter n Nat Nat.succ 0

theorem mechanicalCount_agrees (n : MN) : mechanicalCount n = natTo n := by
  unfold mechanicalCount
  rw [ComputationalRegression.Existing_Iteration.NativeBridge.Incremental.nat_iter_agrees]
  induction natTo n with
  | zero => rfl
  | succ k ih => exact congrArg Nat.succ ih

/-- Connect two independent mechanical profiles through their native interfaces. -/
def selectedPrime (n : MN) : Nat :=
  Consumer.mechanicalPrimeSelection.val (mechanicalCount n)

theorem selectedPrime_agrees (n : MN) :
    selectedPrime n = if natTo n % 2 = 0 then 2 else 0 := by
  unfold selectedPrime
  rw [Consumer.mechanicalPrimeSelection_value, mechanicalCount_agrees]

theorem selectedPrime_prime (n : MN) (h : natTo n % 2 = 0) : Nat.Prime (selectedPrime n) := by
  apply Consumer.mechanicalPrimeSelection.property
  simp [Consumer.primeCondition, mechanicalCount_agrees, h]

/-- A Mathlib theorem applies after composing the two correspondence proofs. -/
theorem selectedPrime_bound (n : MN) (h : natTo n % 2 = 0) : 2 ≤ selectedPrime n :=
  (selectedPrime_prime n h).two_le

end NativeBridge.ComputationalCorrespondence.Composition

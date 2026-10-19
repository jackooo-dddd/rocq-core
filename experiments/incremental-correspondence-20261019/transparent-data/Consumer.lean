import ProgramWf
import SSRBool
import Mathlib.Data.Nat.Prime.Basic
set_option autoImplicit false
noncomputable section
namespace NativeBridge.ComputationalCorrespondence.Consumer

def countdownStep (n : Nat) (rec : (y : {y : Nat // y < n}) → Nat) : Nat :=
  match n with
  | 0 => 0
  | k+1 => rec ⟨k,Nat.lt_succ_self k⟩ + 1

theorem countdownValue (n : Nat) :
    ProgramWf.nativeValue (· < ·) Nat.lt_wfRel.wf (fun _ => Nat) countdownStep n = n := by
  induction n with
  | zero =>
    unfold ProgramWf.nativeValue
    rw [WellFounded.fix_eq]
    rfl
  | succ n ih =>
    unfold ProgramWf.nativeValue
    rw [WellFounded.fix_eq]
    change ProgramWf.nativeValue (· < ·) Nat.lt_wfRel.wf (fun _ => Nat) countdownStep n + 1 = n+1
    rw [ih]

def finiteWitness (n : Nat)
    (_ih : (y : Nat) → y < n → Fin (ProgramWf.nativeValue (· < ·) Nat.lt_wfRel.wf (fun _ => Nat) countdownStep y + 1)) :
    Fin (ProgramWf.nativeValue (· < ·) Nat.lt_wfRel.wf (fun _ => Nat) countdownStep n + 1) :=
  ⟨_,Nat.lt_succ_self _⟩

/-- A Type-valued result whose Fin bound depends on the mechanical recursive result. -/
def mechanicalFiniteWitness (n : Nat) :
    Fin (ProgramWf.nativeValue (· < ·) Nat.lt_wfRel.wf (fun _ => Nat) countdownStep n + 1) :=
  cast (congrArg (fun k : Nat => Fin (k+1))
    (ProgramWf.value_agrees (· < ·) (Computational.ProgramWf.NativeBridge.Incremental.ProgramWellFounded.wellFoundedOf Nat.lt_wfRel.wf) (fun _ => Nat) countdownStep n))
    (@Computational.ProgramWf.RocqPending.Corelib.Program.Wf.Fix_F_sub_rect.{0,0,0}
      Computational.ProgramWf.NativeBridge.Incremental.ProgramWellFounded.proj2_witness Computational.ProgramWf.NativeBridge.Incremental.ProgramWellFounded.unfold_witness Computational.ProgramWf.NativeBridge.Incremental.ProgramWellFounded.f_unfold_proof ProgramWf.reverseProof
      Nat (fun _ => Nat) (· < ·) (Computational.ProgramWf.NativeBridge.Incremental.ProgramWellFounded.wellFoundedOf Nat.lt_wfRel.wf)
      (Computational.ProgramWf.NativeBridge.Incremental.ProgramWellFounded.sourceStep (· < ·) (fun _ => Nat) countdownStep) (fun _ k => Fin (k+1))
      (ProgramWf.fromInvariant (· < ·) (Computational.ProgramWf.NativeBridge.Incremental.ProgramWellFounded.wellFoundedOf Nat.lt_wfRel.wf) (fun _ => Nat) countdownStep
        (fun _ k => Fin (k+1)) finiteWitness) n (Computational.ProgramWf.NativeBridge.Incremental.ProgramWellFounded.accOf (Nat.lt_wfRel.wf.apply n)))

theorem mechanicalFiniteWitness_value (n : Nat) : (mechanicalFiniteWitness n).val = n := by
  have h : mechanicalFiniteWitness n =
      ProgramWf.nativeRect (· < ·) Nat.lt_wfRel.wf (fun _ => Nat) countdownStep
        (fun _ k => Fin (k+1)) finiteWitness n :=
    ProgramWf.fixFRect_agrees (· < ·)
      (Computational.ProgramWf.NativeBridge.Incremental.ProgramWellFounded.wellFoundedOf Nat.lt_wfRel.wf)
      (fun _ => Nat) countdownStep (fun _ k => Fin (k+1)) finiteWitness n
      (Computational.ProgramWf.NativeBridge.Incremental.ProgramWellFounded.accOf (Nat.lt_wfRel.wf.apply n))
  rw [h]
  unfold ProgramWf.nativeRect
  rw [WellFounded.fix_eq]
  exact countdownValue n

/-- Feed the transported data to the native Fin API. -/
theorem mechanicalFiniteWitness_in_range (n : Nat) : (mechanicalFiniteWitness n).val < n+1 := by
  rw [mechanicalFiniteWitness_value]
  exact Nat.lt_succ_self n

def primeCondition (n : Nat) : Bool := decide (n % 2 = 0)
def primeProvided (n : Nat) (_ : primeCondition n = true) : {p : Nat // Nat.Prime p} :=
  ⟨2,by decide⟩

def mechanicalPrimeSelection :
    {g : Nat → Nat // ∀ n, primeCondition n = true → Nat.Prime (g n)} :=
  (SSRBool.conditionalSigIso Nat (fun _ => Nat) primeCondition (fun _ p => Nat.Prime p)).to
    (@Computational.SSRBool.RocqPending.Corelib.ssr.ssrbool.all_sig_cond_dep.{0,0}
      SSRBool.tagSigProof SSRBool.tagProof1 SSRBool.tagProof2 Nat (fun _ => Nat)
      (Computational.SSRBool.NativeBridge.Incremental.SSRBoolData.predOf primeCondition) (fun _ p => Nat.Prime p) (fun _ => 0)
      (fun n h => (Computational.SSRBool.NativeBridge.sigIso _ _).of
        (primeProvided n (SSRBool.truthTo (primeCondition n) h))))

theorem mechanicalPrimeSelection_agrees :
    mechanicalPrimeSelection =
      SSRBool.allSigCondDep Nat (fun _ => Nat) primeCondition (fun _ p => Nat.Prime p)
        (fun _ => 0) primeProvided :=
  SSRBool.allSigCondDep_agrees _ _ _ _ _ _

theorem mechanicalPrimeSelection_value (n : Nat) :
    mechanicalPrimeSelection.val n = if n % 2 = 0 then 2 else 0 := by
  rw [mechanicalPrimeSelection_agrees]
  simp only [SSRBool.allSigCondDep, SSRBool.chooseValue, primeCondition, primeProvided]
  by_cases h : n % 2 = 0 <;> simp [h]

/-- Mathlib's existing Prime.two_le consumes the transported mechanical witness. -/
theorem mechanicalPrimeSelection_bound (n : Nat) (h : primeCondition n = true) :
    2 ≤ mechanicalPrimeSelection.val n :=
  (mechanicalPrimeSelection.property n h).two_le

#print axioms mechanicalFiniteWitness_value
#print axioms mechanicalPrimeSelection_agrees
#print axioms mechanicalPrimeSelection_value
#print axioms mechanicalPrimeSelection_bound
end NativeBridge.ComputationalCorrespondence.Consumer

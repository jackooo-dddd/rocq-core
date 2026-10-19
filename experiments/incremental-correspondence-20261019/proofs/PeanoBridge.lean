import Auto_Init_Peano
noncomputable section
namespace NativeBridge.Incremental.PeanoBridge
open NativeBridge
universe u

theorem pred_agrees (n : MN) :
    natTo (Rocq.Corelib.Init.Nat.pred n) = natTo n - 1 := by
  cases n <;> rfl
theorem add_agrees (n m : MN) :
    natTo (Rocq.Corelib.Init.Nat.add n m) = natTo n + natTo m := by
  induction n with
  | O => exact (Nat.zero_add _).symm
  | S n ih => change natTo (Rocq.Corelib.Init.Nat.add n m)+1 = (natTo n+1)+natTo m; rw [ih]; omega

theorem mul_agrees (n m : MN) :
    natTo (Rocq.Corelib.Init.Nat.mul n m) = natTo n * natTo m := by
  induction n with
  | O => exact (Nat.zero_mul _).symm
  | S n ih =>
    change natTo (Rocq.Corelib.Init.Nat.add m (Rocq.Corelib.Init.Nat.mul n m)) = (natTo n+1)*natTo m
    rw [add_agrees,ih,Nat.succ_mul,Nat.add_comm]
theorem min_agrees (n m : MN) :
    natTo (Rocq.Corelib.Init.Nat.min n m) = min (natTo n) (natTo m) := by
  induction n generalizing m with
  | O => cases m <;> rfl
  | S n ih => cases m with
    | O => rfl
    | S m =>
      change natTo (Rocq.Corelib.Init.Nat.min n m)+1 = min (natTo n+1) (natTo m+1)
      rw [ih]; omega
theorem max_agrees (n m : MN) :
    natTo (Rocq.Corelib.Init.Nat.max n m) = max (natTo n) (natTo m) := by
  induction n generalizing m with
  | O => cases m <;> rfl
  | S n ih => cases m with
    | O => rfl
    | S m =>
      change natTo (Rocq.Corelib.Init.Nat.max n m)+1 = max (natTo n+1) (natTo m+1)
      rw [ih]; omega

theorem iteration_agrees {A : Sort u} (f : A → A) (x : A) (n : MN) :
    Rocq.Corelib.Init.Datatypes.nat_rect (fun _ => A) x (fun _ => f) n =
      Nat.rec x (fun _ => f) (natTo n) := by
  induction n with
  | O => rfl
  | S n ih => change f (Rocq.Corelib.Init.Datatypes.nat_rect (fun _ => A) x (fun _ => f) n) = f _
              exact congrArg f ih

theorem isSucc_agrees (n : MN) : Rocq.Corelib.Init.Peano.IsSucc n ↔ 0 < natTo n := by
  cases n with
  | O =>
    constructor
    · intro h; cases h
    · intro h; rw [natTo_zero] at h; omega
  | S n => exact ⟨fun _ => Nat.succ_pos _,fun _ => .I⟩

end NativeBridge.Incremental.PeanoBridge

import Nat
set_option autoImplicit false
namespace NativeBridge.Incremental
universe u v
theorem nat_iter_agrees {A : Sort u} (f : A → A) (x : A) (n : MN) :
 Rocq.Corelib.Init.Nat.iter n A f x =
 Nat.rec (motive := fun _ => A) x (fun _ a => f a) (natTo n) := by
 induction n with
 | O => rfl
 | S n ih =>
  change f (Rocq.Corelib.Init.Nat.iter n A f x) =
   f (Nat.rec (motive := fun _ => A) x (fun _ a => f a) (natTo n))
  rw [ih]

theorem nat_iter_transport {A : Sort u} {B : Sort v} (e : Iso A B)
 (f : A → A) (g : B → B) (h : ∀ a, e.to (f a) = g (e.to a)) (x : A) (n : MN) :
 e.to (Rocq.Corelib.Init.Nat.iter n A f x) =
 Nat.rec (motive := fun _ => B) (e.to x) (fun _ b => g b) (natTo n) := by
 induction n with
 | O => rfl
 | S n ih =>
  change e.to (f (Rocq.Corelib.Init.Nat.iter n A f x)) = g _
  rw [h, ih]
  rfl
end NativeBridge.Incremental

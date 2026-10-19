
abbrev MN := Rocq.Corelib.Init.Datatypes.nat
def natTo : MN → Nat := fun n =>
  Rocq.Corelib.Init.Datatypes.nat.rec (motive := fun _ => Nat) 0 (fun _ r => Nat.succ r) n
def natOf : Nat → MN
  | 0 => .O
  | n+1 => .S (natOf n)
@[simp] theorem natTo_zero : natTo Rocq.Corelib.Init.Datatypes.nat.O = 0 := rfl
@[simp] theorem natTo_succ (n : MN) : natTo (Rocq.Corelib.Init.Datatypes.nat.S n) = Nat.succ (natTo n) := rfl
@[simp] theorem natOf_zero : natOf 0 = Rocq.Corelib.Init.Datatypes.nat.O := rfl
@[simp] theorem natOf_succ (n : Nat) : natOf (Nat.succ n) = Rocq.Corelib.Init.Datatypes.nat.S (natOf n) := rfl
@[simp] theorem natOf_to (n : MN) : natOf (natTo n) = n := by
  induction n with
  | O => rfl
  | S n ih => change Rocq.Corelib.Init.Datatypes.nat.S (natOf (natTo n)) = Rocq.Corelib.Init.Datatypes.nat.S n; rw [ih]
@[simp] theorem natTo_of (n : Nat) : natTo (natOf n) = n := by
  induction n with
  | zero => rfl
  | succ n ih => change Nat.succ (natTo (natOf n)) = Nat.succ n; rw [ih]
def natIso : Iso MN Nat := ⟨natTo,natOf,natOf_to,natTo_of⟩
theorem nat_equality_iff (x y : MN) : natTo x = natTo y ↔ x = y := natIso.eq_iff x y
theorem nat_rec_agrees {A : Sort u} (z : A) (s : Nat → A → A) (n : MN) :
  Rocq.Corelib.Init.Datatypes.nat.rec (motive := fun _ => A) z (fun k r => s (natTo k) r) n =
    Nat.rec z s (natTo n) := by
  induction n with
  | O => rfl
  | S n ih => change s (natTo n) _ = s (natTo n) _; rw [ih]; rfl

theorem nat_forall_correspondence (P : MN → Prop) :
 (∀ n, P n) ↔ ∀ n : Nat, P (natOf n) := by
 constructor
 · intro h n; exact h (natOf n)
 · intro h n; simpa only [natOf_to] using h (natTo n)
theorem nat_exists_correspondence (P : MN → Prop) :
 (∃ n, P n) ↔ ∃ n : Nat, P (natOf n) := by
 constructor
 · rintro ⟨n,h⟩; exact ⟨natTo n, by simpa only [natOf_to] using h⟩
 · rintro ⟨n,h⟩; exact ⟨natOf n,h⟩
theorem nat_eq_native (a b : MN) : (a=b) ↔ natTo a = natTo b := (nat_equality_iff a b).symm
theorem nat_dependent_rec_agrees {P : Nat → Sort u} (z : P 0)
    (s : ∀ n, P n → P (n+1)) (n : MN) :
 Rocq.Corelib.Init.Datatypes.nat.rec (motive := fun n => P (natTo n)) z (fun k r => s (natTo k) r) n =
 Nat.rec z s (natTo n) := by
 induction n with
 | O => rfl
 | S n ih => change s (natTo n) _ = s (natTo n) _; rw [ih]; rfl

theorem nat_family_forall {A : Sort u} (F : (MN → A) → Prop) :
 (∀ f, F f) ↔ ∀ f : Nat → A, F (fun n => f (natTo n)) := by
 constructor
 · intro h f; exact h _
 · intro h f
   simpa only [natOf_to] using h (fun n => f (natOf n))
theorem nat_binary_family_forall {A : Sort u} (F : (MN → MN → A) → Prop) :
 (∀ f, F f) ↔ ∀ f : Nat → Nat → A, F (fun n m => f (natTo n) (natTo m)) := by
 constructor
 · intro h f; exact h _
 · intro h f
   simpa only [natOf_to] using h (fun n m => f (natOf n) (natOf m))

theorem nat_inner_family_forall {A : Sort u} {B : Sort v} (F : (A → MN → B) → Prop) :
 (∀ f, F f) ↔ ∀ f : A → Nat → B, F (fun a n => f a (natTo n)) := by
 constructor
 · intro h f; exact h _
 · intro h f
   simpa only [natOf_to] using h (fun a n => f a (natOf n))


theorem source_nat_rect_agrees {P : Nat → Type u} (z : P 0)
 (s : ∀ n, P n → P (n+1)) (n : MN) :
 Rocq.Corelib.Init.Datatypes.nat_rect (fun n => P (natTo n)) z (fun k r => s (natTo k) r) n =
 Nat.rec z s (natTo n) := nat_dependent_rec_agrees z s n
theorem source_nat_rec_agrees {P : Nat → Type} (z : P 0)
 (s : ∀ n, P n → P (n+1)) (n : MN) :
 Rocq.Corelib.Init.Datatypes.nat_rec (fun n => P (natTo n)) z (fun k r => s (natTo k) r) n =
 Nat.rec z s (natTo n) := nat_dependent_rec_agrees z s n

import Rocq2LeanOut
universe u v
theorem erefl (A : Type u) (R : A → A → Prop)
 (e : Rocq.Corelib.Classes.RelationClasses.Equivalence A R) : ∀ x, R x x :=
 Rocq.Corelib.Classes.RelationClasses.Equivalence.rec (motive := fun _ => ∀ x, R x x) (fun h _ _ => h) e
theorem esymm (A : Type u) (R : A → A → Prop)
 (e : Rocq.Corelib.Classes.RelationClasses.Equivalence A R) : ∀ x y, R x y → R y x :=
 Rocq.Corelib.Classes.RelationClasses.Equivalence.rec (motive := fun _ => ∀ x y, R x y → R y x) (fun _ h _ => h) e
theorem etrans (A : Type u) (R : A → A → Prop)
 (e : Rocq.Corelib.Classes.RelationClasses.Equivalence A R) : ∀ x y z, R x y → R y z → R x z :=
 Rocq.Corelib.Classes.RelationClasses.Equivalence.rec (motive := fun _ => ∀ x y z, R x y → R y z → R x z) (fun _ _ h => h) e
theorem respecting_refl : Rocq.Corelib.Classes.Equivalence.respecting_equiv_obligation_1.statement.{u,v} := by
 intro A R eqa B S eqb f
 induction f using Rocq.Corelib.Init.Specif.sig.rec with
 | exist f hf => exact hf
theorem respecting_symm : Rocq.Corelib.Classes.Equivalence.respecting_equiv_obligation_2.statement.{u,v} := by
 intro A R eqa B S eqb f g h x y hr
 exact esymm B S eqb _ _
  (h y x (esymm A R eqa x y hr))
theorem respecting_trans : Rocq.Corelib.Classes.Equivalence.respecting_equiv_obligation_3.statement.{u,v} := by
 intro A R eqa B S eqb f g h fg gh x y hr
 exact etrans B S eqb _ _ _
  (fg x y hr) (gh y y (erefl A R eqa y))
theorem respecting_equivalence : Rocq.Corelib.Classes.Equivalence.respecting_equiv.statement.{u,v} := by
 intro A R eqa B S eqb
 constructor
 · exact respecting_refl A R eqa B S eqb
 · exact respecting_symm A R eqa B S eqb
 · exact respecting_trans A R eqa B S eqb
#print axioms respecting_refl
#print axioms respecting_symm
#print axioms respecting_trans
#print axioms respecting_equivalence

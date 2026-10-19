import Rocq2LeanOut
universe u v
theorem fwd {P Q : Prop} (h : Rocq.Corelib.Init.Logic.iff P Q) : P → Q :=
 Rocq.Corelib.Init.Logic.and.rec (motive := fun _ => P → Q) (fun f _ => f) h
theorem bwd {P Q : Prop} (h : Rocq.Corelib.Init.Logic.iff P Q) : Q → P :=
 Rocq.Corelib.Init.Logic.and.rec (motive := fun _ => Q → P) (fun _ f => f) h
theorem transfer_acc (A : Type u) (R S : A → A → Prop)
 (h : ∀ x y, S x y → R x y) {x : A} (ac : Rocq.Corelib.Init.Wf.Acc A R x) :
 Rocq.Corelib.Init.Wf.Acc A S x := by
 apply Rocq.Corelib.Init.Wf.Acc.rec (motive := fun x _ => Rocq.Corelib.Init.Wf.Acc A S x) ?_ ac
 intro x children ih
 constructor
 intro y hy
 exact ih y (h y x hy)
theorem acc_morphism : Rocq.Corelib.Classes.Morphisms_Prop.Acc_rel_morphism.statement.{u} := by
 intro A R S h x y e
 cases e
 constructor
 · exact transfer_acc A R S (fun x y => bwd (h x y))
 · exact transfer_acc A S R (fun x y => fwd (h x y))
theorem wf_morphism : Rocq.Corelib.Classes.Morphisms_Prop.well_founded_morphism.statement.{u} := by
 intro A R S h
 constructor
 · intro wf x
   exact transfer_acc A R S (fun x y => bwd (h x y)) (wf x)
 · intro wf x
   exact transfer_acc A S R (fun x y => fwd (h x y)) (wf x)
#print axioms transfer_acc
#print axioms acc_morphism
#print axioms wf_morphism

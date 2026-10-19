import Rocq2LeanOut
universe u v
theorem fwd {P Q : Prop} (h : Rocq.Corelib.Init.Logic.iff P Q) : P → Q :=
 Rocq.Corelib.Init.Logic.and.rec (motive := fun _ => P → Q) (fun f _ => f) h
theorem bwd {P Q : Prop} (h : Rocq.Corelib.Init.Logic.iff P Q) : Q → P :=
 Rocq.Corelib.Init.Logic.and.rec (motive := fun _ => Q → P) (fun _ f => f) h
theorem arrow_flip : Rocq.Corelib.Classes.Morphisms.flip_arrow.statement.{u,v} := by
 intro A B R S NA R' S' NB f g
 constructor
 · intro h x y r
   exact fwd (NB (f y) (g x)) (h y x (bwd (NA y x) r))
 · intro h x y r
   exact bwd (NB (f x) (g y)) (h y x (fwd (NA x y) r))
theorem forall_flip : Rocq.Corelib.Classes.Morphisms.flip_forall.statement.{u,v} := by
 intro A B R S N f g
 constructor
 · intro h a
   exact fwd (N a (f a) (g a)) (h a)
 · intro h a
   exact bwd (N a (f a) (g a)) (h a)
theorem proper_proper : Rocq.Corelib.Classes.Morphisms.proper_proper.statement.{u} := by
 intro A R S h x y e
 cases e
 exact h x x
#print axioms arrow_flip
#print axioms forall_flip
#print axioms proper_proper

import Rocq2LeanOut
universe u
namespace OrderClients
theorem fst {P Q : Prop} (h : Rocq.Corelib.Init.Logic.and P Q) : P :=
 Rocq.Corelib.Init.Logic.and.rec (motive := fun _ => P) (fun a _ => a) h
theorem snd {P Q : Prop} (h : Rocq.Corelib.Init.Logic.and P Q) : Q :=
 Rocq.Corelib.Init.Logic.and.rec (motive := fun _ => Q) (fun _ b => b) h
theorem partial_proper : Rocq.Corelib.Classes.Morphisms.PartialOrder_proper.statement.{u} := by
 intro A E equ R pre po x y exy z w ezw
 apply Rocq.Corelib.Classes.RelationClasses.PreOrder.rec (motive := fun _ => Rocq.Corelib.Init.Logic.and (R x z → R y w) (R y w → R x z)) _ pre
 intro _ tr
 constructor
 · intro h
   exact tr y z w (tr y x z (snd (fst (po x y) exy)) h) (fst (fst (po z w) ezw))
 · intro h
   exact tr x w z (tr x y w (fst (fst (po x y) exy)) h) (snd (fst (po z w) ezw))
theorem strict_preorder : Rocq.Corelib.Classes.Morphisms.StrictOrder_PreOrder.statement.{u} := by
 intro A E equ R strict proper
 apply Rocq.Corelib.Classes.RelationClasses.Equivalence.rec (motive := fun _ => Rocq.Corelib.Classes.RelationClasses.PreOrder A (fun x y => Rocq.Corelib.Init.Logic.or (R x y) (E x y))) _ equ
 intro er _ et
 apply Rocq.Corelib.Classes.RelationClasses.StrictOrder.rec (motive := fun _ => Rocq.Corelib.Classes.RelationClasses.PreOrder A (fun x y => Rocq.Corelib.Init.Logic.or (R x y) (E x y))) _ strict
 intro _ rt
 constructor
 · intro x
   exact Rocq.Corelib.Init.Logic.or.or_intror _ _ (er x)
 · intro x y z h k
   apply Rocq.Corelib.Init.Logic.or.rec (motive := fun _ => Rocq.Corelib.Init.Logic.or (R x z) (E x z)) _ _ h
   · intro r
     apply Rocq.Corelib.Init.Logic.or.rec (motive := fun _ => Rocq.Corelib.Init.Logic.or (R x z) (E x z)) _ _ k
     · intro s
       exact Rocq.Corelib.Init.Logic.or.or_introl _ _ (rt x y z r s)
     · intro e
       exact Rocq.Corelib.Init.Logic.or.or_introl _ _ (fst (proper x x (er x) y z e) r)
   · intro e
     apply Rocq.Corelib.Init.Logic.or.rec (motive := fun _ => Rocq.Corelib.Init.Logic.or (R x z) (E x z)) _ _ k
     · intro s
       exact Rocq.Corelib.Init.Logic.or.or_introl _ _ (snd (proper x y e z z (er z)) s)
     · intro f
       exact Rocq.Corelib.Init.Logic.or.or_intror _ _ (et x y z e f)
theorem strict_partial : Rocq.Corelib.Classes.Morphisms.StrictOrder_PartialOrder.statement.{u} := by
 intro A E equ R strict _ x y
 apply Rocq.Corelib.Classes.RelationClasses.Equivalence.rec (motive := fun _ => Rocq.Corelib.Init.Logic.iff (E x y) (Rocq.Corelib.Init.Logic.and (Rocq.Corelib.Init.Logic.or (R x y) (E x y)) (Rocq.Corelib.Init.Logic.or (R y x) (E y x)))) _ equ
 intro _ es _
 apply Rocq.Corelib.Classes.RelationClasses.StrictOrder.rec (motive := fun _ => Rocq.Corelib.Init.Logic.iff (E x y) (Rocq.Corelib.Init.Logic.and (Rocq.Corelib.Init.Logic.or (R x y) (E x y)) (Rocq.Corelib.Init.Logic.or (R y x) (E y x)))) _ strict
 intro ir rt
 constructor
 · intro e
   exact Rocq.Corelib.Init.Logic.and.conj _ _ (Rocq.Corelib.Init.Logic.or.or_intror _ _ e) (Rocq.Corelib.Init.Logic.or.or_intror _ _ (es x y e))
 · intro h
   apply Rocq.Corelib.Init.Logic.or.rec (motive := fun _ => E x y) _ _ (fst h)
   · intro r
     apply Rocq.Corelib.Init.Logic.or.rec (motive := fun _ => E x y) _ _ (snd h)
     · intro s
       exact Rocq.Corelib.Init.Logic.False.rec (motive := fun _ => E x y) (ir x (rt x y x r s))
     · intro e
       exact es y x e
   · intro e
     exact e
#print axioms partial_proper
#print axioms strict_preorder
#print axioms strict_partial
end OrderClients

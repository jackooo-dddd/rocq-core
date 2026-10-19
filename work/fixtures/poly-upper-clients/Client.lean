import Rocq2LeanOut
universe u a b v
noncomputable section
def relations_equiv (A : Type u) :=
 Rocq.Corelib.Classes.CRelationClasses.relation_equivalence_equivalence.{u,a,b,v} A
def reflexive_map (A : Type u) (R : A → A → Type v) (x y : A) (h : R x y) : R x y :=
 let e := relations_equiv.{u,a,b,v} A
 let r := Rocq.Corelib.Classes.CRelationClasses.Equivalence_Reflexive _ _ e (PULift.up R)
 Rocq.Corelib.Init.Datatypes.prod.rec (motive := fun _ => R x y) (fun f _ => f h) (r.down x y)
#print axioms relations_equiv
#print axioms reflexive_map
#print axioms Rocq.Corelib.Classes.CRelationClasses.relation_equivalence_equivalence

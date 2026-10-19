import Rocq2LeanOut
universe u v w
theorem flip_one : Rocq.Corelib.Classes.Morphisms.proper_sym_flip.statement.{u,v} :=
 fun _ _ s _ _ _ h x y r => h y x (s x y r)
theorem flip_two : Rocq.Corelib.Classes.Morphisms.proper_sym_flip_2.statement.{u,v,w} :=
 fun _ _ s _ _ t _ _ _ h x y r a b q => h y x (s x y r) b a (t a b q)
theorem implication_iff : Rocq.Corelib.Classes.Morphisms.proper_sym_impl_iff_2.statement.{u,v} := by
 intro A R s B S t f h x y r a b q
 constructor
 · exact h x y r a b q
 · exact h y x (s x y r) b a (t a b q)
theorem rewrite_eq_domain : Rocq.Corelib.Classes.Morphisms.rewrite_relation_eq_dom.statement.{u,v} := by
 intro A B R h
 constructor
#print axioms flip_one
#print axioms flip_two
#print axioms implication_iff
#print axioms rewrite_eq_domain

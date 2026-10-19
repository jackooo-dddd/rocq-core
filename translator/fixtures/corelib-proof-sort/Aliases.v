(* Cumulativity permits a propositional body behind a Type-valued alias. *)
Set Universe Polymorphism.
Definition prop_alias (P : Prop) : Type := P.
Definition alias_proof : prop_alias True := I.
Definition alias_function (P : Prop) (p : P) : prop_alias P := p.
Definition ordinary_data : nat := O.
(* Retain the independent polymorphic-cumulativity limitation explicitly. *)
Definition ordinary_type : Type := nat.

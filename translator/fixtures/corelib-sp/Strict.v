(* Synthetic data definitions testing strict proof irrelevance; no corpus proofs. *)
Definition strict_domain (A : SProp) := A.
Definition strict_index (A : SProp) (a b : A) (P : A -> Type) (x : P a) : P b := x.
Definition strict_function (A : SProp) (a b : A) (P : A -> Type) : P a -> P b := fun x => x.
Definition strict_quantifier (A : SProp) := forall a : A, False.
Inductive strict_unit : SProp := strict_tt.
Definition strict_unit_index (a : strict_unit) (P : strict_unit -> Type)
  (x : P strict_tt) : P a := x.
Definition data_identity (x : nat) : nat := x.

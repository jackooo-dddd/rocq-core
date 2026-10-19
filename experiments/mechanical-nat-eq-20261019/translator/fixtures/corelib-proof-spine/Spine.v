(* Local hypotheses are inputs; applying them does not import a proof body. *)
Definition local_index (P : nat -> Prop) (h : forall n, P n) (n : nat)
  : { x : nat | P x } := exist P n (h n).

(* A constructed proof still becomes an explicit prerequisite. *)
Definition built_index (n : nat) : { x : nat | x = n } :=
  exist (fun x => x = n) n (eq_refl n).

(* Only the constructed argument is extracted, preserving the local application. *)
Definition nested_index (P : nat -> Prop)
  (h : forall n, True -> P n) (n : nat) : { x : nat | P x } :=
  exist P n (h n I).

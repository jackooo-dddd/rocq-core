From Corelib Require Import Init.Wf.
Inductive ProofBox (P : Prop) : Prop := proof_box : P -> ProofBox P.
Definition box_projection (P : Prop) (b : ProofBox P) : P :=
  match b with proof_box _ p => p end.
Definition kept_inline (P : Prop) (b : ProofBox P) : {u : unit | P} :=
  exist _ tt (match b with proof_box _ p => p end).
Definition kept_reference (P : Prop) (b : ProofBox P) : {u : unit | P} :=
  exist _ tt (box_projection P b).
Definition extracted_outer (P : Prop) (b : ProofBox P) (p : P) : {u : unit | P} :=
  exist _ tt (match b with proof_box _ _ => p end).
Definition extracted_branches (P : Prop) (b : P \/ P) : {u : unit | P} :=
  exist _ tt (match b with or_introl p => p | or_intror p => p end).
Definition extracted_lambda (P : Prop) (p : P) : {u : unit | P} :=
  exist _ tt ((fun q : P => q) p).
Lemma opaque_projection (P : Prop) (b : ProofBox P) : P.
Proof. destruct b; assumption. Qed.
Definition extracted_opaque (P : Prop) (b : ProofBox P) : {u : unit | P} :=
  exist _ tt (opaque_projection P b).

Section Recursion.
Variable A : Type.
Variable R : A -> A -> Prop.
Variable F : forall x, (forall y, R y x -> nat) -> nat.
Fixpoint counted (x : A) (a : Acc R x) {struct a} : nat :=
  F x (fun y h => counted y (Acc_inv a h)).
Lemma counted_conversion (x : A) (a : Acc R x) :
  counted x a = @Fix_F A R (fun _ => nat) F x a.
Proof. reflexivity. Qed.
End Recursion.
Print Assumptions counted_conversion.

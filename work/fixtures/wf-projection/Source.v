From Corelib Require Import Init.Wf.
Section Projection.
Variable A : Type.
Variable R : A -> A -> Prop.
Variable P : A -> Type.
Variable F : forall x, (forall y, R y x -> P y) -> P x.
Fixpoint projected_fix (x : A) (a : Acc R x) {struct a} : P x :=
  F x (fun y h => projected_fix y
    ((match a with Acc_intro _ step => step end) y h)).
Lemma projection_conversion (x : A) (a : Acc R x) :
  projected_fix x a = @Fix_F A R P F x a.
Proof. reflexivity. Qed.
End Projection.
Print Assumptions projection_conversion.

From Corelib Require Import Init.Wf.
Section Pair.
Variables A B : Type.
Variable R : A * B -> A * B -> Prop.
Variable P : A -> B -> Type.
Variable F : forall x y, (forall u v, R (u,v) (x,y) -> P u v) -> P x y.
Fixpoint pair_rec (x:A) (y:B) (a:Acc R (x,y)) {struct a} : P x y :=
 F x y (fun u v h => pair_rec u v (Acc_inv a h)).
End Pair.

Section Triple.
Variables A B C : Type.
Variable R : A * (B * C) -> A * (B * C) -> Prop.
Variable P : A -> B -> C -> Type.
Variable F : forall x y z, (forall u v w, R (u,(v,w)) (x,(y,z)) -> P u v w) -> P x y z.
Fixpoint triple_rec (x:A) (y:B) (z:C) (a:Acc R (x,(y,z))) {struct a} : P x y z :=
 F x y z (fun u v w h => triple_rec u v w (Acc_inv a h)).
End Triple.

Inductive Cell (A B : Type) : Type := cell : A -> B -> Cell A B.
Section Custom.
Variables A B : Type.
Variable R : Cell A B -> Cell A B -> Prop.
Variable P : A -> B -> Type.
Variable F : forall x y, (forall u v, R (cell A B u v) (cell A B x y) -> P u v) -> P x y.
Fixpoint custom_rec (x:A) (y:B) (a:Acc R (cell A B x y)) {struct a} : P x y :=
 F x y (fun u v h => custom_rec u v (Acc_inv a h)).
End Custom.

Section Mono.
Variable R : nat * nat -> nat * nat -> Prop.
Variable F : forall x y, (forall u v, R (u,v) (x,y) -> nat) -> nat.
Fixpoint counted_pair (x y:nat) (a:Acc R (x,y)) {struct a} : nat :=
 F x y (fun u v h => counted_pair u v (Acc_inv a h)).
End Mono.

Section Repeated.
Variable A : Type.
Variable R : A * A -> A * A -> Prop.
Variable F : forall x, (forall y, R (y,y) (x,x) -> nat) -> nat.
Fixpoint repeated (x:A) (a:Acc R (x,x)) {struct a} : nat :=
 F x (fun y h => repeated y (Acc_inv a h)).
End Repeated.

Section Sum.
Variable A : Type.
Variable R : option A -> option A -> Prop.
Variable F : forall x, (forall y, R (Some y) (Some x) -> nat) -> nat.
Fixpoint sum_index (x:A) (a:Acc R (Some x)) {struct a} : nat :=
 F x (fun y h => sum_index y (Acc_inv a h)).
End Sum.

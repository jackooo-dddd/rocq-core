Set Universe Polymorphism.
Polymorphic Definition pass_sigma@{u} (A : Type@{u}) (P : A -> Prop)
 (f : forall Q : A -> Set, {x : A & Q x} -> {x : A & Q x})
 (s : {x : A & P x}) : {x : A & P x} := f P s.
Definition pass_product (P Q : Prop)
 (f : forall A B : Set, A * B -> A * B) (s : P * Q) : P * Q := f P Q s.

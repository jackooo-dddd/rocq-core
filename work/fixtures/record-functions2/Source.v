Set Universe Polymorphism.
Polymorphic Definition pass_sigma@{u} (A : Type@{u}) (P : A -> Prop)
 (f : forall Q : A -> Set, {x : A & Q x} -> {x : A & Q x})
 (s : {x : A & P x}) : {x : A & P x} := f P s.
Definition pass_mixed (A : Set) (P : Prop)
 (f : forall B : Set, A * B -> A * B) (s : A * P) : A * P := f P s.
Polymorphic Definition pass_pair@{u v | u < v} (A : Type@{u})
 (f : forall B : Type@{v}, B * B -> B * B) (s : A * A) : A * A := f A s.

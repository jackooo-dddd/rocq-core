Set Universe Polymorphism.
Polymorphic Definition keep_sigma@{u v} (A : Type@{u}) (P : A -> Type@{v}) (s : {x : A & P x}) : {x : A & P x} :=
 match s with existT _ x p => existT P x p end.
Polymorphic Definition prop_sigma@{u} (A : Type@{u}) (P : A -> Prop) (s : {x : A & P x}) : {x : A & P x} :=
 keep_sigma@{u Set} A P s.
Polymorphic Definition keep_product@{u v} (A : Type@{u}) (B : Type@{v}) (s : A * B) : A * B :=
 match s with (x,y) => (x,y) end.
Polymorphic Definition prop_product (P Q : Prop) (s : P * Q) : P * Q :=
 keep_product@{Set Set} P Q s.

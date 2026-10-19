Set Universe Polymorphism.
Polymorphic Definition equality_operator@{u} : forall A : Type@{u}, A -> A -> Prop := @eq.
Polymorphic Definition keep_operator@{u}
 (f : forall A : Type@{u}, A -> A -> Prop) := f.
Polymorphic Definition passed_equality@{u} := keep_operator@{u} (@eq).
Polymorphic Definition use_equality@{u} (A : Type@{u}) (x y : A) := passed_equality A x y.
Polymorphic Definition use_refl@{u} (A : Type@{u}) (x : A) : use_equality A x x := eq_refl.

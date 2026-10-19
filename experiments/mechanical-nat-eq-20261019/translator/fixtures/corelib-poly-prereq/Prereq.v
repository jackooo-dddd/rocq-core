Set Universe Polymorphism.
Polymorphic Axiom refl_task@{u} : forall (A : Type@{u}) (x : A), x = x.
Polymorphic Definition witness@{u} (A : Type@{u}) (x : A) : { y : A | y = x } :=
  exist (fun y => y = x) x (refl_task A x).
Polymorphic Definition two@{u v} (A : Type@{u}) (B : Type@{v}) (x : A) (y : B) :=
  (witness A x, witness B y).

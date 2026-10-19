Universe g.
Definition identity_global (A : Type@{g}) (x : A) : A := x.
Polymorphic Definition bounded_use@{u | u <= g} (A : Type@{u}) (x : A) : A :=
  identity_global A x.
Polymorphic Definition transitive_use@{u v | u <= v, v <= g}
  (A : Type@{u}) (x : A) : A := identity_global A x.

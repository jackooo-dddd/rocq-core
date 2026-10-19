Polymorphic Definition rel@{u v} (A : Type@{u}) := A -> A -> Type@{v}.
Polymorphic Definition complement@{u v} (A : Type@{u}) (R : rel@{u v} A) : rel@{u v} A :=
  fun x y => R x y -> False.
Polymorphic Definition complement_at@{u v w} (A : Type@{u}) (R : rel@{u v} A) : rel@{u w} A :=
  fun x y => R x y -> False.
Polymorphic Definition complement_twice@{u v} (A : Type@{u}) (R : rel@{u v} A) : rel@{u v} A :=
  complement A (complement A R).

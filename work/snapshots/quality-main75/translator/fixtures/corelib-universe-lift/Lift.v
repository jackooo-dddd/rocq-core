Universe low high.
Constraint low < high.
Definition raise_type (A : Type@{low}) : Type@{high} := A.
Definition raise_value (A : Type@{low}) (a : A) : raise_type A := a.
Definition lower_value (A : Type@{low}) (a : raise_type A) : A := a.
Definition roundtrip (A : Type@{low}) (a : A) : A := lower_value A (raise_value A a).
Polymorphic Definition raise_poly@{u v | u < v} (A : Type@{u}) : Type@{v} := A.
Polymorphic Definition roundtrip_poly@{u v | u < v} (A : Type@{u}) (a : A) : A :=
  let x : raise_poly@{u v} A := a in x.

From Corelib Require Import PrimInt63 PrimArray.
Definition empty : array int := Eval cbv in (@make int 0%uint63 7%uint63).
Definition small : array int := Eval cbv in (set (set (@make int 2%uint63 42%uint63) 0%uint63 9%uint63) 1%uint63 7%uint63).
Definition high : array int := Eval cbv in (set (@make int 1%uint63 0%uint63) 0%uint63 9223372036854775807%uint63).
Definition nested : array (array int) := Eval cbv in (set (@make (array int) 2%uint63 empty) 1%uint63 small).
Polymorphic Definition poly@{u} (A : Type@{u}) (a b : A) : array A :=
  Eval cbv in (set (@make A 2%uint63 a) 0%uint63 b).

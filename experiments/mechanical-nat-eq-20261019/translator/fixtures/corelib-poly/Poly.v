Set Universe Polymorphism.
Polymorphic Inductive box@{u} (A : Type@{u}) : Type@{u} := pack : A -> box A.
Polymorphic Definition unbox@{u} (A : Type@{u}) (b : box A) : A :=
  match b with pack _ a => a end.
Polymorphic Record cell@{u} (A : Type@{u}) : Type@{u} := mkcell { value : A }.
Polymorphic Inductive tree@{u} (A : Type@{u}) : Type@{u} :=
| leaf : A -> tree A
| branch : tree A -> tree A -> tree A.
Polymorphic Fixpoint first@{u} (A : Type@{u}) (t : tree A) : A :=
  match t with leaf _ a => a | branch _ l _ => first A l end.
Definition small : box nat := pack nat 3.
Definition large : box Type := pack Type nat.
Definition small_value : nat := unbox nat small.
Definition large_value : Type := unbox Type large.

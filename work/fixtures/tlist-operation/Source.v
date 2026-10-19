Inductive Tlist : Type := Tnil : Tlist | Tcons : Type -> Tlist -> Tlist.
Fixpoint arrows (l : Tlist) (T : Type) : Type :=
 match l with Tnil => T | Tcons A rest => A -> arrows rest T end.
Definition binary_operation (A : Type) := arrows (Tcons A (Tcons A Tnil)) A.
Definition predicate (l : Tlist) := arrows l Prop.
Fixpoint extension (T : Type) (op : binary_operation T) (l : Tlist)
 : binary_operation (arrows l T) :=
 match l return binary_operation (arrows l T) with
 | Tnil => fun f g => op f g
 | Tcons A rest => fun f g x => extension T op rest (f x) (g x)
 end.
Definition intersection := extension Prop and.

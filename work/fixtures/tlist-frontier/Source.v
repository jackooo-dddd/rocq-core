Inductive Tlist : Type := Tnil : Tlist | Tcons : Type -> Tlist -> Tlist.
Fixpoint arrows (l : Tlist) (T : Type) : Type :=
 match l with Tnil => T | Tcons A rest => A -> arrows rest T end.
Definition predicate (l : Tlist) := arrows l Prop.
Fixpoint extension (T : Type) (op : T -> T -> T) (l : Tlist)
 : arrows l T -> arrows l T -> arrows l T :=
 match l return arrows l T -> arrows l T -> arrows l T with
 | Tnil => op
 | Tcons A rest => fun f g x => extension T op rest (f x) (g x)
 end.
Definition intersection := extension Prop and.

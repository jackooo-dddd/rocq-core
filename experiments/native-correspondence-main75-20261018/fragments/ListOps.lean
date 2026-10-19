@[simp] theorem map_agrees {A : Type u} {B : Type v} (f : A → B) (xs : RList A) :
  listTo (Rocq.Corelib.Lists.ListDef.map A B f xs) = (listTo xs).map f :=
  @Rocq.Corelib.Init.Datatypes.list.rec A (fun xs => listTo (Rocq.Corelib.Lists.ListDef.map A B f xs) = (listTo xs).map f)
    rfl (fun x xs ih => by change f x :: listTo (Rocq.Corelib.Lists.ListDef.map A B f xs) = f x :: (listTo xs).map f; rw [ih]) xs
@[simp] theorem repeat_agrees {A : Type u} (a : A) (n : Nat) :
  listTo (Rocq.Corelib.Lists.ListDef.repeat A a n) = List.replicate n a := by
  induction n with
  | zero => rfl
  | succ n ih => change a :: listTo (Rocq.Corelib.Lists.ListDef.repeat A a n) = a :: List.replicate n a; rw [ih]
@[simp] theorem firstn_agrees {A : Type u} (n : Nat) (xs : RList A) :
  listTo (Rocq.Corelib.Lists.ListDef.firstn A n xs) = (listTo xs).take n := by
  induction n generalizing xs with
  | zero => rfl
  | succ n ih =>
    cases xs with
    | nil => rfl
    | cons x xs => change x :: listTo (Rocq.Corelib.Lists.ListDef.firstn A n xs) = x :: (listTo xs).take n; rw [ih]
@[simp] theorem skipn_agrees {A : Type u} (n : Nat) (xs : RList A) :
  listTo (Rocq.Corelib.Lists.ListDef.skipn A n xs) = (listTo xs).drop n := by
  induction n generalizing xs with
  | zero => rfl
  | succ n ih =>
    cases xs with
    | nil => rfl
    | cons x xs => exact ih xs
@[simp] theorem nth_agrees {A : Type u} (n : Nat) (xs : RList A) (d : A) :
  Rocq.Corelib.Lists.ListDef.nth A n xs d = (listTo xs)[n]?.getD d := by
  induction n generalizing xs with
  | zero => cases xs <;> rfl
  | succ n ih =>
    cases xs with
    | nil => rfl
    | cons x xs => exact ih xs
@[simp] theorem seq_agrees (start len : Nat) :
  listTo (Rocq.Corelib.Lists.ListDef.seq start len) = List.range' start len := by
  induction len generalizing start with
  | zero => rfl
  | succ len ih =>
    change start :: listTo (Rocq.Corelib.Lists.ListDef.seq (start+1) len) = start :: List.range' (start+1) len
    rw [ih]
@[simp] theorem forall_list_agrees {A : Type u} (P : A → Prop) (xs : RList A) :
  Rocq.Corelib.Lists.ListDef.Forall A P xs ↔ ∀ x ∈ listTo xs, P x := by
  constructor
  · intro h
    induction h using Rocq.Corelib.Lists.ListDef.Forall.rec with
    | Forall_nil => intro x hx; cases hx
    | Forall_cons x xs hx hxs ih =>
      intro y hy
      change y ∈ x :: listTo xs at hy
      cases hy with
      | head => exact hx
      | tail _ hy => exact ih y hy
  · induction xs using Rocq.Corelib.Init.Datatypes.list.rec with
    | nil => intro _; exact .Forall_nil A P
    | cons x xs ih =>
      intro h
      apply Rocq.Corelib.Lists.ListDef.Forall.Forall_cons A P x xs
      · exact h x (by change x ∈ x :: listTo xs; exact .head _)
      · apply ih; intro y hy
        exact h y (by change y ∈ x :: listTo xs; exact .tail _ hy)

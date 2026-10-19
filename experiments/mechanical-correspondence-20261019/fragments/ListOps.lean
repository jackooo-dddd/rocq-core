@[simp] theorem map_agrees {A : Type u} {B : Type v} (f : A → B) (xs : RList A) :
  listTo (Rocq.Corelib.Lists.ListDef.map A B f xs) = (listTo xs).map f :=
  @Rocq.Corelib.Init.Datatypes.list.rec A (fun xs => listTo (Rocq.Corelib.Lists.ListDef.map A B f xs) = (listTo xs).map f)
    rfl (fun x xs ih => by change f x :: listTo (Rocq.Corelib.Lists.ListDef.map A B f xs) = f x :: (listTo xs).map f; rw [ih]) xs
@[simp] theorem repeat_agrees {A : Type u} (a : A) (n : MN) :
  listTo (Rocq.Corelib.Lists.ListDef.repeat A a n) = List.replicate (natTo n) a := by
  induction n with
  | O => rfl
  | S n ih => change a :: listTo (Rocq.Corelib.Lists.ListDef.repeat A a n) = a :: List.replicate (natTo n) a; rw [ih]
@[simp] theorem firstn_agrees {A : Type u} (n : MN) (xs : RList A) :
  listTo (Rocq.Corelib.Lists.ListDef.firstn A n xs) = (listTo xs).take (natTo n) := by
  induction n generalizing xs with
  | O => rfl
  | S n ih =>
    cases xs with
    | nil => rfl
    | cons x xs => change x :: listTo (Rocq.Corelib.Lists.ListDef.firstn A n xs) = x :: (listTo xs).take (natTo n); rw [ih]
@[simp] theorem skipn_agrees {A : Type u} (n : MN) (xs : RList A) :
  listTo (Rocq.Corelib.Lists.ListDef.skipn A n xs) = (listTo xs).drop (natTo n) := by
  induction n generalizing xs with
  | O => rfl
  | S n ih =>
    cases xs with
    | nil => rfl
    | cons x xs => exact ih xs
@[simp] theorem nth_agrees {A : Type u} (n : MN) (xs : RList A) (d : A) :
  Rocq.Corelib.Lists.ListDef.nth A n xs d = (listTo xs)[natTo n]?.getD d := by
  induction n generalizing xs with
  | O => cases xs <;> rfl
  | S n ih =>
    cases xs with
    | nil => rfl
    | cons x xs => exact ih xs
@[simp] theorem seq_agrees (start len : MN) :
  (listTo (Rocq.Corelib.Lists.ListDef.seq start len)).map natTo = List.range' (natTo start) (natTo len) := by
  induction len generalizing start with
  | O => rfl
  | S len ih =>
    change natTo start :: (listTo (Rocq.Corelib.Lists.ListDef.seq (.S start) len)).map natTo =
      natTo start :: List.range' (natTo start+1) (natTo len)
    rw [ih]; rfl
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

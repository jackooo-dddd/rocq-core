import Rocq2LeanOut
-- Kernel declarations are imported without Lean code generation.
-- These bridges remain reducible in the kernel; noncomputable suppresses native code generation.
universe u
abbrev TranslatedList (A : Type u) := Rocq.Corelib.Init.Datatypes.list A

noncomputable def fromLean {A : Type u} : List A → TranslatedList A
  | [] => Rocq.Corelib.Init.Datatypes.list.nil A
  | x :: xs => Rocq.Corelib.Init.Datatypes.list.cons A x (fromLean xs)

noncomputable def toLean {A : Type u} (xs : TranslatedList A) : List A :=
  @Rocq.Corelib.Init.Datatypes.list.rec A (fun _ => List A)
    [] (fun x _ acc => x :: acc) xs

theorem native_roundtrip {A : Type u} (xs : List A) :
    toLean (fromLean xs) = xs := by
  induction xs with
  | nil => rfl
  | cons x xs ih =>
    change x :: toLean (fromLean xs) = x :: xs
    rw [ih]

theorem translated_roundtrip {A : Type u} (xs : TranslatedList A) :
    fromLean (toLean xs) = xs :=
  @Rocq.Corelib.Init.Datatypes.list.rec A (fun xs => fromLean (toLean xs) = xs)
    rfl (fun x xs ih => by
      change Rocq.Corelib.Init.Datatypes.list.cons A x (fromLean (toLean xs)) =
        Rocq.Corelib.Init.Datatypes.list.cons A x xs
      rw [ih]) xs

theorem length_agrees {A : Type u} (xs : List A) :
    Rocq.Corelib.Init.Datatypes.length A (fromLean xs) = xs.length := by
  induction xs with
  | nil => rfl
  | cons x xs ih =>
    change Nat.succ (Rocq.Corelib.Init.Datatypes.length A (fromLean xs)) = Nat.succ xs.length
    rw [ih]

theorem append_agrees {A : Type u} (xs ys : List A) :
    toLean (Rocq.Corelib.Init.Datatypes.app A (fromLean xs) (fromLean ys)) = xs ++ ys := by
  induction xs with
  | nil => exact native_roundtrip ys
  | cons x xs ih =>
    change x :: toLean (Rocq.Corelib.Init.Datatypes.app A (fromLean xs) (fromLean ys)) =
      x :: (xs ++ ys)
    rw [ih]

#print axioms native_roundtrip
#print axioms translated_roundtrip
#print axioms length_agrees
#print axioms append_agrees

-- Consume native List functions on arbitrary translated lists, and return translated data.
def reverseTranslated {A : Type u} (xs : RList A) : RList A :=
  (listIso A).call (listIso A) List.reverse xs
theorem reverseTranslated_agrees {A : Type u} (xs : RList A) :
  listTo (reverseTranslated xs) = (listTo xs).reverse :=
  Iso.call_agrees (listIso A) (listIso A) List.reverse xs
theorem reverseTranslated_involutive {A : Type u} (xs : RList A) :
  reverseTranslated (reverseTranslated xs) = xs := by
  apply (listIso A).injective
  change listTo (reverseTranslated (reverseTranslated xs)) = listTo xs
  rw [reverseTranslated_agrees, reverseTranslated_agrees, List.reverse_reverse]
-- Recursive element conversion: mechanically translated lists of booleans ↔ native List Bool.
def boolListIso : Iso (RList RBool) (List Bool) := (listIso RBool).trans boolIso.lists
-- Transfer equality decisions from the native carrier.
noncomputable def translatedBoolDecidableEq : DecidableEq RBool := boolIso.decidableEq
-- Use a native theorem to establish a property of the actual mechanical append.
theorem translated_append_assoc {A : Type u} (xs ys zs : RList A) :
  Rocq.Corelib.Init.Datatypes.app A (Rocq.Corelib.Init.Datatypes.app A xs ys) zs =
  Rocq.Corelib.Init.Datatypes.app A xs (Rocq.Corelib.Init.Datatypes.app A ys zs) := by
  apply (listIso A).injective
  change listTo (Rocq.Corelib.Init.Datatypes.app A (Rocq.Corelib.Init.Datatypes.app A xs ys) zs) =
    listTo (Rocq.Corelib.Init.Datatypes.app A xs (Rocq.Corelib.Init.Datatypes.app A ys zs))
  simp only [append_agrees, List.append_assoc]

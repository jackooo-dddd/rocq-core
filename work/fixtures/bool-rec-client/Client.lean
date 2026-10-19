import Rocq2LeanOut
noncomputable section
abbrev B := Rocq.Corelib.Init.Datatypes.bool
abbrev bt := Rocq.Corelib.Init.Datatypes.bool.true
abbrev bf := Rocq.Corelib.Init.Datatypes.bool.false
def use_bool_rec (b : B) (P : B → Type) (ht : b = bt → P bt) (hf : b = bf → P bf) : P b :=
 @RocqPending.Corelib.Init.Sumbool.bool_eq_rec
  (fun _ _ _ _ _ => rfl) (fun _ _ _ _ _ => rfl) b P ht hf
theorem true_beta (P : B → Type) (ht : bt = bt → P bt) (hf : bt = bf → P bf) :
 use_bool_rec bt P ht hf = ht rfl := rfl
theorem false_beta (P : B → Type) (ht : bf = bt → P bt) (hf : bf = bf → P bf) :
 use_bool_rec bf P ht hf = hf rfl := rfl
#print axioms use_bool_rec
#print axioms true_beta
#print axioms false_beta
#print axioms RocqPending.Corelib.Init.Sumbool.bool_eq_rec

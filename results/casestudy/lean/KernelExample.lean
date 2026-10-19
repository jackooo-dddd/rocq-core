import Rocq2LeanOut
-- Imported from the existing Init/Nat mechanical output, not redefined here.
noncomputable section
abbrev MN := Rocq.Corelib.Init.Datatypes.nat
#check Rocq.Corelib.Init.Datatypes.nat.O
#check Rocq.Corelib.Init.Datatypes.nat.S
#check Rocq.Corelib.Init.Datatypes.nat.rec
#print Rocq.Corelib.Init.Datatypes.nat
example : Rocq.Corelib.Init.Nat.add (Rocq.Corelib.Init.Datatypes.nat.S Rocq.Corelib.Init.Datatypes.nat.O) (Rocq.Corelib.Init.Datatypes.nat.S (Rocq.Corelib.Init.Datatypes.nat.S Rocq.Corelib.Init.Datatypes.nat.O)) =
    Rocq.Corelib.Init.Datatypes.nat.S (Rocq.Corelib.Init.Datatypes.nat.S (Rocq.Corelib.Init.Datatypes.nat.S Rocq.Corelib.Init.Datatypes.nat.O)) := rfl
example (n : MN) : Rocq.Corelib.Init.Nat.add Rocq.Corelib.Init.Datatypes.nat.O n = n := rfl

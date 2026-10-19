import Rocq2LeanOut
abbrev SourceNat := Rocq.Corelib.Init.Datatypes.nat
example : Rocq.Corelib.Init.Nat.add (.S .O) (.S (.S .O)) = (.S (.S (.S .O)) : SourceNat) := rfl
example : Rocq.Corelib.Init.Nat.mul (.S (.S .O)) (.S (.S .O)) = (.S (.S (.S (.S .O))) : SourceNat) := rfl

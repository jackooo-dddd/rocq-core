
/-- Numeric evaluation loses leading-zero information; it is not a bijection. -/
theorem decimal_numeric_decode_not_injective :
 ¬ (∀ x y : Rocq.Corelib.Init.Decimal.uint,
   Rocq.Corelib.Init.Nat.of_uint x = Rocq.Corelib.Init.Nat.of_uint y → x = y) := by
 intro h
 have e := h .Nil (.D0 .Nil) rfl
 have bad := congrArg decimalDigitsTo e
 change ([] : List (Fin 10)) = [⟨0, by decide⟩] at bad
 cases bad

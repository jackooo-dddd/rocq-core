import NumericRead
noncomputable section
namespace NativeBridge.Incremental.NumericWrite
open NativeBridge NativeBridge.Incremental

/-- Native little-endian digit carry; representation, including redundant zeros, is retained. -/
def increment (b : Nat) (hb : 2 ≤ b) : List (Fin b) → List (Fin b)
  | [] => [⟨1,by omega⟩]
  | d :: ds => if h : d.val + 1 < b then ⟨d.val + 1,h⟩ :: ds
      else ⟨0,by omega⟩ :: increment b hb ds

def value (b : Nat) (ds : List (Fin b)) : Nat :=
  ds.foldr (fun d acc => d.val + b * acc) 0

theorem increment_value (b : Nat) (hb : 2 ≤ b) (ds : List (Fin b)) :
    value b (increment b hb ds) = value b ds + 1 := by
  induction ds with
  | nil => simp [increment,value]
  | cons d ds ih =>
    simp only [increment]
    split
    · simp [value,Nat.add_assoc,Nat.add_comm,Nat.add_left_comm]
    · simp only [value,List.foldr_cons,Fin.val_mk,Nat.zero_add]
      change b * value b (increment b hb ds) = d.val + b * value b ds + 1
      rw [ih,Nat.mul_add,Nat.mul_one]
      have hd := d.isLt
      omega

def iterate (b : Nat) (hb : 2 ≤ b) (n : Nat) : List (Fin b) → List (Fin b) :=
  Nat.rec (fun ds => ds) (fun _ ih ds => ih (increment b hb ds)) n

theorem iterate_value (b : Nat) (hb : 2 ≤ b) (n : Nat) (ds : List (Fin b)) :
    value b (iterate b hb n ds) = value b ds + n := by
  induction n generalizing ds with
  | zero => rfl
  | succ n ih =>
    change value b (iterate b hb n (increment b hb ds)) = _
    rw [ih,increment_value]
    omega

theorem decimal_increment_agrees (ds : Rocq.Corelib.Init.Decimal.uint) :
    decimalDigitsTo (Rocq.Corelib.Init.Decimal.Little.succ ds) =
      increment 10 (by decide) (decimalDigitsTo ds) := by
  induction ds with
  | Nil => rfl
  | D0 ds ih => rfl
  | D1 ds ih => rfl
  | D2 ds ih => rfl
  | D3 ds ih => rfl
  | D4 ds ih => rfl
  | D5 ds ih => rfl
  | D6 ds ih => rfl
  | D7 ds ih => rfl
  | D8 ds ih => rfl
  | D9 ds ih =>
    change (0 : Fin 10) :: decimalDigitsTo (Rocq.Corelib.Init.Decimal.Little.succ ds) =
      (0 : Fin 10) :: increment 10 (by decide) (decimalDigitsTo ds)
    exact congrArg (List.cons (0 : Fin 10)) ih


theorem hexadecimal_increment_agrees (ds : Rocq.Corelib.Init.Hexadecimal.uint) :
    hexadecimalDigitsTo (Rocq.Corelib.Init.Hexadecimal.Little.succ ds) =
      increment 16 (by decide) (hexadecimalDigitsTo ds) := by
  induction ds with
  | Nil => rfl
  | D0 ds ih => rfl
  | D1 ds ih => rfl
  | D2 ds ih => rfl
  | D3 ds ih => rfl
  | D4 ds ih => rfl
  | D5 ds ih => rfl
  | D6 ds ih => rfl
  | D7 ds ih => rfl
  | D8 ds ih => rfl
  | D9 ds ih => rfl
  | Da ds ih => rfl
  | Db ds ih => rfl
  | Dc ds ih => rfl
  | Dd ds ih => rfl
  | De ds ih => rfl
  | Df ds ih =>
    change (0 : Fin 16) :: hexadecimalDigitsTo (Rocq.Corelib.Init.Hexadecimal.Little.succ ds) =
      (0 : Fin 16) :: increment 16 (by decide) (hexadecimalDigitsTo ds)
    exact congrArg (List.cons (0 : Fin 16)) ih


theorem decimal_little_agrees (n : MN) (ds : Rocq.Corelib.Init.Decimal.uint) :
    decimalDigitsTo (Rocq.Corelib.Init.Nat.to_little_uint n ds) =
      iterate 10 (by decide) (natTo n) (decimalDigitsTo ds) := by
  induction n generalizing ds with
  | O => rfl
  | S n ih =>
    change decimalDigitsTo (Rocq.Corelib.Init.Nat.to_little_uint n (Rocq.Corelib.Init.Decimal.Little.succ ds)) = _
    rw [ih,decimal_increment_agrees]
    rfl

theorem hexadecimal_little_agrees (n : MN) (ds : Rocq.Corelib.Init.Hexadecimal.uint) :
    hexadecimalDigitsTo (Rocq.Corelib.Init.Nat.to_little_hex_uint n ds) =
      iterate 16 (by decide) (natTo n) (hexadecimalDigitsTo ds) := by
  induction n generalizing ds with
  | O => rfl
  | S n ih =>
    change hexadecimalDigitsTo (Rocq.Corelib.Init.Nat.to_little_hex_uint n (Rocq.Corelib.Init.Hexadecimal.Little.succ ds)) = _
    rw [ih,hexadecimal_increment_agrees]
    rfl

/-- Big-endian native digit representation with one digit for zero. -/
def printDigits (b : Nat) (hb : 2 ≤ b) (n : Nat) : List (Fin b) :=
  (iterate b hb n [⟨0,by omega⟩]).reverse

theorem printDigits_value (b : Nat) (hb : 2 ≤ b) (n : Nat) :
    value b (printDigits b hb n).reverse = n := by
  simp only [printDigits,List.reverse_reverse,iterate_value]
  simp [value]

theorem decimal_revapp_agrees (xs ys : Rocq.Corelib.Init.Decimal.uint) :
    decimalDigitsTo (Rocq.Corelib.Init.Decimal.revapp xs ys) =
      (decimalDigitsTo xs).reverse ++ decimalDigitsTo ys := by
  induction xs generalizing ys <;>
    simp_all [Rocq.Corelib.Init.Decimal.revapp, decimalDigitsTo, List.reverse_cons, List.append_assoc]
theorem decimal_rev_agrees (xs : Rocq.Corelib.Init.Decimal.uint) :
    decimalDigitsTo (Rocq.Corelib.Init.Decimal.rev xs) = (decimalDigitsTo xs).reverse := by
  simpa [Rocq.Corelib.Init.Decimal.rev, decimalDigitsTo] using decimal_revapp_agrees xs .Nil
theorem decimal_print_agrees (n : MN) :
    decimalDigitsTo (Rocq.Corelib.Init.Nat.to_uint n) = printDigits 10 (by decide) (natTo n) := by
  unfold Rocq.Corelib.Init.Nat.to_uint
  rw [decimal_rev_agrees,decimal_little_agrees]
  rfl

def decimalSignedTo (s : Rocq.Corelib.Init.Decimal.signed_int) : Bool × List (Fin 10) :=
  Rocq.Corelib.Init.Decimal.signed_int.rec
    (fun ds => (false,decimalDigitsTo ds)) (fun ds => (true,decimalDigitsTo ds)) s
def decimalSignedOf (s : Bool × List (Fin 10)) : Rocq.Corelib.Init.Decimal.signed_int :=
  if s.1 then .Neg (decimalDigitsOf s.2) else .Pos (decimalDigitsOf s.2)
def decimalSignedIso : Iso Rocq.Corelib.Init.Decimal.signed_int (Bool × List (Fin 10)) where
  to := decimalSignedTo
  of := decimalSignedOf
  of_to s := by cases s <;> simp [decimalSignedTo,decimalSignedOf]
  to_of s := by rcases s with ⟨b,ds⟩; cases b <;> simp [decimalSignedTo,decimalSignedOf]
theorem decimal_signed_print_agrees (n : MN) :
    decimalSignedTo (Rocq.Corelib.Init.Nat.to_int n) =
      (false,printDigits 10 (by decide) (natTo n)) := by
  change (false,decimalDigitsTo (Rocq.Corelib.Init.Nat.to_uint n)) = _
  rw [decimal_print_agrees]

theorem hexadecimal_revapp_agrees (xs ys : Rocq.Corelib.Init.Hexadecimal.uint) :
    hexadecimalDigitsTo (Rocq.Corelib.Init.Hexadecimal.revapp xs ys) =
      (hexadecimalDigitsTo xs).reverse ++ hexadecimalDigitsTo ys := by
  induction xs generalizing ys <;>
    simp_all [Rocq.Corelib.Init.Hexadecimal.revapp, hexadecimalDigitsTo, List.reverse_cons, List.append_assoc]
theorem hexadecimal_rev_agrees (xs : Rocq.Corelib.Init.Hexadecimal.uint) :
    hexadecimalDigitsTo (Rocq.Corelib.Init.Hexadecimal.rev xs) = (hexadecimalDigitsTo xs).reverse := by
  simpa [Rocq.Corelib.Init.Hexadecimal.rev, hexadecimalDigitsTo] using hexadecimal_revapp_agrees xs .Nil
theorem hexadecimal_print_agrees (n : MN) :
    hexadecimalDigitsTo (Rocq.Corelib.Init.Nat.to_hex_uint n) = printDigits 16 (by decide) (natTo n) := by
  unfold Rocq.Corelib.Init.Nat.to_hex_uint
  rw [hexadecimal_rev_agrees,hexadecimal_little_agrees]
  rfl

def hexadecimalSignedTo (s : Rocq.Corelib.Init.Hexadecimal.signed_int) : Bool × List (Fin 16) :=
  Rocq.Corelib.Init.Hexadecimal.signed_int.rec
    (fun ds => (false,hexadecimalDigitsTo ds)) (fun ds => (true,hexadecimalDigitsTo ds)) s
def hexadecimalSignedOf (s : Bool × List (Fin 16)) : Rocq.Corelib.Init.Hexadecimal.signed_int :=
  if s.1 then .Neg (hexadecimalDigitsOf s.2) else .Pos (hexadecimalDigitsOf s.2)
def hexadecimalSignedIso : Iso Rocq.Corelib.Init.Hexadecimal.signed_int (Bool × List (Fin 16)) where
  to := hexadecimalSignedTo
  of := hexadecimalSignedOf
  of_to s := by cases s <;> simp [hexadecimalSignedTo,hexadecimalSignedOf]
  to_of s := by rcases s with ⟨b,ds⟩; cases b <;> simp [hexadecimalSignedTo,hexadecimalSignedOf]
theorem hexadecimal_signed_print_agrees (n : MN) :
    hexadecimalSignedTo (Rocq.Corelib.Init.Nat.to_hex_int n) =
      (false,printDigits 16 (by decide) (natTo n)) := by
  change (false,hexadecimalDigitsTo (Rocq.Corelib.Init.Nat.to_hex_uint n)) = _
  rw [hexadecimal_print_agrees]

def numberSignedTo (s : Rocq.Corelib.Init.Number.signed_int) :
    Sum (Bool × List (Fin 10)) (Bool × List (Fin 16)) :=
  Rocq.Corelib.Init.Number.signed_int.rec
    (fun x => .inl (decimalSignedTo x)) (fun x => .inr (hexadecimalSignedTo x)) s
def numberSignedOf : Sum (Bool × List (Fin 10)) (Bool × List (Fin 16)) →
    Rocq.Corelib.Init.Number.signed_int
  | .inl s => .IntDecimal (decimalSignedOf s)
  | .inr s => .IntHexadecimal (hexadecimalSignedOf s)
def numberSignedIso : Iso Rocq.Corelib.Init.Number.signed_int
    (Sum (Bool × List (Fin 10)) (Bool × List (Fin 16))) where
  to := numberSignedTo
  of := numberSignedOf
  of_to s := by
    cases s with
    | IntDecimal s => exact congrArg Rocq.Corelib.Init.Number.signed_int.IntDecimal (decimalSignedIso.of_to s)
    | IntHexadecimal s => exact congrArg Rocq.Corelib.Init.Number.signed_int.IntHexadecimal (hexadecimalSignedIso.of_to s)
  to_of s := by
    cases s with
    | inl s => exact congrArg Sum.inl (decimalSignedIso.to_of s)
    | inr s => exact congrArg Sum.inr (hexadecimalSignedIso.to_of s)

theorem number_decimal_print_agrees (n : MN) :
    numberUintTo (Rocq.Corelib.Init.Nat.to_num_uint n) =
      .inl (printDigits 10 (by decide) (natTo n)) := by
  change Sum.inl (decimalDigitsTo (Rocq.Corelib.Init.Nat.to_uint n)) = _
  rw [decimal_print_agrees]
theorem number_hexadecimal_print_agrees (n : MN) :
    numberUintTo (Rocq.Corelib.Init.Nat.to_num_hex_uint n) =
      .inr (printDigits 16 (by decide) (natTo n)) := by
  change Sum.inr (hexadecimalDigitsTo (Rocq.Corelib.Init.Nat.to_hex_uint n)) = _
  rw [hexadecimal_print_agrees]
theorem number_signed_print_agrees (n : MN) :
    numberSignedTo (Rocq.Corelib.Init.Nat.to_num_int n) =
      .inl (false,printDigits 10 (by decide) (natTo n)) := by
  change Sum.inl (decimalSignedTo (Rocq.Corelib.Init.Nat.to_int n)) = _
  rw [decimal_signed_print_agrees]

theorem decimal_print_value (n : MN) :
    value 10 (decimalDigitsTo (Rocq.Corelib.Init.Nat.to_uint n)).reverse = natTo n := by
  rw [decimal_print_agrees,printDigits_value]
theorem hexadecimal_print_value (n : MN) :
    value 16 (hexadecimalDigitsTo (Rocq.Corelib.Init.Nat.to_hex_uint n)).reverse = natTo n := by
  rw [hexadecimal_print_agrees,printDigits_value]

end NativeBridge.Incremental.NumericWrite

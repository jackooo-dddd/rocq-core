import Nat

set_option linter.unusedVariables false
noncomputable section
namespace NativeBridge

-- Existing representation bridge, instantiated in the Init.Nat profile.
def decimalDigitsTo : Rocq.Corelib.Init.Decimal.uint → List (Fin 10) := Rocq.Corelib.Init.Decimal.uint.rec [] (fun _ xs => (⟨0,by decide⟩ : Fin 10) :: xs) (fun _ xs => (⟨1,by decide⟩ : Fin 10) :: xs) (fun _ xs => (⟨2,by decide⟩ : Fin 10) :: xs) (fun _ xs => (⟨3,by decide⟩ : Fin 10) :: xs) (fun _ xs => (⟨4,by decide⟩ : Fin 10) :: xs) (fun _ xs => (⟨5,by decide⟩ : Fin 10) :: xs) (fun _ xs => (⟨6,by decide⟩ : Fin 10) :: xs) (fun _ xs => (⟨7,by decide⟩ : Fin 10) :: xs) (fun _ xs => (⟨8,by decide⟩ : Fin 10) :: xs) (fun _ xs => (⟨9,by decide⟩ : Fin 10) :: xs)
def decimalDigitsPrepend (d : Fin 10) (xs : Rocq.Corelib.Init.Decimal.uint) : Rocq.Corelib.Init.Decimal.uint := ((fun i => Fin.cases (Rocq.Corelib.Init.Decimal.uint.D0 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Decimal.uint.D1 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Decimal.uint.D2 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Decimal.uint.D3 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Decimal.uint.D4 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Decimal.uint.D5 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Decimal.uint.D6 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Decimal.uint.D7 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Decimal.uint.D8 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Decimal.uint.D9 xs) (fun i => Fin.elim0 i) i) i) i) i) i) i) i) i) i) i)) d
def decimalDigitsOf : List (Fin 10) → Rocq.Corelib.Init.Decimal.uint
  | [] => Rocq.Corelib.Init.Decimal.uint.Nil
  | d :: ds => decimalDigitsPrepend d (decimalDigitsOf ds)
theorem decimalDigits_prepend (xs : Rocq.Corelib.Init.Decimal.uint) : ∀ d : Fin 10, decimalDigitsTo (decimalDigitsPrepend d xs) = d :: decimalDigitsTo xs := (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.elim0 i) i) i) i) i) i) i) i) i) i) i)
@[simp] theorem decimalDigits_of_to (x : Rocq.Corelib.Init.Decimal.uint) : decimalDigitsOf (decimalDigitsTo x) = x :=
  Rocq.Corelib.Init.Decimal.uint.rec rfl (fun x ih => congrArg Rocq.Corelib.Init.Decimal.uint.D0 ih) (fun x ih => congrArg Rocq.Corelib.Init.Decimal.uint.D1 ih) (fun x ih => congrArg Rocq.Corelib.Init.Decimal.uint.D2 ih) (fun x ih => congrArg Rocq.Corelib.Init.Decimal.uint.D3 ih) (fun x ih => congrArg Rocq.Corelib.Init.Decimal.uint.D4 ih) (fun x ih => congrArg Rocq.Corelib.Init.Decimal.uint.D5 ih) (fun x ih => congrArg Rocq.Corelib.Init.Decimal.uint.D6 ih) (fun x ih => congrArg Rocq.Corelib.Init.Decimal.uint.D7 ih) (fun x ih => congrArg Rocq.Corelib.Init.Decimal.uint.D8 ih) (fun x ih => congrArg Rocq.Corelib.Init.Decimal.uint.D9 ih) x
@[simp] theorem decimalDigits_to_of (xs : List (Fin 10)) : decimalDigitsTo (decimalDigitsOf xs) = xs := by
  induction xs with
  | nil => rfl
  | cons d ds ih => change decimalDigitsTo (decimalDigitsPrepend d (decimalDigitsOf ds)) = d :: ds; rw [decimalDigits_prepend, ih]
def decimalDigitsIso : Iso Rocq.Corelib.Init.Decimal.uint (List (Fin 10)) := ⟨decimalDigitsTo,decimalDigitsOf,decimalDigits_of_to,decimalDigits_to_of⟩


-- Existing representation bridge, instantiated in the Init.Nat profile.
def hexadecimalDigitsTo : Rocq.Corelib.Init.Hexadecimal.uint → List (Fin 16) := Rocq.Corelib.Init.Hexadecimal.uint.rec [] (fun _ xs => (⟨0,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨1,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨2,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨3,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨4,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨5,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨6,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨7,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨8,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨9,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨10,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨11,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨12,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨13,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨14,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨15,by decide⟩ : Fin 16) :: xs)
def hexadecimalDigitsPrepend (d : Fin 16) (xs : Rocq.Corelib.Init.Hexadecimal.uint) : Rocq.Corelib.Init.Hexadecimal.uint := ((fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.D0 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.D1 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.D2 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.D3 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.D4 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.D5 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.D6 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.D7 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.D8 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.D9 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.Da xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.Db xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.Dc xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.Dd xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.De xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.Df xs) (fun i => Fin.elim0 i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i)) d
def hexadecimalDigitsOf : List (Fin 16) → Rocq.Corelib.Init.Hexadecimal.uint
  | [] => Rocq.Corelib.Init.Hexadecimal.uint.Nil
  | d :: ds => hexadecimalDigitsPrepend d (hexadecimalDigitsOf ds)
theorem hexadecimalDigits_prepend (xs : Rocq.Corelib.Init.Hexadecimal.uint) : ∀ d : Fin 16, hexadecimalDigitsTo (hexadecimalDigitsPrepend d xs) = d :: hexadecimalDigitsTo xs := (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.elim0 i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i)
@[simp] theorem hexadecimalDigits_of_to (x : Rocq.Corelib.Init.Hexadecimal.uint) : hexadecimalDigitsOf (hexadecimalDigitsTo x) = x :=
  Rocq.Corelib.Init.Hexadecimal.uint.rec rfl (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.D0 ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.D1 ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.D2 ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.D3 ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.D4 ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.D5 ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.D6 ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.D7 ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.D8 ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.D9 ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.Da ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.Db ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.Dc ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.Dd ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.De ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.Df ih) x
@[simp] theorem hexadecimalDigits_to_of (xs : List (Fin 16)) : hexadecimalDigitsTo (hexadecimalDigitsOf xs) = xs := by
  induction xs with
  | nil => rfl
  | cons d ds ih => change hexadecimalDigitsTo (hexadecimalDigitsPrepend d (hexadecimalDigitsOf ds)) = d :: ds; rw [hexadecimalDigits_prepend, ih]
def hexadecimalDigitsIso : Iso Rocq.Corelib.Init.Hexadecimal.uint (List (Fin 16)) := ⟨hexadecimalDigitsTo,hexadecimalDigitsOf,hexadecimalDigits_of_to,hexadecimalDigits_to_of⟩


namespace Incremental

/-- Reading digits is a fold, not a bijection with Nat. Leading zeros are retained by the representation Iso. -/
theorem decimal_read_acc_agrees (ds : Rocq.Corelib.Init.Decimal.uint) (acc : MN) :
    natTo (Rocq.Corelib.Init.Nat.of_uint_acc ds acc) =
      (decimalDigitsTo ds).foldl (fun a d => 10 * a + d.val) (natTo acc) := by
  induction ds generalizing acc <;>
    simp_all [Rocq.Corelib.Init.Nat.of_uint_acc, decimalDigitsTo, nat_tail_mul_agrees,
      natTo_succ, natTo_zero, Nat.succ_eq_add_one, Nat.add_assoc] <;> rfl

theorem decimal_read_agrees (ds : Rocq.Corelib.Init.Decimal.uint) :
    natTo (Rocq.Corelib.Init.Nat.of_uint ds) =
      (decimalDigitsTo ds).foldl (fun a d => 10 * a + d.val) 0 := by
  exact decimal_read_acc_agrees ds .O

/-- Reading digits is a fold, not a bijection with Nat. Leading zeros are retained by the representation Iso. -/
theorem hexadecimal_read_acc_agrees (ds : Rocq.Corelib.Init.Hexadecimal.uint) (acc : MN) :
    natTo (Rocq.Corelib.Init.Nat.of_hex_uint_acc ds acc) =
      (hexadecimalDigitsTo ds).foldl (fun a d => 16 * a + d.val) (natTo acc) := by
  induction ds generalizing acc <;>
    simp_all [Rocq.Corelib.Init.Nat.of_hex_uint_acc, hexadecimalDigitsTo, nat_tail_mul_agrees,
      natTo_succ, natTo_zero, Nat.succ_eq_add_one, Nat.add_assoc] <;> rfl

theorem hexadecimal_read_agrees (ds : Rocq.Corelib.Init.Hexadecimal.uint) :
    natTo (Rocq.Corelib.Init.Nat.of_hex_uint ds) =
      (hexadecimalDigitsTo ds).foldl (fun a d => 16 * a + d.val) 0 := by
  exact hexadecimal_read_acc_agrees ds .O


/-- The radix tag is information: decimal [1] and hexadecimal [1] remain distinct. -/
def numberUintTo (x : Rocq.Corelib.Init.Number.uint) :
    Sum (List (Fin 10)) (List (Fin 16)) :=
  Rocq.Corelib.Init.Number.uint.rec
    (fun ds => .inl (decimalDigitsTo ds))
    (fun ds => .inr (hexadecimalDigitsTo ds)) x

def numberUintOf : Sum (List (Fin 10)) (List (Fin 16)) → Rocq.Corelib.Init.Number.uint
  | .inl ds => .UIntDecimal (decimalDigitsOf ds)
  | .inr ds => .UIntHexadecimal (hexadecimalDigitsOf ds)

theorem numberUint_of_to (x : Rocq.Corelib.Init.Number.uint) :
    numberUintOf (numberUintTo x) = x := by
  cases x <;> simp [numberUintTo, numberUintOf]

theorem numberUint_to_of (x : Sum (List (Fin 10)) (List (Fin 16))) :
    numberUintTo (numberUintOf x) = x := by
  cases x <;> simp [numberUintTo, numberUintOf]

def numberUintIso : Iso Rocq.Corelib.Init.Number.uint
    (Sum (List (Fin 10)) (List (Fin 16))) :=
  ⟨numberUintTo, numberUintOf, numberUint_of_to, numberUint_to_of⟩

theorem number_read_agrees (ds : Rocq.Corelib.Init.Number.uint) :
    natTo (Rocq.Corelib.Init.Nat.of_num_uint ds) =
      match numberUintTo ds with
      | .inl xs => xs.foldl (fun a d => 10 * a + d.val) 0
      | .inr xs => xs.foldl (fun a d => 16 * a + d.val) 0 := by
  cases ds <;> simp [Rocq.Corelib.Init.Nat.of_num_uint, numberUintTo,
    decimal_read_agrees, hexadecimal_read_agrees]

/-- Equal values do not imply equal representations; empty and zero are different. -/
theorem decimal_decode_not_injective :
    ¬ (∀ x y : Rocq.Corelib.Init.Decimal.uint,
      Rocq.Corelib.Init.Nat.of_uint x = Rocq.Corelib.Init.Nat.of_uint y → x = y) := by
  intro h
  have bad := congrArg decimalDigitsTo (h .Nil (.D0 .Nil) rfl)
  change ([] : List (Fin 10)) = [0] at bad
  cases bad

theorem hexadecimal_decode_not_injective :
    ¬ (∀ x y : Rocq.Corelib.Init.Hexadecimal.uint,
      Rocq.Corelib.Init.Nat.of_hex_uint x = Rocq.Corelib.Init.Nat.of_hex_uint y → x = y) := by
  intro h
  have bad := congrArg hexadecimalDigitsTo (h .Nil (.D0 .Nil) rfl)
  change ([] : List (Fin 16)) = [0] at bad
  cases bad

end Incremental
end NativeBridge

import NumericWrite
noncomputable section
namespace NativeBridge.Incremental.NumericSigned
open NativeBridge NativeBridge.Incremental NumericWrite

def optionNatTo : Rocq.Corelib.Init.Datatypes.option MN → Option Nat :=
  Rocq.Corelib.Init.Datatypes.option.rec (fun x => some (natTo x)) none

/-- Reject a negative nonzero representation; accept both signs of zero. -/
def readSigned (b : Nat) (s : Bool × List (Fin b)) : Option Nat :=
  match s.2.dropWhile (fun d => d.val == 0) with
  | [] => some 0
  | d :: ds => if s.1 then none else some ((d :: ds).foldl (fun a d => b * a + d.val) 0)

theorem decimal_nzhead_agrees (xs : Rocq.Corelib.Init.Decimal.uint) :
    decimalDigitsTo (Rocq.Corelib.Init.Decimal.nzhead xs) =
      (decimalDigitsTo xs).dropWhile (fun d => d.val == 0) := by
  induction xs <;> simp_all [Rocq.Corelib.Init.Decimal.nzhead,decimalDigitsTo]

theorem decimal_unorm_agrees (xs : Rocq.Corelib.Init.Decimal.uint) :
    decimalDigitsTo (Rocq.Corelib.Init.Decimal.unorm xs) =
      match (decimalDigitsTo xs).dropWhile (fun d => d.val == 0) with
      | [] => [0]
      | ds => ds := by
  rw [← decimal_nzhead_agrees]
  unfold Rocq.Corelib.Init.Decimal.unorm
  generalize Rocq.Corelib.Init.Decimal.nzhead xs = ys
  cases ys <;> rfl

theorem decimal_norm_agrees (x : Rocq.Corelib.Init.Decimal.signed_int) :
    decimalSignedTo (Rocq.Corelib.Init.Decimal.norm x) =
      let ds := (decimalSignedTo x).2.dropWhile (fun d => d.val == 0)
      match ds with
      | [] => (false,[0])
      | d :: rest => ((decimalSignedTo x).1,d :: rest) := by
  cases x with
  | Pos ds =>
    simp only [Rocq.Corelib.Init.Decimal.norm,decimalSignedTo]
    rw [decimal_unorm_agrees]
    cases (decimalDigitsTo ds).dropWhile (fun d => d.val == 0) <;> rfl
  | Neg ds =>
    simp only [decimalSignedTo]
    rw [← decimal_nzhead_agrees]
    dsimp only [Rocq.Corelib.Init.Decimal.norm]
    generalize Rocq.Corelib.Init.Decimal.nzhead ds = ys
    cases ys <;> rfl

theorem decimal_read_normalized (s : Rocq.Corelib.Init.Decimal.signed_int) :
    optionNatTo (Rocq.Corelib.Init.Nat.of_int s) =
      let n := decimalSignedTo (Rocq.Corelib.Init.Decimal.norm s)
      if n.1 then none else some (n.2.foldl (fun a d => 10 * a + d.val) 0) := by
  unfold Rocq.Corelib.Init.Nat.of_int
  generalize Rocq.Corelib.Init.Decimal.norm s = x
  cases x with
  | Pos ds => exact congrArg some (decimal_read_agrees ds)
  | Neg ds => rfl

theorem decimal_signed_read_agrees (s : Rocq.Corelib.Init.Decimal.signed_int) :
    optionNatTo (Rocq.Corelib.Init.Nat.of_int s) = readSigned 10 (decimalSignedTo s) := by
  rw [decimal_read_normalized,decimal_norm_agrees]
  unfold readSigned
  cases (decimalSignedTo s).2.dropWhile (fun d => d.val == 0) <;> rfl

theorem decimal_negative_zero :
    optionNatTo (Rocq.Corelib.Init.Nat.of_int (.Neg (.D0 .Nil))) = some 0 := rfl
theorem decimal_negative_one :
    optionNatTo (Rocq.Corelib.Init.Nat.of_int (.Neg (.D1 .Nil))) = none := rfl

theorem hexadecimal_nzhead_agrees (xs : Rocq.Corelib.Init.Hexadecimal.uint) :
    hexadecimalDigitsTo (Rocq.Corelib.Init.Hexadecimal.nzhead xs) =
      (hexadecimalDigitsTo xs).dropWhile (fun d => d.val == 0) := by
  induction xs <;> simp_all [Rocq.Corelib.Init.Hexadecimal.nzhead,hexadecimalDigitsTo]

theorem hexadecimal_unorm_agrees (xs : Rocq.Corelib.Init.Hexadecimal.uint) :
    hexadecimalDigitsTo (Rocq.Corelib.Init.Hexadecimal.unorm xs) =
      match (hexadecimalDigitsTo xs).dropWhile (fun d => d.val == 0) with
      | [] => [0]
      | ds => ds := by
  rw [← hexadecimal_nzhead_agrees]
  unfold Rocq.Corelib.Init.Hexadecimal.unorm
  generalize Rocq.Corelib.Init.Hexadecimal.nzhead xs = ys
  cases ys <;> rfl

theorem hexadecimal_norm_agrees (x : Rocq.Corelib.Init.Hexadecimal.signed_int) :
    hexadecimalSignedTo (Rocq.Corelib.Init.Hexadecimal.norm x) =
      let ds := (hexadecimalSignedTo x).2.dropWhile (fun d => d.val == 0)
      match ds with
      | [] => (false,[0])
      | d :: rest => ((hexadecimalSignedTo x).1,d :: rest) := by
  cases x with
  | Pos ds =>
    simp only [Rocq.Corelib.Init.Hexadecimal.norm,hexadecimalSignedTo]
    rw [hexadecimal_unorm_agrees]
    cases (hexadecimalDigitsTo ds).dropWhile (fun d => d.val == 0) <;> rfl
  | Neg ds =>
    simp only [hexadecimalSignedTo]
    rw [← hexadecimal_nzhead_agrees]
    dsimp only [Rocq.Corelib.Init.Hexadecimal.norm]
    generalize Rocq.Corelib.Init.Hexadecimal.nzhead ds = ys
    cases ys <;> rfl

theorem hexadecimal_read_normalized (s : Rocq.Corelib.Init.Hexadecimal.signed_int) :
    optionNatTo (Rocq.Corelib.Init.Nat.of_hex_int s) =
      let n := hexadecimalSignedTo (Rocq.Corelib.Init.Hexadecimal.norm s)
      if n.1 then none else some (n.2.foldl (fun a d => 16 * a + d.val) 0) := by
  unfold Rocq.Corelib.Init.Nat.of_hex_int
  generalize Rocq.Corelib.Init.Hexadecimal.norm s = x
  cases x with
  | Pos ds => exact congrArg some (hexadecimal_read_agrees ds)
  | Neg ds => rfl

theorem hexadecimal_signed_read_agrees (s : Rocq.Corelib.Init.Hexadecimal.signed_int) :
    optionNatTo (Rocq.Corelib.Init.Nat.of_hex_int s) = readSigned 16 (hexadecimalSignedTo s) := by
  rw [hexadecimal_read_normalized,hexadecimal_norm_agrees]
  unfold readSigned
  cases (hexadecimalSignedTo s).2.dropWhile (fun d => d.val == 0) <;> rfl

theorem hexadecimal_negative_zero :
    optionNatTo (Rocq.Corelib.Init.Nat.of_hex_int (.Neg (.D0 .Nil))) = some 0 := rfl
theorem hexadecimal_negative_one :
    optionNatTo (Rocq.Corelib.Init.Nat.of_hex_int (.Neg (.D1 .Nil))) = none := rfl

theorem number_signed_read_agrees (s : Rocq.Corelib.Init.Number.signed_int) :
    optionNatTo (Rocq.Corelib.Init.Nat.of_num_int s) =
      match numberSignedTo s with
      | .inl x => readSigned 10 x
      | .inr x => readSigned 16 x := by
  cases s with
  | IntDecimal s => exact decimal_signed_read_agrees s
  | IntHexadecimal s => exact hexadecimal_signed_read_agrees s
def readUnsigned (b : Nat) (ds : List (Fin b)) : Nat :=
  ds.foldl (fun a d => b * a + d.val) 0

theorem fold_lower (b : Nat) (hb : 1 ≤ b) (ds : List (Fin b)) (acc : Nat) :
    acc ≤ ds.foldl (fun a d => b * a + d.val) acc := by
  induction ds generalizing acc with
  | nil => exact Nat.le_refl acc
  | cons d ds ih =>
    have hm : acc ≤ b * acc := by simpa using Nat.mul_le_mul_right acc hb
    exact Nat.le_trans (Nat.le_trans hm (Nat.le_add_right _ d.val)) (ih _)

theorem readUnsigned_drop (b : Nat) (ds : List (Fin b)) :
    readUnsigned b (ds.dropWhile (fun d => d.val == 0)) = readUnsigned b ds := by
  induction ds with
  | nil => rfl
  | cons d ds ih =>
    by_cases hd : d.val = 0
    · simpa [List.dropWhile_cons,hd,readUnsigned] using ih
    · simp [List.dropWhile_cons,hd]

theorem readUnsigned_zero_iff (b : Nat) (hb : 1 ≤ b) (ds : List (Fin b)) :
    readUnsigned b ds = 0 ↔ ds.dropWhile (fun d => d.val == 0) = [] := by
  induction ds with
  | nil => simp [readUnsigned]
  | cons d ds ih =>
    by_cases hd : d.val = 0
    · simpa [List.dropWhile_cons,hd,readUnsigned] using ih
    · have hpos : ds.foldl (fun a d => b * a + d.val) d.val ≠ 0 := by
        have hl := fold_lower b hb ds d.val
        omega
      simp [List.dropWhile_cons,hd,readUnsigned,hpos]

theorem readSigned_value (b : Nat) (hb : 1 ≤ b) (s : Bool × List (Fin b)) :
    readSigned b s =
      if s.1 && (readUnsigned b s.2 != 0) then none else some (readUnsigned b s.2) := by
  unfold readSigned
  cases hs : s.2.dropWhile (fun d => d.val == 0) with
  | nil =>
    have hv := (readUnsigned_zero_iff b hb s.2).mpr hs
    simp [hv]
  | cons d ds =>
    have hv : readUnsigned b s.2 ≠ 0 := by
      intro hv
      have he := (readUnsigned_zero_iff b hb s.2).mp hv
      rw [hs] at he
      contradiction
    have hf := readUnsigned_drop b s.2
    rw [hs] at hf
    change (if s.1 then none else some (readUnsigned b (d :: ds))) = _
    rw [hf]
    cases s.1 <;> simp [hv]

def signedValue (b : Nat) (s : Bool × List (Fin b)) : Int :=
  if s.1 then -(readUnsigned b s.2 : Int) else (readUnsigned b s.2 : Int)

theorem readSigned_int (b : Nat) (hb : 1 ≤ b) (s : Bool × List (Fin b)) :
    readSigned b s =
      if signedValue b s < 0 then none else some (signedValue b s).toNat := by
  rw [readSigned_value b hb]
  unfold signedValue
  cases hs : s.1 <;> simp
  by_cases hv : readUnsigned b s.2 = 0
  · simp [hv]
  · have hp : (0 : Int) < (readUnsigned b s.2 : Int) := by omega
    simp [hv,hp]

theorem decimal_signed_read_int (s : Rocq.Corelib.Init.Decimal.signed_int) :
    optionNatTo (Rocq.Corelib.Init.Nat.of_int s) =
      let z := signedValue 10 (decimalSignedTo s)
      if z < 0 then none else some z.toNat := by
  rw [decimal_signed_read_agrees,readSigned_int 10 (by decide)]
theorem hexadecimal_signed_read_int (s : Rocq.Corelib.Init.Hexadecimal.signed_int) :
    optionNatTo (Rocq.Corelib.Init.Nat.of_hex_int s) =
      let z := signedValue 16 (hexadecimalSignedTo s)
      if z < 0 then none else some z.toNat := by
  rw [hexadecimal_signed_read_agrees,readSigned_int 16 (by decide)]

def numberSignedValue : Sum (Bool × List (Fin 10)) (Bool × List (Fin 16)) → Int
  | .inl s => signedValue 10 s
  | .inr s => signedValue 16 s

theorem number_signed_read_int (s : Rocq.Corelib.Init.Number.signed_int) :
    optionNatTo (Rocq.Corelib.Init.Nat.of_num_int s) =
      let z := numberSignedValue (numberSignedTo s)
      if z < 0 then none else some z.toNat := by
  cases s with
  | IntDecimal s => exact decimal_signed_read_int s
  | IntHexadecimal s => exact hexadecimal_signed_read_int s

end NativeBridge.Incremental.NumericSigned

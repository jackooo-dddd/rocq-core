import NumericWrite
import Mathlib.Data.Nat.Digits.Defs
noncomputable section
namespace NativeBridge.Incremental.NumericMathlib
open NativeBridge NativeBridge.Incremental NumericWrite

def Canonical {b : Nat} : List (Fin b) → Prop
  | [] => True
  | [d] => d.val ≠ 0
  | _ :: e :: ds => Canonical (e :: ds)

theorem canonical_getLast {b : Nat} (ds : List (Fin b)) (hc : Canonical ds)
    (h : ds ≠ []) : (ds.getLast h).val ≠ 0 := by
  induction ds with
  | nil => contradiction
  | cons d ds ih =>
    cases ds with
    | nil => exact hc
    | cons e es => exact ih hc (by simp)

theorem increment_nonempty (b : Nat) (hb : 2 ≤ b) (ds : List (Fin b)) :
    increment b hb ds ≠ [] := by
  cases ds with
  | nil => simp [increment]
  | cons d ds => simp only [increment]; split <;> simp

theorem canonical_cons {b : Nat} (d : Fin b) (ds : List (Fin b))
    (hne : ds ≠ []) (hc : Canonical ds) : Canonical (d :: ds) := by
  cases ds with
  | nil => contradiction
  | cons e es => exact hc

theorem canonical_increment (b : Nat) (hb : 2 ≤ b) (ds : List (Fin b))
    (hc : Canonical ds) : Canonical (increment b hb ds) := by
  induction ds with
  | nil => simp [increment,Canonical]
  | cons d ds ih =>
    cases ds with
    | nil =>
      simp only [increment]
      split
      · change d.val + 1 ≠ 0; omega
      · simp [increment,Canonical]
    | cons e es =>
      simp only [increment]
      split
      · exact canonical_cons _ (e :: es) (by simp) hc
      · exact canonical_cons _ (increment b hb (e :: es)) (increment_nonempty b hb (e :: es)) (ih hc)

theorem canonical_iterate (b : Nat) (hb : 2 ≤ b) (n : Nat) (ds : List (Fin b))
    (hc : Canonical ds) : Canonical (iterate b hb n ds) := by
  induction n generalizing ds with
  | zero => exact hc
  | succ n ih =>
    change Canonical (iterate b hb n (increment b hb ds))
    exact ih _ (canonical_increment b hb ds hc)

theorem canonical_print_positive (b : Nat) (hb : 2 ≤ b) (n : Nat) (hn : n ≠ 0) :
    Canonical (iterate b hb n [⟨0,by omega⟩]) := by
  cases n with
  | zero => contradiction
  | succ n =>
    change Canonical (iterate b hb n (increment b hb [⟨0,by omega⟩]))
    apply canonical_iterate
    simp [increment,Canonical,show 1 < b by omega]

theorem ofDigits_value (b : Nat) (ds : List (Fin b)) :
    Nat.ofDigits b (ds.map Fin.val) = value b ds := by
  induction ds with
  | nil => rfl
  | cons d ds ih => simpa [Nat.ofDigits,value] using congrArg (fun n => d.val + b * n) ih

/-- Mathlib uses little-endian digits and [] for zero; Rocq printing uses big-endian [0]. -/
theorem printDigits_eq_mathlib (b : Nat) (hb : 2 ≤ b) (n : Nat) :
    (printDigits b hb n).map Fin.val =
      if n = 0 then [0] else (Nat.digits b n).reverse := by
  by_cases hn : n = 0
  · subst n; rfl
  · rw [if_neg hn]
    let ds := iterate b hb n [⟨0,by omega⟩]
    have hv : Nat.ofDigits b (ds.map Fin.val) = n := by
      rw [ofDigits_value]
      change value b (iterate b hb n [⟨0,by omega⟩]) = n
      rw [iterate_value]
      simp [value]
    have hd : Nat.digits b n = ds.map Fin.val := by
      rw [← hv]
      apply Nat.digits_ofDigits b (by omega)
      · intro d hd
        rcases List.mem_map.mp hd with ⟨x,hx,rfl⟩
        exact x.isLt
      · intro h
        rw [List.getLast_map]
        exact canonical_getLast ds (canonical_print_positive b hb n hn) _
    change (ds.reverse.map Fin.val) = _
    rw [List.map_reverse,hd]

theorem decimal_print_mathlib (n : MN) :
    (decimalDigitsTo (Rocq.Corelib.Init.Nat.to_uint n)).map Fin.val =
      if natTo n = 0 then [0] else (Nat.digits 10 (natTo n)).reverse := by
  rw [decimal_print_agrees,printDigits_eq_mathlib]
theorem hexadecimal_print_mathlib (n : MN) :
    (hexadecimalDigitsTo (Rocq.Corelib.Init.Nat.to_hex_uint n)).map Fin.val =
      if natTo n = 0 then [0] else (Nat.digits 16 (natTo n)).reverse := by
  rw [hexadecimal_print_agrees,printDigits_eq_mathlib]
theorem decimal_signed_print_mathlib (n : MN) :
    let s := decimalSignedTo (Rocq.Corelib.Init.Nat.to_int n)
    (s.1,s.2.map Fin.val) =
      (false,if natTo n = 0 then [0] else (Nat.digits 10 (natTo n)).reverse) := by
  dsimp only
  rw [decimal_signed_print_agrees,printDigits_eq_mathlib]
theorem hexadecimal_signed_print_mathlib (n : MN) :
    let s := hexadecimalSignedTo (Rocq.Corelib.Init.Nat.to_hex_int n)
    (s.1,s.2.map Fin.val) =
      (false,if natTo n = 0 then [0] else (Nat.digits 16 (natTo n)).reverse) := by
  dsimp only
  rw [hexadecimal_signed_print_agrees,printDigits_eq_mathlib]
theorem number_decimal_print_mathlib (n : MN) :
    Sum.map (List.map Fin.val) (List.map Fin.val)
      (numberUintTo (Rocq.Corelib.Init.Nat.to_num_uint n)) =
      .inl (if natTo n = 0 then [0] else (Nat.digits 10 (natTo n)).reverse) := by
  rw [number_decimal_print_agrees]
  change Sum.inl ((printDigits 10 (by decide) (natTo n)).map Fin.val) = _
  rw [printDigits_eq_mathlib]
theorem number_hexadecimal_print_mathlib (n : MN) :
    Sum.map (List.map Fin.val) (List.map Fin.val)
      (numberUintTo (Rocq.Corelib.Init.Nat.to_num_hex_uint n)) =
      .inr (if natTo n = 0 then [0] else (Nat.digits 16 (natTo n)).reverse) := by
  rw [number_hexadecimal_print_agrees]
  change Sum.inr ((printDigits 16 (by decide) (natTo n)).map Fin.val) = _
  rw [printDigits_eq_mathlib]
theorem number_signed_print_mathlib (n : MN) :
    Sum.map (fun s => (s.1,s.2.map Fin.val)) (fun s => (s.1,s.2.map Fin.val))
      (numberSignedTo (Rocq.Corelib.Init.Nat.to_num_int n)) =
      .inl (false,if natTo n = 0 then [0] else (Nat.digits 10 (natTo n)).reverse) := by
  rw [number_signed_print_agrees]
  change Sum.inl (false,(printDigits 10 (by decide) (natTo n)).map Fin.val) = _
  rw [printDigits_eq_mathlib]

end NativeBridge.Incremental.NumericMathlib

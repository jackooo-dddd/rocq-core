import DecimalDigits

noncomputable section
namespace NativeBridge.Incremental.Decimal
open NativeBridge
local notation "U" => Rocq.Corelib.Init.Decimal.uint
local notation "S" => Rocq.Corelib.Init.Decimal.signed_int

theorem revapp_agrees (xs ys : U) :
    decimalDigitsTo (Rocq.Corelib.Init.Decimal.revapp xs ys) =
      (decimalDigitsTo xs).reverse ++ decimalDigitsTo ys := by
  induction xs generalizing ys <;>
    simp_all [Rocq.Corelib.Init.Decimal.revapp, decimalDigitsTo, List.reverse_cons, List.append_assoc]

theorem rev_agrees (xs : U) :
    decimalDigitsTo (Rocq.Corelib.Init.Decimal.rev xs) = (decimalDigitsTo xs).reverse := by
  simpa [Rocq.Corelib.Init.Decimal.rev, decimalDigitsTo] using revapp_agrees xs .Nil

theorem app_agrees (xs ys : U) :
    decimalDigitsTo (Rocq.Corelib.Init.Decimal.app xs ys) =
      decimalDigitsTo xs ++ decimalDigitsTo ys := by
  simp [Rocq.Corelib.Init.Decimal.app, revapp_agrees, rev_agrees]

theorem nb_digits_agrees (xs : U) :
    natTo (Rocq.Corelib.Init.Decimal.nb_digits xs) = (decimalDigitsTo xs).length := by
  induction xs <;> simp_all [Rocq.Corelib.Init.Decimal.nb_digits, decimalDigitsTo]

theorem nzhead_agrees (xs : U) :
    decimalDigitsTo (Rocq.Corelib.Init.Decimal.nzhead xs) =
      (decimalDigitsTo xs).dropWhile (fun d => d.val == 0) := by
  induction xs <;> simp_all [Rocq.Corelib.Init.Decimal.nzhead, decimalDigitsTo]

theorem unorm_agrees (xs : U) :
    decimalDigitsTo (Rocq.Corelib.Init.Decimal.unorm xs) =
      match (decimalDigitsTo xs).dropWhile (fun d => d.val == 0) with
      | [] => [0]
      | ds => ds := by
  rw [← nzhead_agrees]
  unfold Rocq.Corelib.Init.Decimal.unorm
  generalize Rocq.Corelib.Init.Decimal.nzhead xs = ys
  cases ys <;> rfl

/-- A sign bit and digits preserve negative zero and leading zeros. This is not an Iso with Int. -/
def signedTo (x : S) : Bool × List (Fin 10) :=
  Rocq.Corelib.Init.Decimal.signed_int.rec (fun ds => (false, decimalDigitsTo ds)) (fun ds => (true, decimalDigitsTo ds)) x

def signedOf (x : Bool × List (Fin 10)) : S :=
  if x.1 then .Neg (decimalDigitsOf x.2) else .Pos (decimalDigitsOf x.2)

theorem signed_of_to (x : S) : signedOf (signedTo x) = x := by
  cases x <;> simp [signedOf, signedTo]

theorem signed_to_of (x : Bool × List (Fin 10)) : signedTo (signedOf x) = x := by
  rcases x with ⟨s, ds⟩
  cases s <;> simp [signedTo, signedOf]

def signedIso : Iso S (Bool × List (Fin 10)) :=
  ⟨signedTo, signedOf, signed_of_to, signed_to_of⟩

theorem abs_agrees (x : S) :
    decimalDigitsTo (Rocq.Corelib.Init.Decimal.abs x) = (signedTo x).2 := by
  cases x <;> rfl

theorem opp_agrees (x : S) :
    signedTo (Rocq.Corelib.Init.Decimal.opp x) = (!(signedTo x).1, (signedTo x).2) := by
  cases x <;> rfl

theorem app_int_agrees (x : S) (ds : U) :
    signedTo (Rocq.Corelib.Init.Decimal.app_int x ds) =
      ((signedTo x).1, (signedTo x).2 ++ decimalDigitsTo ds) := by
  cases x <;> simp [Rocq.Corelib.Init.Decimal.app_int, signedTo, app_agrees]


def digitBoolTo : Rocq.Corelib.Init.Datatypes.bool → Bool :=
  Rocq.Corelib.Init.Datatypes.bool.rec true false

theorem uint_beq_agrees (xs ys : U) :
    digitBoolTo (Rocq.Corelib.Init.Decimal.uint_beq xs ys) =
      (decimalDigitsTo xs == decimalDigitsTo ys) := by
  induction xs generalizing ys <;> cases ys <;>
    simp_all [Rocq.Corelib.Init.Decimal.uint_beq, digitBoolTo, decimalDigitsTo,
      BEq.beq] <;> rfl

theorem signed_int_beq_agrees (xs ys : S) :
    digitBoolTo (Rocq.Corelib.Init.Decimal.signed_int_beq xs ys) =
      (signedTo xs == signedTo ys) := by
  cases xs <;> cases ys <;> first | exact uint_beq_agrees _ _ | rfl


/-- Canonicalize leading zeros, and canonicalize either sign of zero to positive zero. -/
theorem norm_agrees (x : S) :
    signedTo (Rocq.Corelib.Init.Decimal.norm x) =
      let ds := (signedTo x).2.dropWhile (fun d => d.val == 0)
      match ds with
      | [] => (false, [0])
      | d :: rest => ((signedTo x).1, d :: rest) := by
  cases x with
  | Pos ds =>
    simp only [Rocq.Corelib.Init.Decimal.norm, signedTo]
    rw [unorm_agrees]
    cases (decimalDigitsTo ds).dropWhile (fun d => d.val == 0) <;> rfl
  | Neg ds =>
    simp only [signedTo]
    rw [← nzhead_agrees]
    dsimp only [Rocq.Corelib.Init.Decimal.norm]
    generalize Rocq.Corelib.Init.Decimal.nzhead ds = ys
    cases ys <;> rfl

/-- Empty-input deletion is a source convention, not Lean List.drop. -/
theorem del_head_is_not_drop :
    decimalDigitsTo (Rocq.Corelib.Init.Decimal.del_head (.S .O) .Nil) ≠
      ([] : List (Fin 10)).drop 1 := by
  change ([0] : List (Fin 10)) ≠ []
  intro h
  cases h


theorem digitBool_true_iff (b : Rocq.Corelib.Init.Datatypes.bool) :
    ME Rocq.Corelib.Init.Datatypes.bool b .true ↔ digitBoolTo b = true := by
  constructor
  · intro h
    exact congrArg digitBoolTo (eqTo h)
  · intro h
    cases b with
    | true => exact eqOf rfl
    | false => change false = true at h; cases h

theorem comparison_sound_transport {A B : Type} (e : Iso A B)
    (r : A → A → Rocq.Corelib.Init.Datatypes.bool) (s : B → B → Bool)
    (hc : ∀ x y, digitBoolTo (r x y) = s (e.to x) (e.to y)) :
    (∀ x y, ME Rocq.Corelib.Init.Datatypes.bool (r x y) .true → ME A x y) ↔
      (∀ x y, s x y = true → x = y) := by
  constructor
  · intro h x y hxy
    have hr : digitBoolTo (r (e.of x) (e.of y)) = true := by
      rw [hc, e.to_of, e.to_of]
      exact hxy
    have hh := congrArg e.to (eqTo (h _ _ ((digitBool_true_iff _).mpr hr)))
    simpa only [e.to_of] using hh
  · intro h x y hxy
    apply eqOf
    apply e.injective
    apply h
    rw [← hc]
    exact (digitBool_true_iff _).mp hxy

theorem comparison_complete_transport {A B : Type} (e : Iso A B)
    (r : A → A → Rocq.Corelib.Init.Datatypes.bool) (s : B → B → Bool)
    (hc : ∀ x y, digitBoolTo (r x y) = s (e.to x) (e.to y)) :
    (∀ x y, ME A x y → ME Rocq.Corelib.Init.Datatypes.bool (r x y) .true) ↔
      (∀ x y, x = y → s x y = true) := by
  constructor
  · intro h x y hxy
    have hr := (digitBool_true_iff _).mp (h (e.of x) (e.of y) (eqOf (congrArg e.of hxy)))
    simpa only [hc, e.to_of] using hr
  · intro h x y hxy
    apply (digitBool_true_iff _).mpr
    rw [hc]
    exact h _ _ (congrArg e.to (eqTo hxy))

theorem uint_dec_bl_native :
    Rocq.Corelib.Init.Decimal.internal_uint_dec_bl.statement ↔
      (∀ x y : List (Fin 10), (x == y) = true → x = y) :=
  comparison_sound_transport decimalDigitsIso _ _ uint_beq_agrees

theorem uint_dec_lb_native :
    Rocq.Corelib.Init.Decimal.internal_uint_dec_lb.statement ↔
      (∀ x y : List (Fin 10), x = y → (x == y) = true) :=
  comparison_complete_transport decimalDigitsIso _ _ uint_beq_agrees

theorem signed_int_dec_bl_native :
    Rocq.Corelib.Init.Decimal.internal_signed_int_dec_bl.statement ↔
      (∀ x y : Bool × List (Fin 10), (x == y) = true → x = y) :=
  comparison_sound_transport signedIso _ _ signed_int_beq_agrees

theorem signed_int_dec_lb_native :
    Rocq.Corelib.Init.Decimal.internal_signed_int_dec_lb.statement ↔
      (∀ x y : Bool × List (Fin 10), x = y → (x == y) = true) :=
  comparison_complete_transport signedIso _ _ signed_int_beq_agrees

/-- Here the native statements are provable: these are proofs of the original statements too. -/
theorem uint_dec_bl_proved : Rocq.Corelib.Init.Decimal.internal_uint_dec_bl.statement :=
  uint_dec_bl_native.mpr (fun _ _ h => eq_of_beq h)

theorem uint_dec_lb_proved : Rocq.Corelib.Init.Decimal.internal_uint_dec_lb.statement :=
  uint_dec_lb_native.mpr (by intro x y h; cases h; simp)

theorem signed_int_dec_bl_proved : Rocq.Corelib.Init.Decimal.internal_signed_int_dec_bl.statement :=
  signed_int_dec_bl_native.mpr (fun _ _ h => eq_of_beq h)

theorem signed_int_dec_lb_proved : Rocq.Corelib.Init.Decimal.internal_signed_int_dec_lb.statement :=
  signed_int_dec_lb_native.mpr (by intro x y h; cases h; simp)

end NativeBridge.Incremental.Decimal

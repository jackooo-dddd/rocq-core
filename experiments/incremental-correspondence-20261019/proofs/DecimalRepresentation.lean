import DecimalOperations
set_option autoImplicit false
noncomputable section
namespace NativeBridge.Incremental.DecimalRepresentation
open NativeBridge Decimal
universe u
abbrev U := Rocq.Corelib.Init.Decimal.uint
abbrev S := Rocq.Corelib.Init.Decimal.signed_int
abbrev D := Rocq.Corelib.Init.Decimal.decimal
abbrev SignedDigits := Bool × List (Fin 10)
abbrev DecimalNative := SignedDigits × List (Fin 10) × Option SignedDigits

def decimalTo : D → DecimalNative
  | .Decimal i f => (signedTo i,decimalDigitsTo f,none)
  | .DecimalExp i f e => (signedTo i,decimalDigitsTo f,some (signedTo e))
def decimalOf (d : DecimalNative) : D :=
  match d.2.2 with
  | none => .Decimal (signedOf d.1) (decimalDigitsOf d.2.1)
  | some e => .DecimalExp (signedOf d.1) (decimalDigitsOf d.2.1) (signedOf e)
theorem decimal_of_to (d : D) : decimalOf (decimalTo d) = d := by
  cases d <;> simp [decimalOf,decimalTo,signed_of_to]
theorem decimal_to_of (d : DecimalNative) : decimalTo (decimalOf d) = d := by
  rcases d with ⟨i,f,e⟩
  cases e <;> simp [decimalOf,decimalTo,signed_to_of]
def decimalIso : Iso Rocq.Corelib.Init.Decimal.decimal DecimalNative := ⟨decimalTo,decimalOf,decimal_of_to,decimal_to_of⟩

theorem bool_and (a b : Rocq.Corelib.Init.Datatypes.bool) :
    digitBoolTo (Rocq.Corelib.Init.Datatypes.andb a b) = (digitBoolTo a && digitBoolTo b) := by
  cases a <;> cases b <;> rfl
def decimalEqual (x y : DecimalNative) : Bool := x == y
theorem decimal_beq_agrees (x y : D) :
    digitBoolTo (Rocq.Corelib.Init.Decimal.decimal_beq x y) = decimalEqual (decimalTo x) (decimalTo y) := by
  cases x <;> cases y <;>
    simp only [Rocq.Corelib.Init.Decimal.decimal_beq,decimalTo,bool_and,
      signed_int_beq_agrees,uint_beq_agrees]
  all_goals apply Bool.eq_iff_iff.mpr
  all_goals simp [decimalEqual,beq_iff_eq,digitBoolTo,Prod.mk.injEq]


def dropHead (n : Nat) (d : List (Fin 10)) : List (Fin 10) :=
  if d.length < n then [0] else d.drop n
def dropTail (n : Nat) (d : List (Fin 10)) : List (Fin 10) :=
  (dropHead n d.reverse).reverse
theorem del_head_agrees (n : MN) (d : U) :
    decimalDigitsTo (Rocq.Corelib.Init.Decimal.del_head n d) = dropHead (natTo n) (decimalDigitsTo d) := by
  induction n generalizing d with
  | O => simp [Rocq.Corelib.Init.Decimal.del_head,natTo,dropHead]
  | S n ih =>
    cases d <;>
      simp_all [Rocq.Corelib.Init.Decimal.del_head,decimalDigitsTo,natTo,dropHead,List.drop_succ_cons] <;> rfl

theorem del_tail_agrees (n : MN) (d : U) :
    decimalDigitsTo (Rocq.Corelib.Init.Decimal.del_tail n d) = dropTail (natTo n) (decimalDigitsTo d) := by
  simp [Rocq.Corelib.Init.Decimal.del_tail,dropTail,rev_agrees,del_head_agrees]
def dropHeadInt (n : Nat) (d : SignedDigits) := dropHead n d.2
def dropTailInt (n : Nat) (d : SignedDigits) := (d.1,dropTail n d.2)
theorem del_head_int_agrees (n : MN) (d : S) :
    decimalDigitsTo (Rocq.Corelib.Init.Decimal.del_head_int n d) = dropHeadInt (natTo n) (signedTo d) := by
  cases d <;> simp [Rocq.Corelib.Init.Decimal.del_head_int,dropHeadInt,signedTo,del_head_agrees]
theorem del_tail_int_agrees (n : MN) (d : S) :
    signedTo (Rocq.Corelib.Init.Decimal.del_tail_int n d) = dropTailInt (natTo n) (signedTo d) := by
  cases d <;> simp [Rocq.Corelib.Init.Decimal.del_tail_int,dropTailInt,signedTo,del_tail_agrees]

theorem uint_of_uint_agrees (d : U) :
    decimalDigitsTo (Rocq.Corelib.Init.Decimal.uint_of_uint d) = id (decimalDigitsTo d) := rfl
theorem int_of_int_agrees (d : S) :
    signedTo (Rocq.Corelib.Init.Decimal.int_of_int d) = id (signedTo d) := rfl

-- Extract only the closed local auxiliary value from the unchanged source
-- definition. Lean checks this definition and the unfolding equality below.
run_cmd Lean.Elab.Command.liftTermElabM do
  let ci ← Lean.getConstInfo "Rocq.Corelib.Init.Decimal.nztail".toName
  let .defnInfo di := ci | throwError "Expected source definition"
  let .lam _ _ (.letE _ ty value _ _) _ := di.value
    | throwError "Unexpected source auxiliary structure"
  unless !value.hasLooseBVars && !ty.hasLooseBVars do
    throwError "Auxiliary depends on an external binder"
  Lean.addDecl (.defnDecl {name := "NativeBridge.Incremental.DecimalRepresentation.sourceNZ".toName, levelParams := di.levelParams,type := ty,value := value,hints := .abbrev,safety := .safe})

abbrev DigitCountPair := Rocq.Corelib.Init.Datatypes.prod U MN
abbrev digitCountTo (x : DigitCountPair) : List (Fin 10) × Nat :=
  match x with | .pair _ _ d n => (decimalDigitsTo d,natTo n)
def trimHead (d : List (Fin 10)) : List (Fin 10) × Nat :=
  (d.dropWhile (fun x => x.val == 0),(d.takeWhile (fun x => x.val == 0)).length)
def trimTail (d : List (Fin 10)) : List (Fin 10) × Nat :=
  let x := trimHead d.reverse
  (x.1.reverse,x.2)

theorem sourceNZ_zero (d : U) :
    sourceNZ (.D0 d) =
      match sourceNZ d with | .pair _ _ r n => .pair _ _ r n.S := rfl

theorem sourceNZ_agrees (d : U) : digitCountTo (sourceNZ d) = trimHead (decimalDigitsTo d) := by
  induction d with
  | Nil => rfl
  | D0 d ih =>
    rw [sourceNZ_zero]
    cases hx : sourceNZ d with
    | pair r n =>
      rw [hx] at ih
      change (decimalDigitsTo r,natTo n+1) =
        ((decimalDigitsTo d).dropWhile (fun x => x.val == 0),
         ((decimalDigitsTo d).takeWhile (fun x => x.val == 0)).length+1)
      exact congrArg (fun x : List (Fin 10) × Nat => (x.1,x.2+1)) ih
  | D1 d ih => rfl
  | D2 d ih => rfl
  | D3 d ih => rfl
  | D4 d ih => rfl
  | D5 d ih => rfl
  | D6 d ih => rfl
  | D7 d ih => rfl
  | D8 d ih => rfl
  | D9 d ih => rfl

theorem nztail_unfold (d : U) :
    Rocq.Corelib.Init.Decimal.nztail d =
      match sourceNZ (Rocq.Corelib.Init.Decimal.rev d) with
      | .pair _ _ r n => .pair _ _ (Rocq.Corelib.Init.Decimal.rev r) n := rfl

theorem nztail_agrees (d : U) :
    digitCountTo (Rocq.Corelib.Init.Decimal.nztail d) = trimTail (decimalDigitsTo d) := by
  rw [nztail_unfold]
  have hh := sourceNZ_agrees (Rocq.Corelib.Init.Decimal.rev d)
  cases hx : sourceNZ (Rocq.Corelib.Init.Decimal.rev d) with
  | pair r n =>
    rw [hx,rev_agrees] at hh
    change (decimalDigitsTo (Rocq.Corelib.Init.Decimal.rev r),natTo n) = _
    rw [rev_agrees]
    exact congrArg (fun x : List (Fin 10) × Nat => (x.1.reverse,x.2)) hh

abbrev SignedCountPair := Rocq.Corelib.Init.Datatypes.prod S MN
abbrev signedCountTo (x : SignedCountPair) : SignedDigits × Nat :=
  match x with | .pair _ _ d n => (signedTo d,natTo n)
def trimTailInt (d : SignedDigits) : SignedDigits × Nat :=
  let x := trimTail d.2
  ((d.1,x.1),x.2)
theorem nztail_int_agrees (d : S) :
    signedCountTo (Rocq.Corelib.Init.Decimal.nztail_int d) = trimTailInt (signedTo d) := by
  cases d with
  | Pos d =>
    have hh := nztail_agrees d
    cases hx : Rocq.Corelib.Init.Decimal.nztail d with
    | pair r n =>
      rw [hx] at hh
      simp only [Rocq.Corelib.Init.Decimal.nztail_int,hx,signedCountTo,signedTo]
      exact congrArg (fun x : List (Fin 10) × Nat => ((false,x.1),x.2)) hh
  | Neg d =>
    have hh := nztail_agrees d
    cases hx : Rocq.Corelib.Init.Decimal.nztail d with
    | pair r n =>
      rw [hx] at hh
      simp only [Rocq.Corelib.Init.Decimal.nztail_int,hx,signedCountTo,signedTo]
      exact congrArg (fun x : List (Fin 10) × Nat => ((true,x.1),x.2)) hh

def littleDouble (carry : Bool) : List (Fin 10) → List (Fin 10)
  | [] => if carry then [1] else []
  | d :: ds =>
    let n := 2*d.val + (if carry then 1 else 0)
    ⟨n%10,Nat.mod_lt _ (by decide)⟩ :: littleDouble (decide (10 ≤ n)) ds

theorem little_double_pair (d : U) :
    decimalDigitsTo (Rocq.Corelib.Init.Decimal.Little.double d) = littleDouble false (decimalDigitsTo d) ∧
    decimalDigitsTo (Rocq.Corelib.Init.Decimal.Little.succ_double d) = littleDouble true (decimalDigitsTo d) := by
  induction d with
  | Nil => exact ⟨rfl,rfl⟩
  | D0 d ih =>
    constructor
    · change (0 : Fin 10) :: decimalDigitsTo (Rocq.Corelib.Init.Decimal.Little.double d) =
        (0 : Fin 10) :: littleDouble false (decimalDigitsTo d)
      exact congrArg (List.cons (0 : Fin 10)) ih.1
    · change (1 : Fin 10) :: decimalDigitsTo (Rocq.Corelib.Init.Decimal.Little.double d) =
        (1 : Fin 10) :: littleDouble false (decimalDigitsTo d)
      exact congrArg (List.cons (1 : Fin 10)) ih.1
  | D1 d ih =>
    constructor
    · change (2 : Fin 10) :: decimalDigitsTo (Rocq.Corelib.Init.Decimal.Little.double d) =
        (2 : Fin 10) :: littleDouble false (decimalDigitsTo d)
      exact congrArg (List.cons (2 : Fin 10)) ih.1
    · change (3 : Fin 10) :: decimalDigitsTo (Rocq.Corelib.Init.Decimal.Little.double d) =
        (3 : Fin 10) :: littleDouble false (decimalDigitsTo d)
      exact congrArg (List.cons (3 : Fin 10)) ih.1
  | D2 d ih =>
    constructor
    · change (4 : Fin 10) :: decimalDigitsTo (Rocq.Corelib.Init.Decimal.Little.double d) =
        (4 : Fin 10) :: littleDouble false (decimalDigitsTo d)
      exact congrArg (List.cons (4 : Fin 10)) ih.1
    · change (5 : Fin 10) :: decimalDigitsTo (Rocq.Corelib.Init.Decimal.Little.double d) =
        (5 : Fin 10) :: littleDouble false (decimalDigitsTo d)
      exact congrArg (List.cons (5 : Fin 10)) ih.1
  | D3 d ih =>
    constructor
    · change (6 : Fin 10) :: decimalDigitsTo (Rocq.Corelib.Init.Decimal.Little.double d) =
        (6 : Fin 10) :: littleDouble false (decimalDigitsTo d)
      exact congrArg (List.cons (6 : Fin 10)) ih.1
    · change (7 : Fin 10) :: decimalDigitsTo (Rocq.Corelib.Init.Decimal.Little.double d) =
        (7 : Fin 10) :: littleDouble false (decimalDigitsTo d)
      exact congrArg (List.cons (7 : Fin 10)) ih.1
  | D4 d ih =>
    constructor
    · change (8 : Fin 10) :: decimalDigitsTo (Rocq.Corelib.Init.Decimal.Little.double d) =
        (8 : Fin 10) :: littleDouble false (decimalDigitsTo d)
      exact congrArg (List.cons (8 : Fin 10)) ih.1
    · change (9 : Fin 10) :: decimalDigitsTo (Rocq.Corelib.Init.Decimal.Little.double d) =
        (9 : Fin 10) :: littleDouble false (decimalDigitsTo d)
      exact congrArg (List.cons (9 : Fin 10)) ih.1
  | D5 d ih =>
    constructor
    · change (0 : Fin 10) :: decimalDigitsTo (Rocq.Corelib.Init.Decimal.Little.succ_double d) =
        (0 : Fin 10) :: littleDouble true (decimalDigitsTo d)
      exact congrArg (List.cons (0 : Fin 10)) ih.2
    · change (1 : Fin 10) :: decimalDigitsTo (Rocq.Corelib.Init.Decimal.Little.succ_double d) =
        (1 : Fin 10) :: littleDouble true (decimalDigitsTo d)
      exact congrArg (List.cons (1 : Fin 10)) ih.2
  | D6 d ih =>
    constructor
    · change (2 : Fin 10) :: decimalDigitsTo (Rocq.Corelib.Init.Decimal.Little.succ_double d) =
        (2 : Fin 10) :: littleDouble true (decimalDigitsTo d)
      exact congrArg (List.cons (2 : Fin 10)) ih.2
    · change (3 : Fin 10) :: decimalDigitsTo (Rocq.Corelib.Init.Decimal.Little.succ_double d) =
        (3 : Fin 10) :: littleDouble true (decimalDigitsTo d)
      exact congrArg (List.cons (3 : Fin 10)) ih.2
  | D7 d ih =>
    constructor
    · change (4 : Fin 10) :: decimalDigitsTo (Rocq.Corelib.Init.Decimal.Little.succ_double d) =
        (4 : Fin 10) :: littleDouble true (decimalDigitsTo d)
      exact congrArg (List.cons (4 : Fin 10)) ih.2
    · change (5 : Fin 10) :: decimalDigitsTo (Rocq.Corelib.Init.Decimal.Little.succ_double d) =
        (5 : Fin 10) :: littleDouble true (decimalDigitsTo d)
      exact congrArg (List.cons (5 : Fin 10)) ih.2
  | D8 d ih =>
    constructor
    · change (6 : Fin 10) :: decimalDigitsTo (Rocq.Corelib.Init.Decimal.Little.succ_double d) =
        (6 : Fin 10) :: littleDouble true (decimalDigitsTo d)
      exact congrArg (List.cons (6 : Fin 10)) ih.2
    · change (7 : Fin 10) :: decimalDigitsTo (Rocq.Corelib.Init.Decimal.Little.succ_double d) =
        (7 : Fin 10) :: littleDouble true (decimalDigitsTo d)
      exact congrArg (List.cons (7 : Fin 10)) ih.2
  | D9 d ih =>
    constructor
    · change (8 : Fin 10) :: decimalDigitsTo (Rocq.Corelib.Init.Decimal.Little.succ_double d) =
        (8 : Fin 10) :: littleDouble true (decimalDigitsTo d)
      exact congrArg (List.cons (8 : Fin 10)) ih.2
    · change (9 : Fin 10) :: decimalDigitsTo (Rocq.Corelib.Init.Decimal.Little.succ_double d) =
        (9 : Fin 10) :: littleDouble true (decimalDigitsTo d)
      exact congrArg (List.cons (9 : Fin 10)) ih.2

theorem little_double_agrees (d : U) :
    decimalDigitsTo (Rocq.Corelib.Init.Decimal.Little.double d) = littleDouble false (decimalDigitsTo d) :=
  (little_double_pair d).1
theorem little_succ_double_agrees (d : U) :
    decimalDigitsTo (Rocq.Corelib.Init.Decimal.Little.succ_double d) = littleDouble true (decimalDigitsTo d) :=
  (little_double_pair d).2

def digitsRec (P : List (Fin 10) → Sort u) (nil : P [])
    (cons : ∀ d ds, P ds → P (d::ds)) (ds : List (Fin 10)) : P ds := List.rec nil cons ds

theorem uint_rect_agrees (P : List (Fin 10) → Sort u)
    (nil : P []) (cons : ∀ d ds, P ds → P (d :: ds)) (d : U) :
    Rocq.Corelib.Init.Decimal.uint_rect (fun d => P (decimalDigitsTo d)) nil
      (fun d ih => cons 0 (decimalDigitsTo d) ih)
      (fun d ih => cons 1 (decimalDigitsTo d) ih)
      (fun d ih => cons 2 (decimalDigitsTo d) ih)
      (fun d ih => cons 3 (decimalDigitsTo d) ih)
      (fun d ih => cons 4 (decimalDigitsTo d) ih)
      (fun d ih => cons 5 (decimalDigitsTo d) ih)
      (fun d ih => cons 6 (decimalDigitsTo d) ih)
      (fun d ih => cons 7 (decimalDigitsTo d) ih)
      (fun d ih => cons 8 (decimalDigitsTo d) ih)
      (fun d ih => cons 9 (decimalDigitsTo d) ih)
      d = digitsRec P nil cons (decimalDigitsTo d) := by
  induction d with
  | Nil => rfl
  | D0 d ih => exact congrArg (cons 0 (decimalDigitsTo d)) ih
  | D1 d ih => exact congrArg (cons 1 (decimalDigitsTo d)) ih
  | D2 d ih => exact congrArg (cons 2 (decimalDigitsTo d)) ih
  | D3 d ih => exact congrArg (cons 3 (decimalDigitsTo d)) ih
  | D4 d ih => exact congrArg (cons 4 (decimalDigitsTo d)) ih
  | D5 d ih => exact congrArg (cons 5 (decimalDigitsTo d)) ih
  | D6 d ih => exact congrArg (cons 6 (decimalDigitsTo d)) ih
  | D7 d ih => exact congrArg (cons 7 (decimalDigitsTo d)) ih
  | D8 d ih => exact congrArg (cons 8 (decimalDigitsTo d)) ih
  | D9 d ih => exact congrArg (cons 9 (decimalDigitsTo d)) ih

theorem uint_rec_agrees (P : List (Fin 10) → Type)
    (nil : P []) (cons : ∀ d ds, P ds → P (d :: ds)) (d : U) :
    Rocq.Corelib.Init.Decimal.uint_rec (fun d => P (decimalDigitsTo d)) nil
      (fun d ih => cons 0 (decimalDigitsTo d) ih)
      (fun d ih => cons 1 (decimalDigitsTo d) ih)
      (fun d ih => cons 2 (decimalDigitsTo d) ih)
      (fun d ih => cons 3 (decimalDigitsTo d) ih)
      (fun d ih => cons 4 (decimalDigitsTo d) ih)
      (fun d ih => cons 5 (decimalDigitsTo d) ih)
      (fun d ih => cons 6 (decimalDigitsTo d) ih)
      (fun d ih => cons 7 (decimalDigitsTo d) ih)
      (fun d ih => cons 8 (decimalDigitsTo d) ih)
      (fun d ih => cons 9 (decimalDigitsTo d) ih)
      d = digitsRec P nil cons (decimalDigitsTo d) := by
  induction d with
  | Nil => rfl
  | D0 d ih => exact congrArg (cons 0 (decimalDigitsTo d)) ih
  | D1 d ih => exact congrArg (cons 1 (decimalDigitsTo d)) ih
  | D2 d ih => exact congrArg (cons 2 (decimalDigitsTo d)) ih
  | D3 d ih => exact congrArg (cons 3 (decimalDigitsTo d)) ih
  | D4 d ih => exact congrArg (cons 4 (decimalDigitsTo d)) ih
  | D5 d ih => exact congrArg (cons 5 (decimalDigitsTo d)) ih
  | D6 d ih => exact congrArg (cons 6 (decimalDigitsTo d)) ih
  | D7 d ih => exact congrArg (cons 7 (decimalDigitsTo d)) ih
  | D8 d ih => exact congrArg (cons 8 (decimalDigitsTo d)) ih
  | D9 d ih => exact congrArg (cons 9 (decimalDigitsTo d)) ih

def digitInduction : Prop :=
  ∀ P : List (Fin 10) → Prop, P [] → (∀ d ds, P ds → P (d::ds)) → ∀ ds, P ds
theorem digit_ind_native : digitInduction := fun _P nil cons => List.rec nil cons
theorem uint_ind_proof : Rocq.Corelib.Init.Decimal.uint_ind.statement := by
  intro P nil h0 h1 h2 h3 h4 h5 h6 h7 h8 h9 d
  induction d with
  | Nil => exact nil
  | D0 d ih => exact h0 d ih
  | D1 d ih => exact h1 d ih
  | D2 d ih => exact h2 d ih
  | D3 d ih => exact h3 d ih
  | D4 d ih => exact h4 d ih
  | D5 d ih => exact h5 d ih
  | D6 d ih => exact h6 d ih
  | D7 d ih => exact h7 d ih
  | D8 d ih => exact h8 d ih
  | D9 d ih => exact h9 d ih

theorem uint_sind_proof : Rocq.Corelib.Init.Decimal.uint_sind.statement := uint_ind_proof
theorem uint_ind_correspondence : Rocq.Corelib.Init.Decimal.uint_ind.statement ↔ digitInduction :=
  ⟨fun _ => digit_ind_native,fun _ => uint_ind_proof⟩
theorem uint_sind_correspondence : Rocq.Corelib.Init.Decimal.uint_sind.statement ↔ digitInduction :=
  ⟨fun _ => digit_ind_native,fun _ => uint_sind_proof⟩

theorem digitBool_injective (a b : Rocq.Corelib.Init.Datatypes.bool)
    (h : digitBoolTo a = digitBoolTo b) : a = b := by
  cases a <;> cases b <;> simp_all [digitBoolTo]

def equalitySound : Prop := ∀ x y : DecimalNative, decimalEqual x y = true → x = y
def equalityComplete : Prop := ∀ x y : DecimalNative, x = y → decimalEqual x y = true
theorem equality_sound_native : equalitySound := by intro x y h; simpa [decimalEqual] using h
theorem equality_complete_native : equalityComplete := by intro x y h; simp [decimalEqual,h]
theorem decimal_dec_bl_proof : Rocq.Corelib.Init.Decimal.internal_decimal_dec_bl.statement := by
  intro x y h
  have hh := congrArg digitBoolTo (eqTo h)
  rw [decimal_beq_agrees] at hh
  exact eqOf (decimalIso.injective (equality_sound_native _ _ hh))
theorem decimal_dec_lb_proof : Rocq.Corelib.Init.Decimal.internal_decimal_dec_lb.statement := by
  intro x y h
  have he := eqTo h
  subst y
  apply eqOf
  apply digitBool_injective
  rw [decimal_beq_agrees]
  exact equality_complete_native _ _ rfl
theorem decimal_dec_bl_correspondence :
    Rocq.Corelib.Init.Decimal.internal_decimal_dec_bl.statement ↔ equalitySound :=
  ⟨fun _ => equality_sound_native,fun _ => decimal_dec_bl_proof⟩
theorem decimal_dec_lb_correspondence :
    Rocq.Corelib.Init.Decimal.internal_decimal_dec_lb.statement ↔ equalityComplete :=
  ⟨fun _ => equality_complete_native,fun _ => decimal_dec_lb_proof⟩

def nativeDecision {A : Type} [DecidableEq A] (x y : A) : Decidable (x = y) := inferInstance

def eqDecisionTo {A B : Type} (e : Iso A B) (x y : A)
    (d : Rocq.Corelib.Init.Specif.sumbool (ME A x y) (Rocq.Corelib.Init.Logic.not (ME A x y))) :
    Decidable (e.to x = e.to y) :=
  match d with
  | .left _ _ h => .isTrue (congrArg e.to (eqTo h))
  | .right _ _ h => .isFalse (fun he => by cases h (eqOf (e.injective he)))


theorem uint_dec_bl_proof : Rocq.Corelib.Init.Decimal.internal_uint_dec_bl.statement := by
  intro x y h
  have hh := congrArg digitBoolTo (eqTo h)
  rw [uint_beq_agrees] at hh
  apply eqOf
  apply decimalDigitsIso.injective
  simpa only [digitBoolTo, beq_iff_eq, decimalDigitsIso] using hh
theorem uint_dec_lb_proof : Rocq.Corelib.Init.Decimal.internal_uint_dec_lb.statement := by
  intro x y h
  have he := eqTo h
  subst y
  apply eqOf
  apply digitBool_injective
  rw [uint_beq_agrees]
  simp [digitBoolTo]

theorem signed_int_dec_bl_proof : Rocq.Corelib.Init.Decimal.internal_signed_int_dec_bl.statement := by
  intro x y h
  have hh := congrArg digitBoolTo (eqTo h)
  rw [signed_int_beq_agrees] at hh
  apply eqOf
  apply signedIso.injective
  simpa only [digitBoolTo, beq_iff_eq, signedIso] using hh
theorem signed_int_dec_lb_proof : Rocq.Corelib.Init.Decimal.internal_signed_int_dec_lb.statement := by
  intro x y h
  have he := eqTo h
  subst y
  apply eqOf
  apply digitBool_injective
  rw [signed_int_beq_agrees]
  simp [digitBoolTo]

theorem uint_eq_obligation_1 : Rocq.Corelib.Init.Decimal.uint_eq_dec__rocq2lean_obligation_1.statement :=
  fun _ _ => .eq_refl _ _
theorem uint_eq_obligation_2 : Rocq.Corelib.Init.Decimal.uint_eq_dec__rocq2lean_obligation_2.statement :=
  fun _ _ => .eq_refl _ _
theorem uint_eq_obligation_3 :
    @RocqPending.Corelib.Init.Decimal.uint_eq_dec__rocq2lean_obligation_3.statement uint_eq_obligation_1 uint_eq_obligation_2 := by
  intro x y
  exact fun h _ => uint_dec_bl_proof x y h
theorem uint_eq_obligation_4 :
    @RocqPending.Corelib.Init.Decimal.uint_eq_dec__rocq2lean_obligation_4.statement uint_eq_obligation_1 uint_eq_obligation_2 := by
  intro x y
  dsimp only
  intro h _
  intro he
  have ht := uint_dec_lb_proof x y he
  have hf := (eqTo h).symm.trans (eqTo ht)
  have impossible : (false : Bool) = true := congrArg digitBoolTo hf
  cases impossible

def uintDecisionClosed (x y : U) :=
  @RocqPending.Corelib.Init.Decimal.uint_eq_dec
    uint_eq_obligation_1 uint_eq_obligation_2 uint_eq_obligation_3 uint_eq_obligation_4 x y

theorem uint_eq_dec_agrees (x y : U) :
    eqDecisionTo decimalDigitsIso x y (@RocqPending.Corelib.Init.Decimal.uint_eq_dec uint_eq_obligation_1 uint_eq_obligation_2 uint_eq_obligation_3 uint_eq_obligation_4 x y) =
      nativeDecision (decimalDigitsTo x) (decimalDigitsTo y) :=
  Subsingleton.elim _ _

theorem signed_int_eq_obligation_1 : Rocq.Corelib.Init.Decimal.signed_int_eq_dec__rocq2lean_obligation_1.statement :=
  fun _ _ => .eq_refl _ _
theorem signed_int_eq_obligation_2 : Rocq.Corelib.Init.Decimal.signed_int_eq_dec__rocq2lean_obligation_2.statement :=
  fun _ _ => .eq_refl _ _
theorem signed_int_eq_obligation_3 :
    @RocqPending.Corelib.Init.Decimal.signed_int_eq_dec__rocq2lean_obligation_3.statement signed_int_eq_obligation_1 signed_int_eq_obligation_2 := by
  intro x y
  exact fun h _ => signed_int_dec_bl_proof x y h
theorem signed_int_eq_obligation_4 :
    @RocqPending.Corelib.Init.Decimal.signed_int_eq_dec__rocq2lean_obligation_4.statement signed_int_eq_obligation_1 signed_int_eq_obligation_2 := by
  intro x y
  dsimp only
  intro h _
  intro he
  have ht := signed_int_dec_lb_proof x y he
  have hf := (eqTo h).symm.trans (eqTo ht)
  have impossible : (false : Bool) = true := congrArg digitBoolTo hf
  cases impossible

def signed_intDecisionClosed (x y : S) :=
  @RocqPending.Corelib.Init.Decimal.signed_int_eq_dec
    signed_int_eq_obligation_1 signed_int_eq_obligation_2 signed_int_eq_obligation_3 signed_int_eq_obligation_4 x y

theorem signed_int_eq_dec_agrees (x y : S) :
    eqDecisionTo signedIso x y (@RocqPending.Corelib.Init.Decimal.signed_int_eq_dec signed_int_eq_obligation_1 signed_int_eq_obligation_2 signed_int_eq_obligation_3 signed_int_eq_obligation_4 x y) =
      nativeDecision (signedTo x) (signedTo y) :=
  Subsingleton.elim _ _

theorem decimal_eq_obligation_1 : Rocq.Corelib.Init.Decimal.decimal_eq_dec__rocq2lean_obligation_1.statement :=
  fun _ _ => .eq_refl _ _
theorem decimal_eq_obligation_2 : Rocq.Corelib.Init.Decimal.decimal_eq_dec__rocq2lean_obligation_2.statement :=
  fun _ _ => .eq_refl _ _
theorem decimal_eq_obligation_3 :
    @RocqPending.Corelib.Init.Decimal.decimal_eq_dec__rocq2lean_obligation_3.statement decimal_eq_obligation_1 decimal_eq_obligation_2 := by
  intro x y
  exact fun h _ => decimal_dec_bl_proof x y h
theorem decimal_eq_obligation_4 :
    @RocqPending.Corelib.Init.Decimal.decimal_eq_dec__rocq2lean_obligation_4.statement decimal_eq_obligation_1 decimal_eq_obligation_2 := by
  intro x y
  dsimp only
  intro h _
  intro he
  have ht := decimal_dec_lb_proof x y he
  have hf := (eqTo h).symm.trans (eqTo ht)
  have impossible : (false : Bool) = true := congrArg digitBoolTo hf
  cases impossible

def decimalDecisionClosed (x y : D) :=
  @RocqPending.Corelib.Init.Decimal.decimal_eq_dec
    decimal_eq_obligation_1 decimal_eq_obligation_2 decimal_eq_obligation_3 decimal_eq_obligation_4 x y

theorem decimal_eq_dec_agrees (x y : D) :
    eqDecisionTo decimalIso x y (@RocqPending.Corelib.Init.Decimal.decimal_eq_dec decimal_eq_obligation_1 decimal_eq_obligation_2 decimal_eq_obligation_3 decimal_eq_obligation_4 x y) =
      nativeDecision (decimalTo x) (decimalTo y) :=
  Subsingleton.elim _ _

theorem trailing_zeros_example :
    digitCountTo (Rocq.Corelib.Init.Decimal.nztail (.D1 (.D2 (.D3 (.D0 (.D0 .Nil)))))) = ([1,2,3],2) := rfl
theorem delete_exact_example :
    decimalDigitsTo (Rocq.Corelib.Init.Decimal.del_head (.S .O) (.D5 .Nil)) = [] := rfl
theorem delete_overshoot_example :
    decimalDigitsTo (Rocq.Corelib.Init.Decimal.del_head (.S (.S .O)) (.D5 .Nil)) = [0] := rfl
theorem little_double_example :
    decimalDigitsTo (Rocq.Corelib.Init.Decimal.Little.double (.D5 (.D9 .Nil))) = [0,9,1] := rfl
theorem negative_zero_distinct :
    decimalTo (.Decimal (.Neg (.D0 .Nil)) .Nil) ≠
      decimalTo (.Decimal (.Pos (.D0 .Nil)) .Nil) := by decide

end NativeBridge.Incremental.DecimalRepresentation

open Lean Meta Elab Command
private partial def indexedNativeRefs (e : Expr) (seen : NameSet := {}) : MetaM (Array Name) := do
  let mut found : Array Name := #[]
  let mut seen := seen
  for n in e.getUsedConstants do
    if seen.contains n then continue
    seen := seen.insert n
    let s := n.toString
    if s.startsWith "Rocq." || s.startsWith "RocqPending." || s.startsWith "Rocq2Lean." then
      found := found.push n
    else if s.startsWith "NativeBridge." then
      let ci ← getConstInfo n
      let body? := match ci with
        | .defnInfo v => some v.value
        | .thmInfo v => some v.value
        | .opaqueInfo v => some v.value
        | _ => none
      if let some body := body? then
        found := found ++ (← indexedNativeRefs body seen)
  return found


open Lean in
run_cmd Lean.Elab.Command.liftTermElabM do
  for name in ["NativeBridge.Incremental.DecimalRepresentation.DecimalNative", "NativeBridge.Incremental.DecimalRepresentation.decimalEqual", "NativeBridge.Incremental.DecimalRepresentation.digitInduction", "NativeBridge.Incremental.DecimalRepresentation.digitsRec", "NativeBridge.Incremental.DecimalRepresentation.dropHead", "NativeBridge.Incremental.DecimalRepresentation.dropHeadInt", "NativeBridge.Incremental.DecimalRepresentation.dropTail", "NativeBridge.Incremental.DecimalRepresentation.dropTailInt", "NativeBridge.Incremental.DecimalRepresentation.equalityComplete", "NativeBridge.Incremental.DecimalRepresentation.equalitySound", "NativeBridge.Incremental.DecimalRepresentation.littleDouble", "NativeBridge.Incremental.DecimalRepresentation.nativeDecision", "NativeBridge.Incremental.DecimalRepresentation.trimTail", "NativeBridge.Incremental.DecimalRepresentation.trimTailInt", "id"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

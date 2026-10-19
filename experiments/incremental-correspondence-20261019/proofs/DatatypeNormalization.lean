import DatatypeElimination
import BooleanEquality
noncomputable section
namespace NativeBridge.Incremental.DatatypeNormalization
open NativeBridge NativeBridge.Incremental
universe u v w

-- Sort-polymorphic bridge only; the mechanical definitions are unchanged.
-- Existing Type-specialized bridges still give List A / Option A / Except E A.
def fullListTo {A : Sort u} : Rocq.Corelib.Init.Datatypes.list A → List (PLift A) :=
  Rocq.Corelib.Init.Datatypes.list.rec [] (fun a _ xs => PLift.up a :: xs)
def fullListOf {A : Sort u} : List (PLift A) → Rocq.Corelib.Init.Datatypes.list A
  | [] => .nil A
  | a :: xs => .cons A a.down (fullListOf xs)
@[simp] theorem fullList_of_to {A : Sort u} (xs : Rocq.Corelib.Init.Datatypes.list A) :
    fullListOf (fullListTo xs) = xs := by
  induction xs with
  | nil => rfl
  | cons a xs ih => change Rocq.Corelib.Init.Datatypes.list.cons A a (fullListOf (fullListTo xs)) = _; rw [ih]
@[simp] theorem fullList_to_of {A : Sort u} (xs : List (PLift A)) :
    fullListTo (fullListOf xs) = xs := by
  induction xs with
  | nil => rfl
  | cons a xs ih => change PLift.up a.down :: fullListTo (fullListOf xs) = a :: xs; rw [ih]
def fullListIso (A : Sort u) : Iso (Rocq.Corelib.Init.Datatypes.list A) (List (PLift A)) :=
  ⟨fullListTo,fullListOf,fullList_of_to,fullList_to_of⟩

def fullOptionTo {A : Sort u} : Rocq.Corelib.Init.Datatypes.option A → Option (PLift A) :=
  Rocq.Corelib.Init.Datatypes.option.rec (fun a => some (PLift.up a)) none
def fullOptionOf {A : Sort u} : Option (PLift A) → Rocq.Corelib.Init.Datatypes.option A
  | some a => .Some A a.down
  | none => .None A
@[simp] theorem fullOption_of_to {A : Sort u} (x : Rocq.Corelib.Init.Datatypes.option A) :
    fullOptionOf (fullOptionTo x) = x := by cases x <;> rfl
@[simp] theorem fullOption_to_of {A : Sort u} (x : Option (PLift A)) :
    fullOptionTo (fullOptionOf x) = x := by cases x <;> rfl
def fullOptionIso (A : Sort u) : Iso (Rocq.Corelib.Init.Datatypes.option A) (Option (PLift A)) :=
  ⟨fullOptionTo,fullOptionOf,fullOption_of_to,fullOption_to_of⟩

def fullResultTo {A : Sort u} {E : Sort v} :
    Rocq.Corelib.Init.Datatypes.result A E → Except (PLift E) (PLift A) :=
  Rocq.Corelib.Init.Datatypes.result.rec (fun a => .ok (PLift.up a)) (fun e => .error (PLift.up e))
def fullResultOf {A : Sort u} {E : Sort v} :
    Except (PLift E) (PLift A) → Rocq.Corelib.Init.Datatypes.result A E
  | .ok a => .Ok A E a.down
  | .error e => .Error A E e.down
@[simp] theorem fullResult_of_to {A : Sort u} {E : Sort v} (x : Rocq.Corelib.Init.Datatypes.result A E) :
    fullResultOf (fullResultTo x) = x := by cases x <;> rfl
@[simp] theorem fullResult_to_of {A : Sort u} {E : Sort v} (x : Except (PLift E) (PLift A)) :
    fullResultTo (fullResultOf x) = x := by cases x <;> rfl
def fullResultIso (A : Sort u) (E : Sort v) :
    Iso (Rocq.Corelib.Init.Datatypes.result A E) (Except (PLift E) (PLift A)) :=
  ⟨fullResultTo,fullResultOf,fullResult_of_to,fullResult_to_of⟩

theorem mechanical_eq {A : Sort u} (x y : A) :
    Rocq.Corelib.Init.Logic.eq A x y ↔ x = y := by
  constructor
  · intro h; cases h; rfl
  · intro h; cases h; exact .eq_refl A x
theorem mechanical_not (P : Prop) : Rocq.Corelib.Init.Logic.not P ↔ ¬P := by
  constructor
  · intro h hp; cases h hp
  · intro h hp; exact (h hp).elim
theorem mechanical_and (P Q : Prop) : Rocq.Corelib.Init.Logic.and P Q ↔ P ∧ Q := by
  constructor
  · intro h; cases h with | conj hp hq => exact ⟨hp,hq⟩
  · intro h; exact .conj P Q h.1 h.2
theorem mechanical_iff (P Q : Prop) : Rocq.Corelib.Init.Logic.iff P Q ↔ (P ↔ Q) := by
  unfold Rocq.Corelib.Init.Logic.iff
  rw [mechanical_and]; exact ⟨fun h => ⟨h.1,h.2⟩,fun h => ⟨h.mp,h.mpr⟩⟩

theorem boolTo_true : boolTo Rocq.Corelib.Init.Datatypes.bool.true = true := rfl
theorem boolTo_false : boolTo Rocq.Corelib.Init.Datatypes.bool.false = false := rfl
theorem comparisonTo_eq : comparisonTo Rocq.Corelib.Init.Datatypes.comparison.Eq = Ordering.eq := rfl
theorem comparisonTo_lt : comparisonTo Rocq.Corelib.Init.Datatypes.comparison.Lt = Ordering.lt := rfl
theorem comparisonTo_gt : comparisonTo Rocq.Corelib.Init.Datatypes.comparison.Gt = Ordering.gt := rfl
theorem unitTo_tt : unitIso.to Rocq.Corelib.Init.Datatypes.unit.tt = () := rfl
theorem fullList_nil {A : Sort u} : fullListTo (Rocq.Corelib.Init.Datatypes.list.nil A) = [] := rfl
theorem fullList_cons {A : Sort u} (x : A) (xs : Rocq.Corelib.Init.Datatypes.list A) :
    fullListTo (Rocq.Corelib.Init.Datatypes.list.cons A x xs) = PLift.up x :: fullListTo xs := rfl
theorem fullOption_some {A : Sort u} (x : A) :
    fullOptionTo (Rocq.Corelib.Init.Datatypes.option.Some A x) = some (PLift.up x) := rfl
theorem fullOption_none {A : Sort u} :
    fullOptionTo (Rocq.Corelib.Init.Datatypes.option.None A) = none := rfl
theorem fullResult_ok {A : Sort u} {E : Sort v} (x : A) :
    fullResultTo (Rocq.Corelib.Init.Datatypes.result.Ok A E x) = Except.ok (PLift.up x) := rfl
theorem fullResult_error {A : Sort u} {E : Sort v} (x : E) :
    fullResultTo (Rocq.Corelib.Init.Datatypes.result.Error A E x) = Except.error (PLift.up x) := rfl
theorem pprod_pair {A : Sort u} {B : Sort v} (x : A) (y : B) :
    pprodTo (Rocq.Corelib.Init.Datatypes.prod.pair A B x y) = PProd.mk x y := rfl
theorem psum_inl {A : Sort u} {B : Sort v} (x : A) :
    psumTo (Rocq.Corelib.Init.Datatypes.sum.inl A B x) = PSum.inl x := rfl
theorem psum_inr {A : Sort u} {B : Sort v} (x : B) :
    psumTo (Rocq.Corelib.Init.Datatypes.sum.inr A B x) = PSum.inr x := rfl
theorem pprod_fst {A : Sort u} {B : Sort v} (x : Rocq.Corelib.Init.Datatypes.prod A B) :
    Rocq.Corelib.Init.Datatypes.fst A B x = (pprodTo x).fst := by cases x <;> rfl
theorem pprod_snd {A : Sort u} {B : Sort v} (x : Rocq.Corelib.Init.Datatypes.prod A B) :
    Rocq.Corelib.Init.Datatypes.snd A B x = (pprodTo x).snd := by cases x <;> rfl


def boolSpec (P Q : Prop) (b : Bool) : Prop := if b then P else Q
def compareSpec (Peq Plt Pgt : Prop) : Ordering → Prop
  | .eq => Peq
  | .lt => Plt
  | .gt => Pgt
theorem boolSpec_agrees (P Q : Prop) (b : RBool) :
    Rocq.Corelib.Init.Datatypes.BoolSpec P Q b ↔ boolSpec P Q (boolTo b) := by
  constructor
  · intro h; cases h with
    | BoolSpecT hp => exact hp
    | BoolSpecF hq => exact hq
  · cases b with
    | true => intro h; exact .BoolSpecT P Q h
    | false => intro h; exact .BoolSpecF P Q h
theorem compareSpec_agrees (Peq Plt Pgt : Prop) (c : RComparison) :
    Rocq.Corelib.Init.Datatypes.CompareSpec Peq Plt Pgt c ↔ compareSpec Peq Plt Pgt (comparisonTo c) := by
  constructor
  · intro h; cases h with
    | CompEq hp => exact hp
    | CompLt hp => exact hp
    | CompGt hp => exact hp
  · cases c with
    | Eq => intro h; exact .CompEq Peq Plt Pgt h
    | Lt => intro h; exact .CompLt Peq Plt Pgt h
    | Gt => intro h; exact .CompGt Peq Plt Pgt h
theorem compSpec_agrees {A : Sort u} (eq lt : A → A → Prop) (x y : A) (c : RComparison) :
    Rocq.Corelib.Init.Datatypes.CompSpec A eq lt x y c ↔
      compareSpec (eq x y) (lt x y) (lt y x) (comparisonTo c) :=
  compareSpec_agrees _ _ _ c

def compareSpecTTo {Peq Plt Pgt : Prop} {c : RComparison} :
    Rocq.Corelib.Init.Datatypes.CompareSpecT Peq Plt Pgt c →
      PLift (compareSpec Peq Plt Pgt (comparisonTo c)) := by
  intro h; cases h with
  | CompEqT hp => exact ⟨hp⟩
  | CompLtT hp => exact ⟨hp⟩
  | CompGtT hp => exact ⟨hp⟩
def compareSpecTOf {Peq Plt Pgt : Prop} {c : RComparison} :
    PLift (compareSpec Peq Plt Pgt (comparisonTo c)) →
      Rocq.Corelib.Init.Datatypes.CompareSpecT Peq Plt Pgt c := by
  intro h; cases c with
  | Eq => exact .CompEqT Peq Plt Pgt h.down
  | Lt => exact .CompLtT Peq Plt Pgt h.down
  | Gt => exact .CompGtT Peq Plt Pgt h.down
@[simp] theorem compareSpecT_of_to {Peq Plt Pgt : Prop} {c : RComparison}
    (h : Rocq.Corelib.Init.Datatypes.CompareSpecT Peq Plt Pgt c) :
    compareSpecTOf (compareSpecTTo h) = h := by cases h <;> rfl
@[simp] theorem compareSpecT_to_of {Peq Plt Pgt : Prop} {c : RComparison}
    (h : PLift (compareSpec Peq Plt Pgt (comparisonTo c))) :
    compareSpecTTo (compareSpecTOf h) = h := by cases c <;> cases h <;> rfl
def compareSpecTIso (Peq Plt Pgt : Prop) (c : RComparison) :
    Iso (Rocq.Corelib.Init.Datatypes.CompareSpecT Peq Plt Pgt c)
      (PLift (compareSpec Peq Plt Pgt (comparisonTo c))) :=
  ⟨compareSpecTTo,compareSpecTOf,compareSpecT_of_to,compareSpecT_to_of⟩
def compSpecTIso {A : Type u} (eq lt : A → A → Prop) (x y : A) (c : RComparison) :
    Iso (Rocq.Corelib.Init.Datatypes.CompSpecT A eq lt x y c)
      (PLift (compareSpec (eq x y) (lt x y) (lt y x) (comparisonTo c))) :=
  compareSpecTIso _ _ _ c

theorem compareSpecT_forall {Peq Plt Pgt : Prop} {c : RComparison}
    (F : Rocq.Corelib.Init.Datatypes.CompareSpecT Peq Plt Pgt c → Prop) :
    (∀ h, F h) ↔ ∀ h : PLift (compareSpec Peq Plt Pgt (comparisonTo c)), F (compareSpecTOf h) := by
  constructor
  · intro h x; exact h _
  · intro h x; simpa only [compareSpecT_of_to] using h (compareSpecTTo x)
theorem compareSpecT_family_forall {Peq Plt Pgt : Prop}
    (F : ((c : RComparison) → Rocq.Corelib.Init.Datatypes.CompareSpecT Peq Plt Pgt c → Prop) → Prop) :
    (∀ f, F f) ↔ ∀ f : (c : RComparison) → PLift (compareSpec Peq Plt Pgt (comparisonTo c)) → Prop,
      F (fun c h => f c (compareSpecTTo h)) := by
  constructor
  · intro h f; exact h _
  · intro h f; simpa only [compareSpecT_of_to] using h (fun c h => f c (compareSpecTOf h))
def comparisonDepOf {C : Ordering → Sort u}
    (f : (c : RComparison) → C (comparisonTo c)) : (c : Ordering) → C c
  | .eq => f .Eq
  | .lt => f .Lt
  | .gt => f .Gt
theorem comparison_dependent_family_forall {C : Ordering → Sort u}
    (F : ((c : RComparison) → C (comparisonTo c)) → Prop) :
    (∀ f, F f) ↔ ∀ f : (c : Ordering) → C c, F (fun c => f (comparisonTo c)) := by
  constructor
  · intro h f; exact h _
  · intro h f
    have hf : (fun c => comparisonDepOf f (comparisonTo c)) = f := by funext c; cases c <;> rfl
    simpa only [hf] using h (comparisonDepOf f)
theorem compareSpecT_eq {Peq Plt Pgt : Prop} (h : Peq) :
    compareSpecTTo (Rocq.Corelib.Init.Datatypes.CompareSpecT.CompEqT Peq Plt Pgt h) = PLift.up h := rfl
theorem compareSpecT_lt {Peq Plt Pgt : Prop} (h : Plt) :
    compareSpecTTo (Rocq.Corelib.Init.Datatypes.CompareSpecT.CompLtT Peq Plt Pgt h) = PLift.up h := rfl
theorem compareSpecT_gt {Peq Plt Pgt : Prop} (h : Pgt) :
    compareSpecTTo (Rocq.Corelib.Init.Datatypes.CompareSpecT.CompGtT Peq Plt Pgt h) = PLift.up h := rfl

theorem eq_rect_agrees {A : Sort u} (P : A → Sort v) (a b : A) (x : P a)
    (h : Rocq.Corelib.Init.Logic.eq A a b) :
    Rocq.Corelib.Init.Logic.eq_rect A a P x b h = Eq.ndrec x (eqTo h) := by
  cases h; rfl
theorem eq_proof_forall {A : Sort u} {a b : A}
    (F : Rocq.Corelib.Init.Logic.eq A a b → Prop) :
    (∀ h, F h) ↔ ∀ h : a=b, F (eqOf h) := by
  constructor
  · intro h e; exact h _
  · intro h e; exact h (eqTo e)
theorem pprod_transport {A : Sort u} (P : A → Sort v) (Q : A → Sort w)
    {a b : A} (h : a=b) (x : Rocq.Corelib.Init.Datatypes.prod (P a) (Q a)) :
    pprodTo (Eq.ndrec (motive := fun a => Rocq.Corelib.Init.Datatypes.prod (P a) (Q a)) x h) =
      Eq.ndrec (motive := fun a => PProd (P a) (Q a)) (pprodTo x) h := by
  cases h; rfl


theorem compareSpecT_total_family_forall {Peq Plt Pgt : Prop}
    (F : ((c : RComparison) → Rocq.Corelib.Init.Datatypes.CompareSpecT Peq Plt Pgt c → Prop) → Prop) :
    (∀ f, F f) ↔ ∀ f : (c : Ordering) → PLift (compareSpec Peq Plt Pgt c) → Prop,
      F (fun c h => f (comparisonTo c) (compareSpecTTo h)) :=
  (compareSpecT_family_forall F).trans
    (comparison_dependent_family_forall
      (C := fun c => PLift (compareSpec Peq Plt Pgt c) → Prop)
      (fun f => F (fun c h => f c (compareSpecTTo h))))
theorem compareSpecT_total_forall {Peq Plt Pgt : Prop}
    (F : (c : Ordering) → PLift (compareSpec Peq Plt Pgt c) → Prop) :
    (∀ c (h : Rocq.Corelib.Init.Datatypes.CompareSpecT Peq Plt Pgt c),
      F (comparisonTo c) (compareSpecTTo h)) ↔ ∀ c h, F c h := by
  constructor
  · intro h c x
    cases c with
    | eq => exact h .Eq (.CompEqT Peq Plt Pgt x.down)
    | lt => exact h .Lt (.CompLtT Peq Plt Pgt x.down)
    | gt => exact h .Gt (.CompGtT Peq Plt Pgt x.down)
  · intro h c x; exact h _ _

def reflectTo {P : Prop} {b : RBool} :
    Rocq.Corelib.Init.Datatypes.reflect P b → PLift (boolSpec P (¬P) (boolTo b)) := by
  intro h; cases h with
  | ReflectT hp => exact ⟨hp⟩
  | ReflectF hp => exact ⟨(mechanical_not P).mp hp⟩
def reflectOf {P : Prop} {b : RBool} :
    PLift (boolSpec P (¬P) (boolTo b)) → Rocq.Corelib.Init.Datatypes.reflect P b := by
  intro h; cases b with
  | true => exact .ReflectT P h.down
  | false => exact .ReflectF P ((mechanical_not P).mpr h.down)
@[simp] theorem reflect_of_to {P : Prop} {b : RBool} (h : Rocq.Corelib.Init.Datatypes.reflect P b) :
    reflectOf (reflectTo h) = h := by cases h <;> rfl
@[simp] theorem reflect_to_of {P : Prop} {b : RBool} (h : PLift (boolSpec P (¬P) (boolTo b))) :
    reflectTo (reflectOf h) = h := by cases b <;> cases h <;> rfl
def reflectIso (P : Prop) (b : RBool) :
    Iso (Rocq.Corelib.Init.Datatypes.reflect P b) (PLift (boolSpec P (¬P) (boolTo b))) :=
  ⟨reflectTo,reflectOf,reflect_of_to,reflect_to_of⟩
def boolDepOf {C : Bool → Sort u} (f : (b : RBool) → C (boolTo b)) : (b : Bool) → C b
  | true => f .true
  | false => f .false
theorem bool_dependent_family_forall {C : Bool → Sort u}
    (F : ((b : RBool) → C (boolTo b)) → Prop) :
    (∀ f, F f) ↔ ∀ f : (b : Bool) → C b, F (fun b => f (boolTo b)) := by
  constructor
  · intro h f; exact h _
  · intro h f
    have hf : (fun b => boolDepOf f (boolTo b)) = f := by funext b; cases b <;> rfl
    simpa only [hf] using h (boolDepOf f)
theorem reflect_family_forall {P : Prop}
    (F : ((b : RBool) → Rocq.Corelib.Init.Datatypes.reflect P b → Prop) → Prop) :
    (∀ f, F f) ↔ ∀ f : (b : RBool) → PLift (boolSpec P (¬P) (boolTo b)) → Prop,
      F (fun b h => f b (reflectTo h)) := by
  constructor
  · intro h f; exact h _
  · intro h f; simpa only [reflect_of_to] using h (fun b h => f b (reflectOf h))
theorem reflect_total_family_forall {P : Prop}
    (F : ((b : RBool) → Rocq.Corelib.Init.Datatypes.reflect P b → Prop) → Prop) :
    (∀ f, F f) ↔ ∀ f : (b : Bool) → PLift (boolSpec P (¬P) b) → Prop,
      F (fun b h => f (boolTo b) (reflectTo h)) :=
  (reflect_family_forall F).trans
    (bool_dependent_family_forall
      (C := fun b => PLift (boolSpec P (¬P) b) → Prop)
      (fun f => F (fun b h => f b (reflectTo h))))
theorem reflect_total_forall {P : Prop}
    (F : (b : Bool) → PLift (boolSpec P (¬P) b) → Prop) :
    (∀ b (h : Rocq.Corelib.Init.Datatypes.reflect P b), F (boolTo b) (reflectTo h)) ↔ ∀ b h, F b h := by
  constructor
  · intro h b x; cases b with
    | true => exact h .true (.ReflectT P x.down)
    | false => exact h .false (.ReflectF P ((mechanical_not P).mpr x.down))
  · intro h b x; exact h _ _
theorem reflect_true {P : Prop} (h : P) :
    reflectTo (Rocq.Corelib.Init.Datatypes.reflect.ReflectT P h) = PLift.up h := rfl
theorem reflect_false {P : Prop} (h : Rocq.Corelib.Init.Logic.not P) :
    reflectTo (Rocq.Corelib.Init.Datatypes.reflect.ReflectF P h) =
      PLift.up ((mechanical_not P).mp h) := rfl


theorem compareSpecT_of_forall {Peq Plt Pgt : Prop} (c : Ordering)
    (F : (c : Ordering) → PLift (compareSpec Peq Plt Pgt c) → Prop) :
    (∀ h : Rocq.Corelib.Init.Datatypes.CompareSpecT Peq Plt Pgt (comparisonOf c),
      F (comparisonTo (comparisonOf c)) (compareSpecTTo h)) ↔
      ∀ h : PLift (compareSpec Peq Plt Pgt c), F c h := by
  cases c <;> (rw [compareSpecT_forall]; simp only [compareSpecT_to_of]; rfl)
theorem reflect_forall {P : Prop} {b : RBool}
    (F : Rocq.Corelib.Init.Datatypes.reflect P b → Prop) :
    (∀ h, F h) ↔ ∀ h : PLift (boolSpec P (¬P) (boolTo b)), F (reflectOf h) := by
  constructor
  · intro h x; exact h _
  · intro h x; simpa only [reflect_of_to] using h (reflectTo x)
theorem reflect_of_forall {P : Prop} (b : Bool)
    (F : (b : Bool) → PLift (boolSpec P (¬P) b) → Prop) :
    (∀ h : Rocq.Corelib.Init.Datatypes.reflect P (boolOf b),
      F (boolTo (boolOf b)) (reflectTo h)) ↔
      ∀ h : PLift (boolSpec P (¬P) b), F b h := by
  cases b <;> (rw [reflect_forall]; simp only [reflect_to_of]; rfl)


-- On Type-valued elements, erase only the correspondence's PLift wrapper:
-- this recovers the original native container bridge exactly.
theorem fullList_type_compat {A : Type u} (xs : Rocq.Corelib.Init.Datatypes.list A) :
    (fullListTo xs).map PLift.down = listTo xs := by
  induction xs with
  | nil => rfl
  | cons a xs ih =>
    change a :: (fullListTo xs).map PLift.down = a :: listTo xs
    rw [ih]
theorem fullOption_type_compat {A : Type u} (x : Rocq.Corelib.Init.Datatypes.option A) :
    (fullOptionTo x).map PLift.down = optionTo x := by cases x <;> rfl
theorem fullResult_type_compat {A : Type u} {E : Type v} (x : Rocq.Corelib.Init.Datatypes.result A E) :
    (match fullResultTo x with
      | .ok a => Except.ok a.down
      | .error e => Except.error e.down) = resultTo x := by cases x <;> rfl

end NativeBridge.Incremental.DatatypeNormalization

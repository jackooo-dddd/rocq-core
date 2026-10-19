import RelationClasses
noncomputable section
namespace NativeBridge.Incremental.Variadic
open NativeBridge
open Rocq.Corelib.Classes.RelationClasses
universe u v

def typesTo : Tlist.{u} → List (Type u) :=
  Tlist.rec [] (fun A _ ih => A :: ih)
def typesOf : List (Type u) → Tlist.{u}
  | [] => .Tnil
  | A :: ts => .Tcons A (typesOf ts)
theorem types_of_to (ts : Tlist.{u}) : typesOf (typesTo ts) = ts := by
  induction ts with
  | Tnil => rfl
  | Tcons A ts ih => exact congrArg (Tlist.Tcons A) ih
theorem types_to_of (ts : List (Type u)) : typesTo (typesOf ts) = ts := by
  induction ts with
  | nil => rfl
  | cons A ts ih => exact congrArg (List.cons A) ih
def typesIso : Iso Tlist.{u} (List (Type u)) :=
  ⟨typesTo, typesOf, types_of_to, types_to_of⟩

def Arguments : List (Type u) → Type u
  | [] => PUnit
  | A :: ts => A × Arguments ts

def arrowsTo (ts : Tlist.{u}) (B : Type u) :
    arrows ts B → Arguments (typesTo ts) → B :=
  Tlist.rec (motive := fun ts => arrows ts B → Arguments (typesTo ts) → B)
    (fun b _ => b) (fun _ _ ih f xs => ih (f xs.1) xs.2) ts
def arrowsOf (ts : Tlist.{u}) (B : Type u) :
    (Arguments (typesTo ts) → B) → arrows ts B :=
  Tlist.rec (motive := fun ts => (Arguments (typesTo ts) → B) → arrows ts B)
    (fun f => f PUnit.unit) (fun _ _ ih f a => ih (fun xs => f (a,xs))) ts
theorem arrows_of_to (ts : Tlist.{u}) (B : Type u) (f : arrows ts B) :
    arrowsOf ts B (arrowsTo ts B f) = f := by
  induction ts with
  | Tnil => rfl
  | Tcons A ts ih =>
    funext a
    exact ih (f a)
theorem arrows_to_of (ts : Tlist.{u}) (B : Type u) (f : Arguments (typesTo ts) → B) :
    arrowsTo ts B (arrowsOf ts B f) = f := by
  induction ts with
  | Tnil => funext xs; cases xs; rfl
  | Tcons A ts ih =>
    funext xs
    exact congrFun (ih (fun ys => f (xs.1,ys))) xs.2
def arrowsIso (ts : Tlist.{u}) (B : Type u) :
    Iso (arrows ts B) (Arguments (typesTo ts) → B) :=
  ⟨arrowsTo ts B, arrowsOf ts B, arrows_of_to ts B, arrows_to_of ts B⟩

theorem tlist_rec_native (P : List (Type u) → Type) (n : P [])
    (c : (A : Type u) → (ts : List (Type u)) → P ts → P (A :: ts)) (ts : Tlist.{u}) :
    Tlist_rec (fun ts => P (typesTo ts)) n (fun A ts ih => c A (typesTo ts) ih) ts =
      List.rec n c (typesTo ts) := by
  induction ts with
  | Tnil => rfl
  | Tcons A ts ih => exact congrArg (c A (typesTo ts)) ih
theorem tlist_rect_native (P : List (Type u) → Type v) (n : P [])
    (c : (A : Type u) → (ts : List (Type u)) → P ts → P (A :: ts)) (ts : Tlist.{u}) :
    Tlist_rect (fun ts => P (typesTo ts)) n (fun A ts ih => c A (typesTo ts) ih) ts =
      List.rec n c (typesTo ts) := by
  induction ts with
  | Tnil => rfl
  | Tcons A ts ih => exact congrArg (c A (typesTo ts)) ih

theorem pointwise_extension_native (B : Type u) (op : B → B → B) (ts : Tlist.{u})
    (f g : arrows ts B) (xs : Arguments (typesTo ts)) :
    arrowsTo ts B (pointwise_extension B op ts f g) xs =
      op (arrowsTo ts B f xs) (arrowsTo ts B g xs) := by
  induction ts with
  | Tnil => rfl
  | Tcons A ts ih => exact ih (f xs.1) (g xs.1) xs.2

def predicateTo (ts : Tlist.{u}) (f : arrows ts (PULift.{u+1,1} Prop)) :
    Arguments (typesTo ts) → Prop :=
  fun xs => (arrowsTo ts _ f xs).down
def predicateOf (ts : Tlist.{u}) (f : Arguments (typesTo ts) → Prop) :
    arrows ts (PULift.{u+1,1} Prop) :=
  arrowsOf ts _ (fun xs => ⟨f xs⟩)
def liftedPropIso : Iso (PULift.{u+1,1} Prop) Prop where
  to := PULift.down
  of := PULift.up
  of_to p := by cases p; rfl
  to_of p := rfl
def predicateIso (ts : Tlist.{u}) :
    Iso (arrows ts (PULift.{u+1,1} Prop)) (Arguments (typesTo ts) → Prop) :=
  (arrowsIso ts _).trans ((identityIso _).functions liftedPropIso)

theorem predicate_all_native (ts : Tlist.{u}) (f : arrows ts (PULift.{u+1,1} Prop)) :
    predicate_all ts f ↔ ∀ xs, predicateTo ts f xs := by
  induction ts with
  | Tnil =>
    constructor
    · intro h _; exact h
    · intro h; exact h PUnit.unit
  | Tcons A ts ih =>
    constructor
    · intro h xs; exact (ih (f xs.1)).mp (h xs.1) xs.2
    · intro h a; exact (ih (f a)).mpr (fun xs => h (a,xs))
theorem predicate_exists_native (ts : Tlist.{u}) (f : arrows ts (PULift.{u+1,1} Prop)) :
    predicate_exists ts f ↔ ∃ xs, predicateTo ts f xs := by
  induction ts with
  | Tnil =>
    exact ⟨fun h => ⟨PUnit.unit,h⟩,fun ⟨_,h⟩ => h⟩
  | Tcons A ts ih =>
    constructor
    · intro h
      cases h with
      | ex_intro a ha =>
        obtain ⟨xs,hxs⟩ := (ih (f a)).mp ha
        exact ⟨(a,xs),hxs⟩
    · intro ⟨xs,hxs⟩
      exact .ex_intro A _ xs.1 ((ih (f xs.1)).mpr ⟨xs.2,hxs⟩)

theorem pointwise_lifting_native (op : Prop → Prop → Prop) (ts : Tlist.{u})
    (f g : arrows ts (PULift.{u+1,1} Prop)) :
    (pointwise_lifting (fun p q => ⟨op p.down q.down⟩) ts f g).down ↔
      ∀ xs, op (predicateTo ts f xs) (predicateTo ts g xs) := by
  induction ts with
  | Tnil =>
    exact ⟨fun h _ => h,fun h => h PUnit.unit⟩
  | Tcons A ts ih =>
    constructor
    · intro h xs; exact (ih (f xs.1) (g xs.1)).mp (h xs.1) xs.2
    · intro h a; exact (ih (f a) (g a)).mpr (fun xs => h (a,xs))

theorem predicate_equivalence_native (ts : Tlist.{u})
    (f g : arrows ts (PULift.{u+1,1} Prop)) :
    (predicate_equivalence ts f g).down ↔
      ∀ xs, predicateTo ts f xs ↔ predicateTo ts g xs := by
  unfold predicate_equivalence
  rw [pointwise_lifting_native]
  simp only [NativeBridge.Incremental.RC.sourceIff]
theorem predicate_implication_native (ts : Tlist.{u})
    (f g : arrows ts (PULift.{u+1,1} Prop)) :
    (predicate_implication ts f g).down ↔
      ∀ xs, predicateTo ts f xs → predicateTo ts g xs :=
  pointwise_lifting_native (fun p q => p → q) ts f g

theorem predicate_intersection_native (ts : Tlist.{u})
    (f g : arrows ts (PULift.{u+1,1} Prop)) (xs : Arguments (typesTo ts)) :
    predicateTo ts (predicate_intersection ts f g) xs ↔
      predicateTo ts f xs ∧ predicateTo ts g xs := by
  unfold predicateTo predicate_intersection
  rw [pointwise_extension_native]
  exact NativeBridge.Incremental.RC.sourceAnd _ _
theorem predicate_union_native (ts : Tlist.{u})
    (f g : arrows ts (PULift.{u+1,1} Prop)) (xs : Arguments (typesTo ts)) :
    predicateTo ts (predicate_union ts f g) xs ↔
      predicateTo ts f xs ∨ predicateTo ts g xs := by
  unfold predicateTo predicate_union
  rw [pointwise_extension_native]
  exact NativeBridge.Incremental.RC.sourceOr _ _

theorem true_predicate_native (ts : Tlist.{u}) (xs : Arguments (typesTo ts)) :
    predicateTo ts (true_predicate ts) xs ↔ True := by
  induction ts with
  | Tnil => exact ⟨fun _ => True.intro,fun _ => .I⟩
  | Tcons A ts ih => exact ih xs.2
theorem false_predicate_native (ts : Tlist.{u}) (xs : Arguments (typesTo ts)) :
    predicateTo ts (false_predicate ts) xs ↔ False := by
  induction ts with
  | Tnil => exact NativeBridge.Incremental.RC.sourceFalse
  | Tcons A ts ih => exact ih xs.2

end NativeBridge.Incremental.Variadic

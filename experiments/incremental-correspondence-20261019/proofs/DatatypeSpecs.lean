import DatatypeNormalization
noncomputable section
namespace NativeBridge.Incremental.DatatypeSpecs
open NativeBridge NativeBridge.Incremental.DatatypeNormalization
universe u

def compareElim {Peq Plt Pgt : Prop}
    {M : (c : Ordering) → PLift (compareSpec Peq Plt Pgt c) → Sort u}
    (he : (h : Peq) → M .eq (PLift.up h))
    (hl : (h : Plt) → M .lt (PLift.up h))
    (hg : (h : Pgt) → M .gt (PLift.up h)) :
    (c : Ordering) → (h : PLift (compareSpec Peq Plt Pgt c)) → M c h
  | .eq, ⟨h⟩ => he h
  | .lt, ⟨h⟩ => hl h
  | .gt, ⟨h⟩ => hg h
theorem compare_rect_agrees (Peq Plt Pgt : Prop)
    (M : (c : Ordering) → PLift (compareSpec Peq Plt Pgt c) → Sort u)
    (he : (h : Peq) → M .eq (PLift.up h))
    (hl : (h : Plt) → M .lt (PLift.up h))
    (hg : (h : Pgt) → M .gt (PLift.up h))
    (c : RComparison) (h : Rocq.Corelib.Init.Datatypes.CompareSpecT Peq Plt Pgt c) :
    Rocq.Corelib.Init.Datatypes.CompareSpecT_rect Peq Plt Pgt
      (fun c h => M (comparisonTo c) (compareSpecTTo h)) he hl hg c h =
      compareElim he hl hg (comparisonTo c) (compareSpecTTo h) := by cases h <;> rfl
theorem compare_rec_agrees (Peq Plt Pgt : Prop)
    (M : (c : Ordering) → PLift (compareSpec Peq Plt Pgt c) → Type)
    (he : (h : Peq) → M .eq (PLift.up h))
    (hl : (h : Plt) → M .lt (PLift.up h))
    (hg : (h : Pgt) → M .gt (PLift.up h))
    (c : RComparison) (h : Rocq.Corelib.Init.Datatypes.CompareSpecT Peq Plt Pgt c) :
    Rocq.Corelib.Init.Datatypes.CompareSpecT_rec Peq Plt Pgt
      (fun c h => M (comparisonTo c) (compareSpecTTo h)) he hl hg c h =
      compareElim he hl hg (comparisonTo c) (compareSpecTTo h) :=
  compare_rect_agrees Peq Plt Pgt M he hl hg c h

def reflectElim {P : Prop}
    {M : (b : Bool) → PLift (boolSpec P (¬P) b) → Sort u}
    (ht : (h : P) → M true (PLift.up h))
    (hf : (h : ¬P) → M false (PLift.up h)) :
    (b : Bool) → (h : PLift (boolSpec P (¬P) b)) → M b h
  | true, ⟨h⟩ => ht h
  | false, ⟨h⟩ => hf h
theorem reflect_rect_agrees (P : Prop)
    (M : (b : Bool) → PLift (boolSpec P (¬P) b) → Sort u)
    (ht : (h : P) → M true (PLift.up h))
    (hf : (h : ¬P) → M false (PLift.up h))
    (b : RBool) (h : Rocq.Corelib.Init.Datatypes.reflect P b) :
    Rocq.Corelib.Init.Datatypes.reflect_rect P
      (fun b h => M (boolTo b) (reflectTo h)) ht (fun n => hf ((mechanical_not P).mp n)) b h =
      reflectElim ht hf (boolTo b) (reflectTo h) := by cases h <;> rfl
theorem reflect_rec_agrees (P : Prop)
    (M : (b : Bool) → PLift (boolSpec P (¬P) b) → Type)
    (ht : (h : P) → M true (PLift.up h))
    (hf : (h : ¬P) → M false (PLift.up h))
    (b : RBool) (h : Rocq.Corelib.Init.Datatypes.reflect P b) :
    Rocq.Corelib.Init.Datatypes.reflect_rec P
      (fun b h => M (boolTo b) (reflectTo h)) ht (fun n => hf ((mechanical_not P).mp n)) b h =
      reflectElim ht hf (boolTo b) (reflectTo h) :=
  reflect_rect_agrees P M ht hf b h

theorem compare_eq_obligation :
    Rocq.Corelib.Init.Datatypes.CompareSpec2Type__rocq2lean_obligation_1.statement := by
  intro Peq Plt Pgt _ h
  exact (compareSpec_agrees Peq Plt Pgt .Eq).mp h
theorem compare_lt_obligation :
    Rocq.Corelib.Init.Datatypes.CompareSpec2Type__rocq2lean_obligation_2.statement := by
  intro Peq Plt Pgt _ h
  exact (compareSpec_agrees Peq Plt Pgt .Lt).mp h
theorem compare_gt_obligation :
    Rocq.Corelib.Init.Datatypes.CompareSpec2Type__rocq2lean_obligation_3.statement := by
  intro Peq Plt Pgt _ h
  exact (compareSpec_agrees Peq Plt Pgt .Gt).mp h

def compareSpecClosed (Peq Plt Pgt : Prop) (c : RComparison)
    (h : Rocq.Corelib.Init.Datatypes.CompareSpec Peq Plt Pgt c) :
    Rocq.Corelib.Init.Datatypes.CompareSpecT Peq Plt Pgt c :=
  @RocqPending.Corelib.Init.Datatypes.CompareSpec2Type
    compare_eq_obligation compare_lt_obligation compare_gt_obligation Peq Plt Pgt c h
theorem compareSpec2Type_agrees (Peq Plt Pgt : Prop) (c : RComparison)
    (h : Rocq.Corelib.Init.Datatypes.CompareSpec Peq Plt Pgt c) :
    compareSpecTTo (@RocqPending.Corelib.Init.Datatypes.CompareSpec2Type
      compare_eq_obligation compare_lt_obligation compare_gt_obligation Peq Plt Pgt c h) =
      PLift.up ((compareSpec_agrees Peq Plt Pgt c).mp h) := by
  cases c <;> rfl

def compSpecClosed {A : Type u} (eq lt : A → A → Prop) (x y : A) (c : RComparison)
    (h : Rocq.Corelib.Init.Datatypes.CompSpec A eq lt x y c) :
    Rocq.Corelib.Init.Datatypes.CompSpecT A eq lt x y c :=
  @RocqPending.Corelib.Init.Datatypes.CompSpec2Type
    compare_eq_obligation compare_lt_obligation compare_gt_obligation A eq lt x y c h
theorem compSpec2Type_agrees {A : Type u} (eq lt : A → A → Prop) (x y : A) (c : RComparison)
    (h : Rocq.Corelib.Init.Datatypes.CompSpec A eq lt x y c) :
    compareSpecTTo (@RocqPending.Corelib.Init.Datatypes.CompSpec2Type
      compare_eq_obligation compare_lt_obligation compare_gt_obligation A eq lt x y c h) =
      PLift.up ((compSpec_agrees eq lt x y c).mp h) :=
  compareSpec2Type_agrees _ _ _ c h
end NativeBridge.Incremental.DatatypeSpecs

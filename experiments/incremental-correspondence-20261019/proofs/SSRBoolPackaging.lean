import SSRBoolLogic
set_option autoImplicit false
noncomputable section
namespace NativeBridge.Incremental.SSRBoolPackaging
open NativeBridge
open SSRBoolData
universe u v w
def manifestSimplIso (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.pred A) :
    Iso (Rocq.Corelib.ssr.ssrbool.manifest_simpl_pred.{v,u} A p) Unit where
  to _ := .unit
  of _ := .ManifestSimplPred A p (Rocq.Corelib.ssr.ssrbool.SimplPred A p) (.eq_refl _ _)
  of_to x := by
    cases x with
    | ManifestSimplPred value h =>
      have he := eqTo h
      subst value
      rfl
  to_of x := by cases x; rfl
def registeredIso (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.pred A) :
    Iso (Rocq.Corelib.ssr.ssrbool.registered_applicative_pred.{v,u} A p) Unit where
  to _ := .unit
  of _ := .RegisteredApplicativePred A p p (.eq_refl _ _)
  of_to x := by
    cases x with
    | RegisteredApplicativePred value h =>
      have he := eqTo h
      subst value
      rfl
  to_of x := by cases x; rfl
def manifestMemIso (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.pred A) :
    Iso (Rocq.Corelib.ssr.ssrbool.manifest_mem_pred.{v,u} A p) Unit where
  to _ := .unit
  of _ := .ManifestMemPred A p (.Mem A p) (.eq_refl _ _)
  of_to x := by
    cases x with
    | ManifestMemPred value h =>
      have he := eqTo h
      subst value
      rfl
  to_of x := by cases x; rfl
def applicativeMemIso (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.pred A) :
    Iso (Rocq.Corelib.ssr.ssrbool.applicative_mem_pred.{v,u} A p) Unit where
  to _ := .unit
  of x := .ApplicativeMemPred A p ((manifestMemIso A p).of x)
  of_to x := by
    cases x with
    | ApplicativeMemPred value =>
      exact congrArg (Rocq.Corelib.ssr.ssrbool.applicative_mem_pred.ApplicativeMemPred A p) ((manifestMemIso A p).of_to value)
  to_of x := by cases x; rfl
def qualifierIso (n : Rocq.Corelib.Init.Datatypes.nat) (A : Type u) :
    Iso (Rocq.Corelib.ssr.ssrbool.qualifier n A) (A → Bool) where
  to x := predTo (Rocq.Corelib.ssr.ssrbool.has_quality n A x)
  of f := .Qualifier n A (predOf f)
  of_to x := by
    cases x with
    | Qualifier p => exact congrArg (Rocq.Corelib.ssr.ssrbool.qualifier.Qualifier n A) (pred_of_to p)
  to_of f := pred_to_of f
def predKeyIso (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.pred A) :
    Iso (Rocq.Corelib.ssr.ssrbool.pred_key A p) True where
  to _ := True.intro
  of _ := .DefaultPredKey A p
  of_to _ := rfl
  to_of _ := rfl
def keyedPredIso (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.pred A)
    (k : Rocq.Corelib.ssr.ssrbool.pred_key A p) :
    Iso (Rocq.Corelib.ssr.ssrbool.keyed_pred.{v,u} A p k) Unit where
  to _ := .unit
  of _ := .PackKeyedPred A p k p (fun _ => .eq_refl _ _)
  of_to x := by
    cases x with
    | PackKeyedPred value h =>
      have he : value = p := by funext x; exact eqTo (h x)
      subst value
      rfl
  to_of x := by cases x; rfl
def keyedQualifierIso (A : Type u) (n : Rocq.Corelib.Init.Datatypes.nat)
    (q : Rocq.Corelib.ssr.ssrbool.qualifier n A)
    (k : Rocq.Corelib.ssr.ssrbool.pred_key A (Rocq.Corelib.ssr.ssrbool.has_quality n A q)) :
    Iso (Rocq.Corelib.ssr.ssrbool.keyed_qualifier.{v,u} A n q k) Unit where
  to _ := .unit
  of _ := .PackKeyedQualifier A n q k q (.eq_refl _ _)
  of_to x := by
    cases x with
    | PackKeyedQualifier value h =>
      have he := eqTo h
      subst value
      rfl
  to_of x := by cases x; rfl

theorem collective_pred_of_simpl_agrees (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.simpl_pred A) :
    predTo (Rocq.Corelib.ssr.ssrbool.collective_pred_of_simpl A p) = (simplPredIso A).to p := by cases p; rfl
theorem applicative_pred_of_simpl_agrees (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.simpl_pred A) :
    predTo (Rocq.Corelib.ssr.ssrbool.applicative_pred_of_simpl A p) = (simplPredIso A).to p := rfl
theorem rel_of_simpl_agrees (A : Type u) (r : Rocq.Corelib.ssr.ssrbool.simpl_rel A) :
    (fun x y => boolTo (Rocq.Corelib.ssr.ssrbool.rel_of_simpl A r x y)) = (simplRelIso A).to r := rfl
theorem simpl_pred_value_agrees (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.pred A)
    (x : Rocq.Corelib.ssr.ssrbool.manifest_simpl_pred.{v,u} A p) :
    (simplPredIso A).to (Rocq.Corelib.ssr.ssrbool.simpl_pred_value A p x) = predTo p := by
  cases x with
  | ManifestSimplPred value h =>
    have he := eqTo h
    subst value
    rfl
theorem applicative_pred_value_agrees (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.pred A)
    (x : Rocq.Corelib.ssr.ssrbool.registered_applicative_pred.{v,u} A p) :
    predTo (Rocq.Corelib.ssr.ssrbool.applicative_pred_value A p x) = predTo p := by
  cases x with
  | RegisteredApplicativePred value h =>
    have he := eqTo h
    subst value
    rfl
theorem mem_pred_value_agrees (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.pred A)
    (x : Rocq.Corelib.ssr.ssrbool.manifest_mem_pred.{v,u} A p) :
    (memIso A).to (Rocq.Corelib.ssr.ssrbool.mem_pred_value A p x) = predTo p := by
  cases x with
  | ManifestMemPred value h =>
    have he := eqTo h
    subst value
    rfl
theorem applicative_mem_pred_value_agrees (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.pred A)
    (x : Rocq.Corelib.ssr.ssrbool.applicative_mem_pred.{v,u} A p) :
    (manifestMemIso A p).to (Rocq.Corelib.ssr.ssrbool.applicative_mem_pred_value A p x) =
      id ((applicativeMemIso A p).to x) := rfl
theorem has_quality_agrees (n : Rocq.Corelib.Init.Datatypes.nat) (A : Type u)
    (x : Rocq.Corelib.ssr.ssrbool.qualifier n A) :
    predTo (Rocq.Corelib.ssr.ssrbool.has_quality n A x) = (qualifierIso n A).to x := rfl
theorem unkey_pred_agrees (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.pred A)
    (k : Rocq.Corelib.ssr.ssrbool.pred_key A p)
    (x : Rocq.Corelib.ssr.ssrbool.keyed_pred.{v,u} A p k) :
    predTo (Rocq.Corelib.ssr.ssrbool.unkey_pred A p k x) = predTo p := by
  cases x with
  | PackKeyedPred value h =>
    have he : value = p := by funext x; exact eqTo (h x)
    subst value
    rfl
theorem unkey_qualifier_agrees (A : Type u) (n : Rocq.Corelib.Init.Datatypes.nat)
    (q : Rocq.Corelib.ssr.ssrbool.qualifier n A)
    (k : Rocq.Corelib.ssr.ssrbool.pred_key A (Rocq.Corelib.ssr.ssrbool.has_quality n A q))
    (x : Rocq.Corelib.ssr.ssrbool.keyed_qualifier.{v,u} A n q k) :
    (qualifierIso n A).to (Rocq.Corelib.ssr.ssrbool.unkey_qualifier A n q k x) = (qualifierIso n A).to q := by
  cases x with
  | PackKeyedQualifier value h =>
    have he := eqTo h
    subst value
    rfl
theorem eq_mem_agrees (A : Type u) (p q : Rocq.Corelib.ssr.ssrbool.mem_pred A) :
    Rocq.Corelib.ssr.ssrbool.eq_mem A p q ↔ (memIso A).to p = (memIso A).to q := by
  constructor
  · intro h; funext x; exact congrArg boolTo (eqTo (h x))
  · intro h x
    exact eqOf (boolIso.injective (congrFun h x))
theorem sub_mem_agrees (A : Type u) (p q : Rocq.Corelib.ssr.ssrbool.mem_pred A) :
    Rocq.Corelib.ssr.ssrbool.sub_mem A p q ↔
      ∀ x, (memIso A).to p x = true → (memIso A).to q x = true := by
  simp only [Rocq.Corelib.ssr.ssrbool.sub_mem, is_true_agrees]
  rfl
theorem mem_agrees (A : Type v) (pT : nativePredType.{u,v} A) (p : pT.fst) :
    (memIso A).to (Rocq.Corelib.ssr.ssrbool.mem A (predTypeOf A pT) p) = pT.snd p := pred_to_of _
theorem locked_agrees (A : Sort u) (x : A) :
    Rocq.Corelib.ssr.ssreflect_rw.locked A x = id x := by
  unfold Rocq.Corelib.ssr.ssreflect_rw.locked
  cases Rocq.Corelib.ssr.ssreflect_rw.master_key
  rfl
def unitTo : Rocq.Corelib.Init.Datatypes.unit → Unit := fun _ => ()
def unitOf : Unit → Rocq.Corelib.Init.Datatypes.unit := fun _ => .tt
theorem unit_of_to (x : Rocq.Corelib.Init.Datatypes.unit) : unitOf (unitTo x) = x := by cases x; rfl
theorem unit_to_of (x : Unit) : unitTo (unitOf x) = x := by cases x; rfl
theorem master_key_agrees : unitTo Rocq.Corelib.ssr.ssreflect_rw.master_key = () := rfl

end NativeBridge.Incremental.SSRBoolPackaging

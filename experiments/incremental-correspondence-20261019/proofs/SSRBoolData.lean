import SSRBool
set_option autoImplicit false
noncomputable section
namespace NativeBridge.Incremental.SSRBoolData
open NativeBridge
universe u v w
def predTo {A : Type u} (p : Rocq.Corelib.ssr.ssrbool.pred A) : A → Bool := fun x => boolTo (p x)
def predOf {A : Type u} (p : A → Bool) : Rocq.Corelib.ssr.ssrbool.pred A := fun x => boolOf (p x)
theorem pred_of_to {A : Type u} (p : Rocq.Corelib.ssr.ssrbool.pred A) : predOf (predTo p) = p := by
  funext x; exact bool_of_to _
theorem pred_to_of {A : Type u} (p : A → Bool) : predTo (predOf p) = p := by
  funext x; exact bool_to_of _
def simplPredIso (A : Type u) : Iso (Rocq.Corelib.ssr.ssrbool.simpl_pred A) (A → Bool) where
  to x := predTo (Rocq.Corelib.ssr.ssrfun.fun_of_simpl A RBool x)
  of f := Rocq.Corelib.ssr.ssrbool.SimplPred A (predOf f)
  of_to x := by
    cases x with
    | SimplFun f => exact congrArg (Rocq.Corelib.ssr.ssrfun.simpl_fun.SimplFun A RBool) (pred_of_to f)
  to_of f := pred_to_of f
def simplRelIso (A : Type u) : Iso (Rocq.Corelib.ssr.ssrbool.simpl_rel A) (A → A → Bool) where
  to r x := (simplPredIso A).to (r x)
  of r x := (simplPredIso A).of (r x)
  of_to r := by funext x; exact (simplPredIso A).of_to _
  to_of r := by funext x; exact (simplPredIso A).to_of _
def memIso (A : Type u) : Iso (Rocq.Corelib.ssr.ssrbool.mem_pred A) (A → Bool) where
  to x := predTo (Rocq.Corelib.ssr.ssrbool.pred_of_mem A x)
  of f := .Mem A (predOf f)
  of_to x := by
    cases x with
    | Mem f => exact congrArg (Rocq.Corelib.ssr.ssrbool.mem_pred.Mem A) (pred_of_to f)
  to_of f := pred_to_of f

def predArgIso : Iso Rocq.Corelib.ssr.ssrbool.predArgType.{u} (Type u) where
  to := id
  of := id
  of_to _ := rfl
  to_of _ := rfl
theorem sort_of_predArgType_agrees (A : Rocq.Corelib.ssr.ssrbool.predArgType.{u}) :
    Rocq.Corelib.ssr.ssrbool.sort_of_predArgType A = id A := rfl
theorem simplPred_agrees (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.pred A) :
    (simplPredIso A).to (Rocq.Corelib.ssr.ssrbool.SimplPred A p) = predTo p := rfl
theorem simplRel_agrees (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.rel A) :
    (simplRelIso A).to (Rocq.Corelib.ssr.ssrbool.SimplRel A p) = (fun x y => boolTo (p x y)) := rfl
theorem fun_of_pred_agrees (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.pred A) :
    predTo (Rocq.Corelib.ssr.ssrbool.fun_of_pred A p) = id (predTo p) := rfl
theorem fun_of_rel_agrees (A : Type u) (r : Rocq.Corelib.ssr.ssrbool.rel A) :
    (fun x y => boolTo (Rocq.Corelib.ssr.ssrbool.fun_of_rel A r x y)) =
      id (fun x y => boolTo (r x y)) := rfl
theorem pred0_agrees (A : Type u) : (simplPredIso A).to (Rocq.Corelib.ssr.ssrbool.pred0 A) = (fun _ => false) := rfl
theorem predT_agrees (A : Type u) : (simplPredIso A).to (Rocq.Corelib.ssr.ssrbool.predT A) = (fun _ => true) := rfl
theorem predI_agrees (A : Type u) (p q : Rocq.Corelib.ssr.ssrbool.pred A) :
    (simplPredIso A).to (Rocq.Corelib.ssr.ssrbool.predI A p q) = (fun x => predTo p x && predTo q x) := by
  funext x; exact andb_agrees _ _
theorem predU_agrees (A : Type u) (p q : Rocq.Corelib.ssr.ssrbool.pred A) :
    (simplPredIso A).to (Rocq.Corelib.ssr.ssrbool.predU A p q) = (fun x => predTo p x || predTo q x) := by
  funext x; exact orb_agrees _ _
theorem predC_agrees (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.pred A) :
    (simplPredIso A).to (Rocq.Corelib.ssr.ssrbool.predC A p) = (fun x => !(predTo p x)) := by
  funext x; exact negb_agrees _
theorem predD_agrees (A : Type u) (p q : Rocq.Corelib.ssr.ssrbool.pred A) :
    (simplPredIso A).to (Rocq.Corelib.ssr.ssrbool.predD A p q) = (fun x => !(predTo q x) && predTo p x) := by
  funext x
  change boolTo (Rocq.Corelib.Init.Datatypes.andb (Rocq.Corelib.Init.Datatypes.negb (q x)) (p x)) = _
  rw [andb_agrees, negb_agrees]; rfl
theorem preim_agrees (A : Type u) (B : Type v) (f : A → B) (p : Rocq.Corelib.ssr.ssrbool.pred B) :
    (simplPredIso A).to (Rocq.Corelib.ssr.ssrbool.preim A B f p) = predTo p ∘ f := rfl
theorem relU_agrees (A : Type u) (r s : Rocq.Corelib.ssr.ssrbool.rel A) :
    (simplRelIso A).to (Rocq.Corelib.ssr.ssrbool.relU A r s) =
      (fun x y => boolTo (r x y) || boolTo (s x y)) := by funext x y; exact orb_agrees _ _
theorem relpre_agrees (A : Type u) (B : Type v) (f : A → B) (r : Rocq.Corelib.ssr.ssrbool.rel B) :
    (simplRelIso A).to (Rocq.Corelib.ssr.ssrbool.relpre A B f r) =
      (fun x y => boolTo (r (f x) (f y))) := rfl
theorem pred_of_argType_agrees (A : Rocq.Corelib.ssr.ssrbool.predArgType.{u}) :
    (simplPredIso A).to (Rocq.Corelib.ssr.ssrbool.pred_of_argType A) = (fun _ => true) := rfl
theorem pred_of_mem_agrees (A : Type u) (x : Rocq.Corelib.ssr.ssrbool.mem_pred A) :
    predTo (Rocq.Corelib.ssr.ssrbool.pred_of_mem A x) = (memIso A).to x := rfl
theorem in_mem_agrees (A : Type u) (a : A) (x : Rocq.Corelib.ssr.ssrbool.mem_pred A) :
    boolTo (Rocq.Corelib.ssr.ssrbool.in_mem A a x) = (memIso A).to x a := rfl
theorem simpl_of_mem_agrees (A : Type u) (x : Rocq.Corelib.ssr.ssrbool.mem_pred A) :
    (simplPredIso A).to (Rocq.Corelib.ssr.ssrbool.simpl_of_mem A x) = (memIso A).to x := rfl
theorem pred_oapp_agrees (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.pred A)
    (x : Rocq.Corelib.Init.Datatypes.option A) :
    boolTo (Rocq.Corelib.ssr.ssrbool.pred_oapp A p x) = (optionTo x).any (predTo p) := by cases x <;> rfl

def nativePredType (A : Type v) : Type (max (u+1) v) := Sigma (fun S : Type u => S → A → Bool)
def predTypeTo (A : Type v) : Rocq.Corelib.ssr.ssrbool.predType.{u,v} A → nativePredType.{u,v} A
  | .PredType _ S p => ⟨S,fun s => predTo (p s)⟩
def predTypeOf (A : Type v) (x : nativePredType.{u,v} A) : Rocq.Corelib.ssr.ssrbool.predType.{u,v} A :=
  .PredType A x.fst (fun s => predOf (x.snd s))
def predTypeIso (A : Type v) : Iso (Rocq.Corelib.ssr.ssrbool.predType.{u,v} A) (nativePredType.{u,v} A) where
  to := predTypeTo A
  of := predTypeOf A
  of_to x := by
    cases x with
    | PredType S p =>
      change Rocq.Corelib.ssr.ssrbool.predType.PredType A S (fun s => predOf (predTo (p s))) = _
      simp only [pred_of_to]
  to_of x := by
    cases x with
    | mk S p =>
      change (⟨S,fun s => predTo (predOf (p s))⟩ : nativePredType A) = ⟨S,p⟩
      simp only [pred_to_of]
theorem pred_sort_agrees (A : Type v) (x : Rocq.Corelib.ssr.ssrbool.predType.{u,v} A) :
    Rocq.Corelib.ssr.ssrbool.pred_sort A x = (predTypeTo A x).fst := by cases x; rfl
theorem topred_agrees (A : Type v) (x : nativePredType.{u,v} A) (s : x.fst) :
    predTo (Rocq.Corelib.ssr.ssrbool.topred A (predTypeOf A x) s) = x.snd s := pred_to_of _

def impliesIso (P : Sort u) (Q : Sort v) : Iso (Rocq.Corelib.ssr.ssrbool.implies P Q) (P → Q) where
  to x := match x with | .Implies _ _ f => f
  of f := .Implies P Q f
  of_to x := by cases x; rfl
  to_of _ := rfl

def decidableTo (P : Prop) : Rocq.Corelib.ssr.ssrbool.decidable P → Decidable P
  | .left _ _ h => .isTrue h
  | .right _ _ h => .isFalse (fun p => nomatch h p)
def decidableOf (P : Prop) : Decidable P → Rocq.Corelib.ssr.ssrbool.decidable P
  | .isTrue h => .left _ _ h
  | .isFalse h => .right _ _ (fun p => False.elim (h p))
def decidableIso (P : Prop) : Iso (Rocq.Corelib.ssr.ssrbool.decidable P) (Decidable P) where
  to := decidableTo P
  of := decidableOf P
  of_to x := by cases x <;> rfl
  to_of x := by cases x <;> rfl
theorem unless_agrees (P : Sort u) (Q : Sort v) :
    Rocq.Corelib.ssr.ssrbool.unless P Q ↔ (Nonempty P ∨ Nonempty Q) := by
  constructor
  · intro h; exact h _ (fun p => .inl ⟨p⟩) (fun q => .inr ⟨q⟩)
  · intro h G hp hq
    cases h with
    | inl h => cases h with | intro p => exact hp p
    | inr h => cases h with | intro q => exact hq q
theorem classically_agrees (P : Sort u) :
    Rocq.Corelib.ssr.ssrbool.classically P ↔ ¬¬ Nonempty P := by
  constructor
  · intro h hn
    have bad : false = true := congrArg boolTo (eqTo (h .false (fun p => False.elim (hn ⟨p⟩))))
    cases bad
  · intro h b hb
    cases b with
    | true => exact .eq_refl _ _
    | false =>
      have hn : ¬ Nonempty P := by
        rintro ⟨p⟩
        have bad : false = true := congrArg boolTo (eqTo (hb p))
        cases bad
      exact False.elim (h hn)
end NativeBridge.Incremental.SSRBoolData

import Interface_ssr_ssrbool
set_option autoImplicit false
noncomputable section
namespace NativeBridge.Incremental
universe u v
variable {A : Type u} {B : Type v}

def ssrPredIso (e : Iso A B) : Iso (Rocq.Corelib.ssr.ssrbool.pred A) (B → Bool) :=
 Iso.functions e boolIso

def ssrRelIso (e : Iso A B) : Iso (Rocq.Corelib.ssr.ssrbool.rel A) (B → B → Bool) :=
 Iso.functions e (Iso.functions e boolIso)

theorem ssr_addb_agrees (a b : RBool) :
 boolTo (Rocq.Corelib.ssr.ssrbool.addb a b) = Bool.xor (boolTo a) (boolTo b) := by
 cases a <;> cases b <;> rfl

theorem ssr_if_expr_agrees {C : Sort u} (b : RBool) (t f : C) :
 Rocq.Corelib.ssr.ssrbool.if_expr C b t f = (if boolTo b then t else f) := by
 cases b <;> rfl

theorem ssr_isSome_agrees (x : Rocq.Corelib.Init.Datatypes.option A) :
 boolTo (Rocq.Corelib.ssr.ssrbool.isSome A x) = (optionTo x).isSome := by
 cases x <;> rfl

theorem ssr_is_inl_agrees (x : Rocq.Corelib.Init.Datatypes.sum A B) :
 boolTo (Rocq.Corelib.ssr.ssrbool.is_inl A B x) =
 (match sumTo x with | .inl _ => true | .inr _ => false) := by
 cases x <;> rfl

theorem ssr_subpred_agrees (p q : A → RBool) :
 Rocq.Corelib.ssr.ssrbool.subpred A p q ↔
 ∀ x, boolTo (p x) = true → boolTo (q x) = true := by
 simp only [Rocq.Corelib.ssr.ssrbool.subpred, is_true_agrees]

theorem ssr_subrel_agrees (p q : A → A → RBool) :
 Rocq.Corelib.ssr.ssrbool.subrel A p q ↔
 ∀ x y, boolTo (p x y) = true → boolTo (q x y) = true := by
 simp only [Rocq.Corelib.ssr.ssrbool.subrel, is_true_agrees]

theorem ssr_reflexive_agrees (r : A → A → RBool) :
 Rocq.Corelib.ssr.ssrbool.reflexive A r ↔ ∀ x, boolTo (r x x) = true := by
 simp only [Rocq.Corelib.ssr.ssrbool.reflexive, is_true_agrees]

theorem bool_eq_native (a b : RBool) : ME RBool a b ↔ boolTo a = boolTo b :=
 eq_across_iso boolIso a b

theorem ssr_irreflexive_agrees (r : A → A → RBool) :
 Rocq.Corelib.ssr.ssrbool.irreflexive A r ↔ ∀ x, boolTo (r x x) = false := by
 simp only [Rocq.Corelib.ssr.ssrbool.irreflexive, bool_eq_native]
 rfl

theorem ssr_symmetric_agrees (r : A → A → RBool) :
 Rocq.Corelib.ssr.ssrbool.symmetric A r ↔ ∀ x y, boolTo (r x y) = boolTo (r y x) := by
 simp only [Rocq.Corelib.ssr.ssrbool.symmetric, bool_eq_native]

theorem ssr_transitive_agrees (r : A → A → RBool) :
 Rocq.Corelib.ssr.ssrbool.transitive A r ↔
 ∀ y x z, boolTo (r x y) = true → boolTo (r y z) = true → boolTo (r x z) = true := by
 simp only [Rocq.Corelib.ssr.ssrbool.transitive, is_true_agrees]

theorem ssr_antisymmetric_agrees (r : A → A → RBool) :
 Rocq.Corelib.ssr.ssrbool.antisymmetric A r ↔
 ∀ x y, (boolTo (r x y) = true ∧ boolTo (r y x) = true) → x = y := by
 simp only [Rocq.Corelib.ssr.ssrbool.antisymmetric, is_true_agrees, andb_agrees,
  Bool.and_eq_true, eq_correspondence]

theorem ssr_total_agrees (r : A → A → RBool) :
 Rocq.Corelib.ssr.ssrbool.total A r ↔
 ∀ x y, boolTo (r x y) = true ∨ boolTo (r y x) = true := by
 simp only [Rocq.Corelib.ssr.ssrbool.total, is_true_agrees, orb_agrees, Bool.or_eq_true]

theorem reflectTo (P : Prop) (b : RBool) (r : Rocq.Corelib.Init.Datatypes.reflect P b) :
 P ↔ boolTo b = true := by
 cases r with
 | ReflectT hp => exact ⟨fun _ => rfl, fun _ => hp⟩
 | ReflectF hn =>
  constructor
  · intro hp; cases hn hp
  · intro h; cases h

def reflectOf (P : Prop) (b : RBool) (h : P ↔ boolTo b = true) :
 Rocq.Corelib.Init.Datatypes.reflect P b := by
 cases b with
 | true => exact .ReflectT P (h.mpr rfl)
 | false =>
  apply Rocq.Corelib.Init.Datatypes.reflect.ReflectF P
  intro hp
  have hf : false = true := h.mp hp
  cases hf

def reflectIso (P : Prop) (b : RBool) :
 Iso (Rocq.Corelib.Init.Datatypes.reflect P b) (P ↔ boolTo b = true) where
 to := reflectTo P b
 of := reflectOf P b
 of_to r := by cases r <;> rfl
 to_of _ := rfl

def reflectedDecision (P : Prop) (b : RBool)
 (r : Rocq.Corelib.Init.Datatypes.reflect P b) : Decidable P := by
 cases r with
 | ReflectT hp => exact .isTrue hp
 | ReflectF hn => exact .isFalse (fun hp => by cases hn hp)

theorem reflected_decide_agrees (P : Prop) (b : RBool)
 (r : Rocq.Corelib.Init.Datatypes.reflect P b) :
 @decide P (reflectedDecision P b r) = boolTo b := by
 cases r <;> rfl

theorem bool_forall_native (P : RBool → Prop) :
 (∀ b, P b) ↔ ∀ b : Bool, P (boolOf b) := by
 constructor
 · intro h b; exact h (boolOf b)
 · intro h b; simpa only [bool_of_to] using h (boolTo b)

theorem bool_exists_native (P : RBool → Prop) :
 (∃ b, P b) ↔ ∃ b : Bool, P (boolOf b) := by
 constructor
 · rintro ⟨b, h⟩; exact ⟨boolTo b, by simpa only [bool_of_to] using h⟩
 · rintro ⟨b, h⟩; exact ⟨boolOf b, h⟩

theorem bool_equality_native (a b : RBool) :
 (a = b) ↔ boolTo a = boolTo b := (boolIso.eq_iff a b).symm

theorem reflect_arrow_native (P Q : Prop) (b : RBool) :
 (Rocq.Corelib.Init.Datatypes.reflect P b → Q) ↔ ((P ↔ boolTo b = true) → Q) := by
 constructor
 · intro h r; exact h ((reflectIso P b).of r)
 · intro h r; exact h ((reflectIso P b).to r)


theorem bool_rec_native {C : Sort u} (t f : C) (b : RBool) :
 Rocq.Corelib.Init.Datatypes.bool.rec (motive := fun _ => C) t f b =
 (if boolTo b then t else f) := by
 cases b <;> rfl

theorem bool_function_forall {C : Sort u} (P : (C → RBool) → Prop) :
 (∀ f, P f) ↔ ∀ f : C → Bool, P (fun x => boolOf (f x)) := by
 constructor
 · intro h f; exact h (fun x => boolOf (f x))
 · intro h f
   have hf := h (fun x => boolTo (f x))
   have he : (fun x => boolOf (boolTo (f x))) = f := funext (fun x => bool_of_to (f x))
   simpa only [he] using hf

theorem bool_binary_function_forall {C : Sort u} {D : Sort v}
 (P : (C → D → RBool) → Prop) :
 (∀ f, P f) ↔ ∀ f : C → D → Bool, P (fun x y => boolOf (f x y)) := by
 constructor
 · intro h f; exact h (fun x y => boolOf (f x y))
 · intro h f
   have hf := h (fun x y => boolTo (f x y))
   have he : (fun x y => boolOf (boolTo (f x y))) = f :=
    funext (fun x => funext (fun y => bool_of_to (f x y)))
   simpa only [he] using hf

end NativeBridge.Incremental

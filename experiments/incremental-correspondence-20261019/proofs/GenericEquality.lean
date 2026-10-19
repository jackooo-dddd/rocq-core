import Interface_Init_Equality
noncomputable section
namespace NativeBridge.Incremental.GenericEquality
universe u v w t
set_option linter.checkUnivs false in
abbrev RelationFamily := (A : Type u) → A → A → Type v
def Refl (R : RelationFamily.{u,v}) := (A : Type u) → (x : A) → R A x x
def J (R : RelationFamily.{u,v}) (r : Refl R) :=
  (A : Type u) → (x : A) → (P : (y : A) → R A x y → Type w) →
  P x (r A x) → (y : A) → (e : R A x y) → P y e
def JBackward (R : RelationFamily.{u,v}) (r : Refl R) :=
  (A : Type u) → (x : A) → (P : (y : A) → R A x y → Type w) →
  (y : A) → (e : R A x y) → P y e → P x (r A x)
def JRight (R : RelationFamily.{u,v}) (r : Refl R) :=
  (A : Type u) → (x : A) → (P : (y : A) → R A y x → Type w) →
  P x (r A x) → (y : A) → (e : R A y x) → P y e
def JRightBackward (R : RelationFamily.{u,v}) (r : Refl R) :=
  (A : Type u) → (x : A) → (P : (y : A) → R A y x → Type w) →
  (y : A) → (e : R A y x) → P y e → P x (r A x)
def Leibniz (R : RelationFamily.{u,v}) :=
  (A : Type u) → (x : A) → (P : A → Type w) → P x → (y : A) → R A x y → P y
def LeibnizRight (R : RelationFamily.{u,v}) :=
  (A : Type u) → (x : A) → (P : A → Type w) → P x → (y : A) → R A y x → P y

def reflIso (R : RelationFamily.{u,v}) : Iso (Rocq.Corelib.Init.Equality.Has_refl R) (Refl R) :=
  ⟨id,id,fun _ => rfl,fun _ => rfl⟩
def jIso (R : RelationFamily.{u,v}) (r : Refl R) :
    Iso (Rocq.Corelib.Init.Equality.Has_J.{u,v,w} R r) (J.{u,v,w} R r) :=
  ⟨id,id,fun _ => rfl,fun _ => rfl⟩
def jBackwardIso (R : RelationFamily.{u,v}) (r : Refl R) :
    Iso (Rocq.Corelib.Init.Equality.Has_J_forward.{u,v,w} R r) (JBackward.{u,v,w} R r) :=
  ⟨id,id,fun _ => rfl,fun _ => rfl⟩
def jRightIso (R : RelationFamily.{u,v}) (r : Refl R) :
    Iso (Rocq.Corelib.Init.Equality.Has_J_r.{u,v,w} R r) (JRight.{u,v,w} R r) :=
  ⟨id,id,fun _ => rfl,fun _ => rfl⟩
def jRightBackwardIso (R : RelationFamily.{u,v}) (r : Refl R) :
    Iso (Rocq.Corelib.Init.Equality.Has_J_r_forward.{u,v,w} R r) (JRightBackward.{u,v,w} R r) :=
  ⟨id,id,fun _ => rfl,fun _ => rfl⟩
def leibnizIso (R : RelationFamily.{u,v}) :
    Iso (Rocq.Corelib.Init.Equality.Has_Leibniz.{u,v,w} R) (Leibniz.{u,v,w} R) :=
  ⟨id,id,fun _ => rfl,fun _ => rfl⟩
def leibnizRightIso (R : RelationFamily.{u,v}) :
    Iso (Rocq.Corelib.Init.Equality.Has_Leibniz_r.{u,v,w} R) (LeibnizRight.{u,v,w} R) :=
  ⟨id,id,fun _ => rfl,fun _ => rfl⟩

def jToBackward (R : RelationFamily.{u,v}) (r : Refl R) (j : J.{u,v,w} R r) : JBackward.{u,v,w} R r :=
  fun A x P y e => j A x (fun z h => P z h → P x (r A x)) id y e
def jRightToBackward (R : RelationFamily.{u,v}) (r : Refl R) (j : JRight.{u,v,w} R r) : JRightBackward.{u,v,w} R r :=
  fun A x P y e => j A x (fun z h => P z h → P x (r A x)) id y e
def jToLeibniz (R : RelationFamily.{u,v}) (r : Refl R) (j : J.{u,v,w} R r) : Leibniz.{u,v,w} R :=
  fun A x P px y e => j A x (fun z _ => P z) px y e
def ap (R : RelationFamily.{u,v}) (S : RelationFamily.{w,t})
    (r : Refl S) (l : Leibniz.{u,v,t} R) (A : Type u) (B : Type w)
    (f : A → B) (x y : A) (e : R A x y) : S B (f x) (f y) :=
  l A x (fun y => S B (f x) (f y)) (r B (f x)) y e
def sym (R : RelationFamily.{u,v}) (A : Type u) (r : Refl R)
    (l : Leibniz.{u,v,v} R) (x y : A) (e : R A x y) : R A y x :=
  l A x (fun y => R A y x) (r A x) y e

theorem jToBackward_agrees (R : RelationFamily.{u,v}) (r : Refl R) :
    Rocq.Corelib.Init.Equality.Has_J_Has_J_forward.{u,v,w} R r = jToBackward.{u,v,w} R r := rfl
theorem jToBackward_internal_agrees (R : RelationFamily.{u,v}) (r : Refl R) :
    Rocq.Corelib.Init.Equality._Has_J_Has_J_forward.{u,v,w} R r = jToBackward.{u,v,w} R r := rfl
theorem jRightToBackward_agrees (R : RelationFamily.{u,v}) (r : Refl R) :
    Rocq.Corelib.Init.Equality.Has_J_r_Has_J_r_forward.{u,v,w} R r = jRightToBackward.{u,v,w} R r := rfl
theorem jRightToBackward_internal_agrees (R : RelationFamily.{u,v}) (r : Refl R) :
    Rocq.Corelib.Init.Equality._Has_J_r_Has_J_r_forward.{u,v,w} R r = jRightToBackward.{u,v,w} R r := rfl
theorem jToLeibniz_agrees (R : RelationFamily.{u,v}) (r : Refl R) :
    Rocq.Corelib.Init.Equality.Has_J_Has_Leibniz.{u,v,w} R r = jToLeibniz.{u,v,w} R r := rfl
theorem jNoDep_agrees (R : RelationFamily.{u,v}) (r : Refl R) :
    Rocq.Corelib.Init.Equality.J_no_dep.{u,v,w} R r = jToLeibniz.{u,v,w} R r := rfl
theorem ap_agrees (R : RelationFamily.{u,v}) (S : RelationFamily.{w,t}) :
    Rocq.Corelib.Init.Equality.ap.{u,v,w,t} R S = ap R S := rfl
theorem sym_agrees (R : RelationFamily.{u,v}) :
    Rocq.Corelib.Init.Equality.sym R = sym R := rfl

theorem refl_agrees (R : RelationFamily.{u,v}) :
    Rocq.Corelib.Init.Equality.refl R = @id (Refl R) := rfl
theorem jEliminator_agrees (R : RelationFamily.{u,v}) (r : Refl R) :
    Rocq.Corelib.Init.Equality.J_eliminator.{u,v,w} R r = @id (J.{u,v,w} R r) := rfl
theorem jForward_agrees (R : RelationFamily.{u,v}) (r : Refl R) :
    Rocq.Corelib.Init.Equality.J_forward.{u,v,w} R r = @id (JBackward.{u,v,w} R r) := rfl
theorem jRightEliminator_agrees (R : RelationFamily.{u,v}) (r : Refl R) :
    Rocq.Corelib.Init.Equality.J_r_eliminator.{u,v,w} R r = @id (JRight.{u,v,w} R r) := rfl
theorem jRightForward_agrees (R : RelationFamily.{u,v}) (r : Refl R) :
    Rocq.Corelib.Init.Equality.J_r_forward.{u,v,w} R r = @id (JRightBackward.{u,v,w} R r) := rfl
theorem leibniz_agrees (R : RelationFamily.{u,v}) :
    Rocq.Corelib.Init.Equality.leibniz.{u,v,w} R = @id (Leibniz.{u,v,w} R) := rfl
theorem leibnizRight_agrees (R : RelationFamily.{u,v}) :
    Rocq.Corelib.Init.Equality.leibniz_r.{u,v,w} R = @id (LeibnizRight.{u,v,w} R) := rfl

-- Type-valued generic equality requires PLift to instantiate Lean's Prop-valued Eq.
-- This is an explicit client instantiation, not a change to mechanical Nat/Eq.
def liftedEq (A : Type u) (x y : A) : Type := PLift (x = y)
def liftedRefl : Refl liftedEq.{u} := fun _ _x => ⟨rfl⟩
def liftedJ : J.{u,0,v} liftedEq liftedRefl :=
  fun A x P px y e => by rcases e with ⟨h⟩; cases h; exact px
def liftedLeibniz : Leibniz.{u,0,v} liftedEq :=
  fun A x P px y e => by rcases e with ⟨h⟩; cases h; exact px
theorem ap_nativeEq (A : Type u) (B : Type v) (f : A → B) (x y : A) (h : x = y) :
    Rocq.Corelib.Init.Equality.ap liftedEq liftedEq liftedRefl liftedLeibniz A B f x y ⟨h⟩ =
      (⟨congrArg f h⟩ : PLift (f x = f y)) := by cases h; rfl
theorem sym_nativeEq (A : Type u) (x y : A) (h : x = y) :
    Rocq.Corelib.Init.Equality.sym liftedEq A liftedRefl liftedLeibniz x y ⟨h⟩ =
      (⟨h.symm⟩ : PLift (y = x)) := by cases h; rfl

end NativeBridge.Incremental.GenericEquality

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
  for name in ["NativeBridge.Incremental.GenericEquality.J", "NativeBridge.Incremental.GenericEquality.JBackward", "NativeBridge.Incremental.GenericEquality.JRight", "NativeBridge.Incremental.GenericEquality.JRightBackward", "NativeBridge.Incremental.GenericEquality.Leibniz", "NativeBridge.Incremental.GenericEquality.LeibnizRight", "NativeBridge.Incremental.GenericEquality.Refl", "NativeBridge.Incremental.GenericEquality.ap", "NativeBridge.Incremental.GenericEquality.jRightToBackward", "NativeBridge.Incremental.GenericEquality.jToBackward", "NativeBridge.Incremental.GenericEquality.jToLeibniz", "NativeBridge.Incremental.GenericEquality.sym", "id"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

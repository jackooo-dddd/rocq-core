import SSRBoolIndexed
set_option autoImplicit false
noncomputable section
namespace NativeBridge.Incremental.SSRBoolRestrictions
open NativeBridge SSRBoolData
universe u v w

def sumorSortOf {A : Sort u} {P : Prop} : PSum A P → Rocq.Corelib.Init.Specif.sumor A P
  | .inl a => .inleft A P a
  | .inr h => .inright A P h

def sumIsLeft (A : Sort u) (B : Sort v) : PSum A B → Bool
  | .inl _ => true
  | .inr _ => false

theorem is_left_agrees (P Q : Prop) (x : PSum P Q) :
    boolTo (Rocq.Corelib.ssr.ssrbool.is_left P Q (sumboolOf x)) = sumIsLeft P Q x := by cases x <;> rfl
theorem is_inleft_agrees (A : Sort u) (P : Prop) (x : PSum A P) :
    boolTo (Rocq.Corelib.ssr.ssrbool.is_inleft A P (sumorSortOf x)) = sumIsLeft A P x := by cases x <;> rfl

def prop_for_native (A : Sort u) (x : A) (P : A → Prop) : Prop := P x
theorem prop_for_agrees (A : Sort u) (x : A) (P : A → Prop)
    (ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ a, P a)) :
    Rocq.Corelib.ssr.ssrbool.prop_for A x P ph ↔ prop_for_native A x P := Iff.rfl

def prop_in1_native (T1 : Type u) (d1 : T1 → Bool) (P : T1 → Prop) : Prop := ∀ (x : T1), d1 x = true → P x
theorem prop_in1_agrees (T1 : Type u) (d1 : T1 → Bool) (P : T1 → Prop)
    (ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x : T1), P x)) :
    Rocq.Corelib.ssr.ssrbool.prop_in1 T1 ((memIso T1).of d1) P ph ↔ prop_in1_native T1 d1 P := by
  simp only [Rocq.Corelib.ssr.ssrbool.prop_in1, prop_in1_native, is_true_agrees, in_mem_agrees, Iso.to_of]

def prop_in11_native (T1 : Type u) (T2 : Type v) (d1 : T1 → Bool) (d2 : T2 → Bool) (P : T1 → T2 → Prop) : Prop := ∀ (x : T1) (y : T2), d1 x = true → d2 y = true → P x y
theorem prop_in11_agrees (T1 : Type u) (T2 : Type v) (d1 : T1 → Bool) (d2 : T2 → Bool) (P : T1 → T2 → Prop)
    (ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x : T1) (y : T2), P x y)) :
    Rocq.Corelib.ssr.ssrbool.prop_in11 T1 T2 ((memIso T1).of d1) ((memIso T2).of d2) P ph ↔ prop_in11_native T1 T2 d1 d2 P := by
  simp only [Rocq.Corelib.ssr.ssrbool.prop_in11, prop_in11_native, is_true_agrees, in_mem_agrees, Iso.to_of]

def prop_in111_native (T1 : Type u) (T2 : Type v) (T3 : Type w) (d1 : T1 → Bool) (d2 : T2 → Bool) (d3 : T3 → Bool) (P : T1 → T2 → T3 → Prop) : Prop := ∀ (x : T1) (y : T2) (z : T3), d1 x = true → d2 y = true → d3 z = true → P x y z
theorem prop_in111_agrees (T1 : Type u) (T2 : Type v) (T3 : Type w) (d1 : T1 → Bool) (d2 : T2 → Bool) (d3 : T3 → Bool) (P : T1 → T2 → T3 → Prop)
    (ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x : T1) (y : T2) (z : T3), P x y z)) :
    Rocq.Corelib.ssr.ssrbool.prop_in111 T1 T2 T3 ((memIso T1).of d1) ((memIso T2).of d2) ((memIso T3).of d3) P ph ↔ prop_in111_native T1 T2 T3 d1 d2 d3 P := by
  simp only [Rocq.Corelib.ssr.ssrbool.prop_in111, prop_in111_native, is_true_agrees, in_mem_agrees, Iso.to_of]

def prop_in12_native (T1 : Type u) (T2 : Type v) (d1 : T1 → Bool) (d2 : T2 → Bool) (P : T1 → T2 → T2 → Prop) : Prop := ∀ (x : T1) (y : T2) (z : T2), d1 x = true → d2 y = true → d2 z = true → P x y z
theorem prop_in12_agrees (T1 : Type u) (T2 : Type v) (d1 : T1 → Bool) (d2 : T2 → Bool) (P : T1 → T2 → T2 → Prop)
    (ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x : T1) (y : T2) (z : T2), P x y z)) :
    Rocq.Corelib.ssr.ssrbool.prop_in12 T1 T2 ((memIso T1).of d1) ((memIso T2).of d2) P ph ↔ prop_in12_native T1 T2 d1 d2 P := by
  simp only [Rocq.Corelib.ssr.ssrbool.prop_in12, prop_in12_native, is_true_agrees, in_mem_agrees, Iso.to_of]

def prop_in2_native (T1 : Type u) (d1 : T1 → Bool) (P : T1 → T1 → Prop) : Prop := ∀ (x : T1) (y : T1), d1 x = true → d1 y = true → P x y
theorem prop_in2_agrees (T1 : Type u) (d1 : T1 → Bool) (P : T1 → T1 → Prop)
    (ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x : T1) (y : T1), P x y)) :
    Rocq.Corelib.ssr.ssrbool.prop_in2 T1 ((memIso T1).of d1) P ph ↔ prop_in2_native T1 d1 P := by
  simp only [Rocq.Corelib.ssr.ssrbool.prop_in2, prop_in2_native, is_true_agrees, in_mem_agrees, Iso.to_of]

def prop_in21_native (T1 : Type u) (T2 : Type v) (d1 : T1 → Bool) (d2 : T2 → Bool) (P : T1 → T1 → T2 → Prop) : Prop := ∀ (x : T1) (y : T1) (z : T2), d1 x = true → d1 y = true → d2 z = true → P x y z
theorem prop_in21_agrees (T1 : Type u) (T2 : Type v) (d1 : T1 → Bool) (d2 : T2 → Bool) (P : T1 → T1 → T2 → Prop)
    (ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x : T1) (y : T1) (z : T2), P x y z)) :
    Rocq.Corelib.ssr.ssrbool.prop_in21 T1 T2 ((memIso T1).of d1) ((memIso T2).of d2) P ph ↔ prop_in21_native T1 T2 d1 d2 P := by
  simp only [Rocq.Corelib.ssr.ssrbool.prop_in21, prop_in21_native, is_true_agrees, in_mem_agrees, Iso.to_of]

def prop_in3_native (T1 : Type u) (d1 : T1 → Bool) (P : T1 → T1 → T1 → Prop) : Prop := ∀ (x : T1) (y : T1) (z : T1), d1 x = true → d1 y = true → d1 z = true → P x y z
theorem prop_in3_agrees (T1 : Type u) (d1 : T1 → Bool) (P : T1 → T1 → T1 → Prop)
    (ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x : T1) (y : T1) (z : T1), P x y z)) :
    Rocq.Corelib.ssr.ssrbool.prop_in3 T1 ((memIso T1).of d1) P ph ↔ prop_in3_native T1 d1 P := by
  simp only [Rocq.Corelib.ssr.ssrbool.prop_in3, prop_in3_native, is_true_agrees, in_mem_agrees, Iso.to_of]

def prop_on1_native (A : Type u) (B : Type v) (d : B → Bool) (f : A → B) (P : A → Prop) : Prop := ∀ x, d (f x) = true → P x
theorem prop_on1_agrees (A : Type u) (B : Type v) (C : Type w)
    (d : B → Bool) (f : A → B) (Pf : (A → B) → C) (P : A → Prop)
    (phf : Rocq.Corelib.ssr.ssreflect_rw.phantom C (Pf f))
    (ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ x, P x)) :
    Rocq.Corelib.ssr.ssrbool.prop_on1 A B C ((memIso B).of d) f Pf P phf ph ↔ prop_on1_native A B d f P := by
  simp only [Rocq.Corelib.ssr.ssrbool.prop_on1, prop_on1_native, is_true_agrees, in_mem_agrees, Iso.to_of]

def prop_on2_native (A : Type u) (B : Type v) (d : B → Bool) (f : A → B) (P : A → A → Prop) : Prop := ∀ x y, d (f x) = true → d (f y) = true → P x y
theorem prop_on2_agrees (A : Type u) (B : Type v) (C : Type w)
    (d : B → Bool) (f : A → B) (Pf : (A → B) → C) (P : A → A → Prop)
    (phf : Rocq.Corelib.ssr.ssreflect_rw.phantom C (Pf f))
    (ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ x y, P x y)) :
    Rocq.Corelib.ssr.ssrbool.prop_on2 A B C ((memIso B).of d) f Pf P phf ph ↔ prop_on2_native A B d f P := by
  simp only [Rocq.Corelib.ssr.ssrbool.prop_on2, prop_on2_native, is_true_agrees, in_mem_agrees, Iso.to_of]


def sumboolP_native (P : Prop) (d : Decidable P) : P ↔ @decide P d = true := by
  cases d <;> simp_all

def sumboolPTo (P : Prop) (d : Decidable P)
    (h : Rocq.Corelib.Init.Datatypes.reflect P
      (Rocq.Corelib.ssr.ssrbool.is_left P (Rocq.Corelib.Init.Logic.not P) (SSRBoolData.decidableOf P d))) :
    P ↔ @decide P d = true := by
  have hh := (reflectIso _ _).to h
  cases d <;> simpa [SSRBoolData.decidableOf, Rocq.Corelib.ssr.ssrbool.is_left, boolTo] using hh

theorem sumboolP_agrees (P : Prop) (d : Decidable P) :
    sumboolPTo P d (Rocq.Corelib.ssr.ssrbool.sumboolP P (SSRBoolData.decidableOf P d)) =
      sumboolP_native P d := rfl

def unitIdentity (x : Unit) : Unit := x

theorem check_applicative_mem_pred_agrees (A : Type u) (p : A → Bool) (a x : Unit) :
    (SSRBoolPackaging.applicativeMemIso.{u,v} A (predOf p)).to
      (Rocq.Corelib.ssr.ssrbool.check_applicative_mem_pred A (predOf p)
        ((SSRBoolPackaging.registeredIso.{u,w} A (predOf p)).of a)
        ((SSRBoolPackaging.manifestMemIso.{u,v} A (predOf p)).of x)) =
      unitIdentity x := by cases x; rfl

end NativeBridge.Incremental.SSRBoolRestrictions

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
  for name in ["NativeBridge.Incremental.SSRBoolRestrictions.prop_for_native", "NativeBridge.Incremental.SSRBoolRestrictions.prop_in111_native", "NativeBridge.Incremental.SSRBoolRestrictions.prop_in11_native", "NativeBridge.Incremental.SSRBoolRestrictions.prop_in12_native", "NativeBridge.Incremental.SSRBoolRestrictions.prop_in1_native", "NativeBridge.Incremental.SSRBoolRestrictions.prop_in21_native", "NativeBridge.Incremental.SSRBoolRestrictions.prop_in2_native", "NativeBridge.Incremental.SSRBoolRestrictions.prop_in3_native", "NativeBridge.Incremental.SSRBoolRestrictions.prop_on1_native", "NativeBridge.Incremental.SSRBoolRestrictions.prop_on2_native", "NativeBridge.Incremental.SSRBoolRestrictions.sumIsLeft", "NativeBridge.Incremental.SSRBoolRestrictions.sumboolP_native", "NativeBridge.Incremental.SSRBoolRestrictions.unitIdentity"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

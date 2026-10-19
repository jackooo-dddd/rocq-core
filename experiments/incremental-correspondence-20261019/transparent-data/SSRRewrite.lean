import DataSSRRewrite
set_option autoImplicit false
noncomputable section
namespace NativeBridge.ComputationalCorrespondence.SSRRewrite
open Computational.SSRRewrite.NativeBridge
open Computational.SSRRewrite.Rocq.Corelib.ssr
universe u v

theorem eqTo {A : Sort u} {x y : A}
    (h : Computational.SSRRewrite.Rocq.Corelib.Init.Logic.eq A x y) : x = y :=
  Computational.SSRRewrite.Rocq.Corelib.Init.Logic.eq.rec (motive := fun y _ => x = y) rfl h
theorem eqOf {A : Sort u} {x y : A} (h : x = y) :
    Computational.SSRRewrite.Rocq.Corelib.Init.Logic.eq A x y := by
  cases h
  exact .eq_refl A x
def equalityIso (A : Sort u) (x y : A) :
    Iso (Computational.SSRRewrite.Rocq.Corelib.Init.Logic.eq A x y) (x = y) :=
  Iso.mk eqTo eqOf (fun _ => rfl) (fun _ => rfl)

def contextIso (T : Sort u) (P : T → Type v) (x : T) :
    Iso ((Q : T → Type v) → Computational.SSRRewrite.Rocq.Corelib.Init.Logic.eq (T → Type v) Q P → Q x)
      ((Q : T → Type v) → Q = P → Q x) :=
  Iso.mk (fun f Q h => f Q (eqOf h)) (fun f Q h => f Q (eqTo h))
    (fun _ => rfl) (fun _ => rfl)
theorem contextProof : ssreflect_rw.abstract_context__rocq2lean_obligation_1.statement.{u,v} := by
  intro T P x f h
  exact .eq_refl _ P
theorem reverseProof :
    Computational.SSRRewrite.Rocq.Corelib.Init.Logic.eq_rect_r__rocq2lean_obligation_1.statement.{u,v} := by
  intro A x P h y e
  exact Computational.SSRRewrite.Rocq.Corelib.Init.Logic.eq.rec
    (motive := fun z _ => Computational.SSRRewrite.Rocq.Corelib.Init.Logic.eq A z y) (.eq_refl A y) e

def abstractContext (T : Sort u) (P : T → Type v) (x : T) (f : (Q : T → Type v) → Q = P → Q x) : P x :=
  f P rfl
theorem abstractContext_agrees (T : Sort u) (P : T → Type v) (x : T) (f : (Q : T → Type v) → Q = P → Q x) :
    @Computational.SSRRewrite.RocqPending.Corelib.ssr.ssreflect_rw.abstract_context.{u,v}
      contextProof T P x ((contextIso T P x).of f) = abstractContext T P x f := rfl

def castArrow (P Q : Type u) (e : P = Q) (x : P) : Q := cast e x
theorem castArrow_agrees (P Q : Type u) (e : P = Q) (x : P) :
    @Computational.SSRRewrite.RocqPending.Corelib.ssr.ssreflect_rw.ssr_congr_arrow.{u}
      reverseProof P Q (eqOf e) x = castArrow P Q e x := by
  cases e
  rfl

def haveStep (P : Type u) (Q : Type v) (x : P) (f : P → Q) := f x
theorem haveStep_agrees (P : Type u) (Q : Type v) (x : P) (f : P → Q) :
    ssreflect_rw.ssr_have_upoly.{u,v} P Q x f = haveStep P Q x f := rfl

end NativeBridge.ComputationalCorrespondence.SSRRewrite

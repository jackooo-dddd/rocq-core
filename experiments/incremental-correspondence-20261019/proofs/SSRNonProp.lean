import SSRFunNormalization
noncomputable section
namespace NativeBridge.Incremental.SSRNonProp
open NativeBridge
universe u
def to (t : Rocq.Corelib.ssr.ssreflect_rw.NonPropType.type.{u}) : Bool × Type u :=
  (boolTo (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result t),
   Rocq.Corelib.ssr.ssreflect_rw.NonPropType.callee
    (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.condition
      (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result t)
      (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test t))
    (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result t)
    (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.frame t))
def of (t : Bool × Type u) : Rocq.Corelib.ssr.ssreflect_rw.NonPropType.type.{u} :=
  .Check (boolOf t.1) (.Test (boolOf t.1) .tt) (.Call .tt (boolOf t.1) t.2)
theorem to_of (t : Bool × Type u) : to (of t) = t := by
  cases t with | mk b T => cases b <;> rfl
theorem of_to (t : Rocq.Corelib.ssr.ssreflect_rw.NonPropType.type.{u}) : of (to t) = t := by
  cases t with
  | Check b test frame =>
    cases test with
    | Test condition =>
      cases condition
      cases frame
      cases b <;> rfl
def iso : Iso Rocq.Corelib.ssr.ssreflect_rw.NonPropType.type.{u} (Bool × Type u) :=
  ⟨to,of,of_to,to_of⟩
theorem forall_native (F : Rocq.Corelib.ssr.ssreflect_rw.NonPropType.type.{u} → Prop) :
    (∀ x, F x) ↔ ∀ x : Bool × Type u, F (of x) := by
  constructor
  · intro h x; exact h _
  · intro h x; simpa only [of_to] using h (to x)
theorem callee_of (x : Bool × Type u) :
    Rocq.Corelib.ssr.ssreflect_rw.NonPropType.callee
      (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.condition
        (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result (of x))
        (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test (of x)))
      (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result (of x))
      (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.frame (of x)) = x.2 := rfl
end NativeBridge.Incremental.SSRNonProp

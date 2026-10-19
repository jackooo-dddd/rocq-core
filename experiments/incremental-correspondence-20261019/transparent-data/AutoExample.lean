import AutoCompose
import Consumer
import SSRRewrite
open NativeBridge.ComputationalCorrespondence
namespace NativeBridge.ComputationalCorrespondence.AutoExample

native_compose selectedSum := (fun n : Nat =>
    Consumer.mechanicalPrimeSelection.val n + Consumer.mechanicalPrimeSelection.val (n+2))
  using [Consumer.mechanicalPrimeSelection_value]

example : selectedSum = (fun n : Nat =>
    (if n % 2 = 0 then 2 else 0) + (if (n+2) % 2 = 0 then 2 else 0)) := rfl
example : selectedSum 10 = 4 := rfl
example : selectedSum 11 = 0 := rfl
#eval selectedSum 10
#print axioms selectedSum.correspondence

universe u
theorem haveIdentity_agrees (A : Type u) (x : A) :
    Computational.SSRRewrite.Rocq.Corelib.ssr.ssreflect_rw.ssr_have_upoly A A x (fun y => y) = x :=
  SSRRewrite.haveStep_agrees A A x (fun y => y)

native_compose nativeIdentity := (fun (A : Type u) (x : A) =>
    Computational.SSRRewrite.Rocq.Corelib.ssr.ssreflect_rw.ssr_have_upoly A A x (fun y => y))
  using [haveIdentity_agrees]

example (A : Type u) (x : A) : nativeIdentity A x = x := rfl
#print axioms nativeIdentity.correspondence
end NativeBridge.ComputationalCorrespondence.AutoExample

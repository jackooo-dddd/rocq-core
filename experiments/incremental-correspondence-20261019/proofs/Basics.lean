import Interface_Program_Basics
set_option autoImplicit false
namespace NativeBridge.Incremental
universe u v w
variable {A : Sort u} {B : Sort v} {C : Sort w}
theorem basics_apply_agrees (f : A → B) (x : A) :
 Rocq.Corelib.Program.Basics.apply A B f x = f x := rfl
theorem basics_compose_agrees (g : B → C) (f : A → B) :
 Rocq.Corelib.Program.Basics.compose A B C g f = g ∘ f := rfl
theorem basics_const_agrees (a : A) :
 Rocq.Corelib.Program.Basics.const A B a = (fun _ : B => a) := rfl
theorem basics_flip_agrees (f : A → B → C) :
 Rocq.Corelib.Program.Basics.flip A B C f = (fun b a => f a b) := rfl
theorem basics_arrow_agrees (A : Type u) (B : Type v) :
 Rocq.Corelib.Program.Basics.arrow A B = (A → B) := rfl
theorem basics_impl_agrees (P Q : Prop) :
 Rocq.Corelib.Program.Basics.impl P Q ↔ (P → Q) := Iff.rfl
end NativeBridge.Incremental

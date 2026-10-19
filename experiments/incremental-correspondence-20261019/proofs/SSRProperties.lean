import SSR
set_option autoImplicit false
namespace NativeBridge.Incremental
universe u v w
variable {A : Sort u} {B : Sort v} {C : Sort w}

theorem ssr_cancel_agrees (f : A → B) (g : B → A) :
 Rocq.Corelib.ssr.ssrfun.cancel B A f g ↔ ∀ x, g (f x) = x := by
 simp only [Rocq.Corelib.ssr.ssrfun.cancel, eq_correspondence]

theorem ssr_commutative_agrees (f : A → A → B) :
 Rocq.Corelib.ssr.ssrfun.commutative A B f ↔ ∀ x y, f x y = f y x := by
 simp only [Rocq.Corelib.ssr.ssrfun.commutative, eq_correspondence]

theorem ssr_associative_agrees (f : A → A → A) :
 Rocq.Corelib.ssr.ssrfun.associative A f ↔ ∀ x y z, f x (f y z) = f (f x y) z := by
 simp only [Rocq.Corelib.ssr.ssrfun.associative, eq_correspondence]

theorem ssr_involutive_agrees (f : A → A) :
 Rocq.Corelib.ssr.ssrfun.involutive A f ↔ ∀ x, f (f x) = x := by
 simp only [Rocq.Corelib.ssr.ssrfun.involutive, ssr_cancel_agrees]

theorem ssr_injective_agrees (f : A → B) :
 Rocq.Corelib.ssr.ssrfun.injective B A f ↔ ∀ x y, f x = f y → x = y := by
 simp only [Rocq.Corelib.ssr.ssrfun.injective, eq_correspondence]

theorem ssr_eqfun_agrees (f g : A → B) :
 Rocq.Corelib.ssr.ssrfun.eqfun B A f g ↔ f = g := by
 constructor
 · intro h
   funext x
   exact eqTo (h x)
 · intro h x
   exact eqOf (congrArg (fun k => k x) h)

theorem ssr_eqrel_agrees (f g : A → B → C) :
 Rocq.Corelib.ssr.ssrfun.eqrel C B A f g ↔ f = g := by
 constructor
 · intro h
   funext x y
   exact eqTo (h x y)
 · intro h x y
   exact eqOf (congrArg (fun k => k x y) h)

theorem ssr_left_id_agrees (e : A) (f : A → B → B) :
 Rocq.Corelib.ssr.ssrfun.left_id A B e f ↔ ∀ x, f e x = x := by
 simp only [Rocq.Corelib.ssr.ssrfun.left_id, eq_correspondence]
end NativeBridge.Incremental

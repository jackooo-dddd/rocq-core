
def nativeEqRewDep {A : Sort u} {x : A}
 (P : (a : A) → x = a → Sort v) (z : P x rfl) {y : A} (h : x = y) : P y h :=
 Eq.rec z h
def nativeEqFwdDep {A : Sort u} {x y : A} (h : x = y)
 (P : (a : A) → x = a → Sort v) (z : P y h) : P x rfl :=
 Eq.rec (motive := fun a h => P a h → P x rfl) id h z
def nativeEqFwdRDep {A : Sort u} {x y : A} (h : x = y)
 (P : (a : A) → a = y → Sort v) (z : P x h) : P y rfl := by
 cases h
 exact z
theorem source_eq_rect_agrees {A : Sort u} (x : A) (P : A → Sort v)
 (z : P x) (y : A) (h : ME A x y) :
 Rocq.Corelib.Init.Logic.eq_rect A x P z y h = (eqTo h ▸ z) := by cases h; rfl
theorem source_eq_rew_dep_agrees {A : Sort u} (x : A)
 (P : (a : A) → x = a → Sort v) (z : P x rfl) (y : A) (h : ME A x y) :
 Rocq.Corelib.Init.Logic.eq_rew_dep A x (fun a e => P a (eqTo e)) z y h =
 nativeEqRewDep P z (eqTo h) := by cases h; rfl
theorem source_eq_rew_fwd_dep_agrees {A : Sort u} (x y : A) (h : ME A x y)
 (P : (a : A) → x = a → Sort v) (z : P y (eqTo h)) :
 Rocq.Corelib.Init.Logic.eq_rew_fwd_dep A x y h (fun a e => P a (eqTo e)) z =
 nativeEqFwdDep (eqTo h) P z := by cases h; rfl
theorem source_eq_rew_fwd_r_dep_agrees {A : Sort u} (x y : A) (h : ME A x y)
 (P : (a : A) → a = y → Sort v) (z : P x (eqTo h)) :
 Rocq.Corelib.Init.Logic.eq_rew_fwd_r_dep A x y h (fun a e => P a (eqTo e)) z =
 nativeEqFwdRDep (eqTo h) P z := by cases h; rfl

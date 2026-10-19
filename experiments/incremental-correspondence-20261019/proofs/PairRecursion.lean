import WellFounded
noncomputable section
namespace NativeBridge.Incremental
open NativeBridge
universe u v w

theorem pairAccTo {A : Type u} {B : Type v} (R : A × B → A × B → Prop)
    {p : Rocq.Corelib.Init.Datatypes.prod A B}
    (h : Rocq.Corelib.Init.Wf.Acc _ (fun p q => R (prodTo p) (prodTo q)) p) :
    Acc R (prodTo p) := by
  induction h with
  | Acc_intro p h ih =>
    refine Acc.intro _ (fun y hy => ?_)
    have hh := ih (prodOf y) (by simpa only [prod_to_of] using hy)
    simpa only [prod_to_of] using hh

theorem pairAccOf {A : Type u} {B : Type v} (R : A × B → A × B → Prop)
    {p : A × B} (h : Acc R p) :
    Rocq.Corelib.Init.Wf.Acc _ (fun p q => R (prodTo p) (prodTo q)) (prodOf p) := by
  induction h with
  | intro p h ih =>
    refine Rocq.Corelib.Init.Wf.Acc.Acc_intro _ _ _ (fun y hy => ?_)
    have hh := ih (prodTo y) (by simpa only [prod_to_of] using hy)
    simpa only [prod_of_to] using hh

def pairWellFoundedTo {A : Type u} {B : Type v} (R : A × B → A × B → Prop)
    (wf : Rocq.Corelib.Init.Wf.well_founded _
      (fun p q : Rocq.Corelib.Init.Datatypes.prod A B => R (prodTo p) (prodTo q))) :
    WellFounded R :=
  ⟨fun p => by simpa only [prod_to_of] using pairAccTo R (wf (prodOf p))⟩

def pairWellFoundedOf {A : Type u} {B : Type v} (R : A × B → A × B → Prop)
    (wf : WellFounded R) :
    Rocq.Corelib.Init.Wf.well_founded _
      (fun p q : Rocq.Corelib.Init.Datatypes.prod A B => R (prodTo p) (prodTo q)) :=
  fun p => by simpa only [prod_of_to] using pairAccOf R (wf.apply (prodTo p))

/-- The recursive calls use native pairs; the step and dependent result family are native. -/
theorem pair_fixF_transport {A : Type u} {B : Type v}
    (R : A × B → A × B → Prop) (P : A × B → Type w)
    (F : (p : A × B) → ((q : A × B) → R q p → P q) → P p)
    (p : Rocq.Corelib.Init.Datatypes.prod A B)
    (ac : Rocq.Corelib.Init.Wf.Acc _ (fun p q => R (prodTo p) (prodTo q)) p) :
    Rocq.Corelib.Init.Wf.Fix_F _ (fun p q => R (prodTo p) (prodTo q))
      (fun p => P (prodTo p))
      (fun p rec => F (prodTo p) (fun q h => rec (prodOf q) h)) p ac =
      WellFounded.fixF F (prodTo p) (pairAccTo R ac) := by
  induction ac with
  | Acc_intro p hs ih =>
    rw [WellFounded.fixF_eq]
    change F (prodTo p) _ = F (prodTo p) _
    apply congrArg (F (prodTo p))
    funext q h
    exact ih (prodOf q) h

theorem fixF2_agrees {A : Type u} {B : Type v}
    (R : A × B → A × B → Prop) (P : A → B → Type w)
    (F : (x : A) → (y : B) →
      ((a : A) → (b : B) → R (a,b) (x,y) → P a b) → P x y)
    (x : A) (y : B)
    (ac : Rocq.Corelib.Init.Wf.Acc _ (fun p q => R (prodTo p) (prodTo q))
      (Rocq.Corelib.Init.Datatypes.prod.pair A B x y)) :
    Rocq.Corelib.Init.Wf.Fix_F_2 A B (fun p q => R (prodTo p) (prodTo q)) P F x y ac =
      WellFounded.fixF
        (fun p rec => F p.1 p.2 (fun a b h => rec (a,b) h)) (x,y) (pairAccTo R ac) := by
  exact pair_fixF_transport R (fun p => P p.1 p.2)
    (fun p rec => F p.1 p.2 (fun a b h => rec (a,b) h)) (.pair A B x y) ac

theorem well_founded_induction_type_2_agrees {A : Type u} {B : Type v}
    (R : A × B → A × B → Prop) (P : A → B → Type w)
    (wf : Rocq.Corelib.Init.Wf.well_founded _
      (fun p q : Rocq.Corelib.Init.Datatypes.prod A B => R (prodTo p) (prodTo q)))
    (F : (x : A) → (y : B) →
      ((a : A) → (b : B) → R (a,b) (x,y) → P a b) → P x y)
    (x : A) (y : B) :
    Rocq.Corelib.Init.Wf.well_founded_induction_type_2 A B
      (fun p q => R (prodTo p) (prodTo q)) P wf F x y =
      (pairWellFoundedTo R wf).fix
        (fun p rec => F p.1 p.2 (fun a b h => rec (a,b) h)) (x,y) := by
  exact fixF2_agrees R P F x y (wf (.pair A B x y))


def pairMeasure (p : Nat × Nat) : Nat := p.1 + p.2
def pairRelation (p q : Nat × Nat) : Prop := pairMeasure p < pairMeasure q
def pairNativeWf : WellFounded pairRelation := InvImage.wf pairMeasure Nat.lt_wfRel.wf

def pairCountdownStep (x y : Nat)
    (rec : (a b : Nat) → pairRelation (a,b) (x,y) → Nat) : Nat :=
  match x,y with
  | 0,0 => 0
  | 0,k+1 => rec 0 k (by unfold pairRelation pairMeasure; omega) + 1
  | k+1,y => rec k y (by unfold pairRelation pairMeasure; omega) + 1

def pairCountdown (p : Nat × Nat) : Nat :=
  pairNativeWf.fix (fun p rec => pairCountdownStep p.1 p.2 (fun a b h => rec (a,b) h)) p

theorem pair_countdown_native_correct (x y : Nat) : pairCountdown (x,y) = x + y := by
  induction x with
  | zero =>
    induction y with
    | zero => rw [pairCountdown, WellFounded.fix_eq]; rfl
    | succ y ih =>
      rw [pairCountdown, WellFounded.fix_eq]
      change pairCountdown (0,y) + 1 = 0 + (y+1)
      rw [ih]
      omega
  | succ x ih =>
    rw [pairCountdown, WellFounded.fix_eq]
    change pairCountdown (x,y) + 1 = (x+1) + y
    rw [ih]
    omega

/-- A native measure and native correctness theorem drive the mechanical two-argument Fix. -/
theorem pair_countdown_mechanical_correct (x y : Nat) :
    Rocq.Corelib.Init.Wf.well_founded_induction_type_2 Nat Nat
      (fun p q => pairRelation (prodTo p) (prodTo q))
      (fun _ _ => Nat) (pairWellFoundedOf pairRelation pairNativeWf) pairCountdownStep x y =
      x + y := by
  rw [well_founded_induction_type_2_agrees]
  exact pair_countdown_native_correct x y

end NativeBridge.Incremental

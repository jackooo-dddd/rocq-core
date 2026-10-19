import Interface_Init_Wf

noncomputable section
namespace NativeBridge.Incremental
open NativeBridge
universe u v

def accTo {A : Type u} {R : A → A → Prop} {x : A}
    (a : Rocq.Corelib.Init.Wf.Acc A R x) : Acc R x :=
  Rocq.Corelib.Init.Wf.Acc.rec (motive := fun x _ => Acc R x)
    (fun x _ ih => Acc.intro x ih) a

def accOf {A : Type u} {R : A → A → Prop} {x : A}
    (a : Acc R x) : Rocq.Corelib.Init.Wf.Acc A R x :=
  Acc.rec (motive := fun x _ => Rocq.Corelib.Init.Wf.Acc A R x)
    (fun x _ ih => Rocq.Corelib.Init.Wf.Acc.Acc_intro A R x ih) a

def accIso {A : Type u} (R : A → A → Prop) (x : A) :
    Iso (Rocq.Corelib.Init.Wf.Acc A R x) (Acc R x) :=
  ⟨accTo, accOf, fun _ => rfl, fun _ => rfl⟩

def wellFoundedTo {A : Type u} {R : A → A → Prop}
    (h : Rocq.Corelib.Init.Wf.well_founded A R) : WellFounded R :=
  ⟨fun x => accTo (h x)⟩

def wellFoundedOf {A : Type u} {R : A → A → Prop}
    (h : WellFounded R) : Rocq.Corelib.Init.Wf.well_founded A R :=
  fun x => accOf (h.apply x)

theorem well_founded_agrees {A : Type u} (R : A → A → Prop) :
    Rocq.Corelib.Init.Wf.well_founded A R ↔ WellFounded R :=
  ⟨wellFoundedTo, wellFoundedOf⟩

theorem fixF_agrees {A : Type u} (R : A → A → Prop) (P : A → Type v)
    (F : (x : A) → ((y : A) → R y x → P y) → P x)
    (x : A) (a : Rocq.Corelib.Init.Wf.Acc A R x) :
    Rocq.Corelib.Init.Wf.Fix_F A R P F x a = WellFounded.fixF F x (accTo a) := by
  induction a with
  | Acc_intro x h ih =>
    rw [WellFounded.fixF_eq]
    change F x (fun y hy => Rocq.Corelib.Init.Wf.Fix_F A R P F y (h y hy)) = _
    apply congrArg (F x)
    funext y hy
    exact ih y hy

theorem fix_agrees {A : Type u} (R : A → A → Prop)
    (wf : Rocq.Corelib.Init.Wf.well_founded A R) (P : A → Type v)
    (F : (x : A) → ((y : A) → R y x → P y) → P x) (x : A) :
    Rocq.Corelib.Init.Wf.Fix A R wf P F x = (wellFoundedTo wf).fix F x := by
  exact fixF_agrees R P F x (wf x)

theorem acc_rect_agrees {A : Type u} (R : A → A → Prop) (P : A → Type v)
    (F : (x : A) → ((y : A) → R y x → Rocq.Corelib.Init.Wf.Acc A R y) →
      ((y : A) → R y x → P y) → P x)
    (x : A) (a : Rocq.Corelib.Init.Wf.Acc A R x) :
    Rocq.Corelib.Init.Wf.Acc_rect A R P F x a =
      Acc.rec (motive := fun x _ => P x)
        (fun x h ih => F x (fun y hy => accOf (h y hy)) ih) (accTo a) := by
  induction a with
  | Acc_intro x h ih =>
    change F x h (fun y hy => Rocq.Corelib.Init.Wf.Acc_rect A R P F y (h y hy)) =
      F x _ _
    congr 1
    funext y hy
    exact ih y hy

theorem acc_rec_agrees {A : Type u} (R : A → A → Prop) (P : A → Type)
    (F : (x : A) → ((y : A) → R y x → Rocq.Corelib.Init.Wf.Acc A R y) →
      ((y : A) → R y x → P y) → P x)
    (x : A) (a : Rocq.Corelib.Init.Wf.Acc A R x) :
    Rocq.Corelib.Init.Wf.Acc_rec A R P F x a =
      Acc.rec (motive := fun x _ => P x)
        (fun x h ih => F x (fun y hy => accOf (h y hy)) ih) (accTo a) := by
  exact acc_rect_agrees R P F x a

theorem well_founded_induction_type_agrees {A : Type u} (R : A → A → Prop)
    (wf : Rocq.Corelib.Init.Wf.well_founded A R) (P : A → Type v)
    (F : (x : A) → ((y : A) → R y x → P y) → P x) (x : A) :
    Rocq.Corelib.Init.Wf.well_founded_induction_type A R wf P F x =
      (wellFoundedTo wf).fix F x := by
  exact fix_agrees R wf P F x

theorem well_founded_induction_agrees {A : Type u} (R : A → A → Prop)
    (wf : Rocq.Corelib.Init.Wf.well_founded A R) (P : A → Type)
    (F : (x : A) → ((y : A) → R y x → P y) → P x) (x : A) :
    Rocq.Corelib.Init.Wf.well_founded_induction A R wf P F x =
      (wellFoundedTo wf).fix F x := by
  exact well_founded_induction_type_agrees R wf P F x


/-- Native callbacks receive native accessibility proofs, including the predecessor family. -/
theorem acc_rect_native_callback {A : Type u} (R : A → A → Prop) (P : A → Type v)
    (G : (x : A) → ((y : A) → R y x → Acc R y) →
      ((y : A) → R y x → P y) → P x)
    (x : A) (a : Rocq.Corelib.Init.Wf.Acc A R x) :
    Rocq.Corelib.Init.Wf.Acc_rect A R P
      (fun x h ih => G x (fun y hy => accTo (h y hy)) ih) x a =
      Acc.rec (motive := fun x _ => P x) G (accTo a) := by
  exact acc_rect_agrees R P _ x a

theorem acc_rec_native_callback {A : Type u} (R : A → A → Prop) (P : A → Type)
    (G : (x : A) → ((y : A) → R y x → Acc R y) →
      ((y : A) → R y x → P y) → P x)
    (x : A) (a : Rocq.Corelib.Init.Wf.Acc A R x) :
    Rocq.Corelib.Init.Wf.Acc_rec A R P
      (fun x h ih => G x (fun y hy => accTo (h y hy)) ih) x a =
      Acc.rec (motive := fun x _ => P x) G (accTo a) := by
  exact acc_rect_native_callback R P G x a

/-- Import a native termination proof for a measure on the mechanical Nat carrier. -/
def mechanicalNatMeasureWf :
    Rocq.Corelib.Init.Wf.well_founded MN (fun n m => natTo n < natTo m) :=
  wellFoundedOf (InvImage.wf natTo Nat.lt_wfRel.wf)

/-- A native recursive step function, usable unchanged by the mechanical Fix. -/
def countdownStep (n : Nat) (rec : (k : Nat) → k < n → Nat) : Nat :=
  match n with
  | 0 => 0
  | k + 1 => rec k (Nat.lt_succ_self k) + 1

theorem native_countdown_correct (n : Nat) :
    Nat.lt_wfRel.wf.fix countdownStep n = n := by
  induction n with
  | zero => rw [WellFounded.fix_eq]; rfl
  | succ n ih =>
    rw [WellFounded.fix_eq]
    change Nat.lt_wfRel.wf.fix countdownStep n + 1 = n + 1
    rw [ih]

/-- Consumer example: native well-foundedness enters the source API, native correctness exits it. -/
theorem mechanical_countdown_correct (n : Nat) :
    Rocq.Corelib.Init.Wf.Fix Nat (· < ·) (wellFoundedOf Nat.lt_wfRel.wf)
      (fun _ => Nat) countdownStep n = n := by
  rw [fix_agrees]
  exact native_countdown_correct n

end NativeBridge.Incremental

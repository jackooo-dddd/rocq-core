def sigTo {A : Type u} {P : A → Prop} : Rocq.Corelib.Init.Specif.sig A P → Subtype P :=
  Rocq.Corelib.Init.Specif.sig.rec (fun x h => ⟨x,h⟩)
def sigOf {A : Type u} {P : A → Prop} (x : Subtype P) : Rocq.Corelib.Init.Specif.sig A P := .exist A P x.val x.property
@[simp] theorem sig_of_to {A : Type u} {P : A → Prop} (x : Rocq.Corelib.Init.Specif.sig A P) : sigOf (sigTo x) = x := by cases x <;> rfl
@[simp] theorem sig_to_of {A : Type u} {P : A → Prop} (x : Subtype P) : sigTo (sigOf x) = x := by cases x <;> rfl
def sigIso (A : Type u) (P : A → Prop) : Iso (Rocq.Corelib.Init.Specif.sig A P) (Subtype P) := ⟨sigTo, sigOf, sig_of_to, sig_to_of⟩

def sig2To {A : Type u} {P Q : A → Prop} : Rocq.Corelib.Init.Specif.sig2 A P Q → {x : A // P x ∧ Q x} :=
  Rocq.Corelib.Init.Specif.sig2.rec (fun x hp hq => ⟨x,hp,hq⟩)
def sig2Of {A : Type u} {P Q : A → Prop} (x : {x : A // P x ∧ Q x}) : Rocq.Corelib.Init.Specif.sig2 A P Q :=
  .exist2 A P Q x.val x.property.1 x.property.2
@[simp] theorem sig2_of_to {A : Type u} {P Q : A → Prop} (x : Rocq.Corelib.Init.Specif.sig2 A P Q) : sig2Of (sig2To x) = x := by cases x <;> rfl
@[simp] theorem sig2_to_of {A : Type u} {P Q : A → Prop} (x : {x : A // P x ∧ Q x}) : sig2To (sig2Of x) = x := by cases x <;> rfl
def sig2Iso (A : Type u) (P Q : A → Prop) : Iso (Rocq.Corelib.Init.Specif.sig2 A P Q) {x : A // P x ∧ Q x} := ⟨sig2To, sig2Of, sig2_of_to, sig2_to_of⟩

def sigmaTo {A : Type u} {P : A → Type v} : Rocq.Corelib.Init.Specif.sigT A P → Sigma P :=
  Rocq.Corelib.Init.Specif.sigT.rec (fun x y => ⟨x,y⟩)
def sigmaOf {A : Type u} {P : A → Type v} (x : Sigma P) : Rocq.Corelib.Init.Specif.sigT A P := .existT A P x.1 x.2
@[simp] theorem sigma_of_to {A : Type u} {P : A → Type v} (x : Rocq.Corelib.Init.Specif.sigT A P) : sigmaOf (sigmaTo x) = x := by cases x <;> rfl
@[simp] theorem sigma_to_of {A : Type u} {P : A → Type v} (x : Sigma P) : sigmaTo (sigmaOf x) = x := by cases x <;> rfl
def sigmaIso (A : Type u) (P : A → Type v) : Iso (Rocq.Corelib.Init.Specif.sigT A P) (Sigma P) := ⟨sigmaTo, sigmaOf, sigma_of_to, sigma_to_of⟩

def sigma2To {A : Type u} {P : A → Type v} {Q : A → Type w} : Rocq.Corelib.Init.Specif.sigT2 A P Q → Sigma (fun x => P x × Q x) :=
  Rocq.Corelib.Init.Specif.sigT2.rec (fun x p q => ⟨x,p,q⟩)
def sigma2Of {A : Type u} {P : A → Type v} {Q : A → Type w} (x : Sigma (fun x => P x × Q x)) : Rocq.Corelib.Init.Specif.sigT2 A P Q :=
  .existT2 A P Q x.1 x.2.1 x.2.2
@[simp] theorem sigma2_of_to {A : Type u} {P : A → Type v} {Q : A → Type w} (x : Rocq.Corelib.Init.Specif.sigT2 A P Q) : sigma2Of (sigma2To x) = x := by cases x <;> rfl
@[simp] theorem sigma2_to_of {A : Type u} {P : A → Type v} {Q : A → Type w} (x : Sigma (fun x => P x × Q x)) : sigma2To (sigma2Of x) = x := by cases x with | mk x pq => cases pq; rfl
def sigma2Iso (A : Type u) (P : A → Type v) (Q : A → Type w) : Iso (Rocq.Corelib.Init.Specif.sigT2 A P Q) (Sigma (fun x => P x × Q x)) := ⟨sigma2To, sigma2Of, sigma2_of_to, sigma2_to_of⟩

def sumboolTo {P Q : Prop} : Rocq.Corelib.Init.Specif.sumbool P Q → PSum P Q :=
  Rocq.Corelib.Init.Specif.sumbool.rec PSum.inl PSum.inr
def sumboolOf {P Q : Prop} : PSum P Q → Rocq.Corelib.Init.Specif.sumbool P Q
  | .inl p => .left P Q p
  | .inr q => .right P Q q
@[simp] theorem sumbool_of_to {P Q : Prop} (x : Rocq.Corelib.Init.Specif.sumbool P Q) : sumboolOf (sumboolTo x) = x := by cases x <;> rfl
@[simp] theorem sumbool_to_of {P Q : Prop} (x : PSum P Q) : sumboolTo (sumboolOf x) = x := by cases x <;> rfl
def sumboolIso (P Q : Prop) : Iso (Rocq.Corelib.Init.Specif.sumbool P Q) (PSum P Q) := ⟨sumboolTo, sumboolOf, sumbool_of_to, sumbool_to_of⟩
def decidableTo {P : Prop} : Rocq.Corelib.Init.Specif.sumbool P (¬ P) → Decidable P :=
  Rocq.Corelib.Init.Specif.sumbool.rec Decidable.isTrue Decidable.isFalse
def decidableOf {P : Prop} : Decidable P → Rocq.Corelib.Init.Specif.sumbool P (¬ P)
  | .isTrue h => .left P (¬P) h
  | .isFalse h => .right P (¬P) h
def decidableIso (P : Prop) : Iso (Rocq.Corelib.Init.Specif.sumbool P (¬ P)) (Decidable P) where
  to := decidableTo
  of := decidableOf
  of_to x := by cases x <;> rfl
  to_of x := by cases x <;> rfl

def sumorTo {A : Type u} {P : Prop} : Rocq.Corelib.Init.Specif.sumor A P → PSum A P :=
  Rocq.Corelib.Init.Specif.sumor.rec PSum.inl PSum.inr
def sumorOf {A : Type u} {P : Prop} : PSum A P → Rocq.Corelib.Init.Specif.sumor A P
  | .inl a => .inleft A P a
  | .inr p => .inright A P p
def sumorIso (A : Type u) (P : Prop) : Iso (Rocq.Corelib.Init.Specif.sumor A P) (PSum A P) where
  to := sumorTo
  of := sumorOf
  of_to x := by cases x <;> rfl
  to_of x := by cases x <;> rfl

@[simp] theorem proj1_sig_agrees {A : Type u} {P : A → Prop} (x : Rocq.Corelib.Init.Specif.sig A P) :
  Rocq.Corelib.Init.Specif.proj1_sig A P x = (sigTo x).val := by cases x <;> rfl
@[simp] theorem projT1_agrees {A : Type u} {P : A → Type v} (x : Rocq.Corelib.Init.Specif.sigT A P) :
  Rocq.Corelib.Init.Specif.projT1 A P x = (sigmaTo x).1 := by cases x <;> rfl
theorem projT2_agrees {A : Type u} {P : A → Type v} (x : Rocq.Corelib.Init.Specif.sigT A P) :
  HEq (Rocq.Corelib.Init.Specif.projT2 A P x) (sigmaTo x).2 := by cases x <;> rfl

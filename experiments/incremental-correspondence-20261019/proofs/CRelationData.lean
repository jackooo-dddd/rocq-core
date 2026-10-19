import Interface_Classes_CRelationClasses
set_option autoImplicit false
noncomputable section
namespace NativeBridge.Incremental.CRelationData
open NativeBridge
universe u v w t

abbrev relationNative (A : Type u) := A → A → Type v
abbrev reflexiveNative (A : Type u) (R : A → A → Type v) := (x : A) → R x x
abbrev symmetricNative (A : Type u) (R : A → A → Type v) := (x y : A) → R x y → R y x
abbrev transitiveNative (A : Type u) (R : A → A → Type v) := (x y z : A) → R x y → R y z → R x z
abbrev subrelationNative (A : Type u) (R : A → A → Type v) (S : A → A → Type w) :=
  (x y : A) → R x y → S x y
abbrev arrowNative (A : Type u) (B : Type v) := A → B
abbrev preorderNative (A : Type u) (R : A → A → Type v) :=
  reflexiveNative A R × transitiveNative A R
abbrev perNative (A : Type u) (R : A → A → Type v) :=
  symmetricNative A R × transitiveNative A R
abbrev equivalenceNative (A : Type u) (R : A → A → Type v) :=
  reflexiveNative A R × (symmetricNative A R × transitiveNative A R)
abbrev iffNative (A : Type u) (B : Type v) := (A → B) × (B → A)

def crelationIso (A : Type u) : Iso (Rocq.Corelib.Classes.CRelationClasses.crelation.{u,v} A) (relationNative.{u,v} A) :=
  ⟨id, id, fun _ => rfl, fun _ => rfl⟩

def ReflexiveIso (A : Type u) (R : A → A → Type v) : Iso (Rocq.Corelib.Classes.CRelationClasses.Reflexive A R) (reflexiveNative A R) :=
  ⟨id, id, fun _ => rfl, fun _ => rfl⟩

def SymmetricIso (A : Type u) (R : A → A → Type v) : Iso (Rocq.Corelib.Classes.CRelationClasses.Symmetric A R) (symmetricNative A R) :=
  ⟨id, id, fun _ => rfl, fun _ => rfl⟩

def TransitiveIso (A : Type u) (R : A → A → Type v) : Iso (Rocq.Corelib.Classes.CRelationClasses.Transitive A R) (transitiveNative A R) :=
  ⟨id, id, fun _ => rfl, fun _ => rfl⟩

def subrelationIso (A : Type u) (R : A → A → Type v) (S : A → A → Type w) : Iso (Rocq.Corelib.Classes.CRelationClasses.subrelation A R S) (subrelationNative A R S) :=
  ⟨id, id, fun _ => rfl, fun _ => rfl⟩

def arrowIso (A : Type u) (B : Type v) : Iso (Rocq.Corelib.Classes.CRelationClasses.arrow A B) (arrowNative A B) :=
  ⟨id, id, fun _ => rfl, fun _ => rfl⟩

def PreOrderIso (A : Type u) (R : A → A → Type v) :
    Iso (Rocq.Corelib.Classes.CRelationClasses.PreOrder A R) (preorderNative A R) where
  to x := match x with | .Build_PreOrder _ _ a b => ⟨a,b⟩
  of x := .Build_PreOrder A R x.1 x.2
  of_to x := by cases x <;> rfl
  to_of x := rfl

def PERIso (A : Type u) (R : A → A → Type v) :
    Iso (Rocq.Corelib.Classes.CRelationClasses.PER A R) (perNative A R) where
  to x := match x with | .Build_PER _ _ a b => ⟨a,b⟩
  of x := .Build_PER A R x.1 x.2
  of_to x := by cases x <;> rfl
  to_of x := rfl

def EquivalenceIso (A : Type u) (R : A → A → Type v) :
    Iso (Rocq.Corelib.Classes.CRelationClasses.Equivalence A R) (equivalenceNative A R) where
  to x := match x with | .Build_Equivalence _ _ a b c => ⟨a,b,c⟩
  of x := .Build_Equivalence A R x.1 x.2.1 x.2.2
  of_to x := by cases x <;> rfl
  to_of x := rfl


def iffTIso (A : Type u) (B : Type v) :
    Iso (Rocq.Corelib.Classes.CRelationClasses.iffT A B) (iffNative A B) where
  to x := match x with | .pair _ _ f g => ⟨f,g⟩
  of x := .pair _ _ x.1 x.2
  of_to x := by cases x <;> rfl
  to_of x := rfl

abbrev conjunctionNative (A : Type u) (R : A → A → Type v) (S : A → A → Type w) (x y : A) := R x y × S x y
abbrev disjunctionNative (A : Type u) (R : A → A → Type v) (S : A → A → Type w) (x y : A) := Sum (R x y) (S x y)
def conjunctionIso (A : Type u) (R : A → A → Type v) (S : A → A → Type w) (x y : A) :
    Iso (Rocq.Corelib.Classes.CRelationClasses.relation_conjunction.{u,v,w,t} A R S x y)
      (conjunctionNative A R S x y) where
  to z := match z.down with | .pair _ _ a b => ⟨a,b⟩
  of z := ⟨.pair _ _ z.1 z.2⟩
  of_to z := by cases z with | up z => cases z; rfl
  to_of z := rfl
def disjunctionIso (A : Type u) (R : A → A → Type v) (S : A → A → Type w) (x y : A) :
    Iso (Rocq.Corelib.Classes.CRelationClasses.relation_disjunction.{u,v,w,t} A R S x y)
      (disjunctionNative A R S x y) where
  to z := match z.down with | .inl _ _ a => .inl a | .inr _ _ b => .inr b
  of z := ⟨match z with | .inl a => .inl _ _ a | .inr b => .inr _ _ b⟩
  of_to z := by cases z with | up z => cases z <;> rfl
  to_of z := by cases z <;> rfl

abbrev antisymmetricNative (A : Type u) (E : A → A → Type v) (R : A → A → Type w) :=
  (x y : A) → R x y → R y x → E x y
def antisymmetricIso (A : Type u) (E : A → A → Type v) (equ : equivalenceNative A E) (R : A → A → Type w) :
    Iso (Rocq.Corelib.Classes.CRelationClasses.Antisymmetric A E ((EquivalenceIso A E).of equ) R)
      (antisymmetricNative A E R) := ⟨id,id,fun _ => rfl,fun _ => rfl⟩

def PreOrder_Reflexive_native (A : Type u) (R : A → A → Type v) (h : preorderNative A R) := h.1
theorem PreOrder_Reflexive_agrees (A : Type u) (R : A → A → Type v) (h : preorderNative A R) :
    Rocq.Corelib.Classes.CRelationClasses.PreOrder_Reflexive A R ((PreOrderIso A R).of h) = PreOrder_Reflexive_native A R h := rfl

def PreOrder_Transitive_native (A : Type u) (R : A → A → Type v) (h : preorderNative A R) := h.2
theorem PreOrder_Transitive_agrees (A : Type u) (R : A → A → Type v) (h : preorderNative A R) :
    Rocq.Corelib.Classes.CRelationClasses.PreOrder_Transitive A R ((PreOrderIso A R).of h) = PreOrder_Transitive_native A R h := rfl

def PER_Symmetric_native (A : Type u) (R : A → A → Type v) (h : perNative A R) := h.1
theorem PER_Symmetric_agrees (A : Type u) (R : A → A → Type v) (h : perNative A R) :
    Rocq.Corelib.Classes.CRelationClasses.PER_Symmetric A R ((PERIso A R).of h) = PER_Symmetric_native A R h := rfl

def PER_Transitive_native (A : Type u) (R : A → A → Type v) (h : perNative A R) := h.2
theorem PER_Transitive_agrees (A : Type u) (R : A → A → Type v) (h : perNative A R) :
    Rocq.Corelib.Classes.CRelationClasses.PER_Transitive A R ((PERIso A R).of h) = PER_Transitive_native A R h := rfl

def Equivalence_Reflexive_native (A : Type u) (R : A → A → Type v) (h : equivalenceNative A R) := h.1
theorem Equivalence_Reflexive_agrees (A : Type u) (R : A → A → Type v) (h : equivalenceNative A R) :
    Rocq.Corelib.Classes.CRelationClasses.Equivalence_Reflexive A R ((EquivalenceIso A R).of h) = Equivalence_Reflexive_native A R h := rfl

def Equivalence_Symmetric_native (A : Type u) (R : A → A → Type v) (h : equivalenceNative A R) := h.2.1
theorem Equivalence_Symmetric_agrees (A : Type u) (R : A → A → Type v) (h : equivalenceNative A R) :
    Rocq.Corelib.Classes.CRelationClasses.Equivalence_Symmetric A R ((EquivalenceIso A R).of h) = Equivalence_Symmetric_native A R h := rfl

def Equivalence_Transitive_native (A : Type u) (R : A → A → Type v) (h : equivalenceNative A R) := h.2.2
theorem Equivalence_Transitive_agrees (A : Type u) (R : A → A → Type v) (h : equivalenceNative A R) :
    Rocq.Corelib.Classes.CRelationClasses.Equivalence_Transitive A R ((EquivalenceIso A R).of h) = Equivalence_Transitive_native A R h := rfl


def equivalencePERNative (A : Type u) (R : A → A → Type v) (h : equivalenceNative A R) : perNative A R := h.2
theorem equivalence_PER_agrees (A : Type u) (R : A → A → Type v) (h : equivalenceNative A R) :
    (PERIso A R).to (Rocq.Corelib.Classes.CRelationClasses.Equivalence_PER A R ((EquivalenceIso A R).of h)) =
      equivalencePERNative A R h := rfl

def reflexivityNative (A : Type u) (R : A → A → Type v) (h : reflexiveNative A R) := h
def symmetryNative (A : Type u) (R : A → A → Type v) (h : symmetricNative A R) := h
def transitivityNative (A : Type u) (R : A → A → Type v) (h : transitiveNative A R) := h
def isSubrelationNative (A : Type u) (R : A → A → Type v) (S : A → A → Type w) (h : subrelationNative A R S) := h
theorem reflexivity_agrees (A : Type u) (R : A → A → Type v) (h : reflexiveNative A R) :
    Rocq.Corelib.Classes.CRelationClasses.reflexivity A R h = reflexivityNative A R h := rfl
theorem symmetry_agrees (A : Type u) (R : A → A → Type v) (h : symmetricNative A R) :
    Rocq.Corelib.Classes.CRelationClasses.symmetry A R h = symmetryNative A R h := rfl
theorem transitivity_agrees (A : Type u) (R : A → A → Type v) (h : transitiveNative A R) :
    Rocq.Corelib.Classes.CRelationClasses.transitivity A R h = transitivityNative A R h := rfl
theorem is_subrelation_agrees (A : Type u) (R : A → A → Type v) (S : A → A → Type w) (h : subrelationNative A R S) :
    Rocq.Corelib.Classes.CRelationClasses.is_subrelation A R S h = isSubrelationNative A R S h := rfl
def flipNative (A : Type u) (B : Type v) (C : Type w) (f : A → B → C) := fun b a => f a b
theorem flip_agrees (A : Type u) (B : Type v) (C : Type w) (f : A → B → C) :
    Rocq.Corelib.Classes.CRelationClasses.flip A B C f = flipNative A B C f := rfl


def iffReflexiveNative (A : Type u) : iffNative A A := ⟨id,id⟩
def iffSymmetricNative (A B : Type u) (h : iffNative A B) : iffNative B A := ⟨h.2,h.1⟩
def iffTransitiveNative (A B C : Type u) (h : iffNative A B) (k : iffNative B C) : iffNative A C :=
  ⟨k.1 ∘ h.1, h.2 ∘ k.2⟩
theorem iffT_Reflexive_agrees (A : Type u) :
    (iffTIso A A).to (Rocq.Corelib.Classes.CRelationClasses.iffT_Reflexive.{t,u} A) = iffReflexiveNative A := rfl
theorem iffT_Symmetric_agrees (A B : Type u) (h : iffNative A B) :
    (iffTIso B A).to (Rocq.Corelib.Classes.CRelationClasses.iffT_Symmetric.{t,u} A B ((iffTIso A B).of h)) =
      iffSymmetricNative A B h := rfl
theorem iffT_Transitive_agrees (A B C : Type u) (h : iffNative A B) (k : iffNative B C) :
    (iffTIso A C).to (Rocq.Corelib.Classes.CRelationClasses.iffT_Transitive.{t,u} A B C
      ((iffTIso A B).of h) ((iffTIso B C).of k)) = iffTransitiveNative A B C h k := rfl

def arrowReflexiveNative (A : Type u) : A → A := id
def arrowTransitiveNative (A B C : Type u) (f : A → B) (g : B → C) : A → C := g ∘ f
theorem arrow_Reflexive_agrees (A : Type u) :
    Rocq.Corelib.Classes.CRelationClasses.arrow_Reflexive.{t,u} A = arrowReflexiveNative A := rfl
theorem arrow_Transitive_agrees (A B C : Type u) (f : A → B) (g : B → C) :
    Rocq.Corelib.Classes.CRelationClasses.arrow_Transitive.{t,u} A B C f g = arrowTransitiveNative A B C f g := rfl
theorem arrow_Reflexive_obligation_1_agrees (A : Type u) :
    Rocq.Corelib.Classes.CRelationClasses.arrow_Reflexive_obligation_1 A = arrowReflexiveNative A := rfl
theorem arrow_Transitive_obligation_1_agrees (A B C : Type u) (f : A → B) (g : B → C) :
    Rocq.Corelib.Classes.CRelationClasses.arrow_Transitive_obligation_1 A B C f g = arrowTransitiveNative A B C f g := rfl

abbrev relationEquivalenceNative (A : Type u) (R S : A → A → Type v) :=
  (x y : A) → (R x y → S x y) × (S x y → R x y)
def relationEquivalenceIso (A : Type u) (R S : A → A → Type v) :
    Iso (Rocq.Corelib.Classes.CRelationClasses.relation_equivalence.{u,t,w,v} A R S)
      (relationEquivalenceNative A R S) where
  to h x y := (iffTIso (R x y) (S x y)).to (h.down x y)
  of h := ⟨fun x y => (iffTIso (R x y) (S x y)).of (h x y)⟩
  of_to h := by
    cases h with
    | up h =>
      apply congrArg PULift.up
      funext x y
      exact (iffTIso _ _).of_to _
  to_of h := by funext x y; exact (iffTIso _ _).to_of _

def rewriteNative (A : Type u) (R : A → A → Type v) : Prop := True
def rewriteIso (A : Type u) (R : A → A → Type v) :
    Iso (Rocq.Corelib.Classes.CRelationClasses.RewriteRelation A R) (rewriteNative A R) where
  to _ := True.intro
  of _ := .Build_RewriteRelation A R
  of_to _ := rfl
  to_of _ := rfl

def complementNative (A : Type u) (R : A → A → Type v) (x y : A) : Prop := R x y → False
def complementIso (A : Type u) (R : A → A → Type v) (x y : A) :
    Iso (Rocq.Corelib.Classes.CRelationClasses.complement A R x y) (complementNative A R x y) where
  to h r := by cases h.down r
  of h := ⟨fun r => (h r).elim⟩
  of_to h := by cases h; rfl
  to_of _ := rfl

def irreflexiveNative (A : Type u) (R : A → A → Type v) : Prop := ∀ x, R x x → False
def irreflexiveIso (A : Type u) (R : A → A → Type v) :
    Iso (Rocq.Corelib.Classes.CRelationClasses.Irreflexive A R) (irreflexiveNative A R) where
  to h x := (complementIso A R x x).to (h x)
  of h x := (complementIso A R x x).of (h x)
  of_to h := by funext x; exact (complementIso A R x x).of_to _
  to_of _ := rfl

def asymmetricNative (A : Type u) (R : A → A → Type v) : Prop := ∀ x y, R x y → R y x → False
def asymmetricIso (A : Type u) (R : A → A → Type v) :
    Iso (Rocq.Corelib.Classes.CRelationClasses.Asymmetric.{u,w,v} A R) (asymmetricNative A R) where
  to h x y r s := by cases (h x y r).down s
  of h x y r := ⟨fun s => (h x y r s).elim⟩
  of_to h := by funext x y r; cases h x y r; rfl
  to_of _ := rfl

end NativeBridge.Incremental.CRelationData

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
  for name in ["NativeBridge.Incremental.CRelationData.Equivalence_Reflexive_native", "NativeBridge.Incremental.CRelationData.Equivalence_Symmetric_native", "NativeBridge.Incremental.CRelationData.Equivalence_Transitive_native", "NativeBridge.Incremental.CRelationData.PER_Symmetric_native", "NativeBridge.Incremental.CRelationData.PER_Transitive_native", "NativeBridge.Incremental.CRelationData.PreOrder_Reflexive_native", "NativeBridge.Incremental.CRelationData.PreOrder_Transitive_native", "NativeBridge.Incremental.CRelationData.antisymmetricNative", "NativeBridge.Incremental.CRelationData.arrowNative", "NativeBridge.Incremental.CRelationData.arrowReflexiveNative", "NativeBridge.Incremental.CRelationData.arrowTransitiveNative", "NativeBridge.Incremental.CRelationData.asymmetricNative", "NativeBridge.Incremental.CRelationData.complementNative", "NativeBridge.Incremental.CRelationData.conjunctionNative", "NativeBridge.Incremental.CRelationData.disjunctionNative", "NativeBridge.Incremental.CRelationData.equivalenceNative", "NativeBridge.Incremental.CRelationData.equivalencePERNative", "NativeBridge.Incremental.CRelationData.flipNative", "NativeBridge.Incremental.CRelationData.iffNative", "NativeBridge.Incremental.CRelationData.iffReflexiveNative", "NativeBridge.Incremental.CRelationData.iffSymmetricNative", "NativeBridge.Incremental.CRelationData.iffTransitiveNative", "NativeBridge.Incremental.CRelationData.irreflexiveNative", "NativeBridge.Incremental.CRelationData.isSubrelationNative", "NativeBridge.Incremental.CRelationData.perNative", "NativeBridge.Incremental.CRelationData.preorderNative", "NativeBridge.Incremental.CRelationData.reflexiveNative", "NativeBridge.Incremental.CRelationData.reflexivityNative", "NativeBridge.Incremental.CRelationData.relationEquivalenceNative", "NativeBridge.Incremental.CRelationData.relationNative", "NativeBridge.Incremental.CRelationData.rewriteNative", "NativeBridge.Incremental.CRelationData.subrelationNative", "NativeBridge.Incremental.CRelationData.symmetricNative", "NativeBridge.Incremental.CRelationData.symmetryNative", "NativeBridge.Incremental.CRelationData.transitiveNative", "NativeBridge.Incremental.CRelationData.transitivityNative"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

import Rocq2LeanOut
import Std
set_option maxRecDepth 4096
set_option maxHeartbeats 1000000
-- Supply ordinary Lean eliminator helpers missing from the mechanical artifact.
run_cmd Lean.Elab.Command.liftTermElabM do
  let env ← Lean.getEnv
  for (n, ci) in env.constants.toList do
    if n.toString.startsWith "Rocq." then
      if let .inductInfo _ := ci then
        unless env.contains (.str n "casesOn") do
          Lean.mkCasesOn n
noncomputable section
namespace NativeBridge
universe u v w
/-- Explicit equivalence: no classical choice, no new axiom. -/
structure Iso (A : Sort u) (B : Sort v) where
  to : A → B
  of : B → A
  of_to : ∀ a, of (to a) = a
  to_of : ∀ b, to (of b) = b
def identityIso (A : Sort u) : Iso A A := ⟨id,id,fun _ => rfl,fun _ => rfl⟩
namespace Iso
theorem injective (e : Iso A B) {a b : A} (h : e.to a = e.to b) : a = b :=
  (e.of_to a).symm.trans ((congrArg e.of h).trans (e.of_to b))
theorem eq_iff (e : Iso A B) (a b : A) : e.to a = e.to b ↔ a = b :=
  ⟨e.injective, fun h => congrArg e.to h⟩
theorem surjective (e : Iso A B) (b : B) : ∃ a, e.to a = b := ⟨e.of b, e.to_of b⟩
def symm (e : Iso A B) : Iso B A := ⟨e.of, e.to, e.to_of, e.of_to⟩
def trans (e : Iso A B) (f : Iso B C) : Iso A C where
  to a := f.to (e.to a)
  of c := e.of (f.of c)
  of_to a := by rw [f.of_to, e.of_to]
  to_of c := by rw [e.to_of, f.to_of]
theorem forall_iff (e : Iso A B) (P : A → Prop) (Q : B → Prop)
    (h : ∀ a, P a ↔ Q (e.to a)) : (∀ a, P a) ↔ (∀ b, Q b) := by
  constructor
  · intro hp b
    have hb := (h (e.of b)).mp (hp (e.of b))
    simpa only [e.to_of] using hb
  · intro hq a
    exact (h a).mpr (hq (e.to a))
theorem exists_iff (e : Iso A B) (P : A → Prop) (Q : B → Prop)
    (h : ∀ a, P a ↔ Q (e.to a)) : (∃ a, P a) ↔ (∃ b, Q b) := by
  constructor
  · rintro ⟨a, ha⟩; exact ⟨e.to a, (h a).mp ha⟩
  · rintro ⟨b, hb⟩
    refine ⟨e.of b, (h (e.of b)).mpr ?_⟩
    simpa only [e.to_of] using hb
def functions (a : Iso A B) (b : Iso C D) : Iso (A → C) (B → D) where
  to f x := b.to (f (a.of x))
  of f x := b.of (f (a.to x))
  of_to f := by funext x; simp only [a.of_to, b.of_to]
  to_of f := by funext x; simp only [a.to_of, b.to_of]
def call (a : Iso A B) (b : Iso C D) (f : B → D) (x : A) : C :=
  b.of (f (a.to x))
@[simp] theorem call_agrees (a : Iso A B) (b : Iso C D) (f : B → D) (x : A) :
  b.to (a.call b f x) = f (a.to x) := b.to_of _
def call₂ (a : Iso A B) (b : Iso C D) (c : Iso E F) (f : B → D → F) (x : A) (y : C) : E :=
  c.of (f (a.to x) (b.to y))
@[simp] theorem call₂_agrees (a : Iso A B) (b : Iso C D) (c : Iso E F)
    (f : B → D → F) (x : A) (y : C) :
  c.to (a.call₂ b c f x y) = f (a.to x) (b.to y) := c.to_of _
def decidableEq (e : Iso A B) [DecidableEq B] : DecidableEq A :=
  fun x y => if h : e.to x = e.to y then .isTrue (e.injective h)
    else .isFalse (fun hxy => h (congrArg e.to hxy))
def lists {A : Type u} {B : Type v} (e : Iso A B) : Iso (List A) (List B) where
  to := List.map e.to
  of := List.map e.of
  of_to xs := by
    induction xs with
    | nil => rfl
    | cons x xs ih => simp only [List.map_cons, e.of_to, ih]
  to_of xs := by
    induction xs with
    | nil => rfl
    | cons x xs ih => simp only [List.map_cons, e.to_of, ih]
def options {A : Type u} {B : Type v} (e : Iso A B) : Iso (Option A) (Option B) where
  to := Option.map e.to
  of := Option.map e.of
  of_to x := by cases x <;> simp only [Option.map_none, Option.map_some, e.of_to]
  to_of x := by cases x <;> simp only [Option.map_none, Option.map_some, e.to_of]

def products {A : Type u} {B : Type v} {C : Type w} {D : Type _}
 (a : Iso A B) (b : Iso C D) : Iso (A × C) (B × D) where
 to x := (a.to x.1, b.to x.2)
 of x := (a.of x.1, b.of x.2)
 of_to x := by cases x; simp only [a.of_to, b.of_to]
 to_of x := by cases x; simp only [a.to_of, b.to_of]
def sums {A : Type u} {B : Type v} {C : Type w} {D : Type _}
 (a : Iso A B) (b : Iso C D) : Iso (Sum A C) (Sum B D) where
 to := Sum.map a.to b.to
 of := Sum.map a.of b.of
 of_to x := by cases x <;> simp [Sum.map, a.of_to, b.of_to]
 to_of x := by cases x <;> simp [Sum.map, a.to_of, b.to_of]
def propositions {P Q : Prop} (h : P ↔ Q) : Iso P Q :=
 ⟨h.mp, h.mpr, fun _ => rfl, fun _ => rfl⟩
def subtypes {A : Type u} {B : Type v} (e : Iso A B) (P : A → Prop) (Q : B → Prop)
 (h : ∀ a, P a ↔ Q (e.to a)) : Iso {a // P a} {b // Q b} where
 to a := ⟨e.to a.val, (h a.val).mp a.property⟩
 of b := ⟨e.of b.val, (h (e.of b.val)).mpr (by simpa only [e.to_of] using b.property)⟩
 of_to a := Subtype.ext (e.of_to a.val)
 to_of b := Subtype.ext (e.to_of b.val)
/-- Native-side presentation of ANY source function on bridged types. -/
def exportFunction (a : Iso A B) (b : Iso C D) (f : A → C) : B → D :=
 (a.functions b).to f
@[simp] theorem exportFunction_agrees (a : Iso A B) (b : Iso C D) (f : A → C) (x : A) :
 a.exportFunction b f (a.to x) = b.to (f x) := by
 change b.to (f (a.of (a.to x))) = _
 rw [a.of_to]
theorem transfer (P Q : Prop) (h : P ↔ Q) (proof : P) : Q := h.mp proof
theorem transferBack (P Q : Prop) (h : P ↔ Q) (proof : Q) : P := h.mpr proof

end Iso
def natIso : Iso Nat Nat := ⟨id, id, fun _ => rfl, fun _ => rfl⟩
theorem eq_correspondence {A : Sort u} (x y : A) : (x = y) ↔ (x = y) := Iff.rfl

abbrev RBool := Rocq.Corelib.Init.Datatypes.bool
def boolTo : RBool → Bool :=
  Rocq.Corelib.Init.Datatypes.bool.rec true false
def boolOf (b : Bool) : RBool := if b then .true else .false
@[simp] theorem bool_of_to (b : RBool) : boolOf (boolTo b) = b := by cases b <;> rfl
@[simp] theorem bool_to_of (b : Bool) : boolTo (boolOf b) = b := by cases b <;> rfl
def boolIso : Iso RBool Bool := ⟨boolTo, boolOf, bool_of_to, bool_to_of⟩

def optionTo {A : Type u} : Rocq.Corelib.Init.Datatypes.option A → Option A :=
  Rocq.Corelib.Init.Datatypes.option.rec (fun x => some x) none

def optionOf {A : Type u} : Option A → Rocq.Corelib.Init.Datatypes.option A
  | some x => .Some A x
  | none => .None A

@[simp] theorem option_of_to {A : Type u} (x : Rocq.Corelib.Init.Datatypes.option A) : optionOf (optionTo x) = x := by cases x <;> rfl

@[simp] theorem option_to_of {A : Type u} (x : Option A) : optionTo (optionOf x) = x := by cases x <;> rfl

def optionIso (A : Type u) : Iso (Rocq.Corelib.Init.Datatypes.option A) (Option A) := ⟨optionTo, optionOf, option_of_to, option_to_of⟩


def prodTo {A : Type u} {B : Type v} : Rocq.Corelib.Init.Datatypes.prod A B → A × B :=
  Rocq.Corelib.Init.Datatypes.prod.rec (fun a b => (a,b))

def prodOf {A : Type u} {B : Type v} (x : A × B) : Rocq.Corelib.Init.Datatypes.prod A B := .pair A B x.1 x.2

@[simp] theorem prod_of_to {A : Type u} {B : Type v} (x : Rocq.Corelib.Init.Datatypes.prod A B) : prodOf (prodTo x) = x := by cases x <;> rfl

@[simp] theorem prod_to_of {A : Type u} {B : Type v} (x : A × B) : prodTo (prodOf x) = x := by cases x <;> rfl

def prodIso (A : Type u) (B : Type v) : Iso (Rocq.Corelib.Init.Datatypes.prod A B) (A × B) := ⟨prodTo, prodOf, prod_of_to, prod_to_of⟩


def sumTo {A : Type u} {B : Type v} : Rocq.Corelib.Init.Datatypes.sum A B → Sum A B :=
  Rocq.Corelib.Init.Datatypes.sum.rec Sum.inl Sum.inr

def sumOf {A : Type u} {B : Type v} : Sum A B → Rocq.Corelib.Init.Datatypes.sum A B
  | .inl x => .inl A B x
  | .inr y => .inr A B y

@[simp] theorem sum_of_to {A : Type u} {B : Type v} (x : Rocq.Corelib.Init.Datatypes.sum A B) : sumOf (sumTo x) = x := by cases x <;> rfl

@[simp] theorem sum_to_of {A : Type u} {B : Type v} (x : Sum A B) : sumTo (sumOf x) = x := by cases x <;> rfl

def sumIso (A : Type u) (B : Type v) : Iso (Rocq.Corelib.Init.Datatypes.sum A B) (Sum A B) := ⟨sumTo, sumOf, sum_of_to, sum_to_of⟩


def unitIso : Iso Rocq.Corelib.Init.Datatypes.unit Unit where
  to _ := ()
  of _ := .tt
  of_to x := by cases x; rfl
  to_of x := by cases x; rfl

@[simp] theorem andb_agrees (a b : RBool) : boolTo (Rocq.Corelib.Init.Datatypes.andb a b) = (boolTo a && boolTo b) := by cases a <;> cases b <;> rfl

@[simp] theorem orb_agrees (a b : RBool) : boolTo (Rocq.Corelib.Init.Datatypes.orb a b) = (boolTo a || boolTo b) := by cases a <;> cases b <;> rfl

@[simp] theorem negb_agrees (a : RBool) : boolTo (Rocq.Corelib.Init.Datatypes.negb a) = !boolTo a := by cases a <;> rfl

@[simp] theorem implb_agrees (a b : RBool) : boolTo (Rocq.Corelib.Init.Datatypes.implb a b) = (!boolTo a || boolTo b) := by cases a <;> cases b <;> rfl

@[simp] theorem is_true_agrees (a : RBool) : Rocq.Corelib.Init.Datatypes.is_true a ↔ boolTo a = true := by
  cases a
  · constructor <;> intro h <;> rfl
  · constructor
    · intro h
      exact congrArg boolTo h
    · intro h
      exact Bool.noConfusion h

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

abbrev NativeArray (A : Type u) := Σ n : Fin (4194304), Vector A n.val × A

abbrev NativeByteString := Σ n : Fin (16777212), Vector (BitVec 8) n.val


end NativeBridge
open Lean Meta Elab Command
private def hasSource (e : Expr) : Bool :=
 e.getUsedConstants.any fun n =>
  n.toString.startsWith "Rocq." || n.toString.startsWith "RocqPending." ||
  n.toString.startsWith "Rocq2Lean."
private partial def findNativeIso (ty : Expr) : MetaM Expr := do
 let fn := ty.getAppFn
 let args := ty.getAppArgs
 let name := fn.constName?.getD .anonymous
 let simple : List (String × String) := [
  ("Rocq.Corelib.Init.Datatypes.bool","boolIso"),
  ("Rocq.Corelib.Init.Datatypes.comparison","comparisonIso"),
  ("Rocq.Corelib.Init.Datatypes.unit","unitIso"),
  ("Rocq.Corelib.Init.Datatypes.Empty_set","emptyIso"),
  ("Rocq.Corelib.Numbers.BinNums.positive","positiveIso"),
  ("Rocq.Corelib.Numbers.BinNums.N","binaryNatIso"),
  ("Rocq.Corelib.Numbers.BinNums.Z","binaryIntIso"),
  ("Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int","int63Iso"),
  ("Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int_wrapper","int63WrapperIso"),
  ("Rocq.Corelib.Init.Byte.byte","byteIso"),
  ("Rocq.Corelib.Floats.FloatClass.float_class","floatClassIso"),
  ("Rocq.Corelib.Init.Decimal.uint","decimalDigitsIso"),
  ("Rocq.Corelib.Init.Hexadecimal.uint","hexadecimalDigitsIso"),
  ("Rocq.Corelib.Strings.PrimString.string","byteStringIso")]
 for (source,bridge) in simple do
  let bn := ("NativeBridge."++bridge).toName
  if name.toString == source && args.isEmpty && (← getEnv).contains bn then
   return ← mkConstWithFreshMVarLevels bn
 if let .forallE _ domain body _ := ty then
  if !body.hasLooseBVars then
   let a ← findNativeIso domain
   let b ← findNativeIso body
   return ← mkAppM "NativeBridge.Iso.functions".toName #[a,b]
 for (source,bridge,lift) in [
   ("Rocq.Corelib.Init.Datatypes.list","listIso","lists"),
   ("Rocq.Corelib.Init.Datatypes.option","optionIso","options")] do
  if name.toString == source && args.size == 1 then
   let e ← findNativeIso args[0]!
   let first ← mkAppM ("NativeBridge."++bridge).toName #[args[0]!]
   let second ← mkAppM ("NativeBridge.Iso."++lift).toName #[e]
   return ← mkAppM "NativeBridge.Iso.trans".toName #[first,second]
 for (source,bridge,lift) in [
   ("Rocq.Corelib.Init.Datatypes.prod","prodIso","products"),
   ("Rocq.Corelib.Init.Datatypes.sum","sumIso","sums")] do
  if name.toString == source && args.size == 2 then
   let a ← findNativeIso args[0]!
   let b ← findNativeIso args[1]!
   let first ← mkAppM ("NativeBridge."++bridge).toName args
   let second ← mkAppM ("NativeBridge.Iso."++lift).toName #[a,b]
   return ← mkAppM "NativeBridge.Iso.trans".toName #[first,second]

 for (source,bridge) in [
   ("Rocq.Corelib.Init.Specif.sig","sigIso"),
   ("Rocq.Corelib.Init.Specif.sig2","sig2Iso"),
   ("Rocq.Corelib.Init.Specif.sigT","sigmaIso"),
   ("Rocq.Corelib.Init.Specif.sigT2","sigma2Iso"),
   ("Rocq.Corelib.Init.Specif.sumbool","sumboolIso"),
   ("Rocq.Corelib.Init.Specif.sumor","sumorIso"),
   ("Rocq.Corelib.Init.Datatypes.result","resultIso"),
   ("Rocq.Corelib.Array.PrimArray.array","arrayIso")] do
  let bn := ("NativeBridge."++bridge).toName
  if name.toString == source && !args.any hasSource && (← getEnv).contains bn then
   return ← mkAppM bn args
 -- Preserve arbitrary parameters only when their type contains no source API.
 if !hasSource ty then
  let u ← getLevel ty
  return mkApp (mkConst "NativeBridge.identityIso".toName [u]) ty
 let reduced ← whnf ty
 if reduced != ty then return ← findNativeIso reduced
 throwError "No registered type bijection for {ty}"
private partial def exportInterface (value ty : Expr) : MetaM (Expr × Expr × Expr) := do
 if let .forallE n domain body bi := ty then
  let domain ← whnf domain
  if body.hasLooseBVars && !hasSource domain then
   return ← withLocalDecl n bi domain fun x => do
    let (out,statement,proof) ← exportInterface (mkApp value x) (body.instantiate1 x)
    return (← mkLambdaFVars #[x] out, ← mkForallFVars #[x] statement, ← mkLambdaFVars #[x] proof)
 let e ← findNativeIso ty
 let out ← mkAppM "NativeBridge.Iso.to".toName #[e,value]
 let back ← mkAppM "NativeBridge.Iso.of".toName #[e,out]
 let statement ← mkEq back value
 let proof ← mkAppM "NativeBridge.Iso.of_to".toName #[e,value]
 return (out,statement,proof)
syntax (name := exportNative) "#export_native " ident : command
@[command_elab exportNative] def elabExportNative : CommandElab := fun stx => do
 let source := stx[1].getId
 try
  liftTermElabM do
   let ci ← getConstInfo source
   let .defnInfo di := ci | throwError "not a computational definition"
   -- Native containers require Type, while Rocq template instances can use Sort.
   -- Retain the exact universes first; only the fallback raises naked Sort parameters.
   let tryExport (raiseSort : Bool) := do
    let raise := di.levelParams.filter fun p => (di.type.find? fun e => e == .sort (.param p)).isSome
    let ls := di.levelParams.map fun p => if raiseSort && raise.contains p then Level.succ (.param p) else .param p
    exportInterface (mkConst source ls) (di.type.instantiateLevelParams di.levelParams ls)
   let ((out,statement,proof),specialized) ← try do pure (← tryExport false, false) catch _ => do pure (← tryExport true, true)
   let out ← instantiateMVars out
   let outTy ← instantiateMVars (← inferType out)
   let statement ← instantiateMVars statement
   let proof ← instantiateMVars proof
   if out.hasMVar || outTy.hasMVar || proof.hasMVar then throwError "unsolved metavariables"
   let name := ("NativeBridge.Interfaces."++source.toString).toName
   addDecl (.defnDecl { name:=name++"native".toName,levelParams:=di.levelParams,type:=outTy,value:=out,hints:=.abbrev,safety:=.safe })
   addDecl (.thmDecl { name:=name++"roundtrip".toName,levelParams:=di.levelParams,type:=statement,value:=proof })
   logInfo m!"INTERFACE_OK {source} type_universe_specialization={specialized}"
 catch ex =>
  logInfo m!"INTERFACE_SKIP {source}: {← ex.toMessageData.toString}"
namespace NativeBridge

#export_native Rocq.Corelib.ssr.ssrbool.pred
#export_native Rocq.Corelib.ssr.ssrbool.pred_sort
#export_native Rocq.Corelib.ssr.ssrbool.predPredType
#export_native Rocq.Corelib.ssr.ssrbool.pred_of_mem
#export_native Rocq.Corelib.ssr.ssrbool.in_mem
#export_native Rocq.Corelib.ssr.ssrbool.eq_mem
#export_native Rocq.Corelib.ssr.ssrbool.mem
#export_native Rocq.Corelib.ssr.ssrbool.has_quality
#export_native Rocq.Corelib.ssr.ssrbool.simpl_pred
#export_native Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce
#export_native Rocq.Corelib.ssr.ssrbool.SimplPred
#export_native Rocq.Corelib.ssr.ssrbool.rel
#export_native Rocq.Corelib.ssr.ssrbool.simpl_rel
#export_native Rocq.Corelib.ssr.ssrbool.SimplRel
#export_native Rocq.Corelib.ssr.ssrbool.addb
#export_native Rocq.Corelib.ssr.ssrbool.and3_rec
#export_native Rocq.Corelib.ssr.ssrbool.and3_rect
#export_native Rocq.Corelib.ssr.ssrbool.and4_rec
#export_native Rocq.Corelib.ssr.ssrbool.and4_rect
#export_native Rocq.Corelib.ssr.ssrbool.and5_rec
#export_native Rocq.Corelib.ssr.ssrbool.and5_rect
#export_native Rocq.Corelib.ssr.ssrbool.antisymmetric
#export_native Rocq.Corelib.ssr.ssrbool.applicative_pred_value
#export_native Rocq.Corelib.ssr.ssrbool.applicative_mem_pred_value
#export_native Rocq.Corelib.ssr.ssrbool.applicative_pred
#export_native Rocq.Corelib.ssr.ssrbool.applicative_pred_of_simpl
#export_native Rocq.Corelib.ssr.ssrbool.prop_in1
#export_native Rocq.Corelib.ssr.ssrbool.prop_on1
#export_native Rocq.Corelib.ssr.ssrbool.unless
#export_native Rocq.Corelib.ssr.ssrbool.boolfunPredType
#export_native Rocq.Corelib.ssr.ssrbool.predArgType
#export_native Rocq.Corelib.ssr.ssrbool.prop_in2
#export_native Rocq.Corelib.ssr.ssrbool.check_applicative_mem_pred
#export_native Rocq.Corelib.ssr.ssrbool.classically
#export_native Rocq.Corelib.ssr.ssrbool.decidable
#export_native Rocq.Corelib.ssr.ssrbool.clone_pred
#export_native Rocq.Corelib.ssr.ssrbool.collective_pred
#export_native Rocq.Corelib.ssr.ssrbool.collective_pred_of_simpl
#export_native Rocq.Corelib.ssr.ssrbool.equivalence_rel
#export_native Rocq.Corelib.ssr.ssrbool.reflexive
#export_native Rocq.Corelib.ssr.ssrbool.left_transitive
#export_native Rocq.Corelib.ssr.ssrbool.prop_in3
#export_native Rocq.Corelib.ssr.ssrbool.prop_for
#export_native Rocq.Corelib.ssr.ssrbool.fun_of_pred
#export_native Rocq.Corelib.ssr.ssrbool.fun_of_rel
#export_native Rocq.Corelib.ssr.ssrbool.prop_in11
#export_native Rocq.Corelib.ssr.ssrbool.if_expr
#export_native Rocq.Corelib.ssr.ssrbool.predT
#export_native Rocq.Corelib.ssr.ssrbool.pred_of_argType
#export_native Rocq.Corelib.ssr.ssrbool.prop_in111
#export_native Rocq.Corelib.ssr.ssrbool.mem_pred_value
#export_native Rocq.Corelib.ssr.ssrbool.simpl_pred_value
#export_native Rocq.Corelib.ssr.ssrbool.simplPredType
#export_native Rocq.Corelib.ssr.ssrbool.prop_on2
#export_native Rocq.Corelib.ssr.ssrbool.irreflexive
#export_native Rocq.Corelib.ssr.ssrbool.isSome
#export_native Rocq.Corelib.ssr.ssrbool.is_inl
#export_native Rocq.Corelib.ssr.ssrbool.is_inleft
#export_native Rocq.Corelib.ssr.ssrbool.is_left
#export_native Rocq.Corelib.ssr.ssrbool.unkey_pred
#export_native Rocq.Corelib.ssr.ssrbool.simpl_of_mem
#export_native Rocq.Corelib.ssr.ssrbool.unkey_qualifier
#export_native Rocq.Corelib.ssr.ssrbool.memPredType
#export_native Rocq.Corelib.ssr.ssrbool.topred
#export_native Rocq.Corelib.ssr.ssrbool.pred_oapp
#export_native Rocq.Corelib.ssr.ssrbool.pre_symmetric
#export_native Rocq.Corelib.ssr.ssrbool.pred0
#export_native Rocq.Corelib.ssr.ssrbool.predC
#export_native Rocq.Corelib.ssr.ssrbool.predD
#export_native Rocq.Corelib.ssr.ssrbool.predI
#export_native Rocq.Corelib.ssr.ssrbool.predU
#export_native Rocq.Corelib.ssr.ssrbool.preim
#export_native Rocq.Corelib.ssr.ssrbool.prop_in12
#export_native Rocq.Corelib.ssr.ssrbool.prop_in21
#export_native Rocq.Corelib.ssr.ssrbool.relU
#export_native Rocq.Corelib.ssr.ssrbool.rel_of_simpl
#export_native Rocq.Corelib.ssr.ssrbool.relpre
#export_native Rocq.Corelib.ssr.ssrbool.transitive
#export_native Rocq.Corelib.ssr.ssrbool.right_transitive
#export_native Rocq.Corelib.ssr.ssrbool.sort_of_predArgType
#export_native Rocq.Corelib.ssr.ssrbool.sub_mem
#export_native Rocq.Corelib.ssr.ssrbool.subpred
#export_native Rocq.Corelib.ssr.ssrbool.subrel
#export_native Rocq.Corelib.ssr.ssrbool.symmetric
#export_native Rocq.Corelib.ssr.ssrbool.total
end NativeBridge
run_cmd Lean.Elab.Command.liftTermElabM do
  let env ← Lean.getEnv
  let mut rows : Array Lean.Json := #[]
  for (n, ci) in env.constants.toList do
    if n.toString.startsWith "NativeBridge." then
      if ci.isDefinition || ci.isTheorem then
        let axs ← Lean.collectAxioms n
        for ax in axs do
          unless ["propext", "Quot.sound", "Classical.choice"].contains ax.toString do
            throwError "Unapproved axiom in {n}: {ax}"
        let ty ← Lean.Meta.ppExpr ci.type
        let mut bodyRefs : Array Lean.Json := #[]
        let mut bodyText := ""
        if n.toString.endsWith ".native" then
          if let some body := ci.value? then
            bodyText := (← Lean.Meta.ppExpr body).pretty
            for r in body.getUsedConstants do
              if r.toString.startsWith "Rocq." || r.toString.startsWith "RocqPending." || r.toString.startsWith "Rocq2Lean." then
                bodyRefs := bodyRefs.push (.str r.toString)
        let mut refs : Array Lean.Json := #[]
        for r in ci.type.getUsedConstants do
          if r.toString.startsWith "Rocq." || r.toString.startsWith "RocqPending." || r.toString.startsWith "Rocq2Lean." then
            refs := refs.push (.str r.toString)
        rows := rows.push (Lean.Json.mkObj [
          ("name", .str n.toString),
          ("kind", .str (if ci.isTheorem then "theorem" else "definition")),
          ("type", .str ty.pretty),
          ("source_references", .arr refs),
          ("native_body", .str bodyText),
          ("remaining_source_symbols", .arr bodyRefs),
          ("axioms", .arr (axs.map (fun a => .str a.toString)))])
  IO.FS.writeFile "/home/shunqwang4/research/rocq-core/experiments/mechanical-correspondence-20261019/legacy/audits/Interface_ssr_ssrbool.json" (Lean.Json.pretty (.arr rows))

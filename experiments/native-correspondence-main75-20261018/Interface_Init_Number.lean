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

@[simp] theorem andb_agrees (a b : RBool) : boolTo (Rocq.Corelib.Init.Datatypes.andb a b) = (boolTo a && boolTo b) := by cases a <;> cases b <;> rfl

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


abbrev NativeArray (A : Type u) := Σ n : Fin (4194304), Vector A n.val × A

abbrev NativeByteString := Σ n : Fin (16777212), Vector (BitVec 8) n.val

def decimalDigitsTo : Rocq.Corelib.Init.Decimal.uint → List (Fin 10) := Rocq.Corelib.Init.Decimal.uint.rec [] (fun _ xs => (⟨0,by decide⟩ : Fin 10) :: xs) (fun _ xs => (⟨1,by decide⟩ : Fin 10) :: xs) (fun _ xs => (⟨2,by decide⟩ : Fin 10) :: xs) (fun _ xs => (⟨3,by decide⟩ : Fin 10) :: xs) (fun _ xs => (⟨4,by decide⟩ : Fin 10) :: xs) (fun _ xs => (⟨5,by decide⟩ : Fin 10) :: xs) (fun _ xs => (⟨6,by decide⟩ : Fin 10) :: xs) (fun _ xs => (⟨7,by decide⟩ : Fin 10) :: xs) (fun _ xs => (⟨8,by decide⟩ : Fin 10) :: xs) (fun _ xs => (⟨9,by decide⟩ : Fin 10) :: xs)
def decimalDigitsPrepend (d : Fin 10) (xs : Rocq.Corelib.Init.Decimal.uint) : Rocq.Corelib.Init.Decimal.uint := ((fun i => Fin.cases (Rocq.Corelib.Init.Decimal.uint.D0 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Decimal.uint.D1 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Decimal.uint.D2 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Decimal.uint.D3 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Decimal.uint.D4 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Decimal.uint.D5 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Decimal.uint.D6 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Decimal.uint.D7 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Decimal.uint.D8 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Decimal.uint.D9 xs) (fun i => Fin.elim0 i) i) i) i) i) i) i) i) i) i) i)) d
def decimalDigitsOf : List (Fin 10) → Rocq.Corelib.Init.Decimal.uint
  | [] => Rocq.Corelib.Init.Decimal.uint.Nil
  | d :: ds => decimalDigitsPrepend d (decimalDigitsOf ds)
theorem decimalDigits_prepend (xs : Rocq.Corelib.Init.Decimal.uint) : ∀ d : Fin 10, decimalDigitsTo (decimalDigitsPrepend d xs) = d :: decimalDigitsTo xs := (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.elim0 i) i) i) i) i) i) i) i) i) i) i)
@[simp] theorem decimalDigits_of_to (x : Rocq.Corelib.Init.Decimal.uint) : decimalDigitsOf (decimalDigitsTo x) = x :=
  Rocq.Corelib.Init.Decimal.uint.rec rfl (fun x ih => congrArg Rocq.Corelib.Init.Decimal.uint.D0 ih) (fun x ih => congrArg Rocq.Corelib.Init.Decimal.uint.D1 ih) (fun x ih => congrArg Rocq.Corelib.Init.Decimal.uint.D2 ih) (fun x ih => congrArg Rocq.Corelib.Init.Decimal.uint.D3 ih) (fun x ih => congrArg Rocq.Corelib.Init.Decimal.uint.D4 ih) (fun x ih => congrArg Rocq.Corelib.Init.Decimal.uint.D5 ih) (fun x ih => congrArg Rocq.Corelib.Init.Decimal.uint.D6 ih) (fun x ih => congrArg Rocq.Corelib.Init.Decimal.uint.D7 ih) (fun x ih => congrArg Rocq.Corelib.Init.Decimal.uint.D8 ih) (fun x ih => congrArg Rocq.Corelib.Init.Decimal.uint.D9 ih) x
@[simp] theorem decimalDigits_to_of (xs : List (Fin 10)) : decimalDigitsTo (decimalDigitsOf xs) = xs := by
  induction xs with
  | nil => rfl
  | cons d ds ih => change decimalDigitsTo (decimalDigitsPrepend d (decimalDigitsOf ds)) = d :: ds; rw [decimalDigits_prepend, ih]
def decimalDigitsIso : Iso Rocq.Corelib.Init.Decimal.uint (List (Fin 10)) := ⟨decimalDigitsTo,decimalDigitsOf,decimalDigits_of_to,decimalDigits_to_of⟩

def hexadecimalDigitsTo : Rocq.Corelib.Init.Hexadecimal.uint → List (Fin 16) := Rocq.Corelib.Init.Hexadecimal.uint.rec [] (fun _ xs => (⟨0,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨1,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨2,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨3,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨4,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨5,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨6,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨7,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨8,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨9,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨10,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨11,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨12,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨13,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨14,by decide⟩ : Fin 16) :: xs) (fun _ xs => (⟨15,by decide⟩ : Fin 16) :: xs)
def hexadecimalDigitsPrepend (d : Fin 16) (xs : Rocq.Corelib.Init.Hexadecimal.uint) : Rocq.Corelib.Init.Hexadecimal.uint := ((fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.D0 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.D1 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.D2 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.D3 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.D4 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.D5 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.D6 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.D7 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.D8 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.D9 xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.Da xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.Db xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.Dc xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.Dd xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.De xs) (fun i => Fin.cases (Rocq.Corelib.Init.Hexadecimal.uint.Df xs) (fun i => Fin.elim0 i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i)) d
def hexadecimalDigitsOf : List (Fin 16) → Rocq.Corelib.Init.Hexadecimal.uint
  | [] => Rocq.Corelib.Init.Hexadecimal.uint.Nil
  | d :: ds => hexadecimalDigitsPrepend d (hexadecimalDigitsOf ds)
theorem hexadecimalDigits_prepend (xs : Rocq.Corelib.Init.Hexadecimal.uint) : ∀ d : Fin 16, hexadecimalDigitsTo (hexadecimalDigitsPrepend d xs) = d :: hexadecimalDigitsTo xs := (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.elim0 i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i)
@[simp] theorem hexadecimalDigits_of_to (x : Rocq.Corelib.Init.Hexadecimal.uint) : hexadecimalDigitsOf (hexadecimalDigitsTo x) = x :=
  Rocq.Corelib.Init.Hexadecimal.uint.rec rfl (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.D0 ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.D1 ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.D2 ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.D3 ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.D4 ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.D5 ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.D6 ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.D7 ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.D8 ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.D9 ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.Da ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.Db ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.Dc ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.Dd ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.De ih) (fun x ih => congrArg Rocq.Corelib.Init.Hexadecimal.uint.Df ih) x
@[simp] theorem hexadecimalDigits_to_of (xs : List (Fin 16)) : hexadecimalDigitsTo (hexadecimalDigitsOf xs) = xs := by
  induction xs with
  | nil => rfl
  | cons d ds ih => change hexadecimalDigitsTo (hexadecimalDigitsPrepend d (hexadecimalDigitsOf ds)) = d :: ds; rw [hexadecimalDigits_prepend, ih]
def hexadecimalDigitsIso : Iso Rocq.Corelib.Init.Hexadecimal.uint (List (Fin 16)) := ⟨hexadecimalDigitsTo,hexadecimalDigitsOf,hexadecimalDigits_of_to,hexadecimalDigits_to_of⟩


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

#export_native Rocq.Corelib.Init.Number.int_of_int
#export_native Rocq.Corelib.Init.Number.number_beq
#export_native Rocq.Corelib.Init.Number.signed_int_beq
#export_native Rocq.Corelib.Init.Number.uint_beq
#export_native Rocq.Corelib.Init.Number.uint_of_uint
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
  IO.FS.writeFile "/home/shunqwang4/research/rocq-core/experiments/native-correspondence-main75-20261018/audits/Interface_Init_Number.json" (Lean.Json.pretty (.arr rows))

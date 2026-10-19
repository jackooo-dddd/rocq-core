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

def prodTo {A : Type u} {B : Type v} : Rocq.Corelib.Init.Datatypes.prod A B → A × B :=
  Rocq.Corelib.Init.Datatypes.prod.rec (fun a b => (a,b))

def prodOf {A : Type u} {B : Type v} (x : A × B) : Rocq.Corelib.Init.Datatypes.prod A B := .pair A B x.1 x.2

@[simp] theorem prod_of_to {A : Type u} {B : Type v} (x : Rocq.Corelib.Init.Datatypes.prod A B) : prodOf (prodTo x) = x := by cases x <;> rfl

@[simp] theorem prod_to_of {A : Type u} {B : Type v} (x : A × B) : prodTo (prodOf x) = x := by cases x <;> rfl

def prodIso (A : Type u) (B : Type v) : Iso (Rocq.Corelib.Init.Datatypes.prod A B) (A × B) := ⟨prodTo, prodOf, prod_of_to, prod_to_of⟩


abbrev NativeArray (A : Type u) := Σ n : Fin (4194304), Vector A n.val × A

abbrev NativeByteString := Σ n : Fin (16777212), Vector (BitVec 8) n.val

def byteTo : Rocq.Corelib.Init.Byte.byte → Fin 256 := Rocq.Corelib.Init.Byte.byte.rec (⟨0, by decide⟩) (⟨1, by decide⟩) (⟨2, by decide⟩) (⟨3, by decide⟩) (⟨4, by decide⟩) (⟨5, by decide⟩) (⟨6, by decide⟩) (⟨7, by decide⟩) (⟨8, by decide⟩) (⟨9, by decide⟩) (⟨10, by decide⟩) (⟨11, by decide⟩) (⟨12, by decide⟩) (⟨13, by decide⟩) (⟨14, by decide⟩) (⟨15, by decide⟩) (⟨16, by decide⟩) (⟨17, by decide⟩) (⟨18, by decide⟩) (⟨19, by decide⟩) (⟨20, by decide⟩) (⟨21, by decide⟩) (⟨22, by decide⟩) (⟨23, by decide⟩) (⟨24, by decide⟩) (⟨25, by decide⟩) (⟨26, by decide⟩) (⟨27, by decide⟩) (⟨28, by decide⟩) (⟨29, by decide⟩) (⟨30, by decide⟩) (⟨31, by decide⟩) (⟨32, by decide⟩) (⟨33, by decide⟩) (⟨34, by decide⟩) (⟨35, by decide⟩) (⟨36, by decide⟩) (⟨37, by decide⟩) (⟨38, by decide⟩) (⟨39, by decide⟩) (⟨40, by decide⟩) (⟨41, by decide⟩) (⟨42, by decide⟩) (⟨43, by decide⟩) (⟨44, by decide⟩) (⟨45, by decide⟩) (⟨46, by decide⟩) (⟨47, by decide⟩) (⟨48, by decide⟩) (⟨49, by decide⟩) (⟨50, by decide⟩) (⟨51, by decide⟩) (⟨52, by decide⟩) (⟨53, by decide⟩) (⟨54, by decide⟩) (⟨55, by decide⟩) (⟨56, by decide⟩) (⟨57, by decide⟩) (⟨58, by decide⟩) (⟨59, by decide⟩) (⟨60, by decide⟩) (⟨61, by decide⟩) (⟨62, by decide⟩) (⟨63, by decide⟩) (⟨64, by decide⟩) (⟨65, by decide⟩) (⟨66, by decide⟩) (⟨67, by decide⟩) (⟨68, by decide⟩) (⟨69, by decide⟩) (⟨70, by decide⟩) (⟨71, by decide⟩) (⟨72, by decide⟩) (⟨73, by decide⟩) (⟨74, by decide⟩) (⟨75, by decide⟩) (⟨76, by decide⟩) (⟨77, by decide⟩) (⟨78, by decide⟩) (⟨79, by decide⟩) (⟨80, by decide⟩) (⟨81, by decide⟩) (⟨82, by decide⟩) (⟨83, by decide⟩) (⟨84, by decide⟩) (⟨85, by decide⟩) (⟨86, by decide⟩) (⟨87, by decide⟩) (⟨88, by decide⟩) (⟨89, by decide⟩) (⟨90, by decide⟩) (⟨91, by decide⟩) (⟨92, by decide⟩) (⟨93, by decide⟩) (⟨94, by decide⟩) (⟨95, by decide⟩) (⟨96, by decide⟩) (⟨97, by decide⟩) (⟨98, by decide⟩) (⟨99, by decide⟩) (⟨100, by decide⟩) (⟨101, by decide⟩) (⟨102, by decide⟩) (⟨103, by decide⟩) (⟨104, by decide⟩) (⟨105, by decide⟩) (⟨106, by decide⟩) (⟨107, by decide⟩) (⟨108, by decide⟩) (⟨109, by decide⟩) (⟨110, by decide⟩) (⟨111, by decide⟩) (⟨112, by decide⟩) (⟨113, by decide⟩) (⟨114, by decide⟩) (⟨115, by decide⟩) (⟨116, by decide⟩) (⟨117, by decide⟩) (⟨118, by decide⟩) (⟨119, by decide⟩) (⟨120, by decide⟩) (⟨121, by decide⟩) (⟨122, by decide⟩) (⟨123, by decide⟩) (⟨124, by decide⟩) (⟨125, by decide⟩) (⟨126, by decide⟩) (⟨127, by decide⟩) (⟨128, by decide⟩) (⟨129, by decide⟩) (⟨130, by decide⟩) (⟨131, by decide⟩) (⟨132, by decide⟩) (⟨133, by decide⟩) (⟨134, by decide⟩) (⟨135, by decide⟩) (⟨136, by decide⟩) (⟨137, by decide⟩) (⟨138, by decide⟩) (⟨139, by decide⟩) (⟨140, by decide⟩) (⟨141, by decide⟩) (⟨142, by decide⟩) (⟨143, by decide⟩) (⟨144, by decide⟩) (⟨145, by decide⟩) (⟨146, by decide⟩) (⟨147, by decide⟩) (⟨148, by decide⟩) (⟨149, by decide⟩) (⟨150, by decide⟩) (⟨151, by decide⟩) (⟨152, by decide⟩) (⟨153, by decide⟩) (⟨154, by decide⟩) (⟨155, by decide⟩) (⟨156, by decide⟩) (⟨157, by decide⟩) (⟨158, by decide⟩) (⟨159, by decide⟩) (⟨160, by decide⟩) (⟨161, by decide⟩) (⟨162, by decide⟩) (⟨163, by decide⟩) (⟨164, by decide⟩) (⟨165, by decide⟩) (⟨166, by decide⟩) (⟨167, by decide⟩) (⟨168, by decide⟩) (⟨169, by decide⟩) (⟨170, by decide⟩) (⟨171, by decide⟩) (⟨172, by decide⟩) (⟨173, by decide⟩) (⟨174, by decide⟩) (⟨175, by decide⟩) (⟨176, by decide⟩) (⟨177, by decide⟩) (⟨178, by decide⟩) (⟨179, by decide⟩) (⟨180, by decide⟩) (⟨181, by decide⟩) (⟨182, by decide⟩) (⟨183, by decide⟩) (⟨184, by decide⟩) (⟨185, by decide⟩) (⟨186, by decide⟩) (⟨187, by decide⟩) (⟨188, by decide⟩) (⟨189, by decide⟩) (⟨190, by decide⟩) (⟨191, by decide⟩) (⟨192, by decide⟩) (⟨193, by decide⟩) (⟨194, by decide⟩) (⟨195, by decide⟩) (⟨196, by decide⟩) (⟨197, by decide⟩) (⟨198, by decide⟩) (⟨199, by decide⟩) (⟨200, by decide⟩) (⟨201, by decide⟩) (⟨202, by decide⟩) (⟨203, by decide⟩) (⟨204, by decide⟩) (⟨205, by decide⟩) (⟨206, by decide⟩) (⟨207, by decide⟩) (⟨208, by decide⟩) (⟨209, by decide⟩) (⟨210, by decide⟩) (⟨211, by decide⟩) (⟨212, by decide⟩) (⟨213, by decide⟩) (⟨214, by decide⟩) (⟨215, by decide⟩) (⟨216, by decide⟩) (⟨217, by decide⟩) (⟨218, by decide⟩) (⟨219, by decide⟩) (⟨220, by decide⟩) (⟨221, by decide⟩) (⟨222, by decide⟩) (⟨223, by decide⟩) (⟨224, by decide⟩) (⟨225, by decide⟩) (⟨226, by decide⟩) (⟨227, by decide⟩) (⟨228, by decide⟩) (⟨229, by decide⟩) (⟨230, by decide⟩) (⟨231, by decide⟩) (⟨232, by decide⟩) (⟨233, by decide⟩) (⟨234, by decide⟩) (⟨235, by decide⟩) (⟨236, by decide⟩) (⟨237, by decide⟩) (⟨238, by decide⟩) (⟨239, by decide⟩) (⟨240, by decide⟩) (⟨241, by decide⟩) (⟨242, by decide⟩) (⟨243, by decide⟩) (⟨244, by decide⟩) (⟨245, by decide⟩) (⟨246, by decide⟩) (⟨247, by decide⟩) (⟨248, by decide⟩) (⟨249, by decide⟩) (⟨250, by decide⟩) (⟨251, by decide⟩) (⟨252, by decide⟩) (⟨253, by decide⟩) (⟨254, by decide⟩) (⟨255, by decide⟩)
def byteOf : Fin 256 → Rocq.Corelib.Init.Byte.byte := (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x00) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x01) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x02) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x03) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x04) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x05) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x06) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x07) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x08) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x09) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x0a) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x0b) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x0c) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x0d) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x0e) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x0f) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x10) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x11) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x12) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x13) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x14) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x15) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x16) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x17) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x18) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x19) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x1a) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x1b) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x1c) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x1d) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x1e) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x1f) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x20) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x21) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x22) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x23) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x24) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x25) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x26) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x27) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x28) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x29) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x2a) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x2b) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x2c) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x2d) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x2e) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x2f) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x30) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x31) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x32) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x33) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x34) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x35) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x36) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x37) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x38) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x39) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x3a) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x3b) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x3c) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x3d) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x3e) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x3f) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x40) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x41) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x42) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x43) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x44) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x45) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x46) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x47) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x48) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x49) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x4a) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x4b) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x4c) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x4d) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x4e) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x4f) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x50) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x51) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x52) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x53) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x54) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x55) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x56) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x57) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x58) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x59) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x5a) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x5b) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x5c) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x5d) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x5e) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x5f) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x60) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x61) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x62) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x63) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x64) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x65) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x66) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x67) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x68) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x69) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x6a) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x6b) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x6c) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x6d) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x6e) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x6f) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x70) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x71) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x72) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x73) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x74) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x75) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x76) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x77) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x78) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x79) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x7a) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x7b) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x7c) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x7d) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x7e) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x7f) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x80) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x81) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x82) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x83) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x84) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x85) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x86) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x87) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x88) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x89) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x8a) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x8b) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x8c) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x8d) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x8e) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x8f) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x90) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x91) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x92) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x93) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x94) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x95) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x96) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x97) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x98) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x99) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x9a) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x9b) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x9c) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x9d) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x9e) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.x9f) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xa0) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xa1) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xa2) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xa3) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xa4) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xa5) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xa6) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xa7) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xa8) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xa9) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xaa) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xab) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xac) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xad) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xae) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xaf) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xb0) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xb1) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xb2) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xb3) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xb4) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xb5) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xb6) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xb7) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xb8) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xb9) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xba) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xbb) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xbc) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xbd) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xbe) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xbf) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xc0) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xc1) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xc2) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xc3) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xc4) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xc5) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xc6) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xc7) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xc8) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xc9) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xca) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xcb) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xcc) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xcd) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xce) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xcf) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xd0) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xd1) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xd2) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xd3) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xd4) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xd5) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xd6) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xd7) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xd8) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xd9) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xda) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xdb) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xdc) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xdd) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xde) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xdf) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xe0) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xe1) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xe2) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xe3) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xe4) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xe5) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xe6) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xe7) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xe8) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xe9) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xea) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xeb) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xec) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xed) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xee) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xef) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xf0) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xf1) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xf2) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xf3) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xf4) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xf5) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xf6) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xf7) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xf8) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xf9) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xfa) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xfb) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xfc) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xfd) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xfe) (fun i => Fin.cases (Rocq.Corelib.Init.Byte.byte.xff) (fun i => Fin.elim0 i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i)
@[simp] theorem byte_of_to (x : Rocq.Corelib.Init.Byte.byte) : byteOf (byteTo x) = x := by cases x <;> rfl
@[simp] theorem byte_to_of : ∀ x : Fin 256, byteTo (byteOf x) = x := (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.cases (by rfl) (fun i => Fin.elim0 i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i) i)
def byteIso : Iso Rocq.Corelib.Init.Byte.byte (Fin 256) := ⟨byteTo,byteOf,byte_of_to,byte_to_of⟩


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

#export_native Rocq.Corelib.Init.Byte.byte_of_byte
#export_native Rocq.Corelib.Init.Byte.byte_rec
#export_native Rocq.Corelib.Init.Byte.byte_rect
#export_native Rocq.Corelib.Init.Byte.of_bits
#export_native Rocq.Corelib.Init.Byte.to_bits
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
  IO.FS.writeFile "/home/shunqwang4/research/rocq-core/experiments/mechanical-correspondence-20261019/legacy/audits/Interface_Init_Byte.json" (Lean.Json.pretty (.arr rows))

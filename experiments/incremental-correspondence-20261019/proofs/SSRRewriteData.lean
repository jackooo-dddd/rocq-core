import Interface_ssr_ssreflect_rw
noncomputable section
namespace NativeBridge.Incremental.SSRRewriteData
universe u v w

def unitTo (x : Rocq.Corelib.Init.Datatypes.unit) : Unit := unitIso.to x
def constUnit {A : Sort u} (_ : A) : Unit := ()
def identityType (T : Sort u) : Sort u := T
def trueType : Prop := True
def unitType : Type := Unit
def typeUniverse := Type u

def callTo (c : Rocq.Corelib.Init.Datatypes.unit) (b : RBool) :
    Rocq.Corelib.ssr.ssreflect_rw.NonPropType.call_of.{u} c b → Type u
  | .Call _ _ T => T
def callIso (c : Rocq.Corelib.Init.Datatypes.unit) (b : RBool) :
    Iso (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.call_of.{u} c b) (Type u) :=
  ⟨callTo c b, fun T => .Call c b T, fun x => by cases x; rfl, fun _ => rfl⟩
def testTo (b : RBool) : Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test_of b → Unit :=
  fun _ => ()
def testIso (b : RBool) : Iso (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test_of b) Unit :=
  ⟨testTo b, fun _ => .Test b .tt,
   fun x => by cases x with | Test c => cases c; rfl,
   fun x => by cases x; rfl⟩

def nonPropTo (t : Rocq.Corelib.ssr.ssreflect_rw.NonPropType.type.{u}) : Bool × Type u :=
  (boolTo (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result t),
   Rocq.Corelib.ssr.ssreflect_rw.NonPropType.callee
    (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.condition
      (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result t)
      (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test t))
    (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result t)
    (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.frame t))
def makeNonProp (b : Bool) (_ : Unit) (T : Type u) : Bool × Type u := (b,T)
theorem call_agrees (T : Type u) :
    callTo _ _ (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.call T) = id T := rfl
theorem callee_agrees (c : Rocq.Corelib.Init.Datatypes.unit) (b : RBool)
    (x : Rocq.Corelib.ssr.ssreflect_rw.NonPropType.call_of.{u} c b) :
    Rocq.Corelib.ssr.ssreflect_rw.NonPropType.callee c b x = id (callTo c b x) := by cases x; rfl
theorem check_agrees (b : RBool) (t : Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test_of b)
    (f : Rocq.Corelib.ssr.ssreflect_rw.NonPropType.call_of.{u}
      (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.condition b t) b) :
    nonPropTo (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.check b t f) =
      makeNonProp (boolTo b) (testTo b t) (callTo _ _ f) := by cases f; rfl
theorem condition_agrees (b : RBool) (t : Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test_of b) :
    unitTo (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.condition b t) = id (testTo b t) := by
  cases t with | Test c => cases c; rfl
theorem frame_agrees (t : Rocq.Corelib.ssr.ssreflect_rw.NonPropType.type.{u}) :
    callTo _ _ (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.frame t) = (nonPropTo t).2 := by
  cases t with | Check b test frame => cases frame; rfl
theorem result_agrees (t : Rocq.Corelib.ssr.ssreflect_rw.NonPropType.type.{u}) :
    boolTo (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result t) = (nonPropTo t).1 := rfl
theorem test_agrees (t : Rocq.Corelib.ssr.ssreflect_rw.NonPropType.type.{u}) :
    testTo _ (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test t) = constUnit (nonPropTo t) := rfl
theorem maybeProp_agrees (T : Sort u) :
    unitTo (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.maybeProp T) = constUnit T := rfl
theorem testProp_agrees (P : Prop) :
    testTo _ (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test_Prop P) = constUnit P := rfl
theorem testNegative_agrees :
    testTo _ Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test_negative = () := rfl

def canonicalIso (V : Sort u) (S : Sort v) (x y : V) (s : S) :
    Iso (Rocq.Corelib.ssr.ssreflect_rw.TheCanonical.put V S x y s) True :=
  ⟨fun _ => trivial, fun _ => .Put V S x y s, fun _ => rfl, fun _ => rfl⟩
theorem get_agrees (V : Sort u) (S : Sort v) (x : V) (s : S)
    (p : Rocq.Corelib.ssr.ssreflect_rw.TheCanonical.put V S x x s) :
    Rocq.Corelib.ssr.ssreflect_rw.TheCanonical.get V S x s p = id s := by cases p; rfl
theorem getBy_agrees (V : Sort u) (S : Sort v) (f : S → V) (x : V) (s : S)
    (p : Rocq.Corelib.ssr.ssreflect_rw.TheCanonical.put V S x x s) :
    Rocq.Corelib.ssr.ssreflect_rw.TheCanonical.get_by V S f x s p = id s := by cases p; rfl

def viewTo : Rocq.Corelib.ssr.ssreflect_rw.external_view.{u} → Type u
  | .tactic_view T => T
def viewIso : Iso Rocq.Corelib.ssr.ssreflect_rw.external_view.{u} (Type u) :=
  ⟨viewTo, .tactic_view, fun x => by cases x; rfl, fun _ => rfl⟩
def viewRec (P : Type u → Sort v) (f : (T : Type u) → P T) (T : Type u) : P T := f T
theorem viewRect_agrees (P : Type u → Type v) (f : (T : Type u) → P T)
    (e : Rocq.Corelib.ssr.ssreflect_rw.external_view.{u}) :
    Rocq.Corelib.ssr.ssreflect_rw.external_view_rect (fun e => P (viewTo e)) f e =
      viewRec P f (viewTo e) := by cases e; rfl
theorem viewRec_agrees (P : Type u → Type) (f : (T : Type u) → P T)
    (e : Rocq.Corelib.ssr.ssreflect_rw.external_view.{u}) :
    Rocq.Corelib.ssr.ssreflect_rw.external_view_rec (fun e => P (viewTo e)) f e =
      viewRec P f (viewTo e) := by cases e; rfl

def phantomIso (T : Sort u) (x : T) : Iso (Rocq.Corelib.ssr.ssreflect_rw.phantom T x) True :=
  ⟨fun _ => trivial, fun _ => .Phantom T x, fun _ => rfl, fun _ => rfl⟩
def phantIso (T : Sort u) : Iso (Rocq.Corelib.ssr.ssreflect_rw.phant T) True :=
  ⟨fun _ => trivial, fun _ => .Phant T, fun _ => rfl, fun _ => rfl⟩
def lockIso : Iso Rocq.Corelib.ssr.ssreflect_rw.abstract_lock Unit := unitIso
theorem key_agrees : unitTo Rocq.Corelib.ssr.ssreflect_rw.abstract_key = () := rfl
def abstractIso (T : Type u) (n : MN) (k : Rocq.Corelib.ssr.ssreflect_rw.abstract_lock) :
    Iso (Rocq.Corelib.ssr.ssreflect_rw.abstract T n k) T := by
  cases k
  exact ⟨id,id,fun _ => rfl,fun _ => rfl⟩
def argumentTypeIso (T : Type u) (P : T → Sort v) (f : (x : T) → P x) :
    Iso (Rocq.Corelib.ssr.ssreflect_rw.argumentType T P f) T := ⟨id,id,fun _ => rfl,fun _ => rfl⟩
def dependentReturnTypeIso (T : Sort u) (P : T → Type v) (f : (x : T) → P x) (x : T) :
    Iso (Rocq.Corelib.ssr.ssreflect_rw.dependentReturnType T P f x) (P x) :=
  ⟨id,id,fun _ => rfl,fun _ => rfl⟩
def returnTypeIso (A : Sort u) (B : Type v) (f : A → B) :
    Iso (Rocq.Corelib.ssr.ssreflect_rw.returnType A B f) B :=
  ⟨id,id,fun _ => rfl,fun _ => rfl⟩
theorem protect_agrees (T : Sort u) (x : T) :
    Rocq.Corelib.ssr.ssreflect_rw.protect_term T x = id x := rfl
theorem lockedWith_agrees (k : Rocq.Corelib.Init.Datatypes.unit) (T : Sort u) (x : T) :
    Rocq.Corelib.ssr.ssreflect_rw.locked_with k T x = id x := by cases k; rfl

def unlockableIso (T : Sort u) (x : T) : Iso (Rocq.Corelib.ssr.ssreflect_rw.unlockable T x) Unit :=
  ⟨fun _ => (), fun _ => .Unlockable T x x (.eq_refl T x),
   fun c => by
     cases c with
     | Unlockable y h =>
       have e := eqTo h
       cases e
       rfl,
   fun c => by cases c; rfl⟩
def unlockValue (T : Sort u) (x : T) (_ : Unit) : T := x
theorem unlocked_agrees (T : Sort u) (x : T) (c : Rocq.Corelib.ssr.ssreflect_rw.unlockable T x) :
    Rocq.Corelib.ssr.ssreflect_rw.unlocked T x c = unlockValue T x ((unlockableIso T x).to c) := by
  cases c with | Unlockable y h => exact eqTo h
theorem vmComputeEq_agrees (T : Sort u) (x y : T) :
    Rocq.Corelib.ssr.ssreflect_rw.vm_compute_eq T x y ↔ x = y := eq_correspondence x y

def unitValue : Unit := ()
def nativeEquality (T : Sort u) (x y : T) : Prop := x = y
theorem mechanicalEq_eq (T : Sort u) (x y : T) :
    Rocq.Corelib.Init.Logic.eq T x y = (x = y) := propext (eq_correspondence x y)

def naryCongruence : Nat → ((B : Type u) → (B → B → Prop) → Prop) → Prop
  | 0, k => ∀ B, k B Eq
  | n+1, k => ∀ A : Type, naryCongruence n
      (fun B e => k (A → B) (fun f g => ∀ x y, x = y → e (f x) (g y)))
theorem naryStatement_agrees (n : MN) (k : (B : Type u) → (B → B → Prop) → Prop) :
    Rocq.Corelib.ssr.ssreflect_rw.nary_congruence_statement n k ↔ naryCongruence (natTo n) k := by
  induction n generalizing k with
  | O =>
    change (∀ B, k B (fun x y => Rocq.Corelib.Init.Logic.eq B x y)) ↔ ∀ B, k B Eq
    simp only [mechanicalEq_eq]
  | S n ih =>
    change (∀ A : Type, Rocq.Corelib.ssr.ssreflect_rw.nary_congruence_statement n
      (fun B e => k (A → B) (fun f g => ∀ x y, Rocq.Corelib.Init.Logic.eq A x y → e (f x) (g y)))) ↔
      ∀ A : Type, naryCongruence (natTo n)
        (fun B e => k (A → B) (fun f g => ∀ x y, x = y → e (f x) (g y)))
    simp only [mechanicalEq_eq, ih]
theorem nary_of_reflexive (n : Nat) (k : (B : Type u) → (B → B → Prop) → Prop)
    (hk : ∀ B e, (∀ x, e x x) → k B e) : naryCongruence n k := by
  induction n generalizing k with
  | zero => exact fun B => hk B Eq (fun _ => rfl)
  | succ n ih =>
    intro A
    apply ih
    intro B e he
    apply hk
    intro f x y h
    cases h
    exact he _

end NativeBridge.Incremental.SSRRewriteData

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
  for name in ["NativeBridge.Incremental.SSRRewriteData.constUnit", "NativeBridge.Incremental.SSRRewriteData.identityType", "NativeBridge.Incremental.SSRRewriteData.makeNonProp", "NativeBridge.Incremental.SSRRewriteData.naryCongruence", "NativeBridge.Incremental.SSRRewriteData.nativeEquality", "NativeBridge.Incremental.SSRRewriteData.trueType", "NativeBridge.Incremental.SSRRewriteData.typeUniverse", "NativeBridge.Incremental.SSRRewriteData.unitType", "NativeBridge.Incremental.SSRRewriteData.unitValue", "NativeBridge.Incremental.SSRRewriteData.unlockValue", "NativeBridge.Incremental.SSRRewriteData.viewRec", "Prod.fst", "Prod.snd", "id"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

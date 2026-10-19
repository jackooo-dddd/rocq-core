import Interface_Init_Sumbool
set_option autoImplicit false
noncomputable section
namespace NativeBridge.Incremental.SumboolBridge
open NativeBridge
universe u

theorem bool_eq_rec_proof1 : Rocq.Corelib.Init.Sumbool.bool_eq_rec__rocq2lean_obligation_1.statement := by intro b P Q ht hf; exact .eq_refl _ _
theorem bool_eq_rec_proof2 : Rocq.Corelib.Init.Sumbool.bool_eq_rec__rocq2lean_obligation_2.statement := by intro b P Q ht hf; exact .eq_refl _ _
theorem sumbool_and_proof1 : Rocq.Corelib.Init.Sumbool.sumbool_and__rocq2lean_obligation_1.statement := by intro A B C D h1 h2 a c; exact .conj A C a c
theorem sumbool_and_proof2 : Rocq.Corelib.Init.Sumbool.sumbool_and__rocq2lean_obligation_2.statement := by intro A B C D h1 h2 a d; exact .or_intror B D d
theorem sumbool_and_proof3 : Rocq.Corelib.Init.Sumbool.sumbool_and__rocq2lean_obligation_3.statement := by intro A B C D h1 h2 b c; exact .or_introl B D b
theorem sumbool_and_proof4 : Rocq.Corelib.Init.Sumbool.sumbool_and__rocq2lean_obligation_4.statement := by intro A B C D h1 h2 b d; exact .or_introl B D b
theorem sumbool_or_proof1 : Rocq.Corelib.Init.Sumbool.sumbool_or__rocq2lean_obligation_1.statement := by intro A B C D h1 h2 a c; exact .or_introl A C a
theorem sumbool_or_proof2 : Rocq.Corelib.Init.Sumbool.sumbool_or__rocq2lean_obligation_2.statement := by intro A B C D h1 h2 a d; exact .or_introl A C a
theorem sumbool_or_proof3 : Rocq.Corelib.Init.Sumbool.sumbool_or__rocq2lean_obligation_3.statement := by intro A B C D h1 h2 b c; exact .or_intror A C c
theorem sumbool_or_proof4 : Rocq.Corelib.Init.Sumbool.sumbool_or__rocq2lean_obligation_4.statement := by intro A B C D h1 h2 b d; exact .conj B D b d
theorem sumbool_of_bool_proof1 : Rocq.Corelib.Init.Sumbool.sumbool_of_bool__rocq2lean_obligation_1.statement := by intro b; exact .eq_refl _ _
theorem sumbool_of_bool_proof2 : Rocq.Corelib.Init.Sumbool.sumbool_of_bool__rocq2lean_obligation_2.statement := by intro b; exact .eq_refl _ _

def nativeAnd (A B C D : Prop) : PSum A B → PSum C D → PSum (A ∧ C) (B ∨ D)
  | .inl a, .inl c => .inl ⟨a,c⟩
  | .inl _, .inr d => .inr (.inr d)
  | .inr b, _ => .inr (.inl b)
def nativeOr (A B C D : Prop) : PSum A B → PSum C D → PSum (A ∨ C) (B ∧ D)
  | .inl a, _ => .inl (.inl a)
  | .inr _, .inl c => .inl (.inr c)
  | .inr b, .inr d => .inr ⟨b,d⟩
def nativeNot (A B : Prop) : PSum A B → PSum B A
  | .inl a => .inr a
  | .inr b => .inl b

def andTo {A C : Prop} : Rocq.Corelib.Init.Logic.and A C → A ∧ C
  | .conj _ _ a c => ⟨a,c⟩
def orTo {B D : Prop} : Rocq.Corelib.Init.Logic.or B D → B ∨ D
  | .or_introl _ _ b => .inl b
  | .or_intror _ _ d => .inr d
def sumAndTo {A B C D : Prop} :
    Rocq.Corelib.Init.Specif.sumbool (Rocq.Corelib.Init.Logic.and A C) (Rocq.Corelib.Init.Logic.or B D) →
      PSum (A ∧ C) (B ∨ D)
  | .left _ _ h => .inl (andTo h)
  | .right _ _ h => .inr (orTo h)
def sumOrTo {A B C D : Prop} :
    Rocq.Corelib.Init.Specif.sumbool (Rocq.Corelib.Init.Logic.or A C) (Rocq.Corelib.Init.Logic.and B D) →
      PSum (A ∨ C) (B ∧ D)
  | .left _ _ h => .inl (orTo h)
  | .right _ _ h => .inr (andTo h)

def andClosed := @RocqPending.Corelib.Init.Sumbool.sumbool_and
  sumbool_and_proof1 sumbool_and_proof2 sumbool_and_proof3 sumbool_and_proof4
def orClosed := @RocqPending.Corelib.Init.Sumbool.sumbool_or
  sumbool_or_proof1 sumbool_or_proof2 sumbool_or_proof3 sumbool_or_proof4
def ofBoolClosed := @RocqPending.Corelib.Init.Sumbool.sumbool_of_bool sumbool_of_bool_proof1 sumbool_of_bool_proof2
def boolRecClosed := @RocqPending.Corelib.Init.Sumbool.bool_eq_rec bool_eq_rec_proof1 bool_eq_rec_proof2

theorem sumbool_and_agrees (A B C D : Prop) (x : PSum A B) (y : PSum C D) :
    sumAndTo (@RocqPending.Corelib.Init.Sumbool.sumbool_and
      sumbool_and_proof1 sumbool_and_proof2 sumbool_and_proof3 sumbool_and_proof4
      A B C D (sumboolOf x) (sumboolOf y)) = nativeAnd A B C D x y := by cases x <;> cases y <;> rfl

theorem sumbool_or_agrees (A B C D : Prop) (x : PSum A B) (y : PSum C D) :
    sumOrTo (@RocqPending.Corelib.Init.Sumbool.sumbool_or
      sumbool_or_proof1 sumbool_or_proof2 sumbool_or_proof3 sumbool_or_proof4
      A B C D (sumboolOf x) (sumboolOf y)) = nativeOr A B C D x y := by cases x <;> cases y <;> rfl

theorem sumbool_not_agrees (A B : Prop) (x : PSum A B) :
    sumboolTo (Rocq.Corelib.Init.Sumbool.sumbool_not A B (sumboolOf x)) = nativeNot A B x := by cases x <;> rfl

def nativeOfBool : (b : Bool) → PSum (b = true) (b = false)
  | true => .inl rfl
  | false => .inr rfl
def ofBoolTo (b : Bool) :
    Rocq.Corelib.Init.Specif.sumbool (Rocq.Corelib.Init.Logic.eq RBool (boolOf b) .true)
      (Rocq.Corelib.Init.Logic.eq RBool (boolOf b) .false) → PSum (b = true) (b = false)
  | .left _ _ h => .inl (by have hh := congrArg boolTo (eqTo h); rw [bool_to_of] at hh; simpa only [boolTo] using hh)
  | .right _ _ h => .inr (by have hh := congrArg boolTo (eqTo h); rw [bool_to_of] at hh; simpa only [boolTo] using hh)
theorem sumbool_of_bool_agrees (b : Bool) :
    ofBoolTo b (@RocqPending.Corelib.Init.Sumbool.sumbool_of_bool sumbool_of_bool_proof1 sumbool_of_bool_proof2 (boolOf b)) =
      nativeOfBool b := by cases b <;> rfl

def nativeToBool (A B : Prop) : PSum A B → { b : Bool // if b then A else B }
  | .inl a => ⟨true,a⟩
  | .inr b => ⟨false,b⟩
def boolSubtypeTo (A B : Prop) :
    Rocq.Corelib.Init.Specif.sig RBool (fun b => Rocq.Corelib.Init.Datatypes.bool.rec A B b) →
      { b : Bool // if b then A else B }
  | .exist _ _ b h => ⟨boolTo b, by cases b <;> exact h⟩
theorem bool_of_sumbool_agrees (A B : Prop) (x : PSum A B) :
    boolSubtypeTo A B (Rocq.Corelib.Init.Sumbool.bool_of_sumbool A B (sumboolOf x)) =
      nativeToBool A B x := by cases x <;> rfl

def nativeBoolRec (b : Bool) (P : Bool → Type) (ht : b = true → P true) (hf : b = false → P false) : P b := by
  cases b
  · exact hf rfl
  · exact ht rfl

theorem bool_eq_rec_agrees (b : Bool) (P : Bool → Type) (ht : b = true → P true) (hf : b = false → P false) :
    (@RocqPending.Corelib.Init.Sumbool.bool_eq_rec bool_eq_rec_proof1 bool_eq_rec_proof2
      (boolOf b) (fun r => P (boolTo r))
      (fun h => ht (by have hh := congrArg boolTo (eqTo h); rw [bool_to_of] at hh; simpa only [boolTo] using hh))
      (fun h => hf (by have hh := congrArg boolTo (eqTo h); rw [bool_to_of] at hh; simpa only [boolTo] using hh))) =
      (show P (boolTo (boolOf b)) from by simpa only [bool_to_of] using nativeBoolRec b P ht hf) := by
  cases b <;> rfl

def nativeBoolInd : Prop :=
  ∀ (b : Bool) (P : Bool → Prop), (b = true → P true) → (b = false → P false) → P b
theorem nativeBoolInd_proof : nativeBoolInd := by
  intro b P ht hf
  cases b
  · exact hf rfl
  · exact ht rfl
theorem sourceBoolInd_proof : Rocq.Corelib.Init.Sumbool.bool_eq_ind.statement := by
  intro b P ht hf
  cases b
  · exact ht (.eq_refl _ _)
  · exact hf (.eq_refl _ _)
theorem bool_eq_ind_agrees : Rocq.Corelib.Init.Sumbool.bool_eq_ind.statement ↔ nativeBoolInd :=
  ⟨fun _ => nativeBoolInd_proof, fun _ => sourceBoolInd_proof⟩
end NativeBridge.Incremental.SumboolBridge

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
  for name in ["NativeBridge.Incremental.SumboolBridge.nativeAnd", "NativeBridge.Incremental.SumboolBridge.nativeBoolInd", "NativeBridge.Incremental.SumboolBridge.nativeBoolRec", "NativeBridge.Incremental.SumboolBridge.nativeNot", "NativeBridge.Incremental.SumboolBridge.nativeOfBool", "NativeBridge.Incremental.SumboolBridge.nativeOr", "NativeBridge.Incremental.SumboolBridge.nativeToBool"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

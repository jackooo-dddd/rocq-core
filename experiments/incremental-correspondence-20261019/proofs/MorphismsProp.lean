import Auto_Classes_Morphisms_Prop
set_option autoImplicit false
noncomputable section
namespace NativeBridge.Incremental.MorphismsProp
open NativeBridge
open Rocq.Corelib.Classes.RelationClasses
universe u v w
theorem sourceFalse : Rocq.Corelib.Init.Logic.False ↔ False :=
  ⟨(fun h => by cases h), (fun h => False.elim h)⟩

theorem sourceAnd (P Q : Prop) : Rocq.Corelib.Init.Logic.and P Q ↔ P ∧ Q := by
  constructor
  · intro h
    cases h with | conj hp hq => exact ⟨hp,hq⟩
  · intro h
    exact .conj P Q h.1 h.2

theorem sourceOr (P Q : Prop) : Rocq.Corelib.Init.Logic.or P Q ↔ P ∨ Q := by
  constructor
  · intro h
    cases h with
    | or_introl hp => exact .inl hp
    | or_intror hq => exact .inr hq
  · intro h
    cases h with
    | inl hp => exact .or_introl P Q hp
    | inr hq => exact .or_intror P Q hq

theorem sourceIff (P Q : Prop) : Rocq.Corelib.Init.Logic.iff P Q ↔ (P ↔ Q) := by
  change Rocq.Corelib.Init.Logic.and (P → Q) (Q → P) ↔ _
  exact (sourceAnd _ _).trans ⟨fun h => ⟨h.1,h.2⟩,fun h => ⟨h.mp,h.mpr⟩⟩


theorem equivalence_native (A : Type u) (R : A → A → Prop) :
    Equivalence A R ↔ _root_.Equivalence R := by
  constructor
  · intro h
    cases h with | Build_Equivalence hr hs ht => exact ⟨hr, fun h => hs _ _ h, fun h1 h2 => ht _ _ _ h1 h2⟩
  · intro h
    exact .Build_Equivalence A R h.refl (fun _ _ => h.symm) (fun _ _ _ => h.trans)

theorem iff_relation_native :
    Rocq.Corelib.Init.Logic.iff = (fun P Q : Prop => P ↔ Q) := by
  funext P Q
  exact propext (sourceIff P Q)

theorem flip_function_native (A : Sort u) (B : Sort v) (C : Sort w) :
    Rocq.Corelib.Program.Basics.flip A B C = (fun (f : A → B → C) b a => f a b) := rfl
def accTo {A : Type u} {R : A → A → Prop} {x : A}
    (a : Rocq.Corelib.Init.Wf.Acc A R x) : Acc R x :=
  Rocq.Corelib.Init.Wf.Acc.rec (motive := fun x _ => Acc R x)
    (fun x _ ih => Acc.intro x ih) a


def accOf {A : Type u} {R : A → A → Prop} {x : A}
    (a : Acc R x) : Rocq.Corelib.Init.Wf.Acc A R x :=
  Acc.rec (motive := fun x _ => Rocq.Corelib.Init.Wf.Acc A R x)
    (fun x _ ih => Rocq.Corelib.Init.Wf.Acc.Acc_intro A R x ih) a

theorem impl_function_native :
    Rocq.Corelib.Program.Basics.impl = (fun P Q : Prop => P → Q) := rfl

theorem acc_native (A : Type u) (R : A → A → Prop) (x : A) :
    Rocq.Corelib.Init.Wf.Acc A R x ↔ Acc R x := ⟨accTo,accOf⟩
theorem acc_function_native (A : Type u) (R : A → A → Prop) :
    Rocq.Corelib.Init.Wf.Acc A R = (fun x => Acc R x) := by
  funext x
  exact propext (acc_native A R x)
theorem and_function_native :
    Rocq.Corelib.Init.Logic.and = (fun P Q : Prop => P ∧ Q) := by
  funext P Q
  exact propext (sourceAnd P Q)
theorem or_function_native :
    Rocq.Corelib.Init.Logic.or = (fun P Q : Prop => P ∨ Q) := by
  funext P Q
  exact propext (sourceOr P Q)
theorem not_function_native :
    Rocq.Corelib.Init.Logic.not = (fun P : Prop => ¬ P) := by
  funext P
  change (P → Rocq.Corelib.Init.Logic.False) = (P → False)
  exact congrArg (fun Q : Prop => P → Q) (propext sourceFalse)

end NativeBridge.Incremental.MorphismsProp
open Lean Meta Elab Command
private partial def sourceRefs (e : Expr) (seen : NameSet := {}) : MetaM (Array Name) := do
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
   if let some v := ci.value? then
    found := found ++ (← sourceRefs v seen)
 return found

run_cmd Lean.Elab.Command.liftTermElabM do
 unless !(← sourceRefs (mkConst `Rocq.Corelib.Init.Wf.Acc)).isEmpty do
  throwError "Source-containing alias incorrectly classified as native"
 unless (← sourceRefs (mkConst `Bool)).isEmpty do
  throwError "Native Bool incorrectly classified as source-containing"

syntax (name := incrementalStatement) "#incremental_statement " ident : command
@[command_elab incrementalStatement] def elabIncrementalStatement : CommandElab := fun stx => do
 let sourceName := stx[1].getId
 liftTermElabM do
  let ci ← getConstInfo sourceName
  let .defnInfo di := ci | throwError "Expected translated statement definition"
  unless di.type == .sort .zero do throwError "Conditional/type-valued statement excluded"
  let mut rules : SimpTheorems := {}
  for rule in ["NativeBridge.eq_correspondence", "NativeBridge.Incremental.MorphismsProp.sourceFalse", "NativeBridge.Incremental.MorphismsProp.sourceAnd", "NativeBridge.Incremental.MorphismsProp.sourceOr", "NativeBridge.Incremental.MorphismsProp.sourceIff", "NativeBridge.Incremental.MorphismsProp.equivalence_native", "NativeBridge.Incremental.MorphismsProp.iff_relation_native", "NativeBridge.Incremental.MorphismsProp.flip_function_native", "NativeBridge.Incremental.MorphismsProp.impl_function_native", "NativeBridge.Incremental.MorphismsProp.acc_native", "NativeBridge.Incremental.MorphismsProp.acc_function_native", "NativeBridge.Incremental.MorphismsProp.and_function_native", "NativeBridge.Incremental.MorphismsProp.or_function_native", "NativeBridge.Incremental.MorphismsProp.not_function_native", "Rocq.Corelib.Relations.Relation_Definitions.relation", "Rocq.Corelib.Classes.Morphisms.Proper", "Rocq.Corelib.Classes.Morphisms.respectful"] do
   let n := rule.toName
   if (← getEnv).contains n then
    rules ← if rule.startsWith "Rocq." then rules.addDeclToUnfold n else rules.addConst n
  let ctx ← Simp.mkContext (config := { maxSteps := 20000 }) (simpTheorems := #[rules])
  let (r, _) ← Meta.simp di.value ctx
  let nativeName := ("NativeBridge.Incremental.Statements." ++ sourceName.toString ++ ".native").toName
  let certName := ("NativeBridge.Incremental.Statements." ++ sourceName.toString ++ ".correspondence").toName
  addDecl (.defnDecl {name:=nativeName,levelParams:=di.levelParams,type:=.sort .zero,value:=r.expr,hints:=.abbrev,safety:=.safe})
  let ls := di.levelParams.map Level.param
  let ty := mkApp2 (mkConst `Iff) (mkConst sourceName ls) (mkConst nativeName ls)
  let proof ← mkAppM `Iff.of_eq #[← r.getProof' di.value]
  addDecl (.thmDecl {name:=certName,levelParams:=di.levelParams,type:=ty,value:=proof})
  let remaining ← sourceRefs r.expr
  let text ← ppExpr r.expr
  let j := Json.mkObj [("source_target",.str sourceName.toString),("certificate",.str certName.toString),
   ("native",.str nativeName.toString),("native_expression",.str text.pretty),
   ("remaining_source_symbols",.arr (remaining.map (fun x => .str x.toString))),
   ("full",.bool remaining.isEmpty)]
  logInfo m!"NATIVE_RESULT {j.compress}"

#incremental_statement Rocq.Corelib.Classes.Morphisms_Prop.Acc_pt_morphism.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms_Prop.Acc_rel_morphism.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms_Prop.and_iff_morphism.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms_Prop.and_iff_morphism_obligation_1.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms_Prop.and_impl_morphism.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms_Prop.and_impl_morphism_obligation_1.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms_Prop.iff_iff_iff_impl_morphism.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms_Prop.iff_iff_iff_impl_morphism_obligation_1.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms_Prop.not_iff_morphism.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms_Prop.not_iff_morphism_obligation_1.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms_Prop.not_impl_morphism.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms_Prop.not_impl_morphism_obligation_1.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms_Prop.or_iff_morphism.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms_Prop.or_iff_morphism_obligation_1.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms_Prop.or_impl_morphism.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms_Prop.or_impl_morphism_obligation_1.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms_Prop.well_founded_morphism.statement

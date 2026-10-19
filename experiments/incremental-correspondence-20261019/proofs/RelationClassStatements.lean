import RelationClasses
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
 unless !(← sourceRefs (mkConst `Rocq.Corelib.Relations.Relation_Definitions.relation)).isEmpty do
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
  for rule in ["NativeBridge.eq_correspondence", "NativeBridge.Incremental.RC.sourceFalse", "NativeBridge.Incremental.RC.sourceAnd", "NativeBridge.Incremental.RC.sourceOr", "NativeBridge.Incremental.RC.sourceIff", "NativeBridge.Incremental.RC.reflexive_native", "NativeBridge.Incremental.RC.symmetric_native", "NativeBridge.Incremental.RC.transitive_native", "NativeBridge.Incremental.RC.complement_native", "NativeBridge.Incremental.RC.irreflexive_native", "NativeBridge.Incremental.RC.asymmetric_native", "NativeBridge.Incremental.RC.subrelation_native", "NativeBridge.Incremental.RC.conjunction_native", "NativeBridge.Incremental.RC.disjunction_native", "NativeBridge.Incremental.RC.relation_equivalence_native", "NativeBridge.Incremental.RC.equivalence_native", "NativeBridge.Incremental.RC.preorder_native", "NativeBridge.Incremental.RC.per_native", "NativeBridge.Incremental.RC.strictOrder_native", "NativeBridge.Incremental.RC.rewriteRelation_native", "NativeBridge.Incremental.RC.eq_relation_native", "NativeBridge.Incremental.RC.iff_relation_native", "NativeBridge.Incremental.RC.complement_function_native", "NativeBridge.Incremental.RC.subrelation_function_native", "NativeBridge.Incremental.RC.relation_equivalence_function_native", "NativeBridge.Incremental.RC.conjunction_function_native", "NativeBridge.Incremental.RC.disjunction_function_native", "NativeBridge.Incremental.RC.flip_function_native", "Rocq.Corelib.Relations.Relation_Definitions.relation", "Rocq.Corelib.Program.Basics.flip", "Rocq.Corelib.Program.Basics.impl", "Rocq.Corelib.Init.Logic.not", "Rocq.Corelib.Classes.RelationClasses.Antisymmetric", "Rocq.Corelib.Classes.RelationClasses.PartialOrder", "NativeBridge.Incremental.RC.NativePreorder", "NativeBridge.Incremental.RC.NativePER", "NativeBridge.Incremental.RC.NativeStrictOrder"] do
   let n := rule.toName
   if (← getEnv).contains n then
    rules ← if rule.startsWith "Rocq." || rule.endsWith "NativePreorder" || rule.endsWith "NativePER" || rule.endsWith "NativeStrictOrder" then rules.addDeclToUnfold n else rules.addConst n
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

#incremental_statement Rocq.Corelib.Classes.RelationClasses.Equivalence_PER.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.Equivalence_PreOrder.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.Equivalence_Reflexive.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.Equivalence_Symmetric.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.Equivalence_Transitive.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.PER_Symmetric.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.PER_Transitive.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.PreOrder_Reflexive.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.PreOrder_Transitive.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.StrictOrder_Asymmetric.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.StrictOrder_Irreflexive.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.StrictOrder_Transitive.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.Tlist_ind.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.Tlist_sind.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.antisymmetry.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.asymmetry.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.complement_Irreflexive.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.complement_Symmetric.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.complement_inverse.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.eq_Reflexive.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.eq_Symmetric.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.eq_Transitive.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.eq_equivalence.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.equivalence_rewrite_relation.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.flip_Antisymmetric.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.flip_Asymmetric.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.flip_Equivalence.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.flip_Irreflexive.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.flip_PER.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.flip_PreOrder.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.flip_Reflexive.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.flip_StrictOrder.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.flip_Symmetric.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.flip_Transitive.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.iff_Reflexive.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.iff_Symmetric.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.iff_Transitive.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.iff_equivalence.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.iff_rewrite_relation.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.impl_Reflexive.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.impl_Reflexive_obligation_1.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.impl_Transitive.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.impl_Transitive_obligation_1.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.impl_rewrite_relation.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.inverse_impl_rewrite_relation.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.irreflexivity.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.is_subrelation.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.neq_Symmetric.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.partial_order_antisym.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.partial_order_equivalence.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.predicate_equivalence_equivalence.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.predicate_equivalence_equivalence_obligation_1.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.predicate_equivalence_equivalence_obligation_2.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.predicate_equivalence_equivalence_obligation_3.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.predicate_implication_preorder.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.predicate_implication_preorder_obligation_1.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.predicate_implication_preorder_obligation_2.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.reflexivity.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.relation_equivalence_equivalence.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.relation_equivalence_rewrite_relation.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.relation_implication_preorder.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.subrelation_partial_order_obligation_1.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.subrelation_symmetric.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.symmetry.statement
#incremental_statement Rocq.Corelib.Classes.RelationClasses.transitivity.statement

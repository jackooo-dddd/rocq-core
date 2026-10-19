import Morphisms
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
  for rule in ["NativeBridge.eq_correspondence", "NativeBridge.Incremental.RC.sourceFalse", "NativeBridge.Incremental.RC.sourceAnd", "NativeBridge.Incremental.RC.sourceOr", "NativeBridge.Incremental.RC.sourceIff", "NativeBridge.Incremental.RC.reflexive_native", "NativeBridge.Incremental.RC.symmetric_native", "NativeBridge.Incremental.RC.transitive_native", "NativeBridge.Incremental.RC.complement_native", "NativeBridge.Incremental.RC.irreflexive_native", "NativeBridge.Incremental.RC.asymmetric_native", "NativeBridge.Incremental.RC.subrelation_native", "NativeBridge.Incremental.RC.conjunction_native", "NativeBridge.Incremental.RC.disjunction_native", "NativeBridge.Incremental.RC.relation_equivalence_native", "NativeBridge.Incremental.RC.equivalence_native", "NativeBridge.Incremental.RC.preorder_native", "NativeBridge.Incremental.RC.per_native", "NativeBridge.Incremental.RC.strictOrder_native", "NativeBridge.Incremental.RC.rewriteRelation_native", "NativeBridge.Incremental.RC.eq_relation_native", "NativeBridge.Incremental.RC.iff_relation_native", "NativeBridge.Incremental.RC.complement_function_native", "NativeBridge.Incremental.RC.subrelation_function_native", "NativeBridge.Incremental.RC.relation_equivalence_function_native", "NativeBridge.Incremental.RC.conjunction_function_native", "NativeBridge.Incremental.RC.disjunction_function_native", "NativeBridge.Incremental.RC.flip_function_native", "NativeBridge.Incremental.Morphisms.proper_native", "NativeBridge.Incremental.Morphisms.properProxy_native", "NativeBridge.Incremental.Morphisms.reflexiveProxy_native", "NativeBridge.Incremental.Morphisms.respectful_native", "NativeBridge.Incremental.Morphisms.respectful_hetero_native", "NativeBridge.Incremental.Morphisms.pointwise_relation_native", "NativeBridge.Incremental.Morphisms.forall_relation_native", "NativeBridge.Incremental.Morphisms.normalizes_native", "NativeBridge.Incremental.Morphisms.params_native", "NativeBridge.Incremental.Morphisms.PartialApplication_native", "NativeBridge.Incremental.Morphisms.apply_subrelation_native", "NativeBridge.Incremental.Morphisms.normalization_done_native", "NativeBridge.Incremental.Morphisms.compose_function_native", "NativeBridge.Incremental.Morphisms.impl_function_native", "NativeBridge.Incremental.Morphisms.pointwise_function_native", "NativeBridge.Incremental.Morphisms.source_unit_forall_native", "Rocq.Corelib.Classes.Morphisms.Proper", "Rocq.Corelib.Classes.Morphisms.ProperProxy", "Rocq.Corelib.Classes.Morphisms.ReflexiveProxy", "Rocq.Corelib.Classes.Morphisms.respectful", "Rocq.Corelib.Classes.Morphisms.respectful_hetero", "Rocq.Corelib.Classes.Morphisms.pointwise_relation", "Rocq.Corelib.Classes.Morphisms.forall_relation", "Rocq.Corelib.Classes.Morphisms.forall_def", "Rocq.Corelib.Classes.Morphisms.Normalizes", "Rocq.Corelib.Relations.Relation_Definitions.relation", "Rocq.Corelib.Program.Basics.flip", "Rocq.Corelib.Program.Basics.impl", "Rocq.Corelib.Init.Logic.not", "Rocq.Corelib.Classes.RelationClasses.Antisymmetric", "Rocq.Corelib.Classes.RelationClasses.PartialOrder", "NativeBridge.Incremental.RC.NativePreorder", "NativeBridge.Incremental.RC.NativePER", "NativeBridge.Incremental.RC.NativeStrictOrder"] do
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

#incremental_statement Rocq.Corelib.Classes.Morphisms.PER_morphism.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.PER_morphism_obligation_1.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.PartialOrder_StrictOrder.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.PartialOrder_proper.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.Reflexive_partial_app_morphism.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.StrictOrder_PartialOrder.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.StrictOrder_PreOrder.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.compose_proper.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.compose_proper_obligation_1.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.eq_pars.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.eq_proper_proxy.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.eq_rewrite_relation.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.eq_subrelation.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.flip1.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.flip2.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.flip_atom.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.flip_pars.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.flip_proper.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.flip_proper_obligation_1.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.flip_respectful.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.forall_subrelation.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.iff_flip_impl_subrelation.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.iff_impl_subrelation.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.iff_pars.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.impl_pars.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.normalizes.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.per_partial_app_morphism.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.per_partial_app_morphism_obligation_1.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.pointwise_pointwise.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.pointwise_subrelation.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.proper_eq.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.proper_flip_proper.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.proper_normalizes_proper.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.proper_prf.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.proper_proper_proxy.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.proper_proxy.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.reflexive_eq_dom_reflexive.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.reflexive_proper.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.reflexive_proper_proxy.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.reflexive_proxy.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.reflexive_reflexive_proxy.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.respectful_morphism.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.respectful_per.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.respectful_per_obligation_1.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.respectful_per_obligation_2.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.rewrite_relation_eq_dom.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.rewrite_relation_pointwise.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.subrelation_proper.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.subrelation_refl.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.subrelation_respectful.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.symmetric_equiv_flip.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.trans_sym_co_inv_impl_morphism.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.trans_sym_co_inv_impl_morphism_obligation_1.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.trans_sym_contra_impl_morphism.statement
#incremental_statement Rocq.Corelib.Classes.Morphisms.trans_sym_contra_impl_morphism_obligation_1.statement

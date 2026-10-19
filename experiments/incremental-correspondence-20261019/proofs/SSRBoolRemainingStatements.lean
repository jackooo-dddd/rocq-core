import SSRBoolPackaging
import SSRBoolExtendedStatements
namespace NativeBridge.Incremental.SSRBoolRemainingStatements
open NativeBridge SSRBoolData SSRBoolPackaging SSRBoolExtendedStatements
universe u v w
theorem manifestSimpl_forall (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.pred A)
    (F : Rocq.Corelib.ssr.ssrbool.manifest_simpl_pred.{v,u} A p → Prop) :
    (∀ x, F x) ↔ ∀ x : Unit, F ((manifestSimplIso A p).of x) := forallIso _ _
theorem registered_forall (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.pred A)
    (F : Rocq.Corelib.ssr.ssrbool.registered_applicative_pred.{v,u} A p → Prop) :
    (∀ x, F x) ↔ ∀ x : Unit, F ((registeredIso A p).of x) := forallIso _ _
theorem manifestMem_forall (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.pred A)
    (F : Rocq.Corelib.ssr.ssrbool.manifest_mem_pred.{v,u} A p → Prop) :
    (∀ x, F x) ↔ ∀ x : Unit, F ((manifestMemIso A p).of x) := forallIso _ _
theorem applicativeMem_forall (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.pred A)
    (F : Rocq.Corelib.ssr.ssrbool.applicative_mem_pred.{v,u} A p → Prop) :
    (∀ x, F x) ↔ ∀ x : Unit, F ((applicativeMemIso A p).of x) := forallIso _ _
theorem qualifier_forall (n : Rocq.Corelib.Init.Datatypes.nat) (A : Type u)
    (F : Rocq.Corelib.ssr.ssrbool.qualifier n A → Prop) :
    (∀ x, F x) ↔ ∀ x : A → Bool, F ((qualifierIso n A).of x) := forallIso _ _
theorem predKey_forall (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.pred A)
    (F : Rocq.Corelib.ssr.ssrbool.pred_key A p → Prop) :
    (∀ x, F x) ↔ ∀ x : True, F ((predKeyIso A p).of x) := forallIso (predKeyIso A p) F
theorem keyedPred_forall (A : Type u) (p : Rocq.Corelib.ssr.ssrbool.pred A)
    (k : Rocq.Corelib.ssr.ssrbool.pred_key A p)
    (F : Rocq.Corelib.ssr.ssrbool.keyed_pred.{v,u} A p k → Prop) :
    (∀ x, F x) ↔ ∀ x : Unit, F ((keyedPredIso A p k).of x) := forallIso _ _
theorem keyedQualifier_forall (A : Type u) (n : Rocq.Corelib.Init.Datatypes.nat)
    (q : Rocq.Corelib.ssr.ssrbool.qualifier n A)
    (k : Rocq.Corelib.ssr.ssrbool.pred_key A (Rocq.Corelib.ssr.ssrbool.has_quality n A q))
    (F : Rocq.Corelib.ssr.ssrbool.keyed_qualifier.{v,u} A n q k → Prop) :
    (∀ x, F x) ↔ ∀ x : Unit, F ((keyedQualifierIso A n q k).of x) := forallIso _ _
theorem predType_forall (A : Type v) (F : Rocq.Corelib.ssr.ssrbool.predType.{u,v} A → Prop) :
    (∀ x, F x) ↔ ∀ x : nativePredType.{u,v} A, F (predTypeOf A x) := forallIso (predTypeIso A) F
theorem predType_sort (A : Type v) (x : nativePredType.{u,v} A) :
    Rocq.Corelib.ssr.ssrbool.pred_sort A (predTypeOf A x) = x.fst := rfl
theorem nat_forall (F : Rocq.Corelib.Init.Datatypes.nat → Prop) :
    (∀ x, F x) ↔ ∀ x : Nat, F (natOf x) := forallIso natIso F
theorem decidable_nonempty (P : Prop) :
    Nonempty (Rocq.Corelib.ssr.ssrbool.decidable P) ↔ Nonempty (Decidable P) := by
  constructor
  · rintro ⟨x⟩; exact ⟨(SSRBoolData.decidableIso P).to x⟩
  · rintro ⟨x⟩; exact ⟨(SSRBoolData.decidableIso P).of x⟩
theorem mem_equality (A : Type u) (x y : Rocq.Corelib.ssr.ssrbool.mem_pred A) :
    (x = y) ↔ (memIso A).to x = (memIso A).to y := ((memIso A).eq_iff x y).symm
theorem memOf_eval (A : Type u) (f : A → Bool) (x : A) :
    Rocq.Corelib.ssr.ssrbool.in_mem A x ((memIso A).of f) = boolOf (f x) := rfl
theorem sig_nonempty (A : Sort u) (P : A → Prop) :
    Nonempty (Rocq.Corelib.Init.Specif.sig A P) ↔ ∃ x, P x := by
  constructor
  · rintro ⟨x⟩; cases x with | exist a h => exact ⟨a,h⟩
  · rintro ⟨a,h⟩; exact ⟨.exist A P a h⟩
theorem sum_nonempty (A : Sort u) (B : Sort v) :
    Nonempty (Rocq.Corelib.Init.Datatypes.sum A B) ↔ Nonempty A ∨ Nonempty B := by
  constructor
  · rintro ⟨x⟩; cases x with
    | inl a => exact .inl ⟨a⟩
    | inr b => exact .inr ⟨b⟩
  · intro h; cases h with
    | inl h => cases h with | intro a => exact ⟨.inl A B a⟩
    | inr h => cases h with | intro b => exact ⟨.inr A B b⟩
theorem bool_function_equality (A : Sort u) (f g : A → RBool) :
    (f = g) ↔ ∀ x, boolTo (f x) = boolTo (g x) := by
  constructor
  · intro h x; exact congrArg (fun f => boolTo (f x)) h
  · intro h; funext x; exact boolIso.injective (h x)
theorem predTo_native (A : Type u) (f : A → Bool) :
    SSRBoolData.predTo (fun x => boolOf (f x)) = f := SSRBoolData.pred_to_of f
theorem simplFun_constructor (A : Sort u) (B : Sort v) (f : A → B) :
    Rocq.Corelib.ssr.ssrfun.fun_of_simpl A B (.SimplFun A B f) = f := rfl

end NativeBridge.Incremental.SSRBoolRemainingStatements

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
 unless !(← sourceRefs (mkConst `NativeBridge.RBool)).isEmpty do
  throwError "Source-containing alias incorrectly classified as native"
 unless (← sourceRefs (mkConst `Bool)).isEmpty do
  throwError "Native Bool incorrectly classified as source-containing"

private def packagingForall (e : Expr) : MetaM (Option Simp.Result) := do
 let .forallE binder domain body bi := e | return none
 let some source := domain.getAppFn.constName? | return none
 let suffix := match source.toString with
  | "Rocq.Corelib.ssr.ssrbool.manifest_simpl_pred" => "manifestSimpl_forall"
  | "Rocq.Corelib.ssr.ssrbool.registered_applicative_pred" => "registered_forall"
  | "Rocq.Corelib.ssr.ssrbool.manifest_mem_pred" => "manifestMem_forall"
  | "Rocq.Corelib.ssr.ssrbool.applicative_mem_pred" => "applicativeMem_forall"
  | "Rocq.Corelib.ssr.ssrbool.pred_key" => "predKey_forall"
  | "Rocq.Corelib.ssr.ssrbool.keyed_pred" => "keyedPred_forall"
  | "Rocq.Corelib.ssr.ssrbool.keyed_qualifier" => "keyedQualifier_forall"
  | _ => ""
 if suffix.isEmpty then return none
 try
  withTransparency .all do
   let n := ("NativeBridge.Incremental.SSRBoolRemainingStatements." ++ suffix).toName
   let proof ← mkAppM n (domain.getAppArgs.push (.lam binder domain body bi))
   let ty ← inferType proof
   unless ty.isAppOfArity `Iff 2 do return none
   let args := ty.getAppArgs
   unless ← isDefEq args[0]! e do return none
   let equality ← mkAppM `propext #[proof]
   return some { expr := ← instantiateMVars args[1]!, proof? := some (← instantiateMVars equality) }
 catch _ => return none

syntax (name := ssrboolRemainingStatement) "#ssrbool_remaining_statement " ident : command
@[command_elab ssrboolRemainingStatement] def elabSsrboolRemainingStatement : CommandElab := fun stx => do
 let sourceName := stx[1].getId
 liftTermElabM do
  let ci ← getConstInfo sourceName
  let .defnInfo di := ci | throwError "Expected translated statement definition"
  unless di.type == .sort .zero do throwError "Conditional/type-valued statement excluded"
  let mut rules : SimpTheorems := {}
  for rule in ["NativeBridge.eq_correspondence", "NativeBridge.is_true_agrees", "NativeBridge.bool_to_of", "NativeBridge.bool_of_to", "NativeBridge.andb_agrees", "NativeBridge.orb_agrees", "NativeBridge.negb_agrees", "NativeBridge.xorb_agrees", "NativeBridge.implb_agrees", "NativeBridge.option_to_of", "NativeBridge.option_of_to", "NativeBridge.Incremental.bool_rec_native", "NativeBridge.Incremental.bool_function_forall", "NativeBridge.Incremental.bool_binary_function_forall", "NativeBridge.Incremental.bool_forall_native", "NativeBridge.Incremental.bool_exists_native", "NativeBridge.Incremental.bool_equality_native", "NativeBridge.Incremental.bool_eq_native", "NativeBridge.Incremental.reflect_arrow_native", "NativeBridge.Incremental.boolTo_true", "NativeBridge.Incremental.boolTo_false", "NativeBridge.Incremental.ssr_addb_agrees", "NativeBridge.Incremental.ssr_if_expr_agrees", "NativeBridge.Incremental.ssr_isSome_agrees", "NativeBridge.Incremental.ssr_subpred_agrees", "NativeBridge.Incremental.ssr_subrel_agrees", "NativeBridge.Incremental.ssr_reflexive_agrees", "NativeBridge.Incremental.ssr_irreflexive_agrees", "NativeBridge.Incremental.ssr_symmetric_agrees", "NativeBridge.Incremental.ssr_transitive_agrees", "NativeBridge.Incremental.ssr_antisymmetric_agrees", "NativeBridge.Incremental.ssr_total_agrees", "NativeBridge.Incremental.ssr_cancel_agrees", "NativeBridge.Incremental.ssr_commutative_agrees", "NativeBridge.Incremental.ssr_associative_agrees", "NativeBridge.Incremental.ssr_involutive_agrees", "NativeBridge.Incremental.ssr_injective_agrees", "NativeBridge.Incremental.ssr_eqfun_agrees", "NativeBridge.Incremental.ssr_eqrel_agrees", "NativeBridge.Incremental.ssr_left_id_agrees", "NativeBridge.Incremental.true_agrees", "NativeBridge.Incremental.false_agrees", "NativeBridge.Incremental.and_agrees", "NativeBridge.Incremental.or_agrees", "NativeBridge.Incremental.not_agrees", "NativeBridge.Incremental.notT_agrees", "NativeBridge.Incremental.iff_agrees", "NativeBridge.Incremental.ex_agrees", "NativeBridge.Incremental.ex2_agrees", "NativeBridge.Incremental.inhabited_agrees", "NativeBridge.Incremental.all_agrees", "Rocq.Corelib.ssr.ssrfun.right_commutative", "Rocq.Corelib.ssr.ssrfun.left_commutative", "Rocq.Corelib.ssr.ssrfun.interchange", "Rocq.Corelib.ssr.ssrfun.right_id", "Rocq.Corelib.ssr.ssrfun.right_injective", "Rocq.Corelib.ssr.ssrfun.right_loop", "Rocq.Corelib.ssr.ssrfun.left_loop", "Rocq.Corelib.ssr.ssrfun.self_inverse", "Rocq.Corelib.ssr.ssrfun.left_zero", "Rocq.Corelib.ssr.ssrfun.right_zero", "Rocq.Corelib.ssr.ssrfun.idempotent_op", "Rocq.Corelib.ssr.ssrfun.idempotent_fun", "Rocq.Corelib.ssr.ssrbool.pred", "Rocq.Corelib.ssr.ssrbool.rel", "NativeBridge.Incremental.SSRBoolLogic.and3_agrees", "NativeBridge.Incremental.SSRBoolLogic.and4_agrees", "NativeBridge.Incremental.SSRBoolLogic.and5_agrees", "NativeBridge.Incremental.SSRBoolLogic.or3_agrees", "NativeBridge.Incremental.SSRBoolLogic.or4_agrees", "NativeBridge.Incremental.SSRBoolLogic.pre_symmetric_agrees", "NativeBridge.Incremental.SSRBoolLogic.left_transitive_agrees", "NativeBridge.Incremental.SSRBoolLogic.right_transitive_agrees", "NativeBridge.Incremental.SSRBoolLogic.equivalence_rel_agrees", "NativeBridge.Incremental.SSRBoolLogic.quality_prod_agrees", "NativeBridge.Incremental.SSRBoolData.classically_agrees", "NativeBridge.Incremental.SSRBoolData.unless_agrees", "NativeBridge.Incremental.SSRBoolExtendedStatements.simpl_forall", "NativeBridge.Incremental.SSRBoolExtendedStatements.mem_forall", "NativeBridge.Incremental.SSRBoolExtendedStatements.implies_forall", "NativeBridge.Incremental.SSRBoolExtendedStatements.decidable_forall", "NativeBridge.Incremental.SSRBoolExtendedStatements.coerce_of", "NativeBridge.Incremental.SSRBoolExtendedStatements.mem_of", "NativeBridge.Incremental.SSRBoolExtendedStatements.phantom_agrees", "Rocq.Corelib.ssr.ssrfun.left_injective", "Rocq.Corelib.ssr.ssrfun.left_distributive", "Rocq.Corelib.ssr.ssrfun.right_distributive", "Rocq.Corelib.ssr.ssrfun.homomorphism_1", "Rocq.Corelib.ssr.ssrfun.homomorphism_2", "Rocq.Corelib.ssr.ssrfun.monomorphism_1", "Rocq.Corelib.ssr.ssrfun.monomorphism_2", "Rocq.Corelib.ssr.ssrfun.comp", "Rocq.Corelib.ssr.ssrbool.predArgType", "Rocq.Corelib.ssr.ssrbool.sort_of_predArgType", "Rocq.Corelib.ssr.ssrbool.pre_symmetric", "Rocq.Corelib.ssr.ssrbool.left_transitive", "Rocq.Corelib.ssr.ssrbool.right_transitive", "Rocq.Corelib.ssr.ssrbool.equivalence_rel", "Rocq.Corelib.ssr.ssrbool.prop_for", "Rocq.Corelib.ssr.ssrbool.prop_in1", "Rocq.Corelib.ssr.ssrbool.prop_in2", "Rocq.Corelib.ssr.ssrbool.prop_in3", "Rocq.Corelib.ssr.ssrbool.prop_in11", "Rocq.Corelib.ssr.ssrbool.prop_in12", "Rocq.Corelib.ssr.ssrbool.prop_in21", "Rocq.Corelib.ssr.ssrbool.prop_in111", "Rocq.Corelib.ssr.ssrbool.prop_on1", "Rocq.Corelib.ssr.ssrbool.prop_on2", "Rocq.Corelib.ssr.ssrbool.sub_mem", "Rocq.Corelib.ssr.ssrbool.eq_mem", "Rocq.Corelib.ssr.ssrbool.predPredType", "Rocq.Corelib.ssr.ssrbool.memPredType", "Rocq.Corelib.ssr.ssrbool.simplPredType", "Rocq.Corelib.ssr.ssrbool.mem", "Rocq.Corelib.ssr.ssrbool.in_mem", "Rocq.Corelib.ssr.ssrbool.pred_of_mem", "Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce", "Rocq.Corelib.ssr.ssrbool.simpl_of_mem", "Rocq.Corelib.ssr.ssrbool.SimplPred", "Rocq.Corelib.ssr.ssrbool.rel_of_simpl", "Rocq.Corelib.ssr.ssrbool.relU", "Rocq.Corelib.ssr.ssrbool.SimplRel", "Rocq.Corelib.ssr.ssrbool.subrel", "Rocq.Corelib.ssr.ssrfun.eqfun", "Rocq.Corelib.ssr.ssrfun.fun_of_simpl", "NativeBridge.Incremental.SSRBoolRemainingStatements.manifestSimpl_forall", "NativeBridge.Incremental.SSRBoolRemainingStatements.registered_forall", "NativeBridge.Incremental.SSRBoolRemainingStatements.manifestMem_forall", "NativeBridge.Incremental.SSRBoolRemainingStatements.applicativeMem_forall", "NativeBridge.Incremental.SSRBoolRemainingStatements.qualifier_forall", "NativeBridge.Incremental.SSRBoolRemainingStatements.predKey_forall", "NativeBridge.Incremental.SSRBoolRemainingStatements.keyedPred_forall", "NativeBridge.Incremental.SSRBoolRemainingStatements.keyedQualifier_forall", "NativeBridge.Incremental.SSRBoolRemainingStatements.predType_forall", "NativeBridge.Incremental.SSRBoolRemainingStatements.predType_sort", "NativeBridge.Incremental.SSRBoolRemainingStatements.nat_forall", "NativeBridge.Incremental.SSRBoolRemainingStatements.decidable_nonempty", "NativeBridge.Incremental.SSRBoolRemainingStatements.mem_equality", "NativeBridge.Incremental.SSRBoolRemainingStatements.memOf_eval", "Rocq.Corelib.ssr.ssrbool.applicative_pred_value", "Rocq.Corelib.ssr.ssrbool.simpl_pred_value", "Rocq.Corelib.ssr.ssrbool.mem_pred_value", "Rocq.Corelib.ssr.ssrbool.applicative_mem_pred_value", "Rocq.Corelib.ssr.ssrbool.collective_pred_of_simpl", "Rocq.Corelib.ssr.ssrbool.applicative_pred_of_simpl", "Rocq.Corelib.ssr.ssrbool.unkey_pred", "Rocq.Corelib.ssr.ssrbool.unkey_qualifier", "Rocq.Corelib.ssr.ssrbool.has_quality", "NativeBridge.Incremental.SSRBoolData.memIso", "NativeBridge.Incremental.SSRBoolData.simplPredIso", "NativeBridge.Incremental.SSRBoolData.predTypeOf", "NativeBridge.Incremental.SSRBoolData.predTypeTo", "NativeBridge.Incremental.SSRBoolData.predTo", "NativeBridge.Incremental.SSRBoolData.predOf", "NativeBridge.Incremental.SSRBoolPackaging.manifestSimplIso", "NativeBridge.Incremental.SSRBoolPackaging.registeredIso", "NativeBridge.Incremental.SSRBoolPackaging.manifestMemIso", "NativeBridge.Incremental.SSRBoolPackaging.applicativeMemIso", "NativeBridge.Incremental.SSRBoolPackaging.qualifierIso", "NativeBridge.Incremental.SSRBoolPackaging.predKeyIso", "NativeBridge.Incremental.SSRBoolPackaging.keyedPredIso", "NativeBridge.Incremental.SSRBoolPackaging.keyedQualifierIso", "Rocq.Corelib.ssr.ssrbool.pred_sort", "Rocq.Corelib.ssr.ssrbool.topred", "NativeBridge.Incremental.SSRBoolRemainingStatements.sig_nonempty", "NativeBridge.Incremental.SSRBoolRemainingStatements.sum_nonempty", "NativeBridge.Incremental.SSRBoolRemainingStatements.bool_function_equality", "NativeBridge.Incremental.SSRBoolRemainingStatements.predTo_native", "NativeBridge.Incremental.SSRBoolRemainingStatements.simplFun_constructor", "NativeBridge.Incremental.SSRBoolPackaging.locked_agrees", "id"] do
   let n := rule.toName
   if (← getEnv).contains n then
    rules ← if rule.startsWith "Rocq." || (← getConstInfo n).isDefinition then rules.addDeclToUnfold n else rules.addConst n
  let ctx ← Simp.mkContext (config := { maxSteps := 20000 }) (simpTheorems := #[rules])
  let defaults := Simp.mkDefaultMethodsCore #[]
  let methods : Simp.Methods := { defaults with pre := fun e => do
   if let some r ← packagingForall e then return .visit r
   defaults.pre e }
  let (first, _) ← Simp.mainCore di.value ctx {} (methods := methods)
  let mut r := first
  for _ in [:8] do
   let (next, _) ← Simp.mainCore r.expr ctx {} (methods := methods)
   if next.expr == r.expr then break
   let proof ← mkAppM `Eq.trans #[← r.getProof' di.value, ← next.getProof' r.expr]
   r := { expr := next.expr, proof? := some proof }
  let nativeName := ("NativeBridge.Incremental.SSRBoolRemainingStatements." ++ sourceName.toString ++ ".native").toName
  let certName := ("NativeBridge.Incremental.SSRBoolRemainingStatements." ++ sourceName.toString ++ ".correspondence").toName
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

#ssrbool_remaining_statement Rocq.Corelib.ssr.ssrbool.app_predE.statement
#ssrbool_remaining_statement Rocq.Corelib.ssr.ssrbool.classic_EM.statement
#ssrbool_remaining_statement Rocq.Corelib.ssr.ssrbool.classic_pick.statement
#ssrbool_remaining_statement Rocq.Corelib.ssr.ssrbool.classic_sigW.statement
#ssrbool_remaining_statement Rocq.Corelib.ssr.ssrbool.if_arg.statement
#ssrbool_remaining_statement Rocq.Corelib.ssr.ssrbool.inE.statement
#ssrbool_remaining_statement Rocq.Corelib.ssr.ssrbool.in_applicative.statement
#ssrbool_remaining_statement Rocq.Corelib.ssr.ssrbool.in_collective.statement
#ssrbool_remaining_statement Rocq.Corelib.ssr.ssrbool.in_simpl.statement
#ssrbool_remaining_statement Rocq.Corelib.ssr.ssrbool.is_true_locked_true.statement
#ssrbool_remaining_statement Rocq.Corelib.ssr.ssrbool.keyed_predE.statement
#ssrbool_remaining_statement Rocq.Corelib.ssr.ssrbool.keyed_qualifier_suproof.statement
#ssrbool_remaining_statement Rocq.Corelib.ssr.ssrbool.memE.statement
#ssrbool_remaining_statement Rocq.Corelib.ssr.ssrbool.mem_mem.statement
#ssrbool_remaining_statement Rocq.Corelib.ssr.ssrbool.mem_simpl.statement
#ssrbool_remaining_statement Rocq.Corelib.ssr.ssrbool.mem_topred.statement
#ssrbool_remaining_statement Rocq.Corelib.ssr.ssrbool.qualifE.statement
#ssrbool_remaining_statement Rocq.Corelib.ssr.ssrbool.sub_in1.statement
#ssrbool_remaining_statement Rocq.Corelib.ssr.ssrbool.sub_in11.statement
#ssrbool_remaining_statement Rocq.Corelib.ssr.ssrbool.sub_in111.statement
#ssrbool_remaining_statement Rocq.Corelib.ssr.ssrbool.sub_in12.statement
#ssrbool_remaining_statement Rocq.Corelib.ssr.ssrbool.sub_in2.statement
#ssrbool_remaining_statement Rocq.Corelib.ssr.ssrbool.sub_in21.statement
#ssrbool_remaining_statement Rocq.Corelib.ssr.ssrbool.sub_in3.statement
#ssrbool_remaining_statement Rocq.Corelib.ssr.ssrbool.sub_refl.statement
#ssrbool_remaining_statement Rocq.Corelib.ssr.ssrbool.subon1.statement
#ssrbool_remaining_statement Rocq.Corelib.ssr.ssrbool.subon1l.statement
#ssrbool_remaining_statement Rocq.Corelib.ssr.ssrbool.subon2.statement
#ssrbool_remaining_statement Rocq.Corelib.ssr.ssrbool.topredE.statement

namespace NativeBridge.Incremental.SSRBoolRemainingStatements
universe u v
def nativeIfArg : Prop := ∀ (A : Sort u) (B : Sort v) (x : A) (b : Bool) (fT fF : A → B),
  (if b then fT else fF) x = if b then fT x else fF x
theorem ifArgProof : Rocq.Corelib.ssr.ssrbool.if_arg.statement.{u,v} := by
  intro A B x b fT fF
  cases b <;> exact NativeBridge.eqOf rfl
theorem ifArgCorrespondence :
    Rocq.Corelib.ssr.ssrbool.if_arg.statement.{u,v} ↔ nativeIfArg.{u,v} := by
  constructor
  · intro _ A B x b fT fF
    cases b <;> rfl
  · intro _; exact ifArgProof
end NativeBridge.Incremental.SSRBoolRemainingStatements

import SSRBool
set_option autoImplicit false
namespace NativeBridge.Incremental
universe u v w
variable {A : Sort u} {B : Sort v} {C : Sort w}

theorem ssr_cancel_agrees (f : A → B) (g : B → A) :
 Rocq.Corelib.ssr.ssrfun.cancel B A f g ↔ ∀ x, g (f x) = x := by
 simp only [Rocq.Corelib.ssr.ssrfun.cancel, eq_correspondence]


theorem ssr_commutative_agrees (f : A → A → B) :
 Rocq.Corelib.ssr.ssrfun.commutative A B f ↔ ∀ x y, f x y = f y x := by
 simp only [Rocq.Corelib.ssr.ssrfun.commutative, eq_correspondence]


theorem ssr_associative_agrees (f : A → A → A) :
 Rocq.Corelib.ssr.ssrfun.associative A f ↔ ∀ x y z, f x (f y z) = f (f x y) z := by
 simp only [Rocq.Corelib.ssr.ssrfun.associative, eq_correspondence]


theorem ssr_involutive_agrees (f : A → A) :
 Rocq.Corelib.ssr.ssrfun.involutive A f ↔ ∀ x, f (f x) = x := by
 simp only [Rocq.Corelib.ssr.ssrfun.involutive, ssr_cancel_agrees]


theorem ssr_injective_agrees (f : A → B) :
 Rocq.Corelib.ssr.ssrfun.injective B A f ↔ ∀ x y, f x = f y → x = y := by
 simp only [Rocq.Corelib.ssr.ssrfun.injective, eq_correspondence]


theorem ssr_eqfun_agrees (f g : A → B) :
 Rocq.Corelib.ssr.ssrfun.eqfun B A f g ↔ f = g := by
 constructor
 · intro h
   funext x
   exact eqTo (h x)
 · intro h x
   exact eqOf (congrArg (fun k => k x) h)


theorem ssr_left_id_agrees (e : A) (f : A → B → B) :
 Rocq.Corelib.ssr.ssrfun.left_id A B e f ↔ ∀ x, f e x = x := by
 simp only [Rocq.Corelib.ssr.ssrfun.left_id, eq_correspondence]

end NativeBridge.Incremental

namespace NativeBridge.Incremental
universe u
@[simp] theorem false_agrees : Rocq.Corelib.Init.Logic.False ↔ False := by
  constructor <;> intro h <;> cases h

@[simp] theorem and_agrees (P Q : Prop) : Rocq.Corelib.Init.Logic.and P Q ↔ (P ∧ Q) := by
  constructor
  · intro h; cases h with | conj p q => exact ⟨p,q⟩
  · rintro ⟨p,q⟩; exact .conj P Q p q

@[simp] theorem or_agrees (P Q : Prop) : Rocq.Corelib.Init.Logic.or P Q ↔ (P ∨ Q) := by
  constructor
  · intro h; cases h with
    | or_introl p => exact Or.inl p
    | or_intror q => exact Or.inr q
  · intro h; cases h with
    | inl p => exact .or_introl P Q p
    | inr q => exact .or_intror P Q q

@[simp] theorem not_agrees (P : Prop) : Rocq.Corelib.Init.Logic.not P ↔ ¬ P := by
  change (P → Rocq.Corelib.Init.Logic.False) ↔ (P → False)
  simp only [false_agrees]

@[simp] theorem iff_agrees (P Q : Prop) : Rocq.Corelib.Init.Logic.iff P Q ↔ (P ↔ Q) := by
  change Rocq.Corelib.Init.Logic.and (P → Q) (Q → P) ↔ (P ↔ Q)
  rw [and_agrees]
  exact ⟨fun h => ⟨h.1,h.2⟩, fun h => ⟨h.mp,h.mpr⟩⟩

@[simp] theorem ex_agrees {A : Sort u} (P : A → Prop) : Rocq.Corelib.Init.Logic.ex A P ↔ ∃ x, P x := by
  constructor
  · intro h; cases h with | ex_intro x hx => exact ⟨x,hx⟩
  · rintro ⟨x,hx⟩; exact .ex_intro A P x hx

@[simp] theorem ex2_agrees {A : Sort u} (P Q : A → Prop) : Rocq.Corelib.Init.Logic.ex2 A P Q ↔ ∃ x, P x ∧ Q x := by
  constructor
  · intro h; cases h with | ex_intro2 x hp hq => exact ⟨x,hp,hq⟩
  · rintro ⟨x,hp,hq⟩; exact .ex_intro2 A P Q x hp hq

theorem boolTo_true : boolTo Rocq.Corelib.Init.Datatypes.bool.true = true := rfl
theorem boolTo_false : boolTo Rocq.Corelib.Init.Datatypes.bool.false = false := rfl
end NativeBridge.Incremental
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

syntax (name := incrementalStatement) "#incremental_statement " ident : command
@[command_elab incrementalStatement] def elabIncrementalStatement : CommandElab := fun stx => do
 let sourceName := stx[1].getId
 liftTermElabM do
  let ci ← getConstInfo sourceName
  let .defnInfo di := ci | throwError "Expected translated statement definition"
  unless di.type == .sort .zero do throwError "Conditional/type-valued statement excluded"
  let mut rules : SimpTheorems := {}
  for rule in ["NativeBridge.eq_correspondence", "NativeBridge.is_true_agrees", "NativeBridge.bool_to_of", "NativeBridge.bool_of_to", "NativeBridge.andb_agrees", "NativeBridge.orb_agrees", "NativeBridge.negb_agrees", "NativeBridge.xorb_agrees", "NativeBridge.implb_agrees", "NativeBridge.option_to_of", "NativeBridge.option_of_to", "NativeBridge.Incremental.bool_rec_native", "NativeBridge.Incremental.bool_function_forall", "NativeBridge.Incremental.bool_binary_function_forall", "NativeBridge.Incremental.bool_forall_native", "NativeBridge.Incremental.bool_exists_native", "NativeBridge.Incremental.bool_equality_native", "NativeBridge.Incremental.bool_eq_native", "NativeBridge.Incremental.reflect_arrow_native", "NativeBridge.Incremental.boolTo_true", "NativeBridge.Incremental.boolTo_false", "NativeBridge.Incremental.ssr_addb_agrees", "NativeBridge.Incremental.ssr_if_expr_agrees", "NativeBridge.Incremental.ssr_isSome_agrees", "NativeBridge.Incremental.ssr_subpred_agrees", "NativeBridge.Incremental.ssr_subrel_agrees", "NativeBridge.Incremental.ssr_reflexive_agrees", "NativeBridge.Incremental.ssr_irreflexive_agrees", "NativeBridge.Incremental.ssr_symmetric_agrees", "NativeBridge.Incremental.ssr_transitive_agrees", "NativeBridge.Incremental.ssr_antisymmetric_agrees", "NativeBridge.Incremental.ssr_total_agrees", "NativeBridge.Incremental.ssr_cancel_agrees", "NativeBridge.Incremental.ssr_commutative_agrees", "NativeBridge.Incremental.ssr_associative_agrees", "NativeBridge.Incremental.ssr_involutive_agrees", "NativeBridge.Incremental.ssr_injective_agrees", "NativeBridge.Incremental.ssr_eqfun_agrees", "NativeBridge.Incremental.ssr_eqrel_agrees", "NativeBridge.Incremental.ssr_left_id_agrees", "NativeBridge.Incremental.true_agrees", "NativeBridge.Incremental.false_agrees", "NativeBridge.Incremental.and_agrees", "NativeBridge.Incremental.or_agrees", "NativeBridge.Incremental.not_agrees", "NativeBridge.Incremental.notT_agrees", "NativeBridge.Incremental.iff_agrees", "NativeBridge.Incremental.ex_agrees", "NativeBridge.Incremental.ex2_agrees", "NativeBridge.Incremental.inhabited_agrees", "NativeBridge.Incremental.all_agrees", "Rocq.Corelib.ssr.ssrfun.right_commutative", "Rocq.Corelib.ssr.ssrfun.left_commutative", "Rocq.Corelib.ssr.ssrfun.interchange", "Rocq.Corelib.ssr.ssrfun.right_id", "Rocq.Corelib.ssr.ssrfun.right_injective", "Rocq.Corelib.ssr.ssrfun.right_loop", "Rocq.Corelib.ssr.ssrfun.left_loop", "Rocq.Corelib.ssr.ssrfun.self_inverse", "Rocq.Corelib.ssr.ssrfun.left_zero", "Rocq.Corelib.ssr.ssrfun.right_zero", "Rocq.Corelib.ssr.ssrfun.idempotent_op", "Rocq.Corelib.ssr.ssrfun.idempotent_fun", "Rocq.Corelib.ssr.ssrbool.pred", "Rocq.Corelib.ssr.ssrbool.rel"] do
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

#incremental_statement Rocq.Corelib.ssr.ssrbool.addFb.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.addIb.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.addKb.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.addNb.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.addTb.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.addbA.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.addbAC.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.addbACA.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.addbC.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.addbCA.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.addbF.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.addbI.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.addbK.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.addbN.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.addbT.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.addbb.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.and3_ind.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.and3_sind.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.and4_ind.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.and4_sind.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.and5_ind.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.and5_sind.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.andFb.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.andKb.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.andNb.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.andTb.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.andbA.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.andbAC.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.andbACA.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.andbC.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.andbCA.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.andbF.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.andbK.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.andbN.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.andbT.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.andb_addl.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.andb_addr.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.andb_id2l.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.andb_id2r.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.andb_idl.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.andb_idr.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.andb_orl.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.andb_orr.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.andbb.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.appP.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.app_predE.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.can_mono.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.classicP.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.classicW.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.classic_EM.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.classic_bind.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.classic_ex.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.classic_imply.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.classic_pick.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.classic_sigW.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.contra.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.contraFF.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.contraFN.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.contraFT.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.contraFnot.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.contraL.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.contraLR.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.contraNF.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.contraNN.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.contraNT.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.contraNnot.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.contraPF.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.contraPN.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.contraPT.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.contraR.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.contraT.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.contraTF.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.contraTN.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.contraTT.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.contraTnot.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.contra_notF.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.contra_notN.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.contra_notT.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.decPcases.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.elimF.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.elimFn.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.elimN.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.elimNTF.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.elimNf.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.elimT.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.elimTF.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.elimTFn.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.elimTn.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.eqbLR.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.eqbRL.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.equivPif.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.equivPifn.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.equivalence_relP.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.forE.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.fun_if.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.homoLR.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.homoRL.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.homo_mono.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.homo_sym.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.ifE.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.ifF.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.ifN.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.ifT.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.if_arg.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.if_neg.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.if_same.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.impliesPn.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.implyFb.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.implyNb.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.implyTb.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.implybE.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.implybF.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.implybN.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.implybNN.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.implybT.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.implyb_id2l.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.implyb_idl.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.implyb_idr.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.implybb.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.inE.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.inPhantom.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.in_applicative.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.in_collective.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.in_simpl.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.introF.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.introFn.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.introN.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.introNTF.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.introNf.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.introT.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.introTF.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.introTFn.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.introTn.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.isT.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.is_true_locked_true.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.is_true_true.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.keyed_predE.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.keyed_qualifier_suproof.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.memE.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.mem_mem.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.mem_simpl.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.mem_topred.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.mono2W.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.monoLR.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.monoRL.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.monoW.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.mono_sym.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.negbF.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.negbFE.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.negbK.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.negbLR.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.negbNE.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.negbRL.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.negbT.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.negbTE.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.negb_and.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.negb_imply.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.negb_inj.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.negb_or.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.notF.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.not_false_is_true.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.onPhantom.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.or3_ind.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.or3_sind.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.or4_ind.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.or4_sind.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.orFb.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.orKb.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.orNb.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.orTb.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.orbA.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.orbAC.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.orbACA.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.orbC.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.orbCA.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.orbF.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.orbK.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.orbN.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.orbT.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.orb_andl.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.orb_andr.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.orb_id2l.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.orb_id2r.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.orb_idl.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.orb_idr.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.orbb.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.pair_andP.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.prop_congr.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.qualifE.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.rev_trans.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.rwP.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.rwP2.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.sameP.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.simpl_predE.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.sub_in1.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.sub_in11.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.sub_in111.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.sub_in12.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.sub_in2.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.sub_in21.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.sub_in3.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.sub_refl.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.subon1.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.subon1l.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.subon2.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.subrelUl.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.subrelUr.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.sym_left_transitive.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.sym_right_transitive.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.symmetric_from_pre.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.topredE.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.unfold_in.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.unlessP.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.wlog_neg.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.xorPif.statement
#incremental_statement Rocq.Corelib.ssr.ssrbool.xorPifn.statement

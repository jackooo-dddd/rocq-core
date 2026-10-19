import SSRBoolConditionalNormalization
open Lean Meta Elab Command
syntax (name := closeSSRBoolDefinition) "#close_ssrb_definition " ident : command
@[command_elab closeSSRBoolDefinition] def elabCloseSSRBoolDefinition : CommandElab := fun stx => do
 liftTermElabM do
  let source := stx[1].getId
  let ci ← getConstInfo source
  let ls := ci.levelParams.map Level.param
  let mut ty := ci.type
  let mut witnesses : Array Expr := #[]
  while let .forallE _ domain body _ := ty do
   let some dep := domain.getAppFn.constName? | break
   unless dep.toString.endsWith ".statement" do break
   let witness ← mkConstWithFreshMVarLevels ("NativeBridge.Incremental.SSRBoolWitnesses.closed." ++ dep.toString).toName
   unless ← isDefEq (← inferType witness) domain do throwError "Prerequisite type mismatch"
   witnesses := witnesses.push (← instantiateMVars witness)
   ty := body.instantiate1 witness
  let target := ("NativeBridge.Incremental.SSRBoolClosedOperations.closed." ++ source.toString).toName
  let value := mkAppN (mkConst source ls) witnesses
  addDecl (.defnDecl {name:=target,levelParams:=ci.levelParams,type:=ty,value:=value,hints:=.abbrev,safety:=.safe})

#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.ApplicativePred
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.KeyedPred
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.KeyedQualifier
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.DefaultKeying.default_keyed_pred
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.DefaultKeying.default_keyed_qualifier
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.applicative_pred_applicative
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.expose_mem_pred
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.expose_simpl_pred
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.bijective_in
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.bijective_on
noncomputable section
namespace NativeBridge.Incremental.SSRBoolClosedOperations
open NativeBridge SSRBoolData SSRBoolPackaging
universe u v

theorem ApplicativePred_agrees (A : Type u) (p : A → Bool) :
    (registeredIso.{u,v} A (predOf p)).to (@RocqPending.Corelib.ssr.ssrbool.ApplicativePred.{v,u} NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.ApplicativePred__rocq2lean_obligation_1.statement A (predOf p)) = () := rfl

theorem expose_mem_pred_agrees (A : Type u) (p : A → Bool) :
    (manifestMemIso.{u,v} A (predOf p)).to (@RocqPending.Corelib.ssr.ssrbool.expose_mem_pred.{v,u} NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.expose_mem_pred__rocq2lean_obligation_1.statement A (predOf p)) = () := rfl

theorem expose_simpl_pred_agrees (A : Type u) (p : A → Bool) :
    (manifestSimplIso.{u,v} A (predOf p)).to (@RocqPending.Corelib.ssr.ssrbool.expose_simpl_pred.{v,u} NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.expose_simpl_pred__rocq2lean_obligation_1.statement A (predOf p)) = () := rfl

theorem applicative_pred_applicative_agrees (A : Type u) (p : A → Bool) :
    (registeredIso.{u,v} A (Rocq.Corelib.ssr.ssrbool.applicative_pred_of_simpl A ((simplPredIso A).of p))).to
      (@RocqPending.Corelib.ssr.ssrbool.applicative_pred_applicative.{v,u} NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.ApplicativePred__rocq2lean_obligation_1.statement A ((simplPredIso A).of p)) = () := rfl

theorem KeyedPred_agrees (A : Type u) (p : A → Bool) (k : True) :
    (keyedPredIso.{u,v} A (predOf p) ((predKeyIso A (predOf p)).of k)).to
      (@RocqPending.Corelib.ssr.ssrbool.KeyedPred.{v,u} NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.KeyedPred__rocq2lean_obligation_1.statement A (predOf p) ((predKeyIso A (predOf p)).of k)) = () := rfl

theorem default_keyed_pred_agrees (A : Type u) (p : A → Bool) :
    (keyedPredIso.{u,v} A (predOf p) _).to (@RocqPending.Corelib.ssr.ssrbool.DefaultKeying.default_keyed_pred.{v,u} NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.KeyedPred__rocq2lean_obligation_1.statement A (predOf p)) = () := rfl

theorem KeyedQualifier_agrees (A : Type u) (n : Nat) (p : A → Bool) (k : True) :
    (keyedQualifierIso.{u,v} A (natOf n) ((qualifierIso (natOf n) A).of p) ((predKeyIso A (predOf p)).of k)).to
      (@RocqPending.Corelib.ssr.ssrbool.KeyedQualifier.{v,u} NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.KeyedQualifier__rocq2lean_obligation_1.statement A (natOf n) ((qualifierIso (natOf n) A).of p) ((predKeyIso A (predOf p)).of k)) = () := rfl

theorem default_keyed_qualifier_agrees (A : Type u) (n : Nat) (p : A → Bool) :
    (keyedQualifierIso.{u,v} A (natOf n) ((qualifierIso (natOf n) A).of p) _).to
      (@RocqPending.Corelib.ssr.ssrbool.DefaultKeying.default_keyed_qualifier.{v,u} NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.KeyedQualifier__rocq2lean_obligation_1.statement A (natOf n) ((qualifierIso (natOf n) A).of p)) = () := rfl

theorem bijective_in_agrees (A : Type u) (B : Type v) (d : A → Bool) (f : A → B) :
    (@RocqPending.Corelib.ssr.ssrbool.bijective_in.{u,v} NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_3.statement A B ((memIso A).of d) f) ↔
      ∃ g : B → A, (∀ x, d x = true → g (f x) = x) ∧ (∀ y, d (g y) = true → f (g y) = y) := by
  simp only [RocqPending.Corelib.ssr.ssrbool.bijective_in, NativeBridge.Incremental.ex2_agrees,
    Rocq.Corelib.ssr.ssrbool.prop_in1, Rocq.Corelib.ssr.ssrbool.prop_on1,
    Rocq.Corelib.ssr.ssrbool.in_mem, Rocq.Corelib.ssr.ssrbool.pred_of_mem, memIso, predOf,
    NativeBridge.is_true_agrees, NativeBridge.bool_to_of, NativeBridge.eq_correspondence]

theorem bijective_on_agrees (A : Type u) (B : Type v) (d : B → Bool) (f : A → B) :
    (@RocqPending.Corelib.ssr.ssrbool.bijective_on.{v,u} NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_3.statement A B ((memIso B).of d) f) ↔
      ∃ g : B → A, (∀ x, d (f x) = true → g (f x) = x) ∧ (∀ y, d y = true → f (g y) = y) := by
  simp only [RocqPending.Corelib.ssr.ssrbool.bijective_on, NativeBridge.Incremental.ex2_agrees,
    Rocq.Corelib.ssr.ssrbool.prop_in1, Rocq.Corelib.ssr.ssrbool.prop_on1,
    Rocq.Corelib.ssr.ssrbool.in_mem, Rocq.Corelib.ssr.ssrbool.pred_of_mem, memIso, predOf,
    NativeBridge.is_true_agrees, NativeBridge.bool_to_of, NativeBridge.eq_correspondence]

end NativeBridge.Incremental.SSRBoolClosedOperations

import SSRRewriteData
noncomputable section
namespace NativeBridge.Incremental.SSRRewriteStatements
open NativeBridge.Incremental.SSRRewriteData
universe u v

def viewInduction : Prop := ∀ (P : Type u → Prop), (∀ T, P T) → ∀ T, P T
theorem viewInduction_proof : viewInduction.{u} := fun _ h => h
theorem view_ind_proof : Rocq.Corelib.ssr.ssreflect_rw.external_view_ind.statement.{u} := by
  intro P step e
  cases e with | tactic_view T => exact step T
theorem view_sind_proof : Rocq.Corelib.ssr.ssreflect_rw.external_view_sind.statement.{u} := view_ind_proof
theorem view_ind_correspondence :
    Rocq.Corelib.ssr.ssreflect_rw.external_view_ind.statement.{u} ↔ viewInduction.{u} :=
  ⟨fun _ => viewInduction_proof, fun _ => view_ind_proof⟩
theorem view_sind_correspondence :
    Rocq.Corelib.ssr.ssreflect_rw.external_view_sind.statement.{u} ↔ viewInduction.{u} :=
  ⟨fun _ => viewInduction_proof, fun _ => view_sind_proof⟩

def underStatement : Prop := ∀ (A : Type u) (R : A → A → Prop), id R = R
def overStatement : Prop := ∀ (A : Type u) (R : A → A → Prop) (x y : A), R x y = R x y
theorem under_proof : Rocq.Corelib.ssr.ssreflect_rw.UnderE.statement.{u} := fun _ _ => eqOf rfl
theorem over_proof : Rocq.Corelib.ssr.ssreflect_rw.over.statement.{u} := fun _ _ _ _ => eqOf rfl
theorem under_correspondence : Rocq.Corelib.ssr.ssreflect_rw.UnderE.statement.{u} ↔ underStatement.{u} :=
  ⟨fun _ _ _ => rfl, fun _ => under_proof⟩
theorem over_correspondence : Rocq.Corelib.ssr.ssreflect_rw.over.statement.{u} ↔ overStatement.{u} :=
  ⟨fun _ _ _ _ _ => rfl, fun _ => over_proof⟩

theorem locked_eq_id (T : Sort u) (x : T) : Rocq.Corelib.ssr.ssreflect_rw.locked T x = id x := by
  unfold Rocq.Corelib.ssr.ssreflect_rw.locked
  cases Rocq.Corelib.ssr.ssreflect_rw.master_key
  rfl
def lockStatement : Prop := ∀ (T : Sort u) (x : T), x = id x
def lockedWithStatement : Prop := ∀ (T : Sort u) (_k : Unit) (x : T), id x = x
def unlockStatement : Prop := ∀ (T : Sort u) (x : T) (_c : Unit), x = x
theorem lock_proof : Rocq.Corelib.ssr.ssreflect_rw.lock.statement.{u} :=
  fun T x => eqOf (locked_eq_id T x).symm
theorem lockedWith_proof : Rocq.Corelib.ssr.ssreflect_rw.locked_withE.statement.{u} :=
  fun T k x => eqOf (lockedWith_agrees k T x)
theorem unlock_proof : Rocq.Corelib.ssr.ssreflect_rw.unlock.statement.{u} :=
  fun T x c => eqOf (unlocked_agrees T x c)
theorem lock_correspondence : Rocq.Corelib.ssr.ssreflect_rw.lock.statement.{u} ↔ lockStatement.{u} :=
  ⟨fun _ _ _ => rfl, fun _ => lock_proof⟩
theorem lockedWith_correspondence : Rocq.Corelib.ssr.ssreflect_rw.locked_withE.statement.{u} ↔ lockedWithStatement.{u} :=
  ⟨fun _ _ _ _ => rfl, fun _ => lockedWith_proof⟩
theorem unlock_correspondence : Rocq.Corelib.ssr.ssreflect_rw.unlock.statement.{u} ↔ unlockStatement.{u} :=
  ⟨fun _ _ _ _ => rfl, fun _ => unlock_proof⟩

def naryStatement : Prop := ∀ n : Nat, naryCongruence.{u} n (fun B e => ∀ y : B, e y y)
theorem naryStatement_proof : naryStatement.{u} :=
  fun n => nary_of_reflexive n _ (fun _ _ he => he)
theorem nary_proof : Rocq.Corelib.ssr.ssreflect_rw.nary_congruence.statement.{u} :=
  fun n => (naryStatement_agrees n _).mpr (naryStatement_proof (natTo n))
theorem nary_correspondence : Rocq.Corelib.ssr.ssreflect_rw.nary_congruence.statement.{u} ↔ naryStatement.{u} :=
  ⟨fun _ => naryStatement_proof, fun _ => nary_proof⟩

def vmComputeStatement : Prop := ∀ (T : Sort u) (x y : T), x = y → x = y
theorem vm_compute_proof : Rocq.Corelib.ssr.ssreflect_rw.vm_compute.statement.{u} := fun _ _ _ h => h
theorem vm_compute_correspondence : Rocq.Corelib.ssr.ssreflect_rw.vm_compute.statement.{u} ↔ vmComputeStatement.{u} :=
  ⟨fun _ _ _ _ h => h, fun _ => vm_compute_proof⟩

theorem lockedWith_witness : Rocq.Corelib.ssr.ssreflect_rw.locked_with_unlockable__rocq2lean_obligation_1.statement.{u} :=
  fun T k x => eqOf (lockedWith_agrees k T x)
def lockedWithClosed (T : Sort u) (k : Rocq.Corelib.Init.Datatypes.unit) (x : T) :=
  @RocqPending.Corelib.ssr.ssreflect_rw.locked_with_unlockable lockedWith_witness T k x
theorem lockedWithUnlockable_agrees (T : Sort u) (k : Rocq.Corelib.Init.Datatypes.unit) (x : T) :
    (unlockableIso T x).to (@RocqPending.Corelib.ssr.ssreflect_rw.locked_with_unlockable lockedWith_witness T k x) = unitValue := rfl
def unlockWithClosed : Prop := @RocqPending.Corelib.ssr.ssreflect_rw.unlock_with.statement.{u} lockedWith_witness
theorem unlock_with_proof : @RocqPending.Corelib.ssr.ssreflect_rw.unlock_with.statement.{u} lockedWith_witness :=
  fun T _k x => eqOf (unlocked_agrees T x _)
theorem unlock_with_correspondence :
    @RocqPending.Corelib.ssr.ssreflect_rw.unlock_with.statement.{u} lockedWith_witness ↔ lockedWithStatement.{u} :=
  ⟨fun _ _ _ _ => rfl, fun _ => unlock_with_proof⟩

theorem converse_witness : Rocq.Corelib.ssr.ssreflect_rw.ssr_converse__rocq2lean_obligation_1.statement.{u} :=
  fun _ _ => Rocq.Corelib.Init.Logic.True.I
def converseTo {R : Sort u} : Rocq.Corelib.Init.Datatypes.prod Rocq.Corelib.Init.Logic.True R → PProd True R
  | .pair _ _ _ r => ⟨trivial,r⟩
def converseOf {R : Sort u} : PProd True R → Rocq.Corelib.Init.Datatypes.prod Rocq.Corelib.Init.Logic.True R
  | ⟨_,r⟩ => .pair _ _ .I r
def converseIso (R : Sort u) : Iso (Rocq.Corelib.Init.Datatypes.prod Rocq.Corelib.Init.Logic.True R) (PProd True R) :=
  ⟨converseTo,converseOf,
   fun p => by cases p with | pair h r => cases h; rfl,
   fun p => by cases p; rfl⟩
def nativeConverse (R : Sort u) (r : R) : PProd True R := ⟨trivial,r⟩
def converseClosed (R : Sort u) (r : R) :=
  @RocqPending.Corelib.ssr.ssreflect_rw.ssr_converse converse_witness R r
theorem converse_agrees (R : Sort u) (r : R) :
    converseTo (@RocqPending.Corelib.ssr.ssreflect_rw.ssr_converse converse_witness R r) = nativeConverse R r := rfl

end NativeBridge.Incremental.SSRRewriteStatements

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
  for name in ["NativeBridge.Incremental.SSRRewriteData.unitValue", "NativeBridge.Incremental.SSRRewriteStatements.lockStatement", "NativeBridge.Incremental.SSRRewriteStatements.lockedWithStatement", "NativeBridge.Incremental.SSRRewriteStatements.naryStatement", "NativeBridge.Incremental.SSRRewriteStatements.nativeConverse", "NativeBridge.Incremental.SSRRewriteStatements.overStatement", "NativeBridge.Incremental.SSRRewriteStatements.underStatement", "NativeBridge.Incremental.SSRRewriteStatements.unlockStatement", "NativeBridge.Incremental.SSRRewriteStatements.viewInduction", "NativeBridge.Incremental.SSRRewriteStatements.vmComputeStatement"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

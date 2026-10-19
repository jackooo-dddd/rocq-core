import Rocq2LeanOut
import Lean
set_option autoImplicit false
open Lean Meta
run_cmd Lean.Elab.Command.liftTermElabM do
  let sn := "Rocq.Corelib.Init.Datatypes.nat".toName
  let se := "Rocq.Corelib.Init.Logic.eq".toName
  let .inductInfo ni ← getConstInfo sn | throwError "source nat is not a generated inductive"
  let .inductInfo ei ← getConstInfo se | throwError "source eq is not a generated inductive"
  unless ni.ctors.map Name.toString == ["Rocq.Corelib.Init.Datatypes.nat.O", "Rocq.Corelib.Init.Datatypes.nat.S"] do
    throwError "unexpected source nat constructors"
  unless ei.ctors.map Name.toString == ["Rocq.Corelib.Init.Logic.eq.eq_refl"] do
    throwError "unexpected source eq constructor"
  if ← isDefEq (mkConst sn) (mkConst "Nat".toName) then
    throwError "source nat is definitionally native Nat"
  if ← isDefEq (← mkConstWithFreshMVarLevels se) (← mkConstWithFreshMVarLevels "Eq".toName) then
    throwError "source eq is definitionally native Eq"
  for name in [sn,se] do
    let .recInfo ri ← getConstInfo (name ++ "rec".toName) | throwError "missing generated recursor"
    unless ri.all.contains name do throwError "recursor belongs to another inductive"
  logInfo "PASS: source nat/eq are fresh inductives with their own constructors and recursors"
#print Rocq.Corelib.Init.Logic.eq
#check Rocq.Corelib.Init.Logic.eq.rec
#print Rocq.Corelib.Init.Datatypes.nat
#check Rocq.Corelib.Init.Datatypes.nat.rec
noncomputable section
universe u v
def mechanicalTransport {A : Sort u} (P : A → Sort v) {a b : A}
  (h : Rocq.Corelib.Init.Logic.eq A a b) (x : P a) : P b :=
  Rocq.Corelib.Init.Logic.eq.rec (motive := fun y _ => P y) x h
theorem mechanicalTransport_refl {A : Sort u} (P : A → Sort v) (a : A) (x : P a) :
  mechanicalTransport P (Rocq.Corelib.Init.Logic.eq.eq_refl A a) x = x := rfl
#print axioms mechanicalTransport_refl

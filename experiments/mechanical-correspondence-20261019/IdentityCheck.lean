
import NatEq
import Lean
open Lean Meta
run_cmd Lean.Elab.Command.liftTermElabM do
 let sn := "Rocq.Corelib.Init.Datatypes.nat".toName
 let se := "Rocq.Corelib.Init.Logic.eq".toName
 let .inductInfo _ ← getConstInfo sn | throwError "source nat is not an inductive"
 let .inductInfo _ ← getConstInfo se | throwError "source eq is not an inductive"
 if ← isDefEq (mkConst sn) (mkConst "Nat".toName) then throwError "native nat bootstrap"
 if ← isDefEq (← mkConstWithFreshMVarLevels se) (← mkConstWithFreshMVarLevels "Eq".toName) then throwError "native eq bootstrap"
 for n in ["natIso","natOf_to","natTo_of","eqIso","eq_correspondence","eq_transport_agrees","nat_eq_correspondence"] do
  let axs ← collectAxioms ("NativeBridge."++n).toName
  unless axs.isEmpty do throwError "unexpected axiom closure for {n}: {axs}"
 logInfo "PASS: distinct mechanical inductives; both correspondences have empty axiom closure"
#check @NativeBridge.eq_correspondence
#check @NativeBridge.eq_transport_agrees
#check @NativeBridge.natIso

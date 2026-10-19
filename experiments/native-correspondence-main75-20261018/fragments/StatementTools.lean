end NativeBridge
open Lean Meta Elab Command
syntax (name := nativeStatement) "#native_statement " ident : command
@[command_elab nativeStatement] def elabNativeStatement : CommandElab := fun stx => do
  let sourceName := stx[1].getId
  liftTermElabM do
    let ci ← getConstInfo sourceName
    let .defnInfo di := ci | throwError "Expected an actual translated statement definition"
    unless di.type == .sort .zero do throwError "Conditional/type-valued statement needs an explicit bridge"
    let mut rules : SimpTheorems := {}
    for rule in ["true_agrees","false_agrees","and_agrees","or_agrees","not_agrees","notT_agrees","iff_agrees","ex_agrees","ex2_agrees","inhabited_agrees","all_agrees",
      "nat_add_agrees","nat_sub_agrees","nat_mul_agrees","nat_pow_agrees","nat_min_agrees","nat_max_agrees",
      "peano_le_agrees","peano_lt_agrees","peano_ge_agrees","peano_gt_agrees"] do
      let rn := ("NativeBridge." ++ rule).toName
      if (← getEnv).contains rn then rules ← rules.addConst rn
    let ctx ← Simp.mkContext (config := { maxSteps := 20000 }) (simpTheorems := #[rules])
    let (r, _) ← Meta.simp di.value ctx
    let nativeName := ("NativeBridge.Statements." ++ sourceName.toString ++ ".native").toName
    let certName := ("NativeBridge.Statements." ++ sourceName.toString ++ ".correspondence").toName
    addDecl (.defnDecl {name:=nativeName,levelParams:=di.levelParams,type:=.sort .zero,value:=r.expr,hints:=.abbrev,safety:=.safe})
    let ls := di.levelParams.map Level.param
    let ty := mkApp2 (mkConst "Iff".toName) (mkConst sourceName ls) (mkConst nativeName ls)
    let proof ← mkAppM "Iff.of_eq".toName #[← r.getProof' di.value]
    addDecl (.thmDecl {name:=certName,levelParams:=di.levelParams,type:=ty,value:=proof})
namespace NativeBridge

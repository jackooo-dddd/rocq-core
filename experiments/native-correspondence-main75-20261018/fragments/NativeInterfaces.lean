
end NativeBridge
open Lean Meta Elab Command
private def hasSource (e : Expr) : Bool :=
 e.getUsedConstants.any fun n =>
  n.toString.startsWith "Rocq." || n.toString.startsWith "RocqPending." ||
  n.toString.startsWith "Rocq2Lean."
private partial def findNativeIso (ty : Expr) : MetaM Expr := do
 let fn := ty.getAppFn
 let args := ty.getAppArgs
 let name := fn.constName?.getD .anonymous
 let simple : List (String × String) := [
  ("Rocq.Corelib.Init.Datatypes.bool","boolIso"),
  ("Rocq.Corelib.Init.Datatypes.comparison","comparisonIso"),
  ("Rocq.Corelib.Init.Datatypes.unit","unitIso"),
  ("Rocq.Corelib.Init.Datatypes.Empty_set","emptyIso"),
  ("Rocq.Corelib.Numbers.BinNums.positive","positiveIso"),
  ("Rocq.Corelib.Numbers.BinNums.N","binaryNatIso"),
  ("Rocq.Corelib.Numbers.BinNums.Z","binaryIntIso"),
  ("Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int","int63Iso"),
  ("Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int_wrapper","int63WrapperIso"),
  ("Rocq.Corelib.Init.Byte.byte","byteIso"),
  ("Rocq.Corelib.Floats.FloatClass.float_class","floatClassIso"),
  ("Rocq.Corelib.Init.Decimal.uint","decimalDigitsIso"),
  ("Rocq.Corelib.Init.Hexadecimal.uint","hexadecimalDigitsIso"),
  ("Rocq.Corelib.Strings.PrimString.string","byteStringIso")]
 for (source,bridge) in simple do
  let bn := ("NativeBridge."++bridge).toName
  if name.toString == source && args.isEmpty && (← getEnv).contains bn then
   return ← mkConstWithFreshMVarLevels bn
 if let .forallE _ domain body _ := ty then
  if !body.hasLooseBVars then
   let a ← findNativeIso domain
   let b ← findNativeIso body
   return ← mkAppM "NativeBridge.Iso.functions".toName #[a,b]
 for (source,bridge,lift) in [
   ("Rocq.Corelib.Init.Datatypes.list","listIso","lists"),
   ("Rocq.Corelib.Init.Datatypes.option","optionIso","options")] do
  if name.toString == source && args.size == 1 then
   let e ← findNativeIso args[0]!
   let first ← mkAppM ("NativeBridge."++bridge).toName #[args[0]!]
   let second ← mkAppM ("NativeBridge.Iso."++lift).toName #[e]
   return ← mkAppM "NativeBridge.Iso.trans".toName #[first,second]
 for (source,bridge,lift) in [
   ("Rocq.Corelib.Init.Datatypes.prod","prodIso","products"),
   ("Rocq.Corelib.Init.Datatypes.sum","sumIso","sums")] do
  if name.toString == source && args.size == 2 then
   let a ← findNativeIso args[0]!
   let b ← findNativeIso args[1]!
   let first ← mkAppM ("NativeBridge."++bridge).toName args
   let second ← mkAppM ("NativeBridge.Iso."++lift).toName #[a,b]
   return ← mkAppM "NativeBridge.Iso.trans".toName #[first,second]

 for (source,bridge) in [
   ("Rocq.Corelib.Init.Specif.sig","sigIso"),
   ("Rocq.Corelib.Init.Specif.sig2","sig2Iso"),
   ("Rocq.Corelib.Init.Specif.sigT","sigmaIso"),
   ("Rocq.Corelib.Init.Specif.sigT2","sigma2Iso"),
   ("Rocq.Corelib.Init.Specif.sumbool","sumboolIso"),
   ("Rocq.Corelib.Init.Specif.sumor","sumorIso"),
   ("Rocq.Corelib.Init.Datatypes.result","resultIso"),
   ("Rocq.Corelib.Array.PrimArray.array","arrayIso")] do
  let bn := ("NativeBridge."++bridge).toName
  if name.toString == source && !args.any hasSource && (← getEnv).contains bn then
   return ← mkAppM bn args
 -- Preserve arbitrary parameters only when their type contains no source API.
 if !hasSource ty then
  let u ← getLevel ty
  return mkApp (mkConst "NativeBridge.identityIso".toName [u]) ty
 let reduced ← whnf ty
 if reduced != ty then return ← findNativeIso reduced
 throwError "No registered type bijection for {ty}"
private partial def exportInterface (value ty : Expr) : MetaM (Expr × Expr × Expr) := do
 if let .forallE n domain body bi := ty then
  let domain ← whnf domain
  if body.hasLooseBVars && !hasSource domain then
   return ← withLocalDecl n bi domain fun x => do
    let (out,statement,proof) ← exportInterface (mkApp value x) (body.instantiate1 x)
    return (← mkLambdaFVars #[x] out, ← mkForallFVars #[x] statement, ← mkLambdaFVars #[x] proof)
 let e ← findNativeIso ty
 let out ← mkAppM "NativeBridge.Iso.to".toName #[e,value]
 let back ← mkAppM "NativeBridge.Iso.of".toName #[e,out]
 let statement ← mkEq back value
 let proof ← mkAppM "NativeBridge.Iso.of_to".toName #[e,value]
 return (out,statement,proof)
syntax (name := exportNative) "#export_native " ident : command
@[command_elab exportNative] def elabExportNative : CommandElab := fun stx => do
 let source := stx[1].getId
 try
  liftTermElabM do
   let ci ← getConstInfo source
   let .defnInfo di := ci | throwError "not a computational definition"
   -- Native containers require Type, while Rocq template instances can use Sort.
   -- Retain the exact universes first; only the fallback raises naked Sort parameters.
   let tryExport (raiseSort : Bool) := do
    let raise := di.levelParams.filter fun p => (di.type.find? fun e => e == .sort (.param p)).isSome
    let ls := di.levelParams.map fun p => if raiseSort && raise.contains p then Level.succ (.param p) else .param p
    exportInterface (mkConst source ls) (di.type.instantiateLevelParams di.levelParams ls)
   let ((out,statement,proof),specialized) ← try do pure (← tryExport false, false) catch _ => do pure (← tryExport true, true)
   let out ← instantiateMVars out
   let outTy ← instantiateMVars (← inferType out)
   let statement ← instantiateMVars statement
   let proof ← instantiateMVars proof
   if out.hasMVar || outTy.hasMVar || proof.hasMVar then throwError "unsolved metavariables"
   let name := ("NativeBridge.Interfaces."++source.toString).toName
   addDecl (.defnDecl { name:=name++"native".toName,levelParams:=di.levelParams,type:=outTy,value:=out,hints:=.abbrev,safety:=.safe })
   addDecl (.thmDecl { name:=name++"roundtrip".toName,levelParams:=di.levelParams,type:=statement,value:=proof })
   logInfo m!"INTERFACE_OK {source} type_universe_specialization={specialized}"
 catch ex =>
  logInfo m!"INTERFACE_SKIP {source}: {← ex.toMessageData.toString}"
namespace NativeBridge

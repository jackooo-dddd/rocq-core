import Unified
namespace NativeBridge

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

#export_native Rocq.Corelib.Array.PrimArray.array
#export_native Rocq.Corelib.Array.PrimArray.copy
#export_native Rocq.Corelib.Array.PrimArray.default
#export_native Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int
#export_native Rocq.Corelib.Array.PrimArray.get
#export_native Rocq.Corelib.Array.PrimArray.length
#export_native Rocq.Corelib.Array.PrimArray.make
#export_native Rocq.Corelib.Array.PrimArray.set
#export_native Rocq.Corelib.BinNums.PosDef.Pos.succ
#export_native Rocq.Corelib.BinNums.PosDef.Pos.add
#export_native Rocq.Corelib.BinNums.PosDef.Pos.mul
#export_native Rocq.Corelib.BinNums.IntDef.Z.mul
#export_native Rocq.Corelib.BinNums.IntDef.Z.of_N
#export_native Rocq.Corelib.BinNums.PosDef.Pos.of_succ_nat
#export_native Rocq.Corelib.BinNums.IntDef.Z.of_nat
#export_native Rocq.Corelib.BinNums.IntDef.Z.opp
#export_native Rocq.Corelib.BinNums.PosDef.Pos.iter_op
#export_native Rocq.Corelib.Init.Nat.add
#export_native Rocq.Corelib.BinNums.PosDef.Pos.to_nat
#export_native Rocq.Corelib.BinNums.IntDef.Z.to_nat
#export_native Rocq.Corelib.BinNums.PosDef.Pos.add_carry
#export_native Rocq.Corelib.BinNums.PosDef.Pos.pred_double
#export_native Rocq.Corelib.Init.Datatypes.CompOpp
#export_native Rocq.Corelib.Init.Datatypes.andb
#export_native Rocq.Corelib.Init.Datatypes.app
#export_native Rocq.Corelib.Init.Datatypes.fst
#export_native Rocq.Corelib.Init.Datatypes.implb
#export_native Rocq.Corelib.Init.Datatypes.is_true
#export_native Rocq.Corelib.Init.Datatypes.length
#export_native Rocq.Corelib.Init.Datatypes.negb
#export_native Rocq.Corelib.Init.Datatypes.option_map
#export_native Rocq.Corelib.Init.Datatypes.orb
#export_native Rocq.Corelib.Init.Datatypes.snd
#export_native Rocq.Corelib.Init.Datatypes.xorb
#export_native Rocq.Corelib.Init.Logic.all
#export_native Rocq.Corelib.Init.Logic.iff
#export_native Rocq.Corelib.Init.Logic.not
#export_native Rocq.Corelib.Init.Logic.notT
#export_native Rocq.Corelib.Init.Nat.even
#export_native Rocq.Corelib.Init.Nat.odd
#export_native Rocq.Corelib.Init.Nat.mul
#export_native Rocq.Corelib.Init.Nat.div2
#export_native Rocq.Corelib.Init.Nat.bitwise
#export_native Rocq.Corelib.Init.Nat.compare
#export_native Rocq.Corelib.Init.Nat.divmod
#export_native Rocq.Corelib.Init.Nat.div
#export_native Rocq.Corelib.Init.Nat.double
#export_native Rocq.Corelib.Init.Nat.eqb
#export_native Rocq.Corelib.Init.Nat.land
#export_native Rocq.Corelib.Init.Nat.ldiff
#export_native Rocq.Corelib.Init.Nat.leb
#export_native Rocq.Corelib.Init.Nat.max
#export_native Rocq.Corelib.Init.Nat.lor
#export_native Rocq.Corelib.Init.Nat.ltb
#export_native Rocq.Corelib.Init.Nat.lxor
#export_native Rocq.Corelib.Init.Nat.min
#export_native Rocq.Corelib.Init.Nat.sub
#export_native Rocq.Corelib.Init.Nat.modulo
#export_native Rocq.Corelib.Init.Nat.tail_add
#export_native Rocq.Corelib.Init.Nat.tail_addmul
#export_native Rocq.Corelib.Init.Nat.tail_mul
#export_native Rocq.Corelib.Init.Nat.of_uint_acc
#export_native Rocq.Corelib.Init.Nat.of_uint
#export_native Rocq.Corelib.Init.Nat.one
#export_native Rocq.Corelib.Init.Nat.pow
#export_native Rocq.Corelib.Init.Nat.pred
#export_native Rocq.Corelib.Init.Datatypes.nat_rect
#export_native Rocq.Corelib.Init.Nat.shiftl
#export_native Rocq.Corelib.Init.Nat.shiftr
#export_native Rocq.Corelib.Init.Nat.square
#export_native Rocq.Corelib.Init.Nat.succ
#export_native Rocq.Corelib.Init.Nat.t
#export_native Rocq.Corelib.Init.Nat.testbit
#export_native Rocq.Corelib.Init.Nat.two
#export_native Rocq.Corelib.Init.Nat.zero
#export_native Rocq.Corelib.Init.Peano.ge
#export_native Rocq.Corelib.Init.Peano.lt
#export_native Rocq.Corelib.Init.Peano.gt
#export_native Rocq.Corelib.Init.Specif.proj1_sig
#export_native Rocq.Corelib.Init.Specif.projT1
#export_native Rocq.Corelib.Init.Specif.projT2
#export_native Rocq.Corelib.Lists.ListDef.firstn
#export_native Rocq.Corelib.Lists.ListDef.map
#export_native Rocq.Corelib.Lists.ListDef.nth
#export_native Rocq.Corelib.Lists.ListDef.repeat
#export_native Rocq.Corelib.Lists.ListDef.seq
#export_native Rocq.Corelib.Lists.ListDef.skipn
#export_native Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.add
#export_native Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.compare
#export_native Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.compares
#export_native Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.div
#export_native Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.eqb
#export_native Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.id_int
#export_native Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int_wrap
#export_native Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.land
#export_native Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.leb
#export_native Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lesb
#export_native Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lor
#export_native Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsl
#export_native Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr
#export_native Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb
#export_native Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltsb
#export_native Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lxor
#export_native Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mod
#export_native Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mul
#export_native Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.sub
#export_native Rocq.Corelib.Strings.PrimString.string
#export_native Rocq.Corelib.Strings.PrimString.char63
#export_native Rocq.Corelib.Strings.PrimString.get
#export_native Rocq.Corelib.Strings.PrimString.length
end NativeBridge
run_cmd Lean.Elab.Command.liftTermElabM do
  let env ← Lean.getEnv
  let mut rows : Array Lean.Json := #[]
  for (n, ci) in env.constants.toList do
    if n.toString.startsWith "NativeBridge." then
      if ci.isDefinition || ci.isTheorem then
        let axs ← Lean.collectAxioms n
        for ax in axs do
          unless ["propext", "Quot.sound", "Classical.choice"].contains ax.toString do
            throwError "Unapproved axiom in {n}: {ax}"
        let ty ← Lean.Meta.ppExpr ci.type
        let mut bodyRefs : Array Lean.Json := #[]
        let mut bodyText := ""
        if n.toString.endsWith ".native" then
          if let some body := ci.value? then
            bodyText := (← Lean.Meta.ppExpr body).pretty
            for r in body.getUsedConstants do
              if r.toString.startsWith "Rocq." || r.toString.startsWith "RocqPending." || r.toString.startsWith "Rocq2Lean." then
                bodyRefs := bodyRefs.push (.str r.toString)
        let mut refs : Array Lean.Json := #[]
        for r in ci.type.getUsedConstants do
          if r.toString.startsWith "Rocq." || r.toString.startsWith "RocqPending." || r.toString.startsWith "Rocq2Lean." then
            refs := refs.push (.str r.toString)
        rows := rows.push (Lean.Json.mkObj [
          ("name", .str n.toString),
          ("kind", .str (if ci.isTheorem then "theorem" else "definition")),
          ("type", .str ty.pretty),
          ("source_references", .arr refs),
          ("native_body", .str bodyText),
          ("remaining_source_symbols", .arr bodyRefs),
          ("axioms", .arr (axs.map (fun a => .str a.toString)))])
  IO.FS.writeFile "/home/shunqwang4/research/rocq-core/experiments/native-correspondence-main75-20261018/audits/UnifiedInterfaces.json" (Lean.Json.pretty (.arr rows))

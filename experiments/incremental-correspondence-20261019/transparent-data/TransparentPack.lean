import Rocq2Lean
import Std
open Lean Meta

namespace TransparentPack

def renamed (base : Environment) (packPrefix n : Name) : Name :=
  if base.contains n then n else packPrefix ++ n

partial def renameExpr (base : Environment) (packPrefix : Name) : Expr → Expr
  | .const n ls => .const (renamed base packPrefix n) ls
  | .app f a => .app (renameExpr base packPrefix f) (renameExpr base packPrefix a)
  | .lam n t b bi => .lam n (renameExpr base packPrefix t) (renameExpr base packPrefix b) bi
  | .forallE n t b bi => .forallE n (renameExpr base packPrefix t) (renameExpr base packPrefix b) bi
  | .letE n t v b nd => .letE n (renameExpr base packPrefix t) (renameExpr base packPrefix v) (renameExpr base packPrefix b) nd
  | .mdata _ e => renameExpr base packPrefix e
  | .proj n i e => .proj (renamed base packPrefix n) i (renameExpr base packPrefix e)
  | e => e

partial def copyConstant (source base : Environment) (packPrefix : Name)
    (seen : IO.Ref NameSet) (done : IO.Ref (Array Name)) (n : Name) : MetaM Unit := do
  if base.contains n then
    let some sc := source.find? n | throwError "Source lacks base constant {n}"
    let some bc := base.find? n | throwError "Missing base constant {n}"
    unless sc.type == bc.type && sc.levelParams == bc.levelParams && sc.value? true == bc.value? true do
      throwError "Base declaration mismatch: {n}"
    return
  if (← seen.get).contains n then return
  let some ci := source.find? n | throwError "Missing dependency: {n}"
  if ci.isUnsafe then throwError "Unsafe declaration cannot be packed: {n}"
  let rn := renamed base packPrefix
  let re := renameExpr base packPrefix
  match ci with
  | .ctorInfo c =>
    copyConstant source base packPrefix seen done c.induct
    unless (← getEnv).contains (rn n) do throwError "Constructor was not regenerated: {n}"
  | .recInfo r =>
    copyConstant source base packPrefix seen done r.getMajorInduct
    unless (← getEnv).contains (rn n) do throwError "Recursor was not regenerated: {n}"
  | .inductInfo iv =>
    if iv.numNested != 0 then throwError "Nested inductive needs separate support: {n}"
    let mut members : List Name := []
    let mut types : List InductiveType := []
    for name in iv.all do
      let some (.inductInfo it) := source.find? name | throwError "Bad inductive group"
      members := members ++ [name, name ++ `rec] ++ it.ctors
      let mut ctors : List Constructor := []
      for c in it.ctors do
        let some cci := source.find? c | throwError "Missing constructor"
        ctors := ctors ++ [{name := rn c, type := re cci.type}]
      types := types ++ [{name := rn name, type := re it.type, ctors}]
    for member in members do seen.modify (·.insert member)
    for name in iv.all do
      let some (.inductInfo it) := source.find? name | throwError "Bad inductive group"
      for d in it.type.getUsedConstants do copyConstant source base packPrefix seen done d
      for c in it.ctors do
        let some cci := source.find? c | throwError "Missing constructor"
        for d in cci.type.getUsedConstants do copyConstant source base packPrefix seen done d
    addDecl (.inductDecl iv.levelParams iv.numParams types false)
    done.modify (· ++ members.toArray)

  | .defnInfo v =>
    seen.modify (·.insert n)
    for d in v.type.getUsedConstants ++ v.value.getUsedConstants do
      copyConstant source base packPrefix seen done d
    addDecl (.defnDecl {v with name := rn n, type := re v.type, value := re v.value, all := v.all.map rn})
    setReducibilityStatus (rn n) (getReducibilityStatusCore source n)
    if let some info := source.getProjectionFnInfo? n then
      modifyEnv fun env => addProjectionFnInfo env (rn n) (rn info.ctorName) info.numParams info.i info.fromClass
    done.modify (·.push n)
  | .thmInfo v =>
    seen.modify (·.insert n)
    for d in v.type.getUsedConstants ++ v.value.getUsedConstants do
      copyConstant source base packPrefix seen done d
    addDecl (.thmDecl {v with name := rn n, type := re v.type, value := re v.value, all := v.all.map rn})
    done.modify (·.push n)
  | .opaqueInfo v =>
    -- A separate computational variant: expose only source non-Prop values.
    -- This is not an equality proof about the old opaque constant.
    seen.modify (·.insert n)
    for d in v.type.getUsedConstants ++ v.value.getUsedConstants do
      copyConstant source base packPrefix seen done d
    if (n.toString.startsWith "Rocq." || n.toString.startsWith "RocqPending.") && !(← isProp (re v.type)) then
      addDecl (.defnDecl {name := rn n, levelParams := v.levelParams, type := re v.type, value := re v.value, hints := .regular (getMaxHeight (← getEnv) (re v.value) + 1), safety := .safe, all := v.all.map rn})
    else
      addDecl (.opaqueDecl {v with name := rn n, type := re v.type, value := re v.value, all := v.all.map rn})
    done.modify (·.push n)
  | .axiomInfo _ => throwError "A new axiom cannot be packed: {n}"
  | .quotInfo _ => throwError "Quotient primitives must come from base imports"

def pack (sourceModule packPrefix : Name) (roots : Array Name) (reportPath : String) : MetaM Unit := do
  let base ← getEnv
  let source ← importModules #[{module := sourceModule}] {} (leakEnv := true)
  let seen ← IO.mkRef ({} : NameSet)
  let done ← IO.mkRef (#[] : Array Name)
  for n in roots do
    copyConstant source base packPrefix seen done n
  -- Projection declarations can depend on the structure being copied. Register
  -- metadata only after the requested dependency closure has been installed.
  let mut cursor := 0
  while cursor < (← done.get).size do
    let name := (← done.get)[cursor]!
    cursor := cursor + 1
    if let some info := getStructureInfo? source name then
      unless info.parentInfo.isEmpty do throwError "Structure inheritance needs separate support: {name}"
      let mut fields : Array StructureFieldInfo := #[]
      for fieldName in info.fieldNames do
        let some field := info.fieldInfo.find? (·.fieldName == fieldName) | throwError "Missing field"
        copyConstant source base packPrefix seen done field.projFn
        fields := fields.push {field with projFn := renamed base packPrefix field.projFn, subobject? := field.subobject?.map (renamed base packPrefix), autoParam? := field.autoParam?.map (renameExpr base packPrefix)}
      modifyEnv fun env => registerStructure env {structName := renamed base packPrefix name, fields}
  let mut reports : Array Json := #[]
  for n in roots do
    let target := renamed base packPrefix n
    let axioms ← collectAxioms target
    for ax in axioms do
      unless [`propext,`Quot.sound,`Classical.choice].contains ax do
        throwError "Unapproved axiom in packed root {target}: {ax}"
    reports := reports.push (Json.mkObj [
      ("source",.str n.toString),("target",.str target.toString),
      ("axioms",.arr (axioms.map (fun n => .str n.toString)))])
  let mut exposed : Array Json := #[]
  for n in (← done.get) do
    let some (.opaqueInfo old) := source.find? n | continue
    let some (.defnInfo new) := (← getEnv).find? (renamed base packPrefix n) | continue
    unless renameExpr base packPrefix old.type == new.type &&
        renameExpr base packPrefix old.value == new.value &&
        old.levelParams == new.levelParams do
      throwError "Computational variant changed more than the name/kind: {n}"
    if ← isProp new.type then throwError "Unexpected Prop exposure: {n}"
    exposed := exposed.push (Json.mkObj [
      ("source",.str n.toString),("target",.str new.name.toString),
      ("renamed_type_and_body_identical",.bool true),("non_prop",.bool true)])
  IO.FS.writeFile reportPath (Json.pretty (Json.mkObj [
    ("source_module",.str sourceModule.toString),("packPrefix",.str packPrefix.toString),
    ("exposed_non_prop_opaque",.arr exposed),("copied_constants",toJson (← done.get).size),("roots",.arr reports)]))

end TransparentPack

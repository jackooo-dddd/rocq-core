import Rocq2Lean.Translate

/-!
Derived representation plans for source-checked template quality families.
These plans are NOT standalone source declarations and must never be counted as
additional roots. Family dispatch and independent audit must accompany their use.
-/
namespace Rocq2Lean
open Lean
open IR

structure QualityFamilyPlan where
  source : String
  parameters : Array Nat
  levels : Array String
  propBranch : IR.InductiveDecl
  typeBranch : IR.InductiveDecl

private def qualitySet (j : Json) (key : String) (value : Json) : Json :=
  match j with
  | .obj xs => Json.mkObj ((xs.toArray.toList.filter (·.1 != key)) ++ [(key,value)])
  | _ => Json.mkObj [(key,value)]

/-- Replace only source template sorts of the shared quality variable.
The current plan fragment excludes term-level computations in a constructor type.
Unrelated sorts remain unchanged; a mixed/nonzero-offset quality sort is refused. -/
private partial def qualityPropTerm (levels : Array String) (t : IR.Term) : Except String IR.Term := do
  let go := qualityPropTerm levels
  match t with
  | .sort (.type u) =>
    if u.any (fun e => match e.level with | .global n => levels.contains n | _ => false) then
      unless u.all (fun e => e.offset == 0 && match e.level with
          | .global n => levels.contains n | .set => true | _ => false) do
        throw "shared-quality sort has a non-template level or an offset"
      return .sort .prop
    return t
  | .prod n a b => return .prod n (← go a) (← go b)
  | .lam n a b => return .lam n (← go a) (← go b)
  | .app f args => return .app (← go f) (← args.mapM go)
  | .cast a k ty => return .cast (← go a) k (← go ty)
  | .letIn n v ty b => return .letIn n (← go v) (← go ty) (← go b)
  | .const _ u | .ind _ u | .construct _ _ u =>
    if u.any (fun l => match l with | .global n => levels.contains n | _ => false) then
      throw "quality specialization crosses a reference universe instance"
    return t
  | .rel _ | .sort _ => return t
  | _ => throw "quality family constructor contains a computation outside the plan fragment"

private def qualityPropCtx (levels : Array String) (c : IR.CtxDecl) : Except String IR.CtxDecl := do
  return { c with type := (← qualityPropTerm levels c.type), body := (← c.body.mapM (qualityPropTerm levels)) }

/-- A single shared q0 whose default is Type and whose source conclusion uses q0.
Generate BOTH branches; a Type branch alone is not a complete quality family. -/
def qualityFamilyPlan (i : IR.InductiveDecl) : Except String QualityFamilyPlan := do
  unless (i.native.getObjValAs? Bool "template").toOption == some true do
    throw "quality family requires a template block"
  unless i.bodies.size == 1 && i.finite == "Finite" && nonRecursiveBlock i do
    throw "quality family requires one non-recursive inductive body"
  unless i.npars == i.params.size && i.params.all (·.body.isNone) do
    throw "quality family requires uniform assumption parameters"
  let b := i.bodies[0]!
  unless b.indices.isEmpty && b.projs.isEmpty do
    throw "quality family indices/projections need explicit dispatch support"
  let ti := i.native.getObjValD "template_info"
  let qs ← ti.getObjValAs? (Array Json) "default_qualities"
  unless qs == #[Json.mkObj [("k","type")]] do throw "quality family must have one Type-default quality"
  let q0 := Json.mkObj [("k","var"),("i",toJson (0 : Nat))]
  unless ti.getObjValD "conclusion_quality" == q0 do throw "quality family conclusion does not share q0"
  let pargs ← ti.getObjValAs? (Array Json) "param_arguments"
  let pquals ← ti.getObjValAs? (Array Json) "parameter_qualities"
  let defaults ← ti.getObjValAs? (Array String) "defaults"
  unless pargs.size == i.params.size && pquals.size == pargs.size do throw "quality binding arity mismatch"
  let mut positions := #[]
  let mut levels := #[]
  let rec aritySort : IR.Term → IR.Term
    | .prod _ _ t => aritySort t
    | t => t
  for pa in pargs, q in pquals, k in [:pargs.size] do
    if pa.isNull then
      unless q.isNull do throw "quality binding without a template parameter"
      continue
    unless q == q0 && (pa.getObjValAs? String "k").toOption == some "quality_sort" do
      throw "template parameters do not share the conclusion quality"
    let us ← pa.getObjValAs? (Array Json) "u"
    unless us.size == 1 && (us[0]!.getObjValAs? Nat "n").toOption == some 0 do
      throw "quality parameter level must be a single variable"
    let idx ← us[0]!.getObjValAs? Nat "bound"
    let name ← us[0]!.getObjValAs? String "l"
    unless defaults[idx]? == some name do throw "quality parameter level binding differs from defaults"
    match aritySort i.params[i.params.size - 1 - k]!.type with
    | .sort (.type #[{level := .global n, offset := 0}]) =>
      unless n == name do throw "quoted parameter differs from native template sort"
    | _ => throw "quoted quality parameter must be a type family"
    positions := positions.push k
    levels := levels.push name
  unless !levels.isEmpty && levels.size == defaults.size && levels.toList.eraseDups.length == defaults.size &&
      defaults.all levels.contains do throw "quality binding does not cover every template level exactly once"
  let pparams ← i.params.mapM (qualityPropCtx levels)
  let ptype ← qualityPropTerm levels b.type
  let psort ← qualityPropTerm levels (.sort b.sort)
  unless match psort with | .sort .prop => true | _ => false do
    throw "quoted conclusion is not the shared template quality"
  let ctors ← b.ctors.mapM fun c => do
    return { c with args := (← c.args.mapM (qualityPropCtx levels)), indices := (← c.indices.mapM (qualityPropTerm levels)), type := (← qualityPropTerm levels c.type) }
  let propBody := { b with name := "qualityProp", type := ptype, sort := .prop, ctors, rel := .irrelevant }
  let propBranch := { i with name := i.name ++ ".qualityProp", params := pparams, bodies := #[propBody], native := qualitySet i.native "template" (toJson false), typeDeps := i.typeDeps.filter (· != i.name) }
  -- The Type branch keeps a non-Prop floor and permits Sort-valued parameters.
  -- Existing fixed-Type generation implements exactly this derived signature.
  let typeTi := qualitySet (qualitySet ti "concl"
    (qualitySet (ti.getObjValD "concl") "k" "type")) "param_arguments"
    (Json.arr (pargs.map fun p => if p.isNull then p else qualitySet p "k" "type"))
  let typeBranch := { i with name := i.name ++ ".qualityType", bodies := #[{ b with name := "qualityType" }], native := qualitySet i.native "template_info" typeTi, typeDeps := i.typeDeps.filter (· != i.name) }
  return { source := i.name, parameters := positions, levels, propBranch, typeBranch }

end Rocq2Lean

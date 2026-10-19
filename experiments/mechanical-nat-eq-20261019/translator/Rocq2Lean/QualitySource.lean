import Rocq2Lean.Quality

/-!
Source-context quality analysis for template-family dispatch.
This is a bounded partial analysis of SOURCE-checked IR, not a replacement source
type checker or a universe solver. Declared binder/constant types are retained:
delta-reducing a value before inferring its type can change the relevant quality.
Failure means unknown, never a default to the Type branch.
-/
namespace Rocq2Lean
open Lean
open IR

inductive SourceQuality where
  | prop | sprop | type
  deriving BEq, Repr, Inhabited

def SourceQuality.label : SourceQuality → String
  | .prop => "Prop" | .sprop => "SProp" | .type => "Type"

structure SourceQualityEnv where
  declarations : Std.HashMap String IR.Decl := {}
  families : Std.HashMap String QualityFamilyPlan := {}

def sourceQualityEnv (decls : Array IR.Decl) : SourceQualityEnv :=
  decls.foldl (init := {}) fun e d =>
    let e := { e with declarations := e.declarations.insert d.name d }
    match d with
    | .inductive i => match qualityFamilyPlan i with
      | .ok p => { e with families := e.families.insert i.name p }
      | .error _ => e
    | _ => e

/-- Outermost first. Each type/body is scoped before its own binder. -/
abbrev SourceQualityContext := Array IR.CtxDecl

private def qualityOfSort : IR.SortIR → SourceQuality
  | .prop => .prop | .sprop => .sprop | .type _ => .type

private def instantiateQualityDecl (u : IR.UDecl) (us : Array IR.Level)
    (t : IR.Term) : Option IR.Term := do
  match u with
  | .monomorphic => unless us.isEmpty do none
  | .polymorphic ns _ => unless ns.size == us.size do none
  instantiateSourceUniverses us t

/-- Simultaneous substitution of a full innermost telescope. Arguments are
outermost-first; inserted terms are lifted under every remaining binder. -/
def instantiateQualityContext (t : IR.Term) (args : Array IR.Term) : IR.Term :=
  t.mapRels fun i depth =>
    if i-depth < args.size then args[args.size-1-(i-depth)]!.liftRels depth
    else .rel (i-args.size)

/-- Only transparent source definitions and local definitions are unfolded.
No kernel-opaque proof body or target expression is inspected. -/
partial def sourceQualityWhnf (e : SourceQualityEnv) (ctx : SourceQualityContext)
    (t : IR.Term) (fuel : Nat := 256) : Option IR.Term := do
  if fuel == 0 then none
  let next := fuel-1
  match t with
  | .rel i =>
    let d ← ctx[ctx.size-1-i]?
    unless i < ctx.size do none
    match d.body with
    | some v => sourceQualityWhnf e ctx (v.liftRels (i+1)) next
    | none => return t
  | .const n us =>
    let some (.constant c) := e.declarations[n]? | return t
    if c.bodyState != "transparent" then return t
    let some b := c.body | return t
    sourceQualityWhnf e ctx (← instantiateQualityDecl c.universes us b) next
  | .letIn _ v _ b => sourceQualityWhnf e ctx (b.subst0 v) next
  | .cast v _ _ => sourceQualityWhnf e ctx v next
  | .app f args =>
    let f ← sourceQualityWhnf e ctx f next
    match f with
    | .lam _ _ b =>
      if args.isEmpty then return f
      sourceQualityWhnf e ctx (IR.betaApp (b.subst0 args[0]!) (args.extract 1 args.size)) next
    | .app g before => sourceQualityWhnf e ctx (.app g (before ++ args)) next
    | _ => return .app f args
  | _ => return t

private def sourceSortType : IR.SortIR → IR.SortIR
  | .type us => .type (us.map fun l => { l with offset := l.offset+1 })
  | _ => .type #[{level := .set, offset := 1}]

private def sourceProductSort (domain codomain : IR.SortIR) : IR.SortIR :=
  match codomain with
  | .prop => .prop
  | .sprop => .sprop
  | .type us => match domain with
    | .type ds => .type (ds ++ us)
    | _ => .type us

mutual
/-- Source declared types are used for constants, variables, casts and function
applications. This distinction preserves a wrapper's declared Type result even
when its delta/beta-normalized value is a proposition. -/
partial def sourceQualityType (e : SourceQualityEnv) (ctx : SourceQualityContext)
    (t : IR.Term) (fuel : Nat := 256) : Option IR.Term := do
  if fuel == 0 then none
  let next := fuel-1
  match t with
  | .rel i =>
    unless i < ctx.size do none
    return (← ctx[ctx.size-1-i]?).type.liftRels (i+1)
  | .sort s => return .sort (sourceSortType s)
  | .const n us =>
    let .constant c ← e.declarations[n]? | none
    instantiateQualityDecl c.universes us c.type
  | .ind i us =>
    let .inductive d ← e.declarations[i.mind]? | none
    -- A bare quality family lacks the argument context needed for dispatch.
    if e.families.contains i.mind then none
    instantiateQualityDecl d.universes us (← d.bodies[i.idx]?).type
  | .construct i c us =>
    let .inductive d ← e.declarations[i.mind]? | none
    if e.families.contains i.mind then none
    let b ← d.bodies[i.idx]?
    let ty ← instantiateQualityDecl d.universes us (← b.ctors[c]?).type
    let refs := (List.range d.bodies.size).toArray.map fun j => IR.Term.ind {mind := i.mind, idx := j} us
    return instantiateQualityContext ty refs
  | .cast _ _ ty => return ty
  | .lam n ty b =>
    let bt ← sourceQualityType e (ctx.push { name := n, body := none, type := ty }) b next
    return .prod n ty bt
  | .prod n ty b =>
    let .sort ds ← sourceQualityWhnf e ctx (← sourceQualityType e ctx ty next) next | none
    let ctx' := ctx.push { name := n, body := none, type := ty }
    let .sort bs ← sourceQualityWhnf e ctx' (← sourceQualityType e ctx' b next) next | none
    return .sort (sourceProductSort ds bs)
  | .letIn n v ty b =>
    let bt ← sourceQualityType e (ctx.push { name := n, body := some v, type := ty }) b next
    return bt.subst0 v
  | .app f args =>
    let (head, args) := match f.flattenApps with
      | .app g before => (g,before ++ args)
      | g => (g,args)
    let familyRef := match head with
      | .ind i us => some (i,us,none)
      | .construct i c us => some (i,us,some c)
      | _ => none
    let ft ← match familyRef with
      | some (i,us,ctor) =>
        match e.families[i.mind]? with
        | some p =>
          unless i.idx == 0 && us.isEmpty do none
          let q ← sourceTemplateQuality e ctx p args next
          let branch ← match q with
            | .prop => some p.propBranch
            | .type => some p.typeBranch
            | .sprop => none
          let b := branch.bodies[0]!
          match ctor with
          | none => pure b.type
          | some k => pure ((← b.ctors[k]?).type.subst0 (.ind i us))
        | none => sourceQualityType e ctx head next
      | none => sourceQualityType e ctx head next
    let mut ty := ft
    for arg in args do
      let .prod _ _ b ← sourceQualityWhnf e ctx ty next | none
      ty := b.subst0 arg
    return ty
  -- Internal images of the already source-checked native Type0 registrations.
  -- These occur as constructor parameters when emitting native result operators;
  -- they carry no quality variable and cannot be a Prop family argument.
  | .prim "int63_type" _ | .prim "float64_type" _ | .prim "string_type" _ =>
    return .sort (.type #[{level := .set, offset := 0}])
  | .fix ds i | .cofix ds i => return (← ds[i]?).2.1
  | .case i np _ _ _ pc ret scrut _ =>
    let st ← sourceQualityWhnf e ctx (← sourceQualityType e ctx scrut next) next
    let (head,args) := match st.flattenApps with | .app h as => (h,as) | h => (h,#[])
    let .ind j _ := head | none
    unless i == j && args.size >= np && pc.size == args.size-np+1 do none
    return instantiateQualityContext ret ((args.extract np args.size).push scrut)
  | _ => none

/-- Quality of a source type or type family, after peeling its declared arity.
Every peeled binder is retained so dependent aliases see the correct context. -/
partial def sourceArgumentQuality (e : SourceQualityEnv) (ctx : SourceQualityContext)
    (arg : IR.Term) (fuel : Nat := 256) : Option SourceQuality := do
  if fuel == 0 then none
  sourceArityQuality e ctx (← sourceQualityType e ctx arg (fuel-1)) (fuel-1)

partial def sourceArityQuality (e : SourceQualityEnv) (ctx : SourceQualityContext)
    (ty : IR.Term) (fuel : Nat := 256) : Option SourceQuality := do
  if fuel == 0 then none
  let ty ← sourceQualityWhnf e ctx ty (fuel-1)
  match ty with
  | .sort s => return qualityOfSort s
  | .prod n a b => sourceArityQuality e (ctx.push {name := n, body := none, type := a}) b (fuel-1)
  | _ => none

/-- A shared Type-default quality is Prop exactly when every quality-sensitive
parameter has Prop arity. SProp currently requires a separate checked branch. -/
partial def sourceTemplateQuality (e : SourceQualityEnv) (ctx : SourceQualityContext)
    (p : QualityFamilyPlan) (args : Array IR.Term) (fuel : Nat := 256) : Option SourceQuality := do
  if fuel == 0 then none
  let mut out := SourceQuality.prop
  for k in p.parameters do
    let q ← sourceArgumentQuality e ctx (← args[k]?) (fuel-1)
    if q == .sprop then none
    if q == .type then out := .type
  return out
end


/-- Reconstruct match binder annotations from the source arity and constructors.
These contexts describe only source-visible fields/indices, never recursor IHs.
Every substitution happens before adding the binder it is scoped under. -/
def sourceCaseContexts (e : SourceQualityEnv) (i : IndRef) (us : Array IR.Level)
    (ps : Array IR.Term) (outer : Array (Option IR.CtxDecl)) :
    Option (Array IR.CtxDecl × Array (Array IR.CtxDecl)) := do
  let ctx := (← outer.toList.mapM id).toArray
  let .inductive d ← e.declarations[i.mind]? | none
  let b ← d.bodies[i.idx]?
  unless ps.size == d.npars do none
  let applyParams (ty : IR.Term) : Option IR.Term := do
    let mut ty := ty
    for a in ps do
      let .prod _ _ body ← sourceQualityWhnf e ctx ty | none
      ty := body.subst0 a
    return ty
  let mut arity ← applyParams (← instantiateQualityDecl d.universes us b.type)
  let mut motive : Array IR.CtxDecl := #[]
  for _ in [:b.indices.size] do
    let .prod n ty body ← sourceQualityWhnf e (ctx ++ motive) arity | none
    motive := motive.push {name := n, type := ty, body := none}
    arity := body
  let ni := motive.size
  let indices := (List.range ni).toArray.map fun j => IR.Term.rel (ni-1-j)
  let majorTy := IR.betaApp (.ind i us) ((ps.map (·.liftRels ni)) ++ indices)
  motive := motive.push {name := {name := none, rel := b.rel}, type := majorTy, body := none}
  let selves := (List.range d.bodies.size).toArray.map fun j => IR.Term.ind {mind := i.mind, idx := j} us
  let branches ← b.ctors.mapM fun ctor => do
    let quoted ← instantiateQualityDecl d.universes us ctor.type
    let mut ty ← applyParams (instantiateQualityContext quoted selves)
    let mut fields : Array IR.CtxDecl := #[]
    for _ in [:ctor.args.size] do
      let .prod n domain body ← sourceQualityWhnf e (ctx ++ fields) ty | none
      fields := fields.push {name := n, type := domain, body := none}
      ty := body
    return fields
  return (motive,branches)

/-- Bind the checked source analysis to generated targets. Missing source binder
information is unknown; closed arguments can still be analysed independently.
The caller supplies BOTH generated branches for each family. -/
def qualityDispatch (source : SourceQualityEnv)
    (targets : Std.HashMap String (IndTarget × IndTarget)) :
    String → Array (Option IR.CtxDecl) → Array IR.Term → Except String (Option IndTarget) :=
  fun name context args => do
    let some p := source.families[name]? | return none
    let some (propTarget,typeTarget) := targets[name]? | throw "quality family has no complete target pair"
    let ctx ← match context.toList.mapM id with
      | some cs => pure cs.toArray
      | none =>
        if args.any (fun a => a.mentionsRels 0 context.size) then
          throw "quality selection requires the source binder context"
        else pure #[]
    let some q := sourceTemplateQuality source ctx p args | throw "source template quality is unknown"
    match q with
    | .prop => return some propTarget
    | .type => return some typeTarget
    | .sprop => throw "SProp quality family branch has not been validated"


end Rocq2Lean

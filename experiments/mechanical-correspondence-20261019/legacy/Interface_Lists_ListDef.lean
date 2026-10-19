import Rocq2LeanOut
import Std
set_option maxRecDepth 4096
set_option maxHeartbeats 1000000
-- Supply ordinary Lean eliminator helpers missing from the mechanical artifact.
run_cmd Lean.Elab.Command.liftTermElabM do
  let env ← Lean.getEnv
  for (n, ci) in env.constants.toList do
    if n.toString.startsWith "Rocq." then
      if let .inductInfo _ := ci then
        unless env.contains (.str n "casesOn") do
          Lean.mkCasesOn n
noncomputable section
namespace NativeBridge
universe u v w
/-- Explicit equivalence: no classical choice, no new axiom. -/
structure Iso (A : Sort u) (B : Sort v) where
  to : A → B
  of : B → A
  of_to : ∀ a, of (to a) = a
  to_of : ∀ b, to (of b) = b
def identityIso (A : Sort u) : Iso A A := ⟨id,id,fun _ => rfl,fun _ => rfl⟩
namespace Iso
theorem injective (e : Iso A B) {a b : A} (h : e.to a = e.to b) : a = b :=
  (e.of_to a).symm.trans ((congrArg e.of h).trans (e.of_to b))
theorem eq_iff (e : Iso A B) (a b : A) : e.to a = e.to b ↔ a = b :=
  ⟨e.injective, fun h => congrArg e.to h⟩
theorem surjective (e : Iso A B) (b : B) : ∃ a, e.to a = b := ⟨e.of b, e.to_of b⟩
def symm (e : Iso A B) : Iso B A := ⟨e.of, e.to, e.to_of, e.of_to⟩
def trans (e : Iso A B) (f : Iso B C) : Iso A C where
  to a := f.to (e.to a)
  of c := e.of (f.of c)
  of_to a := by rw [f.of_to, e.of_to]
  to_of c := by rw [e.to_of, f.to_of]
theorem forall_iff (e : Iso A B) (P : A → Prop) (Q : B → Prop)
    (h : ∀ a, P a ↔ Q (e.to a)) : (∀ a, P a) ↔ (∀ b, Q b) := by
  constructor
  · intro hp b
    have hb := (h (e.of b)).mp (hp (e.of b))
    simpa only [e.to_of] using hb
  · intro hq a
    exact (h a).mpr (hq (e.to a))
theorem exists_iff (e : Iso A B) (P : A → Prop) (Q : B → Prop)
    (h : ∀ a, P a ↔ Q (e.to a)) : (∃ a, P a) ↔ (∃ b, Q b) := by
  constructor
  · rintro ⟨a, ha⟩; exact ⟨e.to a, (h a).mp ha⟩
  · rintro ⟨b, hb⟩
    refine ⟨e.of b, (h (e.of b)).mpr ?_⟩
    simpa only [e.to_of] using hb
def functions (a : Iso A B) (b : Iso C D) : Iso (A → C) (B → D) where
  to f x := b.to (f (a.of x))
  of f x := b.of (f (a.to x))
  of_to f := by funext x; simp only [a.of_to, b.of_to]
  to_of f := by funext x; simp only [a.to_of, b.to_of]
def call (a : Iso A B) (b : Iso C D) (f : B → D) (x : A) : C :=
  b.of (f (a.to x))
@[simp] theorem call_agrees (a : Iso A B) (b : Iso C D) (f : B → D) (x : A) :
  b.to (a.call b f x) = f (a.to x) := b.to_of _
def call₂ (a : Iso A B) (b : Iso C D) (c : Iso E F) (f : B → D → F) (x : A) (y : C) : E :=
  c.of (f (a.to x) (b.to y))
@[simp] theorem call₂_agrees (a : Iso A B) (b : Iso C D) (c : Iso E F)
    (f : B → D → F) (x : A) (y : C) :
  c.to (a.call₂ b c f x y) = f (a.to x) (b.to y) := c.to_of _
def decidableEq (e : Iso A B) [DecidableEq B] : DecidableEq A :=
  fun x y => if h : e.to x = e.to y then .isTrue (e.injective h)
    else .isFalse (fun hxy => h (congrArg e.to hxy))
def lists {A : Type u} {B : Type v} (e : Iso A B) : Iso (List A) (List B) where
  to := List.map e.to
  of := List.map e.of
  of_to xs := by
    induction xs with
    | nil => rfl
    | cons x xs ih => simp only [List.map_cons, e.of_to, ih]
  to_of xs := by
    induction xs with
    | nil => rfl
    | cons x xs ih => simp only [List.map_cons, e.to_of, ih]
def options {A : Type u} {B : Type v} (e : Iso A B) : Iso (Option A) (Option B) where
  to := Option.map e.to
  of := Option.map e.of
  of_to x := by cases x <;> simp only [Option.map_none, Option.map_some, e.of_to]
  to_of x := by cases x <;> simp only [Option.map_none, Option.map_some, e.to_of]

def products {A : Type u} {B : Type v} {C : Type w} {D : Type _}
 (a : Iso A B) (b : Iso C D) : Iso (A × C) (B × D) where
 to x := (a.to x.1, b.to x.2)
 of x := (a.of x.1, b.of x.2)
 of_to x := by cases x; simp only [a.of_to, b.of_to]
 to_of x := by cases x; simp only [a.to_of, b.to_of]
def sums {A : Type u} {B : Type v} {C : Type w} {D : Type _}
 (a : Iso A B) (b : Iso C D) : Iso (Sum A C) (Sum B D) where
 to := Sum.map a.to b.to
 of := Sum.map a.of b.of
 of_to x := by cases x <;> simp [Sum.map, a.of_to, b.of_to]
 to_of x := by cases x <;> simp [Sum.map, a.to_of, b.to_of]
def propositions {P Q : Prop} (h : P ↔ Q) : Iso P Q :=
 ⟨h.mp, h.mpr, fun _ => rfl, fun _ => rfl⟩
def subtypes {A : Type u} {B : Type v} (e : Iso A B) (P : A → Prop) (Q : B → Prop)
 (h : ∀ a, P a ↔ Q (e.to a)) : Iso {a // P a} {b // Q b} where
 to a := ⟨e.to a.val, (h a.val).mp a.property⟩
 of b := ⟨e.of b.val, (h (e.of b.val)).mpr (by simpa only [e.to_of] using b.property)⟩
 of_to a := Subtype.ext (e.of_to a.val)
 to_of b := Subtype.ext (e.to_of b.val)
/-- Native-side presentation of ANY source function on bridged types. -/
def exportFunction (a : Iso A B) (b : Iso C D) (f : A → C) : B → D :=
 (a.functions b).to f
@[simp] theorem exportFunction_agrees (a : Iso A B) (b : Iso C D) (f : A → C) (x : A) :
 a.exportFunction b f (a.to x) = b.to (f x) := by
 change b.to (f (a.of (a.to x))) = _
 rw [a.of_to]
theorem transfer (P Q : Prop) (h : P ↔ Q) (proof : P) : Q := h.mp proof
theorem transferBack (P Q : Prop) (h : P ↔ Q) (proof : Q) : P := h.mpr proof

end Iso
def natIso : Iso Nat Nat := ⟨id, id, fun _ => rfl, fun _ => rfl⟩
theorem eq_correspondence {A : Sort u} (x y : A) : (x = y) ↔ (x = y) := Iff.rfl

abbrev RComparison := Rocq.Corelib.Init.Datatypes.comparison
def comparisonTo : RComparison → Ordering :=
  Rocq.Corelib.Init.Datatypes.comparison.rec .eq .lt .gt
def comparisonOf : Ordering → RComparison
  | .eq => .Eq
  | .lt => .Lt
  | .gt => .Gt
@[simp] theorem comparison_of_to (c : RComparison) : comparisonOf (comparisonTo c) = c := by cases c <;> rfl
@[simp] theorem comparison_to_of (c : Ordering) : comparisonTo (comparisonOf c) = c := by cases c <;> rfl
def comparisonIso : Iso RComparison Ordering := ⟨comparisonTo, comparisonOf, comparison_of_to, comparison_to_of⟩

abbrev RList (A : Type u) := Rocq.Corelib.Init.Datatypes.list A
def listOf {A : Type u} : List A → RList A
  | [] => Rocq.Corelib.Init.Datatypes.list.nil A
  | x :: xs => Rocq.Corelib.Init.Datatypes.list.cons A x (listOf xs)
def listTo {A : Type u} : RList A → List A :=
  @Rocq.Corelib.Init.Datatypes.list.rec A (fun _ => List A)
    [] (fun x _ xs => x :: xs)
@[simp] theorem list_to_of {A : Type u} (xs : List A) : listTo (listOf xs) = xs := by
  induction xs with
  | nil => rfl
  | cons x xs ih => change x :: listTo (listOf xs) = x :: xs; rw [ih]
@[simp] theorem list_of_to {A : Type u} (xs : RList A) : listOf (listTo xs) = xs :=
  @Rocq.Corelib.Init.Datatypes.list.rec A (fun xs => listOf (listTo xs) = xs)
    rfl (fun x xs ih => by
      change Rocq.Corelib.Init.Datatypes.list.cons A x (listOf (listTo xs)) =
        Rocq.Corelib.Init.Datatypes.list.cons A x xs
      rw [ih]) xs
def listIso (A : Type u) : Iso (RList A) (List A) := ⟨listTo, listOf, list_of_to, list_to_of⟩

abbrev NativeArray (A : Type u) := Σ n : Fin (4194304), Vector A n.val × A

abbrev NativeByteString := Σ n : Fin (16777212), Vector (BitVec 8) n.val


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

#export_native Rocq.Corelib.Lists.ListDef.firstn
#export_native Rocq.Corelib.Lists.ListDef.list_compare
#export_native Rocq.Corelib.Lists.ListDef.map
#export_native Rocq.Corelib.Lists.ListDef.nth
#export_native Rocq.Corelib.Lists.ListDef.repeat
#export_native Rocq.Corelib.Lists.ListDef.seq
#export_native Rocq.Corelib.Lists.ListDef.skipn
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
  IO.FS.writeFile "/home/shunqwang4/research/rocq-core/experiments/mechanical-correspondence-20261019/legacy/audits/Interface_Lists_ListDef.json" (Lean.Json.pretty (.arr rows))

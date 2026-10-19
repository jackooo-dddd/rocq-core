import SSRBoolFinalWitnesses
import SSRBoolClosedOperations
set_option linter.unusedSimpArgs false

open Lean Meta Elab Command
syntax (name := ssrbReflectOperation) "#ssrb_reflect_operation " ident ident ident : command
@[command_elab ssrbReflectOperation] def elabSSRBReflectOperation : CommandElab := fun stx => do
 liftTermElabM do
  let source := stx[1].getId
  let native := stx[2].getId
  let nativeProof := stx[3].getId
  let sci ← getConstInfo source
  unless sci.levelParams.isEmpty do throwError "This finite Bool adapter has no universe parameters"
  let mut ty := sci.type
  let mut sourceApp := mkConst source
  while let .forallE _ domain body _ := ty do
   let some dep := domain.getAppFn.constName? | break
   unless dep.toString.endsWith ".statement" do break
   let witness ← mkConstWithFreshMVarLevels ("NativeBridge.Incremental.SSRBoolWitnesses.closed." ++ dep.toString).toName
   unless ← isDefEq (← inferType witness) domain do throwError "Prerequisite type mismatch"
   sourceApp := mkApp sourceApp (← instantiateMVars witness)
   ty := body.instantiate1 witness
  let rootName := ("NativeBridge.Incremental.SSRBoolReflection." ++ source.getString!).toName
  let convName := rootName ++ `toNative
  let certName := rootName ++ `correspondence
  let mut rules : SimpTheorems := {}
  for n in [`NativeBridge.eq_correspondence,`NativeBridge.is_true_agrees,
      `NativeBridge.Incremental.bool_eq_native,`NativeBridge.Incremental.bool_equality_native,
      `NativeBridge.Incremental.boolTo_true,`NativeBridge.Incremental.boolTo_false,
      `NativeBridge.bool_to_of,`NativeBridge.andb_agrees,`NativeBridge.orb_agrees,
      `NativeBridge.negb_agrees,`NativeBridge.implb_agrees,
      `NativeBridge.Incremental.ssr_addb_agrees,
      `NativeBridge.Incremental.and_agrees,`NativeBridge.Incremental.or_agrees,
      `NativeBridge.Incremental.not_agrees,`NativeBridge.Incremental.iff_agrees,
      `NativeBridge.Incremental.SSRBoolLogic.and3_agrees,
      `NativeBridge.Incremental.SSRBoolLogic.and4_agrees,
      `NativeBridge.Incremental.SSRBoolLogic.and5_agrees,
      `NativeBridge.Incremental.SSRBoolLogic.or3_agrees,
      `NativeBridge.Incremental.SSRBoolLogic.or4_agrees] do
    rules ← rules.addConst n
  let ctx ← Simp.mkContext (config := {maxSteps:=20000}) (simpTheorems := #[rules])
  let nci ← getConstInfo nativeProof
  let (convType,convValue,certType,certValue) ← forallTelescope nci.type fun xs nativeResult => do
   let mut applied := sourceApp
   for x in xs do
    let xtype ← inferType x
    let .forallE _ domain _ _ ← whnf (← inferType applied) | throwError "Source argument count mismatch"
    if ← isDefEq domain xtype then
     applied := mkApp applied x
    else if ← isDefEq xtype (mkConst `Bool) then
     applied := mkApp applied (← mkAppM `NativeBridge.boolOf #[x])
    else if domain.isAppOfArity `Rocq.Corelib.Init.Datatypes.reflect 2 then
     let a := domain.getAppArgs
     let iso ← mkAppM `NativeBridge.Incremental.reflectIso #[a[0]!,a[1]!]
     let isoType ← inferType iso
     let nativeDomain := isoType.getAppArgs[1]!
     let (r,_) ← Meta.simp nativeDomain ctx
     unless ← isDefEq r.expr xtype do throwError "Reflection input mismatch: {r.expr} versus {xtype}"
     let h ← mkAppM `Eq.mpr #[← r.getProof' nativeDomain,x]
     applied := mkApp applied (← mkAppM `NativeBridge.Iso.of #[iso,h])
    else
     let (r,_) ← Meta.simp domain ctx
     unless ← isDefEq r.expr xtype do throwError "Input normalization mismatch: {r.expr} versus {xtype}"
     let value ← mkAppM `Eq.mpr #[← r.getProof' domain,x]
     applied := mkApp applied value
   let sourceResult ← inferType applied
   unless sourceResult.isAppOfArity `Rocq.Corelib.Init.Datatypes.reflect 2 do throwError "Expected reflect result"
   let a := sourceResult.getAppArgs
   let iso ← mkAppM `NativeBridge.Incremental.reflectIso #[a[0]!,a[1]!]
   let (ct,cv) ← withLocalDeclD `r sourceResult fun r => do
    let proof ← mkAppM `NativeBridge.Iso.to #[iso,r]
    let oldProp ← inferType proof
    let (first,_) ← Meta.simp oldProp ctx
    let mut nr := first
    for _ in [:6] do
     let (next,_) ← Meta.simp nr.expr ctx
     if next.expr == nr.expr then break
     let proof ← mkAppM `Eq.trans #[← nr.getProof' oldProp, ← next.getProof' nr.expr]
     nr := {expr:=next.expr,proof?:=some proof}
    unless ← isDefEq nr.expr nativeResult do
      throwError "Native result mismatch: {nr.expr} versus {nativeResult}"
    let value ← mkAppM `Eq.mp #[← nr.getProof' oldProp,proof]
    return (← mkForallFVars (xs.push r) nativeResult, ← mkLambdaFVars (xs.push r) value)
   addDecl (.defnDecl {name:=convName,levelParams:=[],type:=ct,value:=cv,hints:=.abbrev,safety:=.safe})
   let left := mkAppN (mkConst convName) (xs.push applied)
   let right := mkAppN (mkConst nativeProof) xs
   let eq ← mkEq left right
   let refl ← mkEqRefl left
   return (ct,cv,← mkForallFVars xs eq,← mkLambdaFVars xs refl)
  let _ := (convType,convValue)
  addDecl (.thmDecl {name:=certName,levelParams:=[],type:=certType,value:=certValue})

namespace NativeBridge.Incremental.SSRBoolReflection

def addbP_native (a b : Bool) : Prop := (((!a) = b) ↔ Bool.xor a b = true)
theorem addbP_nativeProof (a b : Bool) : addbP_native a b := by
  unfold addbP_native
  cases a <;> cases b <;> decide

def andP_native (a b : Bool) : Prop := ((a = true ∧ b = true) ↔ (a && b) = true)
theorem andP_nativeProof (a b : Bool) : andP_native a b := by
  unfold andP_native
  cases a <;> cases b <;> decide

def and3P_native (a b c : Bool) : Prop := ((a = true ∧ b = true ∧ c = true) ↔ (a && (b && c)) = true)
theorem and3P_nativeProof (a b c : Bool) : and3P_native a b c := by
  unfold and3P_native
  cases a <;> cases b <;> cases c <;> decide

def and4P_native (a b c d : Bool) : Prop := ((a = true ∧ b = true ∧ c = true ∧ d = true) ↔ (a && (b && (c && d))) = true)
theorem and4P_nativeProof (a b c d : Bool) : and4P_native a b c d := by
  unfold and4P_native
  cases a <;> cases b <;> cases c <;> cases d <;> decide

def and5P_native (a b c d e : Bool) : Prop := ((a = true ∧ b = true ∧ c = true ∧ d = true ∧ e = true) ↔ (a && (b && (c && (d && e)))) = true)
theorem and5P_nativeProof (a b c d e : Bool) : and5P_native a b c d e := by
  unfold and5P_native
  cases a <;> cases b <;> cases c <;> cases d <;> cases e <;> decide

def idP_native (a : Bool) : Prop := ((a = true) ↔ a = true)
theorem idP_nativeProof (a : Bool) : idP_native a := by
  unfold idP_native
  cases a <;> decide

def idPn_native (a : Bool) : Prop := (((!a) = true) ↔ (!a) = true)
theorem idPn_nativeProof (a : Bool) : idPn_native a := by
  unfold idPn_native
  cases a <;> decide

def implyP_native (a b : Bool) : Prop := ((a = true → b = true) ↔ ((!a) || b) = true)
theorem implyP_nativeProof (a b : Bool) : implyP_native a b := by
  unfold implyP_native
  cases a <;> cases b <;> decide

def nandP_native (a b : Bool) : Prop := (((!a) = true ∨ (!b) = true) ↔ (!(a && b)) = true)
theorem nandP_nativeProof (a b : Bool) : nandP_native a b := by
  unfold nandP_native
  cases a <;> cases b <;> decide

def negP_native (a : Bool) : Prop := ((¬a = true) ↔ (!a) = true)
theorem negP_nativeProof (a : Bool) : negP_native a := by
  unfold negP_native
  cases a <;> decide

def negPf_native (a : Bool) : Prop := ((a = false) ↔ (!a) = true)
theorem negPf_nativeProof (a : Bool) : negPf_native a := by
  unfold negPf_native
  cases a <;> decide

def negPn_native (a : Bool) : Prop := ((a = true) ↔ (!(!a)) = true)
theorem negPn_nativeProof (a : Bool) : negPn_native a := by
  unfold negPn_native
  cases a <;> decide

def norP_native (a b : Bool) : Prop := (((!a) = true ∧ (!b) = true) ↔ (!(a || b)) = true)
theorem norP_nativeProof (a b : Bool) : norP_native a b := by
  unfold norP_native
  cases a <;> cases b <;> decide

def orP_native (a b : Bool) : Prop := ((a = true ∨ b = true) ↔ (a || b) = true)
theorem orP_nativeProof (a b : Bool) : orP_native a b := by
  unfold orP_native
  cases a <;> cases b <;> decide

def or3P_native (a b c : Bool) : Prop := ((a = true ∨ b = true ∨ c = true) ↔ (a || (b || c)) = true)
theorem or3P_nativeProof (a b c : Bool) : or3P_native a b c := by
  unfold or3P_native
  cases a <;> cases b <;> cases c <;> decide

def or4P_native (a b c d : Bool) : Prop := ((a = true ∨ b = true ∨ c = true ∨ d = true) ↔ (a || (b || (c || d))) = true)
theorem or4P_nativeProof (a b c d : Bool) : or4P_native a b c d := by
  unfold or4P_native
  cases a <;> cases b <;> cases c <;> cases d <;> decide
end NativeBridge.Incremental.SSRBoolReflection

#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.addbP
#ssrb_reflect_operation RocqPending.Corelib.ssr.ssrbool.addbP NativeBridge.Incremental.SSRBoolReflection.addbP_native NativeBridge.Incremental.SSRBoolReflection.addbP_nativeProof

#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.andP
#ssrb_reflect_operation RocqPending.Corelib.ssr.ssrbool.andP NativeBridge.Incremental.SSRBoolReflection.andP_native NativeBridge.Incremental.SSRBoolReflection.andP_nativeProof

#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.and3P
#ssrb_reflect_operation RocqPending.Corelib.ssr.ssrbool.and3P NativeBridge.Incremental.SSRBoolReflection.and3P_native NativeBridge.Incremental.SSRBoolReflection.and3P_nativeProof

#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.and4P
#ssrb_reflect_operation RocqPending.Corelib.ssr.ssrbool.and4P NativeBridge.Incremental.SSRBoolReflection.and4P_native NativeBridge.Incremental.SSRBoolReflection.and4P_nativeProof

#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.and5P
#ssrb_reflect_operation RocqPending.Corelib.ssr.ssrbool.and5P NativeBridge.Incremental.SSRBoolReflection.and5P_native NativeBridge.Incremental.SSRBoolReflection.and5P_nativeProof

#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.idP
#ssrb_reflect_operation RocqPending.Corelib.ssr.ssrbool.idP NativeBridge.Incremental.SSRBoolReflection.idP_native NativeBridge.Incremental.SSRBoolReflection.idP_nativeProof

#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.idPn
#ssrb_reflect_operation RocqPending.Corelib.ssr.ssrbool.idPn NativeBridge.Incremental.SSRBoolReflection.idPn_native NativeBridge.Incremental.SSRBoolReflection.idPn_nativeProof

#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.implyP
#ssrb_reflect_operation RocqPending.Corelib.ssr.ssrbool.implyP NativeBridge.Incremental.SSRBoolReflection.implyP_native NativeBridge.Incremental.SSRBoolReflection.implyP_nativeProof

#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.nandP
#ssrb_reflect_operation RocqPending.Corelib.ssr.ssrbool.nandP NativeBridge.Incremental.SSRBoolReflection.nandP_native NativeBridge.Incremental.SSRBoolReflection.nandP_nativeProof

#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.negP
#ssrb_reflect_operation RocqPending.Corelib.ssr.ssrbool.negP NativeBridge.Incremental.SSRBoolReflection.negP_native NativeBridge.Incremental.SSRBoolReflection.negP_nativeProof

#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.negPf
#ssrb_reflect_operation RocqPending.Corelib.ssr.ssrbool.negPf NativeBridge.Incremental.SSRBoolReflection.negPf_native NativeBridge.Incremental.SSRBoolReflection.negPf_nativeProof

#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.negPn
#ssrb_reflect_operation RocqPending.Corelib.ssr.ssrbool.negPn NativeBridge.Incremental.SSRBoolReflection.negPn_native NativeBridge.Incremental.SSRBoolReflection.negPn_nativeProof

#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.norP
#ssrb_reflect_operation RocqPending.Corelib.ssr.ssrbool.norP NativeBridge.Incremental.SSRBoolReflection.norP_native NativeBridge.Incremental.SSRBoolReflection.norP_nativeProof

#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.orP
#ssrb_reflect_operation RocqPending.Corelib.ssr.ssrbool.orP NativeBridge.Incremental.SSRBoolReflection.orP_native NativeBridge.Incremental.SSRBoolReflection.orP_nativeProof

#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.or3P
#ssrb_reflect_operation RocqPending.Corelib.ssr.ssrbool.or3P NativeBridge.Incremental.SSRBoolReflection.or3P_native NativeBridge.Incremental.SSRBoolReflection.or3P_nativeProof

#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.or4P
#ssrb_reflect_operation RocqPending.Corelib.ssr.ssrbool.or4P NativeBridge.Incremental.SSRBoolReflection.or4P_native NativeBridge.Incremental.SSRBoolReflection.or4P_nativeProof


namespace NativeBridge.Incremental.SSRBoolReflection
def andPP_native (P Q : Prop) (p q : Bool) (hp : P ↔ p = true) (hq : Q ↔ q = true) : Prop := ((P ∧ Q) ↔ (p && q) = true)
theorem andPP_nativeProof (P Q : Prop) (p q : Bool) (hp : P ↔ p = true) (hq : Q ↔ q = true) : andPP_native P Q p q hp hq := by
  unfold andPP_native
  rw [hp,hq]
  cases p <;> cases q <;> decide
def orPP_native (P Q : Prop) (p q : Bool) (hp : P ↔ p = true) (hq : Q ↔ q = true) : Prop := ((P ∨ Q) ↔ (p || q) = true)
theorem orPP_nativeProof (P Q : Prop) (p q : Bool) (hp : P ↔ p = true) (hq : Q ↔ q = true) : orPP_native P Q p q hp hq := by
  unfold orPP_native
  rw [hp,hq]
  cases p <;> cases q <;> decide
def implyPP_native (P Q : Prop) (p q : Bool) (hp : P ↔ p = true) (hq : Q ↔ q = true) : Prop := ((P → Q) ↔ ((!p) || q) = true)
theorem implyPP_nativeProof (P Q : Prop) (p q : Bool) (hp : P ↔ p = true) (hq : Q ↔ q = true) : implyPP_native P Q p q hp hq := by
  unfold implyPP_native
  rw [hp,hq]
  cases p <;> cases q <;> decide
def negPP_native (P : Prop) (p : Bool) (hp : P ↔ p = true) : Prop := (¬ P) ↔ (!p) = true
theorem negPP_nativeProof (P : Prop) (p : Bool) (hp : P ↔ p = true) : negPP_native P p hp := by
  unfold negPP_native
  rw [hp]
  cases p <;> decide
def iffP_native (P Q : Prop) (b : Bool) (hp : P ↔ b = true) (f : P → Q) (g : Q → P) : Prop := Q ↔ b = true
theorem iffP_nativeProof (P Q : Prop) (b : Bool) (hp : P ↔ b = true) (f : P → Q) (g : Q → P) : iffP_native P Q b hp f g :=
  ⟨fun h => hp.mp (g h), fun h => f (hp.mpr h)⟩
def equivP_native (P Q : Prop) (b : Bool) (hp : P ↔ b = true) (h : P ↔ Q) : Prop := Q ↔ b = true
theorem equivP_nativeProof (P Q : Prop) (b : Bool) (hp : P ↔ b = true) (h : P ↔ Q) : equivP_native P Q b hp h := h.symm.trans hp
def introP_native (Q : Prop) (b : Bool) (ht : b = true → Q) (hf : (!b) = true → ¬Q) : Prop := Q ↔ b = true
theorem introP_nativeProof (Q : Prop) (b : Bool) (ht : b = true → Q) (hf : (!b) = true → ¬Q) : introP_native Q b ht hf := by
  cases b <;> simp_all [introP_native]
end NativeBridge.Incremental.SSRBoolReflection
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.andPP
#ssrb_reflect_operation RocqPending.Corelib.ssr.ssrbool.andPP NativeBridge.Incremental.SSRBoolReflection.andPP_native NativeBridge.Incremental.SSRBoolReflection.andPP_nativeProof
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.orPP
#ssrb_reflect_operation RocqPending.Corelib.ssr.ssrbool.orPP NativeBridge.Incremental.SSRBoolReflection.orPP_native NativeBridge.Incremental.SSRBoolReflection.orPP_nativeProof
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.implyPP
#ssrb_reflect_operation RocqPending.Corelib.ssr.ssrbool.implyPP NativeBridge.Incremental.SSRBoolReflection.implyPP_native NativeBridge.Incremental.SSRBoolReflection.implyPP_nativeProof
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.negPP
#ssrb_reflect_operation RocqPending.Corelib.ssr.ssrbool.negPP NativeBridge.Incremental.SSRBoolReflection.negPP_native NativeBridge.Incremental.SSRBoolReflection.negPP_nativeProof
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.iffP
#ssrb_reflect_operation RocqPending.Corelib.ssr.ssrbool.iffP NativeBridge.Incremental.SSRBoolReflection.iffP_native NativeBridge.Incremental.SSRBoolReflection.iffP_nativeProof
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.equivP
#ssrb_reflect_operation RocqPending.Corelib.ssr.ssrbool.equivP NativeBridge.Incremental.SSRBoolReflection.equivP_native NativeBridge.Incremental.SSRBoolReflection.equivP_nativeProof
#close_ssrb_definition RocqPending.Corelib.ssr.ssrbool.introP
#ssrb_reflect_operation RocqPending.Corelib.ssr.ssrbool.introP NativeBridge.Incremental.SSRBoolReflection.introP_native NativeBridge.Incremental.SSRBoolReflection.introP_nativeProof
private partial def reflectionNativeRefs (e : Expr) (seen : NameSet := {}) : MetaM (Array Name) := do
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
        found := found ++ (← reflectionNativeRefs body seen)
  return found


open Lean in
run_cmd Lean.Elab.Command.liftTermElabM do
  for name in ["NativeBridge.Incremental.SSRBoolReflection.addbP_native", "NativeBridge.Incremental.SSRBoolReflection.andP_native", "NativeBridge.Incremental.SSRBoolReflection.and3P_native", "NativeBridge.Incremental.SSRBoolReflection.and4P_native", "NativeBridge.Incremental.SSRBoolReflection.and5P_native", "NativeBridge.Incremental.SSRBoolReflection.idP_native", "NativeBridge.Incremental.SSRBoolReflection.idPn_native", "NativeBridge.Incremental.SSRBoolReflection.implyP_native", "NativeBridge.Incremental.SSRBoolReflection.nandP_native", "NativeBridge.Incremental.SSRBoolReflection.negP_native", "NativeBridge.Incremental.SSRBoolReflection.negPf_native", "NativeBridge.Incremental.SSRBoolReflection.negPn_native", "NativeBridge.Incremental.SSRBoolReflection.norP_native", "NativeBridge.Incremental.SSRBoolReflection.orP_native", "NativeBridge.Incremental.SSRBoolReflection.or3P_native", "NativeBridge.Incremental.SSRBoolReflection.or4P_native", "NativeBridge.Incremental.SSRBoolReflection.andPP_native", "NativeBridge.Incremental.SSRBoolReflection.orPP_native", "NativeBridge.Incremental.SSRBoolReflection.implyPP_native", "NativeBridge.Incremental.SSRBoolReflection.negPP_native", "NativeBridge.Incremental.SSRBoolReflection.iffP_native", "NativeBridge.Incremental.SSRBoolReflection.equivP_native", "NativeBridge.Incremental.SSRBoolReflection.introP_native"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← reflectionNativeRefs body) ++ (← reflectionNativeRefs ci.type)
    let proof ← getConstInfo (name ++ "Proof").toName
    let .thmInfo proofInfo := proof | throwError "Missing native proof"
    let proofBody := proofInfo.value
    unless (← reflectionNativeRefs proofBody).isEmpty do throwError "Source-dependent native proof"
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))

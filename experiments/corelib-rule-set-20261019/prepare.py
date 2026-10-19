#!/usr/bin/env python3
"""Materialize the isolated configurable translator from the frozen mechanical baseline."""
from pathlib import Path
import json,hashlib,shutil,subprocess,difflib
W=Path(__file__).resolve().parent
B=W.parent/'mechanical-nat-eq-20261019'/'translator'
T=W/'.work/translator'
RULES=[
('fact-reduce','R2+','按源 universe 事实约简 level'),
('fact-interpretation','R2F / R2F-c','用 max 表达源 universe 约束'),
('motive-sort','R8','动机层级读取为 Sort'),
('cumulativity','R3-up / R2B-P','累积性兼容及受检 Prop 约束'),
('reference-lowering','R3-down','引用 universe 的受检降低'),
('implicit-discovery','R3G','发现额外隐式 universe 参数'),
('set-delta','M6 Set-motive delta','展开 Set 动机常量的重试'),
('result-sort','R2B-V','继承实际值的结果 sort'),
('instance-hypotheses','P3','每个引用实例的待证参数'),
('joint-levels','P2','联合 universe 元变量'),
('occurrence-levels','R / per occurrence','按出现位置实例化共享 level'),
('prop-lift','P','Prop 到 Type 的 PULift'),
('phantom-sort','Q-a','擦除 phantom sort 参数'),
('type-lift','Type PULift','Type 到 Type 的受检提升'),
('operand-split','R-SPLIT','操作数 universe 分裂视图'),
('alias-delta','delta-beta aliases','展开透明擦除型多态别名'),
('source-compute','C06','源端构造器驱动的类型计算'),
('carrier-copies','R-CARRIER P2','保留独立 carrier 的 level 副本'),
('template-sort','template Sort','template 归纳类型采用通用 Sort 接口'),
('poly-model','R6-I','多态约束的局部 universe 模型'),
('wf-obligations','B / B-P','良基递归的显式证明条件')]
(W/'mechanisms.json').write_text(json.dumps([{'id':a,'legacy':b,'description':c} for a,b,c in RULES],indent=2,ensure_ascii=False)+'\n')
if not T.exists():
 shutil.copytree(B,T,ignore=shutil.ignore_patterns('.lake','_build','reports','__pycache__'))
 # Existing compiled dependencies are reused only as a build cache; changed sources rebuilt by Lake.
 subprocess.run(['cp','-a','--reflink=auto',str(B/'.lake'),str(T/'.lake')],check=True)
protected=T/'reports/prosa_inventory/protected_interface.json'
protected.parent.mkdir(parents=True,exist_ok=True)
for f in ['protected_interface.json','declarations.jsonl','scope.lock.json']:
 shutil.copyfile(B/'reports/prosa_inventory'/f,protected.parent/f)
if T.exists():
 shutil.copytree(B,T,dirs_exist_ok=True,ignore=shutil.ignore_patterns('.lake','_build','reports','__pycache__'))
names=', '.join('"'+x[0]+'"' for x in RULES)
rulemod='''import Lean
namespace Rocq2Lean
/-- Optional transformations only. Kernel, source-fact and generality checks have no switches. -/
def configurableMechanisms : Array String := #['''+names+''']
def disabledMechanisms : IO (Array String) := do
  let raw := (← IO.getEnv "ROCQ2LEAN_DISABLED_RULES").getD ""
  let xs := (raw.splitOn ",").filter (· != "")
  for x in xs do
    unless configurableMechanisms.contains x do
      throw (IO.userError s!"unknown disabled translation mechanism: {x}")
  return xs.toArray
def mechanismEnabled (name : String) : IO Bool := do
  unless configurableMechanisms.contains name do
    throw (IO.userError s!"unknown translation mechanism: {name}")
  return !(← disabledMechanisms).contains name
def firstDisabledMechanism (used : List (String × Bool)) : IO (Option String) := do
  let disabled ← disabledMechanisms
  return used.findSome? fun (name, active) =>
    if active && disabled.contains name then some name else none
end Rocq2Lean
'''
(T/'Rocq2Lean/RuleSet.lean').write_text(rulemod)
s=(B/'Rocq2Lean/Emit.lean').read_text()
def rep(a,b,n=1):
 global s
 assert s.count(a)==n,(a[:100],s.count(a),n)
 s=s.replace(a,b)
rep('import Rocq2Lean.QualitySource','import Rocq2Lean.QualitySource\nimport Rocq2Lean.RuleSet')
rep('  let base : DeclResult := { source := c.name, kind := "constant", status := "" }',
'''  let base : DeclResult := { source := c.name, kind := "constant", status := "" }
  if let some disabled ← firstDisabledMechanism [
      ("fact-reduce", factReduce), ("fact-interpretation", interp), ("motive-sort", admit),
      ("cumulativity", cumul), ("reference-lowering", lower), ("implicit-discovery", discover),
      ("set-delta", delta), ("result-sort", inheritSort), ("instance-hypotheses", hypExact),
      ("joint-levels", joint), ("occurrence-levels", unify), ("prop-lift", propLift),
      ("phantom-sort", phantom), ("type-lift", polyLift), ("wf-obligations", wfTerm)] then
    return { base with status := "UNIVERSE_REJECTED", message := s!"configuration disabled: {disabled}" }''')
rep('let polyInterp : Except String (Array Level) := if !polyLift then',
    'let usePolyModel ← mechanismEnabled "poly-model"\n  let polyInterp : Except String (Array Level) := if !polyLift || !usePolyModel then')
rep('if polyLift then polyLvls else #[]','if polyLift && usePolyModel then polyLvls else #[]')
rep('  let base : DeclResult := { source := i.name, kind := "inductive", status := "" }',
'''  let base : DeclResult := { source := i.name, kind := "inductive", status := "" }
  if discover && !(← mechanismEnabled "implicit-discovery") then
    return ({ base with status := "DISCOVERED" }, none)
  if let some disabled ← firstDisabledMechanism [
      ("reference-lowering", lower), ("occurrence-levels", unify)] then
    return ({ base with status := "UNIVERSE_REJECTED", message := s!"configuration disabled: {disabled}" }, none)''')
rep('    let templateSort := allowTemplateSort && isTemplate &&',
    '    let allowTemplateSort := allowTemplateSort && (← mechanismEnabled "template-sort")\n    let templateSort := allowTemplateSort && isTemplate &&')
rep('    let plain := plain && !isTemplate',
    '    let useFactInterpretation ← mechanismEnabled "fact-interpretation"\n    let plain := (plain || !useFactInterpretation) && !isTemplate')
rep('    let sortInterp := plain && unify',
    '    let sortInterp := plain && unify && useFactInterpretation')
# translateSource validates config even if the input has no declarations.
rep('  let irBodies := src.decls.foldl',
    '  let _ ← disabledMechanisms\n  let irBodies := src.decls.foldl')
# Clear transformation eligibility, including closure-derived entries.
rep('  let phantomDefs := src.decls.foldl',
'''  unless (← mechanismEnabled "alias-delta") do erasingPoly := {}
  unless (← mechanismEnabled "source-compute") do computingTypes := {}
  let phantomDefs := src.decls.foldl''')
rep('  let tierLog ← IO.mkRef',
    '  let carrierSplit ← mechanismEnabled "carrier-copies"\n  let tierLog ← IO.mkRef')
rep('reuseExisting := asm?.isSome, carrierSet, decoupled, tierLog',
    'reuseExisting := asm?.isSome, carrierSet, carrierSplit, decoupled, tierLog')
rep('    let some (d\', infos) := Split.view d | translateDecl genv0 results d',
'''    unless (← mechanismEnabled "operand-split") do return ← translateDecl genv0 results d
    let some (d', infos) := Split.view d | translateDecl genv0 results d''')
(T/'Rocq2Lean/Emit.lean').write_text(s)
patch=''.join(difflib.unified_diff((B/'Rocq2Lean/Emit.lean').read_text().splitlines(True),s.splitlines(True),fromfile='a/Rocq2Lean/Emit.lean',tofile='b/Rocq2Lean/Emit.lean'))
(W/'translator.patch').write_text(patch)
(W/'RuleSet.lean').write_text(rulemod)
manifest={}
for p in sorted(B.rglob('*')):
 if p.is_file() and not any(x in p.relative_to(B).parts for x in ['.lake','_build','reports','__pycache__']) and p.suffix in {'.lean','.py','.ml','.mli','.v','.json'}:
  manifest[str(p.relative_to(B))]=hashlib.sha256(p.read_bytes()).hexdigest()
for f in ['protected_interface.json','declarations.jsonl','scope.lock.json']:
 manifest['reports/prosa_inventory/'+f]=hashlib.sha256((protected.parent/f).read_bytes()).hexdigest()
mp=W/'baseline-implementation.json'
if mp.exists():
 assert json.loads(mp.read_text())==manifest,'frozen baseline implementation changed'
else:
 mp.write_text(json.dumps(manifest,indent=2)+'\n')
print(T,flush=True)

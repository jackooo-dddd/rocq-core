#!/usr/bin/env python3
from pathlib import Path
import json,difflib,shutil,subprocess
R=Path(__file__).resolve().parents[2];B=R/'experiments/mechanical-nat-eq-20261019/translator';W=Path(__file__).resolve().parent;T=R/'.work/used-rule-coverage-20261019/translator'
W.mkdir(parents=True,exist_ok=True)
if not T.exists():
 shutil.copytree(B,T,ignore=shutil.ignore_patterns('.lake','_build','reports','__pycache__'))
 if (B/'.lake').exists():subprocess.run(['cp','-a','--reflink=auto',str(B/'.lake'),str(T/'.lake')],check=True)
 shutil.copytree(B/'reports/prosa_inventory',T/'reports/prosa_inventory')
trace="""import Lean
namespace Rocq2Lean
open Lean Meta
structure RuleTraceState where
  source : String := ""
  hits : Array (String × String) := #[]
  deriving Inhabited
initialize ruleTraceExt : EnvExtension RuleTraceState ← registerEnvExtension (pure {})
def ruleTraceBegin (name : String) : MetaM Unit :=
  modifyEnv fun e => ruleTraceExt.modifyState e fun s => { s with source := name }
/-- Recorded in the environment, hence discarded by the translator's normal rollback. -/
def ruleHit (id : String) : MetaM Unit := do
  let disabled := ((← IO.getEnv "ROCQ2LEAN_DISABLED_ITEMIZED_RULES").getD "").splitOn ","
  if disabled.contains id then throwError "disabled itemized rule: {id}"
  modifyEnv fun e => ruleTraceExt.modifyState e fun s =>
    { s with hits := s.hits.push (id, s.source) }
end Rocq2Lean
"""
(T/'Rocq2Lean/RuleTrace.lean').write_text(trace);(W/'RuleTrace.lean').write_text(trace)
s=(B/'Rocq2Lean/Translate.lean').read_text().replace('import Rocq2Lean.IR','import Rocq2Lean.IR\nimport Rocq2Lean.RuleTrace')
s=s.replace('open IR (SortIR LevelExpr AName IndRef Relevance)', 'open IR (SortIR LevelExpr AName IndRef Relevance)\n\nderiving instance BEq for IR.Term')
def rep(a,b,n=1):
 global s
 assert s.count(a)==n,(a[:100],s.count(a),n)
 s=s.replace(a,b)
rep('  return mkAppN recConst (params ++ #[motive] ++ auxM ++ minors ++ auxN ++ idx ++ #[scrut\'] ++ conv)',
'  liftMeta (ruleHit "M01")\n  return mkAppN recConst (params ++ #[motive] ++ auxM ++ minors ++ auxN ++ idx ++ #[scrut\'] ++ conv)')
rep('  return mkAppN recConst (params ++ #[motive] ++ minors ++ #[u] ++ idx ++ #[scrut\', mkApp2 (mkConst '+chr(96)*2+'Eq.refl [uLvl]) U u])',
'  liftMeta (ruleHit "M02")\n  return mkAppN recConst (params ++ #[motive] ++ minors ++ #[u] ++ idx ++ #[scrut\', mkApp2 (mkConst '+chr(96)*2+'Eq.refl [uLvl]) U u])')
# Both nonuniform match's iota branch and convoy branch are described by M02.
rep('    return ← withPath s!"iota{ci}" (withSourceLocals fields (scopes.bind fun sc => sc.2[ci]?) (trans bbody))',
'    let out ← withPath s!"iota{ci}" (withSourceLocals fields (scopes.bind fun sc => sc.2[ci]?) (trans bbody))\n    liftMeta (ruleHit "M02")\n    return out')
a='''    if res.containsFVar fv.fvarId! then
      failT "UNSUPPORTED_FEATURE" "recursive function escapes the supported call pattern"
    return res'''
b='''    if res.containsFVar fv.fvarId! then
      failT "UNSUPPORTED_FEATURE" "recursive function escapes the supported call pattern"
    liftMeta (ruleHit (if cov then "M09" else "M03"))
    if !gpos.isEmpty then liftMeta (ruleHit "M04")
    if !idx.isEmpty then liftMeta (ruleHit "M05")
    if outerCase.isNone then liftMeta (ruleHit "M06")
    if hasPattern then liftMeta (ruleHit "M12")
    return res'''
rep(a,b)
rep("  return (mkAppN ih zs', yt.getAppArgs.extract nparams yt.getAppArgs.size)","  liftMeta (ruleHit \"M05\")\n  return (mkAppN ih zs', yt.getAppArgs.extract nparams yt.getAppArgs.size)")
a='''    if res.containsFVar fv.fvarId! || res.containsFVar Rv.fvarId! then
      failT "UNSUPPORTED_FEATURE" "recursive function escapes the supported call pattern"
    return res'''
rep(a,a.replace('    return res','    liftMeta (ruleHit "M10")\n    return res'))
a='''    if res.containsFVar fv.fvarId! || res.containsFVar Rv.fvarId! then
      return ← unsup "recursive function escapes the supported call pattern"
    return res'''
rep(a,a.replace('    return res','    liftMeta (ruleHit "M11")\n    return res'))
a='''      if fvs.any (res.containsFVar ·.fvarId!) then
        failT "UNSUPPORTED_FEATURE" "recursive function escapes the supported call pattern"
      return res'''
rep(a,a.replace('      return res','''      liftMeta (ruleHit "M07")
      if !gpos.isEmpty then liftMeta (ruleHit "M04")
      if !idx.isEmpty then liftMeta (ruleHit "M05")
      if outerCases.any Option.isNone then liftMeta (ruleHit "M06")
      return res'''))
rep('    if ok then return some (mkApp (mkAppN recC (params ++ #[motive] ++ minors ++ #[v])) c)',
'''    if ok then
      ruleHit "M13"
      return some (mkApp (mkAppN recC (params ++ #[motive] ++ minors ++ #[v])) c)''')
a="  let defs := defs.map fun (n, ty, b, r) => (n, ty, inlineRecArgs bodies need b, r)"
rep(a,"  let oldDefs := defs\n"+a,2)
a="  let defs := if (← read).genv.stmtMode then defs.map fun (n, ty, b, r) => (n, ty, b.zetaFixLets 0 defs.size, r) else defs"
rep(a,a+"\n  if defs != oldDefs then liftMeta (ruleHit \"M08\")",2)
(T/'Rocq2Lean/Translate.lean').write_text(s)
e=(B/'Rocq2Lean/Emit.lean').read_text()
for var,kind in [('c','constant'),('i','inductive')]:
 a='  let base : DeclResult := { source := '+var+'.name, kind := "'+kind+'", status := "" }'
 assert e.count(a)==1
 e=e.replace(a,a+'\n  ruleTraceBegin '+var+'.name')
# Normal failure statuses do not always restore Meta state. Discard their trace explicitly.
for start,end,accepted in [('def processConstant (','def processInductive (','r.accepted'),
                            ('def processInductive (','partial def levelJson','r.1.accepted')]:
 a=e.index(start);b=e.index(end,a+len(start));part=e[a:b]
 assert part.count('  let t0 ← IO.monoMsNow')==1
 part=part.replace('  let t0 ← IO.monoMsNow','  let traceBefore := ruleTraceExt.getState (← getEnv)\n  let t0 ← IO.monoMsNow')
 assert part.count('  return r\n')==1
 part=part.replace('  return r\n','  unless '+accepted+' do\n    modifyEnv fun env => ruleTraceExt.modifyState env fun _ => traceBefore\n  return r\n')
 e=e[:a]+part+e[b:]
(T/'Rocq2Lean/Emit.lean').write_text(e)
c=(B/'Rocq2Lean/Command.lean').read_text()
a='  IO.FS.writeFile repPath (report.pretty ++ "\\n")'
assert c.count(a)==1
c=c.replace(a,a+'''
  let hits := (ruleTraceExt.getState (← getEnv)).hits
  IO.FS.writeFile ((System.FilePath.mk repPath).withFileName "rule_hits.json")
    ((toJson hits).pretty ++ "\\n")''')
(T/'Rocq2Lean/Command.lean').write_text(c)
patch=''
for name in ['Translate','Emit','Command']:
 f='Rocq2Lean/'+name+'.lean'
 patch+=''.join(difflib.unified_diff((B/f).read_text().splitlines(True),(T/f).read_text().splitlines(True),fromfile='a/'+f,tofile='b/'+f,n=0))
(W/'translator.patch').write_text(patch)
print('Prepared',T)

p=T/'lakefile.lean';p.write_text((B/'lakefile.lean').read_text().replace('#["-j", "4"]', '#["-j", "1"]'))

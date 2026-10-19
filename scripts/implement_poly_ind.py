from pathlib import Path
R=Path(__file__).resolve().parents[1];T=R/'translator'
def edit(path,changes):
 p=T/path;s=p.read_text()
 for old,new,count in changes:
  assert s.count(old)==count,(path,old[:80],s.count(old),count)
  s=s.replace(old,new)
 p.write_text(s)
edit('Rocq2Lean/Translate.lean',[
('  nonUniform : Nat := 0\n','  nonUniform : Nat := 0\n  /-- R6-I: explicit source universe variables preceding generalized global levels. -/\n  polyParams : Nat := 0\n',1),
('''  unless u.isEmpty do
    failT "UNSUPPORTED_FEATURE" s!"non-empty universe instance on {mind} (pilot supports monomorphic references only)"
  match t.univ with''','''  unless u.size == t.polyParams do
    failT "EXPORT_VALIDATION_FAILED" s!"universe instance on {mind} has {u.size} levels; expected {t.polyParams}"
  let explicitLevels ← u.toList.mapM transInstLevel
  let globals ← match t.univ with''',1),
('''      failT "UNSUPPORTED_FEATURE" s!"{mind} used with fewer than {k + 1} arguments: its universe is undetermined"

/-- R5:''','''      failT "UNSUPPORTED_FEATURE" s!"{mind} used with fewer than {k + 1} arguments: its universe is undetermined"
  return explicitLevels ++ globals

/-- R5:''',1)])
# Indent the match body now nested under `let globals <- match`.
p=T/'Rocq2Lean/Translate.lean';s=p.read_text();a=s.index('  let globals ← match t.univ with');b=s.index('  return explicitLevels ++ globals',a);chunk=s[a:b].splitlines(True);s=s[:a]+chunk[0]+''.join('  '+x for x in chunk[1:])+s[b:];p.write_text(s)
p=T/'Rocq2Lean/Emit.lean';s=p.read_text();a=s.index('  generateInductive (base :');b=s.index('\n',s.index('    | .rejected msg => return ({ base with status := "KERNEL_REJECTED", message := msg }, none)',a));chunk=s[a:b]
changes=[
('    if let .polymorphic .. := i.universes then return unsupported "universe-polymorphic inductive"','''    -- R6-I: use the same explicit universe-variable mapping as constants. The
    -- kernel checks the generated inductive for every target universe instance.
    let polyNames : List Name := match i.universes with
      | .polymorphic names _ => (List.range names.size).map polyParamName
      | _ => []
    let polyLvls : Array Level := (polyNames.map Level.param).toArray''',1),
('let lparams := globals.toList.map levelParamName','let lparams := polyNames ++ globals.toList.map levelParamName',2),
('(transClosed body.type)) gl (lowerShared := lower)','(transClosed body.type)) gl (polyLevels := polyLvls) (lowerShared := lower)',1),
('(rsMinimalFor genv i rsOwn) genv.decoupled) with','(rsMinimalFor genv i rsOwn) genv.decoupled) (polyLevels := polyLvls) with',1),
('{ genv, globalLevels := gl, lowerShared := lower, hyps := hypsRef?, sharedFresh := sharedRef? }','{ genv, globalLevels := gl, polyLevels := polyLvls, lowerShared := lower, hyps := hypsRef?, sharedFresh := sharedRef? }',1),
('let univ := if lparams.isEmpty then UnivRule.mono else .params lparams.length isTemplate','let univ := if globals.isEmpty then UnivRule.mono else .params globals.size isTemplate',1),
('templateLevelIdx := (List.range globals.size).toArray.filter','polyParams := polyNames.length,\n                               templateLevelIdx := (List.range globals.size).toArray.filter',1),
('levelParams := lparams, paramLevels := globals, isTemplate, templateParams,','levelParams := lparams, paramLevels := globals, polyParams := polyNames.length, isTemplate, templateParams,',1)]
for old,new,c in changes:
 assert chunk.count(old)==c,(old,chunk.count(old));chunk=chunk.replace(old,new)
s=s[:a]+chunk+s[b:]
old='''              genv := { genv with constGlobals := genv.constGlobals.insert n r.paramLevels }
            -- R3G-F: the type's result-sort-only levels''';new='''              genv := { genv with constGlobals := genv.constGlobals.insert n r.paramLevels }
              if r.polyParams > 0 then
                genv := { genv with polyByTarget := genv.polyByTarget.insert n r.polyParams }
            -- R3G-F: the type's result-sort-only levels''';assert s.count(old)==1;s=s.replace(old,new);p.write_text(s)
edit('tools/audit.py',[
('''        if k == "ind":
            name, _, univ = self.ind_target(t["ind"])
            return name, univ
        if k == "construct":
            _, ctors, univ = self.ind_target(t["ind"])
            return ctors[t["c"]], univ''','''        if k in ("ind", "construct"):
            name, ctors, univ = self.ind_target(t["ind"])
            mind = t["ind"]["mind"]
            if mind not in BOOTSTRAP:
                row = self.ok.get(mind) or self.pending_inds.get(mind)
                kp = poly_count(self.decls[mind], row)
                if len(t["u"]) != kp:
                    raise Mismatch(f"inductive universe instance length differs from source declaration: {mind}")
                if kp:
                    univ = ("poly", kp, kp + len(ind_params(self.decls[mind], row)[0]), t["u"])
            return (name if k == "ind" else ctors[t["c"]]), univ''',1),
('''                    gen[n_] = params_
    # R3G-F:''','''                    gen[n_] = params_
                    poly[n_] = poly_count(d_, r_)
    # R3G-F:''',1),
('''                want_lp = [level_param(g) for g in params0]
                if r.get("level_params", []) != want_lp:''','''                want_lp = [poly_param(i) for i in range(poly_count(d, r))] + [level_param(g) for g in params0]
                if r.get("level_params", []) != want_lp:''',2)])
print('R6-I candidate written')

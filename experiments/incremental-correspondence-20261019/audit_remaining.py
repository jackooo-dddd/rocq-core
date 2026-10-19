"""Inspect the outstanding roots in their actual module environments."""
from pathlib import Path
import sys,subprocess,json,csv,hashlib,collections
W=Path(__file__).resolve().parent;R=W.parents[1]
M=R/'experiments/mechanical-nat-eq-20261019';T=M/'translator'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
profiles={'Classes/CMorphisms':'CMorphismData','Classes/CRelationClasses':'CRelationOrder','Program/Wf':'ProgramWellFounded','ssr/ssrbool':'SSRPredicatePackages','ssr/ssreflect_rw':'SSRRewriteData','ssr/ssrfun':'SSRFunOpacity'}
rows=[r for r in csv.DictReader((W/'reports/CORELIB_LEDGER.csv').open()) if r['bridge_status'] not in {'TYPE_ISO','OPERATION_CORRESPONDENCE','STATEMENT_FULL_NATIVE'}]
lean=r'''
open Lean Meta Elab Command
private def kind (ci : ConstantInfo) : String :=
  match ci with
  | .defnInfo _ => "def"
  | .opaqueInfo _ => "opaque"
  | .thmInfo _ => "theorem"
  | .axiomInfo _ => "axiom"
  | _ => "other"
private partial def firstOpaque (n : Name) (seen : NameSet := {}) : MetaM (Array Name) := do
  if seen.contains n then return #[]
  let ci ← getConstInfo n
  if kind ci == "opaque" || kind ci == "axiom" then return #[n]
  let some body := ci.value? | return #[]
  let mut found := #[]
  for d in body.getUsedConstants do
    if d.toString.startsWith "Rocq." || d.toString.startsWith "RocqPending." then
      found := found ++ (← firstOpaque d (seen.insert n))
  return found
run_cmd liftTermElabM do
  for s in NAMES do
    let n := s.toName
    let ci ← getConstInfo n
    let frontier ← firstOpaque n
    let ty ← ppExpr ci.type
    let body? := ci.value? true
    let refs := body?.map (fun b => b.getUsedConstants.map (fun x => Json.str x.toString)) |>.getD #[]
    logInfo ("ROOT_AUDIT " ++ (Json.mkObj [
      ("target",.str s),("kind",.str (kind ci)),
      ("is_prop",.bool (← isProp ci.type)),("body_retained",.bool body?.isSome),
      ("type",.str ty.pretty),("body_refs",.arr refs),
      ("first_opaque",.arr (frontier.map (fun n => .str n.toString)))
    ]).compress)
'''
results=[]
for module,profile in profiles.items():
 selected=[r for r in rows if r['module']=='Corelib.'+module.replace('/','.')]
 src=W/'.work'/('InspectRemaining_'+profile+'.lean')
 src.write_text('import '+profile+'\nset_option pp.universes true\n'+lean.replace('NAMES',json.dumps([r['target'] for r in selected])))
 env=cli.lean_env();env['LEAN_PATH']=':'.join(map(str,[W/'.work',R/'experiments/mechanical-correspondence-20261019',M/'runs/full-v1/Corelib'/module/'lean',T/'.lake/build/lib/lean']))
 p=subprocess.run([str(Path.home()/'.elan/bin/lean'),*cli.native_args(),str(src)],cwd=W,env=env,capture_output=True,text=True)
 (W/'.work'/('remaining-'+profile+'.log')).write_text(p.stdout+p.stderr)
 assert p.returncode==0,(profile,p.stdout,p.stderr)
 parsed=[json.loads(x.split('ROOT_AUDIT ',1)[1]) for x in p.stdout.splitlines() if 'ROOT_AUDIT ' in x]
 assert len(parsed)==len(selected)
 for r,j in zip(selected,parsed):
  assert r['target']==j['target'];j.update(source=r['source'],module=r['module'],bridge_status=r['bridge_status'])
  j['first_opaque']=sorted(set(j['first_opaque']))
  results.append(j)
 print(module,len(parsed),dict(collections.Counter(x['kind'] for x in parsed)))
out={'scope':'Current incomplete frozen-baseline roots; metadata inspection, not proof of non-correspondence. Retained opaque bodies do not provide unfolding equations for the opaque constants.','ledger_sha256':hashlib.sha256((W/'reports/CORELIB_LEDGER.csv').read_bytes()).hexdigest(),'roots':results}
(W/'reports/REMAINING_BODY_AUDIT.json').write_text(json.dumps(out,ensure_ascii=False,indent=2)+'\n')
print('total',len(results),'kinds',dict(collections.Counter(x['kind'] for x in results)),'Prop',sum(x['is_prop'] for x in results))

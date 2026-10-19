from pathlib import Path
import sys,subprocess,json,time,os,hashlib
W=Path(__file__).resolve().parents[1];R=W.parents[1]
T=R/'experiments/mechanical-nat-eq-20261019/translator'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
D=W/'reports/interop/all';P=W/'.work/interop'
rows=json.loads((D/'validation.json').read_text())
assert rows and all(r['exit']==0 for r in rows)
certs=json.loads((D.parent/'coverage-manifest.json').read_text())
packs=[json.loads((D/(r['profile']+'.json')).read_text()) for r in rows]
roots=[n['target'] for p in packs for n in p['roots']]
tick=chr(96)
src=P/'ImportAll.lean'
code='\n'.join('import '+r['profile'] for r in rows)+'\nimport Mathlib.Data.Nat.Prime.Basic\nset_option maxHeartbeats 12000000\nopen Lean in\nrun_cmd Lean.Elab.Command.liftTermElabM do\n'
code+='  let env ← getEnv\n'
code+='  for n in env.header.moduleNames do\n'
code+='    if (#['+', '.join(tick+n for n in ['Rocq2LeanOut']+[r['source_profile'] for r in rows])+'] : Array Name).contains n then throwError "Conflicting original import {n}"\n'
code+='  for n in (#['+', '.join(tick+n for n in roots)+'] : Array Name) do\n'
code+='    unless env.contains n do throwError "Missing certificate {n}"\n'
code+='    for ax in (← collectAxioms n) do\n'
code+='      unless ['+tick+'propext,'+tick+'Quot.sound,'+tick+'Classical.choice].contains ax do throwError "Unexpected axiom {ax}"\n'
src.write_text(code)
packages=Path(os.environ.get('CORRESPONDENCE_MATHLIB_PACKAGES',str(Path.home()/'research/leanbuddy-work/lean-prosa-v06-master/.lake/packages')))
libs=[p/'.lake/build/lib/lean' for p in packages.iterdir() if (p/'.lake/build/lib/lean').exists()]
env=cli.lean_env();env['LEAN_PATH']=':'.join(map(str,[P,T/'.lake/build/lib/lean',*libs]))
start=time.time()
with (D/'import-all.log').open('w') as log:
 p=subprocess.run([str(Path.home()/'.elan/bin/lean'),*cli.native_args(),'-o',str(src.with_suffix('.olean')),str(src)],cwd=W,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300)
row=dict(exit=p.returncode,seconds=round(time.time()-start,3),profiles=len(rows),coverage_certificates=len(certs),reexported_roots=len(roots),copied_constants=sum(p['copied_constants'] for p in packs),original_profile_search_paths=False,manifest_sha256=hashlib.sha256((D.parent/'coverage-manifest.json').read_bytes()).hexdigest(),packer_sha256=hashlib.sha256((W/'interop/ProfilePack.lean').read_bytes()).hexdigest(),source_sha256=hashlib.sha256(src.read_bytes()).hexdigest())
(D/'import-all-validation.json').write_text(json.dumps(row,indent=2))
print(row);sys.exit(p.returncode)

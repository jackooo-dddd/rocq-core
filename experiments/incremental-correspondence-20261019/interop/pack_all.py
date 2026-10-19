from pathlib import Path
import os,sys,subprocess,json,time,hashlib,collections
W=Path(__file__).resolve().parents[1];R=W.parents[1]
B=R/'experiments/mechanical-correspondence-20261019'
T=R/'experiments/mechanical-nat-eq-20261019/translator'
M=R/'experiments/mechanical-nat-eq-20261019/runs/full-v1/Corelib'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
D=W/'reports/interop/all';D.mkdir(parents=True,exist_ok=True)
P=W/'.work/interop';P.mkdir(parents=True,exist_ok=True)
env=cli.lean_env();env['LEAN_PATH']=str(T/'.lake/build/lib/lean')
with (D/'tool.log').open('w') as log:
 p=subprocess.run([str(Path.home()/'.elan/bin/lean'),*cli.native_args(),'-o',str(P/'ProfilePack.olean'),str(W/'interop/ProfilePack.lean')],cwd=W,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300)
if p.returncode:sys.exit(p.returncode)
validation={r['profile']:r for r in json.loads((W/'reports/validation.json').read_text())}
specs=json.loads((W/'reports/certificates.json').read_text())
groups=collections.defaultdict(set)
for sp in specs:
 for field in ['certificate','original_statement_proof','closed_wrapper']:
  if sp.get(field):groups[sp['profile']].add(sp[field])
selected=set(sys.argv[1:]) or set(groups)
assert selected <= set(groups)
previous=json.loads((D/'validation.json').read_text()) if (D/'validation.json').exists() else []
results=[r for r in previous if r['source_profile'] not in selected]
for r in results:
 assert r['exit']==0
 assert r['source_sha256']==hashlib.sha256((W/'proofs'/(r['source_profile']+'.lean')).read_bytes()).hexdigest()
 assert r['packer_sha256']==hashlib.sha256((W/'interop/ProfilePack.lean').read_bytes()).hexdigest()
 report=json.loads((D/(r['profile']+'.json')).read_text())
 assert {x['source'] for x in report['roots']}==groups[r['source_profile']]
 assert (P/(r['profile']+'.olean')).exists()
for profile,roots in groups.items():
 if profile not in selected:continue
 v=validation[profile]
 sha=hashlib.sha256((W/'proofs'/(profile+'.lean')).read_bytes()).hexdigest()
 assert v['exit']==0 and sha==v['proof_sha256']
 output='PackedAll_'+profile
 report=D/(output+'.json');report.unlink(missing_ok=True)
 src=P/(output+'.lean');src.with_suffix('.olean').unlink(missing_ok=True)
 tick=chr(96)
 roots=sorted(roots)
 extra_imports={'WordOperations':['Init.Data.BitVec.Lemmas'],'BinaryPositiveSqrt':['Init.Data.Nat.Sqrt.Lemmas'],'BinarySqrtRem':['Init.Data.Nat.Sqrt.Lemmas'],'BinaryDivision':['Init.Data.Nat.Log2'],'NumericMathlib':['Mathlib.Data.Nat.Digits.Defs'],'BinaryIntBitwise':['Mathlib.Data.Int.Bitwise'],'NatIterators':['Init.Data.Nat.Sqrt.Lemmas','Init.Data.Nat.Lemmas']}.get(profile,[])
 src.write_text(''.join('import '+m+'\n' for m in extra_imports)+'import ProfilePack\nset_option maxRecDepth 16384\nset_option maxHeartbeats 12000000\nopen Lean in\nrun_cmd Lean.Elab.Command.liftTermElabM do\n  ProfilePack.pack '+tick+profile+' '+tick+output+' #['+', '.join(tick+n for n in roots)+'] '+json.dumps(str(report))+'\n')
 env=cli.lean_env();env['LEAN_PATH']=':'.join(map(str,[P,W/'.work',B,M/v['module']/'lean',T/'.lake/build/lib/lean']))
 if any(m.startswith('Mathlib.') for m in extra_imports):
  packages=Path(os.environ.get('CORRESPONDENCE_MATHLIB_PACKAGES',str(Path.home()/'research/leanbuddy-work/lean-prosa-v06-master/.lake/packages')))
  assert (packages/'mathlib/lean-toolchain').read_text().strip()=='leanprover/lean4:v4.33.1'
  env['LEAN_PATH']+=':'+':'.join(str(p/'.lake/build/lib/lean') for p in packages.iterdir() if (p/'.lake/build/lib/lean').exists())
 start=time.time()
 with (D/(output+'.log')).open('w') as log:
  try:
   p=subprocess.run([str(Path.home()/'.elan/bin/lean'),*cli.native_args(),'-o',str(src.with_suffix('.olean')),str(src)],cwd=W,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300)
   rc=p.returncode
  except subprocess.TimeoutExpired:rc=124
 row=dict(extra_imports=extra_imports,profile=output,source_profile=profile,module=v['module'],root_certificates=len(roots),exit=rc,seconds=round(time.time()-start,3),source_sha256=sha,packer_sha256=hashlib.sha256((W/'interop/ProfilePack.lean').read_bytes()).hexdigest())
 results.append(row);print(row,flush=True)
 (D/'validation.json').write_text(json.dumps(results,indent=2))
assert {r['source_profile'] for r in results}==set(groups)
if all(r['exit']==0 for r in results):
 (D.parent/'coverage-manifest.json').write_bytes((W/'reports/certificates.json').read_bytes())
print('PASS' if all(r['exit']==0 for r in results) else 'FAIL',flush=True)
sys.exit(0 if all(r['exit']==0 for r in results) else 1)

"""Join all rechecked old certificates and the 80 new transparent correspondences."""
from pathlib import Path
import os,sys,json,csv,subprocess,time,hashlib,collections
D=Path(__file__).resolve().parent;W=D.parent;R=W.parents[1];P=W/'.work/transparent-data';O=P/'regression';J=D/'reports/regression'
T=R/'experiments/mechanical-nat-eq-20261019/translator';B=R/'experiments/mechanical-correspondence-20261019'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
jobs=json.loads((J/'manifest.json').read_text())
validation={r['key']:r for r in json.loads((J/'validation.json').read_text())}
assert set(validation)=={j['key'] for j in jobs},'Regression is incomplete'
copied=[];packs={}
for j in jobs:
 r=validation[j['key']]
 assert r['exit']==0,(j['key'],r['exit'])
 assert r['source_sha256']==sha(Path(j['source_path']))
 assert r['exporter_sha256']==sha(D/'TransparentPack.lean')
 original=(W/'.work' if j['key'].startswith('Existing_') else B)/(j['source_profile']+'.olean')
 assert r['original_olean_sha256']==sha(original)
 assert r['output_olean_sha256']==sha(O/(r['output']+'.olean'))
 pack=json.loads((J/(j['key']+'.json')).read_text());packs[j['key']]={x['source']:x['target'] for x in pack['roots']}
 assert set(packs[j['key']])==set(j['roots'])
 copied.extend(pack['roots'])
variant=json.loads((D/'certificates.json').read_text())
summary=json.loads((D/'reports/summary.json').read_text())
assert summary['computational_variant_new_root_correspondences']==80 and summary['coimport_exit']==0
for profile in {r['profile'] for r in variant}:
 v=json.loads((D/'reports'/(profile+'-validation.json')).read_text())
 assert v['exit']==0 and v['source_sha256']==sha(D/(profile+'.lean'))
 assert v['data_olean_sha256']==sha(P/('Data'+profile+'.olean'))
 assert v['auditor_sha256']==sha(D/'Audit.lean')
for module in ['Consumer','Composition']:
 consumer=json.loads((D/('reports/'+module.lower()+'-validation.json')).read_text())
 assert consumer['exit']==0 and consumer['source_sha256']==sha(D/(module+'.lean'))
roots=[r['target'] for r in copied]+[r['certificate'] for r in variant]
src=O/'CombinedTransparent.lean'
imports=[r['output'] for r in validation.values()]+sorted({r['profile'] for r in variant})+['Consumer','Composition']
code=''.join('import '+n+'\n' for n in imports)
code+='set_option maxRecDepth 16384\nset_option maxHeartbeats 24000000\nopen Lean in\nrun_cmd Lean.Elab.Command.liftTermElabM do\n  let env ← getEnv\n  if env.header.moduleNames.contains "Rocq2LeanOut".toName then throwError "Original mechanical environment imported"\n  for (n,_) in env.constants.toList do\n    if n.toString.startsWith "Rocq." || n.toString.startsWith "RocqPending." then throwError "Unnamespaced source constant {n}"\n'
code+='  for n in (#['+', '.join(json.dumps(n)+'.toName' for n in roots)+'] : Array Name) do\n    unless env.contains n do throwError "Missing certificate {n}"\n    for ax in (← collectAxioms n) do\n      unless ["propext","Quot.sound","Classical.choice"].contains ax.toString do throwError "Unexpected axiom {ax}"\n'
src.write_text(code)
packages=Path(os.environ.get('CORRESPONDENCE_MATHLIB_PACKAGES',str(Path.home()/'research/leanbuddy-work/lean-prosa-v06-master/.lake/packages')))
env=cli.lean_env();env['LEAN_PATH']=':'.join(map(str,[O,P,T/'.lake/build/lib/lean']))+':'+':'.join(str(p/'.lake/build/lib/lean') for p in packages.iterdir() if (p/'.lake/build/lib/lean').exists())
start=time.time()
with (O/'coimport.log').open('w') as log:
 a=subprocess.run([str(Path.home()/'.elan/bin/lean'),*cli.native_args(),'-o',str(src.with_suffix('.olean')),str(src)],cwd=W,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=600)
assert a.returncode==0,(O/'coimport.log').read_text()[-8000:]
ledger=list(csv.DictReader((W/'reports/CORELIB_LEDGER.csv').open()))
baseline={r['source']:r for r in csv.DictReader((B/'reports/CORELIB_LEDGER.csv').open())}
specs=json.loads((W/'reports/certificates.json').read_text())
vmap={r['source']:r for r in variant};by_source=collections.defaultdict(list)
for j in jobs:
 for s in j['sources']:by_source[s].append(j)
out=[]
for r in ledger:
 s=r['source']
 if s in vmap:
  v=vmap[s]
  evidence=[dict(profile=v['profile'],certificate=v['certificate'],native_target=v['native_target'],scope=v['scope'])]
  kind=v['kind'];origin='NEW_TRANSPARENT_PROOF'
 else:
  evidence=[]
  for j in by_source[s]:
   if j['key'].startswith('Existing_'):
    names=[sp['certificate'] for sp in specs if sp['source']==s and sp['profile']==j['source_profile']]
   else:
    b=baseline[s];names=[b['statement_certificate']] if r['bridge_status']=='STATEMENT_FULL_NATIVE' else b['bridge_certificates'].split(';')
   for n in names:
    assert n in packs[j['key']],(s,n,j['key'])
    evidence.append(dict(profile=j['key'],certificate=packs[j['key']][n],original_certificate=n))
  assert evidence,s
  kind=r['bridge_status'];origin='RECHECKED_EXISTING_PROOF'
 out.append(dict(source=s,module=r['module'],variant_status=kind,original_frozen_status=r['bridge_status'],evidence_origin=origin,evidence=evidence))
assert len(out)==len({r['source'] for r in out})==2180
assert len(vmap)==80 and len(by_source)==2100 and not(set(vmap)&set(by_source))
(D/'reports/FULL_VARIANT_LEDGER.json').write_text(json.dumps(out,ensure_ascii=False,indent=2)+'\n')
result=dict(total_roots=2180,variant_covered_roots=len(out),variant_remaining_roots=0,frozen_baseline_covered_roots=2100,
 frozen_baseline_remaining_roots=80,existing_roots_rechecked=2100,new_transparent_proofs=80,
 categories=dict(collections.Counter(r['variant_status'] for r in out)),existing_profiles=len(jobs),
 new_profiles=len({r['profile'] for r in variant}),coimport_exit=0,coimport_seconds=round(time.time()-start,3),
 reexported_existing_roots=len(copied),copied_existing_constants=sum(r['copied_constants'] for r in validation.values()),
 original_profile_search_paths=False,original_mechanical_module_imported=False,
 standard_axioms_only=True,consumer_examples_checked=True,cross_profile_composition_checked=True,
 ledger_sha256=sha(W/'reports/CORELIB_LEDGER.csv'),exporter_sha256=sha(D/'TransparentPack.lean'),
 scope='Per-root correspondence for the computationally transparent variant, retaining each certificate scope. Statement iff is not a proof of the source theorem. No equality to the original opaque constants is claimed.')
(D/'reports/FULL_VARIANT_SUMMARY.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,ensure_ascii=False),flush=True)

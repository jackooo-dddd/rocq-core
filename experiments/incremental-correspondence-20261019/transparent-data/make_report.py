from pathlib import Path
import sys,json,hashlib,subprocess,collections
D=Path(__file__).resolve().parent;W=D.parent;R=W.parents[1]
P=W/'.work/transparent-data';T=R/'experiments/mechanical-nat-eq-20261019/translator'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
specs=json.loads((D/'certificates.json').read_text())
outstanding=json.loads((W/'reports/REMAINING_BODY_AUDIT.json').read_text())['roots']
roots={r['source']:r for r in outstanding}
assert len({r['source'] for r in specs})==len(specs)
profiles=sorted({r['profile'] for r in specs})
for profile in profiles:
 v=json.loads((D/'reports'/(profile+'-validation.json')).read_text())
 e=json.loads((D/'reports'/('export-validation-'+profile+'.json')).read_text())
 assert v['exit']==0
 assert v['source_sha256']==hashlib.sha256((D/(profile+'.lean')).read_bytes()).hexdigest()
 assert v['auditor_sha256']==hashlib.sha256((D/'Audit.lean').read_bytes()).hexdigest()
 assert v['data_olean_sha256']==e['output_olean_sha256']==hashlib.sha256((P/('Data'+profile+'.olean')).read_bytes()).hexdigest()
 assert e['exporter_sha256']==hashlib.sha256((D/'TransparentPack.lean').read_bytes()).hexdigest()
 audited=json.loads((D/'reports'/(profile+'-audit.json')).read_text())['certificates']
 assert {r['certificate'] for r in audited}=={r['certificate'] for r in specs if r['profile']==profile}
 for r in audited:
  assert r['remaining_source_symbols']==[] and r['source_universes_unspecialized']
s=P/'CheckAll.lean'
s.write_text(''.join('import '+p+'\n' for p in profiles)+'\n'+''.join('#check '+r['certificate']+'\n' for r in specs))
env=cli.lean_env();env['LEAN_PATH']=str(P)+':'+str(T/'.lake/build/lib/lean')
with (D/'reports/coimport.log').open('w') as log:
 p=subprocess.run([str(Path.home()/'.elan/bin/lean'),*cli.native_args(),str(s)],cwd=W,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300)
assert p.returncode==0
summary=dict(frozen_baseline_complete_roots=2100,frozen_baseline_total=2180,
 computational_variant_new_root_correspondences=len(specs),computational_variant_candidates=len(roots),
 computational_variant_remaining=len(roots)-len(specs),frozen_baseline_roots_added=0,
 profile_counts=dict(collections.Counter(r['profile'] for r in specs)),
 source_universes_preserved=True,native_targets_source_free=True,
 coimport_exit=0,coimport_original_profile_search_paths=False,
 variant_changes='Only source non-Prop opaque declarations become def after namespace renaming; exact translated types/bodies preserved and kernel checked.')
(D/'reports/summary.json').write_text(json.dumps(summary,indent=2)+'\n')
for r in outstanding:
 matched=[s for s in specs if s['source']==r['source']]
 r['variant_certificate']=matched[0]['certificate'] if matched else None
 r['variant_status']='PROVED_FOR_TRANSPARENT_VARIANT' if matched else 'PENDING'
(D/'reports/ROOT_LEDGER.json').write_text(json.dumps(outstanding,ensure_ascii=False,indent=2)+'\n')
print(json.dumps(summary,ensure_ascii=False))

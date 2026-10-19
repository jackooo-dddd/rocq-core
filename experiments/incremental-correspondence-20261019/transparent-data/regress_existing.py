"""Recheck all existing complete-root certificates under the transparent policy."""
from pathlib import Path
import os,sys,json,csv,collections,subprocess,time,hashlib
D=Path(__file__).resolve().parent;W=D.parent;R=W.parents[1]
T=R/'experiments/mechanical-nat-eq-20261019/translator'
M=R/'experiments/mechanical-nat-eq-20261019/runs/full-v1/Corelib'
B=R/'experiments/mechanical-correspondence-20261019'
P=W/'.work/transparent-data';O=P/'regression';O.mkdir(exist_ok=True)
J=D/'reports/regression';J.mkdir(exist_ok=True)
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
specs=json.loads((W/'reports/certificates.json').read_text())
old=json.loads((W/'reports/interop/all/validation.json').read_text())
jobs=[];covered=set()
for v in old:
 profile=v['source_profile'];roots=json.loads((W/'reports/interop/all'/(v['profile']+'.json')).read_text())['roots']
 rows=[s for s in specs if s['profile']==profile];sources=sorted({r['source'] for r in rows});covered.update(sources)
 jobs.append(dict(key='Existing_'+profile,source_profile=profile,module=v['module'],roots=sorted({r['source'] for r in roots}),
    sources=sources,extra_imports=v['extra_imports'],source_path=str(W/'proofs'/(profile+'.lean'))))
ledger=list(csv.DictReader((W/'reports/CORELIB_LEDGER.csv').open()))
baseline={r['source']:r for r in csv.DictReader((B/'reports/CORELIB_LEDGER.csv').open())}
configs=json.loads((B/'profiles.json').read_text());auto=json.loads((B/'auto/profiles.json').read_text())
statements={r['certificate']:r for r in json.loads((B/'reports/statements.json').read_text())}
groups=collections.defaultdict(list)
for r in ledger:
 if r['bridge_status'] not in ['TYPE_ISO','OPERATION_CORRESPONDENCE','STATEMENT_FULL_NATIVE'] or r['source'] in covered:continue
 b=baseline[r['source']]
 if r['bridge_status']=='STATEMENT_FULL_NATIVE':
  c=b['statement_certificate'];p=statements[c]['profile'];module=auto[p]['module'];roots=[c]
 else:
  module=r['module'].removeprefix('Corelib.').replace('.','/')
  choices=[p for p,c in configs.items() if c['module']==module]
  assert choices,(r,choices)
  p=choices[0];roots=b['bridge_certificates'].split(';')
 groups[(p,module)].append((r['source'],roots))
for (p,module),rs in groups.items():
 jobs.append(dict(key='Baseline_'+p,source_profile=p,module=module,roots=sorted({x for _,xs in rs for x in xs}),
   sources=sorted(s for s,_ in rs),extra_imports=[],source_path=str(B/(p+'.lean'))))
all_sources={s for j in jobs for s in j['sources']}
assert len(all_sources)==2100,len(all_sources)
(J/'manifest.json').write_text(json.dumps(jobs,indent=2)+'\n')
selected=set(sys.argv[1:]) or {j['key'] for j in jobs}
prev=json.loads((J/'validation.json').read_text()) if (J/'validation.json').exists() else []
results={r['key']:r for r in prev}
for j in jobs:
 key=j['key']
 if key not in selected:continue
 source_path=Path(j['source_path']);prefix='ComputationalRegression.'+key
 output='Transparent_'+key;src=O/(output+'.lean');report=J/(key+'.json')
 cached=results.get(key)
 if not sys.argv[1:] and cached and cached['exit']==0 and cached['source_sha256']==sha(source_path) and cached['exporter_sha256']==sha(D/'TransparentPack.lean') and src.with_suffix('.olean').exists() and cached['output_olean_sha256']==sha(src.with_suffix('.olean')):
  print(key,'CACHED PASS',flush=True);continue
 tick=chr(96)
 src.write_text(''.join('import '+n+'\n' for n in j['extra_imports'])+
  'import TransparentPack\nset_option maxRecDepth 16384\nset_option maxHeartbeats 12000000\nopen Lean in\nrun_cmd Lean.Elab.Command.liftTermElabM do\n  TransparentPack.pack '+
  tick+j['source_profile']+' '+tick+prefix+' #['+', '.join(tick+n for n in j['roots'])+'] '+json.dumps(str(report))+'\n')
 env=cli.lean_env();env['LEAN_PATH']=':'.join(map(str,[W/'.work',B,M/j['module']/'lean',P,O,T/'.lake/build/lib/lean']))
 if any(n.startswith('Mathlib.') for n in j['extra_imports']):
  packages=Path(os.environ.get('CORRESPONDENCE_MATHLIB_PACKAGES',str(Path.home()/'research/leanbuddy-work/lean-prosa-v06-master/.lake/packages')))
  env['LEAN_PATH']+=':'+':'.join(str(p/'.lake/build/lib/lean') for p in packages.iterdir() if (p/'.lake/build/lib/lean').exists())
 start=time.time()
 with (O/(key+'.log')).open('w') as log:
  try:
   a=subprocess.run([str(Path.home()/'.elan/bin/lean'),*cli.native_args(),'-o',str(src.with_suffix('.olean')),str(src)],cwd=W,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300)
   rc=a.returncode
  except subprocess.TimeoutExpired:rc=124
 row=dict(key=key,source_profile=j['source_profile'],output=output,prefix=prefix,exit=rc,seconds=round(time.time()-start,3),
  sources=j['sources'],source_sha256=sha(source_path),exporter_sha256=sha(D/'TransparentPack.lean'),
  original_olean_sha256=sha((W/'.work' if key.startswith('Existing_') else B)/(j['source_profile']+'.olean')))
 if rc==0:
  p=json.loads(report.read_text());row.update(reexported_roots=len(p['roots']),copied_constants=p['copied_constants'],
    opaque_values_exposed=len(p['exposed_non_prop_opaque']),output_olean_sha256=sha(src.with_suffix('.olean')))
 results[key]=row;(J/'validation.json').write_text(json.dumps(list(results.values()),indent=2)+'\n')
 print(key,'PASS' if rc==0 else 'FAIL',len(j['sources']),round(time.time()-start,2),flush=True)
 if rc:print((O/(key+'.log')).read_text()[-4000:],flush=True)
print('COMPLETE',len(results),'profiles',sum(r['exit']==0 for r in results.values()),'passed',flush=True)

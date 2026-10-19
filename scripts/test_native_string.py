#!/usr/bin/env python3
import pathlib,sys,os,json,subprocess,copy
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();O=pathlib.Path(sys.argv[2]).resolve();O.mkdir(parents=True,exist_ok=True)
os.environ['LEAN_NUM_THREADS']='4';os.environ['ROCQ2LEAN_LEAN_THREADS']='4'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
sys.path.insert(0,str(T/'tests'));from lib import structurally_rejected
fixture=T/'fixtures/corelib-native-string';cases=json.loads((fixture/'cases.json').read_text())
prefix='Corelib.Strings.PrimString.';namespace='CoreString.Ops.'
roots=[prefix+n for n in ['string','make','get','length','sub','cat','compare','max_length']]
roots += ['Corelib.Numbers.Cyclic.Int63.PrimInt63.'+n for n in ['compare','compares']]
roots += [namespace+c['name'] for c in cases]+[namespace+n for n in ['raw_bytes','empty_bytes']]
positive=O/'positive';checks={}
for label,args in [('export',['export','--mode','statement','--manifest',fixture/'source.json','--roots',','.join(roots),'--out',positive]),('translate',['translate','--input',positive/'source.ndjson','--out',positive]),('validate',['validate','--run',positive])]:
 with (O/(label+'.log')).open('w') as log:
  rc=subprocess.run([sys.executable,'-I',str(T/'tools/rocq2lean.py'),*map(str,args)],cwd=T,stdout=log,stderr=subprocess.STDOUT,timeout=900).returncode
 checks[label+'_exit']=rc;assert rc==0,(label,rc);print(label,'OK',flush=True)
report=json.loads((positive/'translation_report.json').read_text());states={r['name']:r['status'] for r in report['roots']}
assert set(states)==set(roots) and all(s=='TRANSLATED_AND_CHECKED' for s in states.values()),states
rows={r['name']:r for r in map(json.loads,(positive/'source.ndjson').read_text().splitlines()) if r.get('kind')=='constant'}
source=['import Rocq2LeanOut','set_option maxRecDepth 4096','set_option maxHeartbeats 2000000']
for c in cases:
 n=rows[namespace+c['name']]['body']
 if n['k']=='int':source.append(f"example : BitVec.toNat {c['target']} = {n['v']} := rfl")
 elif n['k']=='construct':
  rr=next(r for r in report['results'] if r['source']==n['ind']['mind']);ctor=rr['target_ctors'][n['c']]['name']
  source.append(f"example : {c['target']} = {ctor} := rfl")
 else:raise AssertionError(n)
for i,want in [(0,0),(1,128),(2,255),(3,0),(2**63-1,0)]:
 source.append(f"example : (Rocq2Lean.PrimString.get Rocq.CoreString.Ops.raw_bytes (BitVec.ofNat 63 {i})).toNat = {want} := rfl")
source.append("example : (Rocq2Lean.PrimString.length Rocq.CoreString.Ops.empty_bytes).toNat = 0 := rfl")
lean=positive/'lean';(lean/'NativeStringChecks.lean').write_text('\n'.join(source)+'\n')
env=cli.lean_env();env['LEAN_PATH']=str(T/'.lake/build/lib/lean')+':'+str(lean)
with (O/'kernel-comparison.log').open('w') as log:
 rc=subprocess.run([str(pathlib.Path.home()/'.elan/bin/lean'),*cli.native_args(),'NativeStringChecks.lean'],cwd=lean,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=600).returncode
assert rc==0,('kernel comparison',rc)
for tag in ['wrong-operation','swapped-comparison-results','wrong-signed-comparison','wrong-byte']:
 rep=copy.deepcopy(report)
 root=prefix+'get' if tag=='wrong-operation' else (namespace+'raw_bytes' if tag=='wrong-byte' else (prefix+'compare' if tag=='swapped-comparison-results' else 'Corelib.Numbers.Cyclic.Int63.PrimInt63.compares'))
 row=next(r for r in rep['results'] if r['source']==root);v=row['target_value']
 if tag=='wrong-operation':v['n']='Rocq2Lean.PrimString.length'
 elif tag=='swapped-comparison-results':v=v['b']['b'];v['f']['a'],v['f']['f']['f']['a']=v['f']['f']['f']['a'],v['f']['a']
 elif tag=='wrong-signed-comparison':v['b']['b']['a']['f']['f']['f']['n']='Rocq2Lean.PrimInt63.compare'
 else:v['a']['a']['f']['a']['a']['v']=0
 assert structurally_rejected(positive,rep,'native-string-'+tag,root),tag
 checks[tag]='STRUCTURALLY_REJECTED'
for tag in ['wrong-string-bound','wrong-comparison-roles']:
 original=[json.loads(l) for l in (positive/'source.ndjson').read_text().splitlines()]
 for d in original:
  if tag=='wrong-string-bound' and d.get('name')==prefix+'string':d['native']['string_max_length']='16777212'
  if tag=='wrong-comparison-roles' and d.get('name')==prefix+'compare':
   roles=d['native']['primitive_signature']['comparison_constructors'];roles['lt'],roles['gt']=roles['gt'],roles['lt']
 src=O/(tag+'.ndjson');src.write_text(''.join(json.dumps(r)+'\n' for r in original))
 with (O/(tag+'.log')).open('w') as log:
  rc=subprocess.run([sys.executable,'-I',str(T/'tools/roundtrip.py'),str(src),str(O/tag),'-Q',str(fixture),'CoreString','--','CoreString.Ops'],env=cli.opam_env(),stdout=log,stderr=subprocess.STDOUT,timeout=600).returncode
 rep=json.loads((O/tag/'roundtrip.json').read_text())
 assert rc!=0 and rep['status']=='EXPORT_VALIDATION_FAILED' and any('native metadata differs' in p for p in rep['problems']),rep
 checks[tag]='SOURCE_REJECTED'
checks.update(status='PASS',source_kernel_vs_target_kernel_cases=len(cases),literal_kernel_cases=6,all_roots_checked=len(states),bound=16777211)
(O/'result.json').write_text(json.dumps(checks,indent=2)+'\n');print(json.dumps(checks))

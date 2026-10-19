#!/usr/bin/env python3
"""Compare native source kernel reduction with translated operations in Lean's kernel."""
import pathlib,sys,os,json,subprocess
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();O=pathlib.Path(sys.argv[2]).resolve();O.mkdir(parents=True,exist_ok=True)
os.environ['LEAN_NUM_THREADS']='4';os.environ['ROCQ2LEAN_LEAN_THREADS']='4';sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
fixture=pathlib.Path(sys.argv[3]).resolve() if len(sys.argv)>3 else R/'translator/fixtures/corelib-int63-ops';cases=json.loads((fixture/'cases.json').read_text())
namespace=json.loads((fixture/'source.json').read_text())['requires'][0]
ops=list(dict.fromkeys(c['op'] for c in cases));prefix='Corelib.Numbers.Cyclic.Int63.PrimInt63.'
roots=[prefix+op for op in ops]+[namespace+'.'+c['name'] for c in cases]
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
 n=rows[namespace+'.'+c['name']]['body']
 args=c['args'] if 'args' in c else [c['x'],c['y']]
 application=f"Rocq.{prefix}{c['op']} "+' '.join(f"(BitVec.ofNat 63 {a})" for a in args)
 if n['k']=='int':
  source.append(f"example : BitVec.toNat ({application}) = {n['v']} := rfl")
 elif n['k']=='construct':
  rr=next(r for r in report['results'] if r['source']==n['ind']['mind'])
  ctor=rr['target_ctors'][n['c']]['name']
  source.append(f"example : ({application}) = {ctor} := rfl")
 else:raise AssertionError(('unexpected source result',n))
lean=positive/'lean';(lean/'NativeOperationChecks.lean').write_text('\n'.join(source)+'\n')
env=cli.lean_env();env['LEAN_PATH']=str(T/'.lake/build/lib/lean')+':'+str(lean)
with (O/'kernel-comparison.log').open('w') as log:
 rc=subprocess.run([str(pathlib.Path.home()/'.elan/bin/lean'),*cli.native_args(),'NativeOperationChecks.lean'],cwd=lean,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=600).returncode
assert rc==0,('kernel comparison',rc)
checks.update(status='PASS',native_operations=ops,source_kernel_vs_target_kernel_cases=len(cases),all_roots_checked=len(states),fixture=str(fixture),includes=['boundary-values','high-bit','zero-operands','deterministic-random'])
(O/'result.json').write_text(json.dumps(checks,indent=2)+'\n');print(json.dumps(checks))

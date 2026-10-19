from pathlib import Path
import sys,subprocess,json,time,hashlib
D=Path(__file__).resolve().parent;W=D.parent;R=W.parents[1]
T=R/'experiments/mechanical-nat-eq-20261019/translator'
P=W/'.work/transparent-data'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
env=cli.lean_env();env['LEAN_PATH']=str(P)+':'+str(T/'.lake/build/lib/lean')
def run(src,out,log):
 with log.open('w') as f:
  p=subprocess.run([str(Path.home()/'.elan/bin/lean'),*cli.native_args(),'-o',str(out),str(src)],cwd=W,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=300)
 if p.returncode:print(log.read_text());raise SystemExit(p.returncode)
run(D/'Audit.lean',P/'Audit.olean',D/'reports/auditor.log')
rows=json.loads((D/'certificates.json').read_text())
source_targets={r['source']:r['target'] for r in json.loads((W/'reports/REMAINING_BODY_AUDIT.json').read_text())['roots']}
for profile in sys.argv[1:] or sorted({r['profile'] for r in rows}):
 specs=[r for r in rows if r['profile']==profile]
 src=D/(profile+'.lean');start=time.time()
 run(src,P/(profile+'.olean'),D/'reports'/(profile+'-compile.log'))
 generated=P/('Check'+profile+'.lean')
 entries=', '.join('('+','.join(chr(96)+n for n in ['Computational.'+profile+'.'+source_targets[r['source']],r['certificate'],r['native_target']])+')' for r in specs)
 generated.write_text('import '+profile+'\nimport Audit\nset_option pp.universes true\nset_option maxRecDepth 16384\nopen Lean in\nrun_cmd Lean.Elab.Command.liftTermElabM do\n  TransparentAudit.check #['+entries+'] '+json.dumps(str(D/'reports'/(profile+'-audit.json')))+'\n')
 run(generated,generated.with_suffix('.olean'),D/'reports'/(profile+'-audit.log'))
 result=dict(profile=profile,exit=0,seconds=round(time.time()-start,3),variant_root_certificates=len(specs),
  frozen_baseline_roots_added=0,source_sha256=hashlib.sha256(src.read_bytes()).hexdigest(),
  data_olean_sha256=hashlib.sha256((P/('Data'+profile+'.olean')).read_bytes()).hexdigest(),
  auditor_sha256=hashlib.sha256((D/'Audit.lean').read_bytes()).hexdigest())
 (D/'reports'/(profile+'-validation.json')).write_text(json.dumps(result,indent=2)+'\n')
 print(result,flush=True)

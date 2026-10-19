from pathlib import Path
import json,subprocess,sys,copy,os
W=Path(__file__).resolve().parent;T=W/'translator';R=W.parents[1]
D=W/'runs/full-v1/Corelib/Init/Datatypes'
new=json.loads((D/'translation_report.json').read_text())
oldrows={r['source']:r for r in json.loads((W/'tests/historical-bootstrap-rows.json').read_text())}
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
env=cli.lean_env();env['LEAN_PATH']=str(D/'lean')+':'+str(T/'.lake/build/lib/lean')
results=[]
for tag,source in [('nat','Corelib.Init.Datatypes.nat'),('eq','Corelib.Init.Logic.eq')]:
 bad=copy.deepcopy(new)
 bad['results']=[oldrows[source] if r['source']==source else r for r in bad['results']]
 for r in bad['roots']:
  if r['name']==source:r['status']='BOOTSTRAP_RESOLVED'
 p=W/'tests'/('forged-'+tag+'.json');p.write_text(json.dumps(bad))
 out=W/'tests'/('rejected-'+tag+'.json')
 proc=subprocess.run([sys.executable,'-I',str(T/'tools/audit.py'),str(D/'source.ndjson'),str(D/'contract.json'),str(p),str(out),str(D/'consumer_result.json')],cwd=T,capture_output=True,text=True)
 (W/'logs'/('reject-'+tag+'.log')).write_text(proc.stdout+proc.stderr)
 report=json.loads(out.read_text()) if out.exists() else {}
 assert proc.returncode!=0 and report.get('status') not in [None,'OK'],(tag,proc.returncode,proc.stdout,proc.stderr)
 print(tag,proc.returncode,report.get('status'),str(report.get('problems',[]))[:1200],flush=True)
 lean=W/'tests'/('RejectNative-'+tag+'.lean')
 consumer=W/'tests'/('consumer-rejected-'+tag+'.json')
 lean.write_text('import Rocq2LeanOut\nimport Rocq2Lean.Verify\n#rocq2lean_verify "'+str(D/'contract.json')+'" "'+str(p)+'" "'+str(consumer)+'"\n')
 cp=subprocess.run([str(Path.home()/'.elan/bin/lean'),*cli.native_args(),str(lean)],cwd=W,env=env,capture_output=True,text=True)
 (W/'logs'/('consumer-reject-'+tag+'.log')).write_text(cp.stdout+cp.stderr)
 cr=json.loads(consumer.read_text()) if consumer.exists() else {}
 assert cp.returncode!=0 and cr.get('status') not in [None,'OK'],(tag,cp.returncode,cp.stdout,cp.stderr)
 print('consumer',tag,cp.returncode,cr.get('status'),flush=True)
 results.append({'consumer_rejected':True,'consumer_status':cr.get('status'),'source':source,'forgery':'restore historical native bootstrap mapping','exit':proc.returncode,'audit_status':report.get('status'),'rejected':True})
(W/'tests/no-bootstrap-result.json').write_text(json.dumps(results,indent=2))

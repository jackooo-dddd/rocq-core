import pathlib,sys,subprocess,json
R=pathlib.Path(__file__).resolve().parents[1];T=R/'translator';O=R/'work/tests/poly-global-before'
O.mkdir(parents=True,exist_ok=True)
for label,args in [('export',['export','--mode','statement','--manifest',R/'translator/fixtures/corelib-poly-global/source.json','--roots','CorePolyGlobal.Global.identity_global,CorePolyGlobal.Global.bounded_use,CorePolyGlobal.Global.transitive_use','--out',O]),('translate',['translate','--input',O/'source.ndjson','--out',O])]:
 with (O/(label+'.log')).open('w') as log:
  rc=subprocess.run([sys.executable,'-I',str(T/'tools/rocq2lean.py'),*map(str,args)],stdout=log,stderr=subprocess.STDOUT,timeout=600).returncode
 print(label,rc,flush=True)
 if label=='export' and rc:sys.exit(rc)
rep=json.loads((O/'translation_report.json').read_text())
print(json.dumps([{'source':r['source'],'status':r['status'],'message':r['message']} for r in rep['results']],indent=2))

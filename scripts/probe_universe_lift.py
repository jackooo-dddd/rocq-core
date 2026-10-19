#!/usr/bin/env python3
import pathlib,subprocess,sys,json,os
R=pathlib.Path(__file__).resolve().parents[1];T=R/'translator';O=R/'work/tests/universe-lift-before-protected';O.mkdir(parents=True,exist_ok=True)
os.environ['LEAN_NUM_THREADS']='4';os.environ['ROCQ2LEAN_LEAN_THREADS']='4'
roots=','.join('CoreLift.Lift.'+n for n in ['raise_type','raise_value','lower_value','roundtrip','raise_poly','roundtrip_poly'])
exits={}
for label,args in [('export',['export','--mode','statement','--manifest',T/'fixtures/corelib-universe-lift/source.json','--roots',roots,'--out',O]),('translate',['translate','--input',O/'source.ndjson','--out',O]),('validate',['validate','--run',O])]:
 with (O/(label+'.log')).open('w') as log:
  rc=subprocess.run([sys.executable,'-I',str(T/'tools/rocq2lean.py'),*map(str,args)],cwd=T,stdout=log,stderr=subprocess.STDOUT,timeout=900).returncode
 exits[label]=rc
 if label=='export' and rc:raise RuntimeError('source fixture export failed')
rep=json.loads((O/'translation_report.json').read_text())
out={'purpose':'diagnostic baseline, not a successful translation campaign','exit_codes':exits,'roots':rep['roots'],'failures':[{k:r.get(k) for k in ['source','status','message']} for r in rep['results'] if r['status']!='TRANSLATED_AND_CHECKED']}
(O/'result.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))

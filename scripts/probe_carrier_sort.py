#!/usr/bin/env python3
import pathlib,subprocess,sys,os,json
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();O=pathlib.Path(sys.argv[2]).resolve();O.mkdir(parents=True,exist_ok=True)
os.environ['LEAN_NUM_THREADS']='4';os.environ['ROCQ2LEAN_LEAN_THREADS']='4'
roots=','.join('Corelib.Init.Logic.'+n for n in ['eq_rect','eq_rect_r','ex_rect','eq_ex_rect'])
exits={}
for label,args in [('export',['export','--mode','statement','--manifest',R/'work/fixtures/carrier-sort/source.json','--roots',roots,'--out',O]),('translate',['translate','--input',O/'source.ndjson','--out',O]),('validate',['validate','--run',O])]:
 with (O/(label+'.log')).open('w') as log:
  rc=subprocess.run([sys.executable,'-I',str(T/'tools/rocq2lean.py'),*map(str,args)],cwd=T,stdout=log,stderr=subprocess.STDOUT,timeout=900).returncode
 exits[label]=rc
 if label=='export' and rc:raise RuntimeError('source fixture export failed')
rep=json.loads((O/'translation_report.json').read_text())
out={'exit_codes':exits,'roots':rep['roots'],'failures':[{k:r.get(k) for k in ['source','status','message']} for r in rep['results'] if r['status'] not in ['TRANSLATED_AND_CHECKED','STATEMENT_KERNEL_CHECKED','BOOTSTRAP_RESOLVED','PENDING_KERNEL_CHECKED','STATEMENT_PENDING_KERNEL_CHECKED']]}
(O/'result.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))

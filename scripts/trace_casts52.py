import pathlib,subprocess,sys,shutil,os
R=pathlib.Path(__file__).resolve().parents[1];T=R/'work/snapshots/quality-main52/translator'
for m in ['CMorphisms','CRelationClasses']:
 S=R/('work/runs/quality-main52-transport/Corelib/Classes/'+m)
 O=R/('work/tests/cast-trace52/'+m);O.mkdir(parents=True)
 for f in ['source.ndjson','contract.json']:shutil.copy2(S/f,O/f)
 env=os.environ.copy();env['ROCQ2LEAN_TRACE_CASTS']='1'
 with (O/'trace.log').open('w')as log:
  rc=subprocess.run([sys.executable,'-I',str(T/'tools/rocq2lean.py'),'translate','--input',str(O/'source.ndjson'),'--out',str(O)],env=env,stdout=log,stderr=subprocess.STDOUT).returncode
 print(m,rc,flush=True)

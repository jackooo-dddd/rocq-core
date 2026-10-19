#!/usr/bin/env python3
import pathlib,subprocess,sys,os
R=pathlib.Path(__file__).resolve().parents[1];T=R/'work/snapshots/template-quality-diagnostics/translator';O=R/'work/tests/template-quality-diagnostics';O.mkdir(exist_ok=True)
env=dict(os.environ,ROCQ2LEAN_TEMPLATE_TRACE=str(O/'native-qualities.ndjson'))
roots=','.join(['Corelib.Init.Datatypes.prod','Corelib.Init.Specif.sig','Corelib.Init.Specif.sigT','Corelib.Init.Specif.sigT2'])
with(O/'export.log').open('w')as log:
 p=subprocess.run([sys.executable,'-I',str(T/'tools/rocq2lean.py'),'export','--mode','statement','--manifest',str(R/'work/fixtures/template-type/source.json'),'--roots',roots,'--out',str(O)],cwd=T,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=600)
print('EXPORT',p.returncode,flush=True);assert p.returncode==0

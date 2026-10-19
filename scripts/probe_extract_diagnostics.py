#!/usr/bin/env python3
import pathlib,sys,os,subprocess,json
R=pathlib.Path(__file__).resolve().parents[1];T=R/'work/snapshots/extract-diagnostics/translator';O=R/'work/tests/extract-diagnostics';O.mkdir(parents=True,exist_ok=True)
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
env=cli.opam_env();env['ROCQ2LEAN_EXTRACT_TRACE']=str(O)
with (O/'build.log').open('w') as log:
 rc=subprocess.run(['make','-j2'],cwd=T/'rocq/exporter',env=env,stdout=log,stderr=subprocess.STDOUT).returncode
assert rc==0,rc
(O/'Export.v').write_text('From Rocq2LeanExport Require Import Loader.\nRequire Corelib.Init.Logic Corelib.Init.Specif.\nSet Printing All.\nSet Printing Universes.\nRocq2Lean ExportStatements "'+str(O/'source.ndjson')+'" Corelib.Init.Specif.eq_sigT_rect Corelib.Init.Specif.eq_sig_rect Corelib.Init.Logic.ex_rect Corelib.Init.Logic.eq_ex_rect Corelib.Init.Logic.eq_rew_r_dep.\n')
with (O/'export.log').open('w') as log:
 rc=subprocess.run(['rocq','compile','-I',str(T/'rocq/exporter/src'),'-Q',str(T/'rocq/exporter/theories'),'Rocq2LeanExport',str(O/'Export.v')],cwd=T,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300).returncode
print('export',rc,flush=True);assert rc==0
for p in O.glob('*.constructors.json'):
 d=json.loads(p.read_text());print(d['source'],d['reason'],flush=True)

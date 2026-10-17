from pathlib import Path
import sys,json,resource,os
os.environ['LEAN_NUM_THREADS']='4'
os.environ['ROCQ2LEAN_LEAN_THREADS']='4'
BASE=Path.home()/'research/rocq-core-by-file-20261018'
ROOT=BASE/'translator'
sys.path.insert(0,str(ROOT/'tools'))
import rocq2lean as cli,contract,protection
RAW=Path.home()/'research/r2l-core-census-20261017/runs/corelib-census'
sys.path.insert(0,str(RAW))
import measure_core as m
# Force helpers to use this experiment's isolated translator and unchanged auditor.
m.ROOT=ROOT;m.cli=cli;m.contract=contract;m.protection=protection
m.ENV=cli.opam_env()
def limit():
 resource.setrlimit(resource.RLIMIT_AS,(12<<30,12<<30));resource.setrlimit(resource.RLIMIT_STACK,(8<<20,8<<20))
m.limit=limit
out=BASE/'experiments'/sys.argv[1];out.mkdir(parents=True,exist_ok=True)
old=json.loads((RAW/'basic-extended/scope.json').read_text());requested=old['requested_names'];requires=old['requires']
(out/'Export.v').write_text('From Rocq2LeanExport Require Import Loader.\n'+''.join('Require '+r+'.\n' for r in requires)+'Rocq2Lean ExportStatements "'+str(out/'source.ndjson')+'" '+' '.join(requested)+'.\n')
rc=m.run(['rocq','compile','-I',str(ROOT/'rocq/exporter/src'),'-Q',str(ROOT/'rocq/exporter/theories'),'Rocq2LeanExport','Export.v'],out,out/'export.log',m.ENV,600)
assert rc==0,rc
pre,rows=m.load_ir(out/'source.ndjson')
rt=out/'source-roundtrip';rt.mkdir(exist_ok=True)
rc=m.run([sys.executable,'-I',str(ROOT/'tools/roundtrip.py'),str(out/'source.ndjson'),str(rt),'--',*requires],ROOT,out/'roundtrip.log',m.ENV,600)
m.save(out/'contract.json',contract.build(out/'source.ndjson',requested,protection=protection.binding([d['name'] for d in rows])))
m.save(out/'scope.json',dict(old,source_roundtrip=json.loads((rt/'roundtrip.json').read_text())['status']))
m.measure(out)
assert (out/'translation_report.json').exists(), 'translation infrastructure failed'
# Preserve exactly which uncommitted patch was evaluated.
import subprocess
(out/'changes.diff').write_text(subprocess.check_output(['git','diff'],cwd=ROOT,text=True))
m.save(out/'done.json',{'status':'completed'})


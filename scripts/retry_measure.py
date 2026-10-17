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
m.measure(out)

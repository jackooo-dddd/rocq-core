#!/usr/bin/env python3
import pathlib,subprocess,sys,json,os
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/quality-dispatch4/translator"
os.environ["LEAN_NUM_THREADS"]="4";os.environ["ROCQ2LEAN_LEAN_THREADS"]="4"
def call(args,label):
 print("START",label,flush=True)
 with(R/("work/logs/"+label+".log")).open("w")as log:
  rc=subprocess.run([sys.executable,*map(str,args)],cwd=R,stdout=log,stderr=subprocess.STDOUT).returncode
 print("END",label,rc,flush=True);assert rc==0,(label,rc)
assert json.loads((R/"work/tests/quality-source-checked/result.json").read_text())["status"]=="PASS"
assert json.loads((R/"work/tests/quality-dispatch-kernel2/result.json").read_text())["status"]=="PASS"
call([R/"scripts/corelib_lab.py","--translator",T,"--out",R/"work/runs/quality-dispatch-hooks-full"],"quality-dispatch-hooks-full")
call([R/"scripts/compare_corelib_runs.py",R/"work/runs/alias-closure2-full",R/"work/runs/quality-dispatch-hooks-full","--out",R/"work/quality-dispatch-hooks-delta.json"],"quality-dispatch-hooks-delta")
d=json.loads((R/"work/quality-dispatch-hooks-delta.json").read_text())
assert not d["status_regressions"]and not d["validation_regressions"],d
call([T/"tests/statement/check_statement.py"],"quality-dispatch4-statement-suite")
print("CAMPAIGN_COMPLETE",flush=True)

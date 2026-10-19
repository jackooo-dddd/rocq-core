#!/usr/bin/env python3
import pathlib,subprocess,sys,json,os
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/result-transport6/translator"
os.environ["LEAN_NUM_THREADS"]="4";os.environ["ROCQ2LEAN_LEAN_THREADS"]="4"
def call(args,label):
 print("START",label,flush=True)
 with(R/("work/logs/"+label+".log")).open("w")as log:
  rc=subprocess.run([sys.executable,*map(str,args)],cwd=R,stdout=log,stderr=subprocess.STDOUT).returncode
 print("END",label,rc,flush=True);assert rc==0,(label,rc)
assert json.loads((R/"work/tests/quality-family-audit1/result.json").read_text())["status"]=="PASS"
call([R/"scripts/build_translator.py",T,R/"work/logs/result-transport6-build.log"],"result-transport6-build-driver")
call([R/"scripts/test_quality_source.py",T,R/"work/tests/quality-source-native4",R/"work/tests/result-transport6-quality-source"],"result-transport6-quality-source")
call([R/"scripts/test_quality_dispatch_kernel.py",T,R/"work/tests/result-transport6-quality-kernel"],"result-transport6-quality-kernel")
call([R/"scripts/test_result_transport.py",T,R/"work/tests/result-transport6-fixture"],"result-transport6-fixture")
call([R/"scripts/corelib_lab.py","--translator",T,"--out",R/"work/runs/result-transport6-full"],"result-transport6-full")
call([R/"scripts/compare_corelib_runs.py",R/"work/runs/quality-dispatch-hooks-full",R/"work/runs/result-transport6-full","--out",R/"work/result-transport6-delta.json"],"result-transport6-delta")
d=json.loads((R/"work/result-transport6-delta.json").read_text())
assert not d["status_regressions"]and not d["validation_regressions"],d
call([T/"tests/statement/check_statement.py"],"result-transport6-statement-suite")
print("CAMPAIGN_COMPLETE",flush=True)

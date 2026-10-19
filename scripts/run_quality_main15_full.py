import pathlib,subprocess,sys,json,os
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/quality-main15/translator"
os.environ["LEAN_NUM_THREADS"]="4";os.environ["ROCQ2LEAN_LEAN_THREADS"]="4"
assert json.loads((R/"work/tests/wf-projection-negatives/result.json").read_text())["status"]=="PASS"
assert not json.loads((R/"work/runs/quality-main15-wf/summary.json").read_text())["validation_failures"]
def call(args,label):
 print("START",label,flush=True)
 with(R/("work/logs/"+label+".log")).open("w")as f:
  rc=subprocess.run([sys.executable,*map(str,args)],stdout=f,stderr=subprocess.STDOUT).returncode
 print("END",label,rc,flush=True);assert rc==0,(label,rc)
call([R/"scripts/probe_quality_main.py",T,R/"work/tests/quality-main15"],"quality-main15-quality")
call([R/"scripts/test_quality_main.py",T,R/"work/tests/quality-main15",R/"work/tests/quality-main15-negatives"],"quality-main15-quality-negatives")
call([R/"scripts/corelib_lab.py","--translator",T,"--out",R/"work/runs/quality-main15-full"],"quality-main15-full")
call([R/"scripts/compare_corelib_runs.py",R/"work/runs/quality-main10-full",R/"work/runs/quality-main15-full","--out",R/"work/quality-main15-delta.json"],"quality-main15-delta")
d=json.loads((R/"work/quality-main15-delta.json").read_text())
assert not d["status_regressions"]and not d["validation_regressions"],d
assert d["scope"]["full_2180"]["after"]["good_status_validation_incomplete"]==0,d
call([T/"tests/statement/check_statement.py"],"quality-main15-statement-suite")
print("CAMPAIGN_COMPLETE",flush=True)

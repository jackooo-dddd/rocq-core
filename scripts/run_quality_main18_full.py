import pathlib,subprocess,sys,json,os
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/quality-main18/translator"
os.environ["LEAN_NUM_THREADS"]="4";os.environ["ROCQ2LEAN_LEAN_THREADS"]="4"
assert json.loads((R/"work/tests/wf-index-patterns-negatives2/result.json").read_text())["status"]=="PASS"
def call(args,label):
 print("START",label,flush=True)
 with(R/("work/logs/"+label+".log")).open("w")as f:
  rc=subprocess.run([sys.executable,*map(str,args)],stdout=f,stderr=subprocess.STDOUT).returncode
 print("END",label,rc,flush=True);assert rc==0,(label,rc)
call([R/"scripts/test_wf_projection.py",T,R/"work/tests/wf-projection-controls2",R/"work/tests/quality-main18-projection-negatives"],"quality-main18-projection-negatives")
call([R/"scripts/probe_quality_main.py",T,R/"work/tests/quality-main18"],"quality-main18-quality")
call([R/"scripts/test_quality_main.py",T,R/"work/tests/quality-main18",R/"work/tests/quality-main18-negatives"],"quality-main18-quality-negatives")
call([R/"scripts/corelib_lab.py","--translator",T,"--out",R/"work/runs/quality-main18-full"],"quality-main18-full")
call([R/"scripts/compare_corelib_runs.py",R/"work/runs/quality-main15-full",R/"work/runs/quality-main18-full","--out",R/"work/quality-main18-delta.json"],"quality-main18-delta")
d=json.loads((R/"work/quality-main18-delta.json").read_text())
assert not d["status_regressions"]and not d["validation_regressions"],d
assert d["scope"]["full_2180"]["after"]["good_status_validation_incomplete"]==0,d
call([T/"tests/statement/check_statement.py"],"quality-main18-statement-suite")
print("CAMPAIGN_COMPLETE",flush=True)

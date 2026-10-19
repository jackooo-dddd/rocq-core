import pathlib,subprocess,sys,json,os
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/quality-main8/translator";F=R/"work/tests/quality-main8"
os.environ["LEAN_NUM_THREADS"]="4";os.environ["ROCQ2LEAN_LEAN_THREADS"]="4"
def call(args,label):
 print("START",label,flush=True)
 with(R/("work/logs/"+label+".log")).open("w")as f:
  rc=subprocess.run([sys.executable,*map(str,args)],stdout=f,stderr=subprocess.STDOUT).returncode
 print("END",label,rc,flush=True);assert rc==0,(label,rc)
call([R/"scripts/build_translator.py",T,R/"work/logs/quality-main8-build.log"],"quality-main8-build-driver")
call([R/"scripts/probe_quality_main.py",T,F],"quality-main8-fixture")
call([R/"scripts/test_quality_main.py",T,F,R/"work/tests/quality-main8-negatives"],"quality-main8-negatives")
call([T/"tools/rocq2lean.py","tasks","--run",F/"statement"],"quality-main8-tasks")
call([T/"tools/rocq2lean.py","assemble","--run",F/"statement"],"quality-main8-assembly")
call([R/"scripts/corelib_lab.py","--translator",T,"--out",R/"work/runs/quality-main8-full"],"quality-main8-full")
call([R/"scripts/compare_corelib_runs.py",R/"work/runs/result-transport6-full",R/"work/runs/quality-main8-full","--out",R/"work/quality-main8-delta.json"],"quality-main8-delta")
d=json.loads((R/"work/quality-main8-delta.json").read_text())
assert not d["status_regressions"]and not d["validation_regressions"],d
call([T/"tests/statement/check_statement.py"],"quality-main8-statement-suite")
print("CAMPAIGN_COMPLETE",flush=True)

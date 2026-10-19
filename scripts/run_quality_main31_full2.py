import pathlib,subprocess,sys,json,os
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/quality-main31/translator"
os.environ["LEAN_NUM_THREADS"]="4";os.environ["ROCQ2LEAN_LEAN_THREADS"]="4"
assert json.loads((R/"work/tests/wf-index-patterns-negatives2/result.json").read_text())["status"]=="PASS"
def call(args,label):
 print("START",label,flush=True)
 with(R/("work/logs/"+label+".log")).open("w")as f:
  rc=subprocess.run([sys.executable,*map(str,args)],stdout=f,stderr=subprocess.STDOUT).returncode
 print("END",label,rc,flush=True);assert rc==0,(label,rc)
call([R/"scripts/test_tlist_arguments.py",T,R/"work/runs/quality-main31-classes/Corelib/Classes/RelationClasses",R/"work/tests/tlist-arguments31"],"quality-main31-tlist-arguments")
call([R/"scripts/test_tlist_type_positions.py",T,R/"work/runs/quality-main31-classes/Corelib/Classes/RelationClasses",R/"work/tests/tlist-type-position-controls31"],"quality-main31-type-position-controls")
call([R/"scripts/test_tlist_higher_order.py",T,R/"work/runs/quality-main31-classes/Corelib/Classes/RelationClasses",R/"work/tests/tlist-higher-order-controls31"],"quality-main31-higher-order-controls")
call([R/"scripts/probe_eq_higher_order_explicit.py",T,R/"work/tests/eq-higher-order-explicit31"],"quality-main31-eq-probe")
call([R/"scripts/test_eq_higher_order.py",T,R/"work/tests/eq-higher-order-explicit31",R/"work/tests/eq-higher-order-controls31"],"quality-main31-eq-controls")
call([R/"scripts/test_wf_projection.py",T,R/"work/tests/wf-projection-controls2",R/"work/tests/quality-main31-projection-negatives"],"quality-main31-projection-negatives")
call([R/"scripts/probe_quality_main.py",T,R/"work/tests/quality-main31"],"quality-main31-quality")
call([R/"scripts/test_quality_main.py",T,R/"work/tests/quality-main31",R/"work/tests/quality-main31-negatives"],"quality-main31-quality-negatives")
call([R/"scripts/corelib_lab.py","--translator",T,"--out",R/"work/runs/quality-main31-full"],"quality-main31-full")
call([R/"scripts/compare_corelib_runs.py",R/"work/runs/quality-main26-full",R/"work/runs/quality-main31-full","--out",R/"work/quality-main31-delta.json"],"quality-main31-delta")
d=json.loads((R/"work/quality-main31-delta.json").read_text())
assert not d["status_regressions"]and not d["validation_regressions"],d
assert d["scope"]["full_2180"]["after"]["good_status_validation_incomplete"]==0,d
call([T/"tests/statement/check_statement.py"],"quality-main31-statement-suite")
print("CAMPAIGN_COMPLETE",flush=True)

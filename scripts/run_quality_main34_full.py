import pathlib,subprocess,sys,json,os
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/quality-main34/translator"
os.environ["LEAN_NUM_THREADS"]="4";os.environ["ROCQ2LEAN_LEAN_THREADS"]="4"
assert json.loads((R/"work/tests/wf-index-patterns-negatives2/result.json").read_text())["status"]=="PASS"
def call(args,label):
 print("START",label,flush=True)
 with(R/("work/logs/"+label+".log")).open("w")as f:
  rc=subprocess.run([sys.executable,*map(str,args)],stdout=f,stderr=subprocess.STDOUT).returncode
 print("END",label,rc,flush=True);assert rc==0,(label,rc)
call([R/"scripts/test_tlist_arguments.py",T,R/"work/runs/quality-main34-classes/Corelib/Classes/RelationClasses",R/"work/tests/tlist-arguments34"],"quality-main34-tlist-arguments")
call([R/"scripts/test_tlist_type_positions.py",T,R/"work/runs/quality-main34-classes/Corelib/Classes/RelationClasses",R/"work/tests/tlist-type-position-controls34"],"quality-main34-type-position-controls")
call([R/"scripts/test_tlist_higher_order.py",T,R/"work/runs/quality-main34-classes/Corelib/Classes/RelationClasses",R/"work/tests/tlist-higher-order-controls34"],"quality-main34-higher-order-controls")
call([R/"scripts/probe_eq_higher_order_explicit.py",T,R/"work/tests/eq-higher-order-explicit34"],"quality-main34-eq-probe")
call([R/"scripts/test_eq_higher_order.py",T,R/"work/tests/eq-higher-order-explicit34",R/"work/tests/eq-higher-order-controls34"],"quality-main34-eq-controls")
call([R/"scripts/test_cumulative_function_results.py",T,R/"work/runs/quality-main34-classes/Corelib/Classes/CRelationClasses",R/"work/tests/cumulative-function-result-controls34"],"quality-main34-function-result-controls")
call([R/"scripts/test_partial_alias_inline.py",T,R/"work/runs/quality-main34-classes/Corelib/Classes/Morphisms_Prop",R/"work/tests/partial-alias-inline-controls34"],"quality-main34-partial-alias-controls")
call([R/"scripts/test_wf_projection.py",T,R/"work/tests/wf-projection-controls2",R/"work/tests/quality-main34-projection-negatives"],"quality-main34-projection-negatives")
call([R/"scripts/probe_quality_main.py",T,R/"work/tests/quality-main34"],"quality-main34-quality")
call([R/"scripts/test_quality_main.py",T,R/"work/tests/quality-main34",R/"work/tests/quality-main34-negatives"],"quality-main34-quality-negatives")
call([R/"scripts/corelib_lab.py","--translator",T,"--out",R/"work/runs/quality-main34-full"],"quality-main34-full")
call([R/"scripts/compare_corelib_runs.py",R/"work/runs/quality-main26-full",R/"work/runs/quality-main34-full","--out",R/"work/quality-main34-delta.json"],"quality-main34-delta")
d=json.loads((R/"work/quality-main34-delta.json").read_text())
assert not d["status_regressions"]and not d["validation_regressions"],d
assert d["scope"]["full_2180"]["after"]["good_status_validation_incomplete"]==0,d
call([T/"tests/statement/check_statement.py"],"quality-main34-statement-suite")
print("CAMPAIGN_COMPLETE",flush=True)

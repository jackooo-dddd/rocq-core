import pathlib,subprocess,sys,json,os
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/quality-main46/translator";S=R/"work/runs/quality-main46-full"
os.environ["LEAN_NUM_THREADS"]="4";os.environ["ROCQ2LEAN_LEAN_THREADS"]="4"
def call(args,label):
 print("START",label,flush=True)
 with(R/("work/logs/"+label+".log")).open("w")as f:
  rc=subprocess.run([sys.executable,*map(str,args)],stdout=f,stderr=subprocess.STDOUT).returncode
 print("END",label,rc,flush=True);assert rc==0,(label,rc)
assert json.loads((R/"work/tests/parameter-transport-controls38/result.json").read_text())["status"]=="PASS"
call([R/"scripts/corelib_lab.py","--translator",T,"--out",S],"quality-main46-full")
call([R/"scripts/compare_corelib_runs.py",R/"work/runs/quality-main39-full",S,"--out",R/"work/quality-main46-delta.json"],"quality-main46-delta")
d=json.loads((R/"work/quality-main46-delta.json").read_text())
assert not d["status_regressions"]and not d["validation_regressions"],d
assert d["scope"]["full_2180"]["after"]["good_status_validation_incomplete"]==0,d
for name,module,output in [
 ("test_tlist_arguments.py","RelationClasses","tlist-arguments46"),
 ("test_tlist_type_positions.py","RelationClasses","tlist-type-position-controls46"),
 ("test_tlist_higher_order.py","RelationClasses","tlist-higher-order-controls46"),
 ("test_cumulative_function_results.py","CRelationClasses","cumulative-function-result-controls46"),
 ("test_partial_alias_inline.py","Morphisms_Prop","partial-alias-inline-controls46")]:
 call([R/("scripts/"+name),T,S/("Corelib/Classes/"+module),R/("work/tests/"+output)],output)
call([R/"scripts/test_parameter_transports.py",T,S,R/"work/tests/parameter-transport-full-controls46"],"parameter-transport-full-controls46")
call([R/"scripts/probe_eq_higher_order_explicit.py",T,R/"work/tests/eq-higher-order-explicit46"],"eq-higher-order-explicit46")
call([R/"scripts/test_eq_higher_order.py",T,R/"work/tests/eq-higher-order-explicit46",R/"work/tests/eq-higher-order-controls46"],"eq-higher-order-controls46")
call([R/"scripts/test_wf_projection.py",T,R/"work/tests/wf-projection-controls2",R/"work/tests/quality-main46-projection-negatives"],"quality-main46-projection-negatives")
call([R/"scripts/probe_quality_main.py",T,R/"work/tests/quality-main46"],"quality-main46-quality")
call([R/"scripts/test_quality_main.py",T,R/"work/tests/quality-main46",R/"work/tests/quality-main46-negatives"],"quality-main46-quality-negatives")
call([R/"scripts/test_statement_prop_view.py",T,S/"Corelib/Classes/CRelationClasses",R/"work/tests/statement-prop-view-full-controls46"],"statement-prop-view-full-controls46")
call([R/"scripts/test_native_quality_families.py",T,S,R/"work/tests/native-quality-family-full-controls46"],"native-quality-family-full-controls46")
call([R/"scripts/probe_native_quality_dispatch.py",T,R/"work/tests/native-quality-dispatch-full46"],"native-quality-dispatch-full46")
call([T/"tests/statement/check_statement.py"],"quality-main46-statement-suite")
print("CAMPAIGN_COMPLETE",flush=True)

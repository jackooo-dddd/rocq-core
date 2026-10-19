import pathlib,subprocess,sys,json,os
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/quality-main38/translator";S=R/"work/runs/quality-main38-full"
os.environ["LEAN_NUM_THREADS"]="4";os.environ["ROCQ2LEAN_LEAN_THREADS"]="4"
def call(args,label):
 print("START",label,flush=True)
 with(R/("work/logs/"+label+".log")).open("w")as f:
  rc=subprocess.run([sys.executable,*map(str,args)],stdout=f,stderr=subprocess.STDOUT).returncode
 print("END",label,rc,flush=True);assert rc==0,(label,rc)
assert json.loads((R/"work/tests/parameter-transport-controls38/result.json").read_text())["status"]=="PASS"
call([R/"scripts/corelib_lab.py","--translator",T,"--out",S],"quality-main38-full")
call([R/"scripts/compare_corelib_runs.py",R/"work/runs/quality-main34-full",S,"--out",R/"work/quality-main38-delta.json"],"quality-main38-delta")
d=json.loads((R/"work/quality-main38-delta.json").read_text())
assert not d["status_regressions"]and not d["validation_regressions"],d
assert d["scope"]["full_2180"]["after"]["good_status_validation_incomplete"]==0,d
for name,module,output in [
 ("test_tlist_arguments.py","RelationClasses","tlist-arguments38"),
 ("test_tlist_type_positions.py","RelationClasses","tlist-type-position-controls38"),
 ("test_tlist_higher_order.py","RelationClasses","tlist-higher-order-controls38"),
 ("test_cumulative_function_results.py","CRelationClasses","cumulative-function-result-controls38"),
 ("test_partial_alias_inline.py","Morphisms_Prop","partial-alias-inline-controls38")]:
 call([R/("scripts/"+name),T,S/("Corelib/Classes/"+module),R/("work/tests/"+output)],output)
call([R/"scripts/test_parameter_transports.py",T,S,R/"work/tests/parameter-transport-full-controls38"],"parameter-transport-full-controls38")
call([R/"scripts/probe_eq_higher_order_explicit.py",T,R/"work/tests/eq-higher-order-explicit38"],"eq-higher-order-explicit38")
call([R/"scripts/test_eq_higher_order.py",T,R/"work/tests/eq-higher-order-explicit38",R/"work/tests/eq-higher-order-controls38"],"eq-higher-order-controls38")
call([R/"scripts/test_wf_projection.py",T,R/"work/tests/wf-projection-controls2",R/"work/tests/quality-main38-projection-negatives"],"quality-main38-projection-negatives")
call([R/"scripts/probe_quality_main.py",T,R/"work/tests/quality-main38"],"quality-main38-quality")
call([R/"scripts/test_quality_main.py",T,R/"work/tests/quality-main38",R/"work/tests/quality-main38-negatives"],"quality-main38-quality-negatives")
call([T/"tests/statement/check_statement.py"],"quality-main38-statement-suite")
print("CAMPAIGN_COMPLETE",flush=True)

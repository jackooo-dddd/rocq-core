import pathlib,subprocess,sys,json,os
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/quality-main62/translator";S=R/"work/runs/quality-main62-full"
os.environ["LEAN_NUM_THREADS"]="4";os.environ["ROCQ2LEAN_LEAN_THREADS"]="4"
def call(args,label):
 print("START",label,flush=True)
 with(R/("work/logs/"+label+".log")).open("w")as f:
  rc=subprocess.run([sys.executable,*map(str,args)],stdout=f,stderr=subprocess.STDOUT).returncode
 print("END",label,rc,flush=True);assert rc==0,(label,rc)
assert json.loads((R/"work/tests/parameter-transport-controls38/result.json").read_text())["status"]=="PASS"
call([R/"scripts/corelib_lab.py","--translator",T,"--out",S],"quality-main62-full")
call([R/"scripts/compare_corelib_runs.py",R/"work/runs/quality-main59-full",S,"--out",R/"work/quality-main62-delta.json"],"quality-main62-delta")
d=json.loads((R/"work/quality-main62-delta.json").read_text())
assert not d["status_regressions"]and not d["validation_regressions"],d
assert d["scope"]["full_2180"]["after"]["good_status_validation_incomplete"]==0,d
for name,module,output in [
 ("test_tlist_arguments.py","RelationClasses","tlist-arguments62"),
 ("test_tlist_type_positions.py","RelationClasses","tlist-type-position-controls62"),
 ("test_tlist_higher_order.py","RelationClasses","tlist-higher-order-controls62"),
 ("test_cumulative_function_results.py","CRelationClasses","cumulative-function-result-controls62"),
 ("test_partial_alias_inline.py","Morphisms_Prop","partial-alias-inline-controls62")]:
 call([R/("scripts/"+name),T,S/("Corelib/Classes/"+module),R/("work/tests/"+output)],output)
call([R/"scripts/test_parameter_transports.py",T,S,R/"work/tests/parameter-transport-full-controls62"],"parameter-transport-full-controls62")
call([R/"scripts/probe_eq_higher_order_explicit.py",T,R/"work/tests/eq-higher-order-explicit62"],"eq-higher-order-explicit62")
call([R/"scripts/test_eq_higher_order.py",T,R/"work/tests/eq-higher-order-explicit62",R/"work/tests/eq-higher-order-controls62"],"eq-higher-order-controls62")
call([R/"scripts/test_wf_projection.py",T,R/"work/tests/wf-projection-controls2",R/"work/tests/quality-main62-projection-negatives"],"quality-main62-projection-negatives")
call([R/"scripts/probe_quality_main.py",T,R/"work/tests/quality-main62"],"quality-main62-quality")
call([R/"scripts/test_quality_main.py",T,R/"work/tests/quality-main62",R/"work/tests/quality-main62-negatives"],"quality-main62-quality-negatives")
call([R/"scripts/test_statement_prop_view.py",T,S/"Corelib/Classes/CRelationClasses",R/"work/tests/statement-prop-view-full-controls62"],"statement-prop-view-full-controls62")
call([R/"scripts/test_native_quality_families.py",T,S,R/"work/tests/native-quality-family-full-controls62"],"native-quality-family-full-controls62")
call([R/"scripts/probe_native_quality_dispatch.py",T,R/"work/tests/native-quality-dispatch-full62"],"native-quality-dispatch-full62")
call([R/"scripts/test_native_quality_dispatch.py",T,R/"work/tests/native-quality-dispatch-full62",R/"work/tests/native-quality-dispatch-full-controls62"],"native-quality-dispatch-full-controls62")
call([R/"scripts/probe_native_quality_roots.py",T,R/"work/tests/native-quality-roots-full62"],"native-quality-roots-full62")
call([R/"scripts/probe_native_quality_opaque.py",T,R/"work/tests/native-quality-opaque-full62"],"native-quality-opaque-full62")
call([R/"scripts/test_native_quality_opaque.py",T,R/"work/tests/native-quality-opaque-full62",R/"work/tests/native-quality-opaque-full-controls62"],"native-quality-opaque-full-controls62")
call([R/"scripts/test_tlist_predicate_constants.py",T,S/"Corelib/Classes/RelationClasses",R/"work/tests/tlist-predicate-constants-full-controls62"],"tlist-predicate-constants-full-controls62")
call([R/"scripts/test_poly_transport_independence.py",T,S,R/"work/tests/poly-transport-independence-full-controls62"],"poly-transport-independence-full-controls62")
call([R/"scripts/test_binder_combinator.py",T,S/"Corelib/Classes/Morphisms",R/"work/tests/binder-combinator-full-controls62"],"binder-combinator-full-controls62")
call([R/"scripts/test_alias_prefix.py",T,S,R/"work/tests/alias-prefix-full-controls62"],"alias-prefix-full-controls62")
call([R/"scripts/test_joint_source_conversion.py",T,S,R/"work/tests/joint-source-full-controls62"],"joint-source-full-controls62")
call([R/"scripts/test_bool_rec_transport.py",T,S/"Corelib/Init/Sumbool",R/"work/tests/bool-rec-transport-full-controls62"],"bool-rec-transport-full-controls62")
call([R/"scripts/test_order_source_conversion.py",T,S,R/"work/tests/order-source-full-controls62"],"order-source-full-controls62")
call([R/"scripts/test_poly_upper_guards.py",T,S,R/"work/tests/poly-upper-full-controls62"],"poly-upper-full-controls62")
call([T/"tests/statement/check_statement.py"],"quality-main62-statement-suite")
print("CAMPAIGN_COMPLETE",flush=True)

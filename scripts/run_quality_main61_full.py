import pathlib,subprocess,sys,json,os
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/quality-main61/translator";S=R/"work/runs/quality-main61-full"
os.environ["LEAN_NUM_THREADS"]="4";os.environ["ROCQ2LEAN_LEAN_THREADS"]="4"
def call(args,label):
 print("START",label,flush=True)
 with(R/("work/logs/"+label+".log")).open("w")as f:
  rc=subprocess.run([sys.executable,*map(str,args)],stdout=f,stderr=subprocess.STDOUT).returncode
 print("END",label,rc,flush=True);assert rc==0,(label,rc)
assert json.loads((R/"work/tests/parameter-transport-controls38/result.json").read_text())["status"]=="PASS"
call([R/"scripts/corelib_lab.py","--translator",T,"--out",S],"quality-main61-full")
call([R/"scripts/compare_corelib_runs.py",R/"work/runs/quality-main57-full",S,"--out",R/"work/quality-main61-delta.json"],"quality-main61-delta")
d=json.loads((R/"work/quality-main61-delta.json").read_text())
assert not d["status_regressions"]and not d["validation_regressions"],d
assert d["scope"]["full_2180"]["after"]["good_status_validation_incomplete"]==0,d
for name,module,output in [
 ("test_tlist_arguments.py","RelationClasses","tlist-arguments61"),
 ("test_tlist_type_positions.py","RelationClasses","tlist-type-position-controls61"),
 ("test_tlist_higher_order.py","RelationClasses","tlist-higher-order-controls61"),
 ("test_cumulative_function_results.py","CRelationClasses","cumulative-function-result-controls61"),
 ("test_partial_alias_inline.py","Morphisms_Prop","partial-alias-inline-controls61")]:
 call([R/("scripts/"+name),T,S/("Corelib/Classes/"+module),R/("work/tests/"+output)],output)
call([R/"scripts/test_parameter_transports.py",T,S,R/"work/tests/parameter-transport-full-controls61"],"parameter-transport-full-controls61")
call([R/"scripts/probe_eq_higher_order_explicit.py",T,R/"work/tests/eq-higher-order-explicit61"],"eq-higher-order-explicit61")
call([R/"scripts/test_eq_higher_order.py",T,R/"work/tests/eq-higher-order-explicit61",R/"work/tests/eq-higher-order-controls61"],"eq-higher-order-controls61")
call([R/"scripts/test_wf_projection.py",T,R/"work/tests/wf-projection-controls2",R/"work/tests/quality-main61-projection-negatives"],"quality-main61-projection-negatives")
call([R/"scripts/probe_quality_main.py",T,R/"work/tests/quality-main61"],"quality-main61-quality")
call([R/"scripts/test_quality_main.py",T,R/"work/tests/quality-main61",R/"work/tests/quality-main61-negatives"],"quality-main61-quality-negatives")
call([R/"scripts/test_statement_prop_view.py",T,S/"Corelib/Classes/CRelationClasses",R/"work/tests/statement-prop-view-full-controls61"],"statement-prop-view-full-controls61")
call([R/"scripts/test_native_quality_families.py",T,S,R/"work/tests/native-quality-family-full-controls61"],"native-quality-family-full-controls61")
call([R/"scripts/probe_native_quality_dispatch.py",T,R/"work/tests/native-quality-dispatch-full61"],"native-quality-dispatch-full61")
call([R/"scripts/test_native_quality_dispatch.py",T,R/"work/tests/native-quality-dispatch-full61",R/"work/tests/native-quality-dispatch-full-controls61"],"native-quality-dispatch-full-controls61")
call([R/"scripts/probe_native_quality_roots.py",T,R/"work/tests/native-quality-roots-full61"],"native-quality-roots-full61")
call([R/"scripts/probe_native_quality_opaque.py",T,R/"work/tests/native-quality-opaque-full61"],"native-quality-opaque-full61")
call([R/"scripts/test_native_quality_opaque.py",T,R/"work/tests/native-quality-opaque-full61",R/"work/tests/native-quality-opaque-full-controls61"],"native-quality-opaque-full-controls61")
call([R/"scripts/test_tlist_predicate_constants.py",T,S/"Corelib/Classes/RelationClasses",R/"work/tests/tlist-predicate-constants-full-controls61"],"tlist-predicate-constants-full-controls61")
call([R/"scripts/test_poly_transport_independence.py",T,S,R/"work/tests/poly-transport-independence-full-controls61"],"poly-transport-independence-full-controls61")
call([R/"scripts/test_binder_combinator.py",T,S/"Corelib/Classes/Morphisms",R/"work/tests/binder-combinator-full-controls61"],"binder-combinator-full-controls61")
call([R/"scripts/test_alias_prefix.py",T,S,R/"work/tests/alias-prefix-full-controls61"],"alias-prefix-full-controls61")
call([R/"scripts/test_joint_source_conversion.py",T,S,R/"work/tests/joint-source-full-controls61"],"joint-source-full-controls61")
call([R/"scripts/test_bool_rec_transport.py",T,S/"Corelib/Init/Sumbool",R/"work/tests/bool-rec-transport-full-controls61"],"bool-rec-transport-full-controls61")
call([R/"scripts/test_order_source_conversion.py",T,S,R/"work/tests/order-source-full-controls61"],"order-source-full-controls61")
call([T/"tests/statement/check_statement.py"],"quality-main61-statement-suite")
print("CAMPAIGN_COMPLETE",flush=True)

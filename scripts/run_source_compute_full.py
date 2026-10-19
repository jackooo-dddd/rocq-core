#!/usr/bin/env python3
import pathlib,sys,subprocess,json,os
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/source-compute/translator"
os.environ["LEAN_NUM_THREADS"]="4";os.environ["ROCQ2LEAN_LEAN_THREADS"]="4"
assert json.loads((R/"work/tests/source-compute-checked/result.json").read_text())["status"]=="PASS"
d=json.loads((R/"work/source-compute-targeted-delta.json").read_text())
assert not d["regressions"]and not d["validation_regressions"]
def call(args,label):
 print("START",label,flush=True)
 with(R/("work/logs/"+label+".log")).open("w")as log:
  rc=subprocess.run([sys.executable,*map(str,args)],cwd=R,stdout=log,stderr=subprocess.STDOUT).returncode
 print("END",label,rc,flush=True);assert rc==0,(label,rc)
call([R/"scripts/test_type_coercion_core.py",T,R/"work/tests/source-compute-type-coercions",R/"work/runs/source-compute-targeted"],"source-compute-type-coercions-tests")
for script,label in [("test_poly_lift.py","poly-lift"),("test_template_type.py","template-type"),("test_proof_references.py","proof-references")]:
 call([R/"scripts"/script,T,R/("work/tests/source-compute-"+label)],"source-compute-"+label+"-tests")
prosa=T/".work/prosa-0.6-rocq93";prosa.parent.mkdir(exist_ok=True);assert not prosa.exists()
subprocess.run(["cp","-a","--reflink=auto",str(R/"work/snapshots/poly-prereq/translator/.work/prosa-0.6-rocq93"),str(prosa)],check=True)
call([R/"scripts/corelib_lab.py","--translator",T,"--out",R/"work/runs/source-compute-full"],"source-compute-full")
call([R/"scripts/compare_corelib_runs.py",R/"work/runs/type-coercions2-full",R/"work/runs/source-compute-full","--out",R/"work/source-compute-delta.json"],"source-compute-delta")
d=json.loads((R/"work/source-compute-delta.json").read_text())
assert not d["status_regressions"]and not d["validation_regressions"],d
call([T/"tests/statement/check_statement.py"],"source-compute-statement-suite")
print("CAMPAIGN_COMPLETE",flush=True)

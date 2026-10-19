#!/usr/bin/env python3
import pathlib,sys,subprocess,json,os
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/alias-closure2/translator"
os.environ["LEAN_NUM_THREADS"]="4";os.environ["ROCQ2LEAN_LEAN_THREADS"]="4"
assert json.loads((R/"work/tests/template-quality-metadata/result.json").read_text())["status"]=="PASS"
before=json.loads((R/"work/runs/cast-retry-targeted/all-roots.json").read_text())
after=json.loads((R/"work/runs/alias-closure2-targeted/all-roots.json").read_text())
assert before.keys()==after.keys()
good={"TRANSLATED_AND_CHECKED","STATEMENT_KERNEL_CHECKED","PENDING_KERNEL_CHECKED","STATEMENT_PENDING_KERNEL_CHECKED","BOOTSTRAP_RESOLVED"}
assert all(after[k]["status"]in good for k in before if before[k]["status"]in good)
for p in (R/"work/runs/alias-closure2-targeted/Corelib").rglob("result.json"):assert json.loads(p.read_text())["checked"]
def call(args,label):
 print("START",label,flush=True)
 with(R/("work/logs/"+label+".log")).open("w")as log:
  rc=subprocess.run([sys.executable,*map(str,args)],cwd=R,stdout=log,stderr=subprocess.STDOUT).returncode
 print("END",label,rc,flush=True);assert rc==0,(label,rc)
call([R/"scripts/test_alias_closure.py",T,R/"work/tests/alias-closure2",R/"work/runs/alias-closure2-targeted"],"alias-closure2-dedicated-tests")
call([R/"scripts/test_type_coercion_core.py",T,R/"work/tests/alias-closure2-type-coercions",R/"work/runs/alias-closure2-targeted"],"alias-closure2-type-coercions-tests")
for script,label in [("test_poly_lift.py","poly-lift"),("test_template_type.py","template-type"),("test_proof_references.py","proof-references")]:
 call([R/"scripts"/script,T,R/("work/tests/alias-closure2-"+label)],"alias-closure2-"+label+"-tests")
prosa=T/".work/prosa-0.6-rocq93";prosa.parent.mkdir(exist_ok=True);assert not prosa.exists()
subprocess.run(["cp","-a","--reflink=auto",str(R/"work/snapshots/poly-prereq/translator/.work/prosa-0.6-rocq93"),str(prosa)],check=True)
call([R/"scripts/corelib_lab.py","--translator",T,"--out",R/"work/runs/alias-closure2-full"],"alias-closure2-full")
call([R/"scripts/compare_corelib_runs.py",R/"work/runs/cast-retry-full",R/"work/runs/alias-closure2-full","--out",R/"work/alias-closure2-delta.json"],"alias-closure2-delta")
d=json.loads((R/"work/alias-closure2-delta.json").read_text())
assert not d["status_regressions"]and not d["validation_regressions"],d
call([T/"tests/statement/check_statement.py"],"alias-closure2-statement-suite")
print("CAMPAIGN_COMPLETE",flush=True)

#!/usr/bin/env python3
import pathlib,sys,subprocess,json,os
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/poly-lift/translator"
os.environ["LEAN_NUM_THREADS"]="4";os.environ["ROCQ2LEAN_LEAN_THREADS"]="4"
assert json.loads((R/"work/tests/poly-lift-checked/result.json").read_text())["status"]=="PASS"
assert not json.loads((R/"work/poly-lift-targeted-delta.json").read_text())["regressions"]
prosa=T/".work/prosa-0.6-rocq93";prosa.parent.mkdir(exist_ok=True)
assert not prosa.exists()
subprocess.run(["cp","-a","--reflink=auto",str(R/"work/snapshots/poly-prereq/translator/.work/prosa-0.6-rocq93"),str(prosa)],check=True)
def call(args,label):
 print("START",label,flush=True)
 with (R/("work/logs/"+label+".log")).open("w")as log:
  rc=subprocess.run([sys.executable,*map(str,args)],cwd=R,stdout=log,stderr=subprocess.STDOUT).returncode
 print("END",label,rc,flush=True);assert rc==0,(label,rc)
for script,label in [("test_prop_cast.py","prop-cast"),("test_poly_abbrev.py","poly-abbrev"),("test_template_type.py","template-type")]:
 call([R/"scripts"/script,T,R/("work/tests/poly-lift-"+label)],"poly-lift-"+label+"-tests")
call([R/"scripts/corelib_lab.py","--translator",T,"--out",R/"work/runs/poly-lift-full"],"poly-lift-full")
call([R/"scripts/compare_corelib_runs.py",R/"work/runs/proof-references-full",R/"work/runs/poly-lift-full","--out",R/"work/poly-lift-delta.json"],"poly-lift-delta")
d=json.loads((R/"work/poly-lift-delta.json").read_text())
assert not d["status_regressions"] and not d["validation_regressions"],d
call([T/"tests/statement/check_statement.py"],"poly-lift-statement-suite")
print("CAMPAIGN_COMPLETE",flush=True)

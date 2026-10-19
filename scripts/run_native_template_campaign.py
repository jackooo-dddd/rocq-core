#!/usr/bin/env python3
import pathlib,sys,subprocess,json,os
R=pathlib.Path(__file__).resolve().parents[1];tag="native-template";T=R/("work/snapshots/"+tag+"/translator")
os.environ["LEAN_NUM_THREADS"]="4";os.environ["ROCQ2LEAN_LEAN_THREADS"]="4"
def call(args,label):
 print("START",label,flush=True)
 with (R/("work/logs/"+label+".log")).open("w") as log:
  rc=subprocess.run([sys.executable,*map(str,args)],cwd=R,stdout=log,stderr=subprocess.STDOUT).returncode
 print("END",label,rc,flush=True);assert rc==0,(label,rc)
call([R/"scripts/build_translator.py",R/"translator",R/("work/logs/"+tag+"-build.log")],tag+"-build-launch")
assert not T.exists();T.parent.mkdir(parents=True)
subprocess.run(["rsync","-a","--exclude=.git","--exclude=.work",str(R/"translator")+"/",str(T)+"/"],check=True)
prosa=T/".work/prosa-0.6-rocq93";prosa.parent.mkdir(exist_ok=True)
subprocess.run(["cp","-a","--reflink=auto",str(R/"work/snapshots/poly-prereq/translator/.work/prosa-0.6-rocq93"),str(prosa)],check=True)
print("SNAPSHOT_READY",flush=True)
for script,label in [("test_int63_structured.py","structured"),("test_native_float.py","float"),("test_carrier_sort.py","carrier-sort"),("test_template_type.py","template-type"),("test_proof_references.py","proof-references")]:
 call([R/"scripts"/script,T,R/("work/tests/"+tag+"-"+label)],tag+"-"+label+"-tests")
call([R/"scripts/corelib_lab.py","--translator",T,"--out",R/("work/runs/"+tag+"-full")],tag+"-full")
call([R/"scripts/compare_corelib_runs.py",R/"work/runs/proof-references-full",R/("work/runs/"+tag+"-full"),"--out",R/("work/"+tag+"-delta.json")],tag+"-delta")
d=json.loads((R/("work/"+tag+"-delta.json")).read_text())
assert not d["status_regressions"] and not d["validation_regressions"],d
call([T/"tests/statement/check_statement.py"],tag+"-statement-suite")
print("CAMPAIGN_COMPLETE",flush=True)

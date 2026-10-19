#!/usr/bin/env python3
import pathlib,sys,subprocess,json,os,time
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/type-coercions2/translator";RUN=R/"work/runs/type-coercions2-targeted"
os.environ["LEAN_NUM_THREADS"]="4";os.environ["ROCQ2LEAN_LEAN_THREADS"]="4"
deadline=time.time()+900
while "PROBE_COMPLETE"not in(R/"work/logs/type-coercions2-probe-campaign.log").read_text():
 if time.time()>deadline:raise RuntimeError("probe did not complete")
 try:os.kill(2668294,0)
 except ProcessLookupError:raise RuntimeError("probe exited without completion; inspect log")
 time.sleep(2)
good={"TRANSLATED_AND_CHECKED","PENDING_KERNEL_CHECKED","STATEMENT_KERNEL_CHECKED","STATEMENT_PENDING_KERNEL_CHECKED","BOOTSTRAP_RESOLVED"}
changes=[];regressions=[];badmods=[];total=0
for p in RUN.rglob("result.json"):
 a=json.loads(p.read_text());b=json.loads((R/"work/runs/poly-lift-full"/p.relative_to(RUN)).read_text());total+=len(a["root_results"])
 if b["checked"]and not a["checked"]:badmods.append(a["module"])
 for n,r in a["root_results"].items():
  old=b["root_results"][n]
  if r["status"]!=old["status"]:
   changes.append({"source":n,"before":old["status"],"after":r["status"],"checked":a["checked"]})
   if old["status"]in good and r["status"]not in good:regressions.append(n)
out={"total":total,"newly_good":sum(x["before"]not in good and x["after"]in good for x in changes),"regressions":regressions,"validation_regressions":badmods,"changes":changes}
(R/"work/type-coercions2-targeted-delta.json").write_text(json.dumps(out,indent=2)+"\n")
assert total==262 and not regressions and not badmods,out
print("TARGETED_DELTA",out,flush=True)
def call(args,label):
 print("START",label,flush=True)
 with(R/("work/logs/"+label+".log")).open("w")as log:
  rc=subprocess.run([sys.executable,*map(str,args)],cwd=R,stdout=log,stderr=subprocess.STDOUT).returncode
 print("END",label,rc,flush=True);assert rc==0,(label,rc)
call([R/"scripts/test_type_coercion_core.py",T,R/"work/tests/type-coercions2-core",RUN],"type-coercions2-core-tests")
for script,label in [("test_poly_lift.py","poly-lift"),("test_prop_cast.py","prop-cast"),("test_poly_abbrev.py","poly-abbrev")]:
 call([R/"scripts"/script,T,R/("work/tests/type-coercions2-"+label)],"type-coercions2-"+label+"-tests")
prosa=T/".work/prosa-0.6-rocq93";prosa.parent.mkdir(exist_ok=True);assert not prosa.exists()
subprocess.run(["cp","-a","--reflink=auto",str(R/"work/snapshots/poly-prereq/translator/.work/prosa-0.6-rocq93"),str(prosa)],check=True)
call([R/"scripts/corelib_lab.py","--translator",T,"--out",R/"work/runs/type-coercions2-full"],"type-coercions2-full")
call([R/"scripts/compare_corelib_runs.py",R/"work/runs/poly-lift-full",R/"work/runs/type-coercions2-full","--out",R/"work/type-coercions2-delta.json"],"type-coercions2-delta")
d=json.loads((R/"work/type-coercions2-delta.json").read_text())
assert not d["status_regressions"]and not d["validation_regressions"],d
call([T/"tests/statement/check_statement.py"],"type-coercions2-statement-suite")
print("CAMPAIGN_COMPLETE",flush=True)

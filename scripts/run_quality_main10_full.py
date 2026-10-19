import pathlib,subprocess,sys,json,os
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/quality-main10/translator";F=R/"work/tests/quality-main10"
os.environ["LEAN_NUM_THREADS"]="4";os.environ["ROCQ2LEAN_LEAN_THREADS"]="4"
assert json.loads((R/"work/tests/quality-main10-negatives/result.json").read_text())["status"]=="PASS"
assert json.loads((F/"proof/verify.json").read_text())["status"]=="VERIFIED"
before=json.loads((R/"work/runs/result-transport6-full/all-roots.json").read_text())
after=json.loads((R/"work/runs/quality-main10-targeted/all-roots.json").read_text())
good={"TRANSLATED_AND_CHECKED","STATEMENT_KERNEL_CHECKED","PENDING_KERNEL_CHECKED","STATEMENT_PENDING_KERNEL_CHECKED","BOOTSTRAP_RESOLVED"}
reg=[n for n in after if before[n]["status"]in good and after[n]["status"]not in good]
assert not reg,reg
assert not json.loads((R/"work/runs/quality-main10-targeted/summary.json").read_text())["validation_failures"]
def call(args,label):
 print("START",label,flush=True)
 with(R/("work/logs/"+label+".log")).open("w")as f:
  rc=subprocess.run([sys.executable,*map(str,args)],stdout=f,stderr=subprocess.STDOUT).returncode
 print("END",label,rc,flush=True);assert rc==0,(label,rc)
call([R/"scripts/corelib_lab.py","--translator",T,"--out",R/"work/runs/quality-main10-frontiers","--module","Corelib.Init.Nat","--module","Corelib.Init.Decimal","--module","Corelib.Init.Hexadecimal","--module","Corelib.Init.Wf","--module","Corelib.Numbers.Cyclic.Int63.PrimInt63"],"quality-main10-frontiers")
front=json.loads((R/"work/runs/quality-main10-frontiers/all-roots.json").read_text())
reg=[n for n in front if before[n]["status"]in good and front[n]["status"]not in good]
assert not reg,reg
assert not json.loads((R/"work/runs/quality-main10-frontiers/summary.json").read_text())["validation_failures"]
call([R/"scripts/test_native_float.py",T,R/"work/tests/quality-main10-native-float"],"quality-main10-native-float")
call([T/"tools/rocq2lean.py","tasks","--run",F/"statement"],"quality-main10-tasks")
call([T/"tools/rocq2lean.py","assemble","--run",F/"statement"],"quality-main10-assembly")
call([R/"scripts/corelib_lab.py","--translator",T,"--out",R/"work/runs/quality-main10-full"],"quality-main10-full")
call([R/"scripts/compare_corelib_runs.py",R/"work/runs/result-transport6-full",R/"work/runs/quality-main10-full","--out",R/"work/quality-main10-delta.json"],"quality-main10-delta")
d=json.loads((R/"work/quality-main10-delta.json").read_text())
assert not d["status_regressions"]and not d["validation_regressions"],d
call([T/"tests/statement/check_statement.py"],"quality-main10-statement-suite")
print("CAMPAIGN_COMPLETE",flush=True)

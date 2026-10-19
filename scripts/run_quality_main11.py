import pathlib,subprocess,sys
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/quality-main11/translator"
def call(args,label):
 print("START",label,flush=True)
 with(R/("work/logs/"+label+".log")).open("w")as f:
  rc=subprocess.run([sys.executable,*map(str,args)],stdout=f,stderr=subprocess.STDOUT).returncode
 print("END",label,rc,flush=True);assert rc==0,(label,rc)
call([R/"scripts/build_translator.py",T,R/"work/logs/quality-main11-build.log"],"quality-main11-build-driver")
call([R/"scripts/corelib_lab.py","--translator",T,"--out",R/"work/runs/quality-main11-wf","--module","Corelib.Init.Wf","--module","Corelib.Program.Wf"],"quality-main11-wf")
print("CAMPAIGN_COMPLETE",flush=True)

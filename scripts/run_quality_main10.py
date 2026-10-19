import pathlib,subprocess,sys,json
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/quality-main10/translator"
def call(args,label):
 print("START",label,flush=True)
 with(R/("work/logs/"+label+".log")).open("w")as f:
  rc=subprocess.run([sys.executable,*map(str,args)],stdout=f,stderr=subprocess.STDOUT).returncode
 print("END",label,rc,flush=True);assert rc==0,(label,rc)
call([R/"scripts/build_translator.py",T,R/"work/logs/quality-main10-build.log"],"quality-main10-build-driver")
call([R/"scripts/probe_quality_main.py",T,R/"work/tests/quality-main10"],"quality-main10-fixture")
call([R/"scripts/corelib_lab.py","--translator",T,"--out",R/"work/runs/quality-main10-targeted","--module","Corelib.BinNums.IntDef","--module","Corelib.BinNums.NatDef","--module","Corelib.Init.Datatypes","--module","Corelib.Init.Specif","--module","Corelib.Init.Logic","--module","Corelib.Floats.PrimFloat"],"quality-main10-core")
call([R/"scripts/test_quality_main.py",T,R/"work/tests/quality-main10",R/"work/tests/quality-main10-negatives"],"quality-main10-negatives")
print("CAMPAIGN_COMPLETE",flush=True)

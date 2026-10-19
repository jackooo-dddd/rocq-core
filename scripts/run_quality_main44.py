import pathlib,subprocess,sys
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/quality-main44/translator"
for args in [[R/"scripts/build_translator.py",T,R/"work/logs/quality-main44-build.log"],[R/"scripts/corelib_lab.py","--translator",T,"--out",R/"work/runs/quality-main44-families","--module","Corelib.Init.Equality","--module","Corelib.ssr.ssreflect_rw"]]:
 rc=subprocess.call([sys.executable,*map(str,args)]);print("STEP",rc,flush=True);assert rc==0
print("CAMPAIGN_COMPLETE",flush=True)

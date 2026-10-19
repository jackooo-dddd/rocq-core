import pathlib,subprocess,sys
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/quality-main14/translator"
for args in [
 [R/"scripts/build_translator.py",T,R/"work/logs/quality-main14-build.log"],
 [R/"scripts/probe_wf_projection_expanded.py"],
 [R/"scripts/corelib_lab.py","--translator",T,"--out",R/"work/runs/quality-main14-wf","--module","Corelib.Init.Wf","--module","Corelib.Program.Wf"]]:
 rc=subprocess.call([sys.executable,*map(str,args)]);print("step",rc,flush=True);assert rc==0
print("CAMPAIGN_COMPLETE",flush=True)

import pathlib,subprocess,sys
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/quality-main15/translator"
for args in [
 [R/"scripts/probe_wf_projection_audited.py"],
 [R/"scripts/probe_wf_controls.py",T,R/"work/tests/wf-projection-controls2"],
 [R/"scripts/corelib_lab.py","--translator",T,"--out",R/"work/runs/quality-main15-wf","--module","Corelib.Init.Wf","--module","Corelib.Program.Wf"]]:
 rc=subprocess.call([sys.executable,*map(str,args)]);print("step",rc,flush=True);assert rc==0
print("CAMPAIGN_COMPLETE",flush=True)

import pathlib,subprocess,sys
R=pathlib.Path(__file__).resolve().parents[1]
for args in [[R/"scripts/build_translator.py",R/"work/snapshots/quality-main13/translator",R/"work/logs/quality-main13-build.log"],[R/"scripts/probe_wf_projection_nonuniform.py"]]:
 rc=subprocess.call([sys.executable,*map(str,args)]);print("step",rc,flush=True);assert rc==0
print("CAMPAIGN_COMPLETE",flush=True)

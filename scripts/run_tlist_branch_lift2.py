import pathlib,subprocess,sys
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/tlist-branch-lift2/translator"
for args in [[R/"scripts/build_translator.py",T,R/"work/logs/tlist-branch-lift2-build.log"],[R/"scripts/probe_tlist_branch_lift2.py"]]:
 rc=subprocess.call([sys.executable,*map(str,args)]);print("step",rc,flush=True);assert rc==0
print("CAMPAIGN_COMPLETE",flush=True)

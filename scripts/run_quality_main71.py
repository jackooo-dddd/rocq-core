import pathlib,subprocess,sys
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/quality-main71/translator"
mods=["Corelib.Classes.CRelationClasses","Corelib.Classes.CMorphisms","Corelib.Classes.Equivalence","Corelib.Classes.Morphisms","Corelib.Classes.Morphisms_Prop","Corelib.Init.Sumbool","Corelib.ssr.ssrbool"]
args=[R/"scripts/corelib_lab.py","--translator",T,"--out",R/"work/runs/quality-main71-transport"]
for m in mods:args+=["--module",m]
for args in [[R/"scripts/build_translator.py",T,R/"work/logs/quality-main71-build.log"],args]:
 rc=subprocess.call([sys.executable,*map(str,args)]);print("STEP",rc,flush=True);assert rc==0
print("CAMPAIGN_COMPLETE",flush=True)

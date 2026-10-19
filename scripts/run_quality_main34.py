import pathlib,subprocess,sys
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/quality-main34/translator"
for args in [[R/"scripts/build_translator.py",T,R/"work/logs/quality-main34-build.log"],[R/"scripts/corelib_lab.py","--translator",T,"--out",R/"work/runs/quality-main34-classes","--module","Corelib.Classes.RelationClasses","--module","Corelib.Classes.CRelationClasses","--module","Corelib.Classes.CMorphisms","--module","Corelib.Classes.Morphisms","--module","Corelib.Classes.Morphisms_Prop"]]:
 rc=subprocess.call([sys.executable,*map(str,args)]);print("step",rc,flush=True);assert rc==0
print("CAMPAIGN_COMPLETE",flush=True)

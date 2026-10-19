import pathlib,sys,subprocess
O=pathlib.Path(__file__).resolve().parent
R=O.parents[2]
sys.exit(subprocess.call([sys.executable,str(R/"scripts/test_basic_interop.py"),
 str(R/"work/snapshots/quality-main75/translator"),str(R/"work/runs/quality-main75-full"),str(O)]))

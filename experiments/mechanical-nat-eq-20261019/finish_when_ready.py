from pathlib import Path
import time,subprocess,sys
W=Path(__file__).resolve().parent
while not (W/'runs/full-v1/summary.json').exists():time.sleep(5)
sys.exit(subprocess.call([sys.executable,str(W/'finish.py')]))

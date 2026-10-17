from pathlib import Path
import os,resource,subprocess,json,time
b=Path.home()/"research/rocq-core-by-file-20261018"
os.environ["ROCQ2LEAN_LEAN_THREADS"]="4"
os.environ["LEAN_NUM_THREADS"]="4"
resource.setrlimit(resource.RLIMIT_AS,(12<<30,12<<30))
resource.setrlimit(resource.RLIMIT_STACK,(8<<20,8<<20))
t=time.time()
p=subprocess.run(["bash","scripts/test-statement"],cwd=b/"translator")
(b/"experiments/statement-suite-result.json").write_text(json.dumps({"exit":p.returncode,"seconds":time.time()-t,"patch":"candidate-final/changes.diff"},indent=2))
raise SystemExit(p.returncode)

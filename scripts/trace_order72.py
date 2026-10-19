import pathlib,sys,subprocess,shutil,os
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/quality-main72-trace/translator"
subprocess.run([sys.executable,str(R/"scripts/build_translator.py"),str(T),str(R/"work/logs/quality-main72-trace-build.log")],check=True)
M=R/"work/runs/quality-main71-transport/Corelib/Classes/CMorphisms";O=R/"work/tests/order-coercion-trace72";O.mkdir()
for n in ["source.ndjson","contract.json"]:shutil.copy2(M/n,O/n)
env=os.environ.copy();env["ROCQ2LEAN_TRACE_COERCIONS"]="StrictOrder"
with(O/"trace.log").open("w")as f:
 rc=subprocess.run([sys.executable,"-I",str(T/"tools/rocq2lean.py"),"translate","--input",str(O/"source.ndjson"),"--out",str(O)],stdout=f,stderr=subprocess.STDOUT,env=env).returncode
print("TRACE_COMPLETE",rc,flush=True)

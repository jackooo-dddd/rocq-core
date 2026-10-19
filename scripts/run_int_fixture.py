import pathlib,sys,subprocess
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/int-roundtrip2/translator"
out=R/"work/tests/int-literal-export2"
subprocess.run([sys.executable,"-I",str(T/"tools/rocq2lean.py"),"export","--mode","statement","--manifest",str(R/"translator/fixtures/corelib-int-literals/source.json"),"--roots",",".join("CoreInt.Literals."+n for n in ["zero_lit","one_lit","high_lit","max_lit"]),"--out",str(out)],check=True)
subprocess.run([sys.executable,str(R/"scripts/test_int_roundtrip.py"),str(T),str(out/"source.ndjson"),str(R/"work/tests/int-literals-checked3"),"-Q",str(R/"translator/fixtures/corelib-int-literals"),"CoreInt","--","CoreInt.Literals"],check=True)

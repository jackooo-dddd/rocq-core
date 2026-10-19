from pathlib import Path
import sys,subprocess,json,time,os,hashlib
W=Path(__file__).resolve().parents[1];R=W.parents[1]
T=R/'experiments/mechanical-nat-eq-20261019/translator'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
packages=Path(os.environ.get('CORRESPONDENCE_MATHLIB_PACKAGES',str(Path.home()/'research/leanbuddy-work/lean-prosa-v06-master/.lake/packages')))
mathlib=packages/'mathlib'
assert (mathlib/'lean-toolchain').read_text().strip()=='leanprover/lean4:v4.33.1'
libs=[p/'.lake/build/lib/lean' for p in packages.iterdir() if (p/'.lake/build/lib/lean').exists()]
env=cli.lean_env();env['LEAN_PATH']=':'.join(map(str,[W/'.work/interop',T/'.lake/build/lib/lean',*libs]))
# Original correspondence and original Rocq2LeanOut directories are intentionally absent.
src=W/'interop/Consumer.lean'
start=time.time()
with (W/'reports/interop/consumer.log').open('w') as log:
 p=subprocess.run([str(Path.home()/'.elan/bin/lean'),*cli.native_args(),'-o',str(W/'.work/interop/Consumer.olean'),str(src)],cwd=W,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300)
row=dict(consumer_sha256=hashlib.sha256(src.read_bytes()).hexdigest(), mathlib_commit=subprocess.check_output(['git','rev-parse','HEAD'],cwd=mathlib,text=True).strip(), mathlib_prime_olean_sha256=hashlib.sha256((mathlib/'.lake/build/lib/lean/Mathlib/Data/Nat/Prime/Basic.olean').read_bytes()).hexdigest(), exit=p.returncode,seconds=round(time.time()-start,3),mathlib_path=str(mathlib),toolchain=(mathlib/'lean-toolchain').read_text().strip(),original_profile_search_paths=False)
(W/'reports/interop/consumer-validation.json').write_text(json.dumps(row,indent=2))
print(row,flush=True)
sys.exit(p.returncode)

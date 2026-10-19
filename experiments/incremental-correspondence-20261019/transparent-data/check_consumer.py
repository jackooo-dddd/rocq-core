"""Check the two native-consumer examples without old profile search paths."""
from pathlib import Path
import os,sys,json,subprocess,time,hashlib
D=Path(__file__).resolve().parent;W=D.parent;R=W.parents[1];P=W/'.work/transparent-data'
T=R/'experiments/mechanical-nat-eq-20261019/translator'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
packages=Path(os.environ.get('CORRESPONDENCE_MATHLIB_PACKAGES',str(Path.home()/'research/leanbuddy-work/lean-prosa-v06-master/.lake/packages')))
env=cli.lean_env();env['LEAN_PATH']=':'.join(map(str,[P,T/'.lake/build/lib/lean']))+':'+':'.join(str(p/'.lake/build/lib/lean') for p in packages.iterdir() if (p/'.lake/build/lib/lean').exists())
module=sys.argv[1] if len(sys.argv)>1 else 'Consumer'
assert module in ['Consumer','Composition']
label=module.lower()
names=['countdownValue','mechanicalFiniteWitness_value','mechanicalFiniteWitness_in_range','mechanicalPrimeSelection_agrees','mechanicalPrimeSelection_value','mechanicalPrimeSelection_bound']
if module=='Composition':names=['mechanicalCount_agrees','selectedPrime_agrees','selectedPrime_prime','selectedPrime_bound']
names=['NativeBridge.ComputationalCorrespondence.'+module+'.'+n for n in names]
env['LEAN_PATH']=str(P/'regression')+':'+env['LEAN_PATH']
start=time.time()
with (P/(label+'.log')).open('w') as log:
 a=subprocess.run([str(Path.home()/'.elan/bin/lean'),*cli.native_args(),'-o',str(P/(module+'.olean')),str(D/(module+'.lean'))],cwd=W,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300)
 if a.returncode:print((P/(label+'.log')).read_text());sys.exit(a.returncode)
src=P/('Check'+module+'.lean')
code='import '+module+'\nopen Lean in\nrun_cmd Lean.Elab.Command.liftTermElabM do\n  let mut rows : Array Json := #[]\n'
for n in names:
 code+='  let n := '+json.dumps(n)+'.toName\n  let axs ← collectAxioms n\n  for ax in axs do\n    unless ["propext","Quot.sound","Classical.choice"].contains ax.toString do throwError "Unexpected axiom {ax}"\n  rows := rows.push (Json.mkObj [("certificate",.str n.toString),("axioms",toJson (axs.map Name.toString))])\n'
code+='  IO.FS.writeFile '+json.dumps(str(D/('reports/'+label+'-audit.json')))+' (Json.pretty (.arr rows))\n'
src.write_text(code)
with (P/(label+'-audit.log')).open('w') as log:
 a=subprocess.run([str(Path.home()/'.elan/bin/lean'),*cli.native_args(),str(src)],cwd=W,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300)
 if a.returncode:print((P/(label+'-audit.log')).read_text());sys.exit(a.returncode)
row=dict(exit=0,seconds=round(time.time()-start,3),proofs=len(names),source_sha256=hashlib.sha256((D/(module+'.lean')).read_bytes()).hexdigest(),
 original_profile_search_paths=False,profile=module,examples=['Dependent Fin data from mechanical well-founded elimination','Mathlib Prime.two_le applied to transported mechanical conditional choice'],
 scope='Transparent variant only; these examples add no new root counts.')
if module=='Composition':row['examples']=['Mechanical nat.iter to native Nat to transparent SSR selection to Mathlib Prime.two_le']
(D/('reports/'+label+'-validation.json')).write_text(json.dumps(row,indent=2)+'\n')
print(row)

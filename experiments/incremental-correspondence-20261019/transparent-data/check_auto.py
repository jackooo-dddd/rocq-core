"""Positive composition, executable result, and rejection of incomplete or untrusted input."""
from pathlib import Path
import os,sys,json,subprocess,time,hashlib
D=Path(__file__).resolve().parent;W=D.parent;R=W.parents[1];P=W/'.work/transparent-data'
T=R/'experiments/mechanical-nat-eq-20261019/translator'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
packages=Path(os.environ.get('CORRESPONDENCE_MATHLIB_PACKAGES',str(Path.home()/'research/leanbuddy-work/lean-prosa-v06-master/.lake/packages')))
env=cli.lean_env();env['LEAN_PATH']=':'.join(map(str,[P,P/'regression',T/'.lake/build/lib/lean']))+':'+':'.join(str(p/'.lake/build/lib/lean') for p in packages.iterdir() if (p/'.lake/build/lib/lean').exists())
start=time.time()
def run(src,output=False):
 args=[str(Path.home()/'.elan/bin/lean'),*cli.native_args()]
 if output:args+=['-o',str(P/(src.stem+'.olean'))]
 a=subprocess.run([*args,str(src)],cwd=W,env=env,capture_output=True,text=True,timeout=120)
 (P/(src.stem+'.log')).write_text(a.stdout+a.stderr)
 return a
for module in ['AutoCompose','AutoExample']:
 a=run(D/(module+'.lean'),True)
 assert a.returncode==0,a.stdout+a.stderr
assert '\n4\n' in a.stdout,a.stdout
tests=[
 ('AutoMissingRule',"""import AutoCompose
import Consumer
namespace HiddenUser
private noncomputable def concealed (n : Nat) := NativeBridge.ComputationalCorrespondence.Consumer.mechanicalPrimeSelection.val n
native_compose refused := (fun n : Nat => concealed n) using []
end HiddenUser
""",'Composition still contains source symbols'),
 ('AutoUndischargedCondition',"""import AutoCompose
import Consumer
open NativeBridge.ComputationalCorrespondence
namespace HiddenUser
theorem onEven (n : Nat) (h : n % 2 = 0) : Consumer.mechanicalPrimeSelection.val n = 2 := by
  rw [Consumer.mechanicalPrimeSelection_value]
  simp [h]
native_compose refused := (fun n : Nat => Consumer.mechanicalPrimeSelection.val n) using [onEven]
end HiddenUser
""",'Composition still contains source symbols'),
 ('AutoUntrustedEquation',"""import AutoCompose
namespace HiddenUser
axiom forgedEquation : (0 : Nat) = 1
native_compose refused := (fun _ : Nat => (0 : Nat)) using [forgedEquation]
end HiddenUser
""",'Unexpected axiom HiddenUser.forgedEquation')]
rejections=[]
for name,body,expected in tests:
 p=P/(name+'.lean');p.write_text(body);a=run(p)
 assert a.returncode!=0 and expected in a.stdout,(name,a.returncode,a.stdout+a.stderr)
 rejections.append(dict(case=name,rejected=True,reason=expected))
p=P/'CheckAutoComposition.lean'
p.write_text("""import CombinedTransparent
import AutoExample
open Lean in
run_cmd Lean.Elab.Command.liftTermElabM do
  for n in ["NativeBridge.ComputationalCorrespondence.AutoExample.selectedSum.correspondence".toName, "NativeBridge.ComputationalCorrespondence.AutoExample.nativeIdentity.correspondence".toName] do
   for ax in (← collectAxioms n) do
    unless ["propext","Quot.sound","Classical.choice"].contains ax.toString do throwError "Unexpected axiom {ax}"
""")
a=run(p);assert a.returncode==0,a.stdout+a.stderr
result=dict(exit=0,seconds=round(time.time()-start,3),generated_definitions=2,generated_correspondence_proofs=2,universe_polymorphic_example=True,
 kernel_checked=True,executable_result=4,full_variant_coimport=True,rejection_cases=rejections,
 source_sha256={m:hashlib.sha256((D/(m+'.lean')).read_bytes()).hexdigest() for m in ['AutoCompose','AutoExample']},
 scope='Composition of supplied proved rewrites and definitional reduction. A native target is accepted only if its recursive type/body closure has no source symbols. This adds no new Corelib roots.')
(D/'reports/auto-composition-validation.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result),flush=True)

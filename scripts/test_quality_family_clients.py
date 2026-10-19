#!/usr/bin/env python3
"""Fresh-import consumers for generated quality branches; not production coverage."""
import pathlib,json,sys,subprocess
R=pathlib.Path(__file__).resolve().parents[1]
T=pathlib.Path(sys.argv[1]) if len(sys.argv)>1 else R/"work/snapshots/quality-plan3/translator"
O=pathlib.Path(sys.argv[2]) if len(sys.argv)>2 else R/"work/tests/quality-family-clients"
O.mkdir(parents=True)
fixture=R/"work/tests/quality-plan4"
assert json.loads((fixture/"result.json").read_text())["status"]=="PASS"
s=(fixture/"Candidates.lean").read_text().replace(str(fixture/"candidates.json"),str(O/"candidates.json"))
(O/"Generated.lean").write_text(s)
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
env=cli.lean_env();env["LEAN_PATH"]=str(O)+":"+str(T/".lake/build/lib/lean")
lean=str(pathlib.Path.home()/".elan/bin/lean")
def run(args,log):
 with (O/log).open("w") as f:
  rc=subprocess.run([lean,*cli.native_args(),*args],cwd=O,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=300).returncode
 assert rc==0,(O/log).read_text()
run(["-o","Generated.olean","Generated.lean"],"generation.log")
text="import Generated\nuniverse u v w z\n"
laws=[]
for short,ctor in [("prod","pair"),("sig","exist"),("sig2","exist2"),("sigT","existT"),("sigT2","existT2")]:
 for branch in ["qualityProp","qualityType"]:
  prop=branch=="qualityProp"
  n="Rocq.Corelib.Init."+("Datatypes" if short=="prod" else "Specif")+"."+short+"."+branch
  a="Prop" if prop else "Sort u"
  if short=="prod":
   b="Prop" if prop else "Sort v"
   binders=f"(A : {a}) (B : {b})"
   pars="A B";fields="(x : A) (y : B)";args="x y"
  else:
   b="Prop" if prop or short in ["sig","sig2"] else "Sort v"
   binders=f"(A : {a}) (P : A → {b})";pars="A P";fields="(x : A) (y : P x)";args="x y"
   if short in ["sig2","sigT2"]:
    c="Prop" if prop or short=="sig2" else "Sort w"
    binders+=f" (Q : A → {c})";pars+=" Q";fields+=" (q : Q x)";args+=" q"
  value=f"({n}.{ctor} {pars} {args})"
  law=short+"_"+branch+"_beta";laws.append(law)
  text+=f"""theorem {law} {binders}
    (motive : {n} {pars} → Sort z)
    (step : ∀ {fields}, motive {value}) {fields} :
    (@{n}.rec {pars} motive step {value}) = step {args} := rfl
#print axioms {law}
"""
(O/"Clients.lean").write_text(text)
run(["-o","Clients.olean","Clients.lean"],"clients.log")
assert (O/"clients.log").read_text().count("does not depend on any axioms")==10
result={"status":"PASS","fresh_import":True,"generated_branches":10,"dependent_recursor_beta_laws":laws,"arbitrary_motive_sort":True,"axiom_free_laws":10,"pipeline_dispatch_integrated":False}
(O/"result.json").write_text(json.dumps(result,indent=2)+"\n")
print(json.dumps(result),flush=True)

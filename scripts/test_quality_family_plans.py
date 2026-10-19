#!/usr/bin/env python3
"""Generate both branches from real source declarations; audit every target signature.
Candidate representations only: no main translation result is relabelled."""
import pathlib,sys,json,copy,subprocess,os
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1])if len(sys.argv)>1 else R/"work/snapshots/quality-plan3/translator";O=pathlib.Path(sys.argv[2])if len(sys.argv)>2 else R/"work/tests/quality-plan3"
assert T.exists();O.mkdir(parents=True)
assert json.loads((R/"work/logs/quality-plan3-build.json").read_text())["exit"]==0

print("SNAPSHOT_READY",flush=True)
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli,audit
source=R/"work/tests/template-quality-metadata/source.ndjson"
assert json.loads((source.parent/"result.json").read_text())["status"]=="PASS"
names=["Corelib.Init.Datatypes.prod"]+["Corelib.Init.Specif."+n for n in ["sig","sig2","sigT","sigT2"]]
decls={d["name"]:d for l in source.read_text().splitlines()if(d:=json.loads(l)).get("name")in names}
assert len(decls)==5
neg=[]
for tag in ["wrong-default","wrong-conclusion","wrong-shared-index","wrong-level-binding","missing-quality-binding"]:
 d=copy.deepcopy(decls[names[0]]);ti=d["native"]["template_info"]
 if tag=="wrong-default":ti["default_qualities"]=[{"k":"prop"}]
 elif tag=="wrong-conclusion":ti["conclusion_quality"]={"k":"type"}
 elif tag=="wrong-shared-index":ti["parameter_qualities"][1]={"k":"var","i":1}
 elif tag=="wrong-level-binding":ti["param_arguments"][0]["u"][0]["bound"]=9
 else:del ti["parameter_qualities"]
 neg.append({"label":tag,"declaration":d})
(O/"negative-inputs.json").write_text(json.dumps(neg))
lean=O/"Candidates.lean"
code="""import Rocq2Lean
open Lean Elab Command Meta Rocq2Lean
elab "#quality_candidates" : command => do
  let src ← IO.ofExcept (IR.parseSource (← IO.FS.readFile SOURCE))
  let bad ← IO.ofExcept (Json.parse (← IO.FS.readFile NEGATIVES))
  for item in (← IO.ofExcept bad.getArr?) do
    let raw ← IO.ofExcept (item.getObjVal? "declaration")
    let .inductive i ← IO.ofExcept (IR.parseDecl raw) | throwError "not an inductive"
    unless (qualityFamilyPlan i).toOption.isNone do throwError "invalid quality binding accepted"
  liftTermElabM do
    let mut rows : Array Json := #[]
    for d in src.decls do
      let .inductive i := d | continue
      unless NAMES.contains i.name do continue
      let plan ← IO.ofExcept (qualityFamilyPlan i)
      for variant in #[plan.propBranch,plan.typeBranch] do
        let genv : GEnv := { facts := src.facts, protectedNames := ({} : Std.HashSet String).insert variant.name }
        let (r,tgt) ← processInductiveCore genv {} variant Json.null
        unless r.accepted && tgt.isSome do throwError "{variant.name}: {r.status}: {r.message}"
        rows := rows.push r.toJson
    unless rows.size == 10 do throwError "family branch missing"
    IO.FS.writeFile OUTPUT (Json.arr rows).pretty
#quality_candidates
"""
code=code.replace("SOURCE",json.dumps(str(source))).replace("NEGATIVES",json.dumps(str(O/"negative-inputs.json"))).replace("OUTPUT",json.dumps(str(O/"candidates.json"))).replace("NAMES","(#["+ ",".join(json.dumps(n)for n in names)+"] : Array String)")
for name in names:
 for branch in ["qualityProp","qualityType"]:
  code+="#print axioms Rocq."+name+"."+branch+"\n"
lean.write_text(code)
env=cli.lean_env();env["LEAN_PATH"]=str(T/".lake/build/lib/lean")
with(O/"kernel.log").open("w")as log:
 rc=subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(lean)],cwd=T,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300).returncode
assert rc==0,(O/"kernel.log").read_text()
assert (O/"kernel.log").read_text().count("does not depend on any axioms")==10
rows=json.loads((O/"candidates.json").read_text())
def derive(d,branch):
 d=copy.deepcopy(d);ti=d["native"]["template_info"]
 assert ti["default_qualities"]==[{"k":"type"}]and ti["conclusion_quality"]=={"k":"var","i":0}
 binding=audit.template_binding(d);levels=set(binding)
 assert all(q is None or q=={"k":"var","i":0}for q in ti["parameter_qualities"])
 assert d["npars"]==len(d["params"])and len(d["bodies"])==1 and not d["bodies"][0]["indices"]
 d["name"]+="."+branch;d["bodies"][0]["name"]=branch
 if branch=="qualityProp":
  def lower(x):
   if isinstance(x,list):return[lower(v)for v in x]
   if not isinstance(x,dict):return x
   if x.get("k")=="sort"and x["s"].get("k")=="type":
    us=x["s"]["u"]
    if any(u["l"].get("n")in levels for u in us):
     assert all(u["n"]==0 and(u["l"].get("n")in levels or u["l"]["k"]=="set")for u in us)
     return {"k":"sort","s":{"k":"prop"}}
   return{k:lower(v)for k,v in x.items()}
  d["params"]=lower(d["params"]);d["bodies"]=lower(d["bodies"])
  d["bodies"][0]["sort"]={"k":"prop"};d["bodies"][0]["relevance"]="I"
  d["native"]["template"]=False
 else:
  ti["concl"]["k"]="type"
  for a in ti["param_arguments"]:
   if a is not None:a["k"]="type"
 return d
derived={n+"."+branch:derive(d,branch)for n,d in decls.items()for branch in["qualityProp","qualityType"]}
def check(row):
 d=derived[row["source"]];b=d["bodies"][0]
 want,ctors=audit.generated_names(d["name"],b["name"],[c["name"]for c in b["ctors"]])
 assert row["target"]==want and[c["name"]for c in row["target_ctors"]]==ctors
 assert row["num_params"]==d["npars"]and not row["pending_hypotheses"]
 aud=audit.Auditor(derived,rows);audit.ADMIT[0]=audit.template_sort_block(d,row)
 try:
  aud.check(audit.template_sort_arity(d,row,b["type"]),row["target_type"],["arity"],[])
  self_ref=("const",want,[{"k":"param","n":l}for l in row["level_params"]])
  for c,tc in zip(b["ctors"],row["target_ctors"]):aud.check(c["type"],tc["type"],["ctor "+c["name"]],[self_ref])
 finally:audit.ADMIT[0]=set()
for row in rows:check(row)
mutations=[]
for row in rows:
 for tag in["wrong-result-sort","wrong-constructor-type"]:
  bad=copy.deepcopy(row)
  if tag=="wrong-result-sort":
   cur=bad["target_type"]
   while cur["k"]=="forall":cur=cur["b"]
   cur["l"]={"k":"zero"}if row["source"].endswith("qualityType")else{"k":"succ","l":{"k":"zero"}}
  else:bad["target_ctors"][0]["type"]={"k":"sort","l":{"k":"zero"}}
  try:check(bad)
  except(audit.Mismatch,AssertionError):mutations.append([row["source"],tag])
  else:raise AssertionError(("mutation accepted",row["source"],tag))
result={"status":"PASS","source_inductives":5,"kernel_checked_branches":10,"independently_checked_signatures":10,"source_binding_negative_controls":[x["label"]for x in neg],"target_negative_controls":mutations,"pipeline_dispatch_integrated":False}
(O/"result.json").write_text(json.dumps(result,indent=2)+"\n");print(json.dumps(result),flush=True)

#!/usr/bin/env python3
"""Experimental family dispatch through the real term translator and fresh clients.
This does not certify production root coverage: report/audit family integration is pending.
"""
import pathlib,sys,subprocess,json,os
R=pathlib.Path(__file__).resolve().parents[1]
T=pathlib.Path(sys.argv[1]) if len(sys.argv)>1 else R/"work/snapshots/quality-dispatch3/translator"
S=R/"work/tests/quality-source-native4"
O=pathlib.Path(sys.argv[2]) if len(sys.argv)>2 else R/"work/tests/quality-dispatch-kernel2"
O.mkdir(parents=True)
harness="import Rocq2Lean\nopen Lean Elab Command Meta Rocq2Lean\nelab \"#quality_dispatch_test\" : command => do\n  let src ← IO.ofExcept (IR.parseSource (← IO.FS.readFile SOURCE))\n  liftTermElabM do\n    let qe := sourceQualityEnv src.decls\n    let mut pairs : Std.HashMap String (IndTarget × IndTarget) := {}\n    let mut genv : GEnv := {facts := src.facts, protectedNames := src.decls.foldl (fun ns d => ns.insert d.name) {}}\n    let mut results : Std.HashMap String DeclResult := {}\n    let mut rows : Array Json := #[]\n    let mut branches : Array Json := #[]\n    for d in src.decls do\n      match d with\n      | .inductive i =>\n        if let some p := qe.families[i.name]? then\n          let (pr,pt) ← processInductiveCore genv results p.propBranch Json.null\n          let (tr,tt) ← processInductiveCore genv results p.typeBranch Json.null\n          unless pr.accepted && tr.accepted do throwError \"family {i.name}: {pr.status} / {tr.status}\"\n          let some pt := pt | throwError \"no Prop target\"\n          let some tt := tt | throwError \"no Type target\"\n          pairs := pairs.insert i.name (pt,tt)\n          genv := {genv with inds:=genv.inds.insert i.name tt, qualitySelect:=some (qualityDispatch qe pairs)}\n          results := results.insert i.name {tr with source:=i.name}\n          for r in #[pr,tr] do\n            branches := branches.push r.toJson\n            for n in r.target.toArray ++ r.targetCtors.map (·.1) do\n              genv := {genv with constGlobals:=genv.constGlobals.insert n r.paramLevels}\n            for (l,_) in r.templateParams do genv := {genv with templateLevels:=genv.templateLevels.insert l}\n        else\n          let (r,t) ← processInductiveCore genv results i src.rawDecls[i.name]!\n          unless r.accepted do throwError \"{i.name}: {r.status}: {r.message}\"\n          let some t := t | throwError \"no generated target\"\n          genv := {genv with inds:=genv.inds.insert i.name t}\n          results := results.insert i.name r\n          branches := branches.push r.toJson\n      | .constant c =>\n        let mut r : DeclResult := {source:=c.name,kind:=\"constant\",status:=\"NOT_ATTEMPTED\"}\n        for (it,ul) in [(false,false),(true,false),(false,true),(true,true)] do\n          let before ← saveState\n          r ← processConstant genv results c (interp:=it) (polyLift:=ul)\n          if r.accepted then break\n          before.restore\n        rows := rows.push r.toJson\n        results := results.insert c.name r\n        if r.accepted then\n          let some n := r.target | throwError \"no constant target\"\n          genv := {genv with consts:=genv.consts.insert c.name n, constLevels:=genv.constLevels.insert c.name r.levelParams.length, constGlobals:=genv.constGlobals.insert n r.paramLevels}\n        else\n          logInfo m!\"{c.name}: {r.status}: {r.message}\"\n    IO.FS.writeFile OUTPUT ((Json.mkObj [(\"branches\",Json.arr branches),(\"constants\",Json.arr rows)]).pretty)\n#quality_dispatch_test\n"
harness=harness.replace("SOURCE",json.dumps(str(S/"source.ndjson"))).replace("OUTPUT",json.dumps(str(O/"report.json")))
(O/"Dispatch.lean").write_text(harness)
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
env=cli.lean_env();env["LEAN_PATH"]=str(O)+":"+str(T/".lake/build/lib/lean")
lean=str(pathlib.Path.home()/".elan/bin/lean")
def run(args,log):
 with(O/log).open("w")as f:
  rc=subprocess.run([lean,*cli.native_args(),*args],cwd=O,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=600).returncode
 assert rc==0,(O/log).read_text()
run(["-o","Dispatch.olean","Dispatch.lean"],"kernel.log")
report=json.loads((O/"report.json").read_text());rows={r["source"]:r for r in report["constants"]}
accepted=[r for r in rows.values()if r["status"]=="TRANSLATED_AND_CHECKED"]
def constants(t):
 if isinstance(t,dict):
  if t.get("k")=="const":yield t["n"]
  for v in t.values():yield from constants(v)
 elif isinstance(t,list):
  for v in t:yield from constants(v)
checked=[];client="import Dispatch\n"
for family in ["prod","sig","sig2","sigT","sigT2"]:
 for b,branch in [("p","qualityProp"),("t","qualityType")]:
  prefix="Rocq.Corelib.Init."+("Datatypes"if family=="prod"else"Specif")+"."+family+"."+branch
  for op in ["mk","use"]:
   name="CoreQualitySource.Source."+op+"_"+family+"_"+b;r=rows[name]
   assert r["status"]=="TRANSLATED_AND_CHECKED",(name,r["status"],r["message"])
   assert any(n.startswith(prefix+".")for n in constants(r["target_value"])),(name,"wrong constructor/recursor branch")
   checked.append(name)
  truth="Rocq.Corelib.Init.Logic.True.I"
  args=(truth if b=="p"else"7")+" "+truth+(" "+truth if family in ["sig2","sigT2"]else"")
  law=family+"_"+b+"_compute"
  client+=f"theorem {law} : Rocq.CoreQualitySource.Source.use_{family}_{b} (Rocq.CoreQualitySource.Source.mk_{family}_{b} {args}) = {0 if b=='p' else 7} := rfl\n#print axioms {law}\n"
for r in accepted:client+="#print axioms "+r["target"]+"\n"
(O/"Consumer.lean").write_text(client)
run(["-o","Consumer.olean","Consumer.lean"],"consumer.log")
assert(O/"consumer.log").read_text().count("does not depend on any axioms")==len(accepted)+10
replay={"results":report["branches"]+accepted};(O/"replay-input.json").write_text(json.dumps(replay))
(O/"Replay.lean").write_text('import Rocq2Lean.Replay\n#rocq2lean_replay '+json.dumps(str(O/"replay-input.json"))+' '+json.dumps(str(O/"replay-result.json"))+'\n')
run(["Replay.lean"],"replay.log")
rr=json.loads((O/"replay-result.json").read_text())["results"]
assert all(r["kernel"]=="ACCEPTED"for r in rr),rr
result={"status":"PASS","checked_constructor_and_case_functions":checked,"fresh_import_computation_laws":10,"axiom_free_accepted_constants":len(accepted),"standalone_kernel_replayed":len(rr),"other_fixture_failures":[{"source":r["source"],"status":r["status"],"message":r["message"]}for r in rows.values()if r["status"]!="TRANSLATED_AND_CHECKED"],"production_family_registration":False,"independent_body_audit_integrated":False,"new_certified_core_roots":0}
(O/"result.json").write_text(json.dumps(result,indent=2)+"\n")
print(json.dumps({k:v for k,v in result.items()if k!="other_fixture_failures"}),flush=True)

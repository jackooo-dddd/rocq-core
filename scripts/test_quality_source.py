#!/usr/bin/env python3
"""Three-way source-context quality comparison: Rocq, Lean analysis, Python replay."""
import pathlib,sys,subprocess,json,copy
R=pathlib.Path(__file__).resolve().parents[1]
T=pathlib.Path(sys.argv[1])if len(sys.argv)>1 else R/"work/snapshots/quality-dispatch3/translator"
S=pathlib.Path(sys.argv[2])if len(sys.argv)>2 else R/"work/tests/quality-source-native4"
O=pathlib.Path(sys.argv[3])if len(sys.argv)>3 else R/"work/tests/quality-source-checked"
O.mkdir(parents=True)
code="import Rocq2Lean\nopen Lean Elab Command Rocq2Lean\n\npartial def qualityOccurrences (e : SourceQualityEnv) (owner : String)\n    (ctx : SourceQualityContext) (path : Array Nat) (t : IR.Term) : Array Json := Id.run do\n  let walk := qualityOccurrences e owner\n  let mut rows := #[]\n  if let .app (.ind i _) args := t then\n    if let some plan := e.families[i.mind]? then\n      rows := rows.push (Json.mkObj [(\"owner\",toJson owner),(\"path\",toJson path),\n        (\"reference\",toJson (i.mind ++ \":\" ++ toString i.idx)),\n        (\"result_quality\",toJson ((sourceTemplateQuality e ctx plan args).map SourceQuality.label |>.getD \"UNKNOWN\"))])\n  match t with\n  | .prod n ty b | .lam n ty b =>\n    rows := rows ++ walk ctx (path.push 0) ty\n    rows := rows ++ walk (ctx.push {name:=n,body:=none,type:=ty}) (path.push 1) b\n  | .letIn n v ty b =>\n    rows := rows ++ walk ctx (path.push 0) v ++ walk ctx (path.push 1) ty\n    rows := rows ++ walk (ctx.push {name:=n,body:=some v,type:=ty}) (path.push 2) b\n  | .app f args =>\n    rows := rows ++ walk ctx (path.push 0) f\n    for a in args, k in [:args.size] do rows := rows ++ walk ctx (path.push (k+1)) a\n  | .cast v _ ty => rows := rows ++ walk ctx (path.push 0) v ++ walk ctx (path.push 1) ty\n  | _ => pure ()\n  return rows\n\nelab \"#quality_source_test\" : command => do\n  let src ← IO.ofExcept (IR.parseSource (← IO.FS.readFile SOURCE))\n  let e := sourceQualityEnv src.decls\n  let mut rows := #[]\n  for d in src.decls do\n    let .constant c := d | continue\n    unless c.name.startsWith \"CoreQualitySource.Source.\" do continue\n    if let some b := c.body then rows := rows ++ qualityOccurrences e c.name #[] #[] b\n  IO.FS.writeFile OUTPUT (Json.arr rows).pretty\n  let some p := e.families[\"Corelib.Init.Datatypes.prod\"]? | throwError \"no family\"\n  let truth : IR.Term := .ind {mind:=\"Corelib.Init.Logic.True\",idx:=0} #[]\n  let nat : IR.Term := .ind {mind:=\"Corelib.Init.Datatypes.nat\",idx:=0} #[]\n  unless sourceTemplateQuality e #[] p #[truth,truth] == some .prop do throwError \"Prop branch\"\n  unless sourceTemplateQuality e #[] p #[truth,nat] == some .type do throwError \"mixed Type branch\"\n  let missing : IR.Term := .const \"Missing.Source\" #[]\n  for args in #[#[truth],#[truth,missing],#[.rel 0,truth]] do\n    unless (sourceTemplateQuality e #[] p args).isNone do throwError \"unknown context guessed\"\n  unless (sourceTemplateQuality e #[] p #[truth,truth] 0).isNone do throwError \"fuel guessed\"\n  let pn : IR.AName := {name:=some \"A\",rel:=.relevant}\n  let propCtx : SourceQualityContext := #[{name:=pn,body:=none,type:=.sort .prop}]\n  let typeCtx : SourceQualityContext := #[{name:=pn,body:=none,type:=.sort (.type #[{level:=.set,offset:=0}])}]\n  unless sourceTemplateQuality e propCtx p #[.rel 0,truth] == some .prop do throwError \"source Prop context\"\n  unless sourceTemplateQuality e typeCtx p #[.rel 0,truth] == some .type do throwError \"source Type context\"\n  -- A local definition's declared type must not be replaced with its value's type.\n  let annotated := typeCtx.set! 0 {typeCtx[0]! with body:=some truth}\n  unless sourceTemplateQuality e annotated p #[.rel 0,truth] == some .type do throwError \"annotation narrowed\"\n#quality_source_test\n"
code=code.replace("SOURCE",json.dumps(str(S/"source.ndjson"))).replace("OUTPUT",json.dumps(str(O/"lean.json")))
(O/"Check.lean").write_text(code)
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli,quality_source
env=cli.lean_env();env["LEAN_PATH"]=str(T/".lake/build/lib/lean")
with(O/"kernel.log").open("w")as log:
 rc=subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(O/"Check.lean")],cwd=T,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300).returncode
assert rc==0,(O/"kernel.log").read_text()
roots=set(json.loads((S/"roots.json").read_text()))
decls={d["name"]:d for l in(S/"source.ndjson").read_text().splitlines()if(d:=json.loads(l)).get("kind")in("constant","inductive")}
a=quality_source.QualityAnalysis(decls);py=[]
for name,d in decls.items():
 if name in roots and d["kind"]=="constant"and d.get("body"):py+=quality_source.occurrences(a,name,d["body"])
(O/"python.json").write_text(json.dumps(py,indent=2))
native=[json.loads(l)for l in(S/"native.ndjson").read_text().splitlines()]
native=[r for r in native if r["owner"]in roots and r["phase"]=="body"and r["kind"]=="template_application"]
def keyed(rows):return{(r["owner"],tuple(r["path"]),r["reference"]):r["result_quality"]for r in rows}
n=keyed(native);l=keyed(json.loads((O/"lean.json").read_text()));p=keyed(py)
assert len(n)>=35 and n==l==p,{"native":n,"lean":l,"python":p}
truth={"k":"ind","ind":{"mind":"Corelib.Init.Logic.True","i":0},"u":[]}
missing={"k":"const","c":"Missing.Source","u":[]}
name="Corelib.Init.Datatypes.prod";neg=[]
for tag,args,fuel in [("missing-argument",[truth],256),("missing-declaration",[truth,missing],256),("missing-context",[{"k":"rel","i":0},truth],256),("zero-budget",[truth,truth],0)]:
 try:a.select(name,args,(),fuel)
 except quality_source.UnknownQuality:neg.append(tag)
 else:raise AssertionError((tag,"guessed quality"))
pn={"n":"A","r":"R"};typectx=[{"n":pn,"body":truth,"ty":quality_source._sort("type")}]
assert a.select(name,[{"k":"rel","i":0},truth],typectx)=="Type"
propctx=[{"n":pn,"body":None,"ty":quality_source._sort("prop")}]
assert a.select(name,[{"k":"rel","i":0},truth],propctx)=="Prop"
spropctx=[{"n":pn,"body":None,"ty":quality_source._sort("sprop")}]
try:a.select(name,[{"k":"rel","i":0},truth],spropctx)
except quality_source.UnknownQuality:neg.append("unvalidated-SProp")
else:raise AssertionError("SProp silently mapped")
result={"status":"PASS","source_definitions":len(roots),"native_Lean_Python_agree":len(n),"counts":{q:list(n.values()).count(q)for q in["Prop","Type"]},"unknowns_refused":neg,"local_annotation_preserved":True,"production_family_registration":False}
(O/"result.json").write_text(json.dumps(result,indent=2)+"\n")
print(json.dumps(result),flush=True)

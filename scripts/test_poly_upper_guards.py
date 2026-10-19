import pathlib,sys,json,copy,subprocess
T=pathlib.Path(sys.argv[1]).resolve();S=pathlib.Path(sys.argv[2]).resolve();O=pathlib.Path(sys.argv[3]).resolve();O.mkdir()
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
def lean(module,file,log):
 env=cli.lean_env();env["LEAN_PATH"]=str(module/"lean")+":"+str(T/".lake/build/lib/lean")
 with log.open("w")as f:return subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(file)],cwd=T,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=300).returncode
def walk(e):
 if isinstance(e,dict):
  yield e
  for v in list(e.values()):yield from walk(v)
 elif isinstance(e,list):
  for v in e:yield from walk(v)
controls=[]
for mod,short,arity,nhyp in [("CRelationClasses","relation_equivalence_equivalence",4,0)]:
 M=S/("Corelib/Classes/"+mod);name="Corelib.Classes."+mod+"."+short
 validation=json.loads((M/"result.json").read_text())["validation"]
 assert all(validation[k]=="OK"for k in ["roundtrip","consumer","audit"]),validation
 rep=json.loads((M/"translation_report.json").read_text())
 row=next(d for d in rep["results"]if d["source"]==name)
 assert row["status"]=="TRANSLATED_AND_CHECKED" and len(row["poly_level_interp"])==4
 assert row["level_params"]==["v_"+str(i)for i in range(arity)]
 assert len(row["pending_hypotheses"])==nhyp
 lc=O/(short+".lean");lc.write_text((pathlib.Path(__file__).resolve().parents[1]/"work/fixtures/poly-upper-clients/Client.lean").read_text())
 assert lean(M,lc,O/(short+"-client.log"))==0,(O/(short+"-client.log")).read_text()
 assert (O/(short+"-client.log")).read_text().count("does not depend on any axioms")==3
 for tag in ["hide-local-model","specialize-public-universe","claim-unsupported-local-model","hide-type-transport"]:
  bad=copy.deepcopy(rep);d=next(d for d in bad["results"]if d["source"]==name)
  if tag=="hide-local-model":d["poly_level_interp"]=[]
  elif tag=="claim-unsupported-local-model":d["poly_level_interp"]=[{"k":"param","n":"v_"+str(i)}for i in range(arity)]
  elif tag=="hide-type-transport":d["type_lift_coercions"]=0
  else:
   for term in [d["target_type"],d["target_value"]]:
    for e in walk(term):
     if e.get("k")=="param"and e.get("n")=="v_0":e.clear();e["k"]="zero"
   d["level_params"].remove("v_0")
  label=short+"-"+tag;inp=O/(label+".json");inp.write_text(json.dumps(bad))
  prefix=copy.deepcopy(bad);i=next(i for i,d in enumerate(prefix["results"])if d["source"]==name);prefix["results"]=prefix["results"][:i+1]
  kin=O/(label+"-prefix.json");kin.write_text(json.dumps(prefix));ko=O/(label+"-kernel.json");lc=O/(label+"-replay.lean")
  lc.write_text("import Rocq2Lean.Replay\n#rocq2lean_replay "+json.dumps(str(kin))+" "+json.dumps(str(ko))+"\n")
  assert lean(M,lc,O/(label+"-kernel.log"))==0,(O/(label+"-kernel.log")).read_text()
  kr=json.loads(ko.read_text());assert all(d["kernel"]=="ACCEPTED"for d in kr["results"]),(label,kr)
  ao=O/(label+"-audit.json")
  with(O/(label+"-audit.log")).open("w")as f:
   rc=subprocess.run([sys.executable,"-I",str(T/"tools/audit.py"),str(M/"source.ndjson"),str(M/"contract.json"),str(inp),str(ao),str(M/"consumer_result.json")],stdout=f,stderr=subprocess.STDOUT,timeout=300).returncode
  ar=json.loads(ao.read_text());assert rc!=0 and any(name in x["message"]for x in ar["problems"]),(label,ar)
  controls.append({"name":label,"kernel":"ACCEPTED","audit":"REJECTED"});print(label,"PASS",flush=True)

import itertools,random,audit
rng=random.Random(2062)
var=lambda i:{"k":"var","i":i}
glob=lambda n:{"k":"global","n":n}
edge=lambda a,b,k:{"l":a,"r":b,"rel":{"k":"le","offset":k}}
cases=[]
for n in range(2,5):
 for trial in range(12):
  cs=[edge(var(0),var(1),1)]
  for j in range(1,n-1):cs.append(edge(var(j),var(j+1),rng.randrange(2)))
  cs.extend([edge(var(n-1),glob("g"),rng.randrange(2)),edge(var(0),glob("h"),0)])
  if trial%4==0:cs.append(edge(var(0),{"k":"set"},0))
  cases.append({"n":n,"constraints":cs})
for module,short in [("CRelationClasses","relation_equivalence_equivalence"),("CMorphisms","PartialOrder_StrictOrder"),("CMorphisms","respectful_morphism")]:
 for line in (S/("Corelib/Classes/"+module+"/source.ndjson")).read_text().splitlines():
  d=json.loads(line)
  if d.get("name","").split(".")[-1]==short:
   u=d["universes"];cases.append({"n":len(u["names"]),"constraints":u["constraints"]})
cases.extend([
 {"n":2,"constraints":[edge(glob("g"),var(1),0)]},
 {"n":2,"constraints":[edge(var(0),glob("g"),-1)]},
 {"n":2,"constraints":[{"l":var(0),"r":glob("g"),"rel":{"k":"eq"}}]},
 {"n":2,"constraints":[edge(var(0),var(1),1),edge(var(1),var(0),0),edge(var(1),glob("g"),0)]},
 {"n":2,"constraints":[edge(var(0),glob("g"),0)]}])
(O/"constraints.json").write_text(json.dumps(cases))
program=O/"ConstraintChecks.lean"
program.write_text('''import Rocq2Lean.Emit
open Lean Rocq2Lean
def main (args : List String) : IO Unit := do
 let .ok js := Json.parse (← IO.FS.readFile args[0]!) | throw (IO.userError "json")
 let .ok cases := js.getArr? | throw (IO.userError "array")
 let mut answers := #[]
 for c in cases do
  let .ok n := c.getObjValAs? Nat "n" | throw (IO.userError "n")
  let .ok cs := c.getObjVal? "constraints" | throw (IO.userError "constraints")
  let ans := match polyUniverseInterpretation (Array.replicate n none) cs true with
   | .ok levels => Json.mkObj [("levels",Json.arr (levels.map levelJson))]
   | .error msg => Json.mkObj [("error",Json.str msg)]
  answers := answers.push ans
 IO.println (Json.arr answers).compress
''')
env=cli.lean_env();env["LEAN_PATH"]=str(T/".lake/build/lib/lean")
with (O/"constraints-runtime.json").open("w") as f,(O/"constraints-runtime.log").open("w") as err:
 rc=subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),"--run",str(program),str(O/"constraints.json")],cwd=T,env=env,stdout=f,stderr=err,timeout=300).returncode
assert rc==0,(O/"constraints-runtime.log").read_text()
answers=json.loads((O/"constraints-runtime.json").read_text())
def ev(t,vs):
 k=t["k"]
 if k=="zero":return 0
 if k=="param":return vs[int(t["n"][2:])]
 if k=="succ":return ev(t["l"],vs)+1
 if k=="max":return max(ev(t["a"],vs),ev(t["b"],vs))
 raise AssertionError(t)
def sat(cs,vs,gs):
 def at(x):return 0 if x["k"]=="set"else gs[x["n"]]if x["k"]=="global"else vs[x["i"]]
 return all(at(c["l"])==at(c["r"])if c["rel"]["k"]=="eq"else at(c["l"])+c["rel"]["offset"]<=at(c["r"])for c in cs)
accepted=rejected=fixed=closed=0
for case,ans in zip(cases,answers,strict=True):
 d={"kind":"constant","universes":{"k":"polymorphic","names":[None]*case["n"],"constraints":case["constraints"]}}
 if "error" in ans:
  try:audit.checked_poly_interpretation(d,{"poly_level_interp":[{"k":"param","n":"v_"+str(i)}for i in range(case["n"])]})
  except audit.Mismatch:pass
  else:raise AssertionError(("translator/auditor mismatch",case,ans))
  rejected+=1;continue
 accepted+=1;audit.checked_poly_interpretation(d,{"poly_level_interp":ans["levels"]})
 local=[c for c in case["constraints"]if c["r"]["k"]!="global"]
 vals=itertools.product(range(4),repeat=case["n"])if case["n"]<=4 else [tuple(rng.randrange(8)for _ in range(case["n"]))for _ in range(256)]
 for vs in vals:
  image=tuple(ev(t,vs)for t in ans["levels"])
  assert sat(local,image,{})
  closed+=1
  # Choose all global sinks from the original guards; then the interpreted
  # local valuation is a full source model, whose image must be itself.
  gs={}
  for c in case["constraints"]:
   if c["r"]["k"]=="global":
    a=c["l"];bound=(0 if a["k"]=="set"else image[a["i"]])+c["rel"]["offset"]
    gs[c["r"]["n"]]=max(gs.get(c["r"]["n"],0),bound)
  assert sat(case["constraints"],image,gs)
  assert tuple(ev(t,image)for t in ans["levels"])==image
  fixed+=1
  if sat(case["constraints"],vs,gs):assert image==vs
assert accepted==len(cases)-5 and rejected==5,(accepted,rejected)

res={"status":"PASS","arbitrary_universe_native_Lean_clients":1,"explicit_prerequisites_discharged":0,"empty_axiom_closures":3,"controls":controls}
res.update(constraint_contexts=len(cases),accepted_contexts=accepted,rejected_contexts=rejected,checked_local_closures=closed,checked_full_source_fixed_points=fixed)
(O/"result.json").write_text(json.dumps(res,indent=2)+"\n");print(json.dumps(res),flush=True)

from pathlib import Path
import sys,subprocess,json,time,hashlib
W=Path(__file__).resolve().parent;R=W.parents[1]
B=R/'experiments/mechanical-correspondence-20261019'
M=R/'experiments/mechanical-nat-eq-20261019';T=M/'translator'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
configs={'Sint63Specs':'Numbers/Cyclic/Int63/Sint63Axioms','Sint63QuotientSupport':'Numbers/Cyclic/Int63/Sint63Axioms','Sint63Operations':'Numbers/Cyclic/Int63/Sint63Axioms','Sint63ArithmeticSupport':'Numbers/Cyclic/Int63/Sint63Axioms','Sint63UnsignedSupport':'Numbers/Cyclic/Int63/Sint63Axioms','Uint63WideSpecs':'Numbers/Cyclic/Int63/Uint63Axioms','Uint63CountSpecs':'Numbers/Cyclic/Int63/Uint63Axioms','Uint63ShiftSpecs':'Numbers/Cyclic/Int63/Uint63Axioms','Uint63ArithmeticSpecs':'Numbers/Cyclic/Int63/Uint63Axioms','Uint63ArithmeticSupport':'Numbers/Cyclic/Int63/Uint63Axioms','Uint63OrderSpecs':'Numbers/Cyclic/Int63/Uint63Axioms','Uint63DefinitionSpecs':'Numbers/Cyclic/Int63/Uint63Axioms','Uint63Statements':'Numbers/Cyclic/Int63/Uint63Axioms','Uint63Conversions':'Numbers/Cyclic/Int63/Uint63Axioms','Uint63Operations':'Numbers/Cyclic/Int63/Uint63Axioms','SSRClasses':'ssr/ssrclasses','SSRUnder':'ssr/ssrunder','SSRRewriteStatements':'ssr/ssreflect_rw','SSRRewriteData':'ssr/ssreflect_rw','ProgramWellFounded':'Program/Wf','WellFoundedStatements':'Init/Wf','GenericEquality':'Init/Equality','ArrayCapacity':'Array/PrimArray','PrimitiveStrings':'Strings/PrimString','WordOperations':'Numbers/Cyclic/Int63/PrimInt63','ByteElimination':'Init/Byte','ByteOperations':'Init/Byte','NumberRepresentation':'Init/Number','HexadecimalRepresentation':'Init/Hexadecimal','DecimalRepresentation':'Init/Decimal','BinaryElimination':'Numbers/BinNums','BinaryIterOp':'BinNums/IntDef','BinaryPositiveSqrt':'BinNums/PosDef','BinarySqrtRem':'BinNums/IntDef','BinaryDivision':'BinNums/IntDef','BinaryIntBitwise':'BinNums/IntDef','BinaryBitwise':'BinNums/IntDef','CMorphismData':'Classes/CMorphisms','CRelationOrder':'Classes/CRelationClasses','CRelationStatements':'Classes/CRelationClasses','CRelationData':'Classes/CRelationClasses','SumboolBridge':'Init/Sumbool','BinaryPower':'BinNums/IntDef','SSRBoolRestrictions':'ssr/ssrbool','SSRBoolIndexed':'ssr/ssrbool','SSRBoolProofFunctions':'ssr/ssrbool','SSRBoolReflection':'ssr/ssrbool','SSRBoolFinalWitnesses':'ssr/ssrbool','SSRBoolClosedOperations':'ssr/ssrbool','SSRBoolConditionalNormalization':'ssr/ssrbool','SSRBoolClosedStatements':'ssr/ssrbool','SSRBoolWitnesses':'ssr/ssrbool','SSRBoolRemainingStatements':'ssr/ssrbool','SSRBoolPackaging':'ssr/ssrbool','SSRBoolExtendedStatements':'ssr/ssrbool','SSRBoolLogic':'ssr/ssrbool','SSRBoolData':'ssr/ssrbool','SSRFunOpacity':'ssr/ssrfun','SSRFunConditions':'ssr/ssrfun','SSRFunData':'ssr/ssrfun','SSRNonProp':'ssr/ssrfun','SSRFunOption':'ssr/ssrfun','SSRFunStatements':'ssr/ssrfun','SSRFunPredicates':'ssr/ssrfun','SSRFunNormalization':'ssr/ssrfun','SpecifChoice':'Init/Specif','SpecifEqualityElimination':'Init/Specif','SpecifOperations':'Init/Specif','SpecifConditionalNormalization':'Init/Specif','SpecifClosedStatements':'Init/Specif','SpecifWitnesses':'Init/Specif','LogicProofElimination':'Init/Logic','LogicExistsElimination':'Init/Logic','LogicElimination':'Init/Logic','LogicStatements':'Init/Logic','LogicNormalization':'Init/Logic','LogicWitnesses':'Init/Logic','DatatypeNormalization':'Init/Datatypes','DatatypeSpecs':'Init/Datatypes','DatatypeQuantifiers':'Init/Datatypes','DatatypeStatements':'Init/Datatypes','BinaryNatSub':'BinNums/IntDef','BinaryArithmetic':'BinNums/IntDef','BinaryMask':'BinNums/PosDef','BinaryMaskStatements':'BinNums/PosDef','BinaryInt':'BinNums/IntDef','BinaryOrder':'BinNums/IntDef','ListBridge':'Lists/ListDef','ListStatements':'Lists/ListDef','Basics':'Program/Basics','SSR':'ssr/ssrfun','Iteration':'Init/Nat','Registry':'ssr/ssrfun','SSRProperties':'ssr/ssrfun','SSRBool':'ssr/ssrbool','SSRBoolStatements':'ssr/ssrbool','NumericRead':'Init/Nat','DecimalOperations':'Init/Decimal','HexadecimalOperations':'Init/Hexadecimal','WellFounded':'Init/Wf','DependentElimination':'Init/Specif','PairRecursion':'Init/Wf','DependentStatements':'Init/Specif','DatatypeElimination':'Init/Datatypes','EqualityTransport':'Init/Logic','BooleanEquality':'Init/Datatypes','RelationDefinitions':'Relations/Relation_Definitions','RelationClasses':'Classes/RelationClasses','RelationClassStatements':'Classes/RelationClasses','VariadicPredicates':'Classes/RelationClasses','VariadicStatements':'Classes/RelationClasses','RelationConditions':'Classes/RelationClasses','Morphisms':'Classes/Morphisms','MorphismStatements':'Classes/Morphisms','EquivalenceBridge':'Classes/Equivalence','EquivalenceStatements':'Classes/Equivalence','MorphismsProp':'Classes/Morphisms_Prop','SetoidBridge':'Setoids/Setoid','SpecifNormalization':'Init/Specif','SpecifStatements':'Init/Specif','NumericWrite':'Init/Nat','NumericMathlib':'Init/Nat','NumericSigned':'Init/Nat','NatGcd':'Init/Nat','NatArithmetic':'Init/Nat','NatIterators':'Init/Nat','PeanoBridge':'Init/Peano','PeanoStatements':'Init/Peano'}
(W/'.work').mkdir(exist_ok=True);(W/'reports').mkdir(exist_ok=True)
previous=json.loads((W/'reports/validation.json').read_text()) if (W/'reports/validation.json').exists() else []
selected=set(sys.argv[1:]) or set(configs)
assert selected <= set(configs)
rows=[r for r in previous if r['profile'] not in selected]
audit=(W/'audit.lean.inc').read_text()
# Compile dependencies before users, including for a clean .work directory.
dependencies={}
for name in configs:
 imports=[item for line in (W/'proofs'/(name+'.lean')).read_text().splitlines() if line.startswith('import ') for item in line.split()[1:]]
 dependencies[name]=[x for x in imports if x in configs]
ordered=[];visiting=set()
def visit(name):
 if name in ordered:return
 assert name not in visiting,('import cycle',name)
 visiting.add(name)
 for dep in dependencies[name]:visit(dep)
 visiting.remove(name);ordered.append(name)
for name in configs:visit(name)
# Rebuild stale dependencies transitively, then their users.
prev={r['profile']:r for r in previous}
stale={}
def is_stale(name):
 if name in stale:return stale[name]
 srcsha=hashlib.sha256((W/'proofs'/(name+'.lean')).read_bytes()).hexdigest()
 record=prev.get(name,{})
 bad=record.get('proof_sha256')!=srcsha or record.get('exit')!=0 or not (W/'.work'/(name+'.olean')).exists()
 for dep in dependencies[name]:
  bad=is_stale(dep) or bad
  recorded=record.get('incremental_dependencies',{}).get(dep,{})
  obj=W/'.work'/(dep+'.olean')
  bad=bad or not obj.exists() or recorded.get('olean_sha256')!=hashlib.sha256(obj.read_bytes()).hexdigest()
 stale[name]=bad
 return bad
def include_dependencies(name):
 for dep in dependencies[name]:
  if is_stale(dep):selected.add(dep)
  include_dependencies(dep)
for name in list(selected):include_dependencies(name)
for name in ordered:
 if any(dep in selected for dep in dependencies[name]):selected.add(name)
rows=[r for r in previous if r['profile'] not in selected]
for name in ordered:
 module=configs[name]
 if name not in selected:continue
 src=W/'proofs'/(name+'.lean')
 temp=W/'.work'/(name+'.lean')
 out=W/'reports'/(name+'-audit.json')
 out.unlink(missing_ok=True)
 temp.write_text(src.read_text()+'\n'+audit.replace('AUDIT_PATH',str(out)))
 env=cli.lean_env()
 env['LEAN_PATH']=str(W/'.work')+':'+str(B)+':'+str(M/'runs/full-v1/Corelib'/module/'lean')+':'+str(T/'.lake/build/lib/lean')
 if name in {'NumericMathlib','BinaryIntBitwise'}:
  packages=Path.home()/'research/leanbuddy-work/lean-prosa-v06-master/.lake/packages'
  assert (packages/'mathlib/lean-toolchain').read_text().strip()=='leanprover/lean4:v4.33.1'
  env['LEAN_PATH']+=':'+':'.join(str(p/'.lake/build/lib/lean') for p in packages.iterdir() if (p/'.lake/build/lib/lean').exists())
 start=time.time()
 with (W/'reports'/(name+'.log')).open('w') as log:
  try:
   p=subprocess.run([str(Path.home()/'.elan/bin/lean'),*cli.native_args(),'-o',str(temp.with_suffix('.olean')),str(temp)],cwd=W,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300)
   rc=p.returncode
  except subprocess.TimeoutExpired:rc=124
 row={'profile':name,'module':module,'exit':rc,'seconds':round(time.time()-start,3),'proof_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'audit_present':out.exists()}
 if name in {'NumericMathlib','BinaryIntBitwise'}:
  row['mathlib_commit']=subprocess.check_output(['git','rev-parse','HEAD'],cwd=packages/'mathlib',text=True).strip()
  module_path='Mathlib/Data/Nat/Digits/Defs.olean' if name=='NumericMathlib' else 'Mathlib/Data/Int/Bitwise.olean'
  field='mathlib_digits_olean_sha256' if name=='NumericMathlib' else 'mathlib_bitwise_olean_sha256'
  row[field]=hashlib.sha256((packages/'mathlib/.lake/build/lib/lean'/module_path).read_bytes()).hexdigest()
 row['incremental_dependencies']={dep:dict(proof_sha256=hashlib.sha256((W/'proofs'/(dep+'.lean')).read_bytes()).hexdigest(),olean_sha256=hashlib.sha256((W/'.work'/(dep+'.olean')).read_bytes()).hexdigest()) for dep in dependencies[name]}
 rows.append(row);print(row,flush=True)
 (W/'reports/validation.json').write_text(json.dumps(rows,indent=2))
 if rc!=0 or not out.exists():sys.exit(rc or 1)
print('PASS' if all(r['exit']==0 and r['audit_present'] for r in rows) else 'FAIL',flush=True)
sys.exit(0 if all(r['exit']==0 and r['audit_present'] for r in rows) else 1)

from pathlib import Path
import sys,subprocess,json,time,hashlib
W=Path(__file__).resolve().parent;R=W.parents[1]
B=R/'experiments/mechanical-correspondence-20261019'
M=R/'experiments/mechanical-nat-eq-20261019';T=M/'translator'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
configs={'Basics':'Program/Basics','SSR':'ssr/ssrfun','Iteration':'Init/Nat','Registry':'ssr/ssrfun','SSRProperties':'ssr/ssrfun','SSRBool':'ssr/ssrbool','SSRBoolStatements':'ssr/ssrbool','NumericRead':'Init/Nat','DecimalOperations':'Init/Decimal','HexadecimalOperations':'Init/Hexadecimal','WellFounded':'Init/Wf','DependentElimination':'Init/Specif','PairRecursion':'Init/Wf','DependentStatements':'Init/Specif','DatatypeElimination':'Init/Datatypes','EqualityTransport':'Init/Logic','BooleanEquality':'Init/Datatypes','RelationDefinitions':'Relations/Relation_Definitions','RelationClasses':'Classes/RelationClasses','RelationClassStatements':'Classes/RelationClasses','VariadicPredicates':'Classes/RelationClasses','VariadicStatements':'Classes/RelationClasses','RelationConditions':'Classes/RelationClasses','Morphisms':'Classes/Morphisms','MorphismStatements':'Classes/Morphisms','EquivalenceBridge':'Classes/Equivalence','EquivalenceStatements':'Classes/Equivalence','MorphismsProp':'Classes/Morphisms_Prop','SetoidBridge':'Setoids/Setoid','SpecifNormalization':'Init/Specif','SpecifStatements':'Init/Specif','NumericWrite':'Init/Nat','NumericMathlib':'Init/Nat','NumericSigned':'Init/Nat','NatGcd':'Init/Nat','NatArithmetic':'Init/Nat','NatIterators':'Init/Nat','PeanoBridge':'Init/Peano','PeanoStatements':'Init/Peano'}
(W/'.work').mkdir(exist_ok=True);(W/'reports').mkdir(exist_ok=True)
previous=json.loads((W/'reports/validation.json').read_text()) if (W/'reports/validation.json').exists() else []
selected=set(sys.argv[1:]) or set(configs)
assert selected <= set(configs)
rows=[r for r in previous if r['profile'] not in selected]
audit=(W/'audit.lean.inc').read_text()
for name,module in configs.items():
 if name not in selected:continue
 src=W/'proofs'/(name+'.lean')
 temp=W/'.work'/(name+'.lean')
 out=W/'reports'/(name+'-audit.json')
 out.unlink(missing_ok=True)
 temp.write_text(src.read_text()+'\n'+audit.replace('AUDIT_PATH',str(out)))
 env=cli.lean_env()
 env['LEAN_PATH']=str(W/'.work')+':'+str(B)+':'+str(M/'runs/full-v1/Corelib'/module/'lean')+':'+str(T/'.lake/build/lib/lean')
 if name=='NumericMathlib':
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
 if name=='NumericMathlib':
  row['mathlib_commit']=subprocess.check_output(['git','rev-parse','HEAD'],cwd=packages/'mathlib',text=True).strip()
  row['mathlib_digits_olean_sha256']=hashlib.sha256((packages/'mathlib/.lake/build/lib/lean/Mathlib/Data/Nat/Digits/Defs.olean').read_bytes()).hexdigest()
 rows.append(row);print(row,flush=True)
 (W/'reports/validation.json').write_text(json.dumps(rows,indent=2))
print('PASS' if all(r['exit']==0 and r['audit_present'] for r in rows) else 'FAIL',flush=True)
sys.exit(0 if all(r['exit']==0 and r['audit_present'] for r in rows) else 1)

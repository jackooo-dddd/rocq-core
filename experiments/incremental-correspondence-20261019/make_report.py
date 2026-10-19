from pathlib import Path
import json,csv,collections,hashlib
W=Path(__file__).resolve().parent;R=W.parents[1];D=W/'reports'
B=R/'experiments/mechanical-correspondence-20261019/reports'
specs=json.loads((W/'certificates.json').read_text())
validation=json.loads((D/'validation.json').read_text())
assert {r['profile'] for r in validation}=={'SSRPredicatePackages','FloatUlp','FloatUlpSupport','FloatStatements','Float64Operations','FloatOperations','FloatWordSupport','FloatClosureSupport','PrimFloatSqrt','PrimFloatExponent','PrimFloatArithmetic','PrimFloatRepresentation','SpecFloatSqrt','SpecFloatSqrtSupport','SpecFloatDivision','SpecFloatDivisionSupport','SpecFloatAdjacent','SpecFloatExponent','SpecFloatMaskSupport','SpecFloatArithmetic','SpecFloatComparison','SpecFloatNormalize','SpecFloatShift','SpecFloatRounding','SpecFloatArithmeticSupport','SpecFloatRepresentation','SSRSetoidCompatibility','DefaultRelationMarker','DecisionTactics','FixPrototype','UnconvertibleMarker','PreludeCoercions','StringComparison','StringRoundtrip','StringSpecs','StringOperations','StringUnsignedSupport','ArraySpecs','Sint63Specs','Sint63QuotientSupport','Sint63Operations','Sint63ArithmeticSupport','Sint63UnsignedSupport','Uint63WideSpecs','Uint63CountSpecs','Uint63ShiftSpecs','Uint63ArithmeticSpecs','Uint63ArithmeticSupport','Uint63OrderSpecs','Uint63DefinitionSpecs','Uint63Statements','Uint63Conversions','Uint63Operations','SSRClasses','SSRUnder','SSRRewriteStatements','SSRRewriteData','ProgramWellFounded','WellFoundedStatements','GenericEquality','ArrayCapacity','PrimitiveStrings','WordOperations','ByteElimination','ByteOperations','NumberRepresentation','HexadecimalRepresentation','DecimalRepresentation','BinaryElimination','BinaryIterOp','BinaryPositiveSqrt','BinarySqrtRem','BinaryDivision','BinaryIntBitwise','BinaryBitwise','CMorphismData','CRelationOrder','CRelationStatements','CRelationData','SumboolBridge','BinaryPower','SSRBoolIndexed','SSRBoolRestrictions','SSRBoolFinalWitnesses','SSRBoolReflection','SSRBoolProofFunctions','SSRBoolClosedOperations','SSRBoolWitnesses','SSRBoolClosedStatements','SSRBoolConditionalNormalization','SSRBoolPackaging','SSRBoolRemainingStatements','SSRBoolData','SSRBoolLogic','SSRBoolExtendedStatements','SSRFunOpacity','SSRFunData','SSRFunConditions','SSRFunNormalization','SSRFunPredicates','SSRFunStatements','SSRFunOption','SSRNonProp','SpecifWitnesses','SpecifConditionalNormalization','SpecifClosedStatements','SpecifOperations','SpecifChoice','SpecifEqualityElimination','LogicWitnesses','LogicNormalization','LogicStatements','LogicElimination','LogicExistsElimination','LogicProofElimination','DatatypeNormalization','DatatypeQuantifiers','DatatypeStatements','DatatypeSpecs','BinaryArithmetic','BinaryNatSub','BinaryMask','BinaryMaskStatements','ListBridge','ListStatements','BinaryOrder','BinaryInt','PeanoBridge','PeanoStatements','NatArithmetic','NatIterators','NatGcd','NumericSigned','NumericMathlib','NumericWrite','SpecifNormalization','SpecifStatements','Basics','SSR','Iteration','Registry','SSRProperties','SSRBool','SSRBoolStatements','NumericRead','DecimalOperations','HexadecimalOperations','WellFounded','DependentElimination','PairRecursion','DependentStatements','DatatypeElimination','EqualityTransport','BooleanEquality','RelationDefinitions','RelationClasses','RelationClassStatements','VariadicPredicates','VariadicStatements','RelationConditions','Morphisms','MorphismStatements','EquivalenceBridge','EquivalenceStatements','MorphismsProp','SetoidBridge'}
audits={}
for r in validation:
 assert r['exit']==0 and r['audit_present'],r
 assert hashlib.sha256((W/'proofs'/(r['profile']+'.lean')).read_bytes()).hexdigest()==r['proof_sha256']
 for dep,record in r['incremental_dependencies'].items():
  assert record['proof_sha256']==hashlib.sha256((W/'proofs'/(dep+'.lean')).read_bytes()).hexdigest()
  assert record['olean_sha256']==hashlib.sha256((W/'.work'/(dep+'.olean')).read_bytes()).hexdigest()
 if r['profile']=='BinaryIntBitwise':
  packages=Path.home()/'research/leanbuddy-work/lean-prosa-v06-master/.lake/packages'
  assert r['mathlib_bitwise_olean_sha256']==hashlib.sha256((packages/'mathlib/.lake/build/lib/lean/Mathlib/Data/Int/Bitwise.olean').read_bytes()).hexdigest()
 audits[r['profile']]={x['name']:x for x in json.loads((D/(r['profile']+'-audit.json')).read_text())}
base=list(csv.DictReader((B/'CORELIB_LEDGER.csv').open()))
rows={r['source']:dict(r,baseline_bridge_status=r['bridge_status'],evidence_origin='inherited baseline',new_certificates='') for r in base}
automatic_groups=[
 ('SSRBoolClosedStatements','ssrbool-closed-statement-selection.json','ssrbool-closed-statement-candidates.json',73),
 ('SSRBoolRemainingStatements','ssrbool-remaining-statement-selection.json','ssrbool-remaining-statement-candidates.json',29),
 ('SSRBoolExtendedStatements','ssrbool-extended-statement-selection.json','ssrbool-extended-statement-candidates.json',75),
 ('SSRFunStatements','ssrfun-statement-selection.json','ssrfun-statement-candidates.json',50),
 ('SpecifClosedStatements','specif-closed-statement-selection.json','specif-closed-statement-candidates.json',38),
 ('LogicStatements','logic-statement-selection.json','logic-statement-candidates.json',67),
 ('DatatypeStatements','datatype-statement-selection.json','datatype-statement-candidates.json',37),
 ('BinaryMaskStatements','binary-mask-statement-selection.json','binary-mask-statement-candidates.json',2),
 ('ListStatements','list-statement-selection.json','list-statement-candidates.json',2),
 ('PeanoStatements','peano-statement-selection.json','peano-statement-candidates.json',31),
 ('SpecifStatements','specif-statement-selection.json','specif-statement-candidates.json',49),
 ('SSRBoolStatements','statement-selection.json','statement-candidates.json',216),
 ('RelationClassStatements','relation-statement-selection.json','relation-statement-candidates.json',65),
 ('MorphismStatements','morphism-statement-selection.json','morphism-statement-candidates.json',55),
 ('EquivalenceStatements','equivalence-statement-selection.json','equivalence-statement-candidates.json',14),
 ('MorphismsProp','morphisms-prop-statement-selection.json','morphisms-prop-statement-candidates.json',17)]
automatic_group_counts={}
for profile,selection_file,output_file,expected_count in automatic_groups:
 selection={x['target']:x['source'] for x in json.loads((W/selection_file).read_text())}
 candidates=[json.loads(l.split('NATIVE_RESULT ',1)[1]) for l in (D/(profile+'.log')).read_text().splitlines() if 'NATIVE_RESULT ' in l]
 assert len(candidates)==len(selection)==expected_count
 assert {x['source_target'] for x in candidates}==set(selection)
 (D/output_file).write_text(json.dumps(candidates,ensure_ascii=False,indent=2))
 automatic_group_counts[profile]={'candidates':len(candidates),'full':sum(c['full'] for c in candidates)}
 for c in candidates:
  if c['full']:
   assert not c['remaining_source_symbols']
   if rows[selection[c['source_target']]]['baseline_bridge_status']=='STATEMENT_FULL_NATIVE':
    automatic_group_counts[profile]['previously_full_rechecked']=automatic_group_counts[profile].get('previously_full_rechecked',0)+1
    continue
   specs.append({'source':selection[c['source_target']],'profile':profile,'certificate':c['certificate'],
     'kind':'STATEMENT_FULL_NATIVE','target':'native statement: '+c['native_expression'],
     'native_expression':c['native_expression'],'scope':'unconditional original statement; source-free body including NativeBridge alias expansion'})
# Logic statements use closed witnesses before native normalization.
logic_witnesses={r['target']:r for r in json.loads((W/'logic-witness-selection.json').read_text())}
logic_book=json.loads((W/'condition-obligations.json').read_text())['roots']
for sp in specs:
 if sp['profile']!='LogicStatements':continue
 source_target=rows[sp['source']]['target']
 if source_target in logic_witnesses:
  sp['original_statement_proof']=logic_witnesses[source_target]['closed']
 if rows[sp['source']]['baseline_bridge_status']=='EXPLICIT_PROOF_PARAMETERS':
  sp['closed_wrapper']='NativeBridge.Incremental.LogicStatements.closed.'+source_target
  expected=logic_book[sp['source']]
  sp['condition_discharges']=[dict(source=h,proof='NativeBridge.Incremental.LogicWitnesses.closed.'+expected['obligation_targets'][h]) for h in expected['pending_hypotheses']]
  sp['scope']='all explicit prerequisites discharged; source-free native statement body; source universe parameters preserved'
# Specif prerequisites are discharged before normalizing the original statement.
specif_witnesses={r['target']:r for r in json.loads((W/'specif-witness-selection.json').read_text())}
for sp in specs:
 if sp['profile']!='SpecifClosedStatements':continue
 source_target=rows[sp['source']]['target']
 sp['original_statement_proof']=specif_witnesses[source_target]['closed']
 sp['closed_wrapper']='NativeBridge.Incremental.SpecifClosedStatements.closed.'+source_target
 expected=logic_book[sp['source']]
 sp['condition_discharges']=[dict(source=h,proof='NativeBridge.Incremental.SpecifWitnesses.closed.'+expected['obligation_targets'][h]) for h in expected['pending_hypotheses']]
 sp['scope']='all explicit prerequisites discharged; source-free native statement body including proof terms and NativeBridge aliases; source universe parameters preserved'
# SSRBool statements close every source prerequisite before normalizing.
ssrb_witnesses={r['target']:r for r in json.loads((W/'ssrbool-witness-selection.json').read_text())}
for sp in specs:
 if sp['profile']!='SSRBoolClosedStatements':continue
 source_target=rows[sp['source']]['target']
 if source_target in ssrb_witnesses:
  sp['original_statement_proof']=ssrb_witnesses[source_target]['closed']
 sp['closed_wrapper']='NativeBridge.Incremental.SSRBoolClosedStatements.closed.'+source_target
 expected=logic_book[sp['source']]
 sp['condition_discharges']=[dict(source=h,proof='NativeBridge.Incremental.SSRBoolWitnesses.closed.'+expected['obligation_targets'][h]) for h in expected['pending_hypotheses']]
 sp['scope']='all explicit prerequisites discharged; source-free native statement body including NativeBridge alias expansion; source universes preserved'
predicate_records=[json.loads(l.split('NATIVE_PREDICATE ',1)[1]) for l in (D/'SSRFunPredicates.log').read_text().splitlines() if 'NATIVE_PREDICATE ' in l]
assert len(predicate_records)==27 and all(not r['remaining_source_symbols'] for r in predicate_records)
predicate_by_cert={r['certificate']:r for r in predicate_records}
assert set(predicate_by_cert)=={sp['certificate'] for sp in specs if sp['profile']=='SSRFunPredicates'}
for sp in specs:
 if sp['profile']=='SSRFunPredicates':
  assert sp['native_expression']==predicate_by_cert[sp['certificate']]['native_expression']
(D/'ssrfun-predicate-candidates.json').write_text(json.dumps(predicate_records,ensure_ascii=False,indent=2))
native_targets=[json.loads(l.split('NATIVE_TARGET ',1)[1]) for r in validation for l in (D/(r['profile']+'.log')).read_text().splitlines() if 'NATIVE_TARGET ' in l]
native_targets={t['name']:t for t in native_targets}
assert set(native_targets)=={s['native_target'] for s in specs if s.get('native_target')}
for sp in specs:
 if sp.get('native_target'):
  t=native_targets[sp['native_target']]
  assert not t['remaining_source_symbols']
  sp['native_expression']=t['native_expression']
(D/'dependent-native-targets.json').write_text(json.dumps(list(native_targets.values()),ensure_ascii=False,indent=2))
accepted=[]
original_proofs=[]
resolved_conditions=[]
condition_book=json.loads((W/'condition-obligations.json').read_text())
condition_inputs=condition_book['roots']
condition_reports=[]
for item in [condition_book]+condition_book.get('additional_inputs',[]):
 path=R/item['provenance']
 assert hashlib.sha256(path.read_bytes()).hexdigest()==item['report_sha256']
 assert hashlib.sha256((R/item['source_ir']).read_bytes()).hexdigest()==item['source_ir_sha256']
 assert json.loads(path.read_text())['input_sha256']==item['source_ir_sha256']
 raw_results=json.loads(path.read_text())['results']
 normalized={r['source'].replace('/','.'):r for r in raw_results}
 assert len(normalized)==len(raw_results),('source normalization collision',path)
 condition_reports.append(normalized)
for source,expected in condition_inputs.items():
 matches=[]
 for report in condition_reports:
  if source not in report:continue
  actual=report[source];pending=actual['pending_hypotheses']
  matches.append(dict(target=actual['target'],pending_hypotheses=pending,obligation_targets={h:report[h.replace('/','.')]['target'] for h in pending})==expected)
 assert any(matches),('condition input metadata mismatch',source)
for sp in specs:
 cert=audits[sp['profile']][sp['certificate']]
 assert set(cert['axioms']) <= {'propext','Quot.sound','Classical.choice'}
 assert sp['source'] in rows
 assert ('Rocq.'+sp['source'] in cert['source_references'] or rows[sp['source']]['target'] in cert['source_references']),sp
 if sp.get('original_statement_proof'):
  proved=audits[sp['profile']][sp['original_statement_proof']]
  assert set(proved['axioms']) <= {'propext','Quot.sound','Classical.choice'}
  assert rows[sp['source']]['target'] in proved['source_references']
  original_proofs.append(dict(source=sp['source'],profile=sp['profile'],**proved))
 item=dict(sp,**{k:cert[k] for k in ['type','axioms']})
 accepted.append(item)
 r=rows[sp['source']]
 if r['baseline_bridge_status']=='EXPLICIT_PROOF_PARAMETERS':
  ds=sp['condition_discharges']
  expected=condition_inputs[sp['source']]
  assert expected['target']==r['target']
  assert {d['source'] for d in ds}==set(expected['pending_hypotheses'])
  assert len(ds)==int(r['prerequisites'])
  wrapper=audits[sp['profile']][sp['closed_wrapper']]
  assert not any('__rocq2lean_obligation_' in ref for ref in wrapper['source_references'])
  witnesses=[]
  for discharge in ds:
   witness=audits[sp['profile']][discharge['proof']]
   assert expected['obligation_targets'][discharge['source']] in witness['source_references']
   assert set(witness['axioms']) <= {'propext','Quot.sound','Classical.choice'},witness
   witnesses.append(dict(source=discharge['source'],**witness))
  resolved_conditions.append(dict(source=sp['source'],wrapper=wrapper,witnesses=witnesses,certificate=sp['certificate']))
 r['bridge_status']=sp['kind'];r['evidence_origin']='baseline + checked incremental certificate'
 r['new_certificates']=';'.join(filter(None,[r['new_certificates'],sp['certificate']]))
 r['bridge_certificates']=';'.join(filter(None,[r['bridge_certificates'],sp['certificate']]))
 if sp['kind']=='STATEMENT_FULL_NATIVE':
  assert r['baseline_bridge_status'] in {'STATEMENT_PARTIAL','EXPLICIT_PROOF_PARAMETERS'}
  r['statement_certificate']=sp['certificate']
  r['native_statement']=sp['native_expression']
  r['remaining_source_symbols']=''
  r['interpretation']=('新增原生陈述 iff；另有独立闭合的原陈述证明：'+sp['original_statement_proof']) if sp.get('original_statement_proof') else '新增原生陈述 iff；目标体及 NativeBridge 别名展开后无源端符号；不是业务定理证明。'
 else:
  r['interpretation']='新增已检查的'+('类型双向逆。' if sp['kind']=='TYPE_ISO' else '指定原生运算/表达式/谓词对应。')+'适用范围见增量证书完整类型。'

 if sp.get('closed_wrapper'):
  r['interpretation']='原始机械声明仍有显式条件；本桥接已用闭合证明实例化全部 '+str(r['prerequisites'])+' 项，使用 '+sp['closed_wrapper']+'。没有假定义务成立。'

# A root may still lack operation correspondence after every source prerequisite is proved.
ssrb_all_witnesses={r['source']:r for r in json.loads((W/'ssrbool-witness-selection.json').read_text())+json.loads((W/'ssrbool-final-witness-selection.json').read_text())}
ssrb_conditions={source:expected for source,expected in condition_inputs.items() if source.startswith('Corelib.ssr.ssrbool.')}
ssrb_prerequisites={h for expected in ssrb_conditions.values() for h in expected['pending_hypotheses']}
assert len(ssrb_conditions)==128 and len(ssrb_prerequisites)==275
for h in ssrb_prerequisites:
 witness=audits['SSRBoolFinalWitnesses'][ssrb_all_witnesses[h]['closed']]
 assert set(witness['axioms']) <= {'propext','Quot.sound','Classical.choice'}
 expected_targets={expected['obligation_targets'][h] for expected in ssrb_conditions.values() if h in expected['pending_hypotheses']}
 assert expected_targets <= set(witness['source_references'])
for source in ssrb_conditions:
 if rows[source]['bridge_status']=='EXPLICIT_PROOF_PARAMETERS':
  rows[source]['interpretation']='本桥接已证明全部源端前置条件；该根的运算对应仍未完成。沿用条件根分类不表示前置证明仍缺失。'

reg=audits['Registry']
newinterface='NativeBridge.IncrementalInterfaces.Rocq.Corelib.ssr.ssrfun.fun_of_simpl.roundtrip'
assert newinterface in reg
r=rows['Corelib.ssr.ssrfun.fun_of_simpl']
assert not r['interface_certificate']
r['interface_certificate']=newinterface
r['interface_skip_reason']='';r['interface_type_specialized']=False
def writecsv(path,rs):
 with path.open('w',newline='') as f:
  w=csv.DictWriter(f,fieldnames=list(rs[0]));w.writeheader();w.writerows(rs)
module_coverage=[]
for module,total in [('Corelib.Relations.Relation_Definitions',23),('Corelib.Classes.RelationClasses',103),('Corelib.Classes.Morphisms',87),('Corelib.Classes.Equivalence',17),('Corelib.Classes.Morphisms_Prop',29),('Corelib.Setoids.Setoid',6)]:
 rs=[r for r in rows.values() if r['module']==module]
 assert len(rs)==total
 assert all(r['bridge_status'] in {'TYPE_ISO','OPERATION_CORRESPONDENCE','STATEMENT_FULL_NATIVE'} for r in rs)
 module_coverage.append(dict(module=module,total=len(rs),counts=dict(collections.Counter(r['bridge_status'] for r in rs))))
(D/'relations-module-coverage.json').write_text(json.dumps(module_coverage,indent=2))
nat_rows=[r for r in rows.values() if r['module']=='Corelib.Init.Nat']
assert len(nat_rows)==58 and all(r['bridge_status'] in {'TYPE_ISO','OPERATION_CORRESPONDENCE','STATEMENT_FULL_NATIVE'} for r in nat_rows)
(D/'nat-module-coverage.json').write_text(json.dumps(dict(module='Corelib.Init.Nat',total=58,counts=dict(collections.Counter(r['bridge_status'] for r in nat_rows)),sources=[r['source'] for r in nat_rows]),indent=2))
peano_rows=[r for r in rows.values() if r['module']=='Corelib.Init.Peano']
assert len(peano_rows)==36 and all(r['bridge_status'] in {'TYPE_ISO','OPERATION_CORRESPONDENCE','STATEMENT_FULL_NATIVE'} for r in peano_rows)
(D/'peano-module-coverage.json').write_text(json.dumps(dict(module='Corelib.Init.Peano',total=36,counts=dict(collections.Counter(r['bridge_status'] for r in peano_rows)),sources=[r['source'] for r in peano_rows]),indent=2))
list_rows=[r for r in rows.values() if r['module']=='Corelib.Lists.ListDef']
assert len(list_rows)==10 and all(r['bridge_status'] in {'TYPE_ISO','OPERATION_CORRESPONDENCE','STATEMENT_FULL_NATIVE'} for r in list_rows)
(D/'list-module-coverage.json').write_text(json.dumps(dict(module='Corelib.Lists.ListDef',total=10,counts=dict(collections.Counter(r['bridge_status'] for r in list_rows)),sources=[r['source'] for r in list_rows]),indent=2))
datatype_rows=[r for r in rows.values() if r['module']=='Corelib.Init.Datatypes']
assert all(r['bridge_status'] in {'TYPE_ISO','OPERATION_CORRESPONDENCE','STATEMENT_FULL_NATIVE'} for r in datatype_rows)
(D/'datatype-module-coverage.json').write_text(json.dumps(dict(module='Corelib.Init.Datatypes',total=len(datatype_rows),counts=dict(collections.Counter(r['bridge_status'] for r in datatype_rows)),sources=[r['source'] for r in datatype_rows]),indent=2))
logic_rows=[r for r in rows.values() if r['module']=='Corelib.Init.Logic']
assert len(logic_rows)==176 and all(r['bridge_status'] in {'TYPE_ISO','OPERATION_CORRESPONDENCE','STATEMENT_FULL_NATIVE'} for r in logic_rows)
(D/'logic-module-coverage.json').write_text(json.dumps(dict(module='Corelib.Init.Logic',total=len(logic_rows),counts=dict(collections.Counter(r['bridge_status'] for r in logic_rows)),sources=[r['source'] for r in logic_rows]),indent=2))
specif_rows=[r for r in rows.values() if r['module']=='Corelib.Init.Specif']
assert len(specif_rows)==159 and all(r['bridge_status'] in {'TYPE_ISO','OPERATION_CORRESPONDENCE','STATEMENT_FULL_NATIVE'} for r in specif_rows)
(D/'specif-module-coverage.json').write_text(json.dumps(dict(module='Corelib.Init.Specif',total=len(specif_rows),counts=dict(collections.Counter(r['bridge_status'] for r in specif_rows)),sources=[r['source'] for r in specif_rows]),indent=2))
ssrfun_rows=[r for r in rows.values() if r['module']=='Corelib.ssr.ssrfun']
assert len(ssrfun_rows)==128
opaque_records=[json.loads(l.split('OPAQUE_AUDIT ',1)[1]) for l in (D/'SSRFunOpacity.log').read_text().splitlines() if 'OPAQUE_AUDIT ' in l]
assert len(opaque_records)==4 and all(x['body_present'] and x['kernel_rejected_body_rfl'] and not x['direct_existing_theorems'] for x in opaque_records)
assert {x['target'] for x in opaque_records}=={r['target'] for r in ssrfun_rows if r['bridge_status'] not in {'TYPE_ISO','OPERATION_CORRESPONDENCE','STATEMENT_FULL_NATIVE'}}
(D/'ssrfun-opacity.json').write_text(json.dumps(opaque_records,indent=2))
(D/'ssrfun-module-coverage.json').write_text(json.dumps(dict(module='Corelib.ssr.ssrfun',total=len(ssrfun_rows),counts=dict(collections.Counter(r['bridge_status'] for r in ssrfun_rows)),remaining=[dict(source=r['source'],status=r['bridge_status']) for r in ssrfun_rows if r['bridge_status'] not in {'TYPE_ISO','OPERATION_CORRESPONDENCE','STATEMENT_FULL_NATIVE'}]),ensure_ascii=False,indent=2))
ssrbool_rows=[r for r in rows.values() if r['module']=='Corelib.ssr.ssrbool']
assert len(ssrbool_rows)==451
(D/'ssrbool-module-coverage.json').write_text(json.dumps(dict(module='Corelib.ssr.ssrbool',total=len(ssrbool_rows),counts=dict(collections.Counter(r['bridge_status'] for r in ssrbool_rows)),remaining=[dict(source=r['source'],status=r['bridge_status'],all_prerequisites_proved=(True if r['source'] in ssrb_conditions else None)) for r in ssrbool_rows if r['bridge_status'] not in {'TYPE_ISO','OPERATION_CORRESPONDENCE','STATEMENT_FULL_NATIVE'}]),ensure_ascii=False,indent=2))
for module,filename,total in [('Corelib.Init.Sumbool','sumbool-module-coverage.json',7),('Corelib.Classes.CRelationClasses','crelation-module-coverage.json',81),('Corelib.Classes.CMorphisms','cmorphisms-module-coverage.json',78)]:
 rs=[r for r in rows.values() if r['module']==module]
 assert len(rs)==total
 remaining=[dict(source=r['source'],status=r['bridge_status']) for r in rs if r['bridge_status'] not in {'TYPE_ISO','OPERATION_CORRESPONDENCE','STATEMENT_FULL_NATIVE'}]
 if module=='Corelib.Init.Sumbool':assert not remaining
 (D/filename).write_text(json.dumps(dict(module=module,total=len(rs),counts=dict(collections.Counter(r['bridge_status'] for r in rs)),remaining=remaining),ensure_ascii=False,indent=2)+'\n')
writecsv(D/'CORELIB_LEDGER.csv',list(rows.values()))
counts=dict(collections.Counter(r['bridge_status'] for r in rows.values()))
bcounts=dict(collections.Counter(r['bridge_status'] for r in base))
alias=json.loads((D/'alias-regression.json').read_text())
assert len(alias)==45 and all(x['exit']==0 and not x['lost'] and not x['gained'] for x in alias)
summary={'alias_regression_profiles':45,'alias_regression_lost':0,'alias_regression_gained':0,'root_declarations':len(rows),'baseline':str(B.relative_to(R)),'baseline_status':bcounts,'coverage_status':counts,
 'new_type_roots':len({s['source'] for s in specs if s['kind']=='TYPE_ISO' and rows[s['source']]['baseline_bridge_status']!='TYPE_ISO'}),
 'new_operation_roots':len({s['source'] for s in specs if s['kind']=='OPERATION_CORRESPONDENCE' and rows[s['source']]['baseline_bridge_status']!='OPERATION_CORRESPONDENCE'}),
 'new_fully_native_statements':len({s['source'] for s in specs if s['kind']=='STATEMENT_FULL_NATIVE'}),
 'automatic_statement_candidates_rechecked':sum(g['candidates'] for g in automatic_group_counts.values()),
 'automatic_statement_groups':automatic_group_counts,
 'manual_native_statement_certificates':sum(s['kind']=='STATEMENT_FULL_NATIVE' for s in json.loads((W/'certificates.json').read_text())),
 'additional_original_statement_proofs':len(original_proofs),
 'new_certificates':len(specs),'baseline_operation_certificates':119,'operation_certificates_total':119+sum(s['kind']=='OPERATION_CORRESPONDENCE' for s in specs),
 'type_certificates_total':30+sum(s['kind']=='TYPE_ISO' for s in specs),
 'native_interface_roundtrips':479,'new_root_interface_roundtrips':1,'passing_incremental_profiles':len(validation),
 'incremental_dependency_fingerprints_checked':True,'full_baseline_rerun':False,'translation_rerun':False,'mathlib_tested':False,
 'automatic_native_target_synthesis':False,'automatic_predicate_body_normalization':27,'automatic_certificate_composition':'SSR Option/function proof composition plus automatic statement normalization; arbitrary function targets still supplied',
 'conditions_remaining':counts['EXPLICIT_PROOF_PARAMETERS'],
 'ssrbool_prerequisites_proved':len(ssrb_prerequisites),
 'ssrbool_condition_roots_with_all_prerequisites_proved':len(ssrb_conditions),
 'ssrbool_closed_condition_roots_still_missing_correspondence':sum(rows[source]['bridge_status']=='EXPLICIT_PROOF_PARAMETERS' for source in ssrb_conditions),
 'mechanical_declarations_with_explicit_conditions':331,
 'correspondence_conditions_remaining':counts['EXPLICIT_PROOF_PARAMETERS'],
 'condition_resolved_roots':len({r['source'] for r in resolved_conditions}),
 'closed_obligation_witnesses':len({w['name'] for r in resolved_conditions for w in r['witnesses']}),
 'axiom_free_closed_witnesses':len({w['name'] for r in resolved_conditions for w in r['witnesses'] if not w['axioms']}),
 'standard_axiom_closed_witnesses':len({w['name'] for r in resolved_conditions for w in r['witnesses'] if w['axioms']}),
 'full_sort_type_certificates_added':10,'completion':'ninety incremental batches plus P7 coexistence; overall plan remains incomplete',
 'explicit_target_classes_since_batch_3':dict(collections.Counter(sp['target_class'] for sp in specs if 'target_class' in sp))}
interop_path=D/'interop/all/import-all-validation.json'
if interop_path.exists():
 iv=json.loads(interop_path.read_text())
 manifest=D/'interop/coverage-manifest.json'
 assert iv['exit']==0 and hashlib.sha256(manifest.read_bytes()).hexdigest()==iv['manifest_sha256']
 packer_current=iv['packer_sha256']==hashlib.sha256((W/'interop/ProfilePack.lean').read_bytes()).hexdigest()
 pv=json.loads((D/'interop/all/validation.json').read_text())
 assert len(pv)==iv['profiles'] and all(r['exit']==0 for r in pv)
 profiles_current=all(r['source_sha256']==hashlib.sha256((W/'proofs'/(r['source_profile']+'.lean')).read_bytes()).hexdigest() for r in pv)
 cv=json.loads((D/'interop/consumer-validation.json').read_text())
 assert cv['exit']==0 and cv['consumer_sha256']==hashlib.sha256((W/'interop/Consumer.lean').read_bytes()).hexdigest()
 summary['mathlib_tested']=True
 summary['mathlib_test_scope']='NumericMathlib proves decimal/hexadecimal printers equal Nat.digits with endian and zero adapters; Nat + SSR Option + Setoid consumer; Nat.prime_two; BinaryIntBitwise proves Z.land/lor/lxor and Pos/N.ldiff equal Mathlib APIs, with four negative-input examples and native Nat.and_comm reuse, at Mathlib '+cv['mathlib_commit']
 summary['coimport_snapshot']=iv
 summary['coimport_source_fingerprints_current']=packer_current and profiles_current
 summary['coimport_not_current_coverage']=not (packer_current and profiles_current) or hashlib.sha256(json.dumps(accepted,ensure_ascii=False,indent=2).encode()).hexdigest()!=iv['manifest_sha256']
baseline_audit=json.loads((D/'baseline-native-audit/summary.json').read_text())
assert baseline_audit['requested']==baseline_audit['audited']==143
assert baseline_audit['profiles_pass']==baseline_audit['profiles']==10
assert baseline_audit['with_remaining_source_symbols']==0
for r in json.loads((D/'baseline-native-audit/validation.json').read_text()):
 assert r['exit']==0
 for extension,key in [('lean','source_sha256'),('olean','olean_sha256')]:
  assert hashlib.sha256((B.parent/(r['profile']+'.'+extension)).read_bytes()).hexdigest()==r[key]
summary['baseline_native_target_reaudit']=baseline_audit
assert sum(counts.values())==2180
(D/'summary.json').write_text(json.dumps(summary,ensure_ascii=False,indent=2))
(D/'condition-discharges.json').write_text(json.dumps(resolved_conditions,ensure_ascii=False,indent=2))
(D/'original-statement-proofs.json').write_text(json.dumps(original_proofs,ensure_ascii=False,indent=2))
(D/'certificates.json').write_text(json.dumps(accepted,ensure_ascii=False,indent=2))
tasks=list(csv.DictReader((W/'tasks.csv').open()))
for t in tasks:
 r=rows[t['source']];t['current_status']=r['bridge_status'];t['progress']='checked_incremental' if r['new_certificates'] else 'baseline_only'
writecsv(W/'tasks.csv',tasks)
tick=chr(96);fence=tick*3
text='# 本轮 correspondence 证书\n\n按显式 source → certificate 清单计数，不把类型中提到的其他根算作已覆盖。\n'
for s in accepted:
 text+='\n## '+s['source']+'\n\n'+s['certificate']+'\n\n目标：'+s['target']+'；范围：'+s['scope']+'\n\n'+fence+'lean\n'+s['type']+'\n'+fence+'\n\n公理闭包：'+(', '.join(s['axioms']) or '空')+'\n'
(D/'CERTIFICATES.md').write_text(text)
print(json.dumps(summary,ensure_ascii=False))

from pathlib import Path
import json,csv,collections,hashlib
W=Path(__file__).resolve().parent;R=W.parents[1];D=W/'reports'
B=R/'experiments/mechanical-correspondence-20261019/reports'
specs=json.loads((W/'certificates.json').read_text())
validation=json.loads((D/'validation.json').read_text())
assert {r['profile'] for r in validation}=={'NumericWrite','SpecifNormalization','SpecifStatements','Basics','SSR','Iteration','Registry','SSRProperties','SSRBool','SSRBoolStatements','NumericRead','DecimalOperations','HexadecimalOperations','WellFounded','DependentElimination','PairRecursion','DependentStatements','DatatypeElimination','EqualityTransport','BooleanEquality','RelationDefinitions','RelationClasses','RelationClassStatements','VariadicPredicates','VariadicStatements','RelationConditions','Morphisms','MorphismStatements','EquivalenceBridge','EquivalenceStatements','MorphismsProp','SetoidBridge'}
audits={}
for r in validation:
 assert r['exit']==0 and r['audit_present'],r
 assert hashlib.sha256((W/'proofs'/(r['profile']+'.lean')).read_bytes()).hexdigest()==r['proof_sha256']
 audits[r['profile']]={x['name']:x for x in json.loads((D/(r['profile']+'-audit.json')).read_text())}
base=list(csv.DictReader((B/'CORELIB_LEDGER.csv').open()))
rows={r['source']:dict(r,baseline_bridge_status=r['bridge_status'],evidence_origin='inherited baseline',new_certificates='') for r in base}
automatic_groups=[
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
   specs.append({'source':selection[c['source_target']],'profile':profile,'certificate':c['certificate'],
     'kind':'STATEMENT_FULL_NATIVE','target':'native statement: '+c['native_expression'],
     'native_expression':c['native_expression'],'scope':'unconditional original statement; source-free body including NativeBridge alias expansion'})
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
condition_inputs=json.loads((W/'condition-obligations.json').read_text())['roots']
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
   assert not witness['axioms'],witness
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
  r['interpretation']=('新增原生陈述 iff；另有从原生性质推出的原陈述证明：'+sp['original_statement_proof']) if sp.get('original_statement_proof') else '新增原生陈述 iff；目标体及 NativeBridge 别名展开后无源端符号；不是业务定理证明。'
 else:
  r['interpretation']='新增已检查的'+('类型双向逆。' if sp['kind']=='TYPE_ISO' else '指定原生运算/表达式/谓词对应。')+'适用范围见增量证书完整类型。'

 if sp.get('closed_wrapper'):
  r['interpretation']='原始机械声明仍有显式条件；本桥接已用闭合证明实例化全部 '+str(r['prerequisites'])+' 项，使用 '+sp['closed_wrapper']+'。没有假定义务成立。'

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
 'full_baseline_rerun':False,'translation_rerun':False,'mathlib_tested':False,
 'automatic_native_target_synthesis':False,'automatic_certificate_composition':'SSR Option/function proof composition plus automatic statement normalization; arbitrary function targets still supplied',
 'conditions_remaining':counts['EXPLICIT_PROOF_PARAMETERS'],
 'mechanical_declarations_with_explicit_conditions':331,
 'correspondence_conditions_remaining':counts['EXPLICIT_PROOF_PARAMETERS'],
 'condition_resolved_roots':len({r['source'] for r in resolved_conditions}),
 'closed_obligation_witnesses':len({w['name'] for r in resolved_conditions for w in r['witnesses']}),
 'full_sort_type_certificates_added':7,'completion':'thirteen incremental batches plus P7 coexistence; overall plan remains incomplete',
 'explicit_target_classes_since_batch_3':dict(collections.Counter(sp['target_class'] for sp in specs if 'target_class' in sp))}
interop_path=D/'interop/all/import-all-validation.json'
if interop_path.exists():
 iv=json.loads(interop_path.read_text())
 manifest=D/'interop/coverage-manifest.json'
 assert iv['exit']==0 and hashlib.sha256(manifest.read_bytes()).hexdigest()==iv['manifest_sha256']
 assert iv['packer_sha256']==hashlib.sha256((W/'interop/ProfilePack.lean').read_bytes()).hexdigest()
 pv=json.loads((D/'interop/all/validation.json').read_text())
 assert len(pv)==iv['profiles'] and all(r['exit']==0 for r in pv)
 for r in pv:
  assert r['source_sha256']==hashlib.sha256((W/'proofs'/(r['source_profile']+'.lean')).read_bytes()).hexdigest()
 cv=json.loads((D/'interop/consumer-validation.json').read_text())
 assert cv['exit']==0 and cv['consumer_sha256']==hashlib.sha256((W/'interop/Consumer.lean').read_bytes()).hexdigest()
 summary['mathlib_tested']=True
 summary['mathlib_test_scope']='Nat + SSR Option + Setoid consumer; Nat.prime_two at Mathlib '+cv['mathlib_commit']
 summary['coimport_snapshot']=iv
 summary['coimport_not_current_coverage']=len(specs)!=iv['coverage_certificates']
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

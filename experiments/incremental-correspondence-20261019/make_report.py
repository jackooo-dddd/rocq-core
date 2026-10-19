from pathlib import Path
import json,csv,collections,hashlib
W=Path(__file__).resolve().parent;R=W.parents[1];D=W/'reports'
B=R/'experiments/mechanical-correspondence-20261019/reports'
specs=json.loads((W/'certificates.json').read_text())
validation=json.loads((D/'validation.json').read_text())
assert {r['profile'] for r in validation}=={'Basics','SSR','Iteration','Registry','SSRProperties','SSRBool','SSRBoolStatements','NumericRead','DecimalOperations','HexadecimalOperations','WellFounded','DependentElimination','PairRecursion','DependentStatements','DatatypeElimination'}
audits={}
for r in validation:
 assert r['exit']==0 and r['audit_present'],r
 assert hashlib.sha256((W/'proofs'/(r['profile']+'.lean')).read_bytes()).hexdigest()==r['proof_sha256']
 audits[r['profile']]={x['name']:x for x in json.loads((D/(r['profile']+'-audit.json')).read_text())}
base=list(csv.DictReader((B/'CORELIB_LEDGER.csv').open()))
rows={r['source']:dict(r,baseline_bridge_status=r['bridge_status'],evidence_origin='inherited baseline',new_certificates='') for r in base}
selection={x['target']:x['source'] for x in json.loads((W/'statement-selection.json').read_text())}
candidates=[json.loads(l.split('NATIVE_RESULT ',1)[1]) for l in (D/'SSRBoolStatements.log').read_text().splitlines() if 'NATIVE_RESULT ' in l]
assert len(candidates)==len(selection)==216
assert {x['source_target'] for x in candidates}==set(selection)
(D/'statement-candidates.json').write_text(json.dumps(candidates,ensure_ascii=False,indent=2))
for c in candidates:
 if c['full']:
  assert not c['remaining_source_symbols']
  specs.append({'source':selection[c['source_target']],'profile':'SSRBoolStatements','certificate':c['certificate'],
    'kind':'STATEMENT_FULL_NATIVE','target':'native statement: '+c['native_expression'],
    'native_expression':c['native_expression'],'scope':'unconditional original statement; source-free body including NativeBridge alias expansion'})
native_targets=[json.loads(l.split('NATIVE_TARGET ',1)[1]) for l in (D/'DependentStatements.log').read_text().splitlines() if 'NATIVE_TARGET ' in l]
native_targets={t['name']:t for t in native_targets}
assert len(native_targets)==5
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
writecsv(D/'CORELIB_LEDGER.csv',list(rows.values()))
counts=dict(collections.Counter(r['bridge_status'] for r in rows.values()))
bcounts=dict(collections.Counter(r['bridge_status'] for r in base))
alias=json.loads((D/'alias-regression.json').read_text())
assert len(alias)==45 and all(x['exit']==0 and not x['lost'] and not x['gained'] for x in alias)
summary={'alias_regression_profiles':45,'alias_regression_lost':0,'alias_regression_gained':0,'root_declarations':len(rows),'baseline':str(B.relative_to(R)),'baseline_status':bcounts,'coverage_status':counts,
 'new_type_roots':len({s['source'] for s in specs if s['kind']=='TYPE_ISO' and rows[s['source']]['baseline_bridge_status']!='TYPE_ISO'}),
 'new_operation_roots':len({s['source'] for s in specs if s['kind']=='OPERATION_CORRESPONDENCE' and rows[s['source']]['baseline_bridge_status']!='OPERATION_CORRESPONDENCE'}),
 'new_fully_native_statements':len({s['source'] for s in specs if s['kind']=='STATEMENT_FULL_NATIVE'}),
 'automatic_statement_candidates_rechecked':len(candidates),
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
 'full_sort_type_certificates_added':6,'completion':'six incremental batches; overall plan remains incomplete',
 'explicit_target_classes_since_batch_3':dict(collections.Counter(sp['target_class'] for sp in specs if 'target_class' in sp))}
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

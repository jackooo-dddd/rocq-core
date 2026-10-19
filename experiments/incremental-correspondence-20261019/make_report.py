from pathlib import Path
import json,csv,collections,hashlib
W=Path(__file__).resolve().parent;R=W.parents[1];D=W/'reports'
B=R/'experiments/mechanical-correspondence-20261019/reports'
specs=json.loads((W/'certificates.json').read_text())
validation=json.loads((D/'validation.json').read_text())
assert {r['profile'] for r in validation}=={'Basics','SSR','Iteration','Registry','SSRProperties'}
audits={}
for r in validation:
 assert r['exit']==0 and r['audit_present'],r
 assert hashlib.sha256((W/'proofs'/(r['profile']+'.lean')).read_bytes()).hexdigest()==r['proof_sha256']
 audits[r['profile']]={x['name']:x for x in json.loads((D/(r['profile']+'-audit.json')).read_text())}
base=list(csv.DictReader((B/'CORELIB_LEDGER.csv').open()))
rows={r['source']:dict(r,baseline_bridge_status=r['bridge_status'],evidence_origin='inherited baseline',new_certificates='') for r in base}
accepted=[]
for sp in specs:
 cert=audits[sp['profile']][sp['certificate']]
 assert set(cert['axioms']) <= {'propext','Quot.sound','Classical.choice'}
 assert sp['source'] in rows
 assert 'Rocq.'+sp['source'] in cert['source_references'],sp
 item=dict(sp,**{k:cert[k] for k in ['type','axioms']})
 accepted.append(item)
 r=rows[sp['source']];r['bridge_status']=sp['kind'];r['evidence_origin']='baseline + checked incremental certificate'
 r['new_certificates']=';'.join(filter(None,[r['new_certificates'],sp['certificate']]))
 r['bridge_certificates']=';'.join(filter(None,[r['bridge_certificates'],sp['certificate']]))
 r['interpretation']='新增已检查的'+('类型双向逆。' if sp['kind']=='TYPE_ISO' else '指定原生运算/表达式/谓词对应。')+'适用范围见增量证书完整类型。'
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
summary={'root_declarations':len(rows),'baseline':str(B.relative_to(R)),'baseline_status':bcounts,'coverage_status':counts,
 'new_type_roots':len({s['source'] for s in specs if s['kind']=='TYPE_ISO'}),
 'new_operation_roots':len({s['source'] for s in specs if s['kind']=='OPERATION_CORRESPONDENCE'}),
 'new_certificates':len(specs),'baseline_operation_certificates':119,'operation_certificates_total':119+sum(s['kind']=='OPERATION_CORRESPONDENCE' for s in specs),
 'type_certificates_total':30+sum(s['kind']=='TYPE_ISO' for s in specs),
 'native_interface_roundtrips':479,'new_root_interface_roundtrips':1,'passing_incremental_profiles':len(validation),
 'full_baseline_rerun':False,'translation_rerun':False,'mathlib_tested':False,
 'automatic_native_target_synthesis':False,'automatic_certificate_composition':'supported SSR Option/function rewrites; native target supplied',
 'conditions_remaining':331,'completion':'first incremental batch; overall plan remains incomplete'}
assert sum(counts.values())==2180
(D/'summary.json').write_text(json.dumps(summary,ensure_ascii=False,indent=2))
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

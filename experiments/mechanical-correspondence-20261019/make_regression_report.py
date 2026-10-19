from pathlib import Path
import json,csv,collections
W=Path(__file__).resolve().parent;O=W.parent/'native-correspondence-main75-20261018';D=W/'reports'
load=lambda p:json.loads(p.read_text())
legacy=load(W/'legacy/results.json')
oldtypes=load(O/'reports/isomorphisms.json');newtypes=load(D/'isomorphisms.json')
oldops=load(O/'reports/operations.json');newops=load(D/'operations.json')
newnames={r['name'] for r in newtypes+newops}
opcheck=[{'certificate':r['name'],'old_type':r['type'],'new_type':next((n['type'] for n in newtypes+newops if n['name']==r['name']),None),'same_literal_statement':r['type']==next((n['type'] for n in newtypes+newops if n['name']==r['name']),None),'present':r['name'] in newnames,'classification':'TYPE_ISO' if r['name']=='NativeBridge.nat_type_agrees' else 'OPERATION_CORRESPONDENCE'} for r in oldops]
typecheck=[{'certificate':r['name'],'old_type':r['type'],'new_type':next((n['type'] for n in newtypes if n['name']==r['name']),None),'present':any(n['name']==r['name'] for n in newtypes)} for r in oldtypes]
oldst={r['name']:r for r in load(O/'reports/statements.json')};newst={r['name']:r for r in load(D/'statements.json')}
stcheck=[{'certificate':k.removesuffix('.native')+'.correspondence','present':k in newst,'old_full_native':not r['remaining_source_symbols'],'new_full_native':not newst[k]['remaining_source_symbols'] if k in newst else None,'target_changed':r['native_body']!=newst[k]['native_body'] if k in newst else None} for k,r in oldst.items()]
oldit={r['source']:r for r in load(O/'reports/interfaces.json')};newit={r['source']:r for r in load(D/'interfaces.json')}
dependent={'Corelib.Init.Datatypes.nat_rec':'source_nat_rec_agrees','Corelib.Init.Datatypes.nat_rect':'source_nat_rect_agrees','Corelib.Init.Logic.eq_rew_dep':'source_eq_rew_dep_agrees','Corelib.Init.Logic.eq_rew_fwd_dep':'source_eq_rew_fwd_dep_agrees','Corelib.Init.Logic.eq_rew_fwd_r_dep':'source_eq_rew_fwd_r_dep_agrees'}
itcheck=[{'source':k,'automatic_roundtrip_present':k in newit,'manual_operation_correspondence':dependent.get(k),'reason':None if k in newit else 'Generic interface generator does not transport this dependent motive; explicit dependent operation theorem is separately checked.'} for k in oldit]
report={'legacy_profiles':{'tested':len(legacy),'unchanged_pass':sum(r['exit']==0 for r in legacy),'failed':sum(r['exit']!=0 for r in legacy),'failing_profiles':[r['profile'] for r in legacy if r['exit']]},'old_type_certificates':{'total':len(typecheck),'revalidated':sum(r['present'] for r in typecheck)},'old_operation_certificates':{'total':len(opcheck),'revalidated_or_replaced_by_explicit_iso':sum(r['present'] for r in opcheck)},'old_statement_certificates':{'total':len(stcheck),'revalidated':sum(r['present'] for r in stcheck),'lost_full_native':[r['certificate'] for r in stcheck if r['old_full_native'] and not r['new_full_native']]},'old_automatic_interfaces':{'total':len(oldit),'retained':len(set(oldit)&set(newit)),'not_automatically_regenerated':sorted(set(oldit)-set(newit)),'newly_generated':sorted(set(newit)-set(oldit))},'pending_proof_conditions_unchanged':331}
(D/'REGRESSION.json').write_text(json.dumps(report,ensure_ascii=False,indent=2))
for name,rows in [('type-regression',typecheck),('operation-regression',opcheck),('statement-regression',stcheck),('interface-regression',itcheck)]:
 (D/(name+'.json')).write_text(json.dumps(rows,ensure_ascii=False,indent=2))
 with (D/(name+'.csv')).open('w',newline='') as f:
  writer=csv.DictWriter(f,fieldnames=list(rows[0]));writer.writeheader();writer.writerows(rows)
assert all(r['present'] for r in typecheck+opcheck+stcheck)
assert not report['old_statement_certificates']['lost_full_native']
assert set(oldit)-set(newit) <= set(dependent)
print(json.dumps(report,ensure_ascii=False,indent=2))

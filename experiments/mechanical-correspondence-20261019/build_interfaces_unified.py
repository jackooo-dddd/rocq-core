from pathlib import Path
import json,subprocess
W=Path(__file__).resolve().parent
r=json.loads((W/'unified/translation_report.json').read_text())
defs=[x for x in r['results'] if x['target_kind']=='def' and not x['pending_hypotheses']]
text='import Unified\nnamespace NativeBridge\n'+(W/'fragments/NativeInterfaces.lean').read_text()
text+='\n'+'\n'.join('#export_native '+x['target'] for x in defs)+'\n'
text+=(W/'fragments/Audit.lean').read_text().replace('AUDIT_PATH',str(W/'audits/UnifiedInterfaces.json'))
(W/'UnifiedInterfaces.lean').write_text(text)
subprocess.run(['python3',str(W/'run.py'),'UnifiedInterfaces','unified'],check=True)

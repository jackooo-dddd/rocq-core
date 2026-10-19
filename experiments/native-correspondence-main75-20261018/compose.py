from pathlib import Path
import sys,json
W=Path(__file__).resolve().parent
profile=sys.argv[1]
parts=sys.argv[2:]
s='\n'.join((W/'fragments'/f'{x}.lean').read_text() for x in parts)
s+='\n'+(W/'fragments/Audit.lean').read_text().replace('AUDIT_PATH',str(W/'audits'/f'{profile}.json'))
(W/(profile+'.lean')).write_text(s)

from pathlib import Path
W=Path(__file__).resolve().parent
template=(W/'digit-operations.lean.inc').read_text()
for module,base in [('Decimal',10),('Hexadecimal',16)]:
    text=template.replace('@MODULE@',module).replace('@LOW@',module.lower()).replace('@BASE@',str(base)).replace('@SUFFIX@','' if module=='Decimal' else '0')
    (W/'proofs'/(module+'Operations.lean')).write_text(text)

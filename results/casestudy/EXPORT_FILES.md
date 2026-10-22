# Export file itemized description

List each file in the three frozen run directories; uningested compilation cache remains in the remote original directory.

| module | File | Already included | explain |
|---|---|---|---|
| Datatypes | .Export.aux | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Datatypes | .rocq2lean.lock | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Datatypes | Export.glob | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Datatypes | [Export.v](exports/Datatypes/Export.v) | Yes | MetaRocq Export driver: Import the module and specify roots. |
| Datatypes | Export.vo | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Datatypes | [audit.json](exports/Datatypes/audit.json) | Yes | Independent structural audit results. |
| Datatypes | [audit.log](exports/Datatypes/audit.log) | Yes | Stage log: audit.log; used to locate export, translation or verification problems. |
| Datatypes | [consumer.log](exports/Datatypes/consumer.log) | Yes | Stage log: consumer.log; used to locate export, translation or verification problems. |
| Datatypes | [consumer_result.json](exports/Datatypes/consumer_result.json) | Yes | Independent Lean consumer inspection results. |
| Datatypes | [contract.json](exports/Datatypes/contract.json) | Yes | Declaration and constraint contracts used by import/consume checks. |
| Datatypes | [export-0.log](exports/Datatypes/export-0.log) | Yes | Stage log: export-0.log; used to locate export, translation or verification problems. |
| Datatypes | [inventory.json](exports/Datatypes/inventory.json) | Yes | Original root listing for this module. |
| Datatypes | [lean/Consumer.lean](exports/Datatypes/lean/Consumer.lean) | Yes | Independent consumer verification entrance. |
| Datatypes | lean/Rocq2LeanOut.ilean | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Datatypes | [lean/Rocq2LeanOut.lean](exports/Datatypes/lean/Rocq2LeanOut.lean) | Yes | Register the import entry for the Lean kernel declaration from the IR/ report. |
| Datatypes | lean/Rocq2LeanOut.olean | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Datatypes | [logs/translate.log](exports/Datatypes/logs/translate.log) | Yes | Stage log: logs/translate.log; used to locate export, translation or verification problems. |
| Datatypes | [result.json](exports/Datatypes/result.json) | Yes | Summary of module export, translation and verification. |
| Datatypes | [roundtrip.log](exports/Datatypes/roundtrip.log) | Yes | Stage log: roundtrip.log; used to locate export, translation or verification problems. |
| Datatypes | source-roundtrip/.RoundTrip.aux | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Datatypes | source-roundtrip/.RoundTripNative.aux | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Datatypes | source-roundtrip/.RoundTripStatement.aux | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Datatypes | source-roundtrip/.RoundTripStatementAlone.aux | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Datatypes | source-roundtrip/.RoundTripUniverses.aux | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Datatypes | source-roundtrip/RoundTrip.glob | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Datatypes | [source-roundtrip/RoundTrip.v](exports/Datatypes/source-roundtrip/RoundTrip.v) | Yes | Rocq statement reconstructed from IR for source kernel review. |
| Datatypes | source-roundtrip/RoundTrip.vo | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Datatypes | source-roundtrip/RoundTripNative.glob | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Datatypes | [source-roundtrip/RoundTripNative.v](exports/Datatypes/source-roundtrip/RoundTripNative.v) | Yes | Source-side review entry for native metadata. |
| Datatypes | source-roundtrip/RoundTripNative.vo | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Datatypes | source-roundtrip/RoundTripStatement.glob | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Datatypes | source-roundtrip/RoundTripStatement.keys | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Datatypes | source-roundtrip/RoundTripStatement.v | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Datatypes | source-roundtrip/RoundTripStatement.vo | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Datatypes | source-roundtrip/RoundTripStatementAlone.glob | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Datatypes | source-roundtrip/RoundTripStatementAlone.v | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Datatypes | source-roundtrip/RoundTripStatementAlone.vo | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Datatypes | source-roundtrip/RoundTripUniverses.glob | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Datatypes | [source-roundtrip/RoundTripUniverses.out](exports/Datatypes/source-roundtrip/RoundTripUniverses.out) | Yes | Universe review output. |
| Datatypes | [source-roundtrip/RoundTripUniverses.tsv](exports/Datatypes/source-roundtrip/RoundTripUniverses.tsv) | Yes | Universe Fact Table. |
| Datatypes | [source-roundtrip/RoundTripUniverses.v](exports/Datatypes/source-roundtrip/RoundTripUniverses.v) | Yes | Source-side review entry for universe context. |
| Datatypes | source-roundtrip/RoundTripUniverses.vo | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Datatypes | [source-roundtrip/logs/RoundTripStatement.log](exports/Datatypes/source-roundtrip/logs/RoundTripStatement.log) | Yes | Stage log: source-roundtrip/logs/RoundTripStatement.log; used to locate export, translation or verification problems. |
| Datatypes | [source-roundtrip/logs/RoundTripStatementAlone.log](exports/Datatypes/source-roundtrip/logs/RoundTripStatementAlone.log) | Yes | Stage log: source-roundtrip/logs/RoundTripStatementAlone.log; used to locate export, translation or verification problems. |
| Datatypes | [source-roundtrip/logs/roundtrip.log](exports/Datatypes/source-roundtrip/logs/roundtrip.log) | Yes | Stage log: source-roundtrip/logs/roundtrip.log; used to locate export, translation or verification problems. |
| Datatypes | [source-roundtrip/logs/roundtrip_native.log](exports/Datatypes/source-roundtrip/logs/roundtrip_native.log) | Yes | Stage log: source-roundtrip/logs/roundtrip_native.log; used to locate export, translation or verification problems. |
| Datatypes | [source-roundtrip/logs/roundtrip_universes.log](exports/Datatypes/source-roundtrip/logs/roundtrip_universes.log) | Yes | Stage log: source-roundtrip/logs/roundtrip_universes.log; used to locate export, translation or verification problems. |
| Datatypes | [source-roundtrip/roundtrip.json](exports/Datatypes/source-roundtrip/roundtrip.json) | Yes | Source roundtrip result. |
| Datatypes | [source.ndjson](exports/Datatypes/source.ndjson) | Yes | IR Declaration and proof conditions in header, universe context, dependency order; includes dependency closure. |
| Datatypes | [translate.log](exports/Datatypes/translate.log) | Yes | Stage log: translate.log; used to locate export, translation or verification problems. |
| Datatypes | [translation_manifest.json](exports/Datatypes/translation_manifest.json) | Yes | Run input, report, and build module associated information. |
| Datatypes | [translation_report.json](exports/Datatypes/translation_report.json) | Yes | Target status, type/body AST, report fields, dependencies and conditions. |
| Datatypes | [translation_timing.json](exports/Datatypes/translation_timing.json) | Yes | Statement by tier tag, time taken and result; not by AST event log. |
| Nat | .Export.aux | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Nat | .rocq2lean.lock | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Nat | Export.glob | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Nat | [Export.v](exports/Nat/Export.v) | Yes | MetaRocq Export driver: Import the module and specify roots. |
| Nat | Export.vo | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Nat | [audit.json](exports/Nat/audit.json) | Yes | Independent structural audit results. |
| Nat | [audit.log](exports/Nat/audit.log) | Yes | Stage log: audit.log; used to locate export, translation or verification problems. |
| Nat | [consumer.log](exports/Nat/consumer.log) | Yes | Stage log: consumer.log; used to locate export, translation or verification problems. |
| Nat | [consumer_result.json](exports/Nat/consumer_result.json) | Yes | Independent Lean consumer inspection results. |
| Nat | [contract.json](exports/Nat/contract.json) | Yes | Declaration and constraint contracts used by import/consume checks. |
| Nat | [export-0.log](exports/Nat/export-0.log) | Yes | Stage log: export-0.log; used to locate export, translation or verification problems. |
| Nat | [inventory.json](exports/Nat/inventory.json) | Yes | Original root listing for this module. |
| Nat | [lean/Consumer.lean](exports/Nat/lean/Consumer.lean) | Yes | Independent consumer verification entrance. |
| Nat | lean/Rocq2LeanOut.ilean | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Nat | [lean/Rocq2LeanOut.lean](exports/Nat/lean/Rocq2LeanOut.lean) | Yes | Register the import entry for the Lean kernel declaration from the IR/ report. |
| Nat | lean/Rocq2LeanOut.olean | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Nat | [logs/translate.log](exports/Nat/logs/translate.log) | Yes | Stage log: logs/translate.log; used to locate export, translation or verification problems. |
| Nat | [result.json](exports/Nat/result.json) | Yes | Summary of module export, translation and verification. |
| Nat | [roundtrip.log](exports/Nat/roundtrip.log) | Yes | Stage log: roundtrip.log; used to locate export, translation or verification problems. |
| Nat | source-roundtrip/.RoundTrip.aux | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Nat | source-roundtrip/.RoundTripNative.aux | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Nat | source-roundtrip/.RoundTripUniverses.aux | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Nat | source-roundtrip/RoundTrip.glob | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Nat | [source-roundtrip/RoundTrip.v](exports/Nat/source-roundtrip/RoundTrip.v) | Yes | Rocq statement reconstructed from IR for source kernel review. |
| Nat | source-roundtrip/RoundTrip.vo | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Nat | source-roundtrip/RoundTripNative.glob | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Nat | [source-roundtrip/RoundTripNative.v](exports/Nat/source-roundtrip/RoundTripNative.v) | Yes | Source-side review entry for native metadata. |
| Nat | source-roundtrip/RoundTripNative.vo | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Nat | source-roundtrip/RoundTripUniverses.glob | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Nat | [source-roundtrip/RoundTripUniverses.out](exports/Nat/source-roundtrip/RoundTripUniverses.out) | Yes | Universe review output. |
| Nat | [source-roundtrip/RoundTripUniverses.tsv](exports/Nat/source-roundtrip/RoundTripUniverses.tsv) | Yes | Universe Fact Table. |
| Nat | [source-roundtrip/RoundTripUniverses.v](exports/Nat/source-roundtrip/RoundTripUniverses.v) | Yes | Source-side review entry for universe context. |
| Nat | source-roundtrip/RoundTripUniverses.vo | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Nat | [source-roundtrip/logs/roundtrip.log](exports/Nat/source-roundtrip/logs/roundtrip.log) | Yes | Stage log: source-roundtrip/logs/roundtrip.log; used to locate export, translation or verification problems. |
| Nat | [source-roundtrip/logs/roundtrip_native.log](exports/Nat/source-roundtrip/logs/roundtrip_native.log) | Yes | Stage log: source-roundtrip/logs/roundtrip_native.log; used to locate export, translation or verification problems. |
| Nat | [source-roundtrip/logs/roundtrip_universes.log](exports/Nat/source-roundtrip/logs/roundtrip_universes.log) | Yes | Stage log: source-roundtrip/logs/roundtrip_universes.log; used to locate export, translation or verification problems. |
| Nat | [source-roundtrip/roundtrip.json](exports/Nat/source-roundtrip/roundtrip.json) | Yes | Source roundtrip result. |
| Nat | [source.ndjson](exports/Nat/source.ndjson) | Yes | IR Declaration and proof conditions in header, universe context, dependency order; includes dependency closure. |
| Nat | [translate.log](exports/Nat/translate.log) | Yes | Stage log: translate.log; used to locate export, translation or verification problems. |
| Nat | [translation_manifest.json](exports/Nat/translation_manifest.json) | Yes | Run input, report, and build module associated information. |
| Nat | [translation_report.json](exports/Nat/translation_report.json) | Yes | Target status, type/body AST, report fields, dependencies and conditions. |
| Nat | [translation_timing.json](exports/Nat/translation_timing.json) | Yes | Statement by tier tag, time taken and result; not by AST event log. |
| Peano | .Export.aux | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Peano | .rocq2lean.lock | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Peano | Export.glob | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Peano | [Export.v](exports/Peano/Export.v) | Yes | MetaRocq Export driver: Import the module and specify roots. |
| Peano | Export.vo | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Peano | [audit.json](exports/Peano/audit.json) | Yes | Independent structural audit results. |
| Peano | [audit.log](exports/Peano/audit.log) | Yes | Stage log: audit.log; used to locate export, translation or verification problems. |
| Peano | [consumer.log](exports/Peano/consumer.log) | Yes | Stage log: consumer.log; used to locate export, translation or verification problems. |
| Peano | [consumer_result.json](exports/Peano/consumer_result.json) | Yes | Independent Lean consumer inspection results. |
| Peano | [contract.json](exports/Peano/contract.json) | Yes | Declaration and constraint contracts used by import/consume checks. |
| Peano | [export-0.log](exports/Peano/export-0.log) | Yes | Stage log: export-0.log; used to locate export, translation or verification problems. |
| Peano | [inventory.json](exports/Peano/inventory.json) | Yes | Original root listing for this module. |
| Peano | [lean/Consumer.lean](exports/Peano/lean/Consumer.lean) | Yes | Independent consumer verification entrance. |
| Peano | lean/Rocq2LeanOut.ilean | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Peano | [lean/Rocq2LeanOut.lean](exports/Peano/lean/Rocq2LeanOut.lean) | Yes | Register the import entry for the Lean kernel declaration from the IR/ report. |
| Peano | lean/Rocq2LeanOut.olean | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Peano | [logs/translate.log](exports/Peano/logs/translate.log) | Yes | Stage log: logs/translate.log; used to locate export, translation or verification problems. |
| Peano | [result.json](exports/Peano/result.json) | Yes | Summary of module export, translation and verification. |
| Peano | [roundtrip.log](exports/Peano/roundtrip.log) | Yes | Stage log: roundtrip.log; used to locate export, translation or verification problems. |
| Peano | source-roundtrip/.RoundTrip.aux | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Peano | source-roundtrip/.RoundTripNative.aux | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Peano | source-roundtrip/.RoundTripStatement.aux | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Peano | source-roundtrip/.RoundTripStatementAlone.aux | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Peano | source-roundtrip/.RoundTripUniverses.aux | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Peano | source-roundtrip/RoundTrip.glob | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Peano | [source-roundtrip/RoundTrip.v](exports/Peano/source-roundtrip/RoundTrip.v) | Yes | Rocq statement reconstructed from IR for source kernel review. |
| Peano | source-roundtrip/RoundTrip.vo | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Peano | source-roundtrip/RoundTripNative.glob | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Peano | [source-roundtrip/RoundTripNative.v](exports/Peano/source-roundtrip/RoundTripNative.v) | Yes | Source-side review entry for native metadata. |
| Peano | source-roundtrip/RoundTripNative.vo | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Peano | source-roundtrip/RoundTripStatement.glob | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Peano | source-roundtrip/RoundTripStatement.keys | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Peano | source-roundtrip/RoundTripStatement.v | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Peano | source-roundtrip/RoundTripStatement.vo | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Peano | source-roundtrip/RoundTripStatementAlone.glob | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Peano | source-roundtrip/RoundTripStatementAlone.v | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Peano | source-roundtrip/RoundTripStatementAlone.vo | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Peano | source-roundtrip/RoundTripUniverses.glob | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Peano | [source-roundtrip/RoundTripUniverses.out](exports/Peano/source-roundtrip/RoundTripUniverses.out) | Yes | Universe review output. |
| Peano | [source-roundtrip/RoundTripUniverses.tsv](exports/Peano/source-roundtrip/RoundTripUniverses.tsv) | Yes | Universe Fact Table. |
| Peano | [source-roundtrip/RoundTripUniverses.v](exports/Peano/source-roundtrip/RoundTripUniverses.v) | Yes | Source-side review entry for universe context. |
| Peano | source-roundtrip/RoundTripUniverses.vo | No | Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy. |
| Peano | [source-roundtrip/logs/RoundTripStatement.log](exports/Peano/source-roundtrip/logs/RoundTripStatement.log) | Yes | Stage log: source-roundtrip/logs/RoundTripStatement.log; used to locate export, translation or verification problems. |
| Peano | [source-roundtrip/logs/RoundTripStatementAlone.log](exports/Peano/source-roundtrip/logs/RoundTripStatementAlone.log) | Yes | Stage log: source-roundtrip/logs/RoundTripStatementAlone.log; used to locate export, translation or verification problems. |
| Peano | [source-roundtrip/logs/roundtrip.log](exports/Peano/source-roundtrip/logs/roundtrip.log) | Yes | Stage log: source-roundtrip/logs/roundtrip.log; used to locate export, translation or verification problems. |
| Peano | [source-roundtrip/logs/roundtrip_native.log](exports/Peano/source-roundtrip/logs/roundtrip_native.log) | Yes | Stage log: source-roundtrip/logs/roundtrip_native.log; used to locate export, translation or verification problems. |
| Peano | [source-roundtrip/logs/roundtrip_universes.log](exports/Peano/source-roundtrip/logs/roundtrip_universes.log) | Yes | Stage log: source-roundtrip/logs/roundtrip_universes.log; used to locate export, translation or verification problems. |
| Peano | [source-roundtrip/roundtrip.json](exports/Peano/source-roundtrip/roundtrip.json) | Yes | Source roundtrip result. |
| Peano | [source.ndjson](exports/Peano/source.ndjson) | Yes | IR Declaration and proof conditions in header, universe context, dependency order; includes dependency closure. |
| Peano | [translate.log](exports/Peano/translate.log) | Yes | Stage log: translate.log; used to locate export, translation or verification problems. |
| Peano | [translation_manifest.json](exports/Peano/translation_manifest.json) | Yes | Run input, report, and build module associated information. |
| Peano | [translation_report.json](exports/Peano/translation_report.json) | Yes | Target status, type/body AST, report fields, dependencies and conditions. |
| Peano | [translation_timing.json](exports/Peano/translation_timing.json) | Yes | Statement by tier tag, time taken and result; not by AST event log. |

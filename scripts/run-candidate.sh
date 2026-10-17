#!/bin/bash
set -eu
cd ~/research/rocq-core-by-file-20261018/translator/rocq/exporter
~/.local/bin/opam exec --switch=rocq930-mc -- make -j2
python3 ~/research/rocq-core-by-file-20261018/scripts/run_experiment.py candidate-final

#!/bin/bash
# Helper: source the XPU runtime env, activate the venv, run an XPU CI suite.
set -uo pipefail
SUITE="${1:?usage: run_xpu_suite.sh <suite>}"
source /opt/install/xpugraph.sh >/dev/null 2>&1
source /opt/venv/bin/activate
cd /root/litang/github/test/sglang/test
echo "=== Running suite: ${SUITE} ==="
python3 run_suite.py --hw xpu --suite "${SUITE}"
echo "=== suite ${SUITE} exit: $? ==="

#!/usr/bin/env bash
set -euo pipefail

# Erwartet Strings "true" oder "false"
PROC_OK="${PROC_OK:-true}"
PORT_OK="${PORT_OK:-true}"
LOG_WARN="${LOG_WARN:-false}"

code=0

if [[ "$PROC_OK" == "false" || "$PORT_OK" == "false" ]]; then

	code=2

elif [[ "$LOG_WARN" == "true" ]]; then

	code=1
fi

# Für Final

if (( code == 2 )); then

	echo "[CRIT] summary: proc=$PROC_OK port=$PORT_OK logs_warn=$LOG_WARN"

elif (( code == 1 )); then

	echo "[WARN] summary: proc=$PROC_OK port=$PORT_OK logs_warn=$LOG_WARN"

else

	echo "[OK] summary: proc=$PROC_OK port=$PORT_OK logs_warn=$LOG_WARN"

fi

exit "$code"


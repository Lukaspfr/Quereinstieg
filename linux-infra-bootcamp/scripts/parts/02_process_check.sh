#!/bin/bash

set -euo pipefail

name="${1:-}"

if [[ -n "$name" ]]; then

	if pgrep -a -- "$name" >/dev/null; then
		echo "[OK] Prozesse $name gefunden"
		pgrep -a -- "$name"
		exit 0
	else
		echo "[CRIT] Kein Prozess gefunden: $name"
		exit 2
	fi
else
	echo "[CRIT] Kein Name wurde angegeben"
	exit 2
fi

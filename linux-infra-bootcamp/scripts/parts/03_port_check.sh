#!/bin/bash

port="${1:-}"

if [[ -z "$port" ]]; then

	echo "[CRIT] Bitte Port als Argument mitgeben."
	exit 2

fi

if out=$(ss -ltnp 2>/dev/null | grep -E -- ":$port([^0-9]|$)"); then

	echo "[OK] Port $port listening"
	echo "$out"
	exit 0

else

	echo "[CRIT] Kein LISTEN Socket an Port: $port"
	exit 2

fi

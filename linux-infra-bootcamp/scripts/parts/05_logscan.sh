#!/bin/bash

set -euo pipefail

log="" 
lines="50" 
count=0

#Weisst die Variablen den Argumenten zu 
while getopts ":l:c:" opt; do
       	case "$opt" in 
		
		l) log="$OPTARG" ;; 
		c) lines="$OPTARG";; 
	esac 
done

shift $((OPTIND - 1))

if [[ $# -gt 0 ]]; then

	echo "[CRIT] Unerwartete Argumente: $*"
	exit 2

fi
#Logfile prüfen

if [[ ! -f "$log" ]]; then

	echo "[CRIT] Logfile existiert nicht: $log"
	exit 2

fi


# Sind genug Argumente da?

[[ -n "$log" ]] && ((count += 1))

if ((count == 0)); then

	echo "[WARN] Es braucht ein Log File"
	exit 1
fi

#Lines prüfen
[[ "$lines" =~ ^[0-9]+$ ]] || { echo "[CRIT] -c muss eine Zahl sein"; exit 2; }
(( lines >= 1 )) || { echo "[CRIT] -c muss >= 1 sein"; exit 2; }

out="$(tail -n "$lines" -- "$log" | grep -Ei "error|fail|panic|traceback" || true)"

if [[ -n "$out" ]]; then

	echo "[WARN] Errorartige Logs gefunden."
	echo "$out"
	exit 1

else
	
	echo "[OK] Keine errorartigen Meldungen in den letzten Zeilen"
	exit 0

fi


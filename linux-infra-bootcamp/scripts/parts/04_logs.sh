#!/bin/bash

set -euo pipefail

service=""
log=""
lines="50"
count=0

#Weisst die Variablen den Argumenten zu

while getopts ":s:l:c:" opt; do
	case "$opt" in
		s) service="$OPTARG" ;;
		l) log="$OPTARG" ;;
		c) lines="$OPTARG";;
	esac
done

shift $((OPTIND - 1))

if [[ $# -gt 0 ]]; then
	echo "[CRIT] Unerwartete Argumente: $*"
	exit 2
fi

 # Sind genug Argumente da?

[[ -n "$service" ]] && ((count += 1))
[[ -n "$log" ]] && ((count += 1))

if ((count == 0)); then

	echo "[WARN] Es muss mindestens -s oder -l mitgegeben werden"
	exit 1
fi
#Überprüfen ob es eine Zahl ---> because humans are dumb

[[ "$lines" =~ ^[0-9]+$ ]] || { echo "[CRIT] -c muss eine Zahl sein"; exit 2; }
(( lines >= 1 )) || { echo "[CRIT] -c muss >= 1 sein"; exit 2; }
#Here comes the magic

if [[ -n "$log" ]] && tail -n 1 -- "$log" >/dev/null 2>&1; then
	
	tail -n "$lines" -- "$log"
        exit 0

elif [[ -n "$service" ]] && command -v journalctl >/dev/null 2>&1 && journalctl -u "$service" -n 1 --no-pager >/dev/null 2>&1; then

        journalctl -u "$service" -n "$lines" --no-pager
        exit 0

fi

# fallback

if [[ -f /var/log/syslog ]]; then

	tail -n "$lines" -- /var/log/syslog
	exit 0

elif [[ -f /var/log/messages ]]; then

	tail -n "$lines" -- /var/log/messages
	exit 0
else

	echo "[WARN] Kein logfile, kein journalctl-output und kein /var/log/syslog|messages gefunden."
	echo "Tipp: Starte den Dienst im Foreground (z.B. direkt im Terminal) oder schreibe Logs in eine Datei."
	exit 1
fi

	

	

#!/bin/env bash

set -euo pipefail

#How to use

usage() {
  echo "Benutzung: $0 [-n <prozess>] [-p <port>] [-l <logfile>] [-c <lines>] [-h]"
  echo "Beispiele:"
  echo "  $0 -n python3"
  echo "  $0 -p 8000"
  echo "  $0 -l /tmp/x.log -c 20"
}

# Initialise vars because of set -u

name=""
port=""
log=""
lines="50"
lines_set=0



#Getops sets the record straight!

while getopts ":n:p:l:c:h" opt; do
	case "$opt" in
		n)name="$OPTARG";;
		p)port="$OPTARG";;
		l)log="$OPTARG";;
		c)lines="$OPTARG"; lines_set=1 ;;
		h) usage; exit 0 ;;
		\?) echo "Unbekannte Option: -$OPTARG"; usage; exit 2 ;;
    		:)  echo "Option -$OPTARG braucht einen Wert."; usage; exit 2 ;;
	esac
done

shift $((OPTIND - 1))

#No more parsing arguments

if [[ $# -gt 0 ]]; then
	echo "Unerwartete Argumente: $*"
	usage
	exit 2
fi


# Count the set fields
count=0
[[ -n "$name"  ]] && ((count += 1))
[[ -n "$port"  ]] && ((count += 1))
[[ -n "$log"   ]] && ((count += 1))


# Rules:
# - not 0
 
if (( count == 0 )); then
	echo "Fehler: Mindestens eine Option von -n, -p, -l muss gesetzt sein."
	usage
	exit 2
fi
#Validations

if [[ -n "$port" ]] && ! [[ "$port" =~ ^[0-9]+$ ]] ; then

	echo "Fehler: Port muss eine Zahl sein."
	exit 2

fi
if [[ -n "$port" ]] && (( port < 1 || port > 65535 )); then

	echo "Fehler: Port muss zwischen 1 und 65535 liegen."
	exit 2

fi

if ! [[ "$lines" =~ ^[0-9]+$ ]] || (( lines < 1 )); then

	echo "Fehler: lines (-c) muss eine positive Zahl sein."
	exit 2

fi

[[ -n "$name" ]] && echo "name=$name"
[[ -n "$port" ]] && echo "port=$port"
[[ -n "$log"  ]] && echo "logfile=$log"
(( lines_set == 1 )) && echo "lines=$lines"


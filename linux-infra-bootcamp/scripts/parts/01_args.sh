#!/bin/bash

set -euo pipefail

#How to use

usage() {
	echo "Benutzung: $0 <name(-n)> <port(-p)> <Logfile(-l)> <Lines(-c)> <help(-help)"

}

# Initialise vars because of set -u

name=""
port=""
log=""
lines="50"

#Helper

for arg in "$@"; do
  if [[ "$arg" == "-help" ]]; then
    usage
    exit 0
  fi
done




while getopts "n:p:l:c:" opt; do
	case "$opt" in
		n)name="$OPTARG";;
		p)port="$OPTARG";;
		l)log="$OPTARG";;
		c)lines="$OPTARG";;
	esac
done


# Count the set fields
count=0
[[ -n "$name"  ]] && ((count++))
[[ -n "$port"  ]] && ((count++))
[[ -n "$log"   ]] && ((count++))
[[ -n "$lines" ]] && ((count++))

# Rules:
# - not 0
# - not more than 4 
if (( count == 0 || count > 4 )); then
  echo "Fehler: gib 1 bis 4 Optionen an."
  usage
  exit 1
fi


echo "Name = $name"
echo "Port = $port"
echo "Log = $log"
echo "Lines of log: $lines"



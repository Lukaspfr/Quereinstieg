````md
# Review Tag 5

## Wichtigste Commands

### `getopts` (Flags in Bash)
```bash
while getopts ":n:p:l:c:s:hd" opt; do
  case "$opt" in
    n) proc_name="$OPTARG" ;;
    p) port="$OPTARG" ;;
    l) log="$OPTARG" ;;
    c) lines="$OPTARG" ;;
    s) service="$OPTARG" ;;
    h) usage; exit 0 ;;
    d) DEBUG=1 ;;
    \?) echo "Unbekannte Option: -$OPTARG"; usage; exit 2 ;;
    :)  echo "Option -$OPTARG braucht einen Wert."; usage; exit 2 ;;
  esac
done
````

Ermöglicht flaggen für inputs in bash skripte.

---

### `shift $((OPTIND - 1))`

```bash
shift $((OPTIND - 1))
```

zieht danach von den inputtokens die bereits benutzten Tokens ap.
→ in anderen worten: entfernt die bereits geparsten elemente aus `$@`.

---

### “Unerwartete Argumente” prüfen

```bash
if [[ $# -gt 0 ]]; then
  echo "[CRIT] Unerwartete Argumente: $*"
  usage
  exit 2
fi
```

Diese if Bedingung schaut ob nach dem abziehen aller zugeteilten Tokens noch tockens da sind. wenn noch welche da sind dann exit 2.

---

## `ss` + `grep` Port-Check

### Beispiel

```bash
ss -ltnp 2>/dev/null | grep -E -- ":$port([^0-9]|$)"
```

### Erklärung `ss -ltnp`

`ss` → socketstatistik → netstat

* `-l` -> listening sockets
* `-t` -> TCP
* `-n` -> numeric (keine DNS Servicenamen)
* `-p` -> process anzeigen (PID/Programmname), wenn erlaubt

### `2>/dev/null`

Leitet `stderr` (File Descriptor 2) nach `/dev/null` um = “wegwerfen”.

In WSL oder ohne Root kann `-p` (Prozessname/PID) teilweise leer sein oder “permission denied” triggern → deswegen `2>/dev/null`.

### `| grep -E -- ":$port([^0-9]|$)"`

* Filtert die `ss`-Ausgabe nach deinem Port.

`grep -E` = Extended Regex (damit `()` und `|` ohne Backslashes gehen)

`--` = “Ende der Optionen” (falls dein Pattern mal mit `-` anfangen würde, wird es nicht als Flag interpretiert)

#### Der Regex `":$port([^0-9]|$)"`

Ziel: Port exakt matchen, nicht als Teil einer grösseren Zahl.

* `:$port` sucht nach `:8080` (wenn `port=8080`)
* `([^0-9]|$)` bedeutet: danach kommt entweder

  * kein Digit (also z.B. Leerzeichen, Komma, `:` bei IPv6-Ausgabe etc.)
  * oder Ende der Zeile

---

## 2 Fehler, die du gemacht hast + Fix

### Fehler

```bash
process_check || true; proc_rc=$?
port_check    || true; port_rc=$?
log_show      || true; log_rc=$?
log_scan      || true; scan_rc=$?
summary
```

in der main Methode verwendet, durch das true zwar verhindert das `set -euo pipefail` meinen Code beendet durch die exit returncodes, doch es hat auch verhindert das ich sie auffangen konnte.

### Lösung

Die Lösung ist sie in der gleichen Zeile zu storen:

```bash
process_check || proc_rc=$?
port_check    || port_rc=$?
log_show      || log_rc=$?
log_scan      || scan_rc=$?
```

---

## Weitere Erkenntnis

Die Argumente am anfang unspeziefisch entgegengenommen und versucht via Python regeyx zu unterscheiden. Unglaublich ineffizient.

---

## Debug-Falle

`[[ "$DEBUG" == "1" ]] && echo ...` -> hat mein Skribt beeindet wegen `set -e`
Fix: In if Schleife packen.

---

## “Was würde ich im Job tun?”

Ich würde zuerst `bash -x` / `set -x` nutzen um zu sehen, wo es abbricht.
Das Problem dann mit google versuchen zu lösen wenn ich es nicht selber weiss oder jemanden Fragen mit dem ich arbeite.

```
```


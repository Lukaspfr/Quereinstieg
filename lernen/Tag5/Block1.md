### Unterschied `>` vs `>>`

- `>`: leitet stdout in eine Datei um und überschreibt den Inhalt (truncate).
- `>>`: leitet stdout in eine Datei um und hängt an (append), ohne zu überschreiben.

### Nur `stderr` umleiten

- Nur stderr in Datei: `cmd 2> errors.log`
- stderr anhängen: `cmd 2>> errors.log`
- stderr verwerfen: `cmd 2>/dev/null`
- `2>&1` bedeutet: stderr (2) geht dahin, wo stdout (1) hinzeigt (Reihenfolge wichtig).

### Warum `pgrep -a` oft besser ist als `ps | grep`

- Kein “grep findet sich selbst”-Problem
- Direkte PID-Ausgabe (maschinenfreundlich), auch Count möglich (`-c`)
- `-a` zeigt die komplette Kommandozeile
- Optional `-f` für Match auf komplette Kommandozeile
:

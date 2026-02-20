### Unterschied `grep` vs `grep -E`

- `grep` nutzt Basic Regex (BRE).
- `grep -E` nutzt Extended Regex (ERE), z.B. `|`, `+`, `?` ohne/mit weniger Escapes.

Beispiel:

`grep -E "error|fail|panic" logfile`

### Wofür `sort | uniq -c` klassisch ist

- Zum Zählen von Häufigkeiten: erst `sort`, dann zählt `uniq -c`.
- Wichtig: `uniq` wirkt nur auf benachbarte gleiche Zeilen.

### Was macht `awk '{print $3}'`

- Gibt das 3. Feld jeder Zeile aus.
- Standard-Feldtrenner ist Whitespace (Leerzeichen/Tabs).

Beispiel:

`echo "a b c" | awk '{print $3}'`



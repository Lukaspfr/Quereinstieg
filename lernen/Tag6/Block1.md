##1–2 Zeilen: was ist Feld 1/7/9 im Log

10.0.0.1 - - [20/Feb/2026:10:00:01 +0100] "GET / HTTP/1.1" 200 123

Zeile 1 -> IP Adresse
Zeile 7 -> /
Zeile 9 -> Statuscode 200


##Top 3 IPs (Command + 1 Satz)

awk '{print $1}' lab/text/access.log | sort | uniq -c | sort -nr | head -n 3

Liest die erste zelle aus den Logs, sortiert sie, entfernt dublikate, sortiert die neue Liste nach nummer ( unique c nummeriert die adressen nach Anzahl dublikaten) und dann liest die 3
mit den meisten dublikaten aus.

##Error-Rate (Command + Resultat)
```bash
 cherubim@LP  ~  Quereinstieg  main 
❯ total=$(wc -l < lab/text/access.log)
bad=$(awk '$9 ~ /^[45]/ {c++} END{print c+0}' lab/text/access.log)
echo "total=$total bad=$bad"
awk -v t="$total" -v b="$bad" 'BEGIN{ if(t==0) print "rate=0%"; else printf "rate=%.1f%%\n", (b/t)*100 }'
total=5 bad=3
rate=60.0%
```
- `total=$(wc -l < lab/text/access.log)` speichert die Anzahl Zeilen in access.log in `total`
- `bad=$(awk '$9 ~ /^[45]/ {c++} END{print c+0}' lab/text/access.log)` Speichert die Anzahl "schlechter Meldungen" (Statuscode 4xx oder 5xx) in `bad`
- `echo "total=$total bad=$bad"` Gibt die beiden Werte aus.
- `awk -v t="$total" -v b="$bad" 'BEGIN{ if(t==0) print "rate=0%"; else printf "rate=%.1f%%\n", (b/t)*100 }'` Printed das protzentuale Verhältnis von guter zu schlechter Meldung

##Mini-Tests

###Warum braucht uniq -c fast immer sort davor?

`uniq -c` vereint dublikate zu einem und zählt die Anzahl Dublikate in einen Count... darum `-c`. Dies funktioniert aber nur wenn die Dublikate nebeneinander stehen, also ist sort 
essentiell ausser die Liste ist bereits sortiert

###Was macht $9 ~ /^[45]/?

`$9`bedeutet in der 9 Zelle (awk). `~` zeigt den Anfang einer Regex Bedingung. `^` steht für den Anfang des Strings. `[45]` bedeuted, dass wir nach entweder 4 oder 5 suchen. 
Die Zeile matcht also Statuscode die mit 4 oder 5 beginnen.

###Wann würdest du awk -F: benutzen?

`-F` steht hierbei für Feldtrenner. Man kann mit dieser Option des Standart Feldtrenner von awk ändern. normalerweise ist das Leerschlag, aber mit `awk -F :` zum Beispiel kann man es zum
Doppelpunkt ändern.



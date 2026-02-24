## 1) Was macht die gesamte Pipeline?

```bash
awk '{print $1}' lab/text/access.log | sort | uniq -c | sort -nr | head -n 5
```

Typischer Zweck (bei Webserver-Logs): **Top-5 häufigste Werte aus Spalte 1** (oft die IP-Adresse).

### Schritt für Schritt (mit Zwischenergebnis-Idee)

1. **`awk '{print $1}' lab/text/access.log`**

   * Liest jede Zeile aus `access.log`
   * **druckt nur das 1. Feld** (standardmäßig getrennt durch Whitespace: Leerzeichen/Tabs)
     Ergebnis: eine Liste wie

   ```
   203.0.113.10
   203.0.113.10
   198.51.100.7
   ...
   ```

2. **`| sort`**

   * Sortiert die Ausgabe alphabetisch (lexikographisch).
   * Wichtig: `uniq` kann nur **aufeinanderfolgende** Duplikate zählen -> deshalb muss vorher sortiert werden.

3. **`| uniq -c`**

   * Gleiche direkt aufeinander folgende Zeilen werden zu einer gemaht, verhindert somit dublikate wenn man Sort davor ausführt.
   * `-c` schreibt davor, **wie oft** sie vorkamen:

   ```
   120 203.0.113.10
    55 198.51.100.7
   ...
   ```

4. **`| sort -nr`**

   * Sortiert diese “Count + Wert”-Zeilen nach Count:

     * `-n` = numerisch (sonst wäre “100” < “9” als Text)
     * `-r` = absteigend sortiert

5. **`| head -n 5`**

   * Zeigt die obersten 5 Zeilen

### Typische Stolperfallen

* `uniq` zählt nur aufeinander folgende Duplikate -> ohne `sort` davor wäre die Zählung falsch.
* `awk` trennt standardmäßig nach Whitespace. Wenn Spalte 1 nicht “IP” ist, ist das Ergebnis entsprechend anders.

---

## 2) Befehle 

### `awk`

**Mini-Sprache** zum Zeilen-/Feld-basierten Verarbeiten von Text.
Hier: Druckt Feld 1 jeder Zeile.

* `{print $1}` ist ein kleines AWK-Programm:

  * `{ ... }` = Aktion pro Zeile
  * `$1` = erstes Feld ( `$2` zweites, …, `$0` ganze Zeile)

---

### `sort`

Sortiert Zeilen.
Hier zweimal:

* zuerst, um gleiche Werte zusammenzubringen (für `uniq`)
* danach, um die Zählwerte numerisch absteigend zu sortieren

---

### `uniq`

Entfernt aufeinanderfolgende gleiche Zeilen und kann sie zählen.
Hier: zählt Häufigkeiten (`-c`).

---

### `head`

Gibt die ersten N Zeilen (oder Bytes) aus.
Hier: Top 5 ausgeben (`-n 5`).

---

## 3) Tabellen 

### Tabelle: `awk`

```md
| Befehl | Option | Bedeutung | Beispiel |
|---|---|---|---|
| `awk` | `-F <sep>` | Feldtrenner setzen (statt Whitespace). | `awk -F, '{print $2}' file.csv` |
| `awk` | `-v k=v` | Variable vor Programmlauf setzen. | `awk -v min=10 '$1>=min' data` |
| `awk` | `-f <file>` | AWK-Programm aus Datei laden. | `awk -f script.awk input.txt` |
| `awk` | `-e '<prog>'` | Programm-Text als Argument (bei vielen awks/gawk; nicht überall). | `awk -e '{print $1}' file` |
| `awk` | `--posix` | Strikter POSIX-Modus (v.a. gawk). | `awk --posix '{print $1}' file` |
| `awk` | `--version` | Version anzeigen (gawk/mawk). | `awk --version` |
| `awk` | `--help` | Hilfe anzeigen (nicht überall). | `awk --help` |
```

**Nützliche AWK-Konzepte :**

* `$0` ganze Zeile, `$1..$NF` Felder, `NF` = Anzahl Felder, `NR` = Zeilennummer
* Bedingungen: `awk '$1 ~ /ERROR/ {print}' file`
* BEGIN/END: `awk 'BEGIN{...} {..} END{...}' file`

---

### Tabelle: `sort`

```md
| Befehl | Option | Bedeutung | Beispiel |
|---|---|---|---|
| `sort` | `-n` | Numerisch sortieren (statt lexikographisch). | `sort -n numbers.txt` |
| `sort` | `-r` | Reihenfolge umkehren (absteigend). | `sort -r names.txt` |
| `sort` | `-k <m[,n]>` | Nach Schlüssel/Spalte sortieren (Felder). | `sort -k1,1 -k2,2n file` |
| `sort` | `-t <sep>` | Feldtrenner definieren (für `-k`). | `sort -t, -k2,2 file.csv` |
| `sort` | `-u` | Unique: Duplikate entfernen (nach Sortierkriterium). | `sort -u file` |
| `sort` | `-h` | “Human numbers” (1K, 2M …) sortieren. | `sort -h sizes.txt` |
| `sort` | `-V` | “Version sort” (1.9 < 1.10). | `sort -V versions.txt` |
| `sort` | `-f` | Groß-/Kleinschreibung ignorieren. | `sort -f names.txt` |
| `sort` | `-b` | Führende Leerzeichen ignorieren. | `sort -b file` |
| `sort` | `-M` | Nach Monatsnamen sortieren (Jan, Feb …). | `sort -M months.txt` |
| `sort` | `-o <file>` | Output direkt in Datei schreiben. | `sort -n in.txt -o out.txt` |
| `sort` | `--stable` | Stabil sortieren (gleiche Keys behalten Reihenfolge). | `sort --stable -k1,1 file` |
```

---

### Tabelle: `uniq`

```md
| Befehl | Option | Bedeutung | Beispiel |
|---|---|---|---|
| `uniq` | `-c` | Vorkommen zählen (Count vorne). | `uniq -c` |
| `uniq` | `-d` | Nur Zeilen ausgeben, die mehrfach vorkommen. | `uniq -d` |
| `uniq` | `-u` | Nur Zeilen ausgeben, die genau einmal vorkommen. | `uniq -u` |
| `uniq` | `-i` | Case-insensitive vergleichen. | `uniq -i` |
| `uniq` | `-f <N>` | Erste N Felder ignorieren (Whitespace-getrennt). | `uniq -f 1` |
| `uniq` | `-s <N>` | Erste N Zeichen ignorieren. | `uniq -s 10` |
| `uniq` | `-w <N>` | Nur die ersten N Zeichen vergleichen. | `uniq -w 8` |
| `uniq` | `--group` | Gruppiert Ausgabe (GNU; verschiedene Modi möglich). | `uniq --group` |
```

**Wichtig:** `uniq` wirkt nur auf **aufeinanderfolgende** gleiche Zeilen → fast immer vorher `sort` (oder du weißt sicher, dass es schon gruppiert ist).

---

### Tabelle: `head`

```md
| Befehl | Option | Bedeutung | Beispiel |
|---|---|---|---|
| `head` | `-n <N>` | Erste N Zeilen ausgeben (Standard: 10). | `head -n 5 file` |
| `head` | `-c <N>` | Erste N Bytes ausgeben. | `head -c 100 file` |
| `head` | `-q` | Header (Dateinamen) bei mehreren Dateien unterdrücken. | `head -q -n 3 a b` |
| `head` | `-v` | Header (Dateinamen) immer anzeigen. | `head -v -n 3 a b` |
| `head` | `-z` | Zeilen durch NUL getrennt (für `find -print0`, GNU). | `head -z -n 1 file0` |
```

---


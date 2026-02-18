| Syntax                 | Bedeutung                                                                  | Wann nutzen?                             | Mini-Beispiel                   |   |                  |
| ---------------------- | -------------------------------------------------------------------------- | ---------------------------------------- | ------------------------------- | - | ---------------- |
| `cmd1 ; cmd2`          | führe `cmd2` **immer** aus (egal ob `cmd1` klappt)                         | “mach danach weiter, egal was passiert”  | `echo hi; echo bye`             |   |                  |
| `cmd1 && cmd2`         | führe `cmd2` **nur aus, wenn** `cmd1` erfolgreich war (Exitcode 0)         | sichere Ketten (build nur wenn check ok) | `mkdir x && cd x`               |   |                  |
| `cmd1 \|\| cmd2`       | führe `cmd2` **nur aus, wenn** `cmd1` fehlschlägt                          | Fallback/Fehlerbehandlung                | `command -v foo                 |   | echo "nicht da"` |
| `cmd1 \| cmd2`         | **Pipe**: stdout von `cmd1` wird stdin von `cmd2`                          | Output weiterverarbeiten/filtern         | `ps aux \| grep ssh`            |   |                  |
| `cmd >out`             | stdout (fd1) in Datei                                                      | Output speichern                         | `ls > out.txt`                  |   |                  |
| `cmd 2>err`            | stderr (fd2) in Datei                                                      | Errors separat loggen                    | `ls nope 2> err.txt`            |   |                  |
| `cmd >out 2>&1`        | stdout in Datei, dann stderr **dorthin auch**                              | alles zusammen in Log                    | `cmd > all.log 2>&1`            |   |                  |
| `{ cmd1; cmd2; } >out` | **Gruppe** umleiten (beide Befehle teilen dasselbe redirect)               | mehrere Befehle zusammen loggen          | `{ echo a; echo b; } > out.txt` |   |                  |
| `( cmd1; cmd2 )`       | Subshell-Gruppe (eigene Shell, Änderungen an `cd`/Variablen bleiben nicht) | isoliert testen                          | `(cd /tmp; pwd)`                |   |                  |
Regex Teile:

| Regex   | Bedeutung                       | Beispiel                           |      |   |      |
| ------- | ------------------------------- | ---------------------------------- | ---- | - | ---- |
| `.`     | irgendein Zeichen               | `a.c` matcht `abc`, `a-c`          |      |   |      |
| `*`     | 0 oder mehr vom vorherigen      | `lo*l` matcht `ll`, `lol`, `loool` |      |   |      |
| `+`     | 1 oder mehr (nur mit `grep -E`) | `go+` matcht `goo`, `gooo`         |      |   |      |
| `?`     | 0 oder 1 (nur mit `grep -E`)    | `colou?r`                          |      |   |      |
| `^`     | Zeilenanfang                    | `^Error`                           |      |   |      |
| `$`     | Zeilenende                      | `done$`                            |      |   |      |
| `[...]` | ein Zeichen aus Menge           | `[0-9]`, `[abc]`                   |      |   |      |
| `(...)  | (...)`                          | Gruppe + ODER (nur mit `grep -E`)  | `^(1 | 2 | 3)$` |




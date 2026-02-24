nslookup google.com --> Schaut ob der DNS eine IP zurückgibt.

curl -v https://example.com --> curl ist ein Tool, um HTTP/HTTPS-Anfragen zu machen.   

-v steht für verbose.
Das bedeutet:

👉 Du bekommst detaillierte Ausgabe über den Verbindungsaufbau.

1️⃣ DNS-Auflösung (welche IP wird genutzt)
2️⃣ TCP-Verbindung
3️⃣ TLS-Handshake
4️⃣ HTTP-Request
5️⃣ HTTP-Response + Statuscode


ip a --> Zeigt die eigenen IP's an.

ss -tulnp --> ss steht für Socket statistic und zeigt dir offene Ports, aktive Verbindungen und welche Programme diese benutzen.

Option	Bedeutung
-t	TCP anzeigen
-u	UDP anzeigen
-l	Nur LISTEN-Sockets
-n	Numerisch (keine Namensauflösung)
-p	Prozess anzeigen (PID/Programm)

grep -> ist findstr in bash

top -> zeigt alle Prozesse, deren memory, CPU und PID an.

htop -> verbesserte version von Top, mit möglichkeit Prozesse zu Killen. Ist ebenfalls live

systemctl list-units --type=service -->zeigt nur geladene Service-Units, die aktuell aktiv oder zumindest bekannt (geladen) sind – aber nicht alle installierten Services.

Was genau wird angezeigt?

Der Befehl zeigt:

- aktive (active)

- laufende (running)

- wartende (waiting)

- fehlgeschlagene (failed)

- kürzlich gestoppte, aber noch geladene Services

Also: alle aktuell im Speicher geladenen Service-Units.


Service starten / Stoppen:

| Befehl                        | Wirkung                             |
| ----------------------------- | ----------------------------------- |
| `systemctl start <service>`   | Service starten                     |
| `systemctl stop <service>`    | Service stoppen                     |
| `systemctl restart <service>` | Neustarten                          |
| `systemctl reload <service>`  | Konfiguration neu laden (ohne Stop) |
| `systemctl status <service>`  | Status anzeigen                     |

Logs anzeigen:

| Befehl                  | Bedeutung                  |
| ----------------------- | -------------------------- |
| `journalctl`            | Alle Logs                  |
| `journalctl -xe`        | Neueste Logs + Fehlerinfos |
| `journalctl -u service` | Logs eines Services        |
| `journalctl -f`         | Live-Logs                  |
| `journalctl -b`         | Aktueller Boot             |
| `journalctl -p err`     | Nur Fehler                 |
| `journalctl -n 50`      | Letzte 50 Einträge         |


Prozesse anzeigen:

| Befehl                | Bedeutung                           | Wann benutzen?                 |
| --------------------- | ----------------------------------- | ------------------------------ |
| `ps`                  | Zeigt Prozesse der aktuellen Shell  | Schnell prüfen, was hier läuft |
| `ps -e`               | Alle Prozesse anzeigen              | Gesamtüberblick                |
| `ps -ef`              | Alle Prozesse (Full-Format)         | Detailanalyse                  |
| `ps aux`              | Alle Prozesse (BSD-Format)          | Sehr häufig verwendet          |
| `ps -u <user>`        | Prozesse eines bestimmten Users     | Benutzeranalyse                |
| `ps -p <PID>`         | Infos zu bestimmter PID             | Einzelprozess prüfen           |
| `ps -C <name>`        | Prozesse mit bestimmtem Namen       | Programmsuche                  |
| `ps -e --forest`      | Baumdarstellung (Prozesshierarchie) | Eltern-/Kindprozesse sehen     |
| `ps -o pid,ppid,cmd`  | Eigene Spalten definieren           | Gezielte Infos anzeigen        |
| `ps aux --sort=-%cpu` | Nach CPU-Nutzung sortieren          | Lastanalyse                    |


Python Server starten:

| Befehl                                     | Python-Version | Bedeutung                         | Wann benutzen?           |
| ------------------------------------------ | -------------- | --------------------------------- | ------------------------ |
| `python3 -m http.server`                   | Python 3       | Startet HTTP-Server auf Port 8000 | Standard-Test            |
| `python3 -m http.server 8080`              | Python 3       | Startet Server auf Port 8080      | Anderen Port nutzen      |
| `python -m SimpleHTTPServer`               | Python 2       | Startet HTTP-Server auf Port 8000 | Alte Systeme             |
| `python3 -m http.server --bind 127.0.0.1`  | Python 3       | Nur lokal erreichbar              | Sicherheitstest          |
| `python3 -m http.server --directory /pfad` | Python 3       | Bestimmtes Verzeichnis freigeben  | Anderes Root-Verzeichnis |


Ordnerstruktur durchsuchen:

| Teil               | Bedeutung                                           | Beispiel         |
| ------------------ | --------------------------------------------------- | ---------------- |
| `find <pfad>`      | Startpunkt der Suche                                | `find ~/lab/fs`  |
| `-name 'PATTERN'`  | Dateiname matcht (Shell-Pattern)                    | `-name '*.conf'` |
| `-iname 'PATTERN'` | wie `-name`, aber case-insensitive                  | `-iname '*.TXT'` |
| `-type f`          | nur Dateien                                         | `-type f`        |
| `-type d`          | nur Ordner                                          | `-type d`        |
| `-maxdepth N`      | **maximale** Tiefe ab Startpunkt (0=nur Startpunkt) | `-maxdepth 2`    |
| `-mindepth N`      | minimale Tiefe (z.B. 1=ohne Startpunkt)             | `-mindepth 1`    |
| `-print`           | Ausgabe (Standard, kann man weglassen)              | `-print`         |

Wichtige Ergänzung zum durchsuchen:

|          Wert | Was wird durchsucht? (Startpunkt = Tiefe 0) |
| ------------: | ------------------------------------------- |
| `-maxdepth 0` | nur der Startordner selbst                  |
| `-maxdepth 1` | Startordner + direkte Einträge darin        |
| `-maxdepth 2` | + eine Ebene tiefer (Enkel)                 |
| `-maxdepth 3` | + noch eine Ebene tiefer                    |


Concatenate Befehl:

| Command           | Zweck                                   | Häufige Optionen                                                                       | Beispiele                                          |
| ----------------- | --------------------------------------- | -------------------------------------------------------------------------------------- | -------------------------------------------------- |
| `cat FILE`        | Datei komplett ausgeben                 | `-n` Zeilen nummerieren, `-A` Steuerzeichen sichtbar, `-s` leere Zeilen zusammenfassen | `cat sample.txt` · `cat -n sample.txt`             |
| `cat FILE1 FILE2` | Dateien hintereinander ausgeben         | —                                                                                      | `cat a.txt b.txt`                                  |
| `cat > FILE`      | stdin in Datei schreiben (überschreibt) | —                                                                                      | `cat > notes.txt` (dann tippen, Ende mit `Ctrl+D`) |
| `cat >> FILE`     | stdin an Datei anhängen                 | —                                                                                      | `cat >> notes.txt`                                 |
Cat + Here - Doc (Skribte schreiben):

| Muster                                     | Was macht’s?                                                         | Wann nutzen?                                                  | Beispiel                   |
| ------------------------------------------ | -------------------------------------------------------------------- | ------------------------------------------------------------- | -------------------------- |
| `cat > file <<EOF ... EOF`                 | schreibt Block in Datei (**überschreibt**)                           | neue Datei/neu erzeugen                                       | `cat > hello.sh <<EOF` …   |
| `cat >> file <<EOF ... EOF`                | hängt Block an Datei an (**append**)                                 | Config erweitern                                              | `cat >> ~/.bashrc <<EOF` … |
| `<<'EOF'` (quoted)                         | **keine Expansion** im Block (`$VAR`, `$(cmd)`, `\` bleiben literal) | wenn du Variablen/`$(...)` **im Script stehen lassen** willst | `cat > s.sh <<'EOF'`       |
| `<<EOF` (unquoted)                         | Expansion **passiert beim Schreiben**                                | wenn du Werte **jetzt einfügen** willst (Template)            | `cat > file <<EOF`         |
| `<<-EOF`                                   | erlaubt Einrückung mit **Tabs** (Tabs werden entfernt)               | sauber eingerückte Here-Docs im Code                          | `cat <<-EOF`               |
| `cat > file <<EOF` + `#!/usr/bin/env bash` | erzeugt ausführbares Script (mit Shebang)                            | Bash-Skripte                                                  | siehe unten                |
| `chmod +x file`                            | Script ausführbar machen                                             | immer nach Script-Erzeugung                                   | `chmod +x ~/bin/hello`     |

Word count Befehl:

| Command      | Zweck                        | Optionen                                           | Beispiele          |     |        |
| ------------ | ---------------------------- | -------------------------------------------------- | ------------------ | --- | ------ |
| `wc FILE`    | Zeilen, Wörter, Bytes zählen | `-l` Zeilen, `-w` Wörter, `-c` Bytes, `-m` Zeichen | `wc sample.txt`    |     |        |
| `wc -l FILE` | nur Zeilen zählen            | `-l`                                               | `wc -l sample.txt` |     |        |
| `wc -w FILE` | nur Wörter zählen            | `-w`                                               | `wc -w sample.txt` |     |        |
| `wc -c FILE` | Bytes zählen                 | `-c`                                               | `wc -c sample.txt` |     |        |
| `cmd         | wc -l`                       | wie viele Zeilen Output                            | `-l`               | `ls | wc -l` |


echo:

| Command             | Zweck                               | Optionen/Notizen                     | Beispiele                |
| ------------------- | ----------------------------------- | ------------------------------------ | ------------------------ |
| `echo TEXT`         | Text ausgeben                       | default: am Ende newline             | `echo hello`             |
| `echo -n TEXT`      | ohne abschließenden newline         | `-n`                                 | `echo -n "prompt: "`     |
| `echo -e "a\nb"`    | Escapes interpretieren (`\n`, `\t`) | `-e` (Bash), nicht überall identisch | `echo -e "line1\nline2"` |
| `echo TEXT > FILE`  | in Datei schreiben (überschreibt)   | `>` überschreibt                     | `echo hi > file.txt`     |
| `echo TEXT >> FILE` | an Datei anhängen                   | `>>` hängt an                        | `echo more >> file.txt`  |


Head:

| Command          | Zweck           | Optionen              | Beispiele               |         |       |
| ---------------- | --------------- | --------------------- | ----------------------- | ------- | ----- |
| `head FILE`      | erste 10 Zeilen | —                     | `head sample.txt`       |         |       |
| `head -n N FILE` | erste N Zeilen  | `-n`                  | `head -n 2 sample.txt`  |         |       |
| `head -c N FILE` | erste N Bytes   | `-c`                  | `head -c 20 sample.txt` |         |       |
| `cmd             | head`           | nur Anfang vom Output | —                       | `ps aux | head` |

tail:

| Command          | Zweck                                  | Optionen   | Beispiele                 |
| ---------------- | -------------------------------------- | ---------- | ------------------------- |
| `tail FILE`      | letzte 10 Zeilen                       | —          | `tail sample.txt`         |
| `tail -n N FILE` | letzte N Zeilen                        | `-n`       | `tail -n 2 sample.txt`    |
| `tail -c N FILE` | letzte N Bytes                         | `-c`       | `tail -c 50 sample.txt`   |
| `tail -f FILE`   | Datei live “mitlesen” (Log-Streaming)  | `-f`       | `tail -f /var/log/syslog` |
| `tail -F FILE`   | wie `-f`, aber robust bei Log-Rotation | `-F` (GNU) | `tail -F app.log`         |


Links erstellen (ln):

| Command            | Zweck                                                   | Wichtige Optionen                                             | Beispiel                        |
| ------------------ | ------------------------------------------------------- | ------------------------------------------------------------- | ------------------------------- |
| `ln SRC DEST`      | **Hardlink** erstellen (2. Name → gleiche Inode)        | `-f` überschreibt Ziel, `-n` (bei Symlink-Ziel), `-v` verbose | `ln a.txt a.hard`               |
| `ln -s SRC DEST`   | **Symlink/Softlink** erstellen (Pfad-Verknüpfung)       | `-s` symlink, `-f` überschreibt Ziel, `-v` verbose            | `ln -s a.txt a.soft`            |
| `ln -sfn SRC DEST` | Symlink **erzwingen/ersetzen** (häufig bei Deployments) | `-s` symlink, `-f` force, `-n` treat dest as file             | `ln -sfn /opt/app/v2 current`   |
| `ln SRC DIR/`      | Hardlink in ein Verzeichnis legen (Name bleibt gleich)  | —                                                             | `ln a.txt ~/backup/`            |
| `ln -s SRC DIR/`   | Symlink in ein Verzeichnis legen                        | —                                                             | `ln -s /var/log/syslog ~/logs/` |


AUFLISTEN (ls):

| Command   | Zweck                                       | Wichtige Optionen | Beispiel           |
| --------- | ------------------------------------------- | ----------------- | ------------------ |
| `ls`      | Dateien/Ordner im aktuellen Verzeichnis     | —                 | `ls`               |
| `ls PATH` | Inhalt eines Pfads anzeigen                 | —                 | `ls ~/lab/fs/a`    |
| `ls -l`   | Long Listing (Rechte, Owner, Größe, Zeit)   | `-l`              | `ls -l`            |
| `ls -a`   | auch versteckte Dateien (`.` Dateien)       | `-a`              | `ls -a`            |
| `ls -la`  | long + hidden                               | `-l -a`           | `ls -la`           |
| `ls -h`   | “human readable” Größen (nur mit `-l`)      | `-h`              | `ls -lh`           |
| `ls -t`   | nach Zeit sortieren (neueste zuerst)        | `-t`              | `ls -lt`           |
| `ls -r`   | Sortierreihenfolge umdrehen                 | `-r`              | `ls -ltr`          |
| `ls -R`   | rekursiv (Unterordner mitlisten)            | `-R`              | `ls -R ~/lab/fs`   |
| `ls -i`   | Inode-Nummern anzeigen                      | `-i`              | `ls -i sample.txt` |
| `ls -li`  | Inode + Long Listing (zeigt auch Linkcount) | `-l -i`           | `ls -li sample.*`  |

Stat:

stat zeigt dir detaillierte Metadaten zu einer Datei/einem Ordner – also alles, was über ls -l hinausgeht: Größe in Bytes, Inode, Device, genaue Rechte (numerisch & symbolisch), Linkcount, Besitzer/Gruppe, und die Zeitstempel atime/mtime/ctime.

| Befehl                 | Zweck                                    | Beispiel                              |
| ---------------------- | ---------------------------------------- | ------------------------------------- |
| `stat FILE`            | Vollständige Metadaten anzeigen          | `stat secret.txt`                     |
| `stat DIR`             | Metadaten eines Ordners anzeigen         | `stat ~/lab/perms`                    |
| `stat -c FORMAT FILE`  | **Custom Output** (nur bestimmte Felder) | `stat -c "%a %U:%G %s %n" secret.txt` |
| `stat -c "%a" FILE`    | Rechte **numerisch** (chmod-Style)       | `stat -c "%a" secret.txt`             |
| `stat -c "%A" FILE`    | Rechte **symbolisch** (`-rw-r--r--`)     | `stat -c "%A" secret.txt`             |
| `stat -c "%U %G" FILE` | Owner / Group                            | `stat -c "%U %G" secret.txt`          |
| `stat -c "%s" FILE`    | Größe in Bytes                           | `stat -c "%s" secret.txt`             |
| `stat -c "%i" FILE`    | Inode-Nummer                             | `stat -c "%i" secret.txt`             |
| `stat -c "%h" FILE`    | Hardlink-Count                           | `stat -c "%h" secret.txt`             |
| `stat -c "%y" FILE`    | mtime (letzte Inhaltsänderung)           | `stat -c "%y" secret.txt`             |
| `stat -c "%x" FILE`    | atime (letzter Zugriff/Lesen)            | `stat -c "%x" secret.txt`             |
| `stat -c "%z" FILE`    | ctime (Metadatenänderung)                | `stat -c "%z" secret.txt`             |

Change mod:

| Befehl                 | Effekt                                                             | Beispiel                   |
| ---------------------- | ------------------------------------------------------------------ | -------------------------- |
| `chmod u+x FILE`       | Owner bekommt execute dazu                                         | `chmod u+x script.sh`      |
| `chmod u-x FILE`       | Owner verliert execute                                             | `chmod u-x script.sh`      |
| `chmod g+w FILE`       | Gruppe darf schreiben                                              | `chmod g+w secret.txt`     |
| `chmod o-r FILE`       | Others dürfen nicht lesen                                          | `chmod o-r secret.txt`     |
| `chmod a+r FILE`       | alle dürfen lesen                                                  | `chmod a+r notes.txt`      |
| `chmod u=rw,go=r FILE` | Rechte exakt setzen                                                | `chmod u=rw,go=r file.txt` |
| `chmod -R g+rX DIR`    | rekursiv; `X` = x nur für Ordner (und bereits ausführbare Dateien) | `chmod -R g+rX shared/`    |

Numerische schreibweise:

| Zahl | Bedeutung     | Beispiel |
| ---: | ------------- | -------- |
|  `7` | `rwx` (4+2+1) | —        |
|  `6` | `rw-` (4+2)   | —        |
|  `5` | `r-x` (4+1)   | —        |
|  `4` | `r--`         | —        |
|  `0` | `---`         | —        |

| Command               | Effekt      | Typisch für                |
| --------------------- | ----------- | -------------------------- |
| `chmod 644 FILE`      | `rw-r--r--` | normale Textdatei          |
| `chmod 600 FILE`      | `rw-------` | private Secrets/Keys       |
| `chmod 755 DIR`       | `rwxr-xr-x` | Ordner/öffentliche Scripts |
| `chmod 700 DIR`       | `rwx------` | private Ordner             |
| `chmod 755 script.sh` | `rwxr-xr-x` | ausführbares Script        |

unmask:

umask (user file-creation mode mask) bestimmt, welche Rechte beim Erstellen neuer Dateien und Ordner standardmäßig weggenommen werden.

Wichtig: umask setzt nicht direkt “die Default-Rechte”, sondern ist eine Maske, die Bits abzieht.

Grundprinzip

- Neue Dateien starten typischerweise mit Basis 666 (rw-rw-rw-)
  (ohne execute, weil Dateien nicht automatisch ausführbar sein sollen)

- Neue Ordner starten typischerweise mit Basis 777 (rwxrwxrwx)

Dann gilt:

- effektive Rechte = Basisrechte AND (NOT umask)
  (praktisch: “umask-Bits werden entfernt”)

Beispiel

Wenn umask = 022:

- Datei: 666 - 022 → 644 = rw-r--r--

- Ordner: 777 - 022 → 755 = rwxr-xr-x

| Befehl      | Zweck                               | Beispiel / Output                  |
| ----------- | ----------------------------------- | ---------------------------------- |
| `umask`     | aktuelle Maske anzeigen (oft oktal) | `0022` oder `022`                  |
| `umask -S`  | symbolisch anzeigen                 | `u=rwx,g=rx,o=rx` (je nach System) |
| `umask 077` | Maske setzen (für aktuelle Shell)   | sorgt für private Defaults         |
| `umask 027` | “group ok, others restriktiv”       | oft in Teams/Servern               |


| umask | Neue Datei | Neuer Ordner | Meaning                           |
| ----: | ---------: | -----------: | --------------------------------- |
| `022` |      `644` |        `755` | others nur lesen/ausführen        |
| `077` |      `600` |        `700` | nur du (sehr privat)              |
| `002` |      `664` |        `775` | group darf schreiben (Team-Setup) |

owner/ group ändern:

| Command                  | Zweck                                          | Syntax                      | Beispiel                                | Effekt                                      |
| ------------------------ | ---------------------------------------------- | --------------------------- | --------------------------------------- | ------------------------------------------- |
| `chown`                  | Besitzer (Owner) ändern (optional auch Gruppe) | `chown OWNER FILE`          | `sudo chown root secret.txt`            | Owner wird `root`, Group bleibt wie sie ist |
| `chown OWNER:GROUP FILE` | Owner **und** Group ändern                     | `chown OWNER:GROUP FILE`    | `sudo chown root:root secret.txt`       | Owner+Group werden `root:root`              |
| `chown :GROUP FILE`      | nur Group ändern (Owner bleibt)                | `chown :GROUP FILE`         | `sudo chown :root secret.txt`           | nur Group wird `root`                       |
| `chown -R ... DIR`       | rekursiv (VORSICHT)                            | `chown -R OWNER:GROUP DIR/` | `sudo chown -R $USER:$USER ~/lab/perms` | ändert alles darunter                       |

nur group ändern:


| Command            | Zweck                             | Syntax                | Beispiel                          | Effekt                          |
| ------------------ | --------------------------------- | --------------------- | --------------------------------- | ------------------------------- |
| `chgrp`            | Gruppe einer Datei/Ordners ändern | `chgrp GROUP FILE`    | `sudo chgrp root secret.txt`      | Group wird `root`, Owner bleibt |
| `chgrp -R ... DIR` | rekursiv (VORSICHT)               | `chgrp -R GROUP DIR/` | `sudo chgrp -R devs ~/lab/shared` | ändert Group für alles darunter |


User und Groubs Befehltabelle:

| Befehl               | Was zeigt es?                          | Typischer Use-Case                            | Beispiel                            |
| -------------------- | -------------------------------------- | --------------------------------------------- | ----------------------------------- |
| `whoami`             | aktueller Username                     | “Als wer bin ich gerade?”                     | `whoami`                            |
| `id`                 | UID/GID + Gruppen (Namen & IDs)        | Debug bei Permission-Problemen                | `id` · `id -u` · `id -g` · `id -Gn` |
| `groups`             | Gruppennamen des Users                 | schnell checken ob z.B. `sudo`, `docker`      | `groups` · `groups lukas`           |
| `getent passwd USER` | User-Eintrag aus NSS (lokal/LDAP etc.) | zuverlässiger als nur `/etc/passwd`           | `getent passwd $USER`               |
| `getent group GROUP` | Gruppen-Eintrag aus NSS                | Gruppen-Member prüfen                         | `getent group sudo`                 |
| `who`                | eingeloggte User (Sessions)            | Multiuser-Systeme/SSH                         | `who`                               |
| `w`                  | wie `who` + was sie tun                | sehen wer gerade was ausführt                 | `w`                                 |
| `users`              | nur Usernamen der eingeloggten User    | sehr kurz                                     | `users`                             |
| `last`               | Login-Historie                         | “Wer war wann drauf?”                         | `last`                              |
| `sudo -l`            | welche sudo-Rechte du hast             | warum klappt sudo / was darf ich              | `sudo -l`                           |
| `passwd -S USER`     | Passwort-Status (gesperrt/aktiv)       | Account-Status prüfen (root nötig für andere) | `passwd -S $USER`                   |
| `su - USER`          | User wechseln (Login-Shell)            | testen wie Rechte als anderer User sind       | `sudo su - root` (vorsichtig)       |

User & Group Management:

| Befehl               | Zweck                                               | Wichtigste Optionen/Notizen                                  | Beispiel                               |
| -------------------- | --------------------------------------------------- | ------------------------------------------------------------ | -------------------------------------- |
| `adduser USER`       | User anlegen (komfortabel, erstellt Home, fragt PW) | Debian/Ubuntu “friendly wrapper”                             | `sudo adduser labuser`                 |
| `useradd USER`       | User anlegen (low-level, wenig Defaults)            | oft brauchst du Flags wie `-m`                               | `sudo useradd -m -s /bin/bash labuser` |
| `usermod`            | bestehenden User ändern                             | `-aG` Gruppen anhängen (sehr wichtig), `-s` Shell, `-d` Home | `sudo usermod -aG labgroup labuser`    |
| `userdel USER`       | User löschen                                        | `-r` löscht Home + Mailspool                                 | `sudo userdel -r labuser`              |
| `passwd USER`        | Passwort setzen/ändern                              | `-l` lock, `-u` unlock, `-S` Status                          | `sudo passwd labuser`                  |
| `groupadd GROUP`     | Gruppe anlegen                                      | `-g` GID setzen (optional)                                   | `sudo groupadd labgroup`               |
| `groupmod GROUP`     | Gruppe ändern                                       | `-n` rename, `-g` GID ändern                                 | `sudo groupmod -n newgroup labgroup`   |
| `groupdel GROUP`     | Gruppe löschen                                      | geht nur, wenn sie nicht gebraucht wird                      | `sudo groupdel labgroup`               |
| `gpasswd`            | Gruppen-Mitglieder verwalten                        | `-a` add user, `-d` del user, `-M` members setzen            | `sudo gpasswd -a labuser labgroup`     |
| `newgrp GROUP`       | neue Shell mit anderer **Primary Group**            | praktisch zum Testen ohne Logout                             | `newgrp labgroup`                      |
| `id USER`            | UID/GID + Gruppen anzeigen                          | `-Gn` nur Gruppennamen                                       | `id labuser`                           |
| `groups USER`        | Gruppennamen anzeigen                               | schnell/kurz                                                 | `groups labuser`                       |
| `getent passwd USER` | User-Eintrag aus NSS (lokal/LDAP)                   | robuster als direkt Files lesen                              | `getent passwd labuser`                |
| `getent group GROUP` | Group-Eintrag aus NSS                               | zeigt GID + Members                                          | `getent group labgroup`                |
| `deluser USER GROUP` | User aus Gruppe entfernen (Debian/Ubuntu)           | bequemer Wrapper                                             | `sudo deluser labuser labgroup`        |


Which und type:

| Befehl      | Was macht er?                                                         |                 Erkennt Aliases/Functions/Builtins? | Typische Ausgabe                             | Wann benutzen?                                               |
| ----------- | --------------------------------------------------------------------- | --------------------------------------------------: | -------------------------------------------- | ------------------------------------------------------------ |
| `which CMD` | sucht **im `$PATH`** nach dem ausführbaren Programm                   | meistens **nein** (fokussiert auf PATH-Executables) | `/usr/bin/ls`                                | “Welches Binary wird im PATH gefunden?”                      |
| `type CMD`  | Shell-intern: zeigt, **was CMD ist** (Alias, Function, Builtin, File) |                                              **ja** | `ls is aliased to ...` / `ls is /usr/bin/ls` | Debugging: “Warum ruft `ls` etwas anderes auf als erwartet?” |

| Befehl         | Zweck                                                    | Beispiel          |
| -------------- | -------------------------------------------------------- | ----------------- |
| `which -a CMD` | alle Treffer im PATH anzeigen                            | `which -a python` |
| `type -a CMD`  | alle Stellen zeigen (Alias/Function + alle PATH-Treffer) | `type -a python`  |


command Befehl:

| Befehl                  | Zweck                                                      | Was kommt raus?               | Typischer Use-Case                            |
| ----------------------- | ---------------------------------------------------------- | ----------------------------- | --------------------------------------------- |
| `command -v CMD`        | zeigt, **was die Shell für CMD ausführen würde**           | Pfad oder Name (bei Builtins) | Debug bei “command not found”, PATH-Problemen |
| `command -V CMD`        | ausführlich: **Art** von CMD (alias/function/builtin/file) | Textbeschreibung              | “Warum ist `ls` anders?” (alias vs binary)    |
| `command CMD [args]`    | erzwingt Ausführung als **Command**, ignoriert Aliases     | Output des Commands           | wenn ein Alias stört: `command ls`            |
| `command -- CMD [args]` | wie oben, aber beendet Options-Parsing                     | —                             | sicher, falls CMD mit `-` anfängt (selten)    |

Durchsuchen von Prozessen:

| Befehl               | Zweck                                               | Beispiel                    | Ergebnis                          |
| -------------------- | --------------------------------------------------- | --------------------------- | --------------------------------- |
| `pgrep NAME`         | PIDs von Prozessen, deren Name matcht               | `pgrep sshd`                | z.B. `123 456`                    |
| `pgrep -a NAME`      | PID + komplette Commandline                         | `pgrep -a python`           | `123 python app.py`               |
| `pgrep -l NAME`      | PID + Prozessname                                   | `pgrep -l sshd`             | `123 sshd`                        |
| `pgrep -f PATTERN`   | matcht gegen **ganze Commandline** (nicht nur Name) | `pgrep -af 'uvicorn.*8000'` | findet z.B. uvicorn auf Port 8000 |
| `pgrep -u USER NAME` | nur Prozesse eines Users                            | `pgrep -u $USER -a code`    | nur deine `code` Prozesse         |
| `pgrep -n NAME`      | **neuester** (latest) match                         | `pgrep -n python`           | eine PID                          |
| `pgrep -o NAME`      | **ältester** (oldest) match                         | `pgrep -o python`           | eine PID                          |
| `pgrep -c NAME`      | nur **Anzahl** Treffer                              | `pgrep -c sshd`             | z.B. `1`                          |
| `pgrep -x NAME`      | exakter Name (kein Teilmatch)                       | `pgrep -x bash`             | nur “bash”                        |
| `pgrep -i NAME`      | case-insensitive                                    | `pgrep -i NGINX`            | findet `nginx`                    |



awk Befehl (awk liest die Datei zeilenweise mit einer Standarttrennung: Leerzeichen + tabs):

| Muster                                                             | Zweck                     | Beispiel                                                | Ergebnis/Notiz                             |
| ------------------------------------------------------------------ | ------------------------- | ------------------------------------------------------- | ------------------------------------------ |
| `awk '{print $1}' file`                                            | 1. Feld ausgeben          | `awk '{print $1}' app.log`                              | Standard: Felder durch Whitespace getrennt |
| `awk '{print $3}' file`                                            | 3. Feld ausgeben          | `awk '{print $3}' app.log`                              | wie in deinem Beispiel                     |
| `awk '{print $1, $3}' file`                                        | mehrere Felder            | `awk '{print $1, $3}' app.log`                          | trennt standardmäßig mit Leerzeichen       |
| `awk -F',' '{print $3}' file.csv`                                  | Feldtrenner setzen        | `awk -F',' '{print $3}' data.csv`                       | für CSV, `-F` = separator                  |
| `awk -F'[: ]+' '{print $2}'`                                       | Regex als Trenner         | `awk -F'[: ]+' '{print $2}' file`                       | trennt an `:` **oder** Spaces              |
| `awk 'NR==1{print; exit}' file`                                    | erste Zeile               | `awk 'NR==1{print; exit}' app.log`                      | `NR` = Zeilennummer                        |
| `awk 'NR<=5{print}' file`                                          | erste 5 Zeilen            | `awk 'NR<=5' app.log`                                   | `print` ist default                        |
| `awk '/ERROR/ {print $0}' file`                                    | Zeilen matchen (wie grep) | `awk '/ERROR/' app.log`                                 | `$0` = ganze Zeile                         |
| `awk '$2=="ERROR"{print}' file`                                    | nach Feld filtern         | `awk '$2=="ERROR"' app.log`                             | z.B. Log-Level in Spalte 2                 |
| `awk '{count[$3]++} END{for (k in count) print count[k], k}' file` | zählen (Histogramm)       | `awk '{c[$3]++} END{for(k in c) print c[k],k}' app.log` | oft mit `sort -nr` kombiniert              |
| `awk '{sum+=$5} END{print sum}' file`                              | Summe über Feld           | `awk '{sum+=$5} END{print sum}' data.txt`               | Feld muss numerisch sein                   |
| `awk '{print NR ":" $0}' file`                                     | Zeilennummern anzeigen    | `awk '{print NR ":" $0}' app.log`                       | ähnlich `grep -n`                          |
| `awk 'BEGIN{OFS="\t"} {print $1,$2}' file`                         | Output separator setzen   | `awk 'BEGIN{OFS="\t"} {print $1,$2}' file`              | `OFS` = Output Field Separator             |
curl:


| Befehl | Option | Bedeutung | Beispiel |
|---|---|---|---|
| `curl` | `-X <METHOD>` | HTTP-Methode festlegen (GET/POST/PUT/DELETE…). Meist unnötig bei GET/POST, aber wichtig für z.B. PUT/DELETE. | `curl -X DELETE https://api.example.com/items/1` |
| `curl` | `-I` | Nur Response-Header abrufen (HEAD-Request bzw. Header-only). | `curl -I https://example.com` |
| `curl` | `-i` | Response-Header **mit** Body ausgeben. | `curl -i https://example.com` |
| `curl` | `-v` | Verbose: detaillierte Debug-Ausgabe (Request/Handshake/Redirects). | `curl -v https://example.com` |
| `curl` | `--trace <file>` | Sehr detailliertes Trace in Datei (Debug). | `curl --trace trace.txt https://example.com` |
| `curl` | `--trace-ascii <file>` | Trace als lesbarer ASCII-Output. | `curl --trace-ascii trace.txt https://example.com` |
| `curl` | `-s` | Silent: keine Progress-Bar/Fehlertexte (Fehlercodes bleiben!). | `curl -s https://example.com` |
| `curl` | `-S` | Mit `-s`: trotzdem Fehler ausgeben. | `curl -sS https://example.com` |
| `curl` | `-f` | Fail on HTTP errors: bei 4xx/5xx Exit-Code ≠ 0 und kein HTML-Error-Body. | `curl -f https://example.com/notfound` |
| `curl` | `-L` | Redirects folgen (Location:). | `curl -L http://example.com` |
| `curl` | `--max-redirs <N>` | Max. Redirect-Anzahl begrenzen. | `curl -L --max-redirs 5 http://example.com` |
| `curl` | `-m, --max-time <sec>` | Gesamtes Timeout (Sekunden). | `curl -m 3 https://example.com` |
| `curl` | `--connect-timeout <sec>` | Timeout nur fürs Verbindungsaufbauen. | `curl --connect-timeout 2 https://example.com` |
| `curl` | `--retry <N>` | Bei transienten Fehlern retry. | `curl --retry 3 https://example.com` |
| `curl` | `--retry-delay <sec>` | Pause zwischen Retries. | `curl --retry 5 --retry-delay 1 https://example.com` |
| `curl` | `--retry-all-errors` | Retries auch bei mehr Fehlerarten (vorsichtig). | `curl --retry 3 --retry-all-errors https://example.com` |
| `curl` | `-o <file>` | Output in Datei schreiben (statt stdout). | `curl -o page.html https://example.com` |
| `curl` | `-O` | Datei unter Remote-Name speichern (aus URL). | `curl -O https://example.com/file.zip` |
| `curl` | `-J` | Mit `-O`: Content-Disposition Filename verwenden. | `curl -OJ https://example.com/download` |
| `curl` | `-C -` | Download fortsetzen (Resume). | `curl -C - -O https://example.com/big.iso` |
| `curl` | `--compressed` | Komprimierte Responses akzeptieren (gzip/br) und automatisch dekomprimieren. | `curl --compressed https://example.com` |
| `curl` | `-H "K: V"` | Header setzen (beliebig viele). | `curl -H "Accept: application/json" https://api.example.com` |
| `curl` | `-A "<ua>"` | User-Agent setzen. | `curl -A "MyTool/1.0" https://example.com` |
| `curl` | `-e, --referer <url>` | Referer-Header setzen. | `curl -e https://google.com https://example.com` |
| `curl` | `-u user:pass` | Basic Auth (Achtung: History/Logs). | `curl -u alice:secret https://api.example.com` |
| `curl` | `-H "Authorization: Bearer <t>"` | Token/Bearer Auth via Header. | `curl -H "Authorization: Bearer $TOKEN" https://api.example.com/me` |
| `curl` | `-d "<data>"` | POST-Body senden (setzt oft POST). Form-URL-encoded. | `curl -d "a=1&b=2" https://example.com/form` |
| `curl` | `--data-raw "<data>"` | Wie `-d`, aber ohne Spezialbehandlung von `@`. | `curl --data-raw '{"x":1}' https://api.example.com` |
| `curl` | `--data-urlencode "<k=v>"` | URL-encoding korrekt durchführen. | `curl --data-urlencode "q=hello world" https://example.com/search` |
| `curl` | `-F "<k=v>"` | Multipart/Form-Data (Datei-Upload etc.). | `curl -F "file=@img.png" https://example.com/upload` |
| `curl` | `-G` | `-d` Daten als Query-String an URL hängen (GET mit Params). | `curl -G -d "q=test" https://example.com/search` |
| `curl` | `--json '<json>'` | JSON senden (setzt Header + POST). | `curl --json '{"a":1}' https://api.example.com/items` |
| `curl` | `-T <file>` | Datei “hochladen” (PUT/Transfer). | `curl -T file.txt https://example.com/put-here` |
| `curl` | `-b <cookie>` | Cookies mitsenden (String oder Datei). | `curl -b "sid=abc" https://example.com` |
| `curl` | `-c <file>` | Cookies aus Response in Datei speichern. | `curl -c cookies.txt https://example.com` |
| `curl` | `--cookie-jar <file>` | Cookie-Jar schreiben (ähnlich `-c`). | `curl --cookie-jar cookies.txt https://example.com` |
| `curl` | `-k, --insecure` | TLS-Zertifikat nicht prüfen (nur Debug!). | `curl -k https://self-signed.local` |
| `curl` | `--cacert <file>` | Eigene CA-Datei zum Verifizieren. | `curl --cacert ca.pem https://internal.local` |
| `curl` | `--cert <file>` | Client-Zertifikat (mTLS). | `curl --cert client.pem https://mtls.local` |
| `curl` | `--key <file>` | Private Key fürs Client-Zertifikat. | `curl --cert client.pem --key client.key https://mtls.local` |
| `curl` | `--tlsv1.2` | TLS-Version erzwingen (Beispiel). | `curl --tlsv1.2 https://example.com` |
| `curl` | `--http1.1` | HTTP/1.1 erzwingen. | `curl --http1.1 https://example.com` |
| `curl` | `--http2` | HTTP/2 aktivieren/erzwingen (wenn unterstützt). | `curl --http2 https://example.com` |
| `curl` | `--resolve host:port:ip` | DNS override pro Request (test/staging). | `curl --resolve example.com:443:1.2.3.4 https://example.com` |
| `curl` | `--dns-servers <ip[,ip]>` | Eigene DNS-Server nutzen (wenn build das kann). | `curl --dns-servers 1.1.1.1 https://example.com` |
| `curl` | `-w "<fmt>"` | “write-out”: Metriken am Ende ausgeben (time, code…). | `curl -w "code=%{http_code} time=%{time_total}\n" -o /dev/null -s https://example.com` |
| `curl` | `--fail-with-body` | Wie `-f`, aber Body bei Fehlern behalten (neuere curl). | `curl --fail-with-body https://example.com/notfound` |
| `curl` | `--head` | Alias für `-I`. | `curl --head https://example.com` |
| `curl` | `--help` | Kurzhilfe. | `curl --help` |
| `curl` | `--version` | Version + Features (z.B. http2, ssl). | `curl --version` |

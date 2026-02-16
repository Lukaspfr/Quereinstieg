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




# Quereinstieg – Linux/Infra Bootcamp (WSL)


Dieses Repo dokumentiert meinen Quereinstieg Richtung **Junior Linux/System/Infrastructure** (Einstieg Richtung Platform/DevOps).
Ich arbeite mit **Ubuntu in WSL** und baue ein solides Fundament in Linux, Debugging und Tooling auf – inkl. “Proof of Practice” Scripts.


## Ziele
- In 2–3 Wochen bewerbungs- und interviewfähig werden (Junior Linux/System/Infra)
- Linux-Fundament: Filesystem, Permissions, Users/Groups, PATH, Debugging
- Kleine Tools bauen & sauber dokumentieren (GitHub-tauglich)


## Repo-Struktur (Auszug)

```text
Quereinstieg/
├─ README.md
├─ lab/
│  ├─ fs/                  # Filesystem-Übungen (find, links, etc.)
│  ├─ perms/               # Permissions/umask-Übungen
│  └─ text/                # Test-Logs & Textfiles für grep/awk/sed Übungen
├─ lernen/
│  ├─ LinuxBefehle.md
│  ├─ Tag1/ ... Tag5/       # Tagesaufgaben, Quiz, Interviewfragen, Debugging-Notes
└─ linux-infra-bootcamp/
   └─ scripts/
      ├─ healthcheck        # Highlight: WSL-tauglicher Healthcheck
      └─ parts/             # Teilskripte, aus denen healthcheck zusammengebaut wurde


Hinweis: Der Ordner lab/ enthält bewusst Übungsdateien (auch “dummy logs”), um Befehle realistisch zu testen.


Highlight: healthcheck (WSL-tauglich)

linux-infra-bootcamp/scripts/healthcheck ist ein kleines CLI-Tool, das optional prüft:

- Prozess (via pgrep)

- Port (via ss)

- Logs (via -l <logfile> oder optional journalctl wenn verfügbar)

- Logscan auf error-like Patterns (error|fail|panic|traceback)


Usage

./linux-infra-bootcamp/scripts/healthcheck [-n <prozessname>] [-p <port>] [-l <logfile>] [-s <service>] [-c <lines>] [-d (help)] [-h (help)]

Beispiele

# Port check
./linux-infra-bootcamp/scripts/healthcheck -p 8080

# Prozess check
./linux-infra-bootcamp/scripts/healthcheck -n bash

# Logs aus Datei + Scan
./linux-infra-bootcamp/scripts/healthcheck -l /tmp/app.log -c 50

# Service-Logs (nur falls journalctl in WSL verfügbar ist)
./linux-infra-bootcamp/scripts/healthcheck -s nginx -c 50

# Debug output
./linux-infra-bootcamp/scripts/healthcheck -d -p 8080


Exit Codes

0 OK

1 WARN (z.B. error-like Patterns in Logs, oder keine Logs im Fallback verfügbar)

2 CRIT (z.B. Port/Prozess nicht vorhanden, oder angegebenes Logfile existiert nicht)


WSL Hinweis (systemd/journalctl)

Je nach WSL-Setup sind systemd/systemctl/journalctl nicht immer verfügbar.
Das Tool ist daher Fallback-first: Logs können über -l <logfile> oder (falls vorhanden) /var/log/syslog bzw. /var/log/messages gelesen werden.


How to run (optional: als Command)

Wenn ~/bin im PATH ist, kannst du einen Symlink setzen:

ln -sf "$PWD/linux-infra-bootcamp/scripts/healthcheck" "$HOME/bin/healthcheck"
healthcheck -h


Lernen / Dokumentation

Die Tagesdokumentation inkl. Quiz & Interviewdrills liegt unter:

- lernen/Tag1 bis lernen/Tag5



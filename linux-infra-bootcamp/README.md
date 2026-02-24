# Linux Infra Bootcamp (WSL)


Dieser Bootcamp-Bereich dokumentiert meinen strukturierten Aufbau von Linux-/Infra-Kompetenzen im Rahmen meines Quereinstiegs.
Ich arbeite mit **Ubuntu in WSL** und baue ein solides Fundament in Linux, Debugging und Tooling auf – inkl. “Proof of Practice” Scripts.


## Ziele
- Solides Linux-Basiswissen für den Weg zum System Engineer / Platform Engineer (Junior Linux/System/Infra)
- Linux-Fundament: Filesystem, Permissions, Users/Groups, PATH, Debugging
- Kleine Tools bauen & sauber dokumentieren (GitHub-tauglich)


## Repo-Struktur (Auszug)

```text
linux-infra-bootcamp/
├─ README.md
├─ notes/
├─ tasks/
└─ scripts/
   ├─ healthcheck
   └─ parts/
```


## Highlight: healthcheck (WSL-tauglich)

scripts/healthcheck ist ein kleines CLI-Tool, das optional prüft:

- Prozess (via `pgrep`)

- Port (via `ss`)

- Logs (via `-l <logfile>` oder optional `journalctl` wenn verfügbar)

- Logscan auf error-like Patterns `(error|fail|panic|traceback)`


## Usage

`./scripts/healthcheck [-n <prozessname>] [-p <port>] [-l <logfile>] [-s <service>] [-c <lines>] [-d (debug)] [-h (help)]`

## Beispiele

### Port check
`./scripts/healthcheck -p 8080`

### Prozess check
`./scripts/healthcheck -n bash`

### Logs aus Datei + Scan
`./scripts/healthcheck -l /tmp/app.log -c 50`

### Service-Logs (nur falls journalctl in WSL verfügbar ist)
`./scripts/healthcheck -s nginx -c 50`

### Debug output
`./scripts/healthcheck -d -p 8080`


## Exit Codes

- `0` OK

- `1` WARN (z.B. error-like Patterns in Logs, oder keine Logs im Fallback verfügbar)

- `2` CRIT (z.B. Port/Prozess nicht vorhanden, oder angegebenes Logfile existiert nicht)


## WSL Hinweis (systemd/journalctl)

Je nach WSL-Setup sind `systemd/systemctl/journalctl` nicht immer verfügbar.
Das Tool ist daher Fallback orientiert: Logs können über `-l <logfile>` oder (falls vorhanden) `/var/log/syslog` bzw. `/var/log/messages` gelesen werden.


## How to run (optional: als Command)

Wenn `~/bin` im PATH ist, kannst du einen Symlink setzen:

```bash
ln -sf "$PWD/linux-infra-bootcamp/scripts/healthcheck" "$HOME/bin/healthcheck"
healthcheck -h
```

## Aufgaben / Dokumentation

Die strukturierten Tagesaufgaben und Übungen befinden sich unter:

- tasks/Tag1 – Tag6
- notes/ (LinuxBefehle, Debugging, Logs etc.)



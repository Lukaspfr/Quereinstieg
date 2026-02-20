### Warum Exit Codes 0/1/2?

Exit Codes sind der standardisierte Rückgabestatus eines Programms an die Shell.

- `0` = OK/Erfolg
- `!= 0` = Problem/Sonderfall (Bedeutung ist programmspezifisch)

Im Healthcheck nutze ich ein Ampel-Schema:

- `0` OK
- `1` WARN (auffällig, aber kein Hard-Fail)
- `2` CRIT (Check fehlgeschlagen)

### Was ist dein Logs-Fallback, wenn `journalctl` nicht geht?

- Primär: `-l <logfile>` (app-spezifische Logs)
- Fallback: `/var/log/syslog` oder `/var/log/messages` (falls vorhanden)
- Letzter Fallback: App im Foreground starten / Debug-Logging aktivieren

### Prozess ok, Port down: nenne 2 Ursachen.

1) Prozess läuft, aber lauscht nicht auf dem erwarteten Port
- falsche Config / falscher Start-Parameter (z.B. ohne `--port 8080`)
- Listener/Binder ist deaktiviert/abgestürzt
- bindet nur auf `127.0.0.1` statt `0.0.0.0` (von außen wirkt’s “down”)

2) Port nicht erreichbar / falscher Port wird geprüft

- Firewall/Policy blockt (z.B. `ufw`, `iptables/nftables`)
- Port-Konflikt / Bind schlägt fehl und App nutzt anderen Port


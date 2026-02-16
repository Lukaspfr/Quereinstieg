Was ist ein Service?

Ein Service ist ein Hintergrundprogramm (Daemon), das vom Betriebssystem verwaltet wird und bestimmte Aufgaben bereitstellt — meist ohne direkte Benutzerinteraktion.


Unter Linux (mit systemd) ist ein Service eine Service-Unit (.service-Datei), die beschreibt, wie ein Hintergrundprozess gestartet, gestoppt und überwacht wird.

Ein Service ist eine Anwendung (ein Programm), die im Hintergrund läuft und System- oder Netzwerkfunktionen bereitstellt.

Ein Service besteht aus:

- Programm/Daemon (z. B. /usr/sbin/sshd)

- Service-Unit-Datei (z. B. /etc/systemd/system/sshd.service)

- Verwaltung durch systemd

Die Unit-Datei enthält u. a.:

- Wie wird gestartet?

- Wann wird gestartet?

- Unter welchem Benutzer?

- Soll bei Absturz neu gestartet werden?

Unterschied Prozess vs Service?


Ein Prozess ist eine laufende Programminstanz mit eigener PID und Speicherbereich.
Ein Service ist ein vom Init-System verwalteter Hintergrundprozess, der systemweite Funktionen bereitstellt.

Ein Prozess ist eine laufende Programminstanz mit eigener PID und Speicherbereich.
Ein Service ist ein vom Init-System verwalteter Hintergrundprozess, der systemweite Funktionen bereitstellt.

| Prozess                             | Service                    |
| ----------------------------------- | -------------------------- |
| Allgemeiner Begriff                 | Spezieller Typ von Prozess |
| Jede laufende Programminstanz       | Hintergrunddienst          |
| Kann kurzlebig sein                 | Meist dauerhaft            |
| Vom Benutzer gestartet              | Vom System verwaltet       |
| Keine besondere Verwaltungsstruktur | Hat Service-Unit           |

Somit Service ⊂ Prozess


Was bedeutet „active (running)“?


Die Anzeige active (running) stammt von systemctl status und beschreibt den Zustand eines Service unter systemd.

Bedeutung der beiden Teile

active (running) besteht aus zwei Zustandsinformationen:

1️⃣ active → Oberzustand (ActiveState)

Das bedeutet:

Die Unit ist aktiv und erfolgreich gestartet.

Sie befindet sich nicht im Zustand:

- inactive

- failed

- activating

- deactivating

(running) → Unterzustand (SubState)

Das bedeutet:

Der zugehörige Prozess läuft aktuell.

Vergleich der möglichen Zustände:

| Anzeige            | Bedeutung                                                   |
| ------------------ | ----------------------------------------------------------- |
| `active (running)` | Läuft normal                                                |
| `active (exited)`  | Aktiv, aber kein laufender Prozess (z. B. einmaliges Setup) |
| `inactive (dead)`  | Nicht gestartet                                             |
| `failed`           | Start fehlgeschlagen oder abgestürzt                        |
| `activating`       | Wird gerade gestartet                                       |
| `deactivating`     | Wird gerade gestoppt                                        |


Wichtig zu verstehen

Ein Service kann:

- active sein, ohne dauerhaft zu laufen
  (z. B. Type=oneshot, dann steht oft active (exited))

Das heißt:

- active = Service gilt als erfolgreich

- running = Prozess läuft gerade wirklich

Also:

active (running) bedeutet, dass der Service erfolgreich gestartet wurde und sein Hauptprozess derzeit ausgeführt wird.

Wie stoppt man einen Service:

unter Linux:

sudo systemctl stop <service-name>

Beispiel SSH:

sudo systemctl stop ssh

Überprüfen:

systemctl status ssh

Weitere wichtige Befehle:

| Befehl                        | Wirkung                             |
| ----------------------------- | ----------------------------------- |
| `systemctl start <service>`   | Service starten                     |
| `systemctl stop <service>`    | Service stoppen                     |
| `systemctl restart <service>` | Neustarten                          |
| `systemctl reload <service>`  | Konfiguration neu laden (ohne Stop) |
| `systemctl status <service>`  | Status anzeigen                     |

Achtung damit kann mans komplett disablen....

sudo systemctl disable <service>



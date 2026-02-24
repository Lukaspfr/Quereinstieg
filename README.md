# Quereinstieg – System / Infrastructure Track

Dieses Repository dokumentiert meinen strukturierten Quereinstieg in Richtung  
**Junior System Administrator / Infrastructure / Platform Engineering**.

Fokus:
- Sauberes technisches Fundament
- Praxisnahe Übungen
- Debugging-Denken
- Eigene kleine Tools als „Proof of Practice“

---

## Ziel

Aufbau belastbarer Grundlagen in:

- Linux / CLI / Debugging
- Windows Server / Client Grundlagen
- Active Directory Grundkonzepte
- Automatisierung (Bash & PowerShell)

Langfristiges Ziel: System Engineer / Infrastructure / Cloud.

---

## Repository-Struktur

```text
Quereinstieg/
│
├── linux-infra-bootcamp/
│   ├── notes/              # Linux Notizen (Befehle, Debugging, Logs)
│   ├── tasks/              # Strukturierte Tagesaufgaben (Tag1–TagX)
│   └── scripts/
│       ├── healthcheck     # Eigenes CLI-Tool (Prozess/Port/Log-Prüfung)
│       └── parts/          # Teilskripte (modularer Aufbau)
│
├── windows-bootcamp/
│   ├── notes/              # Windows / AD Grundkonzepte
│   ├── tasks/              # Strukturierte Windows-Aufgaben
│   └── powershell/
│       └── scripts/        # PowerShell-Übungen & kleine Tools
│
├── lab/                    # Linux Übungsumgebung (Filesystem, Permissions, Logs)
│
└── README.md
````

---

## Linux Infra Bootcamp

Strukturierter Aufbau von Linux-Grundlagen:

* Filesystem & Permissions
* Users / Groups / PATH
* Prozesse & Services
* Logs & Debugging
* Bash-Scripting

### Highlight: `healthcheck`

Ein WSL-taugliches CLI-Tool zur Prüfung von:

* Prozessen (`pgrep`)
* Ports (`ss`)
* Logs (Datei oder optional `journalctl`)
* Error-Scan mit definierten Exit-Codes

Ziel: Infrastruktur-Denken praktisch anwenden.

---

## Windows Bootcamp (im Aufbau)

Parallel baue ich Windows-/Server-Kompetenzen auf:

* PowerShell Grundlagen (Pipeline, Services, Logs)
* Windows Netzwerk-Diagnose
* Active Directory Grundkonzepte (Users, Groups, OU, GPO Basics)

Ziel: solides Windows-Admin-Fundament als Ergänzung zur Linux-Seite.

---

## Lernansatz

* 3×90 Minuten strukturierte Arbeitsblöcke pro Tag
* Aufgaben + Review + Interviewfragen
* Fokus auf Verständnis statt Copy/Paste
* Bewusstes Debugging nach Schema:

  > Symptom → Hypothese → Check → Fix → Verifikation

---

## Status

Aktiv im Aufbau.
Der Fortschritt ist in den jeweiligen Bootcamp-Ordnern dokumentiert.

---

## Motivation

Der Fokus liegt nicht auf Buzzwords, sondern auf:

* belastbaren Grundlagen
* reproduzierbaren Workflows
* nachvollziehbarer Dokumentation
* eigenständig gebauten Tools

Ziel ist es, langfristig im Infrastruktur-/Platform-Umfeld professionell zu arbeiten.





















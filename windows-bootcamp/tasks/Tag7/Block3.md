---



\# BLOCK 3 – Typische AD Probleme



\## User kann sich nicht anmelden – Checkliste



\* Capslock aktiv?

\* Richtiger Benutzername?

\* Konto gesperrt?

\* Passwort abgelaufen?

\* VPN verbunden?

\* DNS erreichbar?

\* Domain Controller erreichbar?

\* Uhrzeit korrekt? (Kerberos empfindlich)



---



\## PC nicht in Domain – erkennen



\* Login zeigt nur lokale Benutzer

\* (Get-CimInstance Win32\_ComputerSystem).PartOfDomain → False

\* whoami zeigt keinen Domain-Benutzer



---



\## Gruppenmitgliedschaft prüfen



```powershell

Get-LocalGroupMember Administrators

whoami /groups

```



\* `Get-LocalGroupMember` → lokale Gruppen

\* `whoami /groups` → aktive Gruppen im aktuellen Sicherheitstoken



Warum wichtig?



Berechtigungen werden über Gruppen gesteuert.



---







# Block 3 – Typische AD-Probleme

## User kann sich nicht anmelden – Checkliste

- Caps Lock aktiv?
- Richtiger Benutzername?
- Konto gesperrt?
- Passwort abgelaufen?
- VPN verbunden (falls nötig)?
- DNS erreichbar?
- Domain Controller erreichbar?
- Uhrzeit korrekt? (Kerberos ist zeit-sensitiv)

---

## PC nicht in Domain – erkennen

- Login zeigt nur lokale Benutzer (kein Domain-Login auswählbar)
- `(Get-CimInstance Win32_ComputerSystem).PartOfDomain` → `False`
- `whoami` zeigt keinen Domain-User (z. B. nur `PCNAME\user` statt `DOMAIN\user`)

---

## Gruppenmitgliedschaft prüfen

```powershell
Get-LocalGroupMember Administrators
whoami /groups
````

* `Get-LocalGroupMember` → Mitglieder lokaler Gruppen (z. B. lokale Administratoren)
* `whoami /groups` → aktive Gruppen im aktuellen Security-Token (was *jetzt* wirklich gilt)

### Warum ist das wichtig?

Berechtigungen werden in Windows/AD in der Praxis fast immer über **Gruppen** gesteuert. Wenn ein Zugriff fehlt, ist sehr oft die Gruppenmitgliedschaft (oder das Token) der Grund.







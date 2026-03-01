# Block 2 – Gruppen & GPO

## Security Group

Eine **Security Group** wird zur Vergabe von Berechtigungen verwendet.

**Beispiele:**
- Zugriff auf `\\fileserver\HR`
- Zugriff auf Anwendungen
- Zugriff auf Drucker

---

## Distribution Group

Eine **Distribution Group** dient nur zur E-Mail-Verteilung.

Sie kann **keine** Berechtigungen vergeben.

---

## Local Group

**Lokale Gruppen** existieren nur auf einem einzelnen Computer.

**Beispiele:**
- Lokale Administratoren
- Lokale Benutzer

Sie haben keine Domain-weite Wirkung.

---

## Group Scopes (vereinfachtes Verständnis)

### Domain Local

- Wird zur Vergabe von Berechtigungen auf Ressourcen **innerhalb der Domain** verwendet.
- Mitglieder können aus **beliebigen Domains** stammen.

### Global

- Enthält Mitglieder aus der **eigenen Domain**.
- Wird typischerweise für **Benutzergruppen** verwendet.

### Universal

- Mitglieder können aus **mehreren Domains** stammen.
- Wird in **Multi-Domain-Umgebungen** genutzt.

---

## Szenario: HR braucht Zugriff auf `\\fileserver\HR`

**Lösung:**
1. Security Group **„HR“** erstellen.
2. Diese Gruppe auf dem Fileserver-Ordner berechtigen.
3. Die 5 Benutzer zur Gruppe hinzufügen.

Keine Einzelberechtigungen vergeben.

---

## Was ist eine Group Policy (GPO)?

Eine **GPO** ist eine Richtlinie, die Einstellungen für Benutzer oder Computer steuert.

**Beispiele:**
- Passwortregeln
- Desktop-Einstellungen
- Sicherheitsrichtlinien
- Softwareverteilung
- Netzlaufwerk-Mapping

Eine GPO ist **keine Berechtigungsgruppe**.

---

## Wo wird eine GPO verlinkt?

Eine GPO wird an:
- OU
- Domain
- Site

verlinkt.

---

## Warum ist sie mächtig?

Mit einer einzigen GPO können hunderte Computer oder Benutzer gleichzeitig konfiguriert werden.

Sie erlaubt zentrale, konsistente Verwaltung.
# Block 1 – AD Struktur & Grundlagen

## Was speichert Active Directory?

Active Directory ist ein Verzeichnisdienst mit einer zentralen Datenbank, die zwischen **Domain Controllern** repliziert wird.

Gespeichert werden unter anderem:

- Benutzer (User)
- Computer
- Gruppen
- Organisationseinheiten (OU)
- Berechtigungen
- Gruppenmitgliedschaften
- Passwort-Hashes
- Richtlinieninformationen

---

## Warum braucht man AD?

Active Directory ermöglicht:

- Zentrale Benutzerverwaltung
- Zentrale Authentifizierung
- Zentrale Rechtevergabe
- Verwaltung von Computern
- Strukturierung von Organisationen
- Anwendung von Richtlinien (GPO)

Ohne AD müsste man Benutzer und Rechte auf jedem System einzeln verwalten.

---

## Was ist eine Domain?

Eine Domain ist ein logischer **Sicherheits- und Verwaltungsbereich** innerhalb von Active Directory.

Sie definiert:

- Benutzerkonten
- Computerobjekte
- Gruppen
- Richtlinien
- Vertrauensgrenzen

Man meldet sich nicht „auf AD“ an, sondern an einer **Domain**, die von AD verwaltet wird.

---

## Domain Controller (DC)

Ein Domain Controller ist ein Server, der:

- eine Kopie der AD-Datenbank hostet
- Benutzer authentifiziert
- Kerberos-Tickets ausstellt
- Replikation mit anderen DCs betreibt

Er ist das zentrale Authentifizierungs- und Verwaltungszentrum der Domain.

---

## OU (Organizational Unit)

Eine OU ist ein Container innerhalb von AD zur Strukturierung von Objekten.

Sie dient:

- Organisation von Usern und Computern
- Verlinkung von Group Policies (GPO)
- Delegation von administrativen Rechten

Wichtig: Eine OU ist **keine Sicherheitsgrenze**.

---

## User

Ein Benutzerobjekt repräsentiert eine Identität innerhalb der Domain.

Dem User werden z. B. zugewiesen:

- Gruppen
- Rechte
- Richtlinien
- Passwortregeln

---

## Group

Eine Gruppe ist ein Sicherheitscontainer für Benutzer oder Computer.

Rechte werden idealerweise **nicht direkt an Benutzer**, sondern an **Gruppen** vergeben.

Vorteile:

- Skalierbarkeit
- Einfachere Verwaltung
- Weniger Fehler

---

## Computer Object

Ein Computerobjekt ist die Identität eines Geräts innerhalb der Domain.

Ein Domain-Computer besitzt:

- einen eigenen Account
- ein Maschinenpasswort
- Gruppenmitgliedschaften

---

## Warum benutzt man OUs?

- Strukturierung nach Abteilung oder Standort
- Verlinkung von GPOs
- Delegation von Adminrechten

---

## Warum Rechte über Gruppen?

Rechte werden Gruppen zugewiesen, nicht einzelnen Usern.

Wenn ein User die Abteilung wechselt, ändert man nur seine **Gruppenmitgliedschaft** – nicht jede einzelne Berechtigung. Das macht das System skalierbar und wartbar.

---

## Was passiert beim Domain-Login? (Kerberos – grob)

1. Der Client leitet aus den Eingaben (Username + Passwort) einen Schlüssel ab.
2. Der Client sendet an den Domain Controller (bzw. KDC):
   - Username + Domain
   - einen verschlüsselten **Beweis** (Pre-Authentication)
3. Der DC kann (vereinfacht gesagt) mit den gespeicherten Informationen den passenden Schlüssel ableiten und den Beweis prüfen.
4. Wenn der Beweis korrekt ist, bekommt der Client:
   - ein **TGT** (Ticket Granting Ticket – kann der Client nicht lesen)
   - einen **Session Key** (für die laufende Sitzung)

### Zugriff auf einen Dienst (z. B. Fileserver / CIFS)

- Client schickt **TGT + Authenticator** an den **TGS** und fordert ein Ticket an:  
  „Gib mir ein Ticket für `CIFS/Fileserver`“
- TGS gibt zurück:
  - **Service Ticket** (für den Fileserver)
  - **Service-Session-Key**

Dann sendet der Client an den Fileserver:

- Service Ticket
- Authenticator (kurzer Beweis, mit Service-Session-Key)

---

## Warum ist DNS in einer Domain kritisch?

Clients finden Domain Controller über DNS (z. B. **SRV-Records**).

Wenn DNS falsch konfiguriert ist:

- Login kann fehlschlagen
- GPOs werden nicht angewendet
- Ressourcen sind nicht erreichbar

AD ist stark DNS-abhängig.





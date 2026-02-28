---


# BLOCK 1 – AD Struktur \& Grundlagen



## Was speichert Active Directory?



Active Directory ist ein Verzeichnisdienst mit einer zentralen Datenbank, die zwischen Domain Controllern repliziert wird.



Gespeichert werden:



\* Benutzer (User)

\* Computer

\* Gruppen

\* Organisationseinheiten (OU)

\* Berechtigungen

\* Gruppenmitgliedschaften

\* Passwort-Hashes

\* Richtlinieninformationen



---



## Warum braucht man AD?



Active Directory ermöglicht:



\* Zentrale Benutzerverwaltung

\* Zentrale Authentifizierung

\* Zentrale Rechtevergabe

\* Verwaltung von Computern

\* Strukturierung von Organisationen

\* Anwendung von Richtlinien (GPO)



Ohne AD müsste man Benutzer und Rechte auf jedem System einzeln verwalten.



---



## Was ist eine Domain?



Eine Domain ist ein logischer Sicherheits- und Verwaltungsbereich innerhalb von Active Directory.



Sie definiert:



\* Benutzerkonten

\* Computerobjekte

\* Gruppen

\* Richtlinien

\* Vertrauensgrenzen



Man meldet sich nicht „auf AD“, sondern an einer Domain an, die von AD verwaltet wird.



---



## Domain Controller



Ein Domain Controller ist ein Server, der:



\* Eine Kopie der AD-Datenbank hostet

\* Benutzer authentifiziert

\* Kerberos-Tickets ausstellt

\* Replikation mit anderen DCs betreibt



Er ist das zentrale Authentifizierungs- und Verwaltungszentrum der Domain.



---



## OU (Organizational Unit)



Eine OU ist ein Container innerhalb von AD zur Strukturierung von Objekten.



Sie dient:



\* Organisation von Usern und Computern

\* Verlinkung von Group Policies

\* Delegation von administrativen Rechten



Wichtig:

Eine OU ist \*\*keine Sicherheitsgrenze\*\*.



---



## User



Ein Benutzerobjekt repräsentiert eine Identität innerhalb der Domain.



Dem User werden:



\* Gruppen

\* Rechte

\* Richtlinien

\* Passwortregeln



zugewiesen.



---



## Group



Eine Gruppe ist ein Sicherheitscontainer für Benutzer oder Computer.



Rechte werden nicht direkt an Benutzer vergeben, sondern an Gruppen.



Vorteil:



\* Skalierbarkeit

\* Einfachere Verwaltung

\* Weniger Fehler



---



## Computer Object



Ein Computerobjekt ist die Identität eines Geräts innerhalb der Domain.



Ein Domain-Computer besitzt:



\* Einen eigenen Account

\* Ein Maschinenpasswort

\* Gruppenmitgliedschaften



---



## Warum benutzt man OUs?



\* Strukturierung nach Abteilung oder Standort

\* Verlinkung von GPOs

\* Delegation von Adminrechten



---



## Warum Rechte über Gruppen?



Rechte werden Gruppen zugewiesen, nicht einzelnen Usern.



Wenn ein User die Abteilung wechselt, ändert man nur seine Gruppenmitgliedschaft – nicht jede einzelne Berechtigung.



Das macht das System skalierbar und wartbar.



---



## Was passiert beim Domain-Login?



Der Client stellt aus meinen eingaben (username, Password) einen Key her. Dann schickt er dem DC meinen Username + die Domain auf der ich mich einlogge. Ausserdem einen Beweis der mit meinem KEy verschlüsselt wurde. Da der DC mein Passwort kennt kann er daraus einen passenden schlüssel herstellen um den Beweis zu lesen.

Ist er korrekt sendet er ein verschlüsseltes Ticket (kann client nicht lesen) und einen Session Key zurück. Dieser erlaubt einem länger im System zu arbeiten ohne immer reloggen zu müssen.



Wenn man sich nun in den Fileserver einloggen möchte:

Client schickt TGT + Authenticator an TGS: “Gib mir ein Ticket für CIFS/Fileserver”

TGS gibt zurück: Service Ticket (für den Fileserver) + Service-Session-Key



Client schickt dem Fileserver:

Service Ticket

Authenticator (kurzer Beweis, mit Session Key)





---



## Warum ist DNS in einer Domain kritisch?



Clients finden Domain Controller über DNS (SRV-Records).



Wenn DNS falsch konfiguriert ist:



\* Login kann fehlschlagen

\* GPOs werden nicht angewendet

\* Ressourcen sind nicht erreichbar



AD ist vollständig DNS-abhängig.



---



---






**Warum braucht man Admin-Rechte?**



Services werden von System ausgeführt, darum braucht man dieselben Rechte wie das System um sie zu beenden -->Admin / Root



**Was wäre riskant zu stoppen?**



Systemservices die Wichtig für das Betriebssystem sind.  Sicherheitsdienste, Netzwerksdienste



**Unterschied Application vs System Log?**



Wie der Name schon sagt sind es entweder die Logs von Windows Komponenten und Treibern... (des Systems) oder es sind die Logs von Programmen.



**Wie würdest du Fehler nach einem Service-Crash suchen?**



Ich würde den zeitstempel des Crashes mit den Logs abgleichen. Services sind auf system ebene, somit die System logs durchsuchen



**Was prüft Test-NetConnection?**



Es pingt den Server an und schaut ob es einen TCP Handshake mit der Adresse durchführen kann. also DNS Auflösung und Port Erreichbarkeit.



**Wie erkennst du, ob ein Port lokal offen ist?**



Get-NetTCPConnection -State Listen

oder netstat -ano






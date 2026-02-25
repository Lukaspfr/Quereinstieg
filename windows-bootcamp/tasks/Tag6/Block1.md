**Warum heissen PowerShell-Befehle Verb-Noun?**



Unter Verb- Noun versteht man das Design der Befehle. Das Verb ist eine Art Vorwort. Es macht es sehr leicht abzulesen was ein Befehl tut:





“Ich will anzeigen” -> Get-\*



“Ich will starten” -> Start-\*



“Ich will stoppen” -> Stop-\*



“Ich will ändern” -> Set-\*



“Ich will neu starten” -> Restart-\*





Das Noun ist dann der andere Teil:



Process, Service etc





PowerShell arbeitet mit Objekten, und Verb-Noun passt zu “Operation auf Objektart”:



\- Verb = Aktion (Get/Set/New/Remove/…)



\- Noun = Ziel/Resource (Service/Process/Item/User/…)



\- Pipeline verbindet die Objekte sauber weiter.



**Was ist der Vorteil gegenüber Linux-Befehlen?**



Die PowerShell pipeline leitet wirkliche Objekte weiter und nicht nur Text. Dies macht es möglich jene Objekte direkt weiterzuverwenden.





**Was ist der Unterschied Prozess vs Service?**





Ein Prozess ist ein laufendes Programm (eine Instanz im RAM).

Ein Service (Dienst) ist eine verwaltete Hintergrund-Komponente, die vom Service Control Manager gestartet/gestoppt wird und oft einen Prozess nutzt.



Ein Prozesss hat eine PID.



Ein Service ist nicht automatisch “ein eigener Prozess”. Er kann:



\- in einem eigenen Prozess laufen (typisch),

\- oder sich einen Prozess mit anderen Services teilen (z. B. svchost.exe hostet mehrere Windows-Services).



**Warum startet man nicht einfach Prozesse neu?**



Da es sich um User-Apps etc handelt, verliert man beim NNeustarten gewisse Informationen. 






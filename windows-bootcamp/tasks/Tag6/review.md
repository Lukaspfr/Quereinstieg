**Unterschied Prozess vs Service?**



Ein Prozess hat eine Prozess ID und und kann auch vom User gestartet werden. Ein Service wird vom System gestartet und ist ein Hintergrunddienst.



**Wie prüfst du, warum ein Dienst nicht startet?**



Eventmanager abfragen ob Errors vorhanden.

Socket besetzt?





**Wie prüfst du DNS?**



nslookup



**Wie prüfst du, ob ein Port offen ist?**



netstat -ano



**Wie filterst du Errors aus Eventlogs?**



Get-WinEvent -LogName System | Where-Object {$\_.LevelDisplayName -eq "Error"} | Select-Object -First 5


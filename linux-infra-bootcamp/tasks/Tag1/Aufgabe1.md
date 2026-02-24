1) Eine IP-Adresse ist eine Adressnummer wie eine Hausnummer. Es zeigt den Daten wohin. Sie besteht
aus 2 Teilen: Host und Netzteil. Sie ist dazu da ein Gerät definitiv zu identifizieren.

#Note Wie unterscheidet man den Host und den Netzteil?

2) Eine private IP ist lokal und eine IPv4 in unserem Hauseigenen Netzwerk, während die öffentliche
IP Adresse eine IPv6 Adresse ist. Die öffentliche wird von unserem Internet Provider 
unserem Router zugewiesen, damit dieser weltweit einzigartig differenzierbar ist. Der Router 
konvertiert auch unsere IPv4 Adressen beim benutzen des Internets in eine public IP. Denn die 
IPv4 wird wie gesagt nur Intern verwendet.

3)Das ist eine private ( lokale IP). Private IPv4 adressen werden im router intern von einem
Service namens DHCP vergeben. Die speziefische nummer 127.0.0.1 ist die lokale Adresse des 
eigenen PC's oft einfach mit dem Namen Lokalhost bezeichnet.

4) Die IP macht das Gerät eindeutig differenzierbar, doch ein PC hat ja nicht nur eine Anwendung 
und nicht wenige kommunizieren nach aussen. Somit benötigt man Ports. Diese sind nun die 
Türnummern. Hinter jeder Tür im Gerät ist eine andere Anwendung und durch die Ports weiss das 
System genau an welche Anwendung die Daten gesendet wurden.
Prots können im Bereich von 0 bis 65535 liegen. 

5) Die IP differenziert ein Gerät von anderen und weisst es eindeutig aus, der Port differenziert
intern im Gerät die Anwendungen voneinander, damit das Gerät weiss wer die Daten erhalten sollte.
Hat man beides in Kombination (IP + Port) so nennt man das ein Socket.
Achtung: Eine Anwendung kann vom Betriebssystem mehrere Ports zugewiesen bekommen. 

#Note: Differenziert der Port nun Prozesse oder Services?

6) Prots zwischen 0 und 1023 sind für sspeziefische bekannte Dienste reserviert. Kurze Liste:
21 -> FTP (File Transfer Protocol)
22 -> SSH ()
25 -> SMTP(Emailverkehr)
80 -> HTTP(Hyper Text Transfer Protocol)
443 -> HTTPS (Hyper text Transfer Protocol Secure)

1024 - 49151 ist reserviert für speziefische Anwendungen die von Nutzern erstellt wurden und 
dafür registriert wurden.
Beispiel:

3306 -> MySQL

49152 - 65535 -> Dynamic Ports können frei benutzt werden.


 

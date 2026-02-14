Was macht ein DNS genau?

Ein DNS übersetzt unsere Domainnamen in IP Adressen.
Dies wird zuerst versucht lokal zu tun: Wir überprüfen in unserem eigenen Cache, ist dort die IP des Domainnamens nicht gespeichert wenden wir uns an einen externen Server, den sogenannten Resolver. 
Kann der Resolver den Domainnamen nicht übersetzen so wendet er sich an einen der 13 Root Server des Internets. Dieser hat keine Domainnamen gespeichert, doch dieser leitet uns dann weiter zu einem Server 
namens TLD (Top Level Domain Server). Dieser hat die Namen der top level domains (.com, .net, .org). Findet man in dessen verzeichnis die IP der Domain immer noch nicht, dann wird man zum Autoritative
name server weitergeleitet. Dieser wird die IP definitiv besitzen oder einen Errorcode zurücksenden.

Rekursive vs autoritative DNS:

Der Rekursive DNS sucht die IP Komplett von selbst über den oben beschriebenen Hergang. Er sucht der Pyramide hinauf sozusagen. 
Der autoritative DNS hingegen ist die Quelle der Domainnamen selbst. Er beinhaltet die offiziellen Namen der Domaine.

Was ist ein A-Record:

Ein A Record ist ein "Adress Record". 

example.com.    IN    A    93.184.216.34

Bedeutung:

Teil		Bedeutung
example.com	Domainname
IN		Internet (Klasse)
A		Record-Typ
93.184.216.34	IPv4-Adresse

Der A Record ist somit die zurückgegebene IP bei einer Anfrage.


Was ist ein CNAME?

Ein CNAME ist ein ALias.
Ein CNAME (Canonical Name Record) ist ein DNS-Eintrag, der
einen Domainnamen als Alias auf einen anderen Domainnamen verweisen lässt.

📊 Andere wichtige DNS-Records

Record	Bedeutung
A	IPv4-Adresse
AAAA	IPv6-Adresse
MX	Mailserver
CNAME	Alias
NS	Nameserver
TXT	Textinformationen (z.B. SPF)

Beispiel CNAME:

www.example.com   IN   CNAME   example.com


Hier verweist CNAME also auf eine andere DOmain, während A auf eine IPv4 verweist.


Warum ist DNS kritisch für Web?

Ohne die DNS müssten wir IP Adressen verwenden um die Server zu finden. Dies ist für den Menschen sehr unnatürlich, da wir untereinander mit Namen und nicht mit Nummern kommunizieren.
Der normalverbraucher wäre also vom verwenden des nicht lokalen Netzes ausgeschlossen ohne DNS.

WElche IP bekommst du:

nslookup:

cherubim@LP:~$ nslookup google.com
Server:         10.255.255.254
Address:        10.255.255.254#53

Non-authoritative answer:
Name:   google.com
Address: 192.178.170.139
Name:   google.com
Address: 192.178.170.102
Name:   google.com
Address: 192.178.170.113
Name:   google.com
Address: 192.178.170.101
Name:   google.com
Address: 192.178.170.100
Name:   google.com
Address: 192.178.170.138
Name:   google.com
Address: 2a00:1450:400a:1009::64
Name:   google.com
Address: 2a00:1450:400a:1009::8b
Name:   google.com
Address: 2a00:1450:400a:1009::71
Name:   google.com
Address: 2a00:1450:400a:1009::65

Gibt die IP des DNS Servers und die nicht authoritativen Antworten mit 6 IPv4 Adressen und 4 IPv6 Adressen zurück.


dig:

cherubim@LP:~$ dig google.com

; <<>> DiG 9.18.39-0ubuntu0.22.04.2-Ubuntu <<>> google.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 56982
;; flags: qr rd ra; QUERY: 1, ANSWER: 6, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1232
;; QUESTION SECTION:
;google.com.                    IN      A

;; ANSWER SECTION:
google.com.             131     IN      A       192.178.170.139
google.com.             131     IN      A       192.178.170.102
google.com.             131     IN      A       192.178.170.113
google.com.             131     IN      A       192.178.170.101
google.com.             131     IN      A       192.178.170.100
google.com.             131     IN      A       192.178.170.138

;; Query time: 8 msec
;; SERVER: 10.255.255.254#53(10.255.255.254) (UDP)
;; WHEN: Fri Feb 13 23:31:01 CET 2026
;; MSG SIZE  rcvd: 135

Dig gibt mir nur die 6 IPv4 zurück als direkte A-Records.

Es kommen mehrere IP Adressen bei beiden und ich sehe in dig nur A Records und in nslookup sehe ich auch AAAA Records.



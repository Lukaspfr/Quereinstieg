Was ist TCP:

TCP steht für Transmission Control Protocol und ist ein zentrales Transportprotokoll im Internet.

🎯 Kurzdefinition

TCP sorgt dafür, dass Daten zuverlässig, geordnet und vollständig zwischen zwei Geräten übertragen werden.
Die Verbindung wird folgendermassen Initialisiert:

Client → SYN
Server → SYN-ACK
Client → ACK

Syn -> Packet mit einer Sequenznummer
Syn-ACK -> Packet mit einer Sequenznummer und einer vermuteten nächsten sequenznummer des gegenübers.
ACK -> Nächste Sequenznummer und eine vermutete Sequenznummer des gegenübers.

Nachher werden die Daten immer mit einem Ack Packet hin und her geschickt. Dies erstellt eine numerische Anordnung der Packete und so bemerkt man wenn Packete verloren gegangen wären.


verbindungsabbau:


Client		Server

FYN	->	ACK

ACK	<-	FYN

FYN -> Packet mit nur einer Sequenznummer
ACK -> Darauffolgende vermutete Sequenznummer


Warum ist es verbindungsorientiert?

Es ist verbindungsorientiert weil es vor dem Datenaustausch eine logische Verbindung aufbaut und diesen Zustand speichert.
Damit kann TCP die Reihenfolge und vollständigkeit der Daten garantieren, da ja eine Sequenz mitgegeben wird. Dies verhindert auch dublikate oder lücken.

Was ist der 3-Way-Handshake?

Der 3-Way-Handshake ist der oben beschriebene Ablauf:

Client → SYN
Server → SYN-ACK
Client → ACK

Dieser initialisiert die Verbindung.


Unterschied TCP vs UDP?

UDP steht für User Datagram Protocol.
UDP ist im gegensatz zu TCP ohne logische Verbindung und minimalistisch.
UDP Sender schickt einfach ein Packet.


Wann nutzt man UDP?

| Anwendung     | Warum UDP?                               |
| ------------- | ---------------------------------------- |
| DNS           | Kleine, schnelle Anfragen                |
| VoIP          | Geschwindigkeit wichtiger als Perfektion |
| Streaming     | Leichter Paketverlust ok                 |
| Online-Gaming | Niedrige Latenz wichtig                  |


Beobachte:

Siehst du traffic:
Ja
Ich sehe den SYN ACK, hat jedoch gedauert, da ich nicht realisiert habe dass mir "sudo tcpdump -i any port 443" relative Sequenznummern angibt.

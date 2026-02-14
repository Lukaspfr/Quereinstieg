1) DNS steht für Domain name System. Dieser Server wandelt unsere Webseitennamen in eine
IP Adresse um. Dies wird gemacht, da wir menschen mit Namen besser umgehen können als mit
Nummern. Die DNS besteht aus einem internen Abgleich im Cache des eigenen gerätes, einem Resolver
falls der eigene Cache die Domain nicht besitzt und falls der Resolver sie auch nicht findet, dann
gibt es weltweit noch 13 Rootserver, diese lenken dann den Resolver weiter zu einem TLD (Top Level
Domain) Server und falls dieser es immernoch nicht weiss gibt es noch die Authoritative Name 
Servers.

----> Die URL wird also zuerst in einer Datenbank, in welcher Domainnamen stehen mit den 
Domainnamen verglichen und dann mit der damit verbundenen IP Adresse ersetzt. Da es sich um 
example.com handelt wird der Resolver unter Umständen bis zum TLD Server weitergeleited, denn
dieser managed top level domains ergo ".com". Die Information (IP) wird dann an deinen PC 
zurückgeschickt.

#Wird dabei eine Hashmap verwendet? Domainname -> IP Scheint sinnvoll zu sein.

2)TCP steht für Transmission Control Protocol. Dies ist ein verbindungsorientiertes Protokoll.
Die beiden dabei interragierenden Geräte führen dabei einen sogenannten Handshake aus um die
Verbindung herzustellen. Dies bedeuted, dass das PC1 sended eine Sequenznummer an Server 
(SYN-Packet). Der Server reagiert mit einem SYN-ACK-Packet. Dieses beinhaltet eine eigene 
gnerierte Sequenznummer und eine ACK Nummer (eine vermutete nächste Sequenznummer des PC). Die
Nummern erhöhen sich meistens um 1.
Danach sendet der PC ein ACK Packet an den Server. Dieses beinhaltet seine nächste sequenznummer 
und die vermutete nächste Sequenznummer des Servers. Damit ist die Verbindung aufgebaut.
Um die verbindung abzubauen sendet einer der beiden Parteien einsogenanntes Fynn Packet ( Packet 
mit nur einer Sequenznummer), der andere reagiert dann mit einem ACK Packet ( nur die ACK nummer).
Danach wird derselbe Vorgang in die andere Richtung wiederholt und dann ist die Verbindung beendet.

----> Der pc sendet nun an die IP von example.com sein Syn Packet und sie laufen den oben 
beschriebenen Ablauf durch. Eine Verbindung wird etabiliert.


3) 
	TLS-Handshake (TLS 1.2) mit ECDHE – Schritt für Schritt
(1) ClientHello (Client → Server)

Der Client sagt:

- welche TLS-Versionen er kann
- welche Cipher Suites er unterstützt (z.B. ECDHE…AES-GCM…)
- Zufallswert ClientRandom
- optionale Extensions (z.B. SNI = welcher Hostname, ALPN = HTTP/2 vs HTTP/1.1, usw.)

Zweck: “Hallo, das kann ich – lass uns was gemeinsam wählen.”

(2) ServerHello (Server → Client)

Der Server antwortet:

- welche Version & Cipher Suite er auswählt
- Zufallswert ServerRandom
- weitere Parameter/Extensions

Zweck: “Wir nehmen diese Einstellungen.”

(3) Certificate (Server → Client)

Der Server schickt sein Zertifikat (mit öffentlichem Schlüssel, meist RSA oder ECDSA) + ggf. die Zertifikatskette.

Zweck: Client kann prüfen: “Ist das wirklich der Server für diese Domain?”

(4) ServerKeyExchange (Server → Client) ✅ hier kommt (EC)DHE rein

Der Server schickt die (EC)DHE-Key-Exchange-Daten, z.B.:

- welche Kurve (bei ECDHE)
- seinen ephemeren Diffie-Hellman Public Key (temporär, nur für diese Verbindung)

Und ganz wichtig:

- Der Server signiert diese Key-Exchange-Daten mit dem privaten Schlüssel aus seinem Zertifikat.

Zweck:

- DH/ECDH sorgt für gemeinsamen geheimen Schlüssel
- Die Signatur sorgt dafür, dass kein Angreifer “seine” DH-Werte unterschieben kann (MITM-Schutz)

(5) (Optional) CertificateRequest (Server → Client)

Nur wenn der Server Client-Zertifikate will (mutual TLS). Oft nicht der Fall.


(6) ServerHelloDone (Server → Client)

Server signalisiert: “Ich bin erstmal fertig mit meinen Handshake-Nachrichten.”

(7) ClientKeyExchange (Client → Server) ✅ Client liefert seinen ECDHE-Public Key

Der Client schickt seinen ephemeren ECDHE Public Key.

Jetzt können beide Seiten rechnen:

- Client hat: (client_priv, client_pub)
- Server hat: (server_priv, server_pub)

Beide berechnen denselben gemeinsamen Geheimwert:

- ECDHE Shared Secret = ECDH(client_priv, server_pub)
- = ECDH(server_priv, client_pub) (ergibt identisch)

Zweck: Das ist der eigentliche Diffie-Hellman-Moment: gemeinsames Geheimnis ohne Übertragung.

(8) (Optional) Client Certificate + CertificateVerify

Falls mutual TLS:

- Client sendet sein Zertifikat
- und beweist Besitz des privaten Schlüssels (CertificateVerify)

(9) Key Derivation: Aus Shared Secret → Sitzungsschlüssel

Beide Seiten leiten aus:

- ECDHE Shared Secret
- ClientRandom und ServerRandom
  mit einer PRF/HKDF-ähnlichen Ableitung einen Master Secret ab und daraus:
- symmetrische Schlüssel für Verschlüsselung
- Schlüssel für Integrität (MAC/AEAD)
- IVs/Nonces etc.

Zweck: ECDHE liefert Roh-Geheimnis, TLS macht daraus echte Traffic-Keys.

(10) ChangeCipherSpec (Client → Server)

Client sagt: “Ab der nächsten Nachricht verwende ich die ausgehandelten Schlüssel.”

(11) Finished (Client → Server)

Client sendet eine “Finished”-Nachricht, die bereits verschlüsselt ist und einen kryptografischen Prüfwelt enthält (Hash über den bisherigen Handshake).

Zweck: Beweis: Client hat dieselben Schlüssel und der Handshake wurde nicht manipuliert.

(12) ChangeCipherSpec + Finished (Server → Client)

Server macht das gleiche:

- ChangeCipherSpec
- Finished (verschlüsselt)

Zweck: Beweis auch vom Server.

(13) Ab jetzt: Application Data

Nun läuft der normale Datenverkehr (HTTP etc.) symmetrisch verschlüsselt.


ASCI Art

Client                                         Server
  |                                               |
  | -------- ClientHello -----------------------> |
  |                                               |
  | <------- ServerHello ------------------------ |
  | <------- Certificate ------------------------ |
  | <------- ServerKeyExchange (ECDHE pub_S) ----|
  | <------- ServerHelloDone --------------------|
  |                                               |
  | -------- ClientKeyExchange (pub_C) --------> |
  |                                               |
  |   Beide berechnen:                           |
  |   Shared Secret = ECDH(priv_C, pub_S)        |
  |                 = ECDH(priv_S, pub_C)        |
  |                                               |
  | -------- ChangeCipherSpec ------------------> |
  | -------- Finished (verschlüsselt) ----------> |
  |                                               |
  | <------- ChangeCipherSpec ------------------- |
  | <------- Finished (verschlüsselt) ----------- |
  |                                               |
  | ======= Sichere Verbindung aktiv =======     |
  | <======  Application Data (AES etc.) ======> |



----->Durch den oben beschriebenen Ablauf wird mithilfe des TLS Handshake die Verbindung verschlüsselt. Dieser schritt macht HTTP zu HTTPS. (S = Secure)

4) HTTP Request:
	
	Beinhalted:
	
	Version des verwendeten HTTP Protokolls
	get oder Post requests. Get fordert Daten an während post daten sendet. 
	Informationen zum Host ( webseite URL) 
	User-Agent --> Webbrowser
	Accept -> akzeptierte Dokumente
	Connection -> offene oder geschlossene Verbindung
	
---> Der PC kommuniziert nun über diese HTTP requests und responses mit dem Server. Er verwendet jedesmal get wenn er etwas vom server will und Post wenn er Daten an den server senden möchte.
5) HTTP Response:

	Beinhalted:
	
	Datum + Zeit
	Expires Header ( wann muss der Inhalt als veralted betrachtet werden) (-1 -> sofort veralted)
	cache control -> direktiven für caching mechanismen ( private or public  and max age)
	Content type -> Medientyp wie der name sagt -->zB. text/html / gibt ausserdem auchnoch das encoding an -> UTF8 etc
	Content- Encoding: Wie ist es verschlüsselt.
	server -> gibt serverart an
	Content length --> länge des bodies in Byte
	
	
	

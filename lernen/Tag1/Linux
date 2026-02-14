Wenn du eine IPv4 siehst:

- Beginnt sie mit 10. → privat
- Beginnt sie mit 192.168. → privat
- Beginnt sie mit 172. → prüfen:
	zweite Zahl zwischen 16–31 → privat
	sonst → öffentlich



Fragen:

IP: 172.19.72.28
Sie ist privat
127.0.0.1 bedeuted Localhost und ist der Bezug auf meinen eigenen PC.

Ports:
Netid                State                 Recv-Q                Send-Q                                Local Address:Port                                Peer Address:Port                Process
udp                  UNCONN                0                     0                                     127.0.0.53%lo:53                                       0.0.0.0:*
udp                  UNCONN                0                     0                                    10.255.255.254:53                                       0.0.0.0:*
udp                  UNCONN                0                     0                                         127.0.0.1:323                                      0.0.0.0:*
udp                  UNCONN                0                     0                                             [::1]:323                                         [::]:*
tcp                  LISTEN                0                     1000                                 10.255.255.254:53                                       0.0.0.0:*
tcp                  LISTEN                0                     4096                                  127.0.0.53%lo:53                                       0.0.0.0:*


Die Ports 323 und 53 sind offen.
Kein Prozess hängt daran.
Listen bedeuted, dass ein Prozess aktiv auf die Verbindung wartet an diesem Port.

Ein Serverprogramm macht intern:

- socket()
- bind() → Port wird zugewiesen
- listen() → Socket geht in LISTEN
- accept() → wartet auf eingehende Verbindung

Sobald listen() aufgerufen wurde, sieht man den Port in ss als LISTEN.


DNS testen:

cherubim@LP:~/Quereinstieg/lernen$ nslookup example.com
Server:         10.255.255.254
Address:        10.255.255.254#53

Non-authoritative answer:
Name:   example.com
Address: 104.18.27.120
Name:   example.com
Address: 104.18.26.120
Name:   example.com
Address: 2606:4700::6812:1b78
Name:   example.com
Address: 2606:4700::6812:1a78


Ich bekomme die IP adresse des Servers und dessen Port zurück.


4 HTTPS Testen:


cherubim@LP:~/Quereinstieg/lernen$ curl -v https://example.com
*   Trying 104.18.27.120:443...
* Connected to example.com (104.18.27.120) port 443 (#0)
* ALPN, offering h2
* ALPN, offering http/1.1
*  CAfile: /etc/ssl/certs/ca-certificates.crt
*  CApath: /etc/ssl/certs
* TLSv1.0 (OUT), TLS header, Certificate Status (22):
* TLSv1.3 (OUT), TLS handshake, Client hello (1):
* TLSv1.2 (IN), TLS header, Certificate Status (22):
* TLSv1.3 (IN), TLS handshake, Server hello (2):
* TLSv1.2 (IN), TLS header, Finished (20):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Encrypted Extensions (8):
* TLSv1.3 (IN), TLS handshake, Certificate (11):
* TLSv1.3 (IN), TLS handshake, CERT verify (15):
* TLSv1.3 (IN), TLS handshake, Finished (20):
* TLSv1.2 (OUT), TLS header, Finished (20):
* TLSv1.3 (OUT), TLS change cipher, Change cipher spec (1):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.3 (OUT), TLS handshake, Finished (20):
* SSL connection using TLSv1.3 / TLS_AES_256_GCM_SHA384
* ALPN, server accepted to use h2
* Server certificate:
*  subject: CN=example.com
*  start date: Dec 16 19:39:32 2025 GMT
*  expire date: Mar 16 18:32:44 2026 GMT
*  subjectAltName: host "example.com" matched cert's "example.com"
*  issuer: C=US; O=SSL Corporation; CN=Cloudflare TLS Issuing ECC CA 3
*  SSL certificate verify ok.
* Using HTTP2, server supports multiplexing
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* Using Stream ID: 1 (easy handle 0x5a781dfa79f0)
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
> GET / HTTP/2
> Host: example.com
> user-agent: curl/7.81.0
> accept: */*
>
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
* TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
* old SSL session ID is stale, removing
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
< HTTP/2 200						#200 Statuscode
< date: Fri, 13 Feb 2026 17:47:34 GMT
< content-type: text/html
< cf-ray: 9cd626d46b8503b5-ZRH
< last-modified: Thu, 12 Feb 2026 14:00:39 GMT
< allow: GET, HEAD
< accept-ranges: bytes
< age: 8991
< cf-cache-status: HIT
< server: cloudflare
<
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
<!doctype html><html lang="en"><head><title>Example Domain</title><meta name="viewport" content="width=device-width, initial-scale=1"><style>body{background:#eee;width:60vw;margin:15vh auto;font-family:system-ui,sans-serif}h1{font-size:1.5em}div{opacity:0.8}a:link,a:visited{color:#348}</style></head><body><div><h1>Example Domain</h1><p>This domain is for use in documentation examples without needing permission. Avoid use in operations.</p><p><a href="https://iana.org/domains/example">Learn more</a></p></div></body></html>
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* Connection #0 to host example.com left intact



=============================================================================================================================================================================
HTTP Statuscodes:

1xx -> Information
2xx -> Erfolg
3xx -> Weiterleitung
4xx -> client Server
5xx -> Server Fehler.

=============================================================================================================================================================================

TLS ist deutlich sichtbar.
Der HTTP Statuscode ist 200. 200 bedeuted Anfrage erfolgreich verarbeited.
Die HTTP version ist HTTP/2.

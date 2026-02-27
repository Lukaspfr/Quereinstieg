nslookup google.com

Resolve-DnsName google.com



**Unterschied?** 



nslookup ist das klassische WindowsTool, gibt dir den namen und die IP des DNS zurück und nachher alle möglichen Einträge für google beim DNS



Resolve-DnsName google.com -> Ist die PowerShell native Version, du erhältst nur die DNS einträge (dafür schön geordnet), aber nicht den Namen des DNS Servers und dessen IP.



**Was bedeutet NXDOMAIN?**



Der Domainname existiert nicht im DNS.



**Warum ist PID-Zuordnung wichtig?**



Man kann damit nachlesen welcher Prozess welchen Prot verwendet / blockiert.



**Was würdest du prüfen, wenn Port 3389 nicht erreichbar ist?**



* **Port listening?**
* **Firewall**
* **Netzwerk überhaubt erreichbar?**

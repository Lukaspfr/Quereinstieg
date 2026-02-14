Ich sehe den Port 800:

cherubim@LP:~$ ss -tulnp
Netid      State       Recv-Q      Send-Q            Local Address:Port             Peer Address:Port      Process
udp        UNCONN      0           0                 127.0.0.53%lo:53                    0.0.0.0:*
udp        UNCONN      0           0                10.255.255.254:53                    0.0.0.0:*
udp        UNCONN      0           0                     127.0.0.1:323                   0.0.0.0:*
udp        UNCONN      0           0                         [::1]:323                      [::]:*
tcp        LISTEN      0           1000             10.255.255.254:53                    0.0.0.0:*
tcp        LISTEN      0           4096              127.0.0.53%lo:53                    0.0.0.0:*
tcp        LISTEN      0           5                       0.0.0.0:8000                  0.0.0.0:*          users:(("python3",pid=436,fd=3))

Der Prozess heisst python, die Prozess ID ist 436. 
FD = file Descriptor
Jeder offene Prozess startet in Linux mit 0 (stdin), 1(stdout), 2(stderr).
fd3 ist einfach die nächste Nummer. Das bedeuted, der Server hat einen TCP-Socket geöffnet, ihn an den Port 8000 gebunden und den Socket in 
den Listen zustand versetzt.
Die FD sind die nummerierungen in einer Tabelle. Der Kernel verteilt darin ressourcen. Sie sind Handles die auf ressourcen verweisen 
( zum beispiel einen Socket). Es ist wichtig zu wissen, dass fals der Kernel einen FD schliesst er diese Nummer direkt in der nächsten 
gelegenheit neu vergiebt. Dies tut er aus Effizienzgründen.

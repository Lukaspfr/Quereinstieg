PID:

cherubim     578  0.0  0.0  24940 17520 pts/0    S+   01:48   0:00 python3 -m http.server

Parent PID:

 ps -o pid,ppid,cmd -p 578
    PID    PPID CMD
    578     308 python3 -m http.server

ps -ef  --> cherubim     578     308  0 01:47 pts/0    00:00:00 python3 -m http.server


CPU usage:

cherubim     578  CPU ->0.0  0.0  24940 17520 pts/0    S+   01:47   0:00 python3 -m http.server

Wo liegt er im Baum:

Befehl:

ps -ef --forest

root           1       0  0 01:46 ?        00:00:00 /sbin/init
root           2       1  0 01:46 ?        00:00:00 /init
root           7       2  0 01:46 ?        00:00:00  \_ plan9 --control-socket 7 --log-level 4 --server-fd 8 --pipe-fd 1
root         306       2  0 01:46 ?        00:00:00  \_ /init
root         307     306  0 01:46 ?        00:00:00  |   \_ /init
cherubim     308     307  0 01:46 pts/0    00:00:00  |       \_ -bash
cherubim     578     308  0 01:47 pts/0    00:00:00  |           \_ python3 -m http.server

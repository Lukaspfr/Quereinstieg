Datei- vs Verzeichnisrechte: Bedeutung von r/w/x bei Verzeichnissen?


Permissions für die Rechte in Verzeichnissen:
r=read
w= write
x=executable

umask: was ist das und warum kommen Defaults wie 644/755 zustande?
umask ist eigentlich eine Maske die auf die Berechtigungen der erstellten Dateien und verzeichnisse aufgetragen wird. 
Verzeichnisse werden standartmässig mit Permission 777 initialisiert. umask ist standartmässig 022. Somit: 777 - 022 = 755
Dateien werden standartmässig mit 666 initialisiert. 666-022 = 644

Wie baust du einen Team-Ordner mit Gruppenrechten & setgid?

 sudo mkdir -p /srv/shared
sudo chown root:group /srv/shared
 sudo chmod 2770 /srv/shared
 ls -ld /srv/shared


“command not found”: deine Checkliste (mind. 5 Punkte).

1)Tippo / Groß-Klein / richtige Schreibweise

command -v <cmd> || echo "nicht gefunden"

2) Ist es ein Pfad-Problem? (direkt per Pfad ausführen)

./<cmd>
~/bin/<cmd>
/usr/local/bin/<cmd>
Wenn per Pfad läuft → PATH/Lookup Problem.

3)Ist der Ordner im PATH?

echo "$PATH" | tr ':' '\n'

 Check: steht z.B. $HOME/bin drin?

4) Findet die Shell überhaupt etwas? (besser als which)

command -v <cmd>
type -a <cmd>

Alias/Function/Binary sichtbar machen.

5) Existiert die Datei wirklich dort, wo du denkst?

ls -l /pfad/zum/cmd

6) Ist sie ausführbar (x-bit)?

ls -l /pfad/zum/cmd   # hat es ein x?
chmod +x /pfad/zum/cmd

7) Hat sie einen gültigen Interpreter / Shebang?

head -n 1 /pfad/zum/cmd

#!/usr/bin/env bash oder #!/bin/bash etc.

8) Windows/CRLF Problem (häufig in WSL/Git)
Wenn du z.B. bad interpreter: /usr/bin/env^M siehst:

file /pfad/zum/cmd
dos2unix /pfad/zum/cmd   # falls vorhanden
# oder:
sed -i 's/\r$//' /pfad/zum/cmd

9) Shell-Config nicht geladen / falsche Shell

PATH in ~/.bashrc vs ~/.zshrc?

echo "$SHELL"

Dann ggf.:

source ~/.bashrc
source ~/.zshrc

10) Shell-Cache/Hash (seltener, aber real)
Wenn du gerade was installiert/verschoben hast:

hash -r

Hardlink vs Symlink: Unterschiede + typische Use-Cases.

Hardlink erstellt einen neuen Namen der Datei. wie eine zweite Tür zum gleichen Haus. Wenn man alle hardlinks und originalnamen löscht und die Datei nicht mehr verwendet wird, dann wird sie gelöscht. Hardlinks haben denselben inode, softlinks nicht. Softlinks sind eigentlich nur ein Verweis auf eine Datei.



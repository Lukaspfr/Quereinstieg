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

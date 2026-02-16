Was ist der unterschied zwischen den Verzeichnissen / und ~?

Das / ist das Rootverzeichnis. In im liegt das Linuxsystem selbst und unter den Usern hat der Root die höchste mögliche Berechtigung.
Das ~ ist das Homeverzeichnis. In dem Verzeichnis liegt das Userprofil des momentanen Benutzers.

Warum ist find besser als grep?

Man hat mehr Möglichkeiten, grep ist ein simpler "findstr" während find kann es genauer spezifizieren was man sucht.
Zum beispiel: mit -iname 'Wasichsuche' kann ich nach etwas im namen suchen aber case insensitive, ich kann eine maxdepth eingeben und somit eine Ordnerstruktur nur bis zu einer 
gewissen Tiefe durchsuchen usw. Es hat einfach mehr Möglichkeiten.

Woran erkennst du Hardlink vs Symlink?

Mit ls -li ( das i ist am wichtigsten) kann man sich das long listing (-l) und die inode nummer (-i) anzeigen lassen.
Ein Hardlink besitzt das selbe inode. Es ist sozusagen ein zweiter name für dieselbe Datei. Wenn alle Hardlinks gelöscht sind und die Datei nicht mehr benutzt wird, dann wird sie gelöscht.
Ein softlink zeigt einfach nur auf die Datei und hat ein eigenes Inode. Der Softlink enthält sozusagen einen Pfad zu einer Datei.



Warum ist chmod 600 gut für Secrets?

Die zahl 600 zeigt, das ausser dem root alle anderen keine zugriffsrechte auf die Datei haben. Sie haben weder lese, schreibe noch Ausführrechte.

Was bewirkt chmod 2770 dir?

Das 2 steht für setgid ( Set group ID).
setgid auf einem Ordner bedeutet

Neue Dateien/Unterordner erben die Gruppe des Ordners
Statt die Primary Group des Users zu nehmen, wird die Group des Verzeichnisses gesetzt.

Neue Unterordner bekommen setgid ebenfalls
Dadurch bleibt die Gruppen-Vererbung “sticky” für die ganze Struktur.

Das gibt man also einer gruppendirectory.

Die 770 Stehen für: rwxrwx--- Permissions 

Warum reicht “read” bei Verzeichnissen nicht?

Ordner muss man durchsuchen können und davür brauchen sie execute --> x.

“command not found”: Debug in 5 Schritten?

~/bin/*command* --> wenn ausführt nicht im Path, sonst nicht executable
wenn nicht executable:
chmod +x ~/bin/*command*
wiederholen...

wenn nicht im Path:
 export PATH="$HOME/bin:$PATH"


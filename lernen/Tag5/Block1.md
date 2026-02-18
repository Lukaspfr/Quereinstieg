Unterschied > vs >>?


>: Hierbei wird ein Output in ein file umgeleitet. Steht in der Datei bereits etwas, so wird es überschrieben.

>>: leitet den output ebenfalls in ein File um, doch überschreibt die Daten im File nicht sondern hängt sie hinten an (append).


Wie leitest du nur stderr um?

Der stderr kommt über fd2 (File Descriptor2) um ihn auf fd1 umzuleiten benötigt man den Befehl: 2>&1. Dies funktioniert natürlich auch in die andere Richtung.

Warum ist pgrep -a oft besser als ps | grep?

pgrep wurde für diesen Jop gebaut (Prozesse suchen), darum hat er gewisse Vorteilewie: 

Kein „grep findet sich selbst“-Problem
Direkte PID-Ausgabe (maschinenfreundlich)
-a zeigt direkt die komplette Kommandozeile



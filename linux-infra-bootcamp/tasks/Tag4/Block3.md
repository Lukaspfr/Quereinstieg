Unterschied which vs type?

which sucht im PATH nach dem ausführbaren Programm das man danach schreibt. Es sieht typischerweise nur echte executables im Path und nicht zuverlässig Aliases/Shell-Builtins/Functions (je nach System/which-Version).
type hingegen sagt dir was das genau ist was du dahinter schreibst ( nahmen der anwendung oder der Datei)... Ist es ein Alias? Function? binary

type erkennt alias functions.

Warum ist PATH-Reihenfolge kritisch?

Die PATH Reihenfolge ist kritisch, da wenn man verschiedene Skribte mit dem gleichen Namen besitzt, dann wird das ausgelöst, das zuerst im PATH vermerkt ist.

Nenne 3 Checks für “läuft der Dienst?” ohne systemctl.

Wenn ich kein systemctl verwenden darf, dann würde ich ps aux verwenden und es mit grep durchsuchen. Falls der dienst einen Socket verwendet ( einen Port hat) dann kann ich schauen ob der Port auf Listen() geschaltet ist mit ss -tulnp. Mit htop könnte ich auch alle aktiven Prozesse nach dem dienst durchsuchen. pgrep kann man auch noch verwenden um Prozesse zu durchsuchen.



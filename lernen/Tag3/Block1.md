Was ist ein Prozess?

Definition:

Ein Prozess ist die Ausführung eines Programmes mit einer bestimmten Eingabe auf einer konkreten Rechenanlage mit einem konkreten Betriebssystem und liefert eine Ausgabe auf Basis der 
Eingabe und des Programmes.

Ein Prozess besteht aus mindestens einem Thread.
Ein Prozess kann eine priorität besitzen.

Thread

Definition:

Eigenständig ablaufende Teile eines Prozesses die unabhängig von anderen Prozessteilen ausgeführt werden.

Alle Threads in einem Prozess teilen sich denselben Prozesadressraum. Wie Prozesse können auch Threads eine Priorität besitzen.

bei einem Prozessor mit mehreren Kernen können Threads echt-parallel Arbeiten. Sonnst wird durch schnelles wechseln der Threads im Prozessorcore ein schein von Parallelität erzeugt. 

Was ist der Unterscheid zwischen Prozessen und Threads?

Prozesse verfügen über einen eigenen SPeicherbereich, während alle Threads eines Prozesses sich den Speicherbereich des Prozesses teilen. Somit werden prozesse in einen oder mehrere 
Threads aufgeteilt.
Threads werden auch leichtgewichtige Prozesse genannt, da sie weit weniger kontextinformationen besitzen. 
Threads werden gescheduled, das heisst einzelne Threads werden eines Prozesses werden der CPU zugewiesen und diese arbeitet dann die Aufgaben in den Threads ap.
Jeder Thread hat einen separaten User- und Kernel-Mode-Stack.
Threads haben einen eigenen Stack. 


Warum werden Prozesse in Threads unterteilt?

Threads sind die ausführbaren Teile in einem Prozess und durch sie kann man Parallelisierung möglich machen.
Es macht das Shared Memory Programmiermodel möglich.
threads eines Prozesses teilen sich einen gemeinsamen Adressraum und können darum Daten einfach gemeinsam nutzen.
Es macht eine einfache Programmstruktur möglich und da Threads leichter sind als Prozesse, sind Kontextwechsel leichter zu realisieren.
Man kann jedem Thread individuell eine bestimmte Rechenzeit zuteilen.

Was ist PID?:

PID steht für Prozess ID, es ist eine ID mit der der Betriebssystem die Prozesse unterscheiden kann.
Dies dient dazu:
- Prozesse zu unterscheiden
- Speicher zuzuordnen
- CPU zeit zu verwalten
- Prozesse zu beenden

Es dient auch noch zur Kommunikation zwischen Prozessen. Ein Prozess kann damit einen anderen Prozess ansprechen.

Jeder Prozess hat zusätzlich noch eine PPID. Dies steht für Parent Process ID.

Ich nenne ein beispiel:
Das Terminal startet einen Prozess, das gestartete Programm ist der Kindprozess, das Terminal ist der Parent Process.

Threads teilen sich die PID ihres Prozesses.

Definition PID:

Eine PID ist eine vom Betriebssystem vergebene eindeutige Identifikationsnummer zur Verwaltung und Steuerung eines Prozesses.


Was bedeutet „Parent Process“?

Wie bereits oben beschrieben, beschreibt ein Parent Process einen Prozess, der einen anderen Prozess startet. Der gestartete ist dann der Child Process.

Was passiert beim Start eines Programmes technisch?

Das System reagiert auf den Startbefehl des Programmes mit einem Systemcall. Dieser Startet das Programm / erzeugt einen neuen Prozess.

Beim erzeugen des neuen Prozesses, reserviert das Betriebsystem eine neue PID und legt einen Prozesskontrollblock an. Dieser enthält infos wie:

- PID

- Registerzustand

- Speicherverwaltung

- offene Dateien

- Scheduling-Informationen

Oft passiert vorher ein fork():

- fork() erzeugt eine Kopie des Elternprozesses

- exec() ersetzt dann dessen Speicher durch das neue Programm

Nun wird ein Adressbaum erstellt:

Typische Speicheraufteilung:

| Stack        |  (wächst nach unten)
|              |
| Heap         |  (wächst nach oben)
|--------------|
| BSS Segment  |
| Data Segment |
| Text Segment |  (Maschinencode)

Dabei wird:

- Code (Text-Segment) aus der Datei geladen

- Initialisierte globale Variablen geladen

- Nicht-initialisierte Variablen (BSS) mit 0 gefüllt

- Stack für den Hauptthread angelegt

- Heap vorbereitet

Moderne Systeme verwenden Demand Paging:
Der Code wird oft erst wirklich geladen, wenn er gebraucht wird.

Danach wird die Programmdatei geladen mit einem sogenannten Loader.

Der Loader:

- liest die ausführbare Datei (z. B. ELF unter Linux)

- prüft das Format

- lädt benötigte Shared Libraries (z. B. libc)

- führt ggf. Relokationen durch (Adressanpassungen)

Nun wird der CPU-Kontext vorbereited:

Der Kernel:

- setzt den Instruction Pointer auf den Programmeinstiegspunkt (_start)

- initialisiert Register

- setzt Stackpointer

- legt Argumente (argc, argv) auf den Stack

Nun geschieht der Übergang in den User-Mode

Jetzt passiert der wichtige Schritt:

Der Scheduler wählt den Prozess aus →
Kontextwechsel →
CPU springt in den User Mode →
Ausführung beginnt bei _start.

Von dort wird später main() aufgerufen.

jetzt übernimmt der Scheduler.

Der Prozess ist nun:

- im Zustand „ready“

- bekommt CPU-Zeit zugeteilt

- läuft parallel zu anderen Prozessen


Kurzdefinition:

Beim Start eines Programms erzeugt das Betriebssystem einen neuen Prozess, richtet einen virtuellen Adressraum ein, lädt das Programm in den Speicher, initialisiert CPU-Kontext und Stack
 und übergibt anschließend die Kontrolle an den Scheduler.


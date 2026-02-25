Der grösste unterschied zwischen PowerShell und Bash liegt in der Pipeline --> befehl 1 | befehl 2

Während Linux in Bash einfach nur Text weitergibt fliessen in Windows PowerShell Objekte.

Dies ist jedoch nur der Fall wenn:



Cmdlet | Cmdlet --> Objekte fließen



Cmdlet | native.exe --> PowerShell serialisiert zu Text, damit native.exe es versteht



Somit funktioniert zwar auch findstr, doch da dieses native in Windows ist, wandelt es die Objekte via der ToString()

Methode in Text um, um es verwertbar zu machen.






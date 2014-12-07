#lang racket

#| kopfstück: Die Funktion ist linear rekursiv, weil die Funktionsdefinition in jeder Fallunterscheidung auf 
 der rechten Seite der definierenden Gleichung selbst nur einmal  verwendet wird. Denmach ist die Funktion
 auch nicht baumrekursiv (erfordert Mehrfacherverwendung der Funktionsdef. in der selben Fallunterscheidung). Es handelt
 sich um direkte Rekursion, da sich bei indirekter Rekursion zwei Funktionsdefintionen gegenseitig aufrufen 
(siehe odd-even-Bsp Skript). Die Funktion ist nicht endrekursiv, weil das Ergebnis noch mit einem anderen 
 Term verknüpft werden muss (außerdem auch kein Akku). Es ist auch keine geschachtelte Rekursion, da die Funktion
 selbst nicht als Argument bei der rekursiven Verwendung benutzt wird.

 endstück: Die Funktion ist linear rekursiv, weil die Funktionsdefinition in jeder Fallunterscheidung auf 
 der rechten Seite der definierenden Gleichung selbst nur einmal  verwendet wird. Denmach ist die Funktion
 auch nicht baumrekursiv (erfordert Mehrfacherverwendung der Funktionsdef. in der selben Fallunterscheidung).
 Es handelt sich um direkte Rekursion, da sich bei indirekter Rekursion zwei Funktionsdefintionen gegenseitig
 aufrufen (siehe odd-even-Bsp Skript). Es ist auch keine geschachtelte Rekursion, da die Funktion
 selbst nicht als Argument bei der rekursiven Verwendung benutzt wird. Die Funktion ist endrekursiv, weil das Ergebnis
 nicht mit einem anderen Term verknüpft werden muss (außerdem Akku vorhanden).

 merge: Funktion ist baumrekursiv also im Umkehrschluss nicht linear rekursiv, weil in der Fallunterscheidung die 
 Definitionsfunktion mehrfach verwendet wird. Es handelt sich um direkte Rekursion, da sich bei indirekter Rekursion
 zwei Funktionsdefintionen gegenseitig aufrufen (siehe odd-even-Bsp Skript). Es ist auch keine geschachtelte Rekursion,
 da die Funktion selbst nicht als Argument bei der rekursiven Verwendung benutzt wird. Die Funktion ist nicht endrekursiv,
 weil das Ergebnis noch mit einem anderen Term verknüpft werden muss (außerdem auch kein Akku).

 merge-sort: Funktion ist baumrekursiv also im Umkehrschluss nicht linear rekursiv, weil in der Fallunterscheidung die 
 Definitionsfunktion mehrfach verwendet wird. Es handelt sich um direkte Rekursion, da sich bei indirekter Rekursion 
 zwei Funktionsdefintionen gegenseitig aufrufen und das, obwohl merge-sort merge aufruft, weil merge nicht merge-sort aufruft.
 Es ist auch keine geschachtelte Rekursion, da die Funktion selbst nicht als Argument bei der rekursiven Verwendung benutzt wird.
 Die Funktion wird lediglich merge als Argument übergeben. Die Funktion ist nicht endrekursiv, weil das Ergebnis durch den Aufruf
 von merge noch mit einem anderen Term verknüpft werden muss.
|#
#lang racket

#| Aufgabe 1.1
Eine Funktion ist eine Funktion höherer Ordnung, wenn sie Funktionen als Argumente erhält
oder Funktionen als Wert zurückgibt.
  
 Aufgabe 1.2
a) Foldl ist eine Funtkion höherer Ordnung, da sie einen Operator (Funktion) als Argument
erhält.
b) Ist eine Funktion höherer Ordnung, da sie eine Funktion (car oder cdr) zurückgibt.
c) Ist eine Funktion höherer Ordnung, da sie eine Funktion (f) als Argument erhält.
d) Ist keine Funktion höherer Ordnung, da sie weder eine Funktion als Argument erhält,
noch eine Funktion als Wert zurückliefert.

Aufgabe 1.3
Die Variable f wird beim Funktionsaufruf an den Operator (Funktion) * gebunden sowie
die Variable arg1 an 5. Hierbei handelt es sich um lokale Variablen genau wie bei der durch
let eingeführten Variable arg2. Diese Variablen sind also nur in der lokalen Umgebung sichtbar und
referenzierbar. Die beim Funktionsaufruf und beim let-Aufruf entstanden Bindungen spielen alle für
die Auswertung des Ausdrucks (* 5 7) eine Rolle.

Aufgabe 1.4
( foldl ( curry * 2) 1 '(1 1 2 3)) evaluiert zu 96. Die Funktion (curry * 2) wird auf die Liste angewendet
und die Liste '(2 2 4 6) entsteht. Die entstandene Liste wird mit foldl der Multiplikation und dem Startwert 1
zu 96 evaluiert (* 1 2 2 4 6).

( map cons '(1 2 3 4) '(1 2 3 4)) evaluiert zu '((1 . 1) (2 . 2) (3 . 3) (4 . 4)). Map wendet die Funktion cons auf
jedes Element der ersten und zweiten Liste paarweise an und gibt als Resultat eine Liste der abgebildeten Werte zurück.

( filter pair? '( ( a b ) ( ) 1 ( ( ) ) ) ) evaluiert zu '((a b) (())). Es werden aus der angegebenen Liste alle
Elemente herausgefiltert bei denen das Prädikat pair? true liefert also bei allen Paaren. '(a b) ist offensichtlich
ein paar aber auch die Liste die eine leer Liste und die Restliste enthält '(()).

( map ( compose ( curry + 33) ( curry * 1.8 ) )
'(5505 100 0 1 1000 -273.15 ) ) evaluiert zu '(9942.0 213.0 33 34.8 1833.0 -458.66999999999996). Es wird durch die
Anwendung von map die Funktionskomposition der beiden curry-Funktionen auf jedes einzelne Listenelement angewendet
und die dadurch entstandene Liste zurückgegeben. Es wird bei Anwendung der Komposition erst die letzte Teilfunktion
der Kompisition (curry * 1.8) angewendet und auf das Ergebnis dann die erste Teilfunktion (curry + 33).


|#





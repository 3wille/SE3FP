#lang racket

;; Aufgabe 1

#| 
1.(max (min 2 (- 2 5)) 0) evaluiert zu 0, weil das Minimum von 2 und (2 - 5) -3 ergibt
und das Maximum von -3 und 0 wiederum 0 ist
2.'(+ (- 2 13) 11) evaluiert zu '(+ (- 2 13) 11), weil ' (quote) die Evaluierung blockiert
3.(cadr '(Alle Jahre wieder)) evaluiert zu 'Jahre, weil cadr das erste Element der Restliste einer Liste bestimmt
4.(cddr '(kommt (das Weihnachtfest))) evaluiert zu '(), weil cddr die Restliste der Restliste bestimmt und die 
Restliste der ursprünglichen Liste aus nur einem Element bestimmt und die Restliste einer ein-elementigen Liste 
die leere Liste ist
5.(cdadr '(kommt (das . Weihnachtfest))) evaluiert zu 'Weihnachtfest, weil erst cdr auf die Liste angewendet wird
was zu '((das . Weihnachtfest)) evaluiert also zu der Liste, die als erstes Element das Paar (das . Weihnachtfest) 
enthält sowie als zweites Element die leere Liste. Wenn dann car auf diese Liste angewendet wird bekommt man
(das . Weihnachtfest) und durch anschließendes cdr das zweite Element dieser Liste also 'Weihnachtsfest.
6.(cons 'Listen '(ganz einfach und)) evaluiert zu '(Listen ganz einfach und), weil Paare deren zweites Element eine
Liste ist, in der vereinfachten Listennotaion dargestellt werden und durch Anwendung von cons ensteht ja ein Paar.
7.(cons 'Paare 'auch) evaluiert zu '(Paare . auch). Cons fügt am Anfang einer Liste ein Element an. Der dot-Operator
 ist eine Infix-Operation für den cons-Operator.
8.(equal? (list 'Racket 'Prolog 'Java) '(Racket Prolog Java)) evaluiert zu #t (true), weil die durch list erzeugte
Liste '(Racket Prolog Java) und die durch die Angabe der einzelnen Element in Klammern mit dem quote erzeugte Liste
die gleichen Elemente enthalten (bzw. die Elemente den gleichen Wert haben), also eqv? auf diese Listen angewendet true 
liefern würde.
9.(eq? (list 'Racket 'Prolog 'Java) (cons 'Racket '(Prolog Java))) evaluiert zu #f (false), da eq? testet ob es sich
bei beiden Argumenten um identische Objekte handelt, was bei diesen beiden Listen nicht der Fall ist. equal? oder eqv?
hätten bei diesen beiden Listen true geliefert, weil diese Listen die gleichen Elemente enthalten bzw. die Elemente 
den gleichen Wert haben.

|#

;; Aufgabe 2
;; Aufgabe 2.1 Grammatik Backus-Naur Form
#|
Notmeldung     := <Übersschrift> 
                  <Standortangabe> 
                  <Notfallart> 
                  <Hilfeleistung> 
                  <Peilzeichen>
                  <Unterschrift>
                  <Ende>
Überschrift    := MAYDAY MAYDAY MAYDAY
                  HIER IST
                  <Schiffsname> <Schiffsname> <Schiffsname>
                  DELTA ECHO
                  <Rufzeichen>
                  MAYDAY
                  <Schiffsname>
                  ICH BUCHSTABIERE
                  <Schiffsnamebuchstabiert>
                  RUFZEICHEN
                  <Rufzeichenbuchstabiert>
Schiffsname    := text
Rufzeichen     := text
Schiffsnamebuchstabiert := text
Rufzeichenbuchstabiert  := text
Notfallart     := text
Hilfeleistung  := text
Peilzeichen    := - - -
Unterschrift   := <Schiffsname> <Rufzeichenbuchstabiert>
Ende           := OVER
|#
;; Aufgabe 2.2 Generator
(define (Notruf schiffsnamen rufzeichen position notfallart)
  (append (überschrift) 
          (standortangabe) 
          (artdesnotfalls) 
          (angabenzurhilfeleistung) 
          (peilzeichen) 
          (unterschrift) 
          (ende)
  ))

;; Aufgabe 2.3 Test



;;Aufgabe 3
( define ( hoch3 x ) (* x x x ) )

( hoch3 ( * 3 (+ 1 ( hoch3 2 ) ) ) )

;;Innere
;(hoch3 ( * 3 (+ 1 ( * 2 2 2 ) ) ) )
;(hoch3 ( * 3 (+ 1 8 ) ) )
;(hoch3 ( * 3 9 ) )
;(hoch3 21 )
;(* 27 27 27)
;19683

;;Äußere
;(hoch3 ( * 3 (+ 1 ( hoch3 2 ) ) ) )
;(* ( * 3 (+ 1 ( hoch3 2 ) ) ) ( * 3 (+ 1 ( hoch3 2 ) ) ) ( * 3 (+ 1 ( hoch3 2 ) ) ))
;(* ( * 3 (+ 1 ( * 2 2 2 ) ) ) ( * 3 (+ 1 ( hoch3 2 ) ) ) ( * 3 (+ 1 ( hoch3 2 ) ) ))
;(* ( * 3 (+ 1 8 ) ) ( * 3 (+ 1 ( hoch3 2 ) ) ) ( * 3 (+ 1 ( hoch3 2 ) ) ))
;(* ( * 3 9 ) ( * 3 (+ 1 ( hoch3 2 ) ) ) ( * 3 (+ 1 ( hoch3 2 ) ) ))
;(* 27 ( * 3 (+ 1 ( hoch3 2 ) ) ) ( * 3 (+ 1 ( hoch3 2 ) ) ))
;(* 27 ( * 3 (+ 1 8 ) ) ( * 3 (+ 1 ( hoch3 2 ) ) ))
;(* 27 ( * 3 9 ) ( * 3 (+ 1 ( hoch3 2 ) ) ))
;(* 27 27 ( * 3 (+ 1 ( hoch3 2 ) ) ))
;(* 27 27 ( * 3 (+ 1 ( * 2 2 2 ) ) ))
;(* 27 27 ( * 3 (+ 1 8 ) ))
;(* 27 27 ( * 3 9 ))
;(* 27 27 27)
;(19683)

;Reduktionsstrategie:
;Funktionen:
;innere Reduktion
;Spezialformen:
;äußere Reduktion

( define ( new−if condition? then−clause else−clause )
   ( cond ( condition? then−clause )
          ( else else−clause ) ) )

( define ( faculty product counter max−count )
   ( new−if (> counter max−count )
            product
            ( faculty (* counter product )
                      (+ counter 1 )
                      max−count ) ) )
;Das Programm läuft in eine Endlosschleife.
;Die äußere Reduktion ist hier nötig, damit zuerst die If Funktion aufgelöst wird, bevor die darin enthaltenen Blöcke ausgeführt werden.
;In dem Beispiel wird versucht zuerst den Else-Zweig zu evaluieren. Dies führt zu der Endlosschleife, da nie die Abbruchbedingung ausgeführt wird.
